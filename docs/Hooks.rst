.. _hooks:

Hooks
=====

Since EasyBuild v3.5.0, support is available for implementing *hooks* that can be used
to customise the behaviour of EasyBuild according to site policies if needed,
without having having to change the EasyBuild framework or the existing easyblocks.

.. contents::
    :depth: 3
    :backlinks: none

.. _hooks_what:

What are hooks?
---------------

*Hooks* are user-defined functions that are called by the EasyBuild framework at specific times during
the installation procedure that is performed for each software package being installed.

They can be leveraged to alter or augment the installation procedure in a particular way.
This is usually done to conform with site-specific policies that are difficult to enforce otherwise,
but it can also be (ab)used to fix specific problems or inject self-implemented enhancements
(before you flesh them out in a proper contribution, for example).

Both the ``EasyBlock`` instance and the parsed easyconfig file that are being used
are fully accessible (and modifiable) from within hook implementations, Hence, this mechanism
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

Currently, two types of hooks are supported:

* ``start_hook`` and ``end_hook``, which are triggered before starting a new software installation, and right after,
  respectfully;
* hooks that a triggered before and after every step of the installation procedure, aptly named
  '``pre``'- and '``post``'-hooks

The list of currently available hooks, which can also be consulted using ``eb --avail-hooks``, is:

    * ``start_hook``
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
    * ``end_hook``

All functions implemented in the provided Python module for which the name ends with ``_hook`` are considered.

If any ``*_hook`` functions are encountered that do not match with any of the available hooks, an error is reported.
EasyBuild will try to provide suggestions for available hooks that closely match with the encountered unknown hook.

For example::

    $ eb --hooks example_hooks.py example.eb
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

* for the ``pre``- and ``post``-step hooks, one argument is provided:
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

.. _hooks_examples:

Examples of hook implementations
--------------------------------

.. _hooks_examples_openmpi_configopts:

Example hook to add ``--with-slurm`` to OpenMPI configure options
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
