.. building_with_easystack:

Building with Easystack
=======================

This documentation covers aspects of using Easybuild with *Easystack*.

*Note: this is an experimental feature. Some of the mentioned functionality may be subject to change or be prone to errors.*

.. contents::
    :depth: 3
    :backlinks: none


.. building_with_easystack_basics:

The Basics
----------

Building with *Easystack* lets user create a file that specifies all the software they want to build, and call EasyBuild with that file as argument.
EasyBuild then loops over the software specified in the spec file to build it. 


.. building_with_easystack_usage:

Usage
-------------------------

To build software with *Easystack*, type:

.. code::

  eb --easystack example.yaml

where example.yaml is the file with specifications that you just created (more about this in the next chapter).

.. building_with_easystack_structure:

Structure of an Easystack file
-------------------------

Easystack files are written in YAML syntax. ( YAML guide: https://learnxinyminutes.com/docs/yaml )

General options, which should be applied to each software (i.e. *robot*), are defined at the top of the file.

Afterwards, particular software specifications follow.

It is mandatory to specify basic software-related keywords - *software name*, *toolchains* and *versions*.

*software name*: Name of software.

*toolchains*: A group of development related utilities (eg compiler) and libraries. 
(see :ref:`toolchains` for more details).

*versions*: Version of software. If multiple entries are provided, EB will install all of them. 
Can be in form of a list or consecutive line entries (see example). 

**General structure of YAML-formatted easystack:**

.. code::

  software:
    software_name:
      toolchains:
        toolchain_name (incl. version):
            software_version:
              versionsuffix:

**Use-case example of YAML-formatted easystack:**

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

Installation using this *easystack* called 'myeasystack.yaml' with command

.. code::

  eb --easystack myeasystack.yaml

is an equivalent of running:

.. code::

  eb Bioconductor-3.11-foss-2020a.eb EasyBuild-4.3.1-SYSTEM.eb GROMACS-2020.1-foss-2020a.eb GROMACS-2020.3-foss-2020a.eb GROMACS-2020.1-fosscuda-2020a.eb OpenFOAM-8-foss-2020a.eb OpenFOAM-v2006-foss-2020a.eb R-4.0.0-foss-2020a.eb

To be developed
---------------

**Optionally, more advanced keywords can be specified:**
*easybuild_version*, *robot*, *from_pr*, *versionsuffix*, *include-labels*, *exclude-labels*.

*easybuild_version:* if present, EB framework will check if the Easystack file was intended for the current version of the EB framework.

*robot:* enables dependency resolution. (see :ref:`Using_the_EasyBuild_command_line` for more details). 

*from_pr:* easyconfig files that are added or modified by a
particular pull request to the easybuild-easyconfigs GitHub repository
can be used (regardless of whether the pull request is merged or not).
(see :ref:`Integration_with_GitHub` for more details). 

*versionsuffix:* additional suffix for software version (placed after toolchain name)
(see :ref:`easyconfig_parameters` for more details). 

*include-labels:* 


*exclude-labels:* 


