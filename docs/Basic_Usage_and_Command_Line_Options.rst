
Basic Usage and Command Line Options
====================================

Basic usage of EasyBuild is described in the following sections, covering the most important range of topics if you are new to EasyBuild.
 
``eb`` Command Line
-------------------
 
``eb`` is EasyBuild’s main command line tool, to interact with the EasyBuild framework.

Check :ref:`BasicUsagehelp` described below w.r.t. usage and see ``eb --version`` to validate the version which you are testing; as a first step try::

  $ eb --version
  This is EasyBuild 1.15.2 (framework: 1.15.2, easyblocks: 1.15.2) on host Cephalonia.local.

Providing an Easyconfig File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
The most basic usage is to simply provide the name of an easyconfig file to ``eb``.
EasyBuild will (try and) locate the easyconfig file, and perform the installation as specified by the easyconfig file.
 
For example, to build and install bzip2 v1.0.6 (using the system compiler)::
 
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
 
.. tip:: All easyconfig file names' suffixes are ``.eb`` and follow format ``<name>-<version>-<toolchain>-<versionsuffix>``;
         this is a crucial design aspect, since the dependency resolution mechanism (introduced below) relies upon this feature
         and permits very complicated builds, sitting upon composite toolchains, to be described in high detail.
 
.. tip:: You may wish to modify ``$EASYBUILD_PREFIX`` in order to redefine the build/install/source path prefix to be used; default value is: ``$HOME/.local/easybuild``

Using Only Command Line Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
An alternative approach is to only use command line options to specify which software to build.
 
Here is how to build and install last version of bzip2 (that EasyBuild is aware of) using ``dummy`` toolchain (i.e., using the system compiler)::
 
  $ eb --software-name=bzip2 --toolchain-name=dummy
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
  
Providing Multiple Easyconfig Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
Multiple easyconfig files can be provided as well, either directly or by specifying a directory that contains easyconfig files.

For example, to build and install both bzip2 and GCC with a single command, simply list the easyconfigs for both on the eb command line (note that bzip2 is not being reinstalled, since a matching module is already available)::
 
  $ eb bzip2-1.0.6.eb GCC-4.8.3.eb
  == temporary log file in case of crash /tmp/easybuild-pGof8u/easybuild-GNYSey.log
  == bzip2/1.0.6 is already installed (module found), skipping
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


When one or more directories are provided, EasyBuild will (recursively) traverse them
to find easyconfig files. For example:

::

  $ find set_of_easyconfigs/ -type f             
  set_of_easyconfigs//GCC-4.8.3.eb
  set_of_easyconfigs//foo.txt
  set_of_easyconfigs//tools/bzip2-1.0.6.eb

::

  $ eb set_of_easyconfigs/
  == temporary log file in case of crash /tmp/easybuild-1yxCvv/easybuild-NeNmZr.log
  == bzip2/1.0.6 is already installed (module found), skipping
  == GCC/4.8.3 is already installed (module found), skipping
  == No easyconfigs left to be built.
  == Build succeeded for 0 out of 0
  == temporary log file /tmp/easybuild-1yxCvv/easybuild-NeNmZr.log has been removed.
  == temporary directory /tmp/easybuild-1yxCvv has been removed.
 
.. note:: EasyBuild will only pick up the files which end with ``.eb`` ; anything else will be ignored.
 
.. tip:: Calling EasyBuild is designed as an `idempotent` operation; 
  if a module is available that matches with an provided easyconfig file, the installation will simply be skipped.


Commonly Used Command Line Options
----------------------------------
 
[[EB cmdline??]] - XXX
 
Basic Usage, --help
~~~~~~~~~~~~~~~~~~~
 
Use ``eb --help``/``-H``, ``eb -h`` - XXX

.. note:: --help/-H spit out the long help info (i.e. including long option names), -h only includes short option names
.. tip:: This is the best way to query for certain information, esp. recent features, since this is in sync with the actual EasyBuild version being used

Refer to page :ref:`basicusagehelp` for more information.

Overview of Known Toolchains
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
For an overview of known toolchains, try ``eb --list-toolchains`` and/or refer to page :ref:`Toolchains_Table`
 
.. tip:: Toolchains have brief mnemonic names, for example:
  ``goolf`` stands for ``gcc+openmpi+openblas/lapack+fftw``,
  ``iimpi`` stands for ``icc/ifort+intelmpi``, while
  ``cgmvolf`` stands for ``clang/gcc+mvapich+openblas/lapack+fftw``.

:ref:`Toolchains_Table`

List of Available Easyblocks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
You can obtain a list of available :ref:`Easyblocks` via ``--list-easyblocks``.

The parameter ``--list-easyblocks`` prints the easyblocks in a hierarchical way,
showing the inheritance patterns, with the "base" easyblock class ``EasyBlock`` on top.

Software-specific easyblocks have a name that starts with ``EB_``; the ones that do not are generic easyblocks.
 
List of generic easyblocks::
 
  eb --list-easyblocks | grep -v ^EB_
 
Refer to page :ref:`basicusageeasyblocks` for more information.


All Available Easyconfig Parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

EasyBuild provides a significant amount of easyconfig parameters.
An overview of all available easyconfig parameters can be obtained via 
``eb --avail-easyconfig-params``, or ``eb -a`` for short.

Refer to page :ref:`easyconfigsparameters` for more information, the possible parameters are a very rich set.

.. tip:: Combine with ``--easyblock/-e`` to include parameters that are specific to a particular easyblock; fi. ``eb -a -e EB_WRF``;
  default is to include ``ConfigureMake`` specific-ones (e.g., ``prefix_opt``)

(refer to external page that lists all available easyconfig parameters, maybe even in a nicer format than just a literal dump of the “eb -a” output (i.e. with a one-liner before dumping the output to a file) - XXX - Need to convert -a output to .rst format

Enable Debug Logging
~~~~~~~~~~~~~~~~~~~~

Use ``eb --debug/-d`` to enable debug logging, to include all details of how EasyBuild performed a build in the log file::

  eb bzip2-1.0.6.eb -d   ## Long output follows
  [...]

.. tip:: You may enable this by default via adding ``debug = True`` in your EasyBuild configuration file

.. note:: Debug log files are significantly larger than non-debug logs, so be aware.


Forced Reinstallation
~~~~~~~~~~~~~~~~~~~~~

Use ``eb --force/-f`` to force the reinstallation of a given easyconfig/module.

.. warning:: Use with care since this will rebuild and reinstall an existing module,
  which may be used as a dependency for something else, without requesting confirmation first.

Searching for Easyconfigs
-----------------------------------

Use ``--search/-S`` (long vs short output) and an easyconfig filepath pattern, for case-insensitive search of easyconfigs. Example::

  $ eb --search WRF-3.5.1
  == temporary log file in case of crash /tmp/easybuild-B0tYcq/easybuild-ZpmYAs.log
  == Searching (case-insensitive) for 'WRF-3.5.1' in /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
   * /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/w/WRF/WRF-3.5.1-goolf-1.4.10-dmpar.eb
   * /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/w/WRF/WRF-3.5.1-goolf-1.5.14-dmpar.eb
   * /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/w/WRF/WRF-3.5.1-ictce-4.1.13-dmpar.eb
   * /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/w/WRF/WRF-3.5.1-ictce-5.3.0-dmpar.eb
  == temporary log file /tmp/easybuild-B0tYcq/easybuild-ZpmYAs.log has been removed.
  == temporary directory /tmp/easybuild-B0tYcq has been removed.

The same query with ``-S`` is far more readable, when there is a joint path that can be collapsed to a variable like ``$CFGS1``::

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
  
Finally, using a common substring will help to expand a bit the range of matching easyconfigs::

  $ eb -S /GCC-4.9
  == temporary log file in case of crash /tmp/easybuild-W40SsV/easybuild-7l96Cm.log
  == Searching (case-insensitive) for '/GCC-4.9' in /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
  CFGS1=/Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/g/GCC
   * $CFGS1/GCC-4.9.0-CLooG-multilib.eb
   * $CFGS1/GCC-4.9.0-CLooG.eb
   * $CFGS1/GCC-4.9.0.eb
   * $CFGS1/GCC-4.9.1-CLooG-multilib.eb
   * $CFGS1/GCC-4.9.1-CLooG.eb
   * $CFGS1/GCC-4.9.1.eb
  == temporary log file /tmp/easybuild-W40SsV/easybuild-7l96Cm.log has been removed.
  == temporary directory /tmp/easybuild-W40SsV has been removed.


.. note:: By using a leading slash in front of a search pattern, as the last example, we filter out all the potential matches
  of easyconfigs that are built with GCC (as opposed to the actual easyconfigs for GCC itself, which is our intention here).

.. tip:: Using ``--search`` has remarkably longer output in most cases, compared to ``-S``; the information is the same,
  however the paths towards the easyconfigs are fully expanded, taking lot of screen real estate for most people. 


Dependency Resolution
-------------------------------

To make EasyBuild try and resolve dependencies, use the ``--robot/-r`` command line option, as follows::

     $ eb WRF-3.5.1-goolf-1.4.10-dmpar.eb --robot | grep "building and installing"
     (show output)

Get an Overview of Planned Installations
-------------------------------------------------------

You can do a "dry-run" overview by supplying ``-D/--dry-run`` (typically combined with --robot, in the form of ``-Dr``).

The output of --dry-run turns to be long for complex builds, see WRF for an example::

  $ eb WRF-3.5.1-goolf-1.4.10-dmpar.eb --robot --dry-run
  == temporary log file in case of crash /tmp/easybuild-7VwyLh/easybuild-Intzn7.log
  Dry run: printing build status of easyconfigs and dependencies
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/g/GCC/GCC-4.7.2.eb (module: GCC/4.7.2)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/h/hwloc/hwloc-1.6.2-GCC-4.7.2.eb (module: hwloc/1.6.2-GCC-4.7.2)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/o/OpenMPI/OpenMPI-1.6.4-GCC-4.7.2.eb (module: OpenMPI/1.6.4-GCC-4.7.2)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/g/gompi/gompi-1.4.10.eb (module: gompi/1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/o/OpenBLAS/OpenBLAS-0.2.6-gompi-1.4.10-LAPACK-3.4.2.eb (module: OpenBLAS/0.2.6-gompi-1.4.10-LAPACK-3.4.2)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/f/FFTW/FFTW-3.3.3-gompi-1.4.10.eb (module: FFTW/3.3.3-gompi-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/s/ScaLAPACK/ScaLAPACK-2.0.2-gompi-1.4.10-OpenBLAS-0.2.6-LAPACK-3.4.2.eb (module: ScaLAPACK/2.0.2-gompi-1.4.10-OpenBLAS-0.2.6-LAPACK-3.4.2)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/g/goolf/goolf-1.4.10.eb (module: goolf/1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/z/zlib/zlib-1.2.7-goolf-1.4.10.eb (module: zlib/1.2.7-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/s/Szip/Szip-2.1-goolf-1.4.10.eb (module: Szip/2.1-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/n/ncurses/ncurses-5.9-goolf-1.4.10.eb (module: ncurses/5.9-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/f/flex/flex-2.5.37-goolf-1.4.10.eb (module: flex/2.5.37-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/m/M4/M4-1.4.16-goolf-1.4.10.eb (module: M4/1.4.16-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/j/JasPer/JasPer-1.900.1-goolf-1.4.10.eb (module: JasPer/1.900.1-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/h/HDF5/HDF5-1.8.10-patch1-goolf-1.4.10.eb (module: HDF5/1.8.10-patch1-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/t/tcsh/tcsh-6.18.01-goolf-1.4.10.eb (module: tcsh/6.18.01-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/b/Bison/Bison-2.7-goolf-1.4.10.eb (module: Bison/2.7-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/d/Doxygen/Doxygen-1.8.3.1-goolf-1.4.10.eb (module: Doxygen/1.8.3.1-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/n/netCDF/netCDF-4.2.1.1-goolf-1.4.10.eb (module: netCDF/4.2.1.1-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/n/netCDF-Fortran/netCDF-Fortran-4.2-goolf-1.4.10.eb (module: netCDF-Fortran/4.2-goolf-1.4.10)
   * [ ] /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/w/WRF/WRF-3.5.1-goolf-1.4.10-dmpar.eb (module: WRF/3.5.1-goolf-1.4.10-dmpar)
  == temporary log file /tmp/easybuild-7VwyLh/easybuild-Intzn7.log has been removed.
  == temporary directory /tmp/easybuild-7VwyLh has been removed.

::
  
  $ eb OpenMPI-1.6.4-GCC-4.7.2.eb netCDF-4.2.1.1-goolf-1.4.10.eb WRF-3.5.1-goolf-1.4.10-dmpar.eb -Dr --force
  == temporary log file in case of crash /tmp/easybuild-HqpcAZ/easybuild-uNzmpk.log
  Dry run: printing build status of easyconfigs and dependencies
  CFGS=/Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
   * [x] $CFGS/g/GCC/GCC-4.7.2.eb (module: GCC/4.7.2)
   * [x] $CFGS/h/hwloc/hwloc-1.6.2-GCC-4.7.2.eb (module: hwloc/1.6.2-GCC-4.7.2)
   * [F] $CFGS/o/OpenMPI/OpenMPI-1.6.4-GCC-4.7.2.eb (module: OpenMPI/1.6.4-GCC-4.7.2)
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


.. tip:: Note how the different status symbols denote distinct handling states by EasyBuild:
  [ ] The build is not available, EasyBuild will deliver it
  [x] The build is available, EasyBuild will skip building this module
  [F] The build is available, however EasyBuild has been asked to force a rebuild and will do so


