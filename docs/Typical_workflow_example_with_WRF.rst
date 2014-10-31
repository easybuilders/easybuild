
Typical workflow example: building and installing WRF
=====================================================

This section shows an example case of building Weather Research and Forecasting application,
which is a case of notable build complexity and much choice in how to provide the build:


Searching for available easyconfigs files
-----------------------------------------

$ eb -S WRF
== temporary log file in case of crash /tmp/easybuild-MdAp7p/easybuild-zEBJMk.log
== Searching (case-insensitive) for 'WRF' in /home/example/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
CFGS1=/home/example/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs/w/WRF
 * $CFGS1/WRF-3.3.1-goalf-1.1.0-no-OFED-dmpar.eb
 * $CFGS1/WRF-3.3.1-goolf-1.4.10-dmpar.eb
 * $CFGS1/WRF-3.3.1-ictce-3.2.2.u3-dmpar.eb
 * $CFGS1/WRF-3.3.1-ictce-5.3.0-dmpar.eb
 * $CFGS1/WRF-3.3.1_GCC-build_fix.patch
 * $CFGS1/WRF-3.3.1_known_problems.patch
 * $CFGS1/WRF-3.4-goalf-1.1.0-no-OFED-dmpar.eb
 * $CFGS1/WRF-3.4-goolf-1.4.10-dmpar.eb
 * $CFGS1/WRF-3.4-ictce-3.2.2.u3-dmpar.eb
 * $CFGS1/WRF-3.4-ictce-5.3.0-dmpar.eb
 * $CFGS1/WRF-3.4.1-ictce-5.3.0-dmpar.eb
 * $CFGS1/WRF-3.4.1-iqacml-3.7.3-dmpar.eb
 * $CFGS1/WRF-3.4.1_netCDF-Fortran_separate_path.patch
 * $CFGS1/WRF-3.4_known_problems.patch
 * $CFGS1/WRF-3.5-goolf-1.4.10-dmpar.eb
 * $CFGS1/WRF-3.5-ictce-4.1.13-dmpar.eb
 * $CFGS1/WRF-3.5-ictce-5.3.0-dmpar.eb
 * $CFGS1/WRF-3.5.1-goolf-1.4.10-dmpar.eb
 * $CFGS1/WRF-3.5.1-goolf-1.5.14-dmpar.eb
 * $CFGS1/WRF-3.5.1-ictce-4.1.13-dmpar.eb
 * $CFGS1/WRF-3.5.1-ictce-5.3.0-dmpar.eb
 * $CFGS1/WRF-3.5_known_problems.patch
 * $CFGS1/WRF-3.5_netCDF-Fortran_separate_path.patch
 * $CFGS1/WRF_FC-output-spec_fix.patch
 * $CFGS1/WRF_netCDF-Fortran_separate_path.patch
 * $CFGS1/WRF_no-GCC-graphite-loop-opts.patch
 * $CFGS1/WRF_parallel_build_fix.patch
 * $CFGS1/WRF_tests_limit-runtimes.patch
== temporary log file /tmp/easybuild-MdAp7p/easybuild-zEBJMk.log has been removed.
== temporary directory /tmp/easybuild-MdAp7p has been removed.


Getting an overview of planned installations
--------------------------------------------


  $ eb WRF-3.5.1-goolf-1.4.10-dmpar.eb -Dr
  == temporary log file in case of crash /tmp/easybuild-HqpcAZ/easybuild-uNzmpk.log
  Dry run: printing build status of easyconfigs and dependencies
  CFGS=/home/example/.local/easybuild/software/EasyBuild/1.15.2/lib/python2.7/site-packages/easybuild_easyconfigs-1.15.2.0-py2.7.egg/easybuild/easyconfigs
   * [x] $CFGS/g/GCC/GCC-4.7.2.eb (module: GCC/4.7.2)
   * [x] $CFGS/h/hwloc/hwloc-1.6.2-GCC-4.7.2.eb (module: hwloc/1.6.2-GCC-4.7.2)
   * [ ] $CFGS/o/OpenMPI/OpenMPI-1.6.4-GCC-4.7.2.eb (module: OpenMPI/1.6.4-GCC-4.7.2)
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



Installing a software stack
---------------------------

To make EasyBuild try and resolve dependencies, use the ``--robot/-r`` command line option, as follows::

  $ eb WRF-3.5.1-goolf-1.4.10-dmpar.eb --robot | egrep "building and installing|Build succeeded"
  == building and installing GCC/4.7.2...
  == building and installing hwloc/1.6.2-GCC-4.7.2...
  == building and installing OpenMPI/1.6.4-GCC-4.7.2...
  == building and installing gompi/1.4.10...
  == building and installing OpenBLAS/0.2.6-gompi-1.4.10-LAPACK-3.4.2...
  == building and installing FFTW/3.3.3-gompi-1.4.10...
  == building and installing ScaLAPACK/2.0.2-gompi-1.4.10-OpenBLAS-0.2.6-LAPACK-3.4.2...
  == building and installing goolf/1.4.10...
  == building and installing zlib/1.2.7-goolf-1.4.10...
  == building and installing Szip/2.1-goolf-1.4.10...
  == building and installing ncurses/5.9-goolf-1.4.10...
  == building and installing flex/2.5.37-goolf-1.4.10...
  == building and installing M4/1.4.16-goolf-1.4.10...
  == building and installing JasPer/1.900.1-goolf-1.4.10...
  == building and installing HDF5/1.8.10-patch1-goolf-1.4.10...
  == building and installing tcsh/6.18.01-goolf-1.4.10...
  == building and installing Bison/2.7-goolf-1.4.10...
  == building and installing Doxygen/1.8.3.1-goolf-1.4.10...
  == building and installing netCDF/4.2.1.1-goolf-1.4.10...
  == building and installing netCDF-Fortran/4.2-goolf-1.4.10...
  == building and installing WRF/3.5.1-goolf-1.4.10-dmpar...
  == Build succeeded for 21 out of 21


