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
  CFGS1=/home/example/.local/easybuild/software/EasyBuild/4.1.1/easybuild/easyconfigs
   * $CFGS1/w/WPS/WPS-4.0.1_find-wrfdir.patch
   * $CFGS1/w/WPS/WPS-4.0.2_find-wrfdir.patch
   [ . . . ]
   * $CFGS1/w/WRF/WRF-4.0.1-intel-2018b-dmpar.eb
   * $CFGS1/w/WRF/WRF-4.0.2-foss-2018b-dmpar.eb
   [ . . . ]
  
  Note: 16 matching archived easyconfig(s) found, use --consider-archived-easyconfigs to see them



Various easyconfig files are found: for different versions of WRF (e.g., v4.0.1 and v4.4.0.2),
for different (versions of) compiler toolchains (e.g., foss 2018b, intel 2018b), etc.

For the remainder of this example, we will use the available ``WRF-4.0.2-foss-2018b-dmpar.eb``
easyconfig file to specify to EasyBuild to build and install
WRF v4.0.2 using version 2018b of the ``foss`` toolchain, which is one of the :ref:`common_toolchains`.

See :ref:`toolchains_table` for a list of available toolchains. The ``foss`` toolchain
stands for ``GCC, OpenMPI, OpenBLAS/LAPACK, ScaLAPACK, and FFTW``.  The ``foss`` toolchain
is one of the :ref:`common_toolchains`.

Getting an overview of planned installations
--------------------------------------------

To get an overview of the software that EasyBuild is going to build and install
we can use the ``--dry-run``/``-D`` (see :ref:`get_an_overview`) command line option.
This will show a list of easyconfig files
that will be used, together with the module files that will be installed,
as well as their current availability (``[x]`` marks available modules).

Note that EasyBuild will take care of all of the dependencies of WRF as well,
and can even install the compiler toolchain as well if the corresponding modules are not available yet::

  $ eb WRF-4.0.2-foss-2018b-dmpar.eb -Dr
  == temporary log file in case of crash /tmp/eb-eEnBF5/easybuild-pvrvNP.log
  Dry run: printing build status of easyconfigs and dependencies
  CFGS=/home/example/.local/easybuild/software/EasyBuild/4.1.1/easybuild/easyconfigs
   * [x] $CFGS/m/M4/M4-1.4.18.eb (module: M4/1.4.18)
   * [x] $CFGS/z/zlib/zlib-1.2.11.eb (module: zlib/1.2.11)
   * [x] $CFGS/h/help2man/help2man-1.47.4.eb (module: help2man/1.47.4)
   * [x] $CFGS/m/M4/M4-1.4.17.eb (module: M4/1.4.17)
   * [x] $CFGS/b/Bison/Bison-3.0.4.eb (module: Bison/3.0.4)
   * [x] $CFGS/f/flex/flex-2.6.4.eb (module: flex/2.6.4)
   * [x] $CFGS/b/binutils/binutils-2.30.eb (module: binutils/2.30)
   * [x] $CFGS/g/GCCcore/GCCcore-7.3.0.eb (module: GCCcore/7.3.0)
   * [x] $CFGS/h/help2man/help2man-1.47.4-GCCcore-7.3.0.eb (module: help2man/1.47.4-GCCcore-7.3.0)
   * [x] $CFGS/m/M4/M4-1.4.18-GCCcore-7.3.0.eb (module: M4/1.4.18-GCCcore-7.3.0)
   * [x] $CFGS/z/zlib/zlib-1.2.11-GCCcore-7.3.0.eb (module: zlib/1.2.11-GCCcore-7.3.0)
   * [x] $CFGS/b/Bison/Bison-3.0.4-GCCcore-7.3.0.eb (module: Bison/3.0.4-GCCcore-7.3.0)
   * [x] $CFGS/b/Bison/Bison-3.0.5-GCCcore-7.3.0.eb (module: Bison/3.0.5-GCCcore-7.3.0)
   * [x] $CFGS/f/flex/flex-2.6.4-GCCcore-7.3.0.eb (module: flex/2.6.4-GCCcore-7.3.0)
   * [x] $CFGS/b/binutils/binutils-2.30-GCCcore-7.3.0.eb (module: binutils/2.30-GCCcore-7.3.0)
   * [ ] $CFGS/n/ncurses/ncurses-6.1-GCCcore-7.3.0.eb (module: ncurses/6.1-GCCcore-7.3.0)
   * [ ] $CFGS/c/CMake/CMake-3.11.4-GCCcore-7.3.0.eb (module: CMake/3.11.4-GCCcore-7.3.0)
   * [x] $CFGS/a/Autoconf/Autoconf-2.69-GCCcore-7.3.0.eb (module: Autoconf/2.69-GCCcore-7.3.0)
   * [x] $CFGS/a/Automake/Automake-1.16.1-GCCcore-7.3.0.eb (module: Automake/1.16.1-GCCcore-7.3.0)
   * [x] $CFGS/g/GCC/GCC-7.3.0-2.30.eb (module: GCC/7.3.0-2.30)
   * [ ] $CFGS/p/pkg-config/pkg-config-0.29.2-GCCcore-7.3.0.eb (module: pkg-config/0.29.2-GCCcore-7.3.0)
   * [ ] $CFGS/c/cURL/cURL-7.60.0-GCCcore-7.3.0.eb (module: cURL/7.60.0-GCCcore-7.3.0)
   * [x] $CFGS/l/libtool/libtool-2.4.6-GCCcore-7.3.0.eb (module: libtool/2.4.6-GCCcore-7.3.0)
   * [ ] $CFGS/s/Szip/Szip-2.1.1-GCCcore-7.3.0.eb (module: Szip/2.1.1-GCCcore-7.3.0)
   * [x] $CFGS/o/OpenBLAS/OpenBLAS-0.3.1-GCC-7.3.0-2.30.eb (module: OpenBLAS/0.3.1-GCC-7.3.0-2.30)
   * [ ] $CFGS/t/tcsh/tcsh-6.20.00-GCCcore-7.3.0.eb (module: tcsh/6.20.00-GCCcore-7.3.0)
   * [ ] $CFGS/j/JasPer/JasPer-2.0.14-GCCcore-7.3.0.eb (module: JasPer/2.0.14-GCCcore-7.3.0)
   * [x] $CFGS/a/Autotools/Autotools-20180311-GCCcore-7.3.0.eb (module: Autotools/20180311-GCCcore-7.3.0)
   * [ ] $CFGS/d/Doxygen/Doxygen-1.8.14-GCCcore-7.3.0.eb (module: Doxygen/1.8.14-GCCcore-7.3.0)
   * [x] $CFGS/n/numactl/numactl-2.0.11-GCCcore-7.3.0.eb (module: numactl/2.0.11-GCCcore-7.3.0)
   * [x] $CFGS/x/xorg-macros/xorg-macros-1.19.2-GCCcore-7.3.0.eb (module: xorg-macros/1.19.2-GCCcore-7.3.0)
   * [x] $CFGS/l/libpciaccess/libpciaccess-0.14-GCCcore-7.3.0.eb (module: libpciaccess/0.14-GCCcore-7.3.0)
   * [x] $CFGS/n/ncurses/ncurses-6.0.eb (module: ncurses/6.0)
   * [x] $CFGS/g/gettext/gettext-0.19.8.1.eb (module: gettext/0.19.8.1)
   * [x] $CFGS/x/XZ/XZ-5.2.4-GCCcore-7.3.0.eb (module: XZ/5.2.4-GCCcore-7.3.0)
   * [x] $CFGS/l/libxml2/libxml2-2.9.8-GCCcore-7.3.0.eb (module: libxml2/2.9.8-GCCcore-7.3.0)
   * [x] $CFGS/h/hwloc/hwloc-1.11.10-GCCcore-7.3.0.eb (module: hwloc/1.11.10-GCCcore-7.3.0)
   * [x] $CFGS/o/OpenMPI/OpenMPI-3.1.1-GCC-7.3.0-2.30.eb (module: OpenMPI/3.1.1-GCC-7.3.0-2.30)
   * [x] $CFGS/g/gompi/gompi-2018b.eb (module: gompi/2018b)
   * [x] $CFGS/f/FFTW/FFTW-3.3.8-gompi-2018b.eb (module: FFTW/3.3.8-gompi-2018b)
   * [x] $CFGS/s/ScaLAPACK/ScaLAPACK-2.0.2-gompi-2018b-OpenBLAS-0.3.1.eb (module: ScaLAPACK/2.0.2-gompi-2018b-OpenBLAS-0.3.1)
   * [x] $CFGS/f/foss/foss-2018b.eb (module: foss/2018b)
   * [ ] $CFGS/h/HDF5/HDF5-1.10.2-foss-2018b.eb (module: HDF5/1.10.2-foss-2018b)
   * [ ] $CFGS/n/netCDF/netCDF-4.6.1-foss-2018b.eb (module: netCDF/4.6.1-foss-2018b)
   * [ ] $CFGS/n/netCDF-Fortran/netCDF-Fortran-4.4.4-foss-2018b.eb (module: netCDF-Fortran/4.4.4-foss-2018b)
   * [ ] $CFGS/w/WRF/WRF-4.0.2-foss-2018b-dmpar.eb (module: WRF/4.0.2-foss-2018b-dmpar)
  == Temporary log file(s) /tmp/eb-eEnBF5/easybuild-pvrvNP.log* have been removed.
  == Temporary directory /tmp/eb-eEnBF5 has been removed.



Installing a software stack
---------------------------

To make EasyBuild build and install WRF, including all of its dependencies, a **single command** is sufficient.

By using the ``--robot``/``-r`` (see :ref:`use_robot`) command line option,
we enable dependency resolution such that the entire software stack is handled::

  $ eb WRF-4.0.2-foss-2018b-dmpar.eb --robot
  == temporary log file in case of crash /tmp/eb-LfQa8b/easybuild-TBXLTy.log
  == resolving dependencies ...
  == processing EasyBuild easyconfig /home/example/.local/easybuild/software/EasyBuild/4.1.1/easybuild/easyconfigs/n/ncurses/ncurses-6.1-GCCcore-7.3.0.eb
  == building and installing ncurses/6.1-GCCcore-7.3.0...
  [...]
  == building and installing tcsh/6.20.00-GCCcore-7.3.0...
  [...]
  == building and installing CMake/3.11.4-GCCcore-7.3.0...
  [...]
  == building and installing JasPer/2.0.14-GCCcore-7.3.0...
  [...]
  == building and installing pkg-config/0.29.2-GCCcore-7.3.0...
  [...]
  == building and installing Doxygen/1.8.14-GCCcore-7.3.0...
  [...]
  == building and installing cURL/7.60.0-GCCcore-7.3.0...
  [...]
  == building and installing Szip/2.1.1-GCCcore-7.3.0...
  [...]
  == building and installing HDF5/1.10.2-foss-2018b...
  [...]
  == building and installing netCDF/4.6.1-foss-2018b...
  [...]
  == building and installing netCDF-Fortran/4.4.4-foss-2018b...
  [...]
  == building and installing WRF/4.0.2-foss-2018b-dmpar...
  [...]
  == Build succeeded for 12 out of 12
  == Temporary log file(s) /tmp/eb-LfQa8b/easybuild-TBXLTy.log* have been removed.
  == Temporary directory /tmp/eb-LfQa8b has been removed.


Once the installation has succeeded, modules will be available for WRF and all of its dependencies::

  $ module load WRF
  $ module list
  $ module list
  
  Currently Loaded Modules:
    1) EasyBuild/4.1.1                  13) gompi/2018b
    2) GCCcore/7.3.0                    14) FFTW/3.3.8-gompi-2018b
    3) zlib/1.2.11-GCCcore-7.3.0        15) ScaLAPACK/2.0.2-gompi-2018b-OpenBLAS-0.3.1
    4) binutils/2.30-GCCcore-7.3.0      16) foss/2018b
    5) GCC/7.3.0-2.30                   17) JasPer/2.0.14-GCCcore-7.3.0
    6) numactl/2.0.11-GCCcore-7.3.0     18) Szip/2.1.1-GCCcore-7.3.0
    7) XZ/5.2.4-GCCcore-7.3.0           19) HDF5/1.10.2-foss-2018b
    8) libxml2/2.9.8-GCCcore-7.3.0      20) cURL/7.60.0-GCCcore-7.3.0
    9) libpciaccess/0.14-GCCcore-7.3.0  21) netCDF/4.6.1-foss-2018b
   10) hwloc/1.11.10-GCCcore-7.3.0      22) netCDF-Fortran/4.4.4-foss-2018b
   11) OpenMPI/3.1.1-GCC-7.3.0-2.30     23) WRF/4.0.2-foss-2018b-dmpar
   12) OpenBLAS/0.3.1-GCC-7.3.0-2.30

For more information, see the other topics discussed in the documentation (see :ref:`contents`).

