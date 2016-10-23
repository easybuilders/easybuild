.. _users_use_cases_hpc_ugent:

HPC-UGent (Belgium)
===================

.. image:: hpc-ugent.png
    :align: left

:website: http://www.ugent.be/hpc

:institute: Ghent University - http://www.ugent.be

:contact: Kenneth Hoste (kenneth.hoste@ugent.be)

:notes: member of the Flemish Supercomputer Centre (VSC) - https://www.vscentrum.be/

*(last update: Oct 23rd 2016)*

.. _users_use_cases_hpc_ugent_history:

History
-------

EasyBuild was created by the HPC-UGent team in 2009 (first public release in 2012), and has been used to
install (scientific) software for users ever since.

.. _users_use_cases_hpc_ugent_systems:

Systems
-------

EasyBuild is used for installing *all* (scientific) software for end users (outside of standard tools provided by the OS).

* operating system(s): Scientific Linux 6, CentOS Linux 7
* processor architectures: Intel Sandy Bridge, Intel Haswell
* interconnects: Ethernet, Infiniband

A detailed overview of HPC-UGent infrastructure is available at https://www.vscentrum.be/infrastructure/hardware/hardware-ugent.

.. _users_use_cases_hpc_ugent_eb_setup:

EasyBuild setup
---------------

* Python 2.6/2.7 (provided by OS)
* latest ``develop`` version of EasyBuild

Modules tool & module naming scheme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* modules tool: Lmod (latest version)
* module syntax: Tcl
* module naming scheme: default (``EasyBuildMNS``)

Easyblocks
~~~~~~~~~~

Included easyblocks (https://github.com/hpcugent/easybuild-easyblocks) + a handful of internal easyblocks
(mostly for licensed software).

Easyconfigs
~~~~~~~~~~~

Included easyconfigs (https://github.com/hpcugent/easybuild-easyconfigs) + a handful of internal easyconfigs
(mostly for licensed software).

Toolchains
~~~~~~~~~~

Latest revision of common toolchains, with strong focus on ``intel`` toolchain (e.g. ``intel/2016b``).

Configuration
~~~~~~~~~~~~~

EasyBuild is configured using a system-level configuration file and environment variables::

    $ eb --show-config
    #
    # Current EasyBuild configuration
    # (C: command line argument, D: default value, E: environment variable, F: configuration file)
    #
    buildpath      (F) = /tmp/$USER/easybuild
    debug          (F) = True
    installpath    (E) = /apps/gent/$VSC_OS_LOCAL/$VSC_ARCH_LOCAL$VSC_ARCH_SUFFIX
    modules-tool   (E) = Lmod
    repositorypath (F) = $VSC_DATA/easybuild_repo
    robot-paths    (D) = <DEFAULT>
    sourcepath     (F) = /apps/gent/source


.. note:: Output was edited to use environment variables rather than actual values where applicable.

          * $VSC_OS_LOCAL is defined as either 'SL6' or 'CO7'
          * $VSC_ARCH_LOCAL is defined as either 'sandybridge' or 'haswell'
          * $VSC_ARCH_SUFFIX is defined as '-ib' or left undefined

          The value for `--robot-paths` is the default value, i.e. the location of the easyconfig files included
          in the EasyBuild installation (see also :ref:`robot_search_path`).

Notes
~~~~~

* central software installations hosted on a shared filesystem (NFS-mount of GPFS filesystem)
* all EasyBuild installations are performed using a single shared 'install user'
* Lmod spider cache is updated every hour via a cron job, which uses a wrapper script that leverages
  ``update_lmod_system_cache_files``; see ``run_lmod_cache.py`` available from https://github.com/hpcugent/Lmod-UGent
* installations are tested using personal accounts, either on production clusters and/or stripped down virtual machines
