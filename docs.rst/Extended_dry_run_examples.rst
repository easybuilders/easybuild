.. _extended_dry_run_examples:

Extended dry run: examples
==========================

Output examples for ``eb --extended-dry-run``/``eb -x``, see also :ref:`extended_dry_run`.

.. contents::
    :depth: 2
    :backlinks: none

.. _extended_dry_run_examples_make382_GCC482:

make v3.82 with GCC/4.8.2
-------------------------

.. code::

    $ eb make-3.82-GCC-4.8.2.eb -x
    == temporary log file in case of crash /tmp/eb-ksVC07/easybuild-MmAugb.log

    == processing EasyBuild easyconfig /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/m/make/make-3.82-GCC-4.8.2.eb

    Important note: the actual build & install procedure that will be performed may diverge
    (slightly) from what is outlined below, due to conditions in the easyblock which are
    incorrectly handled in a dry run.
    Any errors that may occur are ignored and reported as warnings, on a per-step basis.
    Please be aware of this, and only use the information below for quick debugging purposes.

    *** DRY RUN using 'ConfigureMake' easyblock (easybuild.easyblocks.generic.configuremake @ /home/example/eb/easybuild-easyblocks/easybuild/easyblocks/generic/configuremake.pyc) ***

    == building and installing make/3.82-GCC-4.8.2...
    fetching files... [DRY RUN]

    [fetch_step method]
    Available download URLs for sources/patches:
      * http://ftpmirror.gnu.org/make/$source

    List of sources:
      * make-3.82.tar.bz2 will be downloaded to /home/example/eb/sources/m/make/make-3.82.tar.bz2

    List of patches:
    (none)

    creating build dir, resetting environment... [DRY RUN]

    [check_readiness_step method]

    [make_builddir method]

    [reset_changes method]

    [handle_iterate_opts method]

    unpacking... [DRY RUN]

    [checksum_step method]
    * expected checksum for make-3.82.tar.bz2: (none)

    [extract_step method]
      running command "tar xjf /home/example/eb/sources/m/make/make-3.82.tar.bz2"
      (in /home/example/eb/build/make/3.82/GCC-4.8.2)

    patching... [DRY RUN]

    [patch_step method]

    preparing... [DRY RUN]

    [prepare_step method]
    Defining build environment, based on toolchain (options) and specified dependencies...

    Loading toolchain module...

    module load GCC/4.8.2

    Loading modules for dependencies...


    Full list of loaded modules:
      1) GCC/4.8.2

    Defining build environment...

      export CC="gcc"
      export CFLAGS="-O2"
      export CXX="g++"
      export CXXFLAGS="-O2"
      export F77="gfortran"
      export F90="gfortran"
      export F90FLAGS="-O2"
      export FFLAGS="-O2"
      export FLIBS="-lgfortran"
      export LDFLAGS="-L/home/example/eb/software/GCC/4.8.2/lib"
      export LIBS="-lm -lpthread"
      export OPTFLAGS="-O2"
      export PRECFLAGS=""

    configuring... [DRY RUN]

    [configure_step method]
      running command " ./configure --prefix=/home/example/eb/software/make/3.82-GCC-4.8.2 "
      (in /home/example/eb/build/make/3.82/GCC-4.8.2/make-3.82)

    building... [DRY RUN]

    [build_step method]
      running command " make -j 4 "
      (in /home/example/eb/build/make/3.82/GCC-4.8.2/make-3.82)

    testing... [DRY RUN]

    [test_step method]

    installing... [DRY RUN]

    [stage_install_step method]

    [make_installdir method]

    [install_step method]
      running command " make install "
      (in /home/example/eb/build/make/3.82/GCC-4.8.2/make-3.82)

    taking care of extensions... [DRY RUN]

    [extensions_step method]

    postprocessing... [DRY RUN]

    [post_install_step method]

    sanity checking... [DRY RUN]

    [sanity_check_step method]
    Sanity check paths - file ['files']
      * bin/make
    Sanity check paths - (non-empty) directory ['dirs']
      (none)
    Sanity check commands
      (none)

    cleaning up... [DRY RUN]

    [cleanup_step method]

    creating module... [DRY RUN]

    [make_module_step method]
    Generating module file /home/example/eb/modules/all/make/3.82-GCC-4.8.2, with contents:

        #%Module
        proc ModulesHelp { } {
            puts stderr { make-3.82: GNU version of make utility - Homepage: http://www.gnu.org/software/make/make.html
            }
        }
        
        module-whatis {Description: make-3.82: GNU version of make utility - Homepage: http://www.gnu.org/software/make/make.html}
        
        set root /home/example/eb/software/make/3.82-GCC-4.8.2
        
        conflict make
        
        if { ![ is-loaded GCC/4.8.2 ] } {
            module load GCC/4.8.2
        }
        
        setenv	EBROOTMAKE		"$root"
        setenv	EBVERSIONMAKE		"3.82"
        setenv	EBDEVELMAKE		"$root/easybuild/make-3.82-GCC-4.8.2-easybuild-devel"
        
        # Built with EasyBuild version 2.4.0
        

    permissions... [DRY RUN]

    [permissions_step method]

    packaging... [DRY RUN]

    [package_step method]

    == COMPLETED: Installation ended successfully

    Important note: the actual build & install procedure that will be performed may diverge
    (slightly) from what is outlined above, due to conditions in the easyblock which are
    incorrectly handled in a dry run.
    Any errors that may occur are ignored and reported as warnings, on a per-step basis.
    Please be aware of this, and only use the information above for quick debugging purposes.

    (no ignored errors during dry run)

    == Build succeeded for 1 out of 1
    == Temporary log file(s) /tmp/eb-ksVC07/easybuild-MmAugb.log* have been removed.
    == Temporary directory /tmp/eb-ksVC07 has been removed.


.. _extended_dry_run_examples_WRF361_intel2015a:

WRF v3.6.1 with intel/2015a
---------------------------

.. code::

    $ eb WRF-3.6.1-intel-2015a-dmpar.eb -x
    == temporary log file in case of crash /tmp/eb-Dh1wOp/easybuild-0bu9u9.log

    == processing EasyBuild easyconfig /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/w/WRF/WRF-3.6.1-intel-2015a-dmpar.eb

    Important note: the actual build & install procedure that will be performed may diverge
    (slightly) from what is outlined below, due to conditions in the easyblock which are
    incorrectly handled in a dry run.
    Any errors that may occur are ignored and reported as warnings, on a per-step basis.
    Please be aware of this, and only use the information below for quick debugging purposes.

    *** DRY RUN using 'EB_WRF' easyblock (easybuild.easyblocks.wrf @ /home/example/eb/easybuild-easyblocks/easybuild/easyblocks/w/wrf.py) ***

    == building and installing WRF/3.6.1-intel-2015a-dmpar...
    fetching files... [DRY RUN]

    [fetch_step method]
    Available download URLs for sources/patches:
      * http://www2.mmm.ucar.edu/wrf/src//$source
      * http://www.mmm.ucar.edu/wrf/src//$source

    List of sources:
      * WRFV3.6.1.TAR.gz will be downloaded to /home/example/eb/sources/w/WRF/WRFV3.6.1.TAR.gz

    List of patches:
      * WRF_parallel_build_fix.patch found at /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/w/WRF/WRF_parallel_build_fix.patch
      * WRF-3.6.1_netCDF-Fortran_separate_path.patch found at /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/w/WRF/WRF-3.6.1_netCDF-Fortran_separate_path.patch
      * WRF-3.6.1_known_problems.patch found at /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/w/WRF/WRF-3.6.1_known_problems.patch
      * WRF_tests_limit-runtimes.patch found at /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/w/WRF/WRF_tests_limit-runtimes.patch

    creating build dir, resetting environment... [DRY RUN]

    [check_readiness_step method]

    [make_builddir method]

    [reset_changes method]

    [handle_iterate_opts method]

    unpacking... [DRY RUN]

    [checksum_step method]
    * expected checksum for WRFV3.6.1.TAR.gz: (none)
    * expected checksum for WRF_parallel_build_fix.patch: (none)
    * expected checksum for WRF-3.6.1_netCDF-Fortran_separate_path.patch: (none)
    * expected checksum for WRF-3.6.1_known_problems.patch: (none)
    * expected checksum for WRF_tests_limit-runtimes.patch: (none)

    [extract_step method]
      running command "tar xzf /home/example/eb/sources/w/WRF/WRFV3.6.1.TAR.gz"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar)

    patching... [DRY RUN]

    [patch_step method]
    * applying patch file WRF_parallel_build_fix.patch
      running command "patch -b -p<derived> -i /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/w/WRF/WRF_parallel_build_fix.patch"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar)
    * applying patch file WRF-3.6.1_netCDF-Fortran_separate_path.patch
      running command "patch -b -p<derived> -i /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/w/WRF/WRF-3.6.1_netCDF-Fortran_separate_path.patch"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar)
    * applying patch file WRF-3.6.1_known_problems.patch
      running command "patch -b -p<derived> -i /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/w/WRF/WRF-3.6.1_known_problems.patch"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar)
    * applying patch file WRF_tests_limit-runtimes.patch
      running command "patch -b -p<derived> -i /home/example/eb/easybuild-easyconfigs/easybuild/easyconfigs/w/WRF/WRF_tests_limit-runtimes.patch"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar)

    preparing... [DRY RUN]

    [prepare_step method]
    Defining build environment, based on toolchain (options) and specified dependencies...

    Loading toolchain module...

    module load icc/2015.1.133-GCC-4.9.2 [SIMULATED]
    module load ifort/2015.1.133-GCC-4.9.2 [SIMULATED]
    module load impi/5.0.2.044-iccifort-2015.1.133-GCC-4.9.2 [SIMULATED]
    module load imkl/11.2.1.133-iimpi-7.2.3-GCC-4.9.2 [SIMULATED]
    module load intel/2015a [SIMULATED]

    Loading modules for dependencies...

    module load JasPer/1.900.1-intel-2015a [SIMULATED]
    module load netCDF/4.3.2-intel-2015a [SIMULATED]
    module load netCDF-Fortran/4.4.0-intel-2015a [SIMULATED]
    module load tcsh/6.18.01-intel-2015a [SIMULATED]

    Full list of loaded modules:
      (none)


    !!!
    !!! WARNING: Not all FFTW interface libraries ['fftw3xc_intel', 'mkl_intel_lp64', 'mkl_sequential', 'mkl_core'] are found in ['$EBROOTIMKL/mkl/lib/intel64', '$EBROOTIMKL/compiler/lib/intel64'], can't set $FFT_LIB.
    !!!

    Defining build environment...

      export BLACS_INC_DIR=""
      export BLACS_LIB_DIR=""
      export BLACS_MT_STATIC_LIBS="libmkl_blacs_intelmpi_lp64.a"
      export BLACS_STATIC_LIBS="libmkl_blacs_intelmpi_lp64.a"
      export BLAS_INC_DIR=""
      export BLAS_LAPACK_INC_DIR=""
      export BLAS_LAPACK_LIB_DIR=""
      export BLAS_LAPACK_MT_STATIC_LIBS="libmkl_intel_lp64.a,libmkl_intel_thread.a,libmkl_core.a,libiomp5.a,libpthread.a"
      export BLAS_LAPACK_STATIC_LIBS="libmkl_intel_lp64.a,libmkl_sequential.a,libmkl_core.a"
      export BLAS_LIB_DIR=""
      export BLAS_MT_STATIC_LIBS="libmkl_intel_lp64.a,libmkl_intel_thread.a,libmkl_core.a,libiomp5.a,libpthread.a"
      export BLAS_STATIC_LIBS="libmkl_intel_lp64.a,libmkl_sequential.a,libmkl_core.a"
      export CC="icc"
      export CFLAGS="-O2 -ftz -fp-speculation=safe -fp-model source"
      export CPPFLAGS=""
      export CXX="icpc"
      export CXXFLAGS="-O2 -ftz -fp-speculation=safe -fp-model source"
      export F77="ifort"
      export F90="ifort"
      export F90FLAGS="-O2 -ftz -fp-speculation=safe -fp-model source"
      export FFLAGS="-O2 -ftz -fp-speculation=safe -fp-model source"
      export FFTW_INC_DIR=""
      export FFTW_LIB_DIR=""
      export FFTW_STATIC_LIBS=""
      export FFT_INC_DIR=""
      export FFT_LIB_DIR=""
      export FFT_STATIC_LIBS=""
      export I_MPI_CC="icc"
      export I_MPI_CXX="icpc"
      export I_MPI_F77="ifort"
      export I_MPI_F90="ifort"
      export LAPACK_INC_DIR=""
      export LAPACK_LIB_DIR=""
      export LAPACK_MT_STATIC_LIBS="libmkl_intel_lp64.a,libmkl_intel_thread.a,libmkl_core.a,libiomp5.a,libpthread.a"
      export LAPACK_STATIC_LIBS="libmkl_intel_lp64.a,libmkl_sequential.a,libmkl_core.a"
      export LDFLAGS=""
      export LIBBLACS="-Wl,-Bstatic -Wl,--start-group -lmkl_blacs_intelmpi_lp64 -Wl,--end-group -Wl,-Bdynamic"
      export LIBBLACS_MT="-Wl,-Bstatic -Wl,--start-group -lmkl_blacs_intelmpi_lp64 -Wl,--end-group -Wl,-Bdynamic"
      export LIBBLAS="-Wl,-Bstatic -Wl,--start-group -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -Wl,--end-group -Wl,-Bdynamic"
      export LIBBLAS_MT="-Wl,-Bstatic -Wl,--start-group -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -Wl,--end-group -Wl,-Bdynamic -liomp5 -lpthread"
      export LIBFFT=""
      export LIBLAPACK="-Wl,-Bstatic -Wl,--start-group -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -Wl,--end-group -Wl,-Bdynamic"
      export LIBLAPACK_MT="-Wl,-Bstatic -Wl,--start-group -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -Wl,--end-group -Wl,-Bdynamic -liomp5 -lpthread"
      export LIBLAPACK_MT_ONLY="-Wl,-Bstatic -Wl,--start-group -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -Wl,--end-group -Wl,-Bdynamic -liomp5 -lpthread"
      export LIBLAPACK_ONLY="-Wl,-Bstatic -Wl,--start-group -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -Wl,--end-group -Wl,-Bdynamic"
      export LIBS="-liomp5 -lpthread"
      export LIBSCALAPACK="-Wl,-Bstatic -Wl,--start-group -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -Wl,--end-group -Wl,-Bdynamic"
      export LIBSCALAPACK_MT="-Wl,-Bstatic -Wl,--start-group -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -Wl,--end-group -Wl,-Bdynamic -liomp5 -lpthread"
      export LIBSCALAPACK_MT_ONLY="-Wl,-Bstatic -Wl,--start-group -lmkl_scalapack_lp64 -Wl,--end-group -Wl,-Bdynamic -liomp5 -lpthread"
      export LIBSCALAPACK_ONLY="-Wl,-Bstatic -Wl,--start-group -lmkl_scalapack_lp64 -Wl,--end-group -Wl,-Bdynamic"
      export MPICC="mpicc"
      export MPICH_CC="icc"
      export MPICH_CXX="icpc"
      export MPICH_F77="ifort"
      export MPICH_F90="ifort"
      export MPICXX="mpicxx"
      export MPIF77="mpif77"
      export MPIF90="mpif90"
      export MPI_INC_DIR=""
      export MPI_LIB_DIR=""
      export MPI_LIB_SHARED=""
      export MPI_LIB_STATIC=""
      export OPTFLAGS="-O2"
      export PRECFLAGS="-ftz -fp-speculation=safe -fp-model source"
      export SCALAPACK_INC_DIR=""
      export SCALAPACK_LIB_DIR=""
      export SCALAPACK_MT_STATIC_LIBS="libmkl_scalapack_lp64.a,libmkl_blacs_intelmpi_lp64.a,libmkl_intel_lp64.a,libmkl_intel_thread.a,libmkl_core.a,libiomp5.a,libpthread.a"
      export SCALAPACK_STATIC_LIBS="libmkl_scalapack_lp64.a,libmkl_blacs_intelmpi_lp64.a,libmkl_intel_lp64.a,libmkl_sequential.a,libmkl_core.a"

    configuring... [DRY RUN]

    [configure_step method]
      export NETCDF="$EBROOTNETCDF"
      export NETCDFF="$EBROOTNETCDFMINFORTRAN"
      export JASPERINC="$EBROOTJASPER/include"
      export JASPERLIB="$EBROOTJASPER/lib"
      export WRFIO_NCD_LARGE_FILE_SUPPORT="1"
    Perl script patched: arch/Config_new.pl
      running interactive command "./configure"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar/WRF-3.6.1)
    applying regex substitutions to file configure.wrf
      * regex pattern '^(DM_FC\s*=\s*).*$', replacement string '\1 mpif90'
      * regex pattern '^(DM_CC\s*=\s*).*$', replacement string '\1 mpicc -DMPI2_SUPPORT'
      * regex pattern '^(SFC\s*=\s*).*$', replacement string '\1 ifort'
      * regex pattern '^(SCC\s*=\s*).*$', replacement string '\1 icc'
      * regex pattern '^(CCOMP\s*=\s*).*$', replacement string '\1 icc'
    applying regex substitutions to file configure.wrf
      * regex pattern '^(FCOPTIM.*)(\s-O3)(\s.*)$', replacement string '\1 -O2 -ftz -fp-speculation=safe -fp-model source \3'
      * regex pattern '^(CFLAGS_LOCAL.*)(\s-O3)(\s.*)$', replacement string '\1 -O2 -ftz -fp-speculation=safe -fp-model source \3'

    building... [DRY RUN]

    [build_step method]
      running command "tcsh ./compile -j 4 wrf"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar/WRF-3.6.1)
      running command "tcsh ./compile -j 4 em_real"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar/WRF-3.6.1)
      running command "tcsh ./compile -j 4 em_b_wave"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar/WRF-3.6.1)

    testing... [DRY RUN]

    [test_step method]
      export I_MPI_MPD_TMPDIR="/tmp/eb-Dh1wOp"
      export PBS_ENVIRONMENT="PBS_BATCH_MPI"
      export I_MPI_PROCESS_MANAGER="mpd"
    file written: /tmp/eb-Dh1wOp/mpi_cmd_for-nzyh5V/mpdboot
    file written: /tmp/eb-Dh1wOp/mpi_cmd_for-nzyh5V/nodes
      export I_MPI_MPD_TMPDIR="/tmp/eb-Dh1wOp"
      export PBS_ENVIRONMENT="PBS_BATCH_MPI"
      export I_MPI_PROCESS_MANAGER="mpd"
    file written: /tmp/eb-Dh1wOp/mpi_cmd_for-hIOEd_/mpdboot
    file written: /tmp/eb-Dh1wOp/mpi_cmd_for-hIOEd_/nodes

    installing... [DRY RUN]

    [stage_install_step method]

    [make_installdir method]

    [install_step method]

    taking care of extensions... [DRY RUN]

    [extensions_step method]

    postprocessing... [DRY RUN]

    [post_install_step method]

    sanity checking... [DRY RUN]

    [sanity_check_step method]
    Sanity check paths - file ['files']
      * WRFV3/main/ideal.exe
      * WRFV3/main/libwrflib.a
      * WRFV3/main/ndown.exe
      * WRFV3/main/nup.exe
      * WRFV3/main/real.exe
      * WRFV3/main/tc.exe
      * WRFV3/main/wrf.exe
    Sanity check paths - (non-empty) directory ['dirs']
      * WRFV3/main
      * WRFV3/run
    Sanity check commands
      (none)

    cleaning up... [DRY RUN]

    [cleanup_step method]

    creating module... [DRY RUN]

    [make_module_step method]
    Generating module file /home/example/eb/modules/all/WRF/3.6.1-intel-2015a-dmpar, with contents:

        #%Module
        proc ModulesHelp { } {
            puts stderr { The Weather Research and Forecasting (WRF) Model is a next-generation mesoscale
         numerical weather prediction system designed to serve both operational forecasting and atmospheric
         research needs. - Homepage: http://www.wrf-model.org
            }
        }
        
        module-whatis {Description: The Weather Research and Forecasting (WRF) Model is a next-generation mesoscale
         numerical weather prediction system designed to serve both operational forecasting and atmospheric
         research needs. - Homepage: http://www.wrf-model.org}
        
        set root /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar
        
        conflict WRF
        
        if { ![ is-loaded intel/2015a ] } {
            module load intel/2015a
        }
        
        if { ![ is-loaded JasPer/1.900.1-intel-2015a ] } {
            module load JasPer/1.900.1-intel-2015a
        }
        
        if { ![ is-loaded netCDF/4.3.2-intel-2015a ] } {
            module load netCDF/4.3.2-intel-2015a
        }
        
        if { ![ is-loaded netCDF-Fortran/4.4.0-intel-2015a ] } {
            module load netCDF-Fortran/4.4.0-intel-2015a
        }
        
        setenv	EBROOTWRF		"$root"
        setenv	EBVERSIONWRF		"3.6.1"
        setenv	EBDEVELWRF		"$root/easybuild/WRF-3.6.1-intel-2015a-dmpar-easybuild-devel"
        
        setenv	NETCDF		"$EBROOTNETCDF"
        setenv	NETCDFF		"$EBROOTNETCDFMINFORTRAN"
        # Built with EasyBuild version 2.4.0
        

    permissions... [DRY RUN]

    [permissions_step method]

    packaging... [DRY RUN]

    [package_step method]

    == COMPLETED: Installation ended successfully

    Important note: the actual build & install procedure that will be performed may diverge
    (slightly) from what is outlined above, due to conditions in the easyblock which are
    incorrectly handled in a dry run.
    Any errors that may occur are ignored and reported as warnings, on a per-step basis.
    Please be aware of this, and only use the information above for quick debugging purposes.

    (no ignored errors during dry run)

    == Build succeeded for 1 out of 1
    == Temporary log file(s) /tmp/eb-Dh1wOp/easybuild-0bu9u9.log* have been removed.
    == Temporary directory /tmp/eb-Dh1wOp has been removed.

