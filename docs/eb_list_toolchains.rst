
.. _Toolchains_Table:

Toolchains table
================

The list of toolchains can easily be obtained with::

  $ eb --list-toolchains
  List of known toolchains (toolchainname: module[,module...]):
  [...]

.. table: List of toolchains

==================   ========== ========= =================================
Toolchain            Components that comprise the toolchain
------------------   ------------------------------------------------------
Name                 Compilers  MPI stack Included Libraries
==================   ========== ========= =================================
ClangGCC             Clang/GCC
GCC                  GCC
cgmpich              Clang/GCC  MPICH
cgmpolf              Clang/GCC  MPICH     BLACS, OpenBLAS, ScaLAPACK, FFTW
cgmvapich2           Clang/GCC  MVAPICH2
cgmvolf              Clang/GCC  MVAPICH2  BLACS, OpenBLAS, ScaLAPACK, FFTW
cgompi               Clang/GCC  OpenMPI
cgoolf               Clang/GCC  OpenMPI   BLACS, OpenBLAS, ScaLAPACK, FFTW
dummy
foss                 GCC        OpenMPI   BLACS, OpenBLAS, ScaLAPACK, FFTW
gcccuda              GCC/CUDA
gimkl                GCC        impi      imkl
gmacml               GCC        MVAPICH2  BLACS, ACML, ScaLAPACK, FFTW
gmpich2              GCC        MPICH2
gmpolf               GCC        MPICH2    BLACS, OpenBLAS, ScaLAPACK, FFTW
gmvapich2            GCC        MVAPICH2
gmvolf               GCC        MVAPICH2  BLACS, OpenBLAS, ScaLAPACK, FFTW
goalf                GCC        OpenMPI   BLACS, ATLAS, ScaLAPACK, FFTW
gompi                GCC        OpenMPI
gompic               GCC/CUDA   OpenMPI
goolf                GCC        OpenMPI   BLACS, OpenBLAS, ScaLAPACK, FFTW
goolfc               GCC/CUDA   OpenMPI   BLACS, OpenBLAS, ScaLAPACK, FFTW
gqacml               GCC        QLogicMPI BLACS, ACML, ScaLAPACK, FFTW
iccifort             icc/ifort
ictce                icc/ifort  impi      imkl
iimpi                icc/ifort  impi
iiqmpi               icc/ifort  QLogicMPI
impmkl               icc/ifort  MPICH2    imkl
intel                icc/ifort  impi      imkl
iomkl                icc/ifort  OpenMPI   imkl
iqacml               icc/ifort  OpenMPI   BLACS, ACML, ScaLAPACK, FFTW
ismkl                icc/ifort  MPICH2    imkl
==================   ========== ========= =================================

