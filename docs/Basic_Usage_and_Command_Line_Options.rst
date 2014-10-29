
Basic Usage and Command Line Options
====================================

Basic usage
===========
 
``eb`` command line
-------------------
 
``eb`` is EasyBuild’s main command line tool, to interact with the EasyBuild framework.
see ``eb --help`` w.r.t. usage, see ``eb --version`` 

Providing an easyconfig file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
Most basic usage is to simply provide the name of an easyconfig file to ``eb``::

  eb bzip2-1.0.6.eb
 
EasyBuild will (try and) locate the easyconfig file, and perform the installation as specified by the easyconfig file.
 
Build & install bzip2 v1.0.6 (using system compiler)::
 
  $ eb bzip2-1.0.6.eb
  == temporary log file in case of crash /tmp/easybuild-0f0xKN/easybuild-oI1vAm.log
  == resolving dependencies ...
  == processing EasyBuild easyconfig /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/b/bzip2/bzip2-1.0.6.eb
  == building and installing bzip2/1.0.6...
  == fetching files...
  == creating build dir, resetting environment...
  == unpacking...
  == patching...
  == preparing...
  == configuring...
  == building...
  == testing...
  == installing...
  == taking care of extensions...
  == packaging...
  == postprocessing...
  == sanity checking...
  == cleaning up...
  == creating module...
  == COMPLETED: Installation ended successfully
  == Results of the build can be found in the log file /Users/fgeorgatos/.local/easybuild/software/bzip2/1.0.6/easybuild/easybuild-bzip2-1.0.6-20141029.013716.log
  == Build succeeded for 1 out of 1
  == temporary log file /tmp/easybuild-0f0xKN/easybuild-oI1vAm.log has been removed.
  == temporary directory /tmp/easybuild-0f0xKN has been removed.

  $ module load bzip2/1.0.6
  $ which bzip2
  /Users/fgeorgatos/.local/easybuild/software/bzip2/1.0.6/bin/bzip2
 
 
.. tip:: All easyconfig file names end with .eb and follow format <name>-<version>-<toolchain>-<versionsuffix>;
         this is crucial, since the dependency resolution mechanism relies upon this feature.
 
 
Using only command line options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
An alternative approach is to only use command line options to specify which software to build.
 
Here is how to build & install last version of bzip2 (that EasyBuild is aware of) using ``dummy`` toolchain (i.e., using system compiler)::
 
  $ time eb --software-name=bzip2 --toolchain-name=dummy
  == temporary log file in case of crash /tmp/easybuild-3AzStZ/easybuild-YD_fMf.log
  == resolving dependencies ...
  == processing EasyBuild easyconfig /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/b/bzip2/bzip2-1.0.6.eb
  == building and installing bzip2/1.0.6...
  == fetching files...
  == creating build dir, resetting environment...
  == unpacking...
  == patching...
  == preparing...
  == configuring...
  == building...
  == testing...
  == installing...
  == taking care of extensions...
  == packaging...
  == postprocessing...
  == sanity checking...
  == cleaning up...
  == creating module...
  == COMPLETED: Installation ended successfully
  == Results of the build can be found in the log file /Users/fgeorgatos/.local/easybuild/software/bzip2/1.0.6/easybuild/easybuild-bzip2-1.0.6-20141029.013514.log
  == Build succeeded for 1 out of 1
  == temporary log file /tmp/easybuild-3AzStZ/easybuild-YD_fMf.log has been removed.
  == temporary directory /tmp/easybuild-3AzStZ has been removed.
  
  real	0m10.062s
  user	0m4.222s
  sys	0m0.999s

Providing multiple easyconfig files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
Multiple easyconfig files can be provided as well, either directly or by specifying a directory that contains easyconfig files::
 
  $ time eb bzip2-1.0.6.eb GCC-4.8.3.eb
  == temporary log file in case of crash /tmp/easybuild-pGof8u/easybuild-GNYSey.log
  == bzip2/1.0.6 is already installed (module found), skipping                      ## N.B. bzip2 does not get built, if already available
  == resolving dependencies ...
  == processing EasyBuild easyconfig /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/g/GCC/GCC-4.8.3.eb
  == building and installing GCC/4.8.3...
  == fetching files...
  == creating build dir, resetting environment...
  == unpacking...
  == patching...
  == preparing...
  == configuring...
  == building...
  == testing...
  == installing...
  == taking care of extensions...
  == packaging...
  == postprocessing...
  == sanity checking...
  == cleaning up...
  == creating module...
  == COMPLETED: Installation ended successfully
  == Results of the build can be found in the log file /Users/fgeorgatos/.local/easybuild/software/GCC/4.8.3/easybuild/easybuild-GCC-4.8.3-20141029.024018.log
  == Build succeeded for 1 out of 1
  == temporary log file /tmp/easybuild-pGof8u/easybuild-GNYSey.log has been removed.
  == temporary directory /tmp/easybuild-pGof8u has been removed.
  
  real	58m45.188s
  user	92m53.829s
  sys	18m14.947s


Here is how to organize your builds into directories, so that they can be handled as collections of software components:

::

  $ ls set_of_easyconfigs/
  GCC-4.8.3.eb	bzip2-1.0.6.eb

Next step is to build then, EasyBuild considers a directory as a collection and acts accordingly:

::

  $ eb set_of_easyconfigs/
  == temporary log file in case of crash /tmp/easybuild-1yxCvv/easybuild-NeNmZr.log
  == bzip2/1.0.6 is already installed (module found), skipping
  == GCC/4.8.3 is already installed (module found), skipping
  == No easyconfigs left to be built.
  == Build succeeded for 0 out of 0
  == temporary log file /tmp/easybuild-1yxCvv/easybuild-NeNmZr.log has been removed.
  == temporary directory /tmp/easybuild-1yxCvv has been removed.
 
.. note:: EasyBuild will only pick up the files which end with .eb ; anything else will be ignored.
 
.. tip:: Calling EasyBuild is designed as an `idempotent` operation; if one of the proposed builds is available as a module,
  it will simply be skipped, while if not the build is attempted. You can rerun your eb command until all builds are accomplished,
  esp. in case a mishap breaks the build effort, for whatever reason (fi. full disk, OS shutdown, or even a user process kill).


Commonly used command line options
----------------------------------
 
[[EB cmdline??]] - XXX
 
Basic Usage, --help
~~~~~~~~~~~~~~~~~~~
 
Use ``eb —help``/``-H``, ``eb -h`` - XXX

Refer to page :ref:`basicusagehelp` for more information.

Overview of known toolchains
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
``eb --list-toolchains``, refer to page `Toolchain Tables`
(make sure example output of --list-toolchains is in a separate file, so it’s easy to auto-update for new releases)
 
:ref:`Toolchains_Table`

List of available easyblocks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
List of available easyblocks via ``--list-easyblocks``
 
Software-specific easyblocks have a name that starts with ``EB_`; the ones that do not are generic easyblocks.
 
List of generic easyblocks::
 
     eb --list-easyblocks | grep -v ^EB_
 
Refer to page :ref:`basicusageeasyblocks` for more information.


All available easyconfig parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

EasyBuild will provide a long list of output, if you ask it to show you details of its configuration options.

Here is an overview of all available easyconfig parameters via ``eb --avail-easyconfig-params``, or ``eb -a`` for short::

  $ eb -a Available easyconfig parameters (* indicates specific for the ConfigureMake EasyBlock)

  MANDATORY                   BUILD                    FILE-MANAGEMENT          EXTENSIONS
  ---------                   -----                    ---------------          ----------
  description                 buildopts                buildininstalldir        exts_classmap
  docurls                     checksums                cleanupoldbuild          exts_defaultclass
  homepage                    configopts               cleanupoldinstall        exts_filter
  name                        easyblock                dontcreateinstalldir     exts_list
  software_license            easybuild_version        keeppreviousinstall
  software_license_urls       installopts              keepsymlinks             MODULES
  toolchain                   maxparallel              start_dir                -------
  version                     parallel                                          include_modpath_extensions
                              patches                  DEPENDENCIES             modaliases
  EASYBLOCK-SPECIFIC          postinstallcmds          ------------             modextrapaths
  ------------------          prebuildopts             allow_system_deps        modextravars
  configure_cmd_prefix(*)     preconfigopts            builddependencies        modloadmsg
  prefix_opt(*)               preinstallopts           dependencies             modtclfooter
  tar_config_opts(*)          runtest                  hiddendependencies       moduleclass
                              sanity_check_commands    osdependencies           moduleforceunload
  TOOLCHAIN                   sanity_check_paths                                moduleloadnoconflict
  ---------                   skip                     LICENSE
  onlytcmod                   skipsteps                -------                  OTHER
  toolchainopts               source_urls              group                    -----
                              sources                  key                      buildstats
                              stop                     license_file
                              tests                    license_server
                              unpack_options           license_server_port
                              unwanted_env_vars
                              versionprefix            
                              versionsuffix            

Refer to page :ref:`easyconfigsparameters` for more information on the details of the individual options.

.. tip:: Combine with ``--easyblock/-e`` to include parameters that are specific to a particular easyblock; fi. ``eb -a -e EB_WRF``;
  default is to include :ref:`ConfigureMake` specific-ones (e.g., ``prefix_opt``)

(refer to external page that lists all available easyconfig parameters, maybe even in a nicer format than just a literal dump of the “eb -a” output (i.e. with a one-liner before dumping the output to a file) - XXX - Need to convert -a output to .rst format

Enable debug logging
~~~~~~~~~~~~~~~~~~~~

Use ``eb --debug/-d`` to enable debug logging, to include all details of how EasyBuild performed a build in the log file::

  eb bzip2-1.0.6.eb -ld   ## Long output follows
  [...]


.. tip:: enable this by default by adding ``debug = True`` in EasyBuild configuration file

.. tip:: this option makes log files significantly bigger, use it as required


Forced reinstallation
~~~~~~~~~~~~~~~~~~~~~

Use ``eb --force/-f`` to force the reinstallation of a given easyconfig/module.

.. warning:: Use with care since this will rebuild and reinstall an existing module, which may be used as a dependency for something else!

Searching for easyconfigs
-----------------------------------

Use ``--search/-S`` (long vs short output) and an easyconfig filename pattern, for case-insensitive search of easyconfigs. Example::

  $ eb -S WRF-3.5.1
  == temporary log file in case of crash /tmp/easybuild-muFTYO/easybuild-d8Lcqq.log
  == Searching (case-insensitive) for 'WRF-3.5.1' in /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
  CFGS1=/Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/w/WRF
   * $CFGS1/WRF-3.5.1-goolf-1.4.10-dmpar.eb
   * $CFGS1/WRF-3.5.1-goolf-1.5.14-dmpar.eb
   * $CFGS1/WRF-3.5.1-ictce-4.1.13-dmpar.eb
   * $CFGS1/WRF-3.5.1-ictce-5.3.0-dmpar.eb
  == temporary log file /tmp/easybuild-muFTYO/easybuild-d8Lcqq.log has been removed.
  == temporary directory /tmp/easybuild-muFTYO has been removed.
  
  $ eb -S /GCC-4.9.1
  == temporary log file in case of crash /tmp/easybuild-HJ7qa4/easybuild-JaBakE.log
  == Searching (case-insensitive) for '/GCC-4.9.1' in /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
  CFGS1=/Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/g/GCC
   * $CFGS1/GCC-4.9.1-CLooG-multilib.eb
   * $CFGS1/GCC-4.9.1-CLooG.eb
   * $CFGS1/GCC-4.9.1.eb
  == temporary log file /tmp/easybuild-HJ7qa4/easybuild-JaBakE.log has been removed.
  == temporary directory /tmp/easybuild-HJ7qa4 has been removed.

.. note:: By using a leading slash in front of a search pattern, as the last example, we filter out all the potential matches
  of easyconfigs that are built with GCC (as opposed to the very easyconfigs of GCC itself, which is our intention).

.. tip:: Using ``--search`` has remarkably longer output in most cases, than ``-S``; the information is the same,
  however the paths towards the easyconfigs are fully expanded, taking lot of screen real estate for most people. 


Dependency resolution
-------------------------------

To make EasyBuild try and resolve dependencies, use the --robot/-r command line option, as follows::

     $ eb WRF-3.5.1-goolf-1.4.10-dmpar.eb --robot | grep "building and installing"
     (show output)

Get an overview of planned installations
-------------------------------------------------------

dry run overview -D/--dry-run (combined with --robot) 

     $ eb WRF-3.5.1-goolf-1.4.10-dmpar.eb --robot --dry-run
     (show output)

::
  
  $ eb OpenMPI-1.6.4-GCC-4.7.2.eb netCDF-4.2.1.1-goolf-1.4.10.eb WRF-3.5.1-goolf-1.4.10-dmpar.eb -Dr --force
  == temporary log file in case of crash /tmp/easybuild-HqpcAZ/easybuild-uNzmpk.log
  Dry run: printing build status of easyconfigs and dependencies
  CFGS=/Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
   * [x] $CFGS/g/GCC/GCC-4.7.2.eb (module: GCC/4.7.2)
   * [x] $CFGS/h/hwloc/hwloc-1.6.2-GCC-4.7.2.eb (module: hwloc/1.6.2-GCC-4.7.2)
   * [x] $CFGS/o/OpenMPI/OpenMPI-1.6.4-GCC-4.7.2.eb (module: OpenMPI/1.6.4-GCC-4.7.2)
   * [x] $CFGS/g/gompi/gompi-1.4.10.eb (module: gompi/1.4.10)
   * [ ] $CFGS/o/OpenBLAS/OpenBLAS-0.2.6-gompi-1.4.10-LAPACK-3.4.2.eb (module: OpenBLAS/0.2.6-gompi-1.4.10-LAPACK-3.4.2)
   * [x] $CFGS/f/FFTW/FFTW-3.3.3-gompi-1.4.10.eb (module: FFTW/3.3.3-gompi-1.4.10)
   * [ ] $CFGS/s/ScaLAPACK/ScaLAPACK-2.0.2-gompi-1.4.10-OpenBLAS-0.2.6-LAPACK-3.4.2.eb (module: ScaLAPACK/2.0.2-gompi-1.4.10-OpenBLAS-0.2.6-LAPACK-3.4.2)
   * [ ] $CFGS/g/goolf/goolf-1.4.10.eb (module: goolf/1.4.10)
   * [ ] $CFGS/s/Szip/Szip-2.1-goolf-1.4.10.eb (module: Szip/2.1-goolf-1.4.10)
   * [ ] $CFGS/f/flex/flex-2.5.37-goolf-1.4.10.eb (module: flex/2.5.37-goolf-1.4.10)
   * [ ] $CFGS/n/ncurses/ncurses-5.9-goolf-1.4.10.eb (module: ncurses/5.9-goolf-1.4.10)
   * [ ] $CFGS/m/M4/M4-1.4.16-goolf-1.4.10.eb (module: M4/1.4.16-goolf-1.4.10)
   * [ ] $CFGS/j/JasPer/JasPer-1.900.1-goolf-1.4.10.eb (module: JasPer/1.900.1-goolf-1.4.10)
   * [ ] $CFGS/z/zlib/zlib-1.2.7-goolf-1.4.10.eb (module: zlib/1.2.7-goolf-1.4.10)
   * [ ] $CFGS/t/tcsh/tcsh-6.18.01-goolf-1.4.10.eb (module: tcsh/6.18.01-goolf-1.4.10)
   * [ ] $CFGS/b/Bison/Bison-2.7-goolf-1.4.10.eb (module: Bison/2.7-goolf-1.4.10)
   * [ ] $CFGS/h/HDF5/HDF5-1.8.10-patch1-goolf-1.4.10.eb (module: HDF5/1.8.10-patch1-goolf-1.4.10)
   * [ ] $CFGS/d/Doxygen/Doxygen-1.8.3.1-goolf-1.4.10.eb (module: Doxygen/1.8.3.1-goolf-1.4.10)
   * [ ] $CFGS/n/netCDF/netCDF-4.2.1.1-goolf-1.4.10.eb (module: netCDF/4.2.1.1-goolf-1.4.10)
   * [ ] $CFGS/n/netCDF-Fortran/netCDF-Fortran-4.2-goolf-1.4.10.eb (module: netCDF-Fortran/4.2-goolf-1.4.10)
   * [ ] $CFGS/w/WRF/WRF-3.5.1-goolf-1.4.10-dmpar.eb (module: WRF/3.5.1-goolf-1.4.10-dmpar)
  == temporary log file /tmp/easybuild-HqpcAZ/easybuild-uNzmpk.log has been removed.
  == temporary directory /tmp/easybuild-HqpcAZ has been removed.


