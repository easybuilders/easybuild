.. _vsd_list_toolchains:

*(see also* ``eb --list-toolchains`` *)*

List of known toolchains
------------------------

================    ================    ===========    ========    =========    ========    ====    =====    ================    =============
name                compiler            MPI            LAPACK      ScaLAPACK    BLAS        FFT     BLACS    COMPILER            CUDA compiler
================    ================    ===========    ========    =========    ========    ====    =====    ================    =============
**ismkl**           icc, ifort          MPICH2         imkl        imkl         imkl        imkl    imkl     icc, ifort                       
**gompic**          GCC, CUDA           OpenMPI                                                              GCC, CUDA           CUDA         
**cgoolf**          Clang, GCC          OpenMPI        OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    Clang, GCC                       
**gmacml**          GCC                 MVAPICH2       ACML        ScaLAPACK    ACML        FFTW    BLACS    GCC                              
**GNU**             GCC                                                                                      GCC                              
**iimpic**          icc, ifort, CUDA    impi                                                                 icc, ifort, CUDA    CUDA         
**gpsolf**          GCC                 psmpi          OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC                              
**xlompi**          xlc, xlf            OpenMPI                                                              xlc, xlf                         
**gimpic**          GCC, CUDA           impi                                                                 GCC, CUDA           CUDA         
**gmpich2**         GCC                 MPICH2                                                               GCC                              
**iomkl**           icc, ifort          OpenMPI        imkl        imkl         imkl        imkl    imkl     icc, ifort                       
**cgmvolf**         Clang, GCC          MVAPICH2       OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    Clang, GCC                       
**CrayIntel**       PrgEnv-intel                                                                             PrgEnv-intel                     
**gcccuda**         GCC, CUDA                                                                                GCC, CUDA           CUDA         
**iompi**           icc, ifort          OpenMPI                                                              icc, ifort                       
**golf**            GCC                                OpenBLAS                 OpenBLAS    FFTW             GCC                              
**foss**            GCC                 OpenMPI        OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC                              
**CrayGNU**         PrgEnv-gnu                                                                               PrgEnv-gnu                       
**gpsmpi**          GCC                 psmpi                                                                GCC                              
**CrayCCE**         PrgEnv-cray                                                                              PrgEnv-cray                      
**cgmpolf**         Clang, GCC          MPICH          OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    Clang, GCC                       
**gmvapich2**       GCC                 MVAPICH2                                                             GCC                              
**gompi**           GCC                 OpenMPI                                                              GCC                              
**pompi**           PGI                 OpenMPI                                                              PGI                              
**gsolf**           GCC                 SpectrumMPI    OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC                              
**PGI**             PGI                                                                                      PGI                              
**fosscuda**        GCC, CUDA           OpenMPI        OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC, CUDA           CUDA         
**gqacml**          GCC                 QLogicMPI      ACML        ScaLAPACK    ACML        FFTW    BLACS    GCC                              
**xlmvapich2**      xlc, xlf            MVAPICH2                                                             xlc, xlf                         
**xlmpich2**        xlc, xlf            MPICH2                                                               xlc, xlf                         
**pomkl**           PGI                 OpenMPI        imkl        imkl         imkl        imkl    imkl     PGI                              
**impich**          icc, ifort          MPICH                                                                icc, ifort                       
**gomklc**          GCC, CUDA           OpenMPI        imkl        imkl         imkl        imkl    imkl     GCC, CUDA           CUDA         
**CrayPGI**         PrgEnv-pgi                                                                               PrgEnv-pgi                       
**iqacml**          icc, ifort          QLogicMPI      ACML        ScaLAPACK    ACML        FFTW    BLACS    icc, ifort                       
**GCCcore**         GCCcore                                                                                  GCCcore                          
**goalf**           GCC                 OpenMPI        ATLAS       ScaLAPACK    ATLAS       FFTW    BLACS    GCC                              
**gmkl**            GCC                                imkl        imkl         imkl        imkl    imkl     GCC                              
**GCC**             GCC                                                                                      GCC                              
**gsmpi**           GCC                 SpectrumMPI                                                          GCC                              
**goolfc**          GCC, CUDA           OpenMPI        OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC, CUDA           CUDA         
**iompic**          icc, ifort, CUDA    OpenMPI                                                              icc, ifort, CUDA    CUDA         
**iimkl**           icc, ifort                         imkl        imkl         imkl        imkl    imkl     icc, ifort                       
**iomklc**          icc, ifort, CUDA    OpenMPI        imkl        imkl         imkl        imkl    imkl     icc, ifort, CUDA    CUDA         
**gmpolf**          GCC                 MPICH          OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC                              
**ipsmpi**          icc, ifort          psmpi                                                                icc, ifort                       
**gomkl**           GCC                 OpenMPI        imkl        imkl         imkl        imkl    imkl     GCC                              
**gmpich**          GCC                 MPICH                                                                GCC                              
**iimpi**           icc, ifort          impi                                                                 icc, ifort                       
**iimklc**          icc, ifort, CUDA                   imkl        imkl         imkl        imkl    imkl     icc, ifort, CUDA    CUDA         
**goolf**           GCC                 OpenMPI        OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC                              
**xlmpich**         xlc, xlf            MPICH                                                                xlc, xlf                         
**intelcuda**       icc, ifort, CUDA    impi           imkl        imkl         imkl        imkl    imkl     icc, ifort, CUDA    CUDA         
**gmvolf**          GCC                 MVAPICH2       OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC                              
**goblf**           GCC                 OpenMPI        LAPACK      ScaLAPACK    BLIS        FFTW    BLACS    GCC                              
**pmkl**            PGI                                imkl        imkl         imkl        imkl    imkl     PGI                              
**ictce**           icc, ifort          impi           imkl        imkl         imkl        imkl    imkl     icc, ifort                       
**dummy**                                                                                                                                     
**iccifort**        icc, ifort                                                                               icc, ifort                       
**impmkl**          icc, ifort          MPICH          imkl        imkl         imkl        imkl    imkl     icc, ifort                       
**intel**           icc, ifort          impi           imkl        imkl         imkl        imkl    imkl     icc, ifort                       
**golfc**           GCC, CUDA                          OpenBLAS                 OpenBLAS    FFTW             GCC, CUDA           CUDA         
**gimkl**           GCC                 impi           imkl        imkl         imkl        imkl    imkl     GCC                              
**iiqmpi**          icc, ifort          QLogicMPI                                                            icc, ifort                       
**cgompi**          Clang, GCC          OpenMPI                                                              Clang, GCC                       
**cgmvapich2**      Clang, GCC          MVAPICH2                                                             Clang, GCC                       
**intel-para**      icc, ifort          psmpi          imkl        imkl         imkl        imkl    imkl     icc, ifort                       
**iccifortcuda**    icc, ifort, CUDA                                                                         icc, ifort, CUDA    CUDA         
**giolf**           GCC                 impi           OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC                              
**giolfc**          GCC, CUDA           impi           OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    GCC, CUDA           CUDA         
**gmklc**           GCC, CUDA                          imkl        imkl         imkl        imkl    imkl     GCC, CUDA           CUDA         
**ClangGCC**        Clang, GCC                                                                               Clang, GCC                       
**xlcxlf**          xlc, xlf                                                                                 xlc, xlf                         
**cgmpich**         Clang, GCC          MPICH                                                                Clang, GCC                       
**gimpi**           GCC                 impi                                                                 GCC                              
================    ================    ===========    ========    =========    ========    ====    =====    ================    =============

