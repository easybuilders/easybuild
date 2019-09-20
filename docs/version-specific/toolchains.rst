.. _vsd_list_toolchains:

*(see also* ``eb --list-toolchains`` *)*

List of known toolchains
------------------------

================    ================    ===========    ================    ========    =========    ========    ====    =====    =============
name                compiler            MPI            COMPILER            LAPACK      ScaLAPACK    BLAS        FFT     BLACS    CUDA compiler
================    ================    ===========    ================    ========    =========    ========    ====    =====    =============
**system**                                                                                                                                    
**ismkl**           icc, ifort          MPICH2         icc, ifort          imkl        imkl         imkl        imkl    imkl                  
**gompic**          GCC, CUDA           OpenMPI        GCC, CUDA                                                                 CUDA         
**cgoolf**          Clang, GCC          OpenMPI        Clang, GCC          OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**gmacml**          GCC                 MVAPICH2       GCC                 ACML        ScaLAPACK    ACML        FFTW    BLACS                 
**GNU**             GCC                                GCC                                                                                    
**iimpic**          icc, ifort, CUDA    impi           icc, ifort, CUDA                                                          CUDA         
**gpsolf**          GCC                 psmpi          GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**xlompi**          xlc, xlf            OpenMPI        xlc, xlf                                                                               
**gimpic**          GCC, CUDA           impi           GCC, CUDA                                                                 CUDA         
**gmpich2**         GCC                 MPICH2         GCC                                                                                    
**cgmvolf**         Clang, GCC          MVAPICH2       Clang, GCC          OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**CrayIntel**       PrgEnv-intel                       PrgEnv-intel                                                                           
**gcccuda**         GCC, CUDA                          GCC, CUDA                                                                 CUDA         
**iompi**           icc, ifort          OpenMPI        icc, ifort                                                                             
**golf**            GCC                                GCC                 OpenBLAS                 OpenBLAS    FFTW                          
**foss**            GCC                 OpenMPI        GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**CrayGNU**         PrgEnv-gnu                         PrgEnv-gnu                                                                             
**gpsmpi**          GCC                 psmpi          GCC                                                                                    
**CrayCCE**         PrgEnv-cray                        PrgEnv-cray                                                                            
**cgmpolf**         Clang, GCC          MPICH          Clang, GCC          OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**gmvapich2**       GCC                 MVAPICH2       GCC                                                                                    
**gompi**           GCC                 OpenMPI        GCC                                                                                    
**pompi**           PGI                 OpenMPI        PGI                                                                                    
**gsolf**           GCC                 SpectrumMPI    GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**PGI**             PGI                                PGI                                                                                    
**fosscuda**        GCC, CUDA           OpenMPI        GCC, CUDA           OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    CUDA         
**gqacml**          GCC                 QLogicMPI      GCC                 ACML        ScaLAPACK    ACML        FFTW    BLACS                 
**xlmvapich2**      xlc, xlf            MVAPICH2       xlc, xlf                                                                               
**xlmpich2**        xlc, xlf            MPICH2         xlc, xlf                                                                               
**pomkl**           PGI                 OpenMPI        PGI                 imkl        imkl         imkl        imkl    imkl                  
**impich**          icc, ifort          MPICH          icc, ifort                                                                             
**gomklc**          GCC, CUDA           OpenMPI        GCC, CUDA           imkl        imkl         imkl        imkl    imkl     CUDA         
**CrayPGI**         PrgEnv-pgi                         PrgEnv-pgi                                                                             
**iqacml**          icc, ifort          QLogicMPI      icc, ifort          ACML        ScaLAPACK    ACML        FFTW    BLACS                 
**GCCcore**         GCCcore                            GCCcore                                                                                
**goalf**           GCC                 OpenMPI        GCC                 ATLAS       ScaLAPACK    ATLAS       FFTW    BLACS                 
**gmkl**            GCC                                GCC                 imkl        imkl         imkl        imkl    imkl                  
**GCC**             GCC                                GCC                                                                                    
**gsmpi**           GCC                 SpectrumMPI    GCC                                                                                    
**goolfc**          GCC, CUDA           OpenMPI        GCC, CUDA           OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    CUDA         
**iompic**          icc, ifort, CUDA    OpenMPI        icc, ifort, CUDA                                                          CUDA         
**iimkl**           icc, ifort                         icc, ifort          imkl        imkl         imkl        imkl    imkl                  
**iomklc**          icc, ifort, CUDA    OpenMPI        icc, ifort, CUDA    imkl        imkl         imkl        imkl    imkl     CUDA         
**gmpolf**          GCC                 MPICH          GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**ipsmpi**          icc, ifort          psmpi          icc, ifort                                                                             
**gomkl**           GCC                 OpenMPI        GCC                 imkl        imkl         imkl        imkl    imkl                  
**gmpich**          GCC                 MPICH          GCC                                                                                    
**iimpi**           icc, ifort          impi           icc, ifort                                                                             
**iimklc**          icc, ifort, CUDA                   icc, ifort, CUDA    imkl        imkl         imkl        imkl    imkl     CUDA         
**goolf**           GCC                 OpenMPI        GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**xlmpich**         xlc, xlf            MPICH          xlc, xlf                                                                               
**intelcuda**       icc, ifort, CUDA    impi           icc, ifort, CUDA    imkl        imkl         imkl        imkl    imkl     CUDA         
**gmvolf**          GCC                 MVAPICH2       GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**goblf**           GCC                 OpenMPI        GCC                 LAPACK      ScaLAPACK    BLIS        FFTW    BLACS                 
**pmkl**            PGI                                PGI                 imkl        imkl         imkl        imkl    imkl                  
**ictce**           icc, ifort          impi           icc, ifort          imkl        imkl         imkl        imkl    imkl                  
**iomkl**           icc, ifort          OpenMPI        icc, ifort          imkl        imkl         imkl        imkl    imkl                  
**iccifort**        icc, ifort                         icc, ifort                                                                             
**impmkl**          icc, ifort          MPICH          icc, ifort          imkl        imkl         imkl        imkl    imkl                  
**intel**           icc, ifort          impi           icc, ifort          imkl        imkl         imkl        imkl    imkl                  
**golfc**           GCC, CUDA                          GCC, CUDA           OpenBLAS                 OpenBLAS    FFTW             CUDA         
**gimkl**           GCC                 impi           GCC                 imkl        imkl         imkl        imkl    imkl                  
**iiqmpi**          icc, ifort          QLogicMPI      icc, ifort                                                                             
**cgompi**          Clang, GCC          OpenMPI        Clang, GCC                                                                             
**cgmvapich2**      Clang, GCC          MVAPICH2       Clang, GCC                                                                             
**intel-para**      icc, ifort          psmpi          icc, ifort          imkl        imkl         imkl        imkl    imkl                  
**iccifortcuda**    icc, ifort, CUDA                   icc, ifort, CUDA                                                          CUDA         
**giolf**           GCC                 impi           GCC                 OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS                 
**giolfc**          GCC, CUDA           impi           GCC, CUDA           OpenBLAS    ScaLAPACK    OpenBLAS    FFTW    BLACS    CUDA         
**gmklc**           GCC, CUDA                          GCC, CUDA           imkl        imkl         imkl        imkl    imkl     CUDA         
**ClangGCC**        Clang, GCC                         Clang, GCC                                                                             
**xlcxlf**          xlc, xlf                           xlc, xlf                                                                               
**cgmpich**         Clang, GCC          MPICH          Clang, GCC                                                                             
**gimpi**           GCC                 impi           GCC                                                                                    
================    ================    ===========    ================    ========    =========    ========    ====    =====    =============

