.. _easyconfig_files_local_variables:

Local variables in easyconfig files
===================================

This page discusses the use of *local variables in easyconfig files*.

For more general information on writing easyconfig files, please see :ref:`writing_easyconfig_files`.

.. contents::
    :depth: 3
    :backlinks: none

.. _easyconfig_files_local_variables_motivation:

Motivation & context
--------------------

When composing easyconfig files, it can sometimes make sense to use one or more *local variables*
to define easyconfig parameters in a cleaner way, for example to avoid copy-pasting values that are used
multiple times, or to avoid too long lines (longer than the maximum width of 120 characters as specified in
:ref:`code style`). A local variable within the context of easyconfig files is any variable that does not
correspond to a known easyconfig parameter (either general of easyblock-specific).

One thing that is easily overlooked is the importance of how these local variables are named:
you should try and avoid that the names of local variables will match with the name of an easyconfig parameter
that may get introduced in future EasyBuild versions. If that would happen, the semantics of the easyconfig file
will change which may either result in a broken installation or perhaps a different installation than was intended
(which could be worse than a broken one).

Avoiding that names of local variables are *close* to the name of (future) easyconfig parameters is also important,
because of the "typo detection" feature that EasyBuild has: if the name of a local variable is too close to a
known easyconfig parameter, EasyBuild will assume you have made a mistake, and will report a typo error, for example::

  ERROR: Failed to process easyconfig example.eb:
  You may have some typos in your easyconfig file: configopt -> configopts


.. _easyconfig_files_local_variables_easybuild4:

Changes in EasyBuild v4.0 w.r.t. local variables in easyconfig files
--------------------------------------------------------------------

Some changes were made in EasyBuild v4.0 to discourage the use of poorly named local variables:

* a :ref:`easyconfig_files_local_variables_naming_scheme` was defined;

* a mechanism was implemented to detect the use of local variables in easyconfig files, which will print
  a :ref:`easyconfig_files_local_variables_naming_warning`

* EasyBuild can be configured to report an error for local variables that do not follow the recommended naming scheme;
  see :ref:`easyconfig_files_local_variables_strict_naming`

* using ``eb --fix-deprecated-easyconfigs``, the names of local variables can be changed automatically to match
  the recommended naming scheme; see :ref:`easyconfig_files_local_variables_fix_deprecated_easyconfigs`



.. _easyconfig_files_local_variables_naming_scheme:

Recommended naming scheme for local variables in easyconfig files
-----------------------------------------------------------------

To ensure that local variables used in easyconfig files do not clash with easyconfig parameters that get added in
future EasyBuild versions, we have defined a recommended naming scheme for local variables.

Names of local variables should either:

* **start with** ``local_``, to make it explicit that it is a *local* variable (examples: ``local_example``, ``local_var``)

* **consist of a single letter** (examples: ``f``, ``l``, ``x``);
  this is typically only done within the context of a `list comprehension <https://docs.python.org/2/tutorial/datastructures.html#list-comprehensions>`_

* **start with a single underscore** (``_``), which matches the common convention in Python code that these variables are only for "internal use" (examples: ``_example``, ``_local_var``)


.. note:: A check was added in EasyBuild v4.0 to ensure that the names of known easyconfig parameters
 do *not* conform to any of these rules, to ensure that local variables can always be discriminated from
 known easyconfig parameters.


.. _easyconfig_files_local_variables_naming_warning:

Warning for local variables that do not follow the recommended naming scheme
----------------------------------------------------------------------------

By default, EasyBuild will produce a clear warning when one or more local variables are used that do not conform
to the :ref:`recommended naming scheme easyconfig_files_local_variables_naming_scheme`.

For example, when using an easyconfig file that includes a local variable named ``var``::

  $ eb example.eb
  ...
  WARNING: Use of 1 unknown easyconfig parameters detected in example.eb: var
  If these are just local variables please rename them to start with 'local_', or try using --fix-deprecated-easyconfigs to do this automatically.

To get rid of this warning, you can either:

* rename the local variable, either manually to something like ``local_var`` or using ``eb --fix-deprecated-easyconfigs example.eb``
  (see also :ref:`easyconfig_files_local_variables_fix_deprecated_easyconfigs`)

* configure EasyBuild to only log the warning (not print it), via ``--local-var-naming-check=log``
  (see also :ref:`easyconfig_files_local_variables_check_mode`; note that silencing
  the printed warning is **not recommended**, see the motivation in :ref:`motivation above easyconfig_files_local_variables_motivation`


.. _easyconfig_files_local_variables_check_mode:

Specifying what should be done when non-confirming local variables are found via ``--local-var-naming-check``
-------------------------------------------------------------------------------------------------------------

Using the ``--local-var-naming-check`` configuration option, you can specify what should be done when one or more
local variables are found that do not follow the
:ref:`recommended naming scheme easyconfig_files_local_variables_naming_scheme`:

* ``--local-var-naming-check=error``: **fail with an error** if any easyconfig file that was parsed includes
  local variables that do not follow the recommended naming scheme;
* ``--local-var-naming-check=log``: only *log* a warning (but do not print it) if any easyconfig file that was
  parsed includes local variables that do not follow the recommended naming scheme;
* ``--local-var-naming-check=warn`` *[default]*: *print* a warning if any easyconfig file that was parsed includes
  local variables that do not follow the recommended naming scheme;

The default is set such that non-confirming local variables are only reported through a printed warning,
but do not result in cancelling the installation (since they're usually not actually problematic).


.. _easyconfig_files_local_variables_fix_deprecated_easyconfigs:

Renaming local variables to match the recommended naming scheme using ``eb --fix-deprecated-easyconfigs``
---------------------------------------------------------------------------------------------------------

To fix one or more easyconfig files that includes local variables that do not follow the
:ref:`recommended naming scheme easyconfig_files_local_variables_naming_scheme`, ``eb --fix-deprecated-easyconfigs``
can be used.

For example::

   eb --fix-deprecated-easyconfigs bzip2.eb zlib.eb
   == temporary log file in case of crash /tmp/eb-Z7r_KJ/easybuild-dHtPY4.log

   * [1/2] fixing /tmp/example/bzip2.eb... FIXED!
     (changes made in place, original copied to /tmp/example/bzip2.eb.orig_20190815180106_53972)

   * [2/2] fixing /tmp/example/zlib.eb... FIXED!
     (changes made in place, original copied to /tmp/example/zlib.eb.orig_20190815180106_53972)

   All done! Fixed 2 easyconfigs (out of 2 found).

   == Temporary log file(s) /tmp/eb-Z7r_KJ/easybuild-dHtPY4.log* have been removed.
   == Temporary directory /tmp/eb-Z7r_KJ has been removed.

There are a couple of caveats here though...

While ``--fix-deprecated-easyconfigs`` can be very useful, it's certainly not perfect since all it does is simple
search and replace of the names of non-conforming local variables (as whole words) to prefix them with ``local_``.

This means that it may make some unintended changes, so make sure to **always double check which changes were made!**

In addition, it sometimes make more sense to simply *eliminate* the local variable rather than renaming it, for
example when it wasn't really needed at all: maybe it was only actually used once, or maybe using a template like
``%(pyver)s`` or ``(pyshortver)s`` (see also :ref:`avail_easyconfig_templates`) renders it obsolete.
