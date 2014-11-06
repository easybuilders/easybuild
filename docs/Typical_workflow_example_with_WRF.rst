.. _typical_workflow:

Typical workflow example: building and installing WRF
=====================================================

This section shows an example case of building
`Weather Research and Forecasting (WRF) <http://www.wrf-model.org>`_ scientific software application,
which is a notoriously complex software application to build and install.
With EasyBuild however, WRF can be installed quite easily and here is how.


First, you search which easyconfigs are available for WRF, using ``--search`` (see :ref:`searching_for_easyconfigs`)
and you select one based on the software version, toolchain, etc.

Using the selected easyconfig file, you can get an overview of the planned installations using ``--dry-run`` (see :ref:`get_an_overview`).

Finally, building and installing WRF is done by specifying the matching easyconfig file in the eb command line,
and using ``--robot`` (see :ref:`use_robot`) to enable dependency resolution. That way WRF and all of its dependencies are installed with `a single command`!


Searching for available easyconfigs files
-----------------------------------------

Searching for build specification for a particular software package can be done using the
``--search``/``-S`` command line options (see :ref:`searching_for_easyconfigs`);
for example, to get a list of available easyconfig files for WRF::

  $ eb -S WRF
  == temporary log file in case of crash /tmp/easybuild-MdAp7p/easybuild-zEBJMk.log
  == Searching (case-insensitive) for 'WRF' in /home/example/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
  CFGS1=/home/example/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/w/WRF
   * $CFGS1/WRF-3.3.1-goalf-1.1.0-no-OFED-dmpar.eb
   * $CFGS1/WRF-3.3.1-goolf-1.4.10-dmpar.eb
   [...]
   * $CFGS1/WRF-3.5-goolf-1.4.10-dmpar.eb
   * $CFGS1/WRF-3.5-ictce-4.1.13-dmpar.eb
   * $CFGS1/WRF-3.5-ictce-5.3.0-dmpar.eb
   * $CFGS1/WRF-3.5.1-goolf-1.4.10-dmpar.eb
   * $CFGS1/WRF-3.5.1-goolf-1.5.14-dmpar.eb
   [...]
  == temporary log file /tmp/easybuild-MdAp7p/easybuild-zEBJMk.log has been removed.
  == temporary directory /tmp/easybuild-MdAp7p has been removed.

Various easyconfig files are found: for different versions of WRF (e.g., v3.5 and v3.5.1),
for different (versions of) compiler toolchains (e.g., goolf v1.4.10, goolf v1.5.14, ictce), etc.

For the remainder of this example, we will use the available ``WRF-3.5.1-goolf-1.4.10-dmpar.eb``
easyconfig file to specify to EasyBuild to build and install
WRF v3.5.1 using version 1.4.10 of the ``goolf`` toolchain.

See :ref:`toolchains_table` for a list of available toolchains. The ``goolf`` toolchain
stands for ``GCC, OpenMPI, OpenBLAS, ScaLAPACK and FFTW``.

Getting an overview of planned installations
--------------------------------------------

To get an overview of the software that EasyBuild is going to build and install
we can use the ``--dry-run``/``-D`` (see :ref:`get_an_overview`) command line option.
This will show a list of easyconfig files
that will be used, together with the module files that will be installed,
as well as their current availability (``[x]`` marks available modules).

Note that EasyBuild will take care of all of the dependencies of WRF as well,
and can even install the compiler toolchain as well if the corresponding modules are not available yet::

  $ eb WRF-3.5.1-goolf-1.4.10-dmpar.eb -Dr
  == temporary log file in case of crash /tmp/easybuild-HqpcAZ/easybuild-uNzmpk.log
  Dry run: printing build status of easyconfigs and dependencies
  CFGS=/home/example/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
   * [x] $CFGS/g/GCC/GCC-4.7.2.eb (module: GCC/4.7.2)
   * [x] $CFGS/h/hwloc/hwloc-1.6.2-GCC-4.7.2.eb (module: hwloc/1.6.2-GCC-4.7.2)
   * [x] $CFGS/o/OpenMPI/OpenMPI-1.6.4-GCC-4.7.2.eb (module: OpenMPI/1.6.4-GCC-4.7.2)
   * [x] $CFGS/g/gompi/gompi-1.4.10.eb (module: gompi/1.4.10)
   * [x] $CFGS/o/OpenBLAS/OpenBLAS-0.2.6-gompi-1.4.10-LAPACK-3.4.2.eb (module: OpenBLAS/0.2.6-gompi-1.4.10-LAPACK-3.4.2)
   * [x] $CFGS/f/FFTW/FFTW-3.3.3-gompi-1.4.10.eb (module: FFTW/3.3.3-gompi-1.4.10)
   * [x] $CFGS/s/ScaLAPACK/ScaLAPACK-2.0.2-gompi-1.4.10-OpenBLAS-0.2.6-LAPACK-3.4.2.eb (module: ScaLAPACK/2.0.2-gompi-1.4.10-OpenBLAS-0.2.6-LAPACK-3.4.2)
   * [x] $CFGS/g/goolf/goolf-1.4.10.eb (module: goolf/1.4.10)
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



Installing a software stack
---------------------------

To make EasyBuild build and install WRF, including all of its dependencies, a **single command** is sufficient.

By using the ``--robot``/``-r`` (see :ref:`use_robot`) command line option,
we enable dependency resolution such that the entire software stack is handled::

  $ eb WRF-3.5.1-goolf-1.4.10-dmpar.eb --robot
  [...]
  == building and installing zlib/1.2.7-goolf-1.4.10...
  [...]
  == building and installing Szip/2.1-goolf-1.4.10...
  [...]
  == building and installing ncurses/5.9-goolf-1.4.10...
  [...]
  == building and installing flex/2.5.37-goolf-1.4.10...
  [...]
  == building and installing M4/1.4.16-goolf-1.4.10...
  [...]
  == building and installing JasPer/1.900.1-goolf-1.4.10...
  [...]
  == building and installing HDF5/1.8.10-patch1-goolf-1.4.10...
  [...]
  == building and installing tcsh/6.18.01-goolf-1.4.10...
  [...]
  == building and installing Bison/2.7-goolf-1.4.10...
  [...]
  == building and installing Doxygen/1.8.3.1-goolf-1.4.10...
  [...]
  == building and installing netCDF/4.2.1.1-goolf-1.4.10...
  [...]
  == building and installing netCDF-Fortran/4.2-goolf-1.4.10...
  [...]
  == building and installing WRF/3.5.1-goolf-1.4.10-dmpar...
  [...]
  == Build succeeded for 13 out of 13

Once the installation has succeeded, modules will be available for WRF and all of its dependencies::

  $ module load WRF
  $ module list
  Currently Loaded Modulefiles:
    1) GCC/4.7.2                                                  9) JasPer/1.900.1-goolf-1.4.10
    2) hwloc/1.6.2-GCC-4.7.2                                     10) zlib/1.2.7-goolf-1.4.10
    3) OpenMPI/1.6.4-GCC-4.7.2                                   11) Szip/2.1-goolf-1.4.10
    4) gompi/1.4.10                                              12) HDF5/1.8.10-patch1-goolf-1.4.10
    5) OpenBLAS/0.2.6-gompi-1.4.10-LAPACK-3.4.2                  13) netCDF/4.2.1.1-goolf-1.4.10
    6) FFTW/3.3.3-gompi-1.4.10                                   14) netCDF-Fortran/4.2-goolf-1.4.10
    7) ScaLAPACK/2.0.2-gompi-1.4.10-OpenBLAS-0.2.6-LAPACK-3.4.2  15) WRF/3.5.1-goolf-1.4.10-dmpar
    8) goolf/1.4.10

For more information, see the other topics discussed in the documentation (see :ref:`contents`).

