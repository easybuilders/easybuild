.. _avail_toolchain_opts:

Available toolchain options (by toolchain)
==========================================

*(see also* ``eb --avail-toolchain-opts <tcname>`` *)*

ClangGCC_ - CrayCCE_ - CrayGNU_ - CrayIntel_ - CrayPGI_ - GCC_ - GCCcore_ - GNU_ - PGI_ - cgmpich_ - cgmpolf_ - cgmvapich2_ - cgmvolf_ - cgompi_ - cgoolf_ - dummy_ - foss_ - fosscuda_ - gcccuda_ - gimkl_ - gimpi_ - gimpic_ - giolf_ - giolfc_ - gmacml_ - gmkl_ - gmklc_ - gmpich2_ - gmpich_ - gmpolf_ - gmvapich2_ - gmvolf_ - goalf_ - goblf_ - golf_ - golfc_ - gomkl_ - gomklc_ - gompi_ - gompic_ - goolf_ - goolfc_ - gpsmpi_ - gpsolf_ - gqacml_ - gsmpi_ - gsolf_ - iccifort_ - iccifortcuda_ - ictce_ - iimkl_ - iimklc_ - iimpi_ - iimpic_ - iiqmpi_ - impich_ - impmkl_ - intel-para_ - intel_ - intelcuda_ - iomkl_ - iomklc_ - iompi_ - iompic_ - ipsmpi_ - iqacml_ - ismkl_ - pmkl_ - pomkl_ - pompi_ - xlcxlf_ - xlmpich2_ - xlmpich_ - xlmvapich2_ - xlompi_

.. _ClangGCC:

Available options for ClangGCC toolchain
----------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``basic-block-vectorize``    Basic block vectorization                                                  ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop-vectorize``           Loop vectorization                                                         ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _CrayCCE:

Available options for CrayCCE toolchain
---------------------------------------

=========================    ===============================================================================================================================================================================================================================================================    =========
option                       description                                                                                                                                                                                                                                                        default  
=========================    ===============================================================================================================================================================================================================================================================    =========
``32bit``                    Compile 32bit target                                                                                                                                                                                                                                               ``False``
``cciscxx``                  Use CC as CXX                                                                                                                                                                                                                                                      ``False``
``cstd``                     Specify C standard                                                                                                                                                                                                                                                 ``None`` 
``debug``                    Enable debug                                                                                                                                                                                                                                                       ``False``
``defaultopt``               Default compiler optimizations                                                                                                                                                                                                                                     ``False``
``defaultprec``              Default precision                                                                                                                                                                                                                                                  ``False``
``dynamic``                  Generate dynamically linked executable                                                                                                                                                                                                                             ``True`` 
``i8``                       Integers are 8 byte integers                                                                                                                                                                                                                                       ``False``
``ieee``                     Adhere to IEEE-754 rules                                                                                                                                                                                                                                           ``False``
``loose``                    Loose precision                                                                                                                                                                                                                                                    ``False``
``lowopt``                   Low compiler optimizations                                                                                                                                                                                                                                         ``False``
``mpich-mt``                 Directs the driver to link in an alternate version of the Cray-MPICH library which                              provides fine-grained multi-threading support to applications that perform                              MPI operations within threaded regions.    ``False``
``noopt``                    Disable compiler optimizations                                                                                                                                                                                                                                     ``False``
``openmp``                   Enable OpenMP                                                                                                                                                                                                                                                      ``False``
``opt``                      High compiler optimizations                                                                                                                                                                                                                                        ``False``
``optarch``                  Enable architecture optimizations                                                                                                                                                                                                                                  ``False``
``packed-linker-options``    Pack the linker options as comma separated list                                                                                                                                                                                                                    ``False``
``pic``                      Use PIC                                                                                                                                                                                                                                                            ``False``
``precise``                  High precision                                                                                                                                                                                                                                                     ``False``
``r8``                       Real is 8 byte real                                                                                                                                                                                                                                                ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                                                                                                                                              ``True`` 
``shared``                   Build shared library                                                                                                                                                                                                                                               ``False``
``static``                   Build static library                                                                                                                                                                                                                                               ``False``
``strict``                   Strict (highest) precision                                                                                                                                                                                                                                         ``False``
``unroll``                   Unroll loops                                                                                                                                                                                                                                                       ``False``
``usempi``                   Use MPI compiler as default compiler                                                                                                                                                                                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt                                                                                                                                                                                            ``None`` 
``verbose``                  Verbose output                                                                                                                                                                                                                                                     ``True`` 
``veryloose``                Very loose precision                                                                                                                                                                                                                                               ``False``
=========================    ===============================================================================================================================================================================================================================================================    =========


.. _CrayGNU:

Available options for CrayGNU toolchain
---------------------------------------

=========================    ===============================================================================================================================================================================================================================================================    =========
option                       description                                                                                                                                                                                                                                                        default  
=========================    ===============================================================================================================================================================================================================================================================    =========
``32bit``                    Compile 32bit target                                                                                                                                                                                                                                               ``False``
``cciscxx``                  Use CC as CXX                                                                                                                                                                                                                                                      ``False``
``cstd``                     Specify C standard                                                                                                                                                                                                                                                 ``None`` 
``debug``                    Enable debug                                                                                                                                                                                                                                                       ``False``
``defaultopt``               Default compiler optimizations                                                                                                                                                                                                                                     ``False``
``defaultprec``              Default precision                                                                                                                                                                                                                                                  ``False``
``dynamic``                  Generate dynamically linked executable                                                                                                                                                                                                                             ``True`` 
``i8``                       Integers are 8 byte integers                                                                                                                                                                                                                                       ``False``
``ieee``                     Adhere to IEEE-754 rules                                                                                                                                                                                                                                           ``False``
``loose``                    Loose precision                                                                                                                                                                                                                                                    ``False``
``lowopt``                   Low compiler optimizations                                                                                                                                                                                                                                         ``False``
``mpich-mt``                 Directs the driver to link in an alternate version of the Cray-MPICH library which                              provides fine-grained multi-threading support to applications that perform                              MPI operations within threaded regions.    ``False``
``noopt``                    Disable compiler optimizations                                                                                                                                                                                                                                     ``False``
``openmp``                   Enable OpenMP                                                                                                                                                                                                                                                      ``False``
``opt``                      High compiler optimizations                                                                                                                                                                                                                                        ``False``
``optarch``                  Enable architecture optimizations                                                                                                                                                                                                                                  ``False``
``packed-linker-options``    Pack the linker options as comma separated list                                                                                                                                                                                                                    ``False``
``pic``                      Use PIC                                                                                                                                                                                                                                                            ``False``
``precise``                  High precision                                                                                                                                                                                                                                                     ``False``
``r8``                       Real is 8 byte real                                                                                                                                                                                                                                                ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                                                                                                                                              ``True`` 
``shared``                   Build shared library                                                                                                                                                                                                                                               ``False``
``static``                   Build static library                                                                                                                                                                                                                                               ``False``
``strict``                   Strict (highest) precision                                                                                                                                                                                                                                         ``False``
``unroll``                   Unroll loops                                                                                                                                                                                                                                                       ``False``
``usempi``                   Use MPI compiler as default compiler                                                                                                                                                                                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt                                                                                                                                                                                            ``None`` 
``verbose``                  Verbose output                                                                                                                                                                                                                                                     ``True`` 
``veryloose``                Very loose precision                                                                                                                                                                                                                                               ``False``
=========================    ===============================================================================================================================================================================================================================================================    =========


.. _CrayIntel:

Available options for CrayIntel toolchain
-----------------------------------------

=========================    ===============================================================================================================================================================================================================================================================    =========
option                       description                                                                                                                                                                                                                                                        default  
=========================    ===============================================================================================================================================================================================================================================================    =========
``32bit``                    Compile 32bit target                                                                                                                                                                                                                                               ``False``
``cciscxx``                  Use CC as CXX                                                                                                                                                                                                                                                      ``False``
``cstd``                     Specify C standard                                                                                                                                                                                                                                                 ``None`` 
``debug``                    Enable debug                                                                                                                                                                                                                                                       ``False``
``defaultopt``               Default compiler optimizations                                                                                                                                                                                                                                     ``False``
``defaultprec``              Default precision                                                                                                                                                                                                                                                  ``False``
``dynamic``                  Generate dynamically linked executable                                                                                                                                                                                                                             ``True`` 
``i8``                       Integers are 8 byte integers                                                                                                                                                                                                                                       ``False``
``ieee``                     Adhere to IEEE-754 rules                                                                                                                                                                                                                                           ``False``
``loose``                    Loose precision                                                                                                                                                                                                                                                    ``False``
``lowopt``                   Low compiler optimizations                                                                                                                                                                                                                                         ``False``
``mpich-mt``                 Directs the driver to link in an alternate version of the Cray-MPICH library which                              provides fine-grained multi-threading support to applications that perform                              MPI operations within threaded regions.    ``False``
``noopt``                    Disable compiler optimizations                                                                                                                                                                                                                                     ``False``
``openmp``                   Enable OpenMP                                                                                                                                                                                                                                                      ``False``
``opt``                      High compiler optimizations                                                                                                                                                                                                                                        ``False``
``optarch``                  Enable architecture optimizations                                                                                                                                                                                                                                  ``False``
``packed-linker-options``    Pack the linker options as comma separated list                                                                                                                                                                                                                    ``False``
``pic``                      Use PIC                                                                                                                                                                                                                                                            ``False``
``precise``                  High precision                                                                                                                                                                                                                                                     ``False``
``r8``                       Real is 8 byte real                                                                                                                                                                                                                                                ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                                                                                                                                              ``True`` 
``shared``                   Build shared library                                                                                                                                                                                                                                               ``False``
``static``                   Build static library                                                                                                                                                                                                                                               ``False``
``strict``                   Strict (highest) precision                                                                                                                                                                                                                                         ``False``
``unroll``                   Unroll loops                                                                                                                                                                                                                                                       ``False``
``usempi``                   Use MPI compiler as default compiler                                                                                                                                                                                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt                                                                                                                                                                                            ``None`` 
``verbose``                  Verbose output                                                                                                                                                                                                                                                     ``True`` 
``veryloose``                Very loose precision                                                                                                                                                                                                                                               ``False``
=========================    ===============================================================================================================================================================================================================================================================    =========


.. _CrayPGI:

Available options for CrayPGI toolchain
---------------------------------------

=========================    ===============================================================================================================================================================================================================================================================    =========
option                       description                                                                                                                                                                                                                                                        default  
=========================    ===============================================================================================================================================================================================================================================================    =========
``32bit``                    Compile 32bit target                                                                                                                                                                                                                                               ``False``
``cciscxx``                  Use CC as CXX                                                                                                                                                                                                                                                      ``False``
``cstd``                     Specify C standard                                                                                                                                                                                                                                                 ``None`` 
``debug``                    Enable debug                                                                                                                                                                                                                                                       ``False``
``defaultopt``               Default compiler optimizations                                                                                                                                                                                                                                     ``False``
``defaultprec``              Default precision                                                                                                                                                                                                                                                  ``False``
``dynamic``                  Generate dynamically linked executable                                                                                                                                                                                                                             ``True`` 
``i8``                       Integers are 8 byte integers                                                                                                                                                                                                                                       ``False``
``ieee``                     Adhere to IEEE-754 rules                                                                                                                                                                                                                                           ``False``
``loose``                    Loose precision                                                                                                                                                                                                                                                    ``False``
``lowopt``                   Low compiler optimizations                                                                                                                                                                                                                                         ``False``
``mpich-mt``                 Directs the driver to link in an alternate version of the Cray-MPICH library which                              provides fine-grained multi-threading support to applications that perform                              MPI operations within threaded regions.    ``False``
``noopt``                    Disable compiler optimizations                                                                                                                                                                                                                                     ``False``
``openmp``                   Enable OpenMP                                                                                                                                                                                                                                                      ``False``
``opt``                      High compiler optimizations                                                                                                                                                                                                                                        ``False``
``optarch``                  Enable architecture optimizations                                                                                                                                                                                                                                  ``False``
``packed-linker-options``    Pack the linker options as comma separated list                                                                                                                                                                                                                    ``False``
``pic``                      Use PIC                                                                                                                                                                                                                                                            ``False``
``precise``                  High precision                                                                                                                                                                                                                                                     ``False``
``r8``                       Real is 8 byte real                                                                                                                                                                                                                                                ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                                                                                                                                              ``True`` 
``shared``                   Build shared library                                                                                                                                                                                                                                               ``False``
``static``                   Build static library                                                                                                                                                                                                                                               ``False``
``strict``                   Strict (highest) precision                                                                                                                                                                                                                                         ``False``
``unroll``                   Unroll loops                                                                                                                                                                                                                                                       ``False``
``usempi``                   Use MPI compiler as default compiler                                                                                                                                                                                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt                                                                                                                                                                                            ``None`` 
``verbose``                  Verbose output                                                                                                                                                                                                                                                     ``True`` 
``veryloose``                Very loose precision                                                                                                                                                                                                                                               ``False``
=========================    ===============================================================================================================================================================================================================================================================    =========


.. _GCC:

Available options for GCC toolchain
-----------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _GCCcore:

Available options for GCCcore toolchain
---------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _GNU:

Available options for GNU toolchain
-----------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _PGI:

Available options for PGI toolchain
-----------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _cgmpich:

Available options for cgmpich toolchain
---------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``basic-block-vectorize``    Basic block vectorization                                                  ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop-vectorize``           Loop vectorization                                                         ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _cgmpolf:

Available options for cgmpolf toolchain
---------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``basic-block-vectorize``    Basic block vectorization                                                  ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop-vectorize``           Loop vectorization                                                         ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _cgmvapich2:

Available options for cgmvapich2 toolchain
------------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``basic-block-vectorize``    Basic block vectorization                                                  ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop-vectorize``           Loop vectorization                                                         ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _cgmvolf:

Available options for cgmvolf toolchain
---------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``basic-block-vectorize``    Basic block vectorization                                                  ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop-vectorize``           Loop vectorization                                                         ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _cgompi:

Available options for cgompi toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``basic-block-vectorize``    Basic block vectorization                                                  ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop-vectorize``           Loop vectorization                                                         ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _cgoolf:

Available options for cgoolf toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``basic-block-vectorize``    Basic block vectorization                                                  ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop-vectorize``           Loop vectorization                                                         ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _dummy:

Available options for dummy toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _foss:

Available options for foss toolchain
------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _fosscuda:

Available options for fosscuda toolchain
----------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gcccuda:

Available options for gcccuda toolchain
---------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gimkl:

Available options for gimkl toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gimpi:

Available options for gimpi toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gimpic:

Available options for gimpic toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _giolf:

Available options for giolf toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _giolfc:

Available options for giolfc toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gmacml:

Available options for gmacml toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gmkl:

Available options for gmkl toolchain
------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gmklc:

Available options for gmklc toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gmpich2:

Available options for gmpich2 toolchain
---------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gmpich:

Available options for gmpich toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gmpolf:

Available options for gmpolf toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gmvapich2:

Available options for gmvapich2 toolchain
-----------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gmvolf:

Available options for gmvolf toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _goalf:

Available options for goalf toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _goblf:

Available options for goblf toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _golf:

Available options for golf toolchain
------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _golfc:

Available options for golfc toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gomkl:

Available options for gomkl toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gomklc:

Available options for gomklc toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gompi:

Available options for gompi toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gompic:

Available options for gompic toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _goolf:

Available options for goolf toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _goolfc:

Available options for goolfc toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gpsmpi:

Available options for gpsmpi toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gpsolf:

Available options for gpsolf toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gqacml:

Available options for gqacml toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gsmpi:

Available options for gsmpi toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _gsolf:

Available options for gsolf toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``f2c``                      Generate code compatible with f2c and f77                                  ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loop``                     Automatic loop parallellisation                                            ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``lto``                      Enable Link Time Optimization                                              ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iccifort:

Available options for iccifort toolchain
----------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iccifortcuda:

Available options for iccifortcuda toolchain
--------------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _ictce:

Available options for ictce toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iimkl:

Available options for iimkl toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iimklc:

Available options for iimklc toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iimpi:

Available options for iimpi toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iimpic:

Available options for iimpic toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iiqmpi:

Available options for iiqmpi toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _impich:

Available options for impich toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _impmkl:

Available options for impmkl toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _intel-para:

Available options for intel-para toolchain
------------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _intel:

Available options for intel toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _intelcuda:

Available options for intelcuda toolchain
-----------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iomkl:

Available options for iomkl toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iomklc:

Available options for iomklc toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iompi:

Available options for iompi toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iompic:

Available options for iompic toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _ipsmpi:

Available options for ipsmpi toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _iqacml:

Available options for iqacml toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _ismkl:

Available options for ismkl toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``intel-static``             Link Intel provided libraries statically                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``no-icc``                   Don't set Intel specific macros                                            ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _pmkl:

Available options for pmkl toolchain
------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _pomkl:

Available options for pomkl toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _pompi:

Available options for pompi toolchain
-------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _xlcxlf:

Available options for xlcxlf toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ibm-static``               Link IBM XL provided libraries statically                                  ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _xlmpich2:

Available options for xlmpich2 toolchain
----------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ibm-static``               Link IBM XL provided libraries statically                                  ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _xlmpich:

Available options for xlmpich toolchain
---------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ibm-static``               Link IBM XL provided libraries statically                                  ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _xlmvapich2:

Available options for xlmvapich2 toolchain
------------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ibm-static``               Link IBM XL provided libraries statically                                  ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========


.. _xlompi:

Available options for xlompi toolchain
--------------------------------------

=========================    =======================================================================    =========
option                       description                                                                default  
=========================    =======================================================================    =========
``32bit``                    Compile 32bit target                                                       ``False``
``cciscxx``                  Use CC as CXX                                                              ``False``
``cstd``                     Specify C standard                                                         ``None`` 
``debug``                    Enable debug                                                               ``False``
``defaultopt``               Default compiler optimizations                                             ``False``
``defaultprec``              Default precision                                                          ``False``
``error-unknown-option``     Error instead of warning for unknown options                               ``False``
``i8``                       Integers are 8 byte integers                                               ``False``
``ibm-static``               Link IBM XL provided libraries statically                                  ``False``
``ieee``                     Adhere to IEEE-754 rules                                                   ``False``
``loose``                    Loose precision                                                            ``False``
``lowopt``                   Low compiler optimizations                                                 ``False``
``noopt``                    Disable compiler optimizations                                             ``False``
``openmp``                   Enable OpenMP                                                              ``False``
``opt``                      High compiler optimizations                                                ``False``
``optarch``                  Enable architecture optimizations                                          ``True`` 
``packed-linker-options``    Pack the linker options as comma separated list                            ``False``
``pic``                      Use PIC                                                                    ``False``
``precise``                  High precision                                                             ``False``
``r8``                       Real is 8 byte real                                                        ``False``
``rpath``                    Use RPATH wrappers when --rpath is enabled in EasyBuild configuration      ``True`` 
``shared``                   Build shared library                                                       ``False``
``static``                   Build static library                                                       ``False``
``strict``                   Strict (highest) precision                                                 ``False``
``unroll``                   Unroll loops                                                               ``False``
``usempi``                   Use MPI compiler as default compiler                                       ``False``
``vectorize``                Enable compiler auto-vectorization, default except for noopt and lowopt    ``None`` 
``verbose``                  Verbose output                                                             ``False``
``veryloose``                Very loose precision                                                       ``False``
=========================    =======================================================================    =========

