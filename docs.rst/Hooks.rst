.. _hooks:

Hooks
=====

Since v3.5.0, EasyBuild supports *hooks* that can be used
to customise the behaviour of EasyBuild according to site policies if needed,
without having to change the EasyBuild framework or the existing easyblocks.

.. contents::
    :depth: 3
    :backlinks: none

.. _hooks_what:

What are hooks?
---------------

*Hooks* are user-defined functions that are called by the EasyBuild framework at specific times during
the installation procedure. They can be leveraged to alter or augment the installation procedure.

This is usually done to conform with site-specific policies that are difficult to enforce otherwise,
but it can also be (ab)used to fix specific problems or inject self-implemented enhancements
(before you flesh them out in a proper contribution, for example).

Both the ``EasyBlock`` instance and the parsed easyconfig file that are being used
are fully accessible (and modifiable) from within hook implementations. Hence, this mechanism
provides a lot of flexibility to change the EasyBuild functionality should you require it,
without having to modify the codebase of EasyBuild itself.


.. _hooks_configuration:

Configuring EasyBuild to use your hook implementations
------------------------------------------------------

To instruct EasyBuild to use your hook implementations,
you only need to specify the location of the Python module (``*.py``) that implements them.

This is done via the ``--hooks`` configuration option
(or equivalently via the ``$EASYBUILD_HOOKS`` environment variable, or via ``hooks = ...``
in an EasyBuild configuration file, see also :ref:`configuring_easybuild`).

For example::

    eb --hooks=$HOME/my_eb_hooks.py ...

or::

    export EASYBUILD_HOOKS=$HOME/my_eb_hooks.py
    eb ...


.. _hooks_available:

Available hooks
---------------

Currently (since EasyBuild v3.7.0), three types of hooks are supported:

* ``start_hook`` and ``end_hook``, which are triggered *once* before starting software installations,
  and *once* right after completing all installations, respectfully;
* ``parse_hook``, which is triggered when an easyconfig file is being parsed;
* "*step*" hooks that are triggered before and after every step of each installation procedure that is performed,
  also aptly named '``pre``'- and '``post``'-hooks

The list of currently available hooks in order of exeuction,
which can also be consulted using ``eb --avail-hooks``, is:

    * ``start_hook`` *(only called once in an EasyBuild session)*
    * ``parse_hook`` *(available since EasyBuild v3.7.0)*
    * ``pre_fetch_hook``, ``post_fetch_hook``
    * ``pre_ready_hook``, ``post_ready_hook``
    * ``pre_source_hook``, ``post_source_hook``
    * ``pre_patch_hook``, ``post_patch_hook``
    * ``pre_prepare_hook``, ``post_prepare_hook``
    * ``pre_configure_hook``, ``post_configure_hook``
    * ``pre_build_hook``, ``post_build_hook``
    * ``pre_test_hook``, ``post_test_hook``
    * ``pre_install_hook``, ``post_install_hook``
    * ``pre_extensions_hook``, ``post_extensions_hook``
    * ``pre_postproc_hook``, ``post_postproc_hook``
    * ``pre_sanitycheck_hook``, ``post_sanitycheck_hook``
    * ``pre_cleanup_hook``, ``post_cleanup_hook``
    * ``pre_module_hook``, ``post_module_hook``
    * ``pre_permissions_hook``, ``post_permissions_hook``
    * ``pre_package_hook``, ``post_package_hook``
    * ``pre_testcases_hook``, ``post_testcases_hook``
    * ``end_hook`` *(only called once in an EasyBuild session)*

All functions implemented in the provided Python module for which the name ends with ``_hook`` are considered.

If any ``*_hook`` functions are encountered that do not match with any of the available hooks, an error is reported.
EasyBuild will try to provide suggestions for available hooks that closely match with the encountered unknown hook.

For example::

    $ eb --hooks wrong_hooks.py example.eb
    == temporary log file in case of crash /tmp/eb-nMawy1/easybuild-Gu2ZP6.log
    ERROR: Found one or more unknown hooks:
    * stat_hook (did you mean 'start_hook'?)
    * this_is_not_a_hook
    * install_hook (did you mean 'pre_install_hook', or 'post_install_hook'?)

    Run 'eb --avail-hooks' to get an overview of known hooks

.. _hooks_implementation:

Implementing hooks
------------------

To implement hooks, simply define one or more functions in a Python module (``*.py``),
each named after an available hook.

Do take into account the following:

* for ``start_hook`` and ``end_hook``, no arguments are provided

* for ``parse_hook``, one argument is provided: the ``EasyConfig`` instance
  that corresponds to the easyconfig file being parsed (usually referred to as ``ec``)

* for the step hooks, one argument is provided:
  the ``EasyBlock`` instance used to perform the installation (usually referred to as ``self``)

* the parsed easyconfig file can be accessed in the step hooks via the ``EasyBlock`` instance,
  i.e., via ``self.cfg``

It is recommended to anticipate possible changes in the provided (named) arguments,
using the ``*args`` and ``**kwargs`` mechanism commonly used in Python. This
avoids that your hook implementations may break when updating to future EasyBuild versions. For example::

  # example pre-configure hook that anticipates changes in provided arguments
  def pre_configure_hook(self, *args, **kwargs):
      ...

In hooks, you have access to the full functionality provided by the EasyBuild framework,
so do ``import`` from ``easybuild.tools.*`` (or other ``easybuild.*`` namespaces) to leverage
those functions.

.. _hooks_parse_hook:

Parse hook specifics
++++++++++++++++++++

``parse_hook`` is triggered right *after* reading the easyconfig file,
before further parsing of some easyconfig parameters (like ``*dependencies``) into
custom data structures is done.

This is important since it allows to dynamically modify easyconfig files
while they are still "raw", i.e., when the easyconfig parameter values are
still basic Python data structures like lists, dictionaries, etc.
that are easy to manipulate (see also :ref:`hooks_caveats_manipulating`).

In ``parse_hook`` easyconfig parameters can be accessed and/or modified in a straightforward way,
see :ref:`hooks_examples_inject_patch`.


.. _hooks_caveats:

Caveats
-------

Due to internal details of the EasyBuild framework, you may run into some surprises when
implementing hooks. Here are some things to take into account:

.. _hooks_caveats_template_values:

Resolving of template values
++++++++++++++++++++++++++++

In all *step* hooks, template values in easyconfig parameters will be resolved whenever they are accessed.

That is, if the ``%(version)`` template is used in for example the ``sources`` easyconfig parameter,
it will be replaced with the actual value of the ``version`` easyconfig parameter whenever the
``sources`` value is used.
This can be avoided by temporarily disabling templating via ``self.cfg.enable_templating``, should the need arise.

There is one notable exception to this: templates in easyconfig parameters are *not* resolved in ``parse_hook``,
because templating has been disabled explicitly before ``parse_hook`` is called;
this helps significantly to simplify manipulating of easyconfig parameter values
(see also :ref:`hooks_caveats_manipulating`).


.. _hooks_caveats_manipulating:

Manipulating easyconfig parameters
++++++++++++++++++++++++++++++++++

You may run into surprises when trying to manipulate easyconfig parameters, for various reasons.

First of all, the original easyconfig parameters may already be processed in another data structure
which does not resemble the original format in which the parameter was defined in the easyconfig file.

Moreover, this processing could be done either "in place", i.e. by replacing the original easyconfig parameter value,
or in a separate variable, which effectively means that any changes to the original easyconfig parameter value
are simply ignored.

In addition, because of how the templating mechanism for easyconfig parameter works,
changes to easyconfig parameters with non-string values (i.e. lists, dictionaries, etc.) will go up
in smoke if not done correctly.

More specifically, the following approach will *not* work in any of the (step) hooks, except for ``parse_hook``:

.. code:: python

    def pre_fetch_hook(self):
        "Example of pre-fetch hook to manipulate list of patches."
        # this does NOT have the intended affect in any pre- or post-step hook
        self.cfg['patches'].append('example.patch')

The problem here is that the value obtained via ``self.cfg['patches']`` is not a reference
to the actual easyconfig parameter value, but a reference to a temporary copy thereof;
hence, any updates on the copy are effectively lost immediately.

To achieve the intended effect, you can either:

* temporarily disable the templating mechanism:

  .. code:: python

    def pre_fetch_hook(self):
        "Example of pre-fetch hook to manipulate list of patches."
        # temporarily disable templating, so changes to 'patches' easyconfig parameter are picked up
        orig_enable_templating = self.cfg.enable_templating
        self.cfg.enable_templating = False
        # add patch
        self.cfg['patches'].append('example.patch')
        # restore templating state
        self.cfg.enable_templating = orig_enable_templating

* or replace the original value entirely:

  .. code:: python

    def pre_fetch_hook(self):
        "Example of pre-fetch hook to manipulate list of patches."
        self.cfg['patches'] = self.cfg['patches'] + ['example.patch']


A better approach for manipulating easyconfig parameters is to use the ``parse_hook`` that
was introduced in EasyBuild v3.7.0 (see :ref:`hooks_parse_hook`),
where these kind of surprises will not occur (because templating is automatically disabled
before ``parse_hook`` is called, and restored immediately afterwards).
See also :ref:`hooks_examples_inject_patch`.

.. _hooks_caveats_archived_easyconfig:

Archived easyconfig file vs hooks
+++++++++++++++++++++++++++++++++

EasyBuild archives the easyconfig file that was used for a particular installation:
a copy is stored both in the ``easybuild`` subdirectory of the software installation
directory and in the easyconfigs repository (see :ref:`easyconfigs_repo`).

If any changes were made to the easyconfig file via hooks, these changes will *not* be
reflected in these copies. The assumption here is that the hooks will also be in place
for future (re-)installations.

EasyBuild does however store an additional copy of the easyconfig file which includes
any modifications that were done dynamically, for example by hooks.
If subtoolchains were used to resolve dependencies, they will also be hardwired in this copy.

This "*reproducible easyconfig*" is stored in the ``easybuild/reprod`` subdirectory
of the software installation directory.


.. _hooks_examples:

Examples of hook implementations
--------------------------------

.. _hooks_examples_openmpi_configopts:

Example hook to replace ``--with-verbs`` with ``--without-verbs`` in OpenMPI configure options
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. code:: python

    def pre_configure_hook(self, *args, **kwargs):
        """Example pre-configure hook to replace --with-verbs with --without -verbs for OpenMPI."""
        if self.name == 'OpenMPI' and '--with-verbs' in self.cfg['configopts']:
            self.log.info("[pre-configure hook] Replacing --with-verbs with --without-verbs")
            self.cfg['configopts'] = self.cfg['configopts'].replace('--with-verbs', '--without-verbs')

.. _hooks_examples_inject_patch:

Example hook to inject a custom patch file
++++++++++++++++++++++++++++++++++++++++++

.. code:: python

    def parse_hook(ec, *args, **kwargs):
        """Example parse hook to inject a patch file for a fictive software package named 'Example'."""
        if ec.name == 'Example':
            patch_file = 'example.patch'
            ec.log.info("[parse hook] Injecting additional patch file '%s'", patch_file)
            ec['patches'].append(patch_file)
