.. _release_notes:

EasyBuild release notes
=======================

v1.16.0 (December 17th 2014)
----------------------------

feature + bugfix release

v1.15.2 (October 7th 2014)
--------------------------

bugfix release

**framework**

* fix ``$MODULEPATH`` extensions for Clang/CUDA, to make ``goolfc``/``cgoolf`` compatible with ``HierarchicalMNS`` (`#1050 <https://github.com/hpcugent/easybuild-framework/pull/1050>`_)
* include ``versionsuffix`` in module subdirectory with ``HierarchicalMNS`` (`#1050 <https://github.com/hpcugent/easybuild-framework/pull/1050>`_, `#1055 <https://github.com/hpcugent/easybuild-framework/pull/1055>`_)
* fix unit tests which were broken with bash patched for ShellShock bug (`#1051 <https://github.com/hpcugent/easybuild-framework/pull/1051>`_)
* add definition of gimpi toolchain, required to make gimkl toolchain compatible with ``HierarchicalMNS`` (`#1052 <https://github.com/hpcugent/easybuild-framework/pull/1052>`_)
* don't override ``COMPILER_MODULE_NAME`` obtained from ``ClangGCC`` in Clang-based toolchains (`#1053 <https://github.com/hpcugent/easybuild-framework/pull/1053>`_)
* fix wrong code in ``path_to_top_of_module_tree`` function (`#1054 <https://github.com/hpcugent/easybuild-framework/pull/1054>`_)
     * because of this, load statements for compilers were potentially included in higher-level modules under ``HierarchicalMNS``

**easyblocks**

* only disable sanitizer tests for recent Clang versions (`#481 <https://github.com/hpcugent/easybuild-framework/pull/481>`_, `#482 <https://github.com/hpcugent/easybuild-framework/pull/482>`_)
* pass down installopts to CUDA install command (`#483 <https://github.com/hpcugent/easybuild-framework/pull/483>`_)

**easyconfigs**

v1.15.1 (September 23rd 2014)
-----------------------------

bugfix release

**framework**

* take into account that multiple modules may be extending ``$MODULEPATH`` with the same path, when determining path to top of module tree (see `#1047 <https://github.com/hpcugent/easybuild-framework/pull/1047>`_)
      * this bug caused a load statement for either ``icc`` or ``ifort`` to be included in higher-level modules installed with an Intel-based compiler toolchain, under the ``HierarchicalMNS`` module naming scheme
* make ``HierarchicalMNS`` module naming scheme compatible with ``cgoolf`` and ``goolfc`` toolchain (`#1049 <https://github.com/hpcugent/easybuild-framework/pull/1049>`_)
* add definition of ``iompi`` (sub)toolchain to make ``iomkl`` toolchain compatible with ``HierarchicalMNS`` (`#1049 <https://github.com/hpcugent/easybuild-framework/pull/1049>`_)

**easyblocks**

(no changes compared to v1.15.0, simple version bump to stay in sync with easybuild-framework)

**easyconfigs**

v1.15.0 (September 12th 2014)
-----------------------------

feature + bugfix release

**framework**

* various other enhancements, including:
      * fetch extension sources in fetch_step to enhance ``--stop=fetch`` (`#978 <https://github.com/hpcugent/easybuild-framework/pull/978>`_)
      * add ``iimpi`` toolchain definition (`#993 <https://github.com/hpcugent/easybuild-framework/pull/993>`_)
      * prepend robot path with download location of files when ``--from-pr`` is used (`#995 <https://github.com/hpcugent/easybuild-framework/pull/995>`_)
      * add support for excluding module path extensions from generated modules (`#1003 <https://github.com/hpcugent/easybuild-framework/pull/1003>`_)
         * see ``include_modpath_extensions`` easyconfig parameter
      * add support for installing hidden modules and using them as dependencies (`#1009 <https://github.com/hpcugent/easybuild-framework/pull/1009>`_, `#1021 <https://github.com/hpcugent/easybuild-framework/pull/1021>`_, `#1023 <https://github.com/hpcugent/easybuild-framework/pull/1023>`_)
         * see ``--hidden`` and ``hiddendependencies`` easyconfig parameter
      * stop relying on ``conflict`` statement in module files to determine software name of toolchain components (`#1017 <https://github.com/hpcugent/easybuild-framework/pull/1017>`_, `#1037 <https://github.com/hpcugent/easybuild-framework/pull/1037>`_)
         * instead, the ``is_short_modname_for`` method defined by the module naming scheme implementation is queried
      * improve error message generated for a missing easyconfig file (`#1019 <https://github.com/hpcugent/easybuild-framework/pull/1019>`_)
      * include path where tweaked easyconfigs are placed in robot path (`#1032 <https://github.com/hpcugent/easybuild-framework/pull/1032>`_)
      * indicate forced builds in ``--dry-run`` output (`#1034 <https://github.com/hpcugent/easybuild-framework/pull/1034>`_)
      * fix interaction between ``--force`` and ``--try-toolchain --robot`` (`#1035 <https://github.com/hpcugent/easybuild-framework/pull/1035>`_)
      * add ``--software`` option, disable recursion for ``--try-software(-X)`` (`#1036 <https://github.com/hpcugent/easybuild-framework/pull/1036>`_)
* various bug fixes, including:
      * fix ``HierarchicalMNS`` crashing when MPI library is installed with a dummy toolchain (`#986 <https://github.com/hpcugent/easybuild-framework/pull/986>`_)
      * fix list of FFTW wrapper libraries for Intel MKL (`#987 <https://github.com/hpcugent/easybuild-framework/pull/987>`_)
      * fix stability of unit tests (`#988 <https://github.com/hpcugent/easybuild-framework/pull/988>`_, `#1027 <https://github.com/hpcugent/easybuild-framework/pull/1027>`_, `#1033 <https://github.com/hpcugent/easybuild-framework/pull/1033>`_)
      * make sure ``$SCALAPACK_INC_DIR`` (and ``$SCALAPACK_LIB_DIR``) are defined when using ``imkl`` (`#990 <https://github.com/hpcugent/easybuild-framework/pull/990>`_)
      * fix error message on missing FFTW wrapper libs (`#992 <https://github.com/hpcugent/easybuild-framework/pull/992>`_)
      * fix duplicate toolchain elements in ``--list-toolchains`` output (`#993 <https://github.com/hpcugent/easybuild-framework/pull/993>`_)
      * filter out load statements that extend the ``$MODULEPATH`` to make the module being installed available (`#1016 <https://github.com/hpcugent/easybuild-framework/pull/1016>`_)
      * fix conflict specification included in module files (`#1017 <https://github.com/hpcugent/easybuild-framework/pull/1017>`_)
      * avoid ``--from-pr`` crashing hard unless ``--robot`` is used (`#1022 <https://github.com/hpcugent/easybuild-framework/pull/1022>`_)
      * properly quote GCC version string in archived easyconfig (`#1028 <https://github.com/hpcugent/easybuild-framework/pull/1028>`_)
      * fix issue with ``--repositorypath`` not honoring ``--prefix`` (`#1031 <https://github.com/hpcugent/easybuild-framework/pull/1031>`_)
      * sync with latest vsc-base version to fix log order (`#1039 <https://github.com/hpcugent/easybuild-framework/pull/1039>`_)
      * increase # commits per page for ``--from-pr`` (`#1040 <https://github.com/hpcugent/easybuild-framework/pull/1040>`_)

**easyblocks**

* added support for **2** new software packages that requires customized support:
      * Modeller (`#392 <https://github.com/hpcugent/easybuild-framework/pull/392>`_), NAMD (`#397 <https://github.com/hpcugent/easybuild-framework/pull/397>`_)
* various enhancements, including:
      * fix locale used for running Perl unit tests (`#425 <https://github.com/hpcugent/easybuild-framework/pull/425>`_)
      * fix Rmpi easyblock to correctly configure for Intel MPI (`#435 <https://github.com/hpcugent/easybuild-framework/pull/435>`_)
      * add support in generic Rpackage easyblock for handling patches (`#435 <https://github.com/hpcugent/easybuild-framework/pull/435>`_)
      * enhance OpenFOAM easyblock: fix building MPI build of Pstream and (pt)scotchDecomp + overall cleanup (`#436 <https://github.com/hpcugent/easybuild-framework/pull/436>`_)
      * enhance NWChem easyblock for version 6.3, clean up running of test cases (`#441 <https://github.com/hpcugent/easybuild-framework/pull/441>`_)
      * enhance noqa for interactive configuration of Qt build procedure (`#447 <https://github.com/hpcugent/easybuild-framework/pull/447>`_)
      * add custom sanity check for R in easyblock (`#449 <https://github.com/hpcugent/easybuild-framework/pull/449>`_)
      * make perlmodule take into account ``(pre){config,build,install}opts`` (`#450 <https://github.com/hpcugent/easybuild-framework/pull/450>`_)
      * add support for specifying an activation key after installing Mathematica (`#452 <https://github.com/hpcugent/easybuild-framework/pull/452>`_)
      * consider both ``lib`` and ``lib64`` directories in netCDF sanity check (`#453 <https://github.com/hpcugent/easybuild-framework/pull/453>`_)
      * fix sanity check for ANSYS for v15.0.x (`#458 <https://github.com/hpcugent/easybuild-framework/pull/458>`_)
      * fix Trilinos easyblock for recent version (`#462 <https://github.com/hpcugent/easybuild-framework/pull/462>`_)
      * enhance impi easyblock to handle install subdir for impi v5.0.1 and future version (`#465 <https://github.com/hpcugent/easybuild-framework/pull/465>`_, `#472 <https://github.com/hpcugent/easybuild-framework/pull/472>`_)
      * include $CFLAGS in linker flags for HPL (`#466 <https://github.com/hpcugent/easybuild-framework/pull/466>`_)
      * update sanity test checks for GROMACS 5.x (`#471 <https://github.com/hpcugent/easybuild-framework/pull/471>`_)
* various bug fixes:
      * fix building of FFTW wrappers for Intel MKL v11.1.x + cleanup of imkl easyblock (`#445 <https://github.com/hpcugent/easybuild-framework/pull/445>`_)

**easyconfigs**


v1.14.0 (July 9th 2014)
-----------------------

feature + bugfix release

**framework**

* important changes
      * required Lmod version bumped to v5.6.3 (`#944 <https://github.com/hpcugent/easybuild-framework/pull/944>`_)
          * required due to enhancements and bug fixes in Lmod, e.g. making ``--terse avail`` significantly faster, and
            correctly handling a ``prepend-path`` statement that includes multiple directories at once
      * required Tcl/C environment modules version set to 3.2.10 (
          * hard requirement due to fixed ``modulecmd`` segmentation fault bug, that only tends manifests itself
            when making a large amount of changes in the environment (e.g. ``module load <toolchain>``)
      * renamed ``EasyBuildModuleNamingScheme`` to ``EasyBuildMNS``
* enhanced custom module naming schemes functionality to support hierarchical module naming schemes (`#953 <https://github.com/hpcugent/easybuild-framework/pull/953>`_, `#971 <https://github.com/hpcugent/easybuild-framework/pull/971>`_, `#975 <https://github.com/hpcugent/easybuild-framework/pull/975>`_)
      * extended API for custom module naming schemes to allow tweaking different aspects of module naming
          * see ``easybuild/tools/module_naming_scheme/mns.py`` for abstract ``ModuleNamingScheme`` class
          * an example hierarchical module naming scheme is included, see ``HierarchicalMNS``
      * split up full module names into a module subdirectory part, which becomes part of ``$MODULEPATH``),
        and a 'short' module name (is exposed to end-users)

          * example: ``GCC/4.7.2`` in ``Core`` subdir, ``OpenMPI/1.6.5`` in ``Compiler/GCC/4.7.2`` subdir
      * make ``ModuleNamingScheme`` class a singleton, move it into ``easybuild.tools.module_naming_scheme.mns`` module
      * implement ``ActiveMNS`` wrapper class for quering active module naming scheme
      * implement toolchain inspection functions that can be used in a custom module naming scheme
          * ``det_toolchain_compilers``, ``det_toolchain_mpi`` in ``easybuild.tools.module_naming_scheme.toolchain``
      * significant code cleanup & enhanced unit tests
* enhance & clean up ``tools/modules.py`` (`#944 <https://github.com/hpcugent/easybuild-framework/pull/944>`_, `#953 <https://github.com/hpcugent/easybuild-framework/pull/953>`_, `#963 <https://github.com/hpcugent/easybuild-framework/pull/963>`_, `#964 <https://github.com/hpcugent/easybuild-framework/pull/964>`_, `#969 <https://github.com/hpcugent/easybuild-framework/pull/969>`_)
      * make ``ModulesTool`` a singleton to avoid repeating module commands over & over again needlessly
      * use ``module use``, ``module unuse`` rather than fiddling with ``$MODULEPATH`` directly
      * improve debug logging (include full stdout/stderr output of module commands)
      * remove deprecated functionality (``add_module``, ``remove_module``, indirect module load)
* various other enhancements, including:
      * added toolchain definitions for 'common' toolchains: ``intel`` and ``foss`` (`#956 <https://github.com/hpcugent/easybuild-framework/pull/956>`_)
      * implement caching for easyconfig files, parsed easyconfigs and toolchains (`#953 <https://github.com/hpcugent/easybuild-framework/pull/953>`_)
      * enable ``--ignore-osdeps`` implicitely when ``-D``, ``--dry-run`` or ``--dep-graph`` are used (`#953 <https://github.com/hpcugent/easybuild-framework/pull/953>`_)
      * flesh out ``use_group`` and ``det_parallelism`` function, include them in ``easybuild.tools.systemtools`` (`#953 <https://github.com/hpcugent/easybuild-framework/pull/953>`_)
      * make symlinking of module files part of module naming scheme API (`#973 <https://github.com/hpcugent/easybuild-framework/pull/973>`_)
          * list of symlinks paths can be controlled using ``det_module_symlink_paths()`` method
      * added support for new configuration options:
          * tweaking compiler flags triggered by ``optarch`` toolchain options using ``--optarch`` (`#949 <https://github.com/hpcugent/easybuild-framework/pull/949>`_)
          * filtering out dependencies from easyconfig files using ``--filter-deps`` (`#957 <https://github.com/hpcugent/easybuild-framework/pull/957>`_)
          * filtering environment included in test reports with ``--test-report-env-filter`` (`#959 <https://github.com/hpcugent/easybuild-framework/pull/959>`_)
            e.g. ``--test-report-env-filter='^SSH|USER|HOSTNAME|UID|.*COOKIE.*'``
          * made suffix used for module files install path configurable, using ``--suffix-modules-path`` (`#973 <https://github.com/hpcugent/easybuild-framework/pull/973>`_)
      * added support for additional easyconfig parameters:
          * define aliases in module files (``modaliases``) (`#952 <https://github.com/hpcugent/easybuild-framework/pull/952>`_)
          * add print message on module load (``modloadmsg``) and Tcl footer (``modtclfooter``) in module files (`#954 <https://github.com/hpcugent/easybuild-framework/pull/954>`_, `#974 <https://github.com/hpcugent/easybuild-framework/pull/974>`_) 
* various bug fixes, including:
      * don't try to tweak generated easyconfigs when using ``--try-X`` (`#942 <https://github.com/hpcugent/easybuild-framework/pull/942>`_)
      * currently create symlinks to module files modules/all under a custom module naming scheme (`#953 <https://github.com/hpcugent/easybuild-framework/pull/953>`_)
      * restore traceback error reporting on hard crashes (`#965 <https://github.com/hpcugent/easybuild-framework/pull/965>`_)

**easyblocks**

* added **one** new `generic` easyblock: CmdCp (`#395 <https://github.com/hpcugent/easybuild-framework/pull/395>`_)
* added support for **2** new software packages that requires customized support:
      * ANSYS (`#398 <https://github.com/hpcugent/easybuild-framework/pull/398>`_), HPCG (`#408 <https://github.com/hpcugent/easybuild-framework/pull/408>`_)
* various enhancements, including:
      * updated ABAQUS easyblock so that it works for version 13.2 (`#406 <https://github.com/hpcugent/easybuild-framework/pull/406>`_)
      * enhance BLAT easyblock by using ``super``'s ``build_step`` and ``prebuildopts``/``buildopts`` (`#423 <https://github.com/hpcugent/easybuild-framework/pull/423>`_)
      * enhance Mothur easyblock to guess correct start dir for recent versions (`#424 <https://github.com/hpcugent/easybuild-framework/pull/424>`_)
      * replace use of deprecated (pre)makeopts with (``pre``)``buildopts`` in all easyblocks (`#427 <https://github.com/hpcugent/easybuild-framework/pull/427>`_)
      * fix poor mans version of toolchain compiler detection in imkl easyblock (`#429 <https://github.com/hpcugent/easybuild-framework/pull/429>`_)
* various bug fixes:
      * only check for ``idb`` for older versions of icc (`#426 <https://github.com/hpcugent/easybuild-framework/pull/426>`_)
      * fix issues with installing RPMS when ``rpmrebuild`` is required (`#433 <https://github.com/hpcugent/easybuild-framework/pull/433>`_)
      * correctly disable parallel build for ATLAS (`#434 <https://github.com/hpcugent/easybuild-framework/pull/434>`_)
      * fix sanity check for Intel MPI v5.x (only provides bin64) (`#432 <https://github.com/hpcugent/easybuild-framework/pull/432>`_)
      * add ``$MIC_LD_LIBRARY_PATH`` for MKL v11.x (`#437 <https://github.com/hpcugent/easybuild-framework/pull/437>`_)

**easyconfigs**

v1.13.0 (May 29th 2014)
-----------------------

feature + bugfix release

**framework**

* make ``--try-X`` command line options work recursively (i.e. collaborate with ``--robot``) (`#922 <https://github.com/hpcugent/easybuild-framework/pull/922>`_)
      * EasyBuild will first build a full dependency graph of the specified easyconfigs, and then apply the ``--try`` specifications
          * the elements of the dependency graph for the used toolchain and its dependencies are left untouched
      * this makes ``eb foo-1.0-goolf-1.4.10.eb --try-toolchain=ictce,5.5.0 --robot`` also work when ``foo`` has dependencies
      * caveat: the specified easyconfig files must all use the same toolchain (version)
* add support for testing easyconfig pull requests from EasyBuild command line (`#920 <https://github.com/hpcugent/easybuild-framework/pull/920>`_, `#924 <https://github.com/hpcugent/easybuild-framework/pull/924>`_, `#925 <https://github.com/hpcugent/easybuild-framework/pull/925>`_, `#932 <https://github.com/hpcugent/easybuild-framework/pull/932>`_, `#933 <https://github.com/hpcugent/easybuild-framework/pull/933>`_, `#938 <https://github.com/hpcugent/easybuild-framework/pull/938>`_)
      * add ``--from-pr`` command line option for downloading easyconfig files from pull requests
      * add ``--upload-test-report`` command line option for uploading a detailed test report to GitHub as a gist
          * this requires specifying a GitHub username for which a GitHub token is available, using ``--github-user``
          * with ``--dump-test-report``, the test report can simply be dumped to file rather than being uploaded to GitHub
          * see also https://github.com/hpcugent/easybuild/wiki/Review-process-for-contributions#testing-result
* the ``makeopts`` and ``premakeopts`` easyconfig parameter are deprecated, and replaced by ``buildopts`` and ``prebuildopts`` (`#918 <https://github.com/hpcugent/easybuild-framework/pull/918>`_)
      * both ``makeopts`` and ``premakeopts`` will still be honored in future EasyBuild v1.x versions, but should no longer be used
* various other enhancements, including:
      * add ``--disable-cleanup-builddir`` command line option, to keep the build dir after a (successful) build (`#853 <https://github.com/hpcugent/easybuild-framework/pull/853>`_)
          * the build dir is still cleaned up by default for successful builds, i.e. ``--cleanup-builddir`` is the default
      * also consider lib32 in paths checked for ``$LD_LIBRARY_PATH`` and ``$LIBRARY_PATH`` (`#912 <https://github.com/hpcugent/easybuild-framework/pull/912>`_)
      * reorganize support for file/git/svn repositories into ``repository`` package, making it extensible (`#913 <https://github.com/hpcugent/easybuild-framework/pull/913>`_)
      * add support for ``postinstallcmds`` easyconfig parameter, to specify commands that need to be run after the install step (`#918 <https://github.com/hpcugent/easybuild-framework/pull/918>`_)
      * make ``VERSION=`` part in version of C environment modules tool optional, which is required for older versions (`#930 <https://github.com/hpcugent/easybuild-framework/pull/930>`_)
* various bug fixes, including:
      * fix small issues in bootstrap script: correctly determine EasyBuild version and make sure modules path exists (`#915 <https://github.com/hpcugent/easybuild-framework/pull/915>`_)
      * fix github unit tests (`#916 <https://github.com/hpcugent/easybuild-framework/pull/916>`_)
      * disable useless debug logging for unit tests (`#919 <https://github.com/hpcugent/easybuild-framework/pull/919>`_)
      * fix unit test for ``--skip`` (`#929 <https://github.com/hpcugent/easybuild-framework/pull/929>`_)
      * make sure ``start_dir`` can be set based on location of unpacked first source file (`#931 <https://github.com/hpcugent/easybuild-framework/pull/931>`_)
      * the ``vsc`` package shipped with easybuild-framework is synced with vsc-base v1.9.1 (`#935 <https://github.com/hpcugent/easybuild-framework/pull/935>`_)
          * fancylogger (used for logging in EasyBuild) is now robust against strings containing UTF8 characters
          * the ``deprecated`` logging function now does a non-strict version check (rather than an erroneous strict check)
          * the ``easybuild.tools.agithub`` module is removed, ``vsc.utils.rest`` now provides the required functionality
      * fix support for unpacking gzipped source files, don't unpack ``.gz`` files in-place in the source directory (`#936 <https://github.com/hpcugent/easybuild-framework/pull/936>`_)

**easyblocks**

* added support for **1** new software package that requires customized support:
      * Go (`#417 <https://github.com/hpcugent/easybuild-framework/pull/417>`_)
* various enhancements, including:
      * enhance OpenFOAM easyblock so OpenFOAM-Extend fork can be built too + style fixes (`#253 <https://github.com/hpcugent/easybuild-framework/pull/253>`_, `#416 <https://github.com/hpcugent/easybuild-framework/pull/416>`_)
      * enhance CPLEX easyblock by adding support for staged installation (`#372 <https://github.com/hpcugent/easybuild-framework/pull/372>`_)
      * include support for ``configure_cmd_prefix`` easyconfig parameter in ConfigureMake generic easyblock (`#393 <https://github.com/hpcugent/easybuild-framework/pull/393>`_)
      * enhance GCC easyblock for building v4.9.0 and versions prior to v4.5 (`#396 <https://github.com/hpcugent/easybuild-framework/pull/396>`_, `#400 <https://github.com/hpcugent/easybuild-framework/pull/400>`_)
      * enhance easyblocks for Intel ipp and itac to support recent versions (`#399 <https://github.com/hpcugent/easybuild-framework/pull/399>`_)
      * enhance Clang easyblock: install static analyzer (`#402 <https://github.com/hpcugent/easybuild-framework/pull/402>`_), be more robust against changing source dir names (`#413 <https://github.com/hpcugent/easybuild-framework/pull/413>`_)
      * enhance FoldX easyblock, update list of potential FoldX binaries to support recent versions (`#407 <https://github.com/hpcugent/easybuild-framework/pull/407>`_)
      * add runtime patching in Boost easyblock to fix build issue with old Boost versions and recent glibc (> 2.15) (`#412 <https://github.com/hpcugent/easybuild-framework/pull/412>`_)
      * enhance ``MakeCp`` generic easyblock: use location of 1st unpacked source as fallback base dir for ``files_to_copy`` (`#415 <https://github.com/hpcugent/easybuild-framework/pull/415>`_)
* various bug fixes:
      * fix installing Mathematica when X forwarding is enabled (make sure ``$DISPLAY`` is unset) (`#391 <https://github.com/hpcugent/easybuild-framework/pull/391>`_)
      * fix permissions of installed files in SAMtools easyblock, ensure read/execute for group/other (`#409 <https://github.com/hpcugent/easybuild-framework/pull/409>`_)
      * fix implementation of ``det_pylibdir`` function in PythonPackage generic easyblock (`#419 <https://github.com/hpcugent/easybuild-framework/pull/419>`_, `#420 <https://github.com/hpcugent/easybuild-framework/pull/420>`_)
          * determine Python lib dir via ``distutils`` Python, which works cross-OS (as opposed to hardcoding ``lib``)

**easyconfigs**

v1.12.1 (April 25th 2014)
-------------------------

bugfix release

**framework**

* return to original directory after executing a command in a subdir (`#908 <https://github.com/hpcugent/easybuild-framework/pull/908>`_)
* fix bootstrap with Lmod, fix issue with module function check and Lmod (`#911 <https://github.com/hpcugent/easybuild-framework/pull/911>`_)

**easyblocks**

(no changes compared to v1.12.0, simple version bump to stay in sync with easybuild-framework)

**easyconfigs**

v1.12.0 (April 4th 2014)
------------------------

feature + bugfix release

**framework**

* various enhancements, including:
      * completed support for custom module naming schemes (`#879 <https://github.com/hpcugent/easybuild-framework/pull/879>`_, `#904 <https://github.com/hpcugent/easybuild-framework/pull/904>`_)
          * a fully parsed easyconfig file is now passed to the ``det_full_module_name`` function
          * this does require that an easyconfig file matching the dependency specification is available
      * added more features to better support using a shared install target with multiple users (`#902 <https://github.com/hpcugent/easybuild-framework/pull/902>`_, `#903 <https://github.com/hpcugent/easybuild-framework/pull/903>`_, `#904 <https://github.com/hpcugent/easybuild-framework/pull/904>`_)
      * further development on support for new easyconfig format (v2.0) (`#844 <https://github.com/hpcugent/easybuild-framework/pull/844>`_, `#848 <https://github.com/hpcugent/easybuild-framework/pull/848>`_)
          * not considered stable yet, so still requires using ``--experimental``
      * enhanced bootstrap script to also support Lmod and ``modulecmd.tcl`` module tools (`#869 <https://github.com/hpcugent/easybuild-framework/pull/869>`_)
      * added support to ``run_cmd_qa`` function to supply a list of answers  (`#887 <https://github.com/hpcugent/easybuild-framework/pull/887>`_)
      * detect mismatch between definition of ``module`` function and selected modules tool (`#871 <https://github.com/hpcugent/easybuild-framework/pull/871>`_)
          * allowing mismatch now requires ``--allow-modules-tool-mismatch``; an empty ``module`` function is simply ignored
      * provide lib64 fallback option for directories in default sanity check paths (`#896 <https://github.com/hpcugent/easybuild-framework/pull/896>`_)
      * add support for adding JAR files to ``$CLASSPATH`` (`#898 <https://github.com/hpcugent/easybuild-framework/pull/898>`_)
      * enhanced and cleaned up unit tests (`#877 <https://github.com/hpcugent/easybuild-framework/pull/877>`_, `#880 <https://github.com/hpcugent/easybuild-framework/pull/880>`_, `#884 <https://github.com/hpcugent/easybuild-framework/pull/884>`_, `#899 <https://github.com/hpcugent/easybuild-framework/pull/899>`_, `#901 <https://github.com/hpcugent/easybuild-framework/pull/901>`_)
      * code cleanup and refactoring
          * get rid of global variable for configuration settings in ``config.py``, use singleton instead (`#874 <https://github.com/hpcugent/easybuild-framework/pull/874>`_, `#888 <https://github.com/hpcugent/easybuild-framework/pull/888>`_, `#890 <https://github.com/hpcugent/easybuild-framework/pull/890>`_, `#892 <https://github.com/hpcugent/easybuild-framework/pull/892>`_)
          * track build options via singleton in ``config.py`` rather than passing them around all over (`#886 <https://github.com/hpcugent/easybuild-framework/pull/886>`_, `#889 <https://github.com/hpcugent/easybuild-framework/pull/889>`_)
          * avoid parsing easyconfig files multiple times by passing a parsed easyconfig to the easyblock (`#891 <https://github.com/hpcugent/easybuild-framework/pull/891>`_)
          * deprecate list of tuples return type of ``extra_options`` static method (`#893 <https://github.com/hpcugent/easybuild-framework/pull/893>`_, `#894 <https://github.com/hpcugent/easybuild-framework/pull/894>`_)
          * move OS dependency check to ``systemtools.py`` module (`#895 <https://github.com/hpcugent/easybuild-framework/pull/895>`_)
* bug fixes, including:
         fix linking with ``-lcudart`` if CUDA is part of the toolchain, should also include ``-lrt`` (`#882 <https://github.com/hpcugent/easybuild-framework/pull/882>`_)

**easyblocks**

* various enhancements, including:
      * also run ``Perl Build build`` for Perl modules (usually not required, but sometimes it is) (`#380 <https://github.com/hpcugent/easybuild-framework/pull/380>`_)
      * added glob support in generic makecp block (`#367 <https://github.com/hpcugent/easybuild-framework/pull/367>`_, `#384 <https://github.com/hpcugent/easybuild-framework/pull/384>`_)
      * enhance sanity check in GCC easyblock such that it also passes/works on OpenSuSE (`#365 <https://github.com/hpcugent/easybuild-framework/pull/365>`_)
      * add multilib support in GCC easyblock (`#379 <https://github.com/hpcugent/easybuild-framework/pull/379>`_)
* various bug fixes:
      * Clang: disable sanitizer tests when vmem limit is set (`#366 <https://github.com/hpcugent/easybuild-framework/pull/366>`_)
      * make sure all libraries are installed for recent Intel MKL versions (`#375 <https://github.com/hpcugent/easybuild-framework/pull/375>`_)
      * fix appending Intel MPI include directories to ``$CPATH`` (`#371 <https://github.com/hpcugent/easybuild-framework/pull/371>`_)
      * statically link readline/ncurses libraries in Python and NWChem easyblocks (`#370 <https://github.com/hpcugent/easybuild-framework/pull/370>`_, `#383 <https://github.com/hpcugent/easybuild-framework/pull/383>`_, `#385 <https://github.com/hpcugent/easybuild-framework/pull/385>`_)
      * fix easyblock unit tests after changes in framework (`#376 <https://github.com/hpcugent/easybuild-framework/pull/376>`_, `#377 <https://github.com/hpcugent/easybuild-framework/pull/377>`_, `#378 <https://github.com/hpcugent/easybuild-framework/pull/378>`_)

**easyconfigs**

v1.11.1 (February 28th 2014)
----------------------------

bugfix release

**framework**

* various bug fixes, including:
      * fix hard crash when ``$LMOD_CMD`` specified full path to lmod binary, but ``spider`` binary is not in ``$PATH`` (`#861 <https://github.com/hpcugent/easybuild-framework/pull/861>`_, `#873 <https://github.com/hpcugent/easybuild-framework/pull/873>`_)
      * fix bug in initialisation of repositories, causing problems when a repository subdirectory is specified (`#852 <https://github.com/hpcugent/easybuild-framework/pull/852>`_)
      * avoid long wait when dependency resolution fails if ``--robot`` is not specified (`#875 <https://github.com/hpcugent/easybuild-framework/pull/875>`_)

**easyblocks**

(no changes compared to v1.11.0, simple version bump to stay in sync with easybuild-framework)

**easyconfigs**

v1.11.0 (February 16th 2014)
----------------------------

feature + bugfix release

**framework**

* various enhancements, including:
      * add checksum support for extensions (`#807 <https://github.com/hpcugent/easybuild-framework/pull/807>`_)
      * make checksum functionality more memory efficient by reading in blocks (`#836 <https://github.com/hpcugent/easybuild-framework/pull/836>`_)
      * rewrite of dependency solving for speed and better reporting of missing dependencies (`#806 <https://github.com/hpcugent/easybuild-framework/pull/806>`_, `#818 <https://github.com/hpcugent/easybuild-framework/pull/818>`_)
      * refactoring of ``main.py`` (`#815 <https://github.com/hpcugent/easybuild-framework/pull/815>`_, `#828 <https://github.com/hpcugent/easybuild-framework/pull/828>`_)
          * function/method signatures to pass down build options
          * move functions from main.py into easybuild.framework.X or easybuild.tools
      * provide better build statistics (`#824 <https://github.com/hpcugent/easybuild-framework/pull/824>`_)
      * add --experimental, ``--deprecated`` and ``--oldstyleconfig`` command line options (`#838 <https://github.com/hpcugent/easybuild-framework/pull/838>`_)
          * with ``--experimental``, new but incomplete (or partially broken) features are enabled
          * with ``--deprecated``, removed of deprecated functionality can be tested (anything deprecated will fail hard)
          * with ``--disable-oldstyleconfig``, support for the old style configuration is disabled
      * define ``$LIBRARY_PATH`` in generated module files (`#832 <https://github.com/hpcugent/easybuild-framework/pull/832>`_)
      * more constants for source URLs (e.g. for downloads from bitbucket) (`#831 <https://github.com/hpcugent/easybuild-framework/pull/831>`_)
      * prefer ``$XDG_CONFIG_HOME`` and ``~/.config/easybuild`` over ``~/.easybuild`` for configuration files (`#820 <https://github.com/hpcugent/easybuild-framework/pull/820>`_)
      * add support for specifying footers to be appended to generated module files (`#808 <https://github.com/hpcugent/easybuild-framework/pull/808>`_)
          * see ``--modules-footer`` command line option
      * track version of modules tool + cleanup of ``modules.py`` (`#839 <https://github.com/hpcugent/easybuild-framework/pull/839>`_)
      * move actual ``run_cmd`` and ``run_cmd_qa`` implementations from ``tools.filetools`` into ``tools.run`` (`#842 <https://github.com/hpcugent/easybuild-framework/pull/842>`_, `#843 <https://github.com/hpcugent/easybuild-framework/pull/843>`_)
      * add support for generating modules that support recursive unloading (`#830 <https://github.com/hpcugent/easybuild-framework/pull/830>`_)
          * see ``--recursive-module-unload`` command line option
      * add flexibility support for specifying OS dependencies (`#846 <https://github.com/hpcugent/easybuild-framework/pull/846>`_)
          * alternatives can be specified, e.g. (``openssl-devel``, ``libssl-dev``)
      * initial (incomplete) support for easyconfig files in new format (v2.0) (`#810 <https://github.com/hpcugent/easybuild-framework/pull/810>`_, `#826 <https://github.com/hpcugent/easybuild-framework/pull/826>`_, `#827 <https://github.com/hpcugent/easybuild-framework/pull/827>`_, `#841 <https://github.com/hpcugent/easybuild-framework/pull/841>`_)
          * requires ``--experimental`` to be able to experiment with format v2 easyconfig files
* various bug fixes, including:
      * fix problems with use of new-style configuration file (`#821 <https://github.com/hpcugent/easybuild-framework/pull/821>`_)
      * fix removal of old build directories, unless ``cleanupoldbuild`` easyconfig parameter is set (`#809 <https://github.com/hpcugent/easybuild-framework/pull/809>`_)
      * fix support for different types of repository path specifications (`#814 <https://github.com/hpcugent/easybuild-framework/pull/814>`_)
      * fix unit tests sensitive to ``$MODULEPATH`` and available easyblocks (`#845 <https://github.com/hpcugent/easybuild-framework/pull/845>`_)

**easyblocks**

* added **one** new `generic` easyblock: ``VSCPythonPackage`` (`#348 <https://github.com/hpcugent/easybuild-framework/pull/348>`_)
* added support for **1** new software package that requires customized support:
      * netcdf4-python (`#347 <https://github.com/hpcugent/easybuild-framework/pull/347>`_)
* various enhancements, including:
      * add support for installing recent tbb versions (`#341 <https://github.com/hpcugent/easybuild-framework/pull/341>`_)
      * use ``makeopts`` in the build step of the generic ``PythonPackage`` easyblock (`#352 <https://github.com/hpcugent/easybuild-framework/pull/352>`_)
      * define the ``$CMAKE_INCLUDE_PATH`` and ``$CMAKE_LIBRARY_PATH`` in the generic ``CMakeMake`` easyblock (`#351 <https://github.com/hpcugent/easybuild-framework/pull/351>`_, `#360 <https://github.com/hpcugent/easybuild-framework/pull/360>`_)
      * update Clang easyblock to support v3.4 (`#346 <https://github.com/hpcugent/easybuild-framework/pull/346>`_)
      * make sure Python is built with SSL support, adjust Python easyblock to pick up OpenSSL dep (`#359 <https://github.com/hpcugent/easybuild-framework/pull/359>`_)
          * note: providing OpenSSL via an OS package is still recommended, such that security updates are picked up
      * add support for recent netCDF versions (`#347 <https://github.com/hpcugent/easybuild-framework/pull/347>`_)
      * update SuiteSparse easyblock for new versions, and clean it up a bit (`#350 <https://github.com/hpcugent/easybuild-framework/pull/350>`_)
* various bug fixes:
      * fix name of ``VersionIndependentPythonPackage`` easyblock, deprecate ``VersionIndependendPythonPackage`` easyblock (`#348 <https://github.com/hpcugent/easybuild-framework/pull/348>`_)
      * fix detection of machine architecture in FSL easyblock (`#353 <https://github.com/hpcugent/easybuild-framework/pull/353>`_)
      * fix bug in NWChem easyblock w.r.t. creating local dummy ``.nwchem`` file (`#360 <https://github.com/hpcugent/easybuild-framework/pull/360>`_)
      * make sure ``$LIBRARY_PATH`` is set for Intel compilers and Intel MPI, fix 64-bit specific paths (`#360 <https://github.com/hpcugent/easybuild-framework/pull/360>`_)

**easyconfigs**

v1.10.0 (December 24th 2013)
----------------------------

feature + bugfix release

**framework**

* various enhancements, including:
      * set unique default temporary directory, add ``--tmpdir`` command line option (`#695 <https://github.com/hpcugent/easybuild-framework/pull/695>`_)
      * add support for computing and verifying source/patch file checksums (`#774 <https://github.com/hpcugent/easybuild-framework/pull/774>`_, `#777 <https://github.com/hpcugent/easybuild-framework/pull/777>`_, `#779 <https://github.com/hpcugent/easybuild-framework/pull/779>`_, `#801 <https://github.com/hpcugent/easybuild-framework/pull/801>`_, `#802 <https://github.com/hpcugent/easybuild-framework/pull/802>`_)
          * cfr. ``checksums`` easyconfig parameter
      * add support for `eb --confighelp`, which prints out an example configuration file (`#775 <https://github.com/hpcugent/easybuild-framework/pull/775>`_)
      * add initial support for ``eb`` tab completion in bash shells (`#775 <https://github.com/hpcugent/easybuild-framework/pull/775>`_, `#797 <https://github.com/hpcugent/easybuild-framework/pull/797>`_, `#798 <https://github.com/hpcugent/easybuild-framework/pull/798>`_) 
          * see also https://github.com/hpcugent/easybuild/wiki/Setting-up-tab-completion-for-bash
          * note: may be quite slow for now
      * enhancements for using Lmod as modules tool (`#780 <https://github.com/hpcugent/easybuild-framework/pull/780>`_, `#795 <https://github.com/hpcugent/easybuild-framework/pull/795>`_, `#796 <https://github.com/hpcugent/easybuild-framework/pull/796>`_):
          * ignore Lmod spider cache by setting ``$LMOD_IGNORE_CACHE`` (requires Lmod 5.2)
          * bump required Lmod version to v5.2
          * get rid of slow workaround for detecting module directories (only required for older Lmod versions)
          * fix version parsing for Lmod release candidates (rc)
          * improve integration with `lmod spider` by adding ``Description: `` prefix to ``module-whatis`` field of module
      * add ``--dry-short-short``/``-D`` and ``--search-short``/``-S`` command line options (`#781 <https://github.com/hpcugent/easybuild-framework/pull/781>`_)
      * add toolchain definition for 'gompic', intended for using with CUDA-aware OpenMPI (`#783 <https://github.com/hpcugent/easybuild-framework/pull/783>`_)
      * add support for specifying multiple robot paths (`#786 <https://github.com/hpcugent/easybuild-framework/pull/786>`_)
      * add various source URL constants, add support for ``%(nameletter)s`` and ``%(nameletterlower)s`` templates (`#793 <https://github.com/hpcugent/easybuild-framework/pull/793>`_)
      * add ``buildininstalldir`` easyconfig parameter (`#794 <https://github.com/hpcugent/easybuild-framework/pull/794>`_)
      * add ``--ignore-osdeps`` command line option (`#799 <https://github.com/hpcugent/easybuild-framework/pull/799>`_, `#802 <https://github.com/hpcugent/easybuild-framework/pull/802>`_)
* various bug fixes, including:
      * enable ``-mt_mpi`` compiler flag if both ``usempi`` and ``openmp`` toolchain options are enabled (`#771 <https://github.com/hpcugent/easybuild-framework/pull/771>`_)
      * only use ``libmkl_solver*`` libraries for Intel MKL versions prior to 10.3 (`#776 <https://github.com/hpcugent/easybuild-framework/pull/776>`_)
      * fix toolchain support for recent Intel tools (`#785 <https://github.com/hpcugent/easybuild-framework/pull/785>`_)
      * code style fixes in ``main.py`` to adhere more to PEP8 (`#789 <https://github.com/hpcugent/easybuild-framework/pull/789>`_)
      * make sure ``easyblock`` easyconfig parameter is listed in ``eb -a`` (`#791 <https://github.com/hpcugent/easybuild-framework/pull/791>`_)
      * fix error that may pop up when using ``skipsteps=source`` (`#792 <https://github.com/hpcugent/easybuild-framework/pull/792>`_)

**easyblocks**

* added **one** new `generic` easyblock: ``VersionIndependendPythonPackage`` (`#329 <https://github.com/hpcugent/easybuild-framework/pull/329>`_, `#334 <https://github.com/hpcugent/easybuild-framework/pull/334>`_)
* added support for **2** new software packages that require customized support:
      * Charmm (`#318 <https://github.com/hpcugent/easybuild-framework/pull/318>`_), GROMACS (`#335 <https://github.com/hpcugent/easybuild-framework/pull/335>`_, `#339 <https://github.com/hpcugent/easybuild-framework/pull/339>`_)
* various enhancements, including:
      * fix support for recent SAMtools version (>= 0.1.19) (`#320 <https://github.com/hpcugent/easybuild-framework/pull/320>`_)
      * fix support for recent Intel tools (icc, ifort, imkl, impi) (`#325 <https://github.com/hpcugent/easybuild-framework/pull/325>`_, `#327 <https://github.com/hpcugent/easybuild-framework/pull/327>`_, `#338 <https://github.com/hpcugent/easybuild-framework/pull/338>`_)
      * enhance generic easyblock for installing RPMs (`#332 <https://github.com/hpcugent/easybuild-framework/pull/332>`_)
      * pick up ``preinstallopts`` in generic ``PythonPackage`` easyblock (`#334 <https://github.com/hpcugent/easybuild-framework/pull/334>`_)
      * enhance CP2K easyblock (libxc support, new versions) + style cleanup (`#336 <https://github.com/hpcugent/easybuild-framework/pull/336>`_)
* various bug fixes:
      * use unwanted env var functionality to unset ``$MKLROOT`` rather than failing with an error (`#273 <https://github.com/hpcugent/easybuild-framework/pull/273>`_)
      * always include ``-w`` flag for preprocessor to supress warnings that may break QuantumESPRESSO configure (`#317 <https://github.com/hpcugent/easybuild-framework/pull/317>`_)
      * link with multithreaded LAPACK libs for ESMF (`#319 <https://github.com/hpcugent/easybuild-framework/pull/319>`_)
      * extend ``noqanda`` list of patterns in CUDA easyblock (`#328 <https://github.com/hpcugent/easybuild-framework/pull/328>`_, `#337 <https://github.com/hpcugent/easybuild-framework/pull/337>`_)
      * add ``import _ctypes`` to Python sanity check commands to capture a common build issue (`#329 <https://github.com/hpcugent/easybuild-framework/pull/329>`_)
      * bug fixes in generic ``IntelBase`` easyblock (`#331 <https://github.com/hpcugent/easybuild-framework/pull/331>`_, `#333 <https://github.com/hpcugent/easybuild-framework/pull/333>`_, `#335 <https://github.com/hpcugent/easybuild-framework/pull/335>`_)
          * remove broken symlink ``$HOME/intel`` if present
          * fix use of gettempdir to obtain a common (user-specific) tmp dir to symlink ``$HOME/intel`` to
      * fix build of recent scipy versions with GCC-based toolchain (`#334 <https://github.com/hpcugent/easybuild-framework/pull/334>`_)
      * fix use of gettempdir to obtain common (user-specific) tmp dir for ``$HOME/.nwchemrc`` symlink (`#340 <https://github.com/hpcugent/easybuild-framework/pull/340>`_, `#342 <https://github.com/hpcugent/easybuild-framework/pull/342>`_)
      * extend ``noqanda`` list in Qt easyblock (`#342 <https://github.com/hpcugent/easybuild-framework/pull/342>`_)

**easyconfigs**

v1.9.0 (November 17th 2013)
---------------------------

feature + bugfix release

**framework**

* add support for Tcl environment modules (``modulecmd.tcl``) (`#728 <https://github.com/hpcugent/easybuild-framework/pull/728>`_, `#729 <https://github.com/hpcugent/easybuild-framework/pull/729>`_, `#739 <https://github.com/hpcugent/easybuild-framework/pull/739>`_)
      * special care was taken to make sure also the DEISA variant of ``modulecmd.tcl`` can be used
* code refactoring to prepare for supporting two formats for easyconfig files (`#693 <https://github.com/hpcugent/easybuild-framework/pull/693>`_, `#750 <https://github.com/hpcugent/easybuild-framework/pull/750>`_)
      * this prepares the codebase for supporting easyconfig format v2.0
      * some initial work on adding support for the new easyconfig format is included, but it's by no means complete yet
      * the current easyconfig format (now dubbed v1.0) is still the default and only supported format, for now
      * for more details, see https://github.com/hpcugent/easybuild/wiki/Easyconfig-format-two
* various other enhancements, including:
      * include a full version of vsc-base (see the ``vsc`` subdirectory) (`#740 <https://github.com/hpcugent/easybuild-framework/pull/740>`_)
          * this is a first step towards switching to using vsc-base as a proper dependency
      * implement get_avail_core_count function in systemtools module that takes cpusets and co into account (`#700 <https://github.com/hpcugent/easybuild-framework/pull/700>`_)
          * the ``get_core_count`` function is now deprecated
      * add ``impmkl`` toolchain definition (`#736 <https://github.com/hpcugent/easybuild-framework/pull/736>`_)
      * make regtest more robust: put holds on jobs without dependencies, release holds once all jobs are submitted (`#751 <https://github.com/hpcugent/easybuild-framework/pull/751>`_)
      * add support for specifying multiple alternatives for sanity check paths (`#753 <https://github.com/hpcugent/easybuild-framework/pull/753>`_)
      * add ``get_software_libdir`` function to modules.py (along with unit tests) (`#758 <https://github.com/hpcugent/easybuild-framework/pull/758>`_)
      * add support for more file extensions and constants w.r.t. sources (`#738 <https://github.com/hpcugent/easybuild-framework/pull/738>`_, `#760 <https://github.com/hpcugent/easybuild-framework/pull/760>`_, `#761 <https://github.com/hpcugent/easybuild-framework/pull/761>`_)
      * add MPICH2 support in ``mpi_cmd_for`` function (`#761 <https://github.com/hpcugent/easybuild-framework/pull/761>`_)
* various bug fixes, including:
      * fix checking of OS dependencies on Debian/Ubuntu that have ``rpm`` command available (`#732 <https://github.com/hpcugent/easybuild-framework/pull/732>`_)
      * make unit tests more robust w.r.t. non-writeable ``/tmp`` and loaded modules prior to starting unit tests (`#752 <https://github.com/hpcugent/easybuild-framework/pull/752>`_, `#756 <https://github.com/hpcugent/easybuild-framework/pull/756>`_)
      * also call ``EasyBlock``'s sanity check in ``ExtensionEasyblock`` if paths/commands are specified in easyconfig (`#757 <https://github.com/hpcugent/easybuild-framework/pull/757>`_)
      * set compiler family for dummy compiler, add definition of toolchain constant for dummy (`#759 <https://github.com/hpcugent/easybuild-framework/pull/759>`_)
* other
      * add build status badges for master/develop branches to ``README`` (`#742 <https://github.com/hpcugent/easybuild-framework/pull/742>`_)
      * add scripts for installing EasyBuild develop version or setting up git development environment (`#730 <https://github.com/hpcugent/easybuild-framework/pull/730>`_, `#755 <https://github.com/hpcugent/easybuild-framework/pull/755>`_)

**easyblocks**

* added support for **8** new software packages that require customized support:
      * Allinea DDT/MAP (`#279 <https://github.com/hpcugent/easybuild-framework/pull/279>`_), ARB (`#291 <https://github.com/hpcugent/easybuild-framework/pull/291>`_), GenomeAnalysisTK (`#278 <https://github.com/hpcugent/easybuild-framework/pull/278>`_), OpenBabel (`#305 <https://github.com/hpcugent/easybuild-framework/pull/305>`_, `#309 <https://github.com/hpcugent/easybuild-framework/pull/309>`_), picard (`#278 <https://github.com/hpcugent/easybuild-framework/pull/278>`_), PyQuante (`#297 <https://github.com/hpcugent/easybuild-framework/pull/297>`_), Scalasca v1.x (`#304 <https://github.com/hpcugent/easybuild-framework/pull/304>`_), Score-P (`#304 <https://github.com/hpcugent/easybuild-framework/pull/304>`_)
        - the Score-P easyblock is also used for Cube 4.x, LWM2, OTF2, and Scalasca v2.x
* various enhancements, including:
      * add support building ScaLAPACK on top of MPICH2, required for gmpolf toolchain (`#274 <https://github.com/hpcugent/easybuild-framework/pull/274>`_)
      * add support to ConfigureMake easyblock to customize configure ``--prefix`` option (`#287 <https://github.com/hpcugent/easybuild-framework/pull/287>`_)
      * add support for specifying install command in Binary easyblock (`#288 <https://github.com/hpcugent/easybuild-framework/pull/288>`_)
      * enhance CMakeMake easyblock to specify srcdir via easyconfig parameter, and to perform out-of-source builds (`#303 <https://github.com/hpcugent/easybuild-framework/pull/303>`_)
* various bug fixes:
      * use correct configure flag for Szip in HDF5 easyblocks, should be ``--with-szlib`` (`#286 <https://github.com/hpcugent/easybuild-framework/pull/286>`_, `#301 <https://github.com/hpcugent/easybuild-framework/pull/301>`_)
      * add support for serial HDF5 builds (`#290 <https://github.com/hpcugent/easybuild-framework/pull/290>`_, `#301 <https://github.com/hpcugent/easybuild-framework/pull/301>`_)
      * enhance robustness of Qt easyblock w.r.t. interactive configure (`#295 <https://github.com/hpcugent/easybuild-framework/pull/295>`_, `#302 <https://github.com/hpcugent/easybuild-framework/pull/302>`_)
      * enhance support for picking up license specification via environment variables (`#298 <https://github.com/hpcugent/easybuild-framework/pull/298>`_, `#307 <https://github.com/hpcugent/easybuild-framework/pull/307>`_)
      * extend list of values for ``$CPATH`` in libint2 easyblock (`#300 <https://github.com/hpcugent/easybuild-framework/pull/300>`_)
      * fix ``extra_options`` ``super`` call in Clang easyblock (`#306 <https://github.com/hpcugent/easybuild-framework/pull/306>`_)
      * add support in Boost easyblock to specify toolset in easyconfig file (`#308 <https://github.com/hpcugent/easybuild-framework/pull/308>`_)
* other:
      * add build status badges for master/develop branches to README (`#289 <https://github.com/hpcugent/easybuild-framework/pull/289>`_)

**easyconfigs**

v1.8.2 (October 18th 2013)
--------------------------

bugfix release

**framework**

* fix regular expression used for obtaining list of modules from ``module avail`` (`#724 <https://github.com/hpcugent/easybuild-framework/pull/724>`_)
      * modules marked as default were being hidden from EasyBuild, causing problems when they are used as dependency

**easyblocks**

* fix installing of EasyBuild with a loaded EasyBuild module (`#280 <https://github.com/hpcugent/easybuild-framework/pull/280>`_)
      * this is important to make upgrading to the latest EasyBuild version possible with a bootstrapped EasyBuild

**easyconfigs**

v1.8.1 (October 14th 2013)
--------------------------

bugfix release

* various bug fixes, including:
      * fix bugs in regtest procedure (`#713 <https://github.com/hpcugent/easybuild-framework/pull/713>`_)
          * force 2nd and 3rd attempt of build in case 1st attempt failed
      * fix copying of install log to install directory (`#716 <https://github.com/hpcugent/easybuild-framework/pull/716>`_)
      * only create first source path if multiple paths are specified (`#718 <https://github.com/hpcugent/easybuild-framework/pull/718>`_)
      * detect failed PBS job submission by checking obtained job ID for ``None`` value (`#713 <https://github.com/hpcugent/easybuild-framework/pull/713>`_, `#717 <https://github.com/hpcugent/easybuild-framework/pull/717>`_, `#719 <https://github.com/hpcugent/easybuild-framework/pull/719>`_, `#720 <https://github.com/hpcugent/easybuild-framework/pull/720>`_)

**easyblocks**

* various bug fixes:
      * fix problems in PSI easyblock causing build to fail (`#270 <https://github.com/hpcugent/easybuild-framework/pull/270>`_)
      * fix issues with running NWChem test cases, fail early in case broken symlink is present (`#275 <https://github.com/hpcugent/easybuild-framework/pull/275>`_)

**easyconfigs**

v1.8.0 (October 4th 2013)
-------------------------

feature + bugfix release

**framework**

* add support for using alternative module naming schemes (`#679 <https://github.com/hpcugent/easybuild-framework/pull/679>`_, `#696 <https://github.com/hpcugent/easybuild-framework/pull/696>`_, `#705 <https://github.com/hpcugent/easybuild-framework/pull/705>`_, `#706 <https://github.com/hpcugent/easybuild-framework/pull/706>`_, `#707 <https://github.com/hpcugent/easybuild-framework/pull/707>`_)
      * see https://github.com/hpcugent/easybuild/wiki/Using-a-custom-module-naming-scheme for documentation
      * module naming scheme classes that derive from the 'abstract' ``ModuleNamingScheme`` class can be provided to EasyBuild
          * the Python module providing the class must be available in the ``easybuild.tools.module_naming_scheme`` namespace
          * a function named ``det_full_module_name`` must be implemented, that determines the module name in the form of an string based on the supplied dictionary(-like) argument
      * the active module naming scheme is determined by EasyBuild configuration option ``--module-naming-scheme``
      * for now, only the ``name``/``version``/``versionsuffix``/``toolchain`` easyconfig parameters are guaranteed to be provided
          * consistently providing all easyconfig parameters (i.e., also for dependencies) requires more work (see `#687 <https://github.com/hpcugent/easybuild-framework/pull/687>`_)
      * implementing this involved a number of intrusive changes:
          * the API of the modules.py module needed to be changed, breaking backward compatibility
             * the function for which the signatures were modified are considered to be internal to the framework,
               so this should have very minor impact w.r.t. easyblocks not included with EasyBuild
             * affected functions include: ``available``, ``exists``, ``show``, ``modulefile_path``, ``dependencies_for``
          * the format for specifying dependencies was extended, to allow for specifying a custom toolchain
             * this allows to fix inaccurate dependency specifications,
               for example: ``('OpenMPI', '1.6.4-GCC-4.7.2')" to "('OpenMPI', '1.6.4', '', ('GCC', '4.7.2'))``
             * see also `easyconfigs#431 <https://github.com/hpcugent/easybuild-easyconfigs/pull/431>`_
          * the recommended version for Lmod was bumped to v5.1.5
            * using earlier 5.x version still works, but may be very slow when 'available' is used, due to bugs and a missing feature in Lmod versions prior to v5.1.5 on which we rely
* various other enhancements, including:
      * only (try to) change group id if it is different from what is wanted (`#685 <https://github.com/hpcugent/easybuild-framework/pull/685>`_)
      * added toy build unit test (`#688 <https://github.com/hpcugent/easybuild-framework/pull/688>`_)
      * support for specifying a list of source paths in EasyBuild configuration (`#690 <https://github.com/hpcugent/easybuild-framework/pull/690>`_, `#702 <https://github.com/hpcugent/easybuild-framework/pull/702>`_)
      * add function to determine CPU clock speed in ``systemtools.py`` (`#694 <https://github.com/hpcugent/easybuild-framework/pull/694>`_, `#699 <https://github.com/hpcugent/easybuild-framework/pull/699>`_)
* various bug fixes, including:
      * avoid importing toolchain modules over and over again to make toolchain constants available in toolchain module (`#679 <https://github.com/hpcugent/easybuild-framework/pull/679>`)
      * only change the group id if current gid is different from what we want in ``adjust_permissions`` function (`#685 <https://github.com/hpcugent/easybuild-framework/pull/685>`)
      * restore original environment after running 'module purge' (`#698 <https://github.com/hpcugent/easybuild-framework/pull/698>`)
          * important sidenote: this results in resetting the entire environment, and has impact on the sanity check step;
          * any environment variables that are set before the EasyBlock.sanity_check_step method fires, are no longer there when the sanity check commands are run (cfr. `easyblocks#268 <https://github.com/hpcugent/easybuild-easyblocks/pull/268>`_)

**easyblocks**

* added **one** new `generic` easyblock: ``BinariesTarball`` (`#255 <https://github.com/hpcugent/easybuild-framework/pull/255>`_)
* added support for **5** new software packages that require customized support:
      * DB (`#226 <https://github.com/hpcugent/easybuild-framework/pull/226>`_), FDTD Solutions (`#239 <https://github.com/hpcugent/easybuild-framework/pull/239>`_), FoldX (`#256 <https://github.com/hpcugent/easybuild-framework/pull/256>`_), Mathematica (`#240 <https://github.com/hpcugent/easybuild-framework/pull/240>`_), MUMPS (`#262 <https://github.com/hpcugent/easybuild-framework/pull/262>`_)
* various enhancements, including:
      * support optionally running configure in generic ``MakeCp`` easyblock (`#252 <https://github.com/hpcugent/easybuild-framework/pull/252>`_)
      * enhanced Clang easyblock to support building Clang 3.3 (`#248 <https://github.com/hpcugent/easybuild-framework/pull/248>`_)
      * add support for ``$INTEL_LICENSE_FILE`` specifying multiple paths (`#251 <https://github.com/hpcugent/easybuild-framework/pull/251>`_)
      * enhanced ATLAS easyblock to support building ATLAS 3.10.1 (`#258 <https://github.com/hpcugent/easybuild-framework/pull/258>`_)
* various bug fixes:
      * add zlib lib dir in link path dirs for WPS (`#249 <https://github.com/hpcugent/easybuild-framework/pull/249>`_)
      * stop using deprecated ``add_module`` function in imkl easyblock (`#250 <https://github.com/hpcugent/easybuild-framework/pull/250>`_)
      * fixed PSI easyblock w.r.t. support for building plugins (`#254 <https://github.com/hpcugent/easybuild-framework/pull/254>`_, `#269 <https://github.com/hpcugent/easybuild-framework/pull/269>`_)
      * move OS check for Clang to ``check_readiness_step``, to allow a build job to be submitted from SL5 (`#263 <https://github.com/hpcugent/easybuild-framework/pull/263>`_, `#264 <https://github.com/hpcugent/easybuild-framework/pull/264>`_)
      * enable verbose build for DOLFIN, to allow for proper debugging if the build fails (`#265 <https://github.com/hpcugent/easybuild-framework/pull/265>`_)
      * make sure ``$LDFLAGS`` and ``$INSTANT_*_DIR`` env vars are set for DOLFIN sanity check commands (`#268 <https://github.com/hpcugent/easybuild-framework/pull/268>`_)
        - this is required after resetting the environment after running module purge (see framework release notes)
      * don't try to load module in LAPACK test-only build (`#264 <https://github.com/hpcugent/easybuild-framework/pull/264>`_, `#266 <https://github.com/hpcugent/easybuild-framework/pull/266>`_)

**easyconfigs**

v1.7.0 (September 2nd 2013)
---------------------------

feature + bugfix release

**framework**

* various enhancements, including:
      * also search for patch files in directory where easyconfig file is located (`#667 <https://github.com/hpcugent/easybuild-framework/pull/667>`_)
      * reduce false positives in reporting of possible errors messages (`#669 <https://github.com/hpcugent/easybuild-framework/pull/669>`_)
      * make module update ``$ACLOCAL`` if a share/aclocal subdir is found (`#670 <https://github.com/hpcugent/easybuild-framework/pull/670>`_)
      * add ``unwanted_env_vars`` easyconfig parameter to list environment variables to unset during install procedure (`#673 <https://github.com/hpcugent/easybuild-framework/pull/673>`_)
      * add support for updating list easyconfig values (next to string values) (`#676 <https://github.com/hpcugent/easybuild-framework/pull/676>`_)
      * add ``--dry-run`` command line option which prints installation overview for specified easyconfig files (`#677 <https://github.com/hpcugent/easybuild-framework/pull/677>`_)
* various bug fixes, including:
      * ensure that all extensions are listed in ``$EBEXTSLISTX`` set by module, also when using ``--skip`` (`#671 <https://github.com/hpcugent/easybuild-framework/pull/671>`_)
      * report reason for failed sanity check for extensions (`#672 <https://github.com/hpcugent/easybuild-framework/pull/672>`_, `#678 <https://github.com/hpcugent/easybuild-framework/pull/678>`_)
      * fix ``--list-toolchains`` command line option (`#675 <https://github.com/hpcugent/easybuild-framework/pull/675>`_)

**easyblocks**

* added support for **3** new software packages that require customized support:
      * Libint2 (`#236 <https://github.com/hpcugent/easybuild-framework/pull/236>`_), Qt (`#210 <https://github.com/hpcugent/easybuild-framework/pull/210>`_), Rosetta (`#218 <https://github.com/hpcugent/easybuild-framework/pull/218>`_)
* various enhancements, including:
      * allow building OpenFOAM without 3rd party tools (`#230 <https://github.com/hpcugent/easybuild-framework/pull/230>`_)
      * also add sitelib path to ``$PERL5LIB``, refactor code to add generic ``get_site_suffix`` function (`#232 <https://github.com/hpcugent/easybuild-framework/pull/232>`_, `#233 <https://github.com/hpcugent/easybuild-framework/pull/233>`_)
      * support building imkl FFT wrappers using MVAPICH2 MPI library (`#234 <https://github.com/hpcugent/easybuild-framework/pull/234>`_)
      * remove libnpp from CUDA sanity check to support installing CUDA v5.5 (`#238 <https://github.com/hpcugent/easybuild-framework/pull/238>`_)
      * pick up ``$INTEL_LICENSE_FILE`` for Intel tools, if it is set (`#243 <https://github.com/hpcugent/easybuild-framework/pull/243>`_)
        - note: gets preference over ``license_file`` easyconfig parameter
* various bug fixes:
      * call WRF build script with '``tcsh <script>`` to ensure that tcsh available in ``$PATH`` is used (`#231 <https://github.com/hpcugent/easybuild-framework/pull/231>`_)
      * make sure some environment variables that may disrupt the GCC install procedure are unset (`#237 <https://github.com/hpcugent/easybuild-framework/pull/237>`_)
        - e.g., ``$CPATH``, ``$C_INCLUDE_PATH``, ``$CPLUS_INCLUDE_PATH``, ``$OBJC_INCLUDE_PATH``, ``$LIBRARY_PATH``
      * code cleanup in GEANT4 easyblock: use ``self.version`` (instead of ``self.get_installversion()``) (`#242 <https://github.com/hpcugent/easybuild-framework/pull/242>`_)
      * enhance list of ``noqanda`` patterns for CUDA, to get less failing installations (`#244 <https://github.com/hpcugent/easybuild-framework/pull/244>`_)

**easyconfigs**

v1.6.0 (July 11th 2013)
-----------------------

feature + bugfix release

**framework**

* added support for using Lmod as module tool (`#645 <https://github.com/hpcugent/easybuild-framework/pull/645>`_)
* various other enhancements, including:
      * allow prepending to/appending to/overwriting list easyconfig parameters using ``--try-amend-X`` (`#658 <https://github.com/hpcugent/easybuild-framework/pull/658>`_, `#664 <https://github.com/hpcugent/easybuild-framework/pull/664>`_)
* various bug fixes, including:
      * add salt to temporary log file name (`#656 <https://github.com/hpcugent/easybuild-framework/pull/656>`_, `#665 <https://github.com/hpcugent/easybuild-framework/pull/665>`_)
      * fix determining CPU architecture on Rasberry Pi (ARM) systems (`#655 <https://github.com/hpcugent/easybuild-framework/pull/655>`_, `#662 <https://github.com/hpcugent/easybuild-framework/pull/662>`_)
      * fix support for determining base path of tarballs containing a single file (`#660 <https://github.com/hpcugent/easybuild-framework/pull/660>`_)

**easyblocks**

* added support for **2** new software packages that require customized support:
      * BamTools (`#224 <https://github.com/hpcugent/easybuild-framework/pull/224>`_), BLAT (`#214 <https://github.com/hpcugent/easybuild-framework/pull/214>`_)
* various enhancements, including:
      * update impi easyblock to allow installing impi v4.1.1, which features a slight change in build procedure (`#217 <https://github.com/hpcugent/easybuild-framework/pull/217>`_)
      * enhance ``PackedBinary`` easyblock to copy both files and directories (`#212 <https://github.com/hpcugent/easybuild-framework/pull/212>`_)
      * added get ``sitearch_suffix`` to Perl search path and use it in ``PerlModule`` easyblock (`#209 <https://github.com/hpcugent/easybuild-framework/pull/209>`_)
* various bug fixes:
      * make sure EasyBuild configuration is initialized when running unit tests (`#220 <https://github.com/hpcugent/easybuild-framework/pull/220>`_)
      * make Boost easyblock pick up configopts easyconfig parameter (`#221 <https://github.com/hpcugent/easybuild-framework/pull/221>`_)
      * add ``-DMPICH_IGNORE_CXX_SEEK`` compiler flag for Mothur when MPI support is enabled (`#222 <https://github.com/hpcugent/easybuild-framework/pull/222>`_)
      * fix Boost sanity check, only check for ``libboost_python.so`` if Python module is loaded (`#223 <https://github.com/hpcugent/easybuild-framework/pull/223>`_)
      * enhance Trinity support w.r.t. jellyfish (`#225 <https://github.com/hpcugent/easybuild-framework/pull/225>`_, `#227 <https://github.com/hpcugent/easybuild-framework/pull/227>`_)
      * fix checking for ``beagle-lib`` dep (deprecate checking for BEAGLE) for MrBayes (`#228 <https://github.com/hpcugent/easybuild-framework/pull/228>`_)

**easyconfigs**

v1.5.0 (June 1st 2013)
----------------------

feature + bugfix release

**framework**

* various enhancements, including:
      * define ``SHLIB_EXT`` constant for shared library extension (``.so``, ``.dylib``), deprecate ``shared_lib_ext`` global var (`#630 <https://github.com/hpcugent/easybuild-framework/pull/630>`_)
      * enhance support for sanity checking extensions (`#632 <https://github.com/hpcugent/easybuild-framework/pull/632>`_, `#649 <https://github.com/hpcugent/easybuild-framework/pull/649>`_)
      * add support for ``modextrapaths`` easyconfig parameter (`#634 <https://github.com/hpcugent/easybuild-framework/pull/634>`_, `#637 <https://github.com/hpcugent/easybuild-framework/pull/637>`_)
      * allow ``source_urls`` to be templated for extensions (`#639 <https://github.com/hpcugent/easybuild-framework/pull/639>`_, `#646 <https://github.com/hpcugent/easybuild-framework/pull/646>`_, `#647 <https://github.com/hpcugent/easybuild-framework/pull/647>`_)
      * set ``OMPI_*`` environment variables for OpenMPI (`#640 <https://github.com/hpcugent/easybuild-framework/pull/640>`_)
      * make BLACS optional as toolchain element, depending on ScaLAPACK version (`#638 <https://github.com/hpcugent/easybuild-framework/pull/638>`_)
* various bug fixes, including:
      * fixed ``--list-toolchains``, avoid listing toolchains multiple times (`#628 <https://github.com/hpcugent/easybuild-framework/pull/628>`_)
      * fix templating dictionary after parsing easyconfig file (`#633 <https://github.com/hpcugent/easybuild-framework/pull/633>`_)
      * fix support for ACML as compiler toolchain element (`#632 <https://github.com/hpcugent/easybuild-framework/pull/632>`_)
      * make unit tests clean up after themselves more thoroughly (`#641 <https://github.com/hpcugent/easybuild-framework/pull/641>`_, `#642 <https://github.com/hpcugent/easybuild-framework/pull/642>`_, `#643 <https://github.com/hpcugent/easybuild-framework/pull/643>`_)

**easyblocks**

* added **one** new `generic` easyblock: ``MakeCp`` (`#208 <https://github.com/hpcugent/easybuild-framework/pull/208>`_)
* added support for **5** new software packages that require customized support:
      * CBLAS (`#192 <https://github.com/hpcugent/easybuild-framework/pull/192>`_), FreeSurfer (`#194 <https://github.com/hpcugent/easybuild-framework/pull/194>`_), Mothur (`#206 <https://github.com/hpcugent/easybuild-framework/pull/206>`_), OpenIFS (`#200 <https://github.com/hpcugent/easybuild-framework/pull/200>`_), PSI (`#191 <https://github.com/hpcugent/easybuild-framework/pull/191>`_)
* various enhancements, including:
      * add support for building ScaLAPACK 2.x on top of QLogic MPI (`#195 <https://github.com/hpcugent/easybuild-framework/pull/195>`_)
      * support newer BWA versions (`#199 <https://github.com/hpcugent/easybuild-framework/pull/199>`_)
      * explicitly list license server type in ABAQUS install options, required for correct installation of v6.12 (`#198 <https://github.com/hpcugent/easybuild-framework/pull/198>`_)
      * update SCOTCH and OpenFOAM easyblock for recent versions (`#201 <https://github.com/hpcugent/easybuild-framework/pull/201>`_)
* various bug fixes:
      * fix numpy easyblock to get an optimal build (w.r.t. ``numpy.dot`` performance) (`#192 <https://github.com/hpcugent/easybuild-framework/pull/192>`_)
      * correct build procedure for MUMmer to yield a complete installation (`#196 <https://github.com/hpcugent/easybuild-framework/pull/196>`_, `#197 <https://github.com/hpcugent/easybuild-framework/pull/197>`_)
      * make unit tests clean up after themselves more thoroughly (`#203 <https://github.com/hpcugent/easybuild-framework/pull/203>`_, `#204 <https://github.com/hpcugent/easybuild-framework/pull/204>`_)
      * fix getting Perl version for extensions (`#205 <https://github.com/hpcugent/easybuild-framework/pull/205>`_)

**easyconfigs**

v1.4.0 (May 2nd 2013)
---------------------

feature + bugfix release

**framework**

* the unit tests for easybuild-framework were moved to test/framework, to make things consistent with easybuild-easyblocks and easybuild-easyconfigs (`#611 <https://github.com/hpcugent/easybuild-framework/pull/611>`_, `#613 <https://github.com/hpcugent/easybuild-framework/pull/613>`_, `#624 <https://github.com/hpcugent/easybuild-framework/pull/624>`_)
      * running the framework unit tests should now be using ``python -m test.framework.suite``
* various other enhancements, including:
      * extend unit test suite (`#593 <https://github.com/hpcugent/easybuild-framework/pull/593>`_, `#599 <https://github.com/hpcugent/easybuild-framework/pull/599>`_, `#603 <https://github.com/hpcugent/easybuild-framework/pull/603>`_, `#618 <https://github.com/hpcugent/easybuild-framework/pull/618>`_, `#620 <https://github.com/hpcugent/easybuild-framework/pull/620>`_, `#622 <https://github.com/hpcugent/easybuild-framework/pull/622>`_, `#624 <https://github.com/hpcugent/easybuild-framework/pull/624>`_, ...)
      * extended list of constants and templates that can be used in easyconfig files (`#566 <https://github.com/hpcugent/easybuild-framework/pull/566>`_)
      * add support for additional compiler toolchains
          * CUDA-enabled toolchain: ``goolfc`` (`#603 <https://github.com/hpcugent/easybuild-framework/pull/603>`_, `#624 <https://github.com/hpcugent/easybuild-framework/pull/624>`_)
          * Clang(+GCC)-based toolchains: ``cgoolf``, ``cgmpolf``, ``cgmvolf`` (`#593 <https://github.com/hpcugent/easybuild-framework/pull/593>`_, `#598 <https://github.com/hpcugent/easybuild-framework/pull/598>`_, `#600 <https://github.com/hpcugent/easybuild-framework/pull/600>`_)
          * gmvolf (GCC+MVAPICH2+...) (`#585 <https://github.com/hpcugent/easybuild-framework/pull/585>`_)
      * properly decode easyblock to module name using ``decode_*`` functions (`#618 <https://github.com/hpcugent/easybuild-framework/pull/618>`_)
* various bug fixes, including:
      * fixed default value for ``--stop`` (`#601 <https://github.com/hpcugent/easybuild-framework/pull/601>`_)
      * remove useless ``sleep()`` calls in ``run_cmd``, ``run_cmd_qa`` (`#599 <https://github.com/hpcugent/easybuild-framework/pull/599>`_)
      * determine module path based on class name, not software name (`#606 <https://github.com/hpcugent/easybuild-framework/pull/606>`_)
      * remove unwanted characters in build dirs (`#591 <https://github.com/hpcugent/easybuild-framework/pull/591>`_, `#607 <https://github.com/hpcugent/easybuild-framework/pull/607>`_)
      * ignore some error codes spit out by modulecmd that are actually warnings (`#609 <https://github.com/hpcugent/easybuild-framework/pull/609>`_)
      * fix ``agithub.py`` w.r.t. changes in GitHub API (user-agent string is now obligatory for non-authenticated connections) (`#617 <https://github.com/hpcugent/easybuild-framework/pull/617>`_)
      * fix typo breaking the ``adjust_cmd`` decorator on SuSE (`#615 <https://github.com/hpcugent/easybuild-framework/pull/615>`_)
      * fix prepending paths with absolute paths in module file (`#621 <https://github.com/hpcugent/easybuild-framework/pull/621>`_)
      * clean up open file handles properly (`#620 <https://github.com/hpcugent/easybuild-framework/pull/620>`_, `#624 <https://github.com/hpcugent/easybuild-framework/pull/624>`_)
      * fix ``--search`` help and implementation (`#622 <https://github.com/hpcugent/easybuild-framework/pull/622>`_)

**easyblocks**

* added a unit test suite for easyblocks (`#175 <https://github.com/hpcugent/easybuild-framework/pull/175>`_, `#177 <https://github.com/hpcugent/easybuild-framework/pull/177>`_, `#178 <https://github.com/hpcugent/easybuild-framework/pull/178>`_)
      * every easyblock is parsed and instantiated as a sanity check
* added **one** new `generic` easyblock: ``PerlModule`` (`#183 <https://github.com/hpcugent/easybuild-framework/pull/183>`_)
* added support for **8** new software packages that require customized support:
    ABAQUS (`#179 <https://github.com/hpcugent/easybuild-framework/pull/179>`_), Bowtie (`#174 <https://github.com/hpcugent/easybuild-framework/pull/174>`_, `#185 <https://github.com/hpcugent/easybuild-framework/pull/185>`_, `#186 <https://github.com/hpcugent/easybuild-framework/pull/186>`_), Clang (`#151 <https://github.com/hpcugent/easybuild-framework/pull/151>`_), DL_POLY Classic (`#118 <https://github.com/hpcugent/easybuild-framework/pull/118>`_), ESMF (`#171 <https://github.com/hpcugent/easybuild-framework/pull/171>`_), Perl (`#183 <https://github.com/hpcugent/easybuild-framework/pull/183>`_),
    Intel VTune and Intel Inspector (`#180 <https://github.com/hpcugent/easybuild-framework/pull/180>`_)
* the ``CMakeMake.configure_step`` parameter ``builddir`` was renamed to ``srcdir``, because the name ``builddir`` is incorrect (`#151 <https://github.com/hpcugent/easybuild-framework/pull/151>`_)
      * ``builddir`` will remain supported for legacy purposes up until v2.0
* various enhancements, including:
      * reverted back to hardcoding Python library path, since it's hardcoded by setuptools too (`#184 <https://github.com/hpcugent/easybuild-framework/pull/184>`_)
      * added MPICH support in ScaLAPACK easyblock (`#172 <https://github.com/hpcugent/easybuild-framework/pull/172>`_)
      * enhanced NCL easyblock: add support UDUNITS and ESMF dependencies (`#171 <https://github.com/hpcugent/easybuild-framework/pull/171>`_)
      * enhanced MATLAB easyblock: avoid hardcoding Java options, make sure ``$DISPLAY`` is unset, extend list of sanity check paths (`#181 <https://github.com/hpcugent/easybuild-framework/pull/181>`_)
      * enhanced TotalView easyblock: add support for license file (`#146 <https://github.com/hpcugent/easybuild-framework/pull/146>`_)

**easyconfigs**

v1.3.0 (April 1st 2013)
-----------------------

feature + bugfix release

**framework**

* added script to bootstrap EasyBuild with EasyBuild, see https://github.com/hpcugent/easybuild/wiki/Bootstrapping-EasyBuild (`#531 <https://github.com/hpcugent/easybuild-framework/pull/531>`_)
* reorganize framework/easyconfig.py module into framework/easyconfig package with modules (`#574 <https://github.com/hpcugent/easybuild-framework/pull/574>`_, `#580 <https://github.com/hpcugent/easybuild-framework/pull/580>`_)
* support EasyBuild configuration via command line, environment variables and configuration files (`#529 <https://github.com/hpcugent/easybuild-framework/pull/529>`_, `#552 <https://github.com/hpcugent/easybuild-framework/pull/552>`_, `#556 <https://github.com/hpcugent/easybuild-framework/pull/556>`_, `#558 <https://github.com/hpcugent/easybuild-framework/pull/558>`_, `#559 <https://github.com/hpcugent/easybuild-framework/pull/559>`_)
* various other enhancements, including:
      * extended set of unit tests for eb command line options and EasyBuild configuration (`#517 <https://github.com/hpcugent/easybuild-framework/pull/517>`_, `#556 <https://github.com/hpcugent/easybuild-framework/pull/556>`_, `#559 <https://github.com/hpcugent/easybuild-framework/pull/559>`_, `#571 <https://github.com/hpcugent/easybuild-framework/pull/571>`_)
      * made ``--search`` also useful when easybuild-easyconfigs package is not installed (`#524 <https://github.com/hpcugent/easybuild-framework/pull/524>`_)
      * extended set of default module classes (`#525 <https://github.com/hpcugent/easybuild-framework/pull/525>`_)
      * add support for license easyconfig parameter (which will be mandatory in v2.x) (`#526 <https://github.com/hpcugent/easybuild-framework/pull/526>`_, `#569 <https://github.com/hpcugent/easybuild-framework/pull/569>`_)
      * added ``setup.cfg`` for ``setup.py`` to allow creating RPMs (`#528 <https://github.com/hpcugent/easybuild-framework/pull/528>`_)
      * added support for obtaining system information, see ``get_os_*`` functions in ``easybuild/tools/systemtools.py`` (`#543 <https://github.com/hpcugent/easybuild-framework/pull/543>`_, `#546 <https://github.com/hpcugent/easybuild-framework/pull/546>`_, `#547 <https://github.com/hpcugent/easybuild-framework/pull/547>`_)
      * added support for iterated builds that require cycling over multiple sets of configure/build/install options, e.g. FFTW (`#549 <https://github.com/hpcugent/easybuild-framework/pull/549>`_)
      * added support for OpenBLAS as toolchain lib for linear algebra (`#537 <https://github.com/hpcugent/easybuild-framework/pull/537>`_, `#565 <https://github.com/hpcugent/easybuild-framework/pull/565>`_)
      * added support for tweaking prefix and separator for library toolchain variables (``LIB*``) (`#572 <https://github.com/hpcugent/easybuild-framework/pull/572>`_, `#576 <https://github.com/hpcugent/easybuild-framework/pull/576>`_)
      * skip already built modules in regression testing mode, to ease regression testing (`#582 <https://github.com/hpcugent/easybuild-framework/pull/582>`_)
* various bug fixes, including:
      * added ``zip_safe`` flag to ``setup.py``, to silence multitude of warnings (`#521 <https://github.com/hpcugent/easybuild-framework/pull/521>`_)
      * only define ``LIBFFT`` for Intel MKL if FFTW interface libraries are available (`#518 <https://github.com/hpcugent/easybuild-framework/pull/518>`_, `#567 <https://github.com/hpcugent/easybuild-framework/pull/567>`_, `#579 <https://github.com/hpcugent/easybuild-framework/pull/579>`_)
      * set POSIX group early in build process, make EasyBuild aware of consistent chmod/chown failures (`#527 <https://github.com/hpcugent/easybuild-framework/pull/527>`_)
      * properly order the name/version keys for the toolchain easyconfig parameter when using ``--try-toolchain`` (`#563 <https://github.com/hpcugent/easybuild-framework/pull/563>`_)
      * take the ``skipsteps`` easyconfig parameter into account in regression testing mode as well (`#583 <https://github.com/hpcugent/easybuild-framework/pull/583>`_)

**easyblocks**

* added support for **2** new software packages that require customized support:
      * CUDA (`#145 <https://github.com/hpcugent/easybuild-framework/pull/145>`_), Ferret (`#160 <https://github.com/hpcugent/easybuild-framework/pull/160>`_, `#163 <https://github.com/hpcugent/easybuild-framework/pull/163>`_)
* remove ``license`` easyconfig parameter from ``IntelBase``, since it clashes with generic ``license`` parameter (`#153 <https://github.com/hpcugent/easybuild-framework/pull/153>`_, `#158 <https://github.com/hpcugent/easybuild-framework/pull/158>`_)
      * ``license_file`` should be used instead (see `framework#569 <https://github.com/hpcugent/easybuild-framework/pull/569/files>`_)
      * using ``license`` instead of ``license_file`` will be supported until v2.x for legacy purposes
* various enhancements, including:
      * stop hardcoding Python site-packages library dir, obtain it via ``distutils.sysconfig`` instead (`#141 <https://github.com/hpcugent/easybuild-framework/pull/141>`_, `#156 <https://github.com/hpcugent/easybuild-framework/pull/156>`_, `#159 <https://github.com/hpcugent/easybuild-framework/pull/159>`_, `#161 <https://github.com/hpcugent/easybuild-framework/pull/161>`_)
      * stop hardcoding list of libraries for BLAS libs, ask toolchain modules or use ``$LIBBLAS`` instead (`#150 <https://github.com/hpcugent/easybuild-framework/pull/150>`_, `#155 <https://github.com/hpcugent/easybuild-framework/pull/155>`_)
      * enhanced CP2K easyblock, following Intel guidelines for ``ictce`` builds (`#138 <https://github.com/hpcugent/easybuild-framework/pull/138>`_)
      * added ``setup.cfg`` for ``setup.py`` to allow creating RPMs (`#140 <https://github.com/hpcugent/easybuild-framework/pull/140>`_)
      * clean up specifying BLAS/LAPACK libs for building numpy, check whether requires patch is being used for IMKL builds (`#155 <https://github.com/hpcugent/easybuild-framework/pull/155>`_, `#161 <https://github.com/hpcugent/easybuild-framework/pull/161>`_)
* various bug fixes, including:
      * added ``zip_safe`` flag to ``setup.py``, to silence multitude of warnings (`#135 <https://github.com/hpcugent/easybuild-framework/pull/135>`_)
      * install EasyBuild packages in reversed order to avoid funky setuptools issues (`#139 <https://github.com/hpcugent/easybuild-framework/pull/139>`_)
      * fixed a typo in the ScaLAPACK easyblock, and set CCFLAGS and FCFLAGS for v2.x (`#149 <https://github.com/hpcugent/easybuild-framework/pull/149>`_, `#162 <https://github.com/hpcugent/easybuild-framework/pull/162>`_)
      * fix sanity check for python-meep (`#159 <https://github.com/hpcugent/easybuild-framework/pull/159>`_)
      * exclude Python tests from DOLFIN sanity check, since they hang sometimes (`#161 <https://github.com/hpcugent/easybuild-framework/pull/161>`_)
      * add support in ALADIN easyblock for answering question on location of ``libgrib_api.a`` (`#165 <https://github.com/hpcugent/easybuild-framework/pull/165>`_)

**easyconfigs**

v1.2.0 (February 28th 2013)
---------------------------

feature + bugfix release

**framework**

* new backend module for option parsing: generaloption
* support for using constants and string templates in easyconfig files
      * currently disabled for ``exts_filter`` and ``exts_list`` easyconfig parameters, for backward compatibility
* various other enhancements, including:
      * support for iqacml and iiqmpi toolchains (Intel compilers + QLogic MPI based)
      * clearer errors messages when sanity check failed
      * unit tests for (about half of) the ``eb`` command line options
      * support for specifying build/install steps to skip in easyconfig file (``skipsteps``)
      * support for allowing certain dependencies to be resolved by the system instead of modules (``allow_system_deps``)
      * cache ppn value required by regtest, clean up temporary files let behind by ``--regtest``/``--job``
      * make sure MPD is used as process manager for Intel MPI (required for impi v4.1 and later)
      * rename template names ``name`` and ``version`` used in exts_filter to ``ext_name``, ``ext_version``
          * ``name`` and ``version`` are still supported for legacy reasons
      * cleaned up module docstrings w.r.t. list of authors
* various bug fixes, including:
      * print correct (lowercase) toolchain names with ``--list-toolchains``
      * correct easyconfig parameter name ``license_server_port``
      * fix string quoting in develop modules
      * ensure ``modulecmd`` is run with original ``$LD_LIBRARY_PATH`` value
          * to avoid breaking ``modulecmd``, see https://bugzilla.redhat.com/show_bug.cgi?id=719785
      * remove use of hardcoded files/dirs in unit tests
      * fix various inconsistencies w.r.t. paths considered with ``--robot``
      * various cleanup and fixes w.r.t. logging
          * use correct logger instance in main script
          * stop passing logger instances around
          * make module logging variables private
      * get rid of ``ModuleGenerator`` deconstructor, clean up via ``EasyBlock.clean_up_fake_module``
      * fix disabling of ``optarch`` toolchain option (and extend unit tests to check on this)

**easyblocks**

* added **one** new `generic` easyblock: ``Rpm``
* added support for **6** new software packages that require customized support:
      * EasyBuild, EPD (Enthought Python Distribution), freetype, MATLAB, QLogic MPI (RPM), TotalView
      * support for installing EasyBuild with EasyBuild enables bootstrapping an EasyBuild installation!
* various enhancements, including:
      * corrections in WRF/WPS to also enable building with iqacml toolchain
          * use ``mpi_cmd_for`` instead of hardcoding test commands, using correct Fortran compilers (F90)
      * fix NCL easyblock to also support v6.1.x
          * use correct Fortran compiler (F90), set correct lib/include paths for dependencies (netCDF-Fortran, GDAL)
      * cleanup sweep of license headers and authors list in easyblock module docstrings
      * use new ``ext_name`` template name in ``exts_filter`` in Python and R easyblocks
* various bug fixes, including:
      * general code cleanup
          * don't set ``sanityCheckOK`` in ``Toolchain`` easyblock
          * get rid of using ``os.putenv``
      * NEURON easyblock: don't hardcode number of processes used in test cases
      * make sure ``easybuild.easyblocks.generic`` namespace is extendable

**easyconfigs**

v1.1.0 (January 27th 2013)
--------------------------

feature + bugfix release

**framework**

* improvements w.r.t. support for software extensions (tested on Python and R, see easyblocks package)
      * cleaned up support for building/installing extensions
      * define ``ExtensionEasyblock`` class that implements support for installing extensions as stand-alone module as well
      * return to build dir before building/installing each extension
      * define ``EBEXTSLIST<NAME>`` environment variable in module if ``exts_list`` was defined
      * make sure sanity check for extensions results in an error if it fails
* various enhancements, including:
      * log both framework and easyblocks versions
      * add support for ``gimkl``, ``gmacml``, ``iccifort``, ``iomkl`` and ``ismkl`` toolchains
      * define ``*_SEQ compiler`` variables for sequential compilers
      * add ``--list-toolchains`` command line option for listing supported toolchains
      * add support for customizing software and modules install path suffixes
      * support both setuptools and distutils installation methods for finding installed easyconfigs
      * also consider robot path in list of paths searched for patch files
      * allow skipping of default extension sanity check (by setting ``modulename`` to False in options)
* various bug fixes, including:
      * typos in toolchain Python modules w.r.t. ``imkl`` support, handling of ``i8``/``optarch``/``unroll`` options
      * purge before loading 'fake' module, unload 'fake' module before removing it, use original ``$MODULEPATH``
      * restore environment after unloading fake module, set variables that were incorrectly unset, i.e., that were defined before as well
      * unset ``$TMPDIR`` for builds submitted as jobs (required by ``IntelBase`` easyblock)
      * correctly track easyconfig parse error
      * always run all jobs in regtest, also if dependency jobs failed
      * cosmetic adjustments to default EasyBuild configuration file to avoid confusion between e.g. ``build_dir`` and ``build_path`` (only latter matters)
      * fix SuSe hack, only prefix command with sourcing of ``/etc/profile.d/modules.sh`` if it is there
      * leave build directory before it is removed during cleanup step
      * load generated module file before running test cases

**easyblocks**

* added **3** new `generic` easyblocks: ``CMakePythonPackage``, ``JAR``, ``RPackage``
* added support for **23** new software packages that require customized support:
      * ACML, ALADIN, ant, Bioconductor (R packages), Chapel, Cufflinks, ESPResSo, FLUENT, Geant4, GHC, Java, NEURON, NWChem, PyZMQ, QuantumESPRESSO, R, Rmpi, ROOT, Rserve, SCOOP, Trinity, VSC-tools, XML
* various enhancements, including:
      * clean up of ``python.py`` easyblock:
          * merge ``EB_DefaultPythonPackage`` and ``PythonPackage`` easyblocks into generic `easyblock` ``PythonPackage``,
            which derives from ``ExtensionEasyblock``
          * move ``EB_FortranPythonPackage`` into dedicated `generic` ``FortranPythonPackage`` easyblock module
          * split off support for building/installing ``nose``, ``numpy``, ``scipy`` into dedicated ``EB_*`` easyblock
            modules, which allows them to be built as stand-alone modules as well
      * clean up testing of Python packages (``PythonPackage`` easyblock)
      * make sure there is no ``site.cfg`` in home dir when building Python packages,
        because e.g. ``scipy`` will pick it up
      * added support for building Intel MKL wrappers with OpenMPI toolchain
      * cleaning up of fake module that was loaded for running tests
      * move calls to functions that rely on environment up in the chain of steps (mostly for cleanup reasons)
      * use better module name for UFC sanity check, minor change to sanity check paths for UFC
* various bug fixes, including:
      * only call ``make ptcheck`` for ATLAS when multi-threading support is enabled
      * use a symbolic link for $HOME/intel instead of a randomly suffixed subdirectory in home and patching of Intel install scripts
          * latter does not work anymore with recent versions of Intel tools (2013.x)

**easyconfigs**

v1.0.2 (December 8th 2012)
--------------------------

bugfix release

**framework**

* properly catch failing sanity check commands
* fix bug in toolchain support which cause linking environment variables set by toolchain to include too many libraries
      * elements in toolchain variables were being passed by reference instead of by value
* fix selecting a compiler toolchain for a specified software package (``--software-name``) if only a template is a viable option
* fix passing command line parameters with ``--job``
* fix list of valid stops (``-s``/``--stop``)
* fix minor issues in help messages (``-h``/``--help``)

**easyblocks**

* fix typos in WIEN2k easyblock (missing commas after list elements)

**easyconfigs**

v1.0.1 (November 24th 2012)
---------------------------

bugfix release

**framework**

* fix support for installing with ``distutils`` (broken import in ``setup.py``)
* fix support for ACML as a toolchain element (``toolchains/linalg/acml.py``)
* add name to aggregated regtest XML so that is parsed correctly by Jenkins
* reorder code in ``main.py`` so that regtest also works with incomplete easyconfig paths
* add bash script for running regression test and sending a trigger to Jenkins to pull in the XML with results
* get rid of assumption that loaded modules should have name like ``foo/bar``, make it more flexible
* retry failed builds in regtest twice to ignore fluke errors
* report leaf nodes in dependency graph when regtest is submitted
      * this is required for setting job dependencies in the regtest script for the Jenkins trigger job
* implement and use rmtree2 as more (NFS) robust replacement for ``shutil.rmtree``
* bump max hit count for ``run_cmd_qa`` from 20 to 50, to make false positives of unasnwered questions less likely

**easyblocks**

* fix support for installing with ``distutils`` (broken import in ``setup.py``)
* only build GMP/CLooG/PPL libraries during GCC build in parallel, don't install in parallel
      * ``make -j N install`` doesn't work consistently for GMP
* fix GCC build on OS X
      * location of libraries is slightly different (``lib`` vs ``lib64`` dir)
* add support to ``ConfigureMake`` easyblock for pre-passing tar options to configure
      * see ``tar_config_opts`` easyconfig parameter
      * workaround for issue with pax hanging ``configure`` with an interactive prompt
* enhance Q&A for WRF and WIEN2k by adding entries to ``qa`` dict and ``no_qa`` list
* use ``rmtree2`` from ``tools/filetools.py`` as more (NFS) robust replacement for ``shutil.rmtree``

**easyconfigs**

v1.0 (November 13th 2012)
-------------------------

* split up EasyBuild across three repositories: framework, easyblocks and easyconfigs
* packaged EasyBuild, different parts can now be installed easily using ``easy_install``

**framework**

* various changes to both internal and external API:
      * renamed main script to main.py (from ``build.py``)
      * file and directory organisation
      * module, class, function and function argument renaming and reorganisation
      * split up ``Application`` into ``EasyBlock`` and ``ConfigureMake`` (see easybuild-easyblocks for the latter)
      * created ``EasyConfig`` class for handling easyconfig files
      * renaming of EasyBuild configuration parameters (non-camelCase)
      * renaming of various easyconfig parameters (non-camelCase)
      * rename ``SOFTROOT`` and ``SOFTVERSION`` environment variables set in generated module files to ``EBROOT`` and ``EBVERSION``
      * use 'extension' as generic terminology for Python packages, R libraries, Perl modules, ...
* added support for building software packages in parallel via PBS jobs
* added unit testing framework and initial set of unit tests for basic functionality
      * and run them in Jenkins continuous integration service, see https://jenkins1.ugent.be/view/EasyBuild/
* implement single-command regression test (e.g. to test building all supported software)
      * eb ``--regtest`` --robot
* switch to new style Python classes
* replaced ``toolkit`` module with ``toolchain`` package (total rewrite), providing modular support for toolchains
* adjust default EasyBuild configuration to only use ``$HOME/.local/easybuild`` by default
* added support for running EasyBuild without supplying an easyconfig file
      * make EasyBuild search for a matching easyconfig file
      * support automatic rewriting of an existing partially-matching easyconfig file (use this with care!)
      * support for automatically generating an easyconfig file according to given specifications (best effort!)
* add support for looking for easyconfig file in Python search path if it can't be found on specified (relative) path
    (that way, easyconfig files available in the easybuild-easyconfigs package can be used easily)
* various other enhancements and bug fixes, e.g.:
      * extended sanity check capabilities
      * cleaned up logging
      * creating of devel module which allows to mimic environment that was used by EasyBuild to build the software
      * support for creating dependency graphs for a set of easyconfig files
      * grouped options in help output and categorised available easyconfig parameters
      * more consistent code style

**easyblocks**

* implement class name encoding scheme, see wiki http://github.com/hpcugent/easybuild/wiki/Encode-class-names
      * (non-generic) easyblock class names are now prefixed with ``EB_`` and non-alphanumeric characters are escaped
* split off generic easyblocks into separate package ``easyblocks.generic``
* added custom support for **39** software packages:
    Armadillo, BiSearch, Boost, Bowtie2, BWA, bzip2, CGAL, CPLEX, DOLFIN, Eigen, flex, FSL, Hypre, libxml2, MetaVelvet,
    METIS, MTL4, MUMmer, ncurses, OpenFOAM, OpenSSL, ParMETIS, Pasha, PETSc, Primer3, python-meep, SAMtools, SCOTCH,
    SHRiMP, SLEPc, SOAPdenovo, SuiteSparse, SWIG, Tornado, Trilinos, UFC, Velvet, WIEN2k, XCrySDen
* various enhancements and bug fixes to existing easyblocks

**easyconfigs**

v0.8 (June 29th 2012)
---------------------

* added support for building/installing 17 additional software packages:
      * BEAGLE, Doxygen, g2clib, g2lib, HDF, HDF5, JasPer, libpng, Maple, 
        MrBayes, NCL, netCDF, netCDF-Fortran, Szip, WPS, WRF, zlib
* the build procedure for WRF and WPS includes running the tests available for these packages
* various bug fixes and enhancements:
      * made support for interactive installers (``run_cmd_qa``) more robust
      * fixed Python git package check
      * implemented toolkit functions for determine compiler family, MPI type, MPI run command, ...

v0.7 (June 18th 2012)
---------------------

* fixed BLACS build
      * diagnostic tools to determine ``INTERFACE`` and ``TRANSCOMM`` values are now used
* added support for building Bison, CP2K, flex
      * with regression test enabled for CP2K as part of build process
      * note: BLACS built with EasyBuild prior to v0.7 needs to be rebuilt for CP2K to work correctly
* added ``--enable-mpi-threads`` to OpenMPI example easyconfigs
      * required for correct CP2K psmp build
* adjusted libsmm example easyconfig for lower build time
      * to make the full regression test finish in a reasonable amount of time
* added script to make porting of easyblocks from old to new EasyBuild codebase easier
      * takes care of refactoring, checks for PyLint warnings/errors, ...
* fixed several small bugs
* prefixed EasyBuild messages with ``==``
* full regression test passed (58 easyconfigs tested)

v0.6 (May 11th 2012)
--------------------

* added support for Intel compiler toolkit (ictce)
      * which included the Intel compilers, Intel Math Kernel Library (imkl) and Intel MPI library (impi)
* added support for building Python with nose/numpy/scipy packages
* added simple regression test
* this version is able to build all supplied example easyconfigs

v0.5 (April 6th 2012)
---------------------

* first public release of EasyBuild
      * after a thorough cleanup of the EasyBuild framework of the in-house version
* supports building HPL with goalf compiler toolkit
      * the goalf toolkit consists of the GCC compilers, and the OpenMPI, ATLAS, LAPACK, FFTW and ScaLAPACK libraries
* also support build and installation of MVAPICH2
