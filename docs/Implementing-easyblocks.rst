.. _implementing_easyblocks:

Implementing easyblocks
=======================

This documentation covers aspects of implementing *easyblocks* and how to use them.
For a concise definition of easyblocks, see :ref:`easyblocks`.

.. contents::
    :depth: 3
    :backlinks: none


.. _implementing_easyblocks_basics:

The basics
----------

An *easyblock* is a Python module that implements a software build and installation procedure.

It can be considered a Python script that plugs into the :ref:`framework`.

EasyBuild will leverage easyblocks as needed, depending on which software packages it needs to install.
Which easyblock is required is determined by the ``easyblock`` easyconfig parameter, or the software name
(see :ref:`implementing_easyblocks_generic_vs_software_specific`).


.. _implementing_easyblocks_generic_vs_software_specific:

Generic vs software-specific easyblocks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Easyblocks can either be *generic* of *software-specific*.

Generic easyblocks implement a 'standard' software build and installation procedure that is used by multiple different
software packages.
A commonly used example is the
`ConfigureMake <https://github.com/hpcugent/easybuild-easyblocks/blob/master/easybuild/easyblocks/generic/configuremake.py>`_ 
generic easyblock, which implements the standard ``configure`` - ``make`` - ``make install`` installation procedure used
by most GNU software packages. See also :ref:`generic_easyblocks`.

Software-specific easyblocks implement the build and installation procedure for a particular software package.
Typically this involves highly customised substeps, for example specyfing dedicated configuration options, creating
or adjusting specific files, executing non-standard shell commands, etc. Usually a custom implementation of the
sanity check is also included.

Since EasyBuild v2.0, using a generic easyblock requires specifying the ``easyblock`` parameter in the easyconfig file;
if it is not specified, EasyBuild will try and find the software-specific easyblock derived from the software name.

The distinction between generic and software-specific easyblocks can be made based on the naming scheme that is used
for an easyblock, see also :ref:`implementing_easyblocks_naming_scheme`.


.. _implementing_easyblocks_vs_easyconfigs:

Easyblocks vs easyconfigs
-------------------------

Before you start implementing an easyblock, you should determine whether or not you really need an easyblock.

:ref:`easyconfig_files` provide quite a bit of flexibility that alleviate the need for implementing many (software-specific)
easyblocks. Examples include easyconfig parameters like ``(pre){config,build,installopts}`` (available for any easyblock),
``install_cmd`` (only for ``Binary`` generic easyblock or derivates), etc. See :ref:`writing_easyconfig_files` for an
overview of what is supported in easyconfig files, and :ref:`generic_easyblocks` for custom easyconfig parameters for
the existing generic easyblocks.

On the other hand, somewhat complex or heavily customised software build and installation procedures may be handled better
via a custom easyblock.

Easyblocks are "do once and forget", and can provide a *central* solution for peculiarities of installations.
Since they are basically Python scripts, they are very flexible and can take care of the
'heavy lifting' that goes beyond the key-value defining scope of easyconfig files.

Hence, there is a fine line between using 'fat' easyconfigs with a generic easyblock and using a custom software-specific easyblock.

Reasons to consider implementing a custom easyblock include:

* 'critical' values for easyconfig parameters, which are required to make the installation succeed
* compiler- or toolchain-specific aspects of the build and installation procedure (e.g., configure/build/install options)
* interactive commands that need to be run
* custom (configure) options for dependencies
* having to create or adjust specific (configuration) files
* 'hackish' usage of existing (generic) easyblocks and available easyconfig parameters

One important aspect to consider of course is that implementing easyblocks requires some familiarity with Python,
while easyconfig files can mostly be seen as a set of pure key-value definitions and hence are easier to create or
update.


.. _implementing_easyblocks_naming_scheme:

Naming scheme for easyblocks
----------------------------


.. _implementing_easyblocks_structure:

Structure of an easyblock
-------------------------


.. _implementing_easyblocks_deriving:

Deriving from existing (generic) easyblocks
-------------------------------------------

(multiple) inheritance


.. _implementing_easyblocks_specifics:

Specific aspects of easyblocks
------------------------------


.. _implementing_easyblocks_custom_parameters:

Custom easyconfig parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``extra_options``


.. _implementing_easyblocks_constructor:

Easyblock constructor
~~~~~~~~~~~~~~~~~~~~~

``__init__``


.. _implementing_easyblocks_files:

Reading/writing/patching files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``read_file``, ``write_file``, ``apply_regex_substitutions``


.. _implementing_easyblocks_running_commands:

Running (interactive) commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``run_cmd``, ``run_cmd_qa``


.. _implementing_easyblocks_sanity_check:

Custom (default) sanity check
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``sanity_check_step``


.. _implementing_easyblocks_version_specific:

Version-specific parts
~~~~~~~~~~~~~~~~~~~~~~

``LooseVersion``


.. _implementing_easyblocks_module_only_compatibility:

Compatibility with ``--extended-dry-run``/``-x`` and ``--module-only``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. _implementing_easyblocks_using:

Using new/custom easyblocks
---------------------------

``--include-easyblocks``

check with ``--list-easyblocks``


.. _implementing_easyblocks_testing:

Testing easyblocks
------------------


``--extended-dry-run``


.. _implementing_easyblocks_use_case_tensorlow:

Use case: an easyblock for Tensorflow
-------------------------------------
