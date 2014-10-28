
Toolchains table
================


The list of toolchains can easily be obtained with::

  $ eb --list-toolchains
  List of known toolchains (toolchainname: module[,module...]):
  [...]


.. XXX - UPDATE BY VERSION

.. table List of toolchains as of version 1.15.2

 ==================   ======================================================
 Toolchain name        Components that comprise the toolchain
 ==================   ======================================================

	ClangGCC      Clang, GCC
	GCC           GCC
	cgmpich       ClangGCC, MPICH
	cgmpolf       BLACS, ClangGCC, FFTW, MPICH, OpenBLAS, ScaLAPACK
	cgmvapich2    ClangGCC, MVAPICH2
	cgmvolf       BLACS, ClangGCC, FFTW, MVAPICH2, OpenBLAS, ScaLAPACK
	cgompi        ClangGCC, OpenMPI
	cgoolf        BLACS, ClangGCC, FFTW, OpenBLAS, OpenMPI, ScaLAPACK
	dummy:
	foss          BLACS, FFTW, GCC, OpenBLAS, OpenMPI, ScaLAPACK
	gcccuda       CUDA, GCC
	gimkl         GCC, imkl, impi
	gmacml        ACML, BLACS, FFTW, GCC, MVAPICH2, ScaLAPACK
	gmpich2       GCC, MPICH2
	gmpolf        BLACS, FFTW, GCC, MPICH2, OpenBLAS, ScaLAPACK
	gmvapich2     GCC, MVAPICH2
	gmvolf        BLACS, FFTW, GCC, MVAPICH2, OpenBLAS, ScaLAPACK
	goalf         ATLAS, BLACS, FFTW, GCC, OpenMPI, ScaLAPACK
	gompi         GCC, OpenMPI
	gompic        CUDA, GCC, OpenMPI
	goolf         BLACS, FFTW, GCC, OpenBLAS, OpenMPI, ScaLAPACK
	goolfc        BLACS, CUDA, FFTW, GCC, OpenBLAS, OpenMPI, ScaLAPACK
	gqacml        ACML, BLACS, FFTW, GCC, QLogicMPI, ScaLAPACK
	iccifort      icc, ifort
	ictce         icc, ifort, imkl, impi
	iimpi         icc, ifort, impi
	iiqmpi        QLogicMPI, icc, ifort
	impmkl        MPICH2, icc, ifort, imkl
	intel         icc, ifort, imkl, impi
	iomkl         OpenMPI, icc, ifort, imkl
	iqacml        ACML, BLACS, FFTW, QLogicMPI, ScaLAPACK, icc, ifort
	ismkl         MPICH2, icc, ifort, imkl

