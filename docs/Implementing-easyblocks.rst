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

An *easyblock* is a Python module that implements a software build and install procedure.
It can be considered a Python script that plugs into the :ref:`framework`.

EasyBuild will leverage easyblocks as needed, depending on which software packages it needs to install.
Which easyblock is required is determined by the ``easyblock`` easyconfig parameter, or the software name
(see :ref:`implementing_easyblocks_generic_vs_software_specific`).


.. _implementing_easyblocks_vs_easyconfigs:

Easyblocks vs easyconfigs
-------------------------

Before you start implementing an easyblock, you should determine whether or not you really need an easyblock.

Easyconfig files provide quite a bit of flexibility that alleviate the need for implementing many (software-specific)
easyblocks. Examples include easyconfig parameters like ``(pre){config,build,installopts}`` (all easyblocks),
``install_cmd`` (``Binary`` generic easyblock or derivates), etc. See :ref:`writing_easyconfig_files` for an
overview of what is supported in easyconfig files.

On the other hand, somewhat complex or heavily customised software build and install procedures may be handled better
via a custom easyblock.

Easyblocks are "do once and forget", and can provide a *central* solution for peculiarities of installations.
Since they are basically Python scripts, they are very flexible and can take care of the
'heavy lifting' that goes beyond the key-value defining scope of easyconfig files.

Hence, there is a fine line between using 'fat' easyconfigs and a custom easyblock.

Reasons to consider implementing an easyblock include:

* 'critical' values for easyconfig parameters, which are required to make the installation succeed
* compiler- or toolchain-specific aspects of the build and install procedure (e.g., configure/build/install options)
* interactive commands that need to be run
* custom (configure) options for dependencies
* 'hackish' usage of existing (generic) easyblocks and available easyconfig parameters

One important aspect to consider of course is that implementing easyblocks requires some familiarity with Python,
while easyconfig files can mostly be seen as a set of pure key-value definitions and hence are easier to create or
update.


.. _implementing_easyblocks_generic_vs_software_specific:

Generic vs software-specific easyblocks
---------------------------------------

Easyblocks can either be *generic* of *software-specific*.


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
