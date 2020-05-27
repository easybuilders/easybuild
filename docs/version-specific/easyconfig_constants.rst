.. _avail_easyconfig_constants:

*(see also* ``eb --avail-easyconfig-constants`` *)*

Constants that can be used in easyconfigs
-----------------------------------------

======================    =============================================================    ================================================================================
Constant name             Constant value                                                   Description                                                                     
======================    =============================================================    ================================================================================
``EXTERNAL_MODULE``       ``EXTERNAL_MODULE``                                              External module marker                                                          
``HOME``                  ``/home/example``                                                Home directory ($HOME)                                                          
``OS_NAME``               ``UNKNOWN``                                                      System name (e.g. 'fedora' or 'RHEL')                                           
``OS_PKG_IBVERBS_DEV``    ``('libibverbs-dev', 'libibverbs-devel', 'rdma-core-devel')``    OS packages providing ibverbs/infiniband development support                    
``OS_PKG_OPENSSL_BIN``    ``openssl``                                                      OS packages providing the openSSL binary                                        
``OS_PKG_OPENSSL_DEV``    ``('openssl-devel', 'libssl-dev', 'libopenssl-devel')``          OS packages providing openSSL developement support                              
``OS_PKG_OPENSSL_LIB``    ``('libssl', 'libopenssl')``                                     OS packages providing openSSL libraries                                         
``OS_PKG_PAM_DEV``        ``('pam-devel', 'libpam0g-dev')``                                OS packages providing Pluggable Authentication Module (PAM) developement support
``OS_TYPE``               ``Darwin``                                                       System type (e.g. 'Linux' or 'Darwin')                                          
``OS_VERSION``            ``UNKNOWN``                                                      System version                                                                  
``SYSTEM``                ``{'version': 'system', 'name': 'system'}``                      System toolchain                                                                
``SYS_PYTHON_VERSION``    ``2.7.16``                                                       System Python version (platform.python_version())                               
======================    =============================================================    ================================================================================

