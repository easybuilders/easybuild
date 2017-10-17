.. _vsd_list_toolchains:

*(see also* ``eb --list-toolchains`` *)*

List of known toolchains
------------------------

================    ================    =========    =============    ================    ========    =========    ========    ====    =====
name                compiler            MPI          CUDA compiler    COMPILER            LAPACK      ScaLAPACK    BLAS        FFT     BLACS
================    ================    =========    =============    ================    ========    =========    ========    ====    =====
**gompic**          GCC, CUDA           OpenMPI      CUDA             GCC, CUDA                                                             
**cgoolf**          Clang, GCC          OpenMPI                       Clang, GCC          OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**gmacml**          GCC                 MVAPICH2                      GCC                 ACML        ScaLAPACK    ACML        FFTW    BLACS
**GNU**             GCC                                               GCC                                                                   
**xlmpich2**        xlc, xlf            MPICH2                        xlc, xlf                                                              
**gpsolf**          GCC                 psmpi                         GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**xlompi**          xlc, xlf            OpenMPI                       xlc, xlf                                                              
**iompi**           icc, ifort          OpenMPI                       icc, ifort                                                            
**gmpich2**         GCC                 MPICH2                        GCC                                                                   
**iomkl**           icc, ifort          OpenMPI                       icc, ifort          imkl        imkl         imkl        imkl    imkl 
**cgmvolf**         Clang, GCC          MVAPICH2                      Clang, GCC          OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**CrayIntel**       PrgEnv-intel                                      PrgEnv-intel                                                          
**gcccuda**         GCC, CUDA                        CUDA             GCC, CUDA                                                             
**foss**            GCC                 OpenMPI                       GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**CrayGNU**         PrgEnv-gnu                                        PrgEnv-gnu                                                            
**gpsmpi**          GCC                 psmpi                         GCC                                                                   
**CrayCCE**         PrgEnv-cray                                       PrgEnv-cray                                                           
**cgmpolf**         Clang, GCC          MPICH                         Clang, GCC          OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**gmvapich2**       GCC                 MVAPICH2                      GCC                                                                   
**gompi**           GCC                 OpenMPI                       GCC                                                                   
**pompi**           PGI                 OpenMPI                       PGI                                                                   
**PGI**             PGI                                               PGI                                                                   
**iccifortcuda**    icc, ifort, CUDA                 CUDA             icc, ifort, CUDA                                                      
**ismkl**           icc, ifort          MPICH2                        icc, ifort          imkl        imkl         imkl        imkl    imkl 
**xlmvapich2**      xlc, xlf            MVAPICH2                      xlc, xlf                                                              
**pomkl**           PGI                 OpenMPI                       PGI                 imkl        imkl         imkl        imkl    imkl 
**impich**          icc, ifort          MPICH                         icc, ifort                                                            
**iccifort**        icc, ifort                                        icc, ifort                                                            
**CrayPGI**         PrgEnv-pgi                                        PrgEnv-pgi                                                            
**GCCcore**         GCCcore                                           GCCcore                                                               
**goalf**           GCC                 OpenMPI                       GCC                 ATLAS       ScaLAPACK    ATLAS       FFTW    BLACS
**GCC**             GCC                                               GCC                                                                   
**goolfc**          GCC, CUDA           OpenMPI      CUDA             GCC, CUDA           OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**iimkl**           icc, ifort                                        icc, ifort          imkl        imkl         imkl        imkl    imkl 
**gmpolf**          GCC                 MPICH                         GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**ipsmpi**          icc, ifort          psmpi                         icc, ifort                                                            
**gmpich**          GCC                 MPICH                         GCC                                                                   
**iimpi**           icc, ifort          impi                          icc, ifort                                                            
**goolf**           GCC                 OpenMPI                       GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**xlmpich**         xlc, xlf            MPICH                         xlc, xlf                                                              
**intelcuda**       icc, ifort, CUDA    impi         CUDA             icc, ifort, CUDA    imkl        imkl         imkl        imkl    imkl 
**gmvolf**          GCC                 MVAPICH2                      GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**iqacml**          icc, ifort          QLogicMPI                     icc, ifort          ACML        ScaLAPACK    ACML        FFTW    BLACS
**ictce**           icc, ifort          impi                          icc, ifort          imkl        imkl         imkl        imkl    imkl 
**dummy**                                                                                                                                   
**iimpic**          icc, ifort, CUDA    impi         CUDA             icc, ifort, CUDA                                                      
**impmkl**          icc, ifort          MPICH                         icc, ifort          imkl        imkl         imkl        imkl    imkl 
**intel**           icc, ifort          impi                          icc, ifort          imkl        imkl         imkl        imkl    imkl 
**gimkl**           GCC                 impi                          GCC                 imkl        imkl         imkl        imkl    imkl 
**iiqmpi**          icc, ifort          QLogicMPI                     icc, ifort                                                            
**cgompi**          Clang, GCC          OpenMPI                       Clang, GCC                                                            
**cgmvapich2**      Clang, GCC          MVAPICH2                      Clang, GCC                                                            
**intel-para**      icc, ifort          psmpi                         icc, ifort          imkl        imkl         imkl        imkl    imkl 
**giolf**           GCC                 impi                          GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS
**gqacml**          GCC                 QLogicMPI                     GCC                 ACML        ScaLAPACK    ACML        FFTW    BLACS
**ClangGCC**        Clang, GCC                                        Clang, GCC                                                            
**xlcxlf**          xlc, xlf                                          xlc, xlf                                                              
**cgmpich**         Clang, GCC          MPICH                         Clang, GCC                                                            
**gimpi**           GCC                 impi                          GCC                                                                   
================    ================    =========    =============    ================    ========    =========    ========    ====    =====

