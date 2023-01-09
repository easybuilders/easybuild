.. _vsd_list_toolchains:

List of known toolchains
------------------------

===================    ================    =============    =========================    ========
Name                   Compiler(s)         MPI              Linear algebra               FFT
===================    ================    =============    =========================    ========
**cgmpich**            Clang, GCC          MPICH            *(none)*                     *(none)*
**cgmpolf**            Clang, GCC          MPICH            OpenBLAS, ScaLAPACK          FFTW
**cgmvapich2**         Clang, GCC          MVAPICH2         *(none)*                     *(none)*
**cgmvolf**            Clang, GCC          MVAPICH2         OpenBLAS, ScaLAPACK          FFTW
**cgompi**             Clang, GCC          OpenMPI          *(none)*                     *(none)*
**cgoolf**             Clang, GCC          OpenMPI          OpenBLAS, ScaLAPACK          FFTW
**ClangGCC**           Clang, GCC          *(none)*         *(none)*                     *(none)*
**CrayCCE**            PrgEnv-cray         cray-mpich       cray-libsci                  *(none)*
**CrayGNU**            PrgEnv-gnu          cray-mpich       cray-libsci                  *(none)*
**CrayIntel**          PrgEnv-intel        cray-mpich       cray-libsci                  *(none)*
**CrayPGI**            PrgEnv-pgi          cray-mpich       cray-libsci                  *(none)*
**FCC**                lang                *(none)*         *(none)*                     *(none)*
**ffmpi**              FCC                 *(none)*         *(none)*                     *(none)*
**foss**               GCC                 OpenMPI          OpenBLAS, ScaLAPACK          FFTW
**fosscuda**           GCC, CUDA           OpenMPI          OpenBLAS, ScaLAPACK          FFTW
**Fujitsu**            FCC                 *(none)*         *(none)*                     FFTW
**GCC**                GCC                 *(none)*         *(none)*                     *(none)*
**GCCcore**            GCCcore             *(none)*         *(none)*                     *(none)*
**gcccuda**            GCC, CUDA           *(none)*         *(none)*                     *(none)*
**gfbf**               GCC                 *(none)*         FlexiBLAS                    FFTW
**gimkl**              GCC                 impi             imkl                         imkl
**gimpi**              GCC                 impi             *(none)*                     *(none)*
**gimpic**             GCC, CUDA           impi             *(none)*                     *(none)*
**giolf**              GCC                 impi             OpenBLAS, ScaLAPACK          FFTW
**giolfc**             GCC, CUDA           impi             OpenBLAS, ScaLAPACK          FFTW
**gmacml**             GCC                 MVAPICH2         ACML, ScaLAPACK              FFTW
**gmkl**               GCC                 *(none)*         imkl                         imkl
**gmklc**              GCC, CUDA           *(none)*         imkl                         imkl
**gmpich**             GCC                 MPICH            *(none)*                     *(none)*
**gmpich2**            GCC                 MPICH2           *(none)*                     *(none)*
**gmpit**              GCC                 MPItrampoline    *(none)*                     *(none)*
**gmpolf**             GCC                 MPICH            OpenBLAS, ScaLAPACK          FFTW
**gmvapich2**          GCC                 MVAPICH2         *(none)*                     *(none)*
**gmvolf**             GCC                 MVAPICH2         OpenBLAS, ScaLAPACK          FFTW
**GNU**                GCC                 *(none)*         *(none)*                     *(none)*
**goalf**              GCC                 OpenMPI          ATLAS, ScaLAPACK             FFTW
**gobff**              GCC                 OpenMPI          BLIS, libFLAME, ScaLAPACK    FFTW
**goblf**              GCC                 OpenMPI          BLIS, LAPACK, ScaLAPACK      FFTW
**gofbf**              GCC                 OpenMPI          FlexiBLAS, ScaLAPACK         FFTW
**golf**               GCC                 *(none)*         OpenBLAS                     FFTW
**golfc**              GCC, CUDA           *(none)*         OpenBLAS                     FFTW
**gomkl**              GCC                 OpenMPI          imkl                         imkl
**gomklc**             GCC, CUDA           OpenMPI          imkl                         imkl
**gompi**              GCC                 OpenMPI          *(none)*                     *(none)*
**gompic**             GCC, CUDA           OpenMPI          *(none)*                     *(none)*
**goolf**              GCC                 OpenMPI          OpenBLAS, ScaLAPACK          FFTW
**goolfc**             GCC, CUDA           OpenMPI          OpenBLAS, ScaLAPACK          FFTW
**gpsmpi**             GCC                 psmpi            *(none)*                     *(none)*
**gpsolf**             GCC                 psmpi            OpenBLAS, ScaLAPACK          FFTW
**gqacml**             GCC                 QLogicMPI        ACML, ScaLAPACK              FFTW
**gsmpi**              GCC                 SpectrumMPI      *(none)*                     *(none)*
**gsolf**              GCC                 SpectrumMPI      OpenBLAS, ScaLAPACK          FFTW
**iccifort**           icc, ifort          *(none)*         *(none)*                     *(none)*
**iccifortcuda**       icc, ifort, CUDA    *(none)*         *(none)*                     *(none)*
**ictce**              icc, ifort          impi             imkl                         imkl
**iibff**              icc, ifort          impi             BLIS, libFLAME, ScaLAPACK    FFTW
**iimkl**              icc, ifort          *(none)*         imkl                         imkl
**iimklc**             icc, ifort          *(none)*         imkl                         imkl
**iimpi**              icc, ifort          impi             *(none)*                     *(none)*
**iimpic**             icc, ifort, CUDA    impi             *(none)*                     *(none)*
**iiqmpi**             icc, ifort          QLogicMPI        *(none)*                     *(none)*
**impich**             icc, ifort          MPICH            *(none)*                     *(none)*
**impmkl**             icc, ifort          MPICH            imkl                         imkl
**intel**              icc, ifort          impi             imkl                         imkl
**intel-compilers**    intel-compilers     *(none)*         *(none)*                     *(none)*
**intel-para**         icc, ifort          psmpi            imkl                         imkl
**intelcuda**          icc, ifort, CUDA    impi             imkl                         imkl
**iomkl**              icc, ifort          OpenMPI          imkl                         imkl
**iomklc**             icc, ifort, CUDA    OpenMPI          imkl                         imkl
**iompi**              icc, ifort          OpenMPI          *(none)*                     *(none)*
**iompic**             icc, ifort, CUDA    OpenMPI          *(none)*                     *(none)*
**ipsmpi**             icc, ifort          psmpi            *(none)*                     *(none)*
**iqacml**             icc, ifort          QLogicMPI        ACML, ScaLAPACK              FFTW
**ismkl**              icc, ifort          MPICH2           imkl                         imkl
**NVHPC**              NVHPC               *(none)*         *(none)*                     *(none)*
**nvofbf**             NVHPC               OpenMPI          FlexiBLAS, ScaLAPACK         FFTW
**nvompi**             NVHPC               OpenMPI          *(none)*                     *(none)*
**nvompic**            NVHPC               OpenMPI          *(none)*                     *(none)*
**nvpsmpi**            NVHPC               psmpi            *(none)*                     *(none)*
**nvpsmpic**           NVHPC               psmpi            *(none)*                     *(none)*
**PGI**                PGI                 *(none)*         *(none)*                     *(none)*
**pmkl**               PGI                 *(none)*         imkl                         imkl
**pomkl**              PGI                 OpenMPI          imkl                         imkl
**pompi**              PGI                 OpenMPI          *(none)*                     *(none)*
**system**             *(none)*            *(none)*         *(none)*                     *(none)*
**xlcxlf**             xlc, xlf            *(none)*         *(none)*                     *(none)*
**xlmpich**            xlc, xlf            MPICH            *(none)*                     *(none)*
**xlmpich2**           xlc, xlf            MPICH2           *(none)*                     *(none)*
**xlmvapich2**         xlc, xlf            MVAPICH2         *(none)*                     *(none)*
**xlompi**             xlc, xlf            OpenMPI          *(none)*                     *(none)*
===================    ================    =============    =========================    ========


*(see also* ``eb --list-toolchains`` *)*
