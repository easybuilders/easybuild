.. _vsd_avail_easyconfig_params:

.. _easyconfig_params:

*(see also* ``eb -a`` or ``eb --avail-easyconfig-params`` *)*

Available easyconfig parameters
===============================

mandatory parameters
--------------------

=========================    =============================================================================    =================
**Parameter name**           **Description**                                                                  **Default value**
=========================    =============================================================================    =================
``version``                  Version of software                                                              None             
``docurls``                  List of urls with documentation of the software (not necessarily on homepage)    None             
``toolchain``                Name and version of toolchain                                                    None             
``description``              A short description of the software                                              None             
``software_license_urls``    List of software license locations                                               None             
``software_license``         Software license                                                                 None             
``homepage``                 The homepage of the software                                                     None             
``name``                     Name of software                                                                 None             
=========================    =============================================================================    =================


toolchain parameters
--------------------

==================    =================================================================================================================================================================================================================================    =================
**Parameter name**    **Description**                                                                                                                                                                                                                      **Default value**
==================    =================================================================================================================================================================================================================================    =================
``onlytcmod``         Boolean/string to indicate if the toolchain should only load the environment with module (True) or also set all other variables (False) like compiler CC etc (if string: comma separated list of variables that will be ignored).    False            
``toolchainopts``     Extra options for compilers                                                                                                                                                                                                          None             
==================    =================================================================================================================================================================================================================================    =================


build parameters
----------------

=========================    =====================================================================================================================    =================
**Parameter name**           **Description**                                                                                                          **Default value**
=========================    =====================================================================================================================    =================
``preinstallopts``           Extra prefix options for installation.                                                                                   ""               
``versionprefix``            Additional prefix for software version (placed before version and toolchain name)                                        ""               
``tests``                    List of test-scripts to run after install. A test script should return a non-zero exit status to fail                    []               
``buildopts``                Extra options passed to make step (default already has -j X)                                                             ""               
``bitbucket_account``        Bitbucket account name to be used to resolve template values in source URLs                                              "%(namelower)s"  
``skip``                     Skip existing software                                                                                                   False            
``parallel``                 Degree of parallelism for e.g. make (default: based on the number of cores, active cpuset and restrictions in ulimit)    None             
``stop``                     Keyword to halt the build process after a certain step.                                                                  None             
``runtest``                  Indicates if a test should be run after make; should specify argument after make (for e.g.,"test" for make test)         None             
``sources``                  List of source files                                                                                                     []               
``versionsuffix``            Additional suffix for software version (placed after toolchain name)                                                     ""               
``preconfigopts``            Extra options pre-passed to configure.                                                                                   ""               
``checksums``                Checksums for sources and patches                                                                                        []               
``prebuildopts``             Extra options pre-passed to build command.                                                                               ""               
``sanity_check_commands``    format: [(name, options)] e.g. [('gzip','-h')]. Using a non-tuple is equivalent to (name, '-h')                          []               
``sanity_check_paths``       List of files and directories to check (format: {'files':<list>, 'dirs':<list>})                                         {}               
``installopts``              Extra options for installation                                                                                           ""               
``unpack_options``           Extra options for unpacking source                                                                                       ""               
``unwanted_env_vars``        List of environment variables that shouldn't be set during build                                                         []               
``patches``                  List of patches to apply                                                                                                 []               
``maxparallel``              Max degree of parallelism                                                                                                None             
``postinstallcmds``          Commands to run after the install step.                                                                                  []               
``easybuild_version``        EasyBuild-version this spec-file was written for                                                                         None             
``skipsteps``                Skip these steps                                                                                                         []               
``source_urls``              List of URLs for source files                                                                                            []               
``easyblock``                EasyBlock to use for building; if set to None, an easyblock is selected based on the software name                       None             
``hidden``                   Install module file as 'hidden' by prefixing its version with '.'                                                        False            
``github_account``           GitHub account name to be used to resolve template values in source URLs                                                 "%(namelower)s"  
``configopts``               Extra options passed to configure (default already has --prefix)                                                         ""               
=========================    =====================================================================================================================    =================


file-management parameters
--------------------------

========================    ==============================================================================================================================    =================
**Parameter name**          **Description**                                                                                                                   **Default value**
========================    ==============================================================================================================================    =================
``start_dir``               Path to start the make in. If the path is absolute, use that path. If not, this is added to the guessed path.                     None             
``keeppreviousinstall``     Boolean to keep the previous installation with identical name. Experts only!                                                      False            
``dontcreateinstalldir``    Boolean to create (False) or not create (True) the install directory                                                              False            
``cleanupoldbuild``         Boolean to remove (True) or backup (False) the previous build directory with identical name or not.                               True             
``cleanupoldinstall``       Boolean to remove (True) or backup (False) the previous install directory with identical name or not.                             True             
``buildininstalldir``       Boolean to build (True) or not build (False) in the installation directory                                                        False            
``keepsymlinks``            Boolean to determine whether symlinks are to be kept during copying or if the content of the files pointed to should be copied    False            
========================    ==============================================================================================================================    =================


dependencies parameters
-----------------------

======================    ==============================================================    =================
**Parameter name**        **Description**                                                   **Default value**
======================    ==============================================================    =================
``hiddendependencies``    List of dependencies available as hidden modules                  []               
``dependencies``          List of dependencies                                              []               
``osdependencies``        OS dependencies that should be present on the system              []               
``builddependencies``     List of build dependencies                                        []               
``allow_system_deps``     Allow listed system dependencies (format: (<name>, <version>))    []               
======================    ==============================================================    =================


license parameters
------------------

=======================    ===================================================================================================================================================    =================
**Parameter name**         **Description**                                                                                                                                        **Default value**
=======================    ===================================================================================================================================================    =================
``license_file``           License file for software                                                                                                                              None             
``license_server``         License server for software                                                                                                                            None             
``group``                  Name of the user group for which the software should be available; format: string or 2-tuple with group name + custom error for users outside group    None             
``license_server_port``    Port for license server                                                                                                                                None             
``key``                    Key for installing software                                                                                                                            None             
=======================    ===================================================================================================================================================    =================


extensions parameters
---------------------

==========================    ==================================================================================================    =================
**Parameter name**            **Description**                                                                                       **Default value**
==========================    ==================================================================================================    =================
``exts_classmap``             Map of extension name to class for handling build and installation.                                   {}               
``exts_default_options``      List of default options for extensions                                                                {}               
``exts_download_dep_fail``    Fail if downloaded dependencies are detected for extensions                                           False            
``exts_defaultclass``         List of module for and name of the default extension class                                            None             
``exts_list``                 List with extensions added to the base installation                                                   []               
``exts_filter``               Extension filter details: template for cmd and input to cmd (templates for name, version and src).    None             
==========================    ==================================================================================================    =================


modules parameters
------------------

==============================    ===========================================================================================================    =================
**Parameter name**                **Description**                                                                                                **Default value**
==============================    ===========================================================================================================    =================
``modextravars``                  Extra environment variables to be added to module file                                                         {}               
``usage``                         Usage instructions for the software                                                                            None             
``upstream_contacts``             String/list of strings with upstream contact addresses (e.g., support e-mail, mailing list, bugtracker)        None             
``recursive_module_unload``       Recursive unload of all dependencies when unloading module                                                     False            
``moduleforceunload``             Force unload of all modules when loading the extension                                                         False            
``moduleloadnoconflict``          Don't check for conflicts, unload other versions instead                                                       False            
``moduleclass``                   Module class to be used for this software                                                                      "base"           
``modaltsoftname``                Module name to use (rather than using software name                                                            None             
``allow_prepend_abs_path``        Allow specifying absolute paths to prepend in modextrapaths                                                    False            
``include_modpath_extensions``    Include $MODULEPATH extensions specified by module naming scheme.                                              True             
``examples``                      Free-form text with examples on using the software                                                             None             
``modaliases``                    Aliases to be defined in module file                                                                           {}               
``module_depends_on``             Use depends_on (Lmod 7.6.1+) for dependencies in generated module (implies recursive unloading of modules).    False            
``modtclfooter``                  Footer to include in generated module file (Tcl syntax)                                                        ""               
``modloadmsg``                    Message that should be printed when generated module is loaded                                                 {}               
``whatis``                        List of brief (one line) description entries for the software                                                  None             
``modluafooter``                  Footer to include in generated module file (Lua syntax)                                                        ""               
``site_contacts``                 String/list of strings with site contacts for the software                                                     None             
``docpaths``                      List of paths for documentation relative to installation directory                                             None             
``modextrapaths``                 Extra paths to be prepended in module file                                                                     {}               
==============================    ===========================================================================================================    =================


other parameters
----------------

==================    =====================================    =================
**Parameter name**    **Description**                          **Default value**
==================    =====================================    =================
``buildstats``        A list of dicts with build statistics    None             
==================    =====================================    =================


