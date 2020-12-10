.. _easystack:

Easystack files
===============

This documentation covers aspects of specifying a software stack to instlal with Easybuild with *easystack files*.

**Note: this is an* :ref:`experimental feature <experimental_features>`. *Some of the mentioned functionality may be subject to change or be prone to errors.**

.. contents::
    :depth: 3
    :backlinks: none


.. _easystack_basics:

The basics
----------

*Easystack files* describe an entire software stack, and can be used to specify to EasyBuild what to install.

.. _easystack_usage:

Usage
-----

To build software with *Easystack*, type:

.. code::

  eb --easystack example.yaml --experimental

where ``example.yaml`` is the file with specifications that you just created (more about this in the next section).

.. _easystack_structure:

Structure of an easystack file
------------------------------

Easystack files are written in `YAML syntax <https://learnxinyminutes.com/docs/yaml>`_.

General options, which should be applied to each software (for example ``robot``), are defined at the top of the file.

Afterwards, particular software specifications follow.

It is mandatory to specify basic software-related keywords: *software name*, *toolchains* and *versions*.

- *software name*: Name of the software.
- *toolchains*: Names and versions of compiler :ref:`toolchains`.
- *versions*: Versions of software. If multiple entries are provided, EasyBuild will install all of them. 
Can be in form of a list or consecutive line entries (see example). 

**General structure of YAML-formatted easystack:**

.. code::

  software:
    <software_name>:
      toolchains:
        <toolchain name and version>:
            <software_version>:
              versionsuffix: '<-example>'

**Example of YAML-formatted easystack:**

.. code::

  software:
    Bioconductor:
      toolchains:
        foss-2020a:
          versions:
            3.11:
    EasyBuild:
      toolchains:
        SYSTEM:
          versions: [4.3.1]
    GROMACS:
      toolchains:
        foss-2020a:
          versions:
            2020.1:
            2020.3:
        fosscuda-2020a:
          versions: [2020.1]
    OpenFOAM:
      toolchains:
        foss-2020a:
          versions: [8, v2006]
    R:
      toolchains:
        foss-2020a:
          versions: [4.0.0]

To install the software specified in this *easystack file* named '``myeasystack.yaml``', run:

.. code::

  eb --easystack myeasystack.yaml

This is equivalent to running:

.. code::

  eb Bioconductor-3.11-foss-2020a.eb EasyBuild-4.3.1-SYSTEM.eb GROMACS-2020.1-foss-2020a.eb GROMACS-2020.3-foss-2020a.eb GROMACS-2020.1-fosscuda-2020a.eb OpenFOAM-8-foss-2020a.eb OpenFOAM-v2006-foss-2020a.eb R-4.0.0-foss-2020a.eb

To be developed
---------------

Optionally, more advanced keywords can be specified: *easybuild_version*, *robot*, *from_pr*, *versionsuffix*, *include-labels*, *exclude-labels*.

- *easybuild_version:* if present, EasyBuild will check if the easystack file was intended for the current version of EasyBuild.
- *robot:* enables dependency resolution; see :ref:`Using_the_EasyBuild_command_line` for more details.
- *from_pr:* easyconfig files that are added or modified by a
  particular pull request to the easybuild-easyconfigs GitHub repository
  can be used (regardless of whether the pull request is merged or not).
  (see :ref:`Integration_with_GitHub` for more details).
- *versionsuffix:* additional suffix for software version (placed after toolchain name)
  (see :ref:`easyconfig_parameters` for more details).
- *include-labels:*
- *exclude-labels:*
