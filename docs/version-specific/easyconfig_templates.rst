.. _avail_easyconfig_templates:

*(see also* ``eb --avail-easyconfig-templates`` *)*

Template names/values derived from easyconfig instance
------------------------------------------------------

===========================    =============================
Template name                  Template value               
===========================    =============================
``%(module_name)s``            Module name                  
``%(nameletter)s``             First letter of software name
``%(toolchain_name)s``         Toolchain name               
``%(toolchain_version)s``      Toolchain version            
``%(version_major_minor)s``    Major.Minor version          
``%(version_major)s``          Major version                
``%(version_minor)s``          Minor version                
===========================    =============================


Template names/values for (short) software versions
---------------------------------------------------

====================    ============================================
Template name           Template value                              
====================    ============================================
``%(cudashortver)s``    short version for CUDA (<major>.<minor>)    
``%(cudaver)s``         full version for CUDA                       
``%(cudashortver)s``    short version for CUDAcore (<major>.<minor>)
``%(cudaver)s``         full version for CUDAcore                   
``%(javashortver)s``    short version for Java (<major>.<minor>)    
``%(javaver)s``         full version for Java                       
``%(perlshortver)s``    short version for Perl (<major>.<minor>)    
``%(perlver)s``         full version for Perl                       
``%(pyshortver)s``      short version for Python (<major>.<minor>)  
``%(pyver)s``           full version for Python                     
``%(rshortver)s``       short version for R (<major>.<minor>)       
``%(rver)s``            full version for R                          
====================    ============================================


Template names/values as set in easyconfig
------------------------------------------

* ``%(bitbucket_account)s``
* ``%(github_account)s``
* ``%(name)s``
* ``%(parallel)s``
* ``%(version)s``
* ``%(versionsuffix)s``
* ``%(versionprefix)s``

Lowercase values of template values
-----------------------------------

=======================    =================================
Template name              Template value                   
=======================    =================================
``%(namelower)s``          lower case of value of name      
``%(nameletterlower)s``    lower case of value of nameletter
=======================    =================================

Template values set outside EasyBlock runstep
---------------------------------------------

==================    ======================
Template name         Template value        
==================    ======================
``%(builddir)s``      Build directory       
``%(installdir)s``    Installation directory
==================    ======================

Template values which are defined dynamically
---------------------------------------------

=================================    ==========================================================================================================================================================================
Template name                        Template value                                                                                                                                                            
=================================    ==========================================================================================================================================================================
``%(arch)s``                         System architecture (e.g. x86_64, aarch64, ppc64le, ...)                                                                                                                  
``%(mpi_cmd_prefix)s``               Prefix command for running MPI programs (with default number of ranks)                                                                                                    
``%(cuda_compute_capabilities)s``    Comma-separated list of CUDA compute capabilities, as specified via --cuda-compute-capabilities configuration option or via cuda_compute_capabilities easyconfig parameter
``%(cuda_cc_cmake)s``                List of CUDA compute capabilities suitable for use with $CUDAARCHS in CMake 3.18+                                                                                         
``%(cuda_cc_space_sep)s``            Space-separated list of CUDA compute capabilities                                                                                                                         
``%(cuda_cc_semicolon_sep)s``        Semicolon-separated list of CUDA compute capabilities                                                                                                                     
``%(cuda_sm_comma_sep)s``            Comma-separated list of sm_* values that correspond with CUDA compute capabilities                                                                                        
``%(cuda_sm_space_sep)s``            Space-separated list of sm_* values that correspond with CUDA compute capabilities                                                                                        
=================================    ==========================================================================================================================================================================

Template constants that can be used in easyconfigs
--------------------------------------------------

========================    =============================================================================================================    ========================================================================================
Constant                    Template value                                                                                                   Template name                                                                           
========================    =============================================================================================================    ========================================================================================
``APACHE_SOURCE``           apache.org source url                                                                                            ``https://archive.apache.org/dist/%(namelower)s``                                       
``BITBUCKET_SOURCE``        bitbucket.org source url (namelower is used if bitbucket_account easyconfig parameter is not specified)          ``https://bitbucket.org/%(bitbucket_account)s/%(namelower)s/get``                       
``BITBUCKET_DOWNLOADS``     bitbucket.org downloads url (namelower is used if bitbucket_account easyconfig parameter is not specified)       ``https://bitbucket.org/%(bitbucket_account)s/%(namelower)s/downloads``                 
``CRAN_SOURCE``             CRAN (contrib) source url                                                                                        ``https://cran.r-project.org/src/contrib``                                              
``FTPGNOME_SOURCE``         http download for gnome ftp server                                                                               ``https://ftp.gnome.org/pub/GNOME/sources/%(namelower)s/%(version_major_minor)s``       
``GITHUB_SOURCE``           GitHub source URL (namelower is used if github_account easyconfig parameter is not specified)                    ``https://github.com/%(github_account)s/%(name)s/archive``                              
``GITHUB_LOWER_SOURCE``     GitHub source URL (lowercase name, namelower is used if github_account easyconfig parameter is not specified)    ``https://github.com/%(github_account)s/%(namelower)s/archive``                         
``GITHUB_RELEASE``          GitHub release URL (namelower is used if github_account easyconfig parameter is not specified)                   ``https://github.com/%(github_account)s/%(name)s/releases/download/v%(version)s``       
``GITHUB_LOWER_RELEASE``    GitHub release URL (namelower is used if github_account easyconfig parameter is not specified)                   ``https://github.com/%(github_account)s/%(namelower)s/releases/download/v%(version)s``  
``GNU_SAVANNAH_SOURCE``     download.savannah.gnu.org source url                                                                             ``https://download-mirror.savannah.gnu.org/releases/%(namelower)s``                     
``GNU_SOURCE``              gnu.org source url                                                                                               ``https://ftpmirror.gnu.org/gnu/%(namelower)s``                                         
``GOOGLECODE_SOURCE``       googlecode.com source url                                                                                        ``http://%(namelower)s.googlecode.com/files``                                           
``LAUNCHPAD_SOURCE``        launchpad.net source url                                                                                         ``https://launchpad.net/%(namelower)s/%(version_major_minor)s.x/%(version)s/+download/``
``PYPI_SOURCE``             pypi source url                                                                                                  ``https://pypi.python.org/packages/source/%(nameletter)s/%(name)s``                     
``PYPI_LOWER_SOURCE``       pypi source url (lowercase name)                                                                                 ``https://pypi.python.org/packages/source/%(nameletterlower)s/%(namelower)s``           
``R_SOURCE``                cran.r-project.org (base) source url                                                                             ``https://cran.r-project.org/src/base/R-%(version_major)s``                             
``SOURCEFORGE_SOURCE``      sourceforge.net source url                                                                                       ``https://download.sourceforge.net/%(namelower)s``                                      
``XORG_DATA_SOURCE``        xorg data source url                                                                                             ``https://xorg.freedesktop.org/archive/individual/data/``                               
``XORG_LIB_SOURCE``         xorg lib source url                                                                                              ``https://xorg.freedesktop.org/archive/individual/lib/``                                
``XORG_PROTO_SOURCE``       xorg proto source url                                                                                            ``https://xorg.freedesktop.org/archive/individual/proto/``                              
``XORG_UTIL_SOURCE``        xorg util source url                                                                                             ``https://xorg.freedesktop.org/archive/individual/util/``                               
``XORG_XCB_SOURCE``         xorg xcb source url                                                                                              ``https://xorg.freedesktop.org/archive/individual/xcb/``                                
``SHLIB_EXT``               extension for shared libraries                                                                                   ``dylib``                                                                               
``SOURCE_TAR_GZ``           Source .tar.gz bundle                                                                                            ``%(name)s-%(version)s.tar.gz``                                                         
``SOURCELOWER_TAR_GZ``      Source .tar.gz bundle with lowercase name                                                                        ``%(namelower)s-%(version)s.tar.gz``                                                    
``SOURCE_TAR_XZ``           Source .tar.xz bundle                                                                                            ``%(name)s-%(version)s.tar.xz``                                                         
``SOURCELOWER_TAR_XZ``      Source .tar.xz bundle with lowercase name                                                                        ``%(namelower)s-%(version)s.tar.xz``                                                    
``SOURCE_TAR_BZ2``          Source .tar.bz2 bundle                                                                                           ``%(name)s-%(version)s.tar.bz2``                                                        
``SOURCELOWER_TAR_BZ2``     Source .tar.bz2 bundle with lowercase name                                                                       ``%(namelower)s-%(version)s.tar.bz2``                                                   
``SOURCE_TGZ``              Source .tgz bundle                                                                                               ``%(name)s-%(version)s.tgz``                                                            
``SOURCELOWER_TGZ``         Source .tgz bundle with lowercase name                                                                           ``%(namelower)s-%(version)s.tgz``                                                       
``SOURCE_TXZ``              Source .txz bundle                                                                                               ``%(name)s-%(version)s.txz``                                                            
``SOURCELOWER_TXZ``         Source .txz bundle with lowercase name                                                                           ``%(namelower)s-%(version)s.txz``                                                       
``SOURCE_TBZ2``             Source .tbz2 bundle                                                                                              ``%(name)s-%(version)s.tbz2``                                                           
``SOURCELOWER_TBZ2``        Source .tbz2 bundle with lowercase name                                                                          ``%(namelower)s-%(version)s.tbz2``                                                      
``SOURCE_TB2``              Source .tb2 bundle                                                                                               ``%(name)s-%(version)s.tb2``                                                            
``SOURCELOWER_TB2``         Source .tb2 bundle with lowercase name                                                                           ``%(namelower)s-%(version)s.tb2``                                                       
``SOURCE_GTGZ``             Source .gtgz bundle                                                                                              ``%(name)s-%(version)s.gtgz``                                                           
``SOURCELOWER_GTGZ``        Source .gtgz bundle with lowercase name                                                                          ``%(namelower)s-%(version)s.gtgz``                                                      
``SOURCE_ZIP``              Source .zip bundle                                                                                               ``%(name)s-%(version)s.zip``                                                            
``SOURCELOWER_ZIP``         Source .zip bundle with lowercase name                                                                           ``%(namelower)s-%(version)s.zip``                                                       
``SOURCE_TAR``              Source .tar bundle                                                                                               ``%(name)s-%(version)s.tar``                                                            
``SOURCELOWER_TAR``         Source .tar bundle with lowercase name                                                                           ``%(namelower)s-%(version)s.tar``                                                       
``SOURCE_XZ``               Source .xz bundle                                                                                                ``%(name)s-%(version)s.xz``                                                             
``SOURCELOWER_XZ``          Source .xz bundle with lowercase name                                                                            ``%(namelower)s-%(version)s.xz``                                                        
``SOURCE_TAR_Z``            Source .tar.Z bundle                                                                                             ``%(name)s-%(version)s.tar.Z``                                                          
``SOURCELOWER_TAR_Z``       Source .tar.Z bundle with lowercase name                                                                         ``%(namelower)s-%(version)s.tar.Z``                                                     
``SOURCE_WHL``              Generic (non-compiled) Python 2 & Python 3 wheel package                                                         ``%(name)s-%(version)s-py2.py3-none-any.whl``                                           
``SOURCELOWER_WHL``         Generic (non-compiled) Python 2 & Python 3 wheel package with lowercase name                                     ``%(namelower)s-%(version)s-py2.py3-none-any.whl``                                      
``SOURCE_PY2_WHL``          Generic (non-compiled) Python 2 wheel package                                                                    ``%(name)s-%(version)s-py2-none-any.whl``                                               
``SOURCELOWER_PY2_WHL``     Generic (non-compiled) Python 2 wheel package with lowercase name                                                ``%(namelower)s-%(version)s-py2-none-any.whl``                                          
``SOURCE_PY3_WHL``          Generic (non-compiled) Python 3 wheel package                                                                    ``%(name)s-%(version)s-py3-none-any.whl``                                               
``SOURCELOWER_PY3_WHL``     Generic (non-compiled) Python 3 wheel package with lowercase name                                                ``%(namelower)s-%(version)s-py3-none-any.whl``                                          
========================    =============================================================================================================    ========================================================================================

