.. _release_notes:

EasyBuild release notes
=======================

The latest version of EasyBuild provides support for building and installing **1,152** different software packages,
using 25 different (compiler) toolchains. It contains 181 software-specific easyblocks and 30 generic easyblocks,
alongside 6,718 easyconfig files.

.. _release_notes_eb312:

v3.1.2 (March 20th 2017)
------------------------

bugfix/update release

**framework**

* fix broken packaging support by fixing ``run_cmd`` bug with ``shell=False`` (`#2153 <https://github.com/hpcugent/easybuild-framework/pull/2153>`_)
* minor enhancements, including:

  * implement ``change_dir`` function in ``filetools`` module (`#2155 <https://github.com/hpcugent/easybuild-framework/pull/2155>`_)
  * use ``checker_state`` in trailing whitespace style check + add dedicated test (`#2160 <https://github.com/hpcugent/easybuild-framework/pull/2160>`_, `#2169 <https://github.com/hpcugent/easybuild-framework/pull/2169>`_)
  * consider both ``pycodestyle`` and ``pep8`` Python modules in style checks (`#2161 <https://github.com/hpcugent/easybuild-framework/pull/2161>`_)
  * make bootstrap script aware various modules-related ``$EASYBUILD_*`` environment variables (`#2170 <https://github.com/hpcugent/easybuild-framework/pull/2170>`_)

* various bug fixes, including:

  * interpret statements that extend ``$MODULEPATH`` in ``modpath_extensions_for`` method (`#2104 <https://github.com/hpcugent/easybuild-framework/pull/2104>`_)

    * also fixes inclusion of superfluous load statements in modules installed in user HMNS module tree (cfr. `#2172 <https://github.com/hpcugent/easybuild-framework/pull/2172>`_)

  * take into account that ``$PATH`` or ``$PYTHONPATH`` may be empty when running tests (`#2149 <https://github.com/hpcugent/easybuild-framework/pull/2149>`_)
  * handle duplicates in ``--include-*`` (`#2151 <https://github.com/hpcugent/easybuild-framework/pull/2151>`_)
  * exclude dependencies of dependencies that extend ``$MODULEPATH`` (`#2152 <https://github.com/hpcugent/easybuild-framework/pull/2152>`_)
  * add ``ld.bfd`` to RPATH wrappers (`#2156 <https://github.com/hpcugent/easybuild-framework/pull/2156>`_)
  * fix ``test_vsc_location``, ``vsc.__file__`` may not be available when ``vsc`` is installed as a namespace package (`#2159 <https://github.com/hpcugent/easybuild-framework/pull/2159>`_)
  * fix reported problems with scripts & docs tests (`#2164 <https://github.com/hpcugent/easybuild-framework/pull/2164>`_)
  * fix ``--try-software-version`` using non-greedy matching + lookahead assertion, add test for ``tweak_one`` (`#2166 <https://github.com/hpcugent/easybuild-framework/pull/2166>`_)
  * avoid creating empty modulefile directories when using ``modaltsoftname`` (`#2168 <https://github.com/hpcugent/easybuild-framework/pull/2168>`_)
  * fix ``fftw_libs`` for MKL without interface libraries (`#2171 <https://github.com/hpcugent/easybuild-framework/pull/2171>`_)

**easyblocks**

* add easyblock for QScintilla (`#1127 <https://github.com/hpcugent/easybuild-easyblocks/pull/1127>`_)
* minor enhancements, including:

  * auto-disable quad precision on POWER and ARM in FFTW (`#1102 <https://github.com/hpcugent/easybuild-easyblocks/pull/1102>`_, `#1138 <https://github.com/hpcugent/easybuild-easyblocks/pull/1138>`_)
  * allow "download install" for PETSc (`#1114 <https://github.com/hpcugent/easybuild-easyblocks/pull/1114>`_)
  * modify Trinity sanity check for versions 2.3 and above (`#1133 <https://github.com/hpcugent/easybuild-easyblocks/pull/1133>`_)
  * make unpacking Python extensions optional (`#1134 <https://github.com/hpcugent/easybuild-easyblocks/pull/1134>`_)
  * update SAMtools easyblock for version 1.4 (`#1139 <https://github.com/hpcugent/easybuild-easyblocks/pull/1139>`_)

* various bug fixes, including:

  * reduce number of environment variables in ``icc`` and ``ifort`` modules (`#1126 <https://github.com/hpcugent/easybuild-easyblocks/pull/1126>`_, `#1143 <https://github.com/hpcugent/easybuild-easyblocks/pull/1143>`_)
  * also run tests with Tcl module syntax, Lua is the default in EasyBuild v3.x (`#1128 <https://github.com/hpcugent/easybuild-easyblocks/pull/1128>`_)
  * rename member variable to avoid conflict with member of base class in PGI (`#1137 <https://github.com/hpcugent/easybuild-easyblocks/pull/1137>`_)
  * don't set ``$FPATH`` environment variable in multiple easyblocks (`#1140 <https://github.com/hpcugent/easybuild-easyblocks/pull/1140>`_)

**easyconfigs**

* add patch to FFTW 3.3.6 easyconfigs to fix MPI F03 interface (`#4334 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4334>`_)

  * note that this warrants rebuilding FFTW that is a part of ``foss/2017a``

* added example easyconfig files for 14 new software packages:

  * DBG2OLC (`#4281 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4281>`_), disambiguate (`#4125 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4125>`_), fqtrim (`#4280 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4280>`_), GFOLD (`#4293 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4293>`_), Kaiju (`#4349 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4349>`_), LSMS (`#4335 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4335>`_),
    L_RNA_scaffolder (`#4282 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4282>`_), PileOMeth (`#4289 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4289>`_), psycopg2 (`#4319 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4319>`_), QGIS (`#4307 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4307>`_, `#4332 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4332>`_), QJson (`#4305 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4305>`_),
    QScintilla (`#4306 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4306>`_, `#4313 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4313>`_), sketchmap (`#4360 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4360>`_), snaphu (`#4362 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4362>`_)

* added additional easyconfigs for various supported software packages, including GROMACS 2016.3, PGI 17.1, SAMtools 1.4
* various enhancements, including:

  * fix style in several easyconfigs (`#4267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4267>`_-`#4271 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4271>`_, `#4274 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4274>`_, `#4275 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4275>`_, `#4277 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4277>`_, `#4279 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4279>`_, `#4286 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4286>`_-`#4288 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4288>`_, `#4318 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4318>`_)

* various bug fixes, including:

  * correctly set ``$PYTHONPATH`` in ROOT easyconfigs (`#4239 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4239>`_, `#4331 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4331>`_)
  * correct libjpeg turbo references in GDAL (`#4276 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4276>`_)
  * make sure that HDF5 provided via EasyBuild is used in BLASR easyconfigs (`#4278 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4278>`_)
  * fix issues with miRDeep2 installation (`#4291 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4291>`_, `#4301 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4301>`_, `#4316 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4316>`_)
  * also run tests with Tcl module syntax, Lua is the default in EasyBuild v3.x (`#4315 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4315>`_)
  * fix PostgreSQL homepage + minor style fixes (`#4318 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4318>`_)
  * detect use of '``$root``', which is not compatible with module files in Lua syntax (`#4330 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4330>`_)
  * fix ``homepage``/``source_urls`` for ViennaRNA (`#4338 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4338>`_)
  * pass down ``$FFLAGS`` via ``FLAGS_OPT`` in SWASH easyconfigs (`#4341 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4341>`_)
  * remove ``include/GL/wglext.h`` from Mesa sanity check (`#4354 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4354>`_)
  * rename ``S.A.G.E.`` to ``SAGE``, can't have directories with trailing dot in Windows (`#4368 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4368>`_)

.. _release_notes_eb311:

v3.1.1 (March 7th 2017)
-----------------------

bugfix/update release

**framework**

* minor enhancements, including:

  * print more useful error message when no compiler-specific ``optarch`` flag is defined (`#1950 <https://github.com/hpcugent/easybuild-framework/pull/1950>`_)
  * add ``ec`` parameter to ``expand_toolchain_load()`` (`#2103 <https://github.com/hpcugent/easybuild-framework/pull/2103>`_)
  * clarify unstable/closed PR warning message (`#2129 <https://github.com/hpcugent/easybuild-framework/pull/2129>`_)

* various bug fixes, including:

  * ensure that ``$EBEXTSLIST*`` is also included in generated module under ``--module-only`` (`#2112 <https://github.com/hpcugent/easybuild-framework/pull/2112>`_)
  * fix formatting issues in generated documentation for ``--list-software`` and ``--avail-easyconfig-licenses`` (`#2121 <https://github.com/hpcugent/easybuild-framework/pull/2121>`_)
  * fix problem with backticks in description breaking '``fpm``' packaging command (`#2124 <https://github.com/hpcugent/easybuild-framework/pull/2124>`_)
  * replace ``--enable-new-dtags`` with ``--disable-new-dtags`` instead of removing it in RPATH wrapper script (`#2131 <https://github.com/hpcugent/easybuild-framework/pull/2131>`_)
  * only perform ``is_short_modname_for`` sanity check in ``det_short_module_name`` if ``modaltsoftname`` is available (`#2138 <https://github.com/hpcugent/easybuild-framework/pull/2138>`_)
  * fix logic in ``make_module_dep`` w.r.t. excluding loads for toolchain & toolchain components (`#2140 <https://github.com/hpcugent/easybuild-framework/pull/2140>`_)
  * skip ``test_check_style`` if ``pep8`` is not available (`#2142 <https://github.com/hpcugent/easybuild-framework/pull/2142>`_)

**easyblocks**

* minor enhancements, including:

  * change the sanity check for MCR 2016b since the directory structure has changed (`#1096 <https://github.com/hpcugent/easybuild-easyblocks/pull/1096>`_)
  * update NWChem easyblock for version 6.6.x and to handle different versions of OpenMPI for older versions (`#1104 <https://github.com/hpcugent/easybuild-easyblocks/pull/1104>`_)
  * allow per-component ``source_urls`` with templating in ``Bundle`` easyblock (`#1108 <https://github.com/hpcugent/easybuild-easyblocks/pull/1108>`_)
  * add slib to ``$LD_LIBRARY_PATH`` for itac (`#1112 <https://github.com/hpcugent/easybuild-easyblocks/pull/1112>`_)
  * consider both ``lib`` and ``lib64`` in CGAL sanity check (`#1113 <https://github.com/hpcugent/easybuild-easyblocks/pull/1113>`_)
  * add support for installing Intel tools that do not require license at installation time (`#1117 <https://github.com/hpcugent/easybuild-easyblocks/pull/1117>`_)

    * required for Intel MPI and Intel MKL version 2017.2.174

  * remove ``prefix_opt`` as custom easyconfig paramter for Qt easyblock (`#1120 <https://github.com/hpcugent/easybuild-easyblocks/pull/1120>`_)

* various bug fixes, including:

  * use '``-prefix <path>``' rather than '``--prefix=<path>``' for ``configure`` in Qt (`#1109 <https://github.com/hpcugent/easybuild-easyblocks/pull/1109>`_)
  * fix indentation problem in PETSc easyblock (`#1111 <https://github.com/hpcugent/easybuild-easyblocks/pull/1111>`_)

**easyconfigs**

* added example easyconfig files for 16 new software packages:

  * Caffe (`#3667 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3667>`_), DIAMOND (`#4107 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4107>`_), fmt (`#4131 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4131>`_), googletest (`#4132 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4132>`_), igraph (`#4172 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4172>`_), MEGA (`#4202 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4202>`_), meRanTK (`#4175 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4175>`_),
    meshio (`#4178 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4178>`_), miRDeep2 (`#4229 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4229>`_, `#4255 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4255>`_), OOMPA (`#4211 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4211>`_), PBSuite (`#4224 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4224>`_, `#4230 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4230>`_), randfold (`#4217 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4217>`_), skewer (`#4246 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4246>`_),
    Smoldyn (`#4110 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4110>`_), SpiecEasi (`#4215 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4215>`_), stress (`#4180 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4180>`_)

* added additional easyconfigs for various supported software packages, including:

  * binutils 2.28, Cantera 2.3.0, CGAL 4.9, GMP 6.1.2, IPython 5.2.2, JasPer 2.0.10, NWChem 6.6, matplotlib 2.0.0,
    PCRE 8.40, Qt5 5.8.0, Vim 8.0, X11 bundle v20170129, VTK 7.1.0, Yade 2017.01a

* added new easyconfigs for existing toolchains:

  * ``iomkl/2017a`` (`#4216 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4216>`_), ``intel/2017.02`` (`#4248 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4248>`_)

* various enhancements, including:

  * fix style in several easyconfigs (`#4174 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4174>`_, `#4176 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4176>`_, `#4190 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4190>`_, `#4233 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4233>`_)
  * add sanity check command to Yade easyconfig to make sure that '``import yade``' works, include bzip2 as dep (`#4193 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4193>`_)
  * add ``PDF::API2`` extension to Perl 5.24.0 easyconfigs + sync ``exts_list`` (`#4221 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4221>`_)

* various bug fixes, including:

  * add Bison and gettext as build deps for X11 (`#4111 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4111>`_)
  * clean up dependencies in libdrm (`#4113 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4113>`_)
  * make sure Ghostscript picks up external libraries (`#4118 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4118>`_)
  * fix ippicv source download and library install for OpenCV v3.1.0 (`#4126 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4126>`_)
  * fix software name for OrthoMCL + modernise OrthoMCL easyconfigs (`#4134 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4134>`_, `#4135 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4135>`_)
  * get rid of backticks in gettext descriptions, causes problems when packaging with FPM (`#4146 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4146>`_)
  * remove duplicate sources specification in OpenMPI (`#4150 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4150>`_)
  * fix definition of ``buildopts``/``installopts`` in Cantera easyconfig (`#4133 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4133>`_, `#4164 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4164>`_, `#4177 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4177>`_)
  * use ``http://`` rather than ``ftp://`` source URLs in CFITSIO easyconfigs (`#4167 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4167>`_)
  * add patch for XZ 5.2.2 to include ``5.1.2alpha`` symbols required by '``rpm``' command on CentOS 7.x (`#4179 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4179>`_)
  * add patch for Boost v1.61-1.63 to fix problem with ``make_array``/``array_wrapper`` in Boost serialization library (`#4192 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4192>`_)
  * set ``CMAKE_PREFIX_PATH`` to ncurses install directory in CMake easyconfigs (`#4196 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4196>`_)
  * switch to ``lowopt=True`` for libxc v2.2.* and v3.* (`#4199 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4199>`_)
  * remove custom ``sanity_check_paths``, since it's identical to that used by the R easyblock (`#4200 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4200>`_)
  * fix ``version`` (& ``homepage``) in ea-utils easyconfigs (`#4205 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4205>`_)
  * remove ``--with-threads`` configure option in OpenMPI-2.* (`#4213 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4213>`_)
  * fix check for Szip library in configure script for netCDF 4.1.3 (`#4226 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4226>`_)

* fix ``source_urls`` in several easyconfigs, including:

  * bsoft, cutadapt, EMBOSS, GnuTLS, ImageMagick, LibTIFF, Mercurial, netCDF, netCDF-Fortran, pigz, ROOT and Subversion (`#4227 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4227>`_)

.. _release_notes_eb310:

v3.1.0 (February 3rd 2017)
--------------------------

feature release

**framework**

* various enhancements, including:

  * ARM: GCC optimal/generic architecture compiler flags (`#1974 <https://github.com/hpcugent/easybuild-framework/pull/1974>`_)
  * add support for ``--check-style`` to check style in easyconfig files (`#1618 <https://github.com/hpcugent/easybuild-framework/pull/1618>`_, `#2038 <https://github.com/hpcugent/easybuild-framework/pull/2038>`_)
  * add ``HOME`` and ``USER`` from env to available cfg file constants (`#2063 <https://github.com/hpcugent/easybuild-framework/pull/2063>`_)
  * ``--optarch`` can now be specified on a toolchain basis (`#2071 <https://github.com/hpcugent/easybuild-framework/pull/2071>`_)
  * implement ``get_cpu_features`` function in systemtools (`#2074 <https://github.com/hpcugent/easybuild-framework/pull/2074>`_, `#2078 <https://github.com/hpcugent/easybuild-framework/pull/2078>`_)
  * support use of ``linalg`` without MPI, add ``iimkl`` toolchain definition (`#2082 <https://github.com/hpcugent/easybuild-framework/pull/2082>`_)
  * spoof HTTP request header with empty agent (`#2083 <https://github.com/hpcugent/easybuild-framework/pull/2083>`_)
  * exclude dependencies of dependencies that extend $MODULEPATH in make_module_dep (`#2091 <https://github.com/hpcugent/easybuild-framework/pull/2091>`_)

* various bug fixes, including:

  * make ``fetch_github_token`` more robust against ``RuntimeError`` from ``keyring`` (`#2070 <https://github.com/hpcugent/easybuild-framework/pull/2070>`_)
  * POWER: Fix ``--optarch=GENERIC`` for GCC (`#2073 <https://github.com/hpcugent/easybuild-framework/pull/2073>`_)
  * fix docstring in toolchain class (`#2075 <https://github.com/hpcugent/easybuild-framework/pull/2075>`_)
  * skip test cases involving ``.yeb`` if ``PyYAML`` is not installed, silence test in options subsuite (`#2081 <https://github.com/hpcugent/easybuild-framework/pull/2081>`_)
  * fix traceback with '``eb --check-github``' if ``GitPython`` is not installed (`#2085 <https://github.com/hpcugent/easybuild-framework/pull/2085>`_)
  * fix regex for determining list of patched files in GitHub diff (`#2088 <https://github.com/hpcugent/easybuild-framework/pull/2088>`_)
  * modify robot so that it only appends dependencies of tweaked easyconfigs (`#2090 <https://github.com/hpcugent/easybuild-framework/pull/2090>`_)
  * escape metacharacters in paths passed to ``re.compile`` in ``dry_run_set_dirs`` (`#2098 <https://github.com/hpcugent/easybuild-framework/pull/2098>`_)
  * fix broken error message in ``get_toolchain_hierarchy`` + dedicated test case (`#2099 <https://github.com/hpcugent/easybuild-framework/pull/2099>`_)

**easyblocks**

* new easyblock for FFTW (`#1083 <https://github.com/hpcugent/easybuild-easyblocks/pull/1083>`_)
* various enhancements, including:

  * update sanity check for flex 2.6.3, no more ``libfl_pic.a`` library (`#1077 <https://github.com/hpcugent/easybuild-easyblocks/pull/1077>`_)
  * cleanup build before proceeding with full Boost (`#1080 <https://github.com/hpcugent/easybuild-easyblocks/pull/1080>`_)
  * update CP2K easyblock: copy data dir, support version 4.1, support ELPA, fix psmp build with foss toolchain (`#996 <https://github.com/hpcugent/easybuild-easyblocks/pull/996>`_, `#1020 <https://github.com/hpcugent/easybuild-easyblocks/pull/1020>`_, `#1043 <https://github.com/hpcugent/easybuild-easyblocks/pull/1043>`_, `#1084 <https://github.com/hpcugent/easybuild-easyblocks/pull/1084>`_)
  * add sanity check support for OpenSSL 1.1 (`#1087 <https://github.com/hpcugent/easybuild-easyblocks/pull/1087>`_)
  * support the latest changes in Inspector 2017 (`#1047 <https://github.com/hpcugent/easybuild-easyblocks/pull/1047>`_)
  * update NEURON easyblock to support the lack of ``hoc_ed`` in 7.4 (`#987 <https://github.com/hpcugent/easybuild-easyblocks/pull/987>`_)
  * add support for WPS 3.8 (`#1079 <https://github.com/hpcugent/easybuild-easyblocks/pull/1079>`_)
  * also consider ``setuptools`` in ``EasyBuildMeta`` easyblock (`#1093 <https://github.com/hpcugent/easybuild-easyblocks/pull/1093>`_)

* various bug fixes, including:

  * (correctly) define ``$ROSETTA3_DB`` in Rosetta easyblock (`#1092 <https://github.com/hpcugent/easybuild-easyblocks/pull/1092>`_)

**easyconfigs**

* added easyconfigs for ``foss/2017a`` and ``intel/2017a`` common toolchains (`#3968 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3968>`_, `#3969 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3969>`_)
* added example easyconfig files for 16 new software packages:

  * ack (`#3983 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3983>`_), cclib (`#4065 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4065>`_), ConnectomeWorkbench (`#3411 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3411>`_), GroIMP (`#3994 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3994>`_), hyperspy (`#3991 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3991>`_), I-TASSER (`#1216 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1216>`_),
    ImageJ (`#4023 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4023>`_, `#4062 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4062>`_), libconfig (`#4051 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4051>`_), libspatialindex (`#4002 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4002>`_), mahotas (`#3990 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3990>`_), Minia (`#3949 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3949>`_), muParser (`#4007 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4007>`_), 
    NetLogo (`#3941 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3941>`_), QIIME (`#3868 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3868>`_), QwtPolar (`#4019 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4019>`_), Tensorflow (`#4084 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4084>`_, `#4095 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4095>`_)

* added additional easyconfigs for various supported software packages, including:

  * Boost 1.62.0 + 1.63.0, CP2K 4.1, GSL 2.3, PLUMED 2.3.0, Qt5 5.7.1, WRF 3.8, WPS 3.8, Yade 2016.06a, zlib 1.2.11

* various enhancements, including:

  * update FFTW 3.3.5 easyconfigs to use FFTW easyblock & enable running of tests (`#3985 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3985>`_)
  * add FME extensions (+ deps) in R 3.3.1 easyconfigs (`#4063 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4063>`_)

* various bug fixes, including:

  * add libxml2 dependency on HDF5 (`#3759 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3759>`_)
  * remove unnecessary dependency in libmatheval (`#3988 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3988>`_)
  * fix permissions on SWASH binaries (`#4003 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4003>`_)
  * add conda-forge channel to perl-app-cpanminus (`#4012 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4012>`_)
  * add missing deps (libpthread-stubs, libpciaccess) to libdrm 2.4.70 (`#4032 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4032>`_)
  * modloadmsg style fixes in multiple easyconfigs (`#4035 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4035>`_)
  * include X11 as dep for Molden (`#4082 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4082>`_)
  * remove incorrect definition for $ROSETTA3_DB, now (correctly) defined via Rosetta easyblock (`#4083 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4083>`_)

* fix source URLs for several easyconfigs, including:

  * arpack-ng 3.1.3 + 3.1.5 (`#4050 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4050>`_), ChIP-Seq 1.5-1 (`#4050 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4050>`_), Ghostscript 9.10, 9.14 + 9.16 (`#4050 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4050>`_),
    Git 1.7.12, 1.8.2 + 1.8.3.1 (`#4050 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4050>`_), HBase 1.0.2 (`#4043 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4043>`_), libevent 2.0.22 (`#4037 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4037>`_), libsodium 1.0.3 (`#4046 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4046>`_),
    lynx 2.8.7 (`#4050 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4050>`_), Maven 3.2.2 and 3.3.3 (`#4039 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4039>`_), MEME 4.8.0 (`#4050 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4050>`_), PCC 20131024 (`#4044 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4044>`_), S-Lang 2.3.0 (`#4045 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4045>`_),
    Spark 1.3.0 (`#4041 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4041>`_), splitRef 0.0.2 (`#4040 <https://github.com/hpcugent/easybuild-easyconfigs/pull/4040>`_)


.. _release_notes_eb302:

v3.0.2 (December 22nd 2016)
---------------------------

bugfix release

**framework**

* various bug fixes, including:

  * also skip dependencies of dependencies marked as external module in get_toolchain_hierarchy (`#2042 <https://github.com/hpcugent/easybuild-framework/pull/2042>`_)
  * disable verbose setvar in modules.py (`#2044 <https://github.com/hpcugent/easybuild-framework/pull/2044>`_)
  * force copying of easyconfigs in --new-pr/--update-pr, even when combined with -x (`#2045 <https://github.com/hpcugent/easybuild-framework/pull/2045>`_)
  * fix verification of filename for easyconfigs used to resolve deps (`#2051 <https://github.com/hpcugent/easybuild-framework/pull/2051>`_)
  * skip RPATH sanity check when toolchain did not use RPATH wrappers (`#2052 <https://github.com/hpcugent/easybuild-framework/pull/2052>`_)
  * check whether file-like paths are readable before reading them in systemtools module (`#2065 <https://github.com/hpcugent/easybuild-framework/pull/2065>`_)

* various small enhancements, including:

  * add 'rpath' toolchain option to selectively disable use of RPATH wrappers (`#2047 <https://github.com/hpcugent/easybuild-framework/pull/2047>`_)

**easyblocks**

* various enhancements, including:

  * enhance DL_POLY_Classic easyblock to support building with Plumed support (REVIEW) (`#829 <https://github.com/hpcugent/easybuild-easyblocks/pull/829>`_)
  * make the Allinea easyblock search for the templates in the easyconfig paths (`#1025 <https://github.com/hpcugent/easybuild-easyblocks/pull/1025>`_)
  * make FortranPythonPackage aware of (pre)buildopts (`#1065 <https://github.com/hpcugent/easybuild-easyblocks/pull/1065>`_)
  * update sanity check for Mono to support recent versions (`#1069 <https://github.com/hpcugent/easybuild-easyblocks/pull/1069>`_)
  * fix Eigen sanity check for latest version 3.3.1 (`#1074 <https://github.com/hpcugent/easybuild-easyblocks/pull/1074>`_)

* various bug fixes, including:

  * skip RPATH sanity check for binary installations (`#1056 <https://github.com/hpcugent/easybuild-easyblocks/pull/1056>`_)
  * pass CXXFLAGS and LDFLAGS to Boost bjam (`#1064 <https://github.com/hpcugent/easybuild-easyblocks/pull/1064>`_)
  * make pip ignore already installed versions of the package being installed (`#1066 <https://github.com/hpcugent/easybuild-easyblocks/pull/1066>`_)
  * don't pass empty string as custom installopts for numpy in test_step (`#1067 <https://github.com/hpcugent/easybuild-easyblocks/pull/1067>`_)
  * make the Rosetta EasyBlock work in --module-only mode (`#1073 <https://github.com/hpcugent/easybuild-easyblocks/pull/1073>`_)

**easyconfigs**

* added example easyconfig files for 13 new software packages:

  * CryptoMiniSat (`#3952 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3952>`_), MATSim (`#3902 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3902>`_), Molcas (`#2084 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2084>`_), ne (`#3376 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3376>`_), psmc (`#3910 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3910>`_), PyCogent (`#3897 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3897>`_),
    PyNAST (`#3897 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3897>`_), RASPA2 (`#3903 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3903>`_, `#3946 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3946>`_), SimPEG (`#3876 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3876>`_), SolexaQA++ (`#3892 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3892>`_), taco (`#3882 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3882>`_),
    UCLUST (`#3896 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3896>`_), USPEX (`#3767 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3767>`_)

* added additional easyconfigs for various supported software packages, including:

  * Mono 4.6.2.7, PGI 16.10, ROOT 6.08.02

* various enhancements, including:

  * trivial style fixes (`#3878 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3878>`_, `#3893 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3893>`_, `#3895 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3895>`_)

* various bug fixes, including:

  * add X11 develop libs to ncview easyconfig (`#3881 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3881>`_)
  * fix source_urls in pkg-config easyconfigs (`#3907 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3907>`_)
  * install numpy/scipy as .egg to ensure shadowing of numpy/scipy in parent Python installation (`#3921 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3921>`_)
  * fix broken source URL + homepage for Infernal (`#3928 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3928>`_)
  * fix test that verifies dumped easyconfig, take into account that dumped dependencies may include hardcoded dependency (`#3932 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3932>`_)
  * include libGLU as dependency in freeglut easyconfigs with recent Mesa (`#3936 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3936>`_)
  * add patch for FreeSurfer to fix issue with MATLAB 2013 (`#3954 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3954>`_)


.. _release_notes_eb301:

v3.0.1 (November 30th 2016)
---------------------------

bugfix release

**framework**

* important changes

  * always use Intel-specific MPI compiler wrappers (``mpiicc``, ``mpiicpc``, ``mpiifort``) for toolchains using both Intel compilers and Intel MPI (`#2005 <https://github.com/hpcugent/easybuild-framework/pull/2005>`_)

* various small enhancements, including:

  * use ``setvar`` in ``modules.py`` to define environment variables (`#2011 <https://github.com/hpcugent/easybuild-framework/pull/2011>`_)
  * include output of ``sanity_check_commands`` in the build log (`#2020 <https://github.com/hpcugent/easybuild-framework/pull/2020>`_)

* various bug fixes, including:

  * fix testing of bootstrap script in Travis config (`#2003 <https://github.com/hpcugent/easybuild-framework/pull/2003>`_)
  * use correct module syntax in bootstrap script if Lmod is not used (i.e. Tcl) (`#2007 <https://github.com/hpcugent/easybuild-framework/pull/2007>`_)
  * fix packaging issue with non-Python scripts in easybuild/scripts (`#2015 <https://github.com/hpcugent/easybuild-framework/pull/2015>`_)

    * fixes issue where RPATH wrapper template script (``rpath_wrapper_template.sh.in``) was not included in the v3.0.0 release

  * make tests more robust against running headless (`#2016 <https://github.com/hpcugent/easybuild-framework/pull/2016>`_)
  * avoid rewrapping already wrapped compiler/linker command with RPATH wrapper script (`#2022 <https://github.com/hpcugent/easybuild-framework/pull/2022>`_)
  * fix ``log.error`` traceback due to '``raise EasyBuildError``' involving a '``%s``' in error message (`#2024 <https://github.com/hpcugent/easybuild-framework/pull/2024>`_)
  * make sure '``modules_tool``' attribute is also defined for extensions (`#2026 <https://github.com/hpcugent/easybuild-framework/pull/2026>`_)
  * only dump easyconfig with modified deps due to ``--minimal-toolchains`` to 'reprod' subdir of install dir (`#2028 <https://github.com/hpcugent/easybuild-framework/pull/2028>`_)
  * avoid appending '``-h'`` to sanity check commands specified as a string (`#2030 <https://github.com/hpcugent/easybuild-framework/pull/2030>`_)
  * fix bug in ``list_software_rst``: always include version suffix regardless of value (`#2032 <https://github.com/hpcugent/easybuild-framework/pull/2032>`_)

**easyblocks**

* various enhancements, including:

  * update SAMtools easyblock for recent versions (`#1048 <https://github.com/hpcugent/easybuild-easyblocks/pull/1048>`_)

* various bugfixes, including:

  * fix QuantumESPRESSO easyblock to handle gipaw correctly (`#1041 <https://github.com/hpcugent/easybuild-easyblocks/pull/1041>`_)
  * always specify name of serial Fortran compiler to ALADIN, it already knows to use MPI wrapper commands (`#1050 <https://github.com/hpcugent/easybuild-easyblocks/pull/1050>`_)

**easyconfigs**

* added example easyconfig files for 7 new software packages:

  * Cookiecutter (`#3827 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3827>`_), ETE (`#3857 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3857>`_), findhap (`#3860 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3860>`_), graphviz (Python bindings, `#3826 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3826>`_), LoFreq (`#3856 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3856>`_), PhyloBayes-MPI (`#3859 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3859>`_), XGBoost (`#3849  <https://github.com/hpcugent/easybuild-easyconfigs/pull/3849>`_)

* added additional easyconfigs for various supported software packages

* various enhancements, including:

  * add ``ipywidgets`` and ``widgetsnbextension`` extensions to IPython 5.1.0 easyconfigs (`#3818 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3818>`_, `#3823 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3823>`_)
  * run dadi test suite as a sanity check command (`#3858 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3858>`_)

* various bug fixes, including:

  * fix incorrect descriptions for ifort (`#3817 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3817>`_)
  * fix ``modulename`` for Jinja2 and Pygments (`#3823 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3823>`_)
  * fix download URL in BLAST 2.2.26 easyconfig (`#3861 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3861>`_)


.. _release_notes_eb300:

v3.0.0 (November 16th 2016)
---------------------------

feature release

**framework**

* backward-incompatible changes:

  * make robot always consider subtoolchains, even without ``--minimal-toolchains`` (but in reverse order) (`#1973 <https://github.com/hpcugent/easybuild-framework/pull/1973>`_)
  * clean up behaviour that was deprecated for EasyBuild v3.0 (`#1978 <https://github.com/hpcugent/easybuild-framework/pull/1978>`_)
  * change *default* config to use ``Lmod``/``Lua`` for modules tool/syntax, ``GC3Pie`` as job backend (`#1985 <https://github.com/hpcugent/easybuild-framework/pull/1985>`_)
  * the minimal required version of Lmod was bumped to 5.8 (`#1985 <https://github.com/hpcugent/easybuild-framework/pull/1985>`_)

* major new features:

  * (experimental) support for RPATH linking via ``--rpath`` (`#1942 <https://github.com/hpcugent/easybuild-framework/pull/1942>`_)

    * see http://easybuild.readthedocs.org/en/latest/RPATH-support.html

  * add support for ``--consider-archived-easyconfigs`` (`#1972 <https://github.com/hpcugent/easybuild-framework/pull/1972>`_)

    * see http://easybuild.readthedocs.org/en/latest/Archived-easyconfigs.html

  * stabilize ``--new-pr`` and ``--update-pr`` (`#1979 <https://github.com/hpcugent/easybuild-framework/pull/1979>`_)

    * see http://easybuild.readthedocs.org/en/latest/Integration_with_GitHub.html

* various other small enhancements, including:

  * add support for '``devel``' log level (`#1815 <https://github.com/hpcugent/easybuild-framework/pull/1815>`_)
  * make ``remove_file`` aware of ``--extended-dry-run`` + add dedicated unit test (`#1932 <https://github.com/hpcugent/easybuild-framework/pull/1932>`_)
  * add support for filtering out setting/updating particular environment variables from generated modules (`#1943 <https://github.com/hpcugent/easybuild-framework/pull/1943>`_)

    * see ``--filter-env-vars``

  * clean up output of EasyBuild bootstrap script & add version (`#1944 <https://github.com/hpcugent/easybuild-framework/pull/1944>`_)
  * improved ARM platform/CPU detection (`#1953 <https://github.com/hpcugent/easybuild-framework/pull/1953>`_)
  * use '``0``' as letter dir for funky software names that don't start with a letter, e.g., ``3to2`` (`#1954 <https://github.com/hpcugent/easybuild-framework/pull/1954>`_)
  * make bootstrap script aware of ``vsc-install`` for offline installation (`#1955 <https://github.com/hpcugent/easybuild-framework/pull/1955>`_)
  * add support for ``blas_family()`` and ``lapack_family()`` methods in ``Toolchain`` instances (`#1961 <https://github.com/hpcugent/easybuild-framework/pull/1961>`_)
  * make ``copy_file`` dry-run aware (`#1963 <https://github.com/hpcugent/easybuild-framework/pull/1963>`_)
  * reorganise test easyconfigs to match structure in easyconfigs repo (`#1970 <https://github.com/hpcugent/easybuild-framework/pull/1970>`_)
  * add a toolchain compiler option for enforcing IEEE-754 conformance (`#1975 <https://github.com/hpcugent/easybuild-framework/pull/1975>`_)
  * support for ``intelcuda`` compiler toolchain (`#1976 <https://github.com/hpcugent/easybuild-framework/pull/1976>`_)
  * check that each glob pattern matches at least one file ``expand_glob_paths`` (important for ``--include-*``) (`#1980 <https://github.com/hpcugent/easybuild-framework/pull/1980>`_)
  * enhance bootstrap to auto-skip stage 0 in case a suitable setuptools is already available (`#1946 <https://github.com/hpcugent/easybuild-framework/pull/1946>`_, `#1984 <https://github.com/hpcugent/easybuild-framework/pull/1984>`_)
  * simplify ``GC3Pie`` version check (`#1987 <https://github.com/hpcugent/easybuild-framework/pull/1987>`_)
  * include suggestion on how to change configuration w.r.t. modules tool/syntax (`#1989 <https://github.com/hpcugent/easybuild-framework/pull/1989>`_)

* various bug fixes, including:

  * fix test for ``find_easybuild_easyconfig`` (`#1931 <https://github.com/hpcugent/easybuild-framework/pull/1931>`_)
  * remove existing module file under ``--force``/``--rebuild`` (`#1933 <https://github.com/hpcugent/easybuild-framework/pull/1933>`_)
  * fix combining ``--search`` and ``--try-*`` (`#1937 <https://github.com/hpcugent/easybuild-framework/pull/1937>`_)
  * fix appending to existing ``buildstats`` in ``FileRepository.add_easyconfig`` (`#1948 <https://github.com/hpcugent/easybuild-framework/pull/1948>`_)
  * fix handling of iterate easyconfig parameters, restore them during cleanup (`#1949 <https://github.com/hpcugent/easybuild-framework/pull/1949>`_)
  * fix filtering loads for (hidden) build deps from generated module (`#1959 <https://github.com/hpcugent/easybuild-framework/pull/1959>`_)
  * handle multi-flag compiler options on all types of options (`#1966 <https://github.com/hpcugent/easybuild-framework/pull/1966>`_)
  * fix ``--list-software`` by making ``letter_dir_for`` function aware of '``*``' wildcard name (`#1969 <https://github.com/hpcugent/easybuild-framework/pull/1969>`_)
  * skip dependencies of toolchain marked as external modules when determining module hierarchy (`#1977 <https://github.com/hpcugent/easybuild-framework/pull/1977>`_)
  * bump page limit in ``fetch_latest_commit_sha``, spit out more meaningful error if too many branches were encountered (`#1981 <https://github.com/hpcugent/easybuild-framework/pull/1981>`_)
  * fix CUDA-related issues in ``HierarchicalMNS`` (`#1986 <https://github.com/hpcugent/easybuild-framework/pull/1986>`_)

**easyblocks**

* backwards incompatible changes:

  * remove deprecated GenomeAnalysisTK/GATK easyblock (`#1001 <https://github.com/hpcugent/easybuild-easyblocks/pull/1001>`_)
  * remove deprecated '``get_netcdf_module_set_cmds``' function from netCDF easyblock (`#1015 <https://github.com/hpcugent/easybuild-easyblocks/pull/1015>`_)
  * remove deprecated '``get_blas_lib``' function from LAPACK easyblock (`#1016 <https://github.com/hpcugent/easybuild-easyblocks/pull/1016>`_)
  * remove ``QLogicMPI`` easyblock (`#1023 <https://github.com/hpcugent/easybuild-easyblocks/pull/1023>`_)

* new easyblock for installing Anaconda (`#950 <https://github.com/hpcugent/easybuild-easyblocks/pull/950>`_)
* add generic easyblock for Conda installations (`#950 <https://github.com/hpcugent/easybuild-easyblocks/pull/950>`_)
* various enhancements, including:

  * enable use of ``GCCcore`` as toolchain for Clang, fail if no GCC prefix is found (`#1002 <https://github.com/hpcugent/easybuild-easyblocks/pull/1002>`_)
  * also build Boost MPI library in parallel (`#1005 <https://github.com/hpcugent/easybuild-easyblocks/pull/1005>`_, `#1038 <https://github.com/hpcugent/easybuild-easyblocks/pull/1038>`_)
  * enhance g2clib easyblock to allow to install 1.6.0 or higher (`#1006 <https://github.com/hpcugent/easybuild-easyblocks/pull/1006>`_)
  * update QuantumESPRESSO easyblock to support packaging changes in 6.0 (`#1007 <https://github.com/hpcugent/easybuild-easyblocks/pull/1007>`_)
  * add support to ``Scons`` generic easyblock to provide argument to specify installation prefix (`#1008 <https://github.com/hpcugent/easybuild-easyblocks/pull/1008>`_)
  * update ``IntelBase`` and imkl easyblocks to handle the 2017 versions of compilers/imkl (`#1012 <https://github.com/hpcugent/easybuild-easyblocks/pull/1012>`_)
  * leverage ``toolchain.linalg`` functionality in ScaLAPACK easyblock, use ``copy_file`` (`#1014 <https://github.com/hpcugent/easybuild-easyblocks/pull/1014>`_)
  * allow netCDF-C++4 to be used with ESMF (`#1019 <https://github.com/hpcugent/easybuild-easyblocks/pull/1019>`_)
  * update Advisor easyblock to support latest versions (`#1021 <https://github.com/hpcugent/easybuild-easyblocks/pull/1021>`_)
  * update CBLAS easyblock to build with ``foss`` toolchain (`#1024 <https://github.com/hpcugent/easybuild-easyblocks/pull/1024>`_)
  * update Gurobi easyblock to use ``copy_file`` (`#1028 <https://github.com/hpcugent/easybuild-easyblocks/pull/1028>`_)
  * add support for giving ``/lib`` preference over ``/lib64`` & co in GCC installation (`#1030 <https://github.com/hpcugent/easybuild-easyblocks/pull/1030>`_, `#1035 <https://github.com/hpcugent/easybuild-easyblocks/pull/1035>`_)
  * enable installation of ``libiberty`` by default for binutils (`#1030 <https://github.com/hpcugent/easybuild-easyblocks/pull/1030>`_)
  * avoid CMake fiddling with the RPATHs injected by EasyBuild via ``--rpath`` in CMakeMake and METIS easyblocks (`#1031 <https://github.com/hpcugent/easybuild-easyblocks/pull/1031>`_, `#1034 <https://github.com/hpcugent/easybuild-easyblocks/pull/1034>`_)
  * simplify scipy sanity check to make it more robust w.r.t. version updates (`#1037 <https://github.com/hpcugent/easybuild-easyblocks/pull/1037>`_)

* various bug fixes, including:

  * make sure '``None``' doesn't appear in modules generated with ``--module-only`` (`#998 <https://github.com/hpcugent/easybuild-easyblocks/pull/998>`_)
  * fix ATLAS easyblock for non-x86 systems (`#1003 <https://github.com/hpcugent/easybuild-easyblocks/pull/1003>`_)
  * fix '``usempi``' and '``with_mpi``' usage to allow for a serial build of Amber 16 (`#1013 <https://github.com/hpcugent/easybuild-easyblocks/pull/1013>`_)
  * add both ``lib/python2.7/site-packages/{,wx-3.0-gtk2}`` to ``$PYTHONPATH`` for wxPython (`#1018 <https://github.com/hpcugent/easybuild-easyblocks/pull/1018>`_)
  * only hard inject RPATH for ``/usr/lib*`` directories when building binutils with ``dummy`` toolchain (`#1026 <https://github.com/hpcugent/easybuild-easyblocks/pull/1026>`_)
  * make HDF5 easyblock handle ``--filter-deps`` correctly (`#1027 <https://github.com/hpcugent/easybuild-easyblocks/pull/1027>`_)
  * update Travis config w.r.t. changes framework config defaults and required Lmod version (`#1029 <https://github.com/hpcugent/easybuild-easyblocks/pull/1029>`_)
  * be more patient when running Mathematica Q&A installer (`#1036 <https://github.com/hpcugent/easybuild-easyblocks/pull/1036>`_)

**easyconfigs**

* backwards incompatible changes:

  * archive easyconfigs using old inactive toolchains

    * see `#3725 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3725>`_, `#3728 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3728>`_, `#3729 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3729>`_, `#3730 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3730>`_, `#3731 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3731>`_, `#3732 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3732>`_, `#3733 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3733>`_, `#3735 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3735>`_, `#3736 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3736>`_, `#3737 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3737>`_, `#3738 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3738>`_
    * only taken into account by EasyBuild if ``--consider-archived-easyconfigs`` is enabled
    * no easyconfigs available outside of archive for QLogicMPI + 15 toolchains:

      * ``ClangGCC``, ``cgmpich``, ``cgmpolf``, ``cgmvapich2``, ``cgmvolf``, ``cgompi``, ``cgoolf``, ``gmacml``,
        ``goalf``, ``gpsmpi``, ``gpsolf``, ``iiqmpi``, ``intel-para``, ``ipsmpi``, ``iqacml``

  * fix name in PyTables easyconfigs (was 'pyTables') (`#3785 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3785>`_)

* added example easyconfig files for 32 new software packages:

  * 3to2 (`#3655 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3655>`_), Anaconda2 (`#3337 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3337>`_), Anaconda3 (`#3337 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3337>`_), ART (`#3724 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3724>`_), atools (`#3631 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3631>`_),
    awscli (`#3645 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3645>`_), behave (`#3751 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3751>`_), Blosc (`#3785 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3785>`_), bokeh (`#3790 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3790>`_), Cantera (`#3655 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3655>`_),
    Cargo (`#3764 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3764>`_), dadi v1.7.0, distributed (`#3786 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3786>`_), ea-utils (`#3634 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3634>`_), Elk (`#3644 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3644>`_),
    FGSL (`#3638 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3638>`_), gencore_variant_detection (`#3337 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3337>`_), help2man (`#3768 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3768>`_), lbzip2 (`#3791 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3791>`_),
    Log-Log4perl (`#3574 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3574>`_), Minimac2 (`#3783 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3783>`_), mypy (`#3694 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3694>`_), OBITools (`#3573 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3573>`_),
    perl-app-cpanminus (`#3337 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3337>`_), PGDSpider (`#3625 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3625>`_), prokka (`#3755 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3755>`_), Reads2snp (`#3609 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3609>`_),
    spglib-python (`#3620 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3620>`_), SUNDIALS (`#3654 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3654>`_, `#3655 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3655>`_), SelEstim (`#3626 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3626>`_), XMLStarlet (`#3797 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3797>`_),
    x265 (`#3090 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3090>`_)

* added easyconfigs for new '``intelcuda``' toolchain (`#3750 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3750>`_)

* added new easyconfigs for existing toolchains:

  * ``goolfc/2016.08`` (`#3796 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3796>`_), ``goolfc/2016.10`` (`#3666 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3666>`_, `#3775 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3775>`_), ``intel/2017.00`` (`#3543 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3543>`_), ``intel/2017.01`` (`#3757 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3757>`_),
    ``iomkl/2016.09-GCC-4.9.3-2.25`` (`#3680 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3680>`_), ``iomkl/2016.09-GCC-5.4.0-2.26`` (`#3772 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3772>`_)

* added additional easyconfigs for various supported software packages, including:

  * Advisor 2017 update 1, Amber 16, ATLAS 3.10.2, GROMACS 2016, Octave 4.0.3,
    OpenFOAM 3.0.1, PyTables 3.3.0, QuantumESPRESSO 6.0, Rust v1.12.1

* various other enhancements, including:

  * STREAM builds using ~56GiB and ~111GiB (`#3670 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3670>`_)

* various bug fixes, including:

  * fix source spec in VASP easyconfig, ensure static linking with Intel MKL (`#3381 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3381>`_)
  * fix source URL in GCCcore 6.2.0 easyconfig (`#3608 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3608>`_)
  * correct STAMP dependency in i-cisTarget, must be 1.3 (`#3613 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3613>`_)
  * consistently specify to use ``-fgnu89-inline`` flag in M4 1.4.17 easyconfigs (`#3623 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3623>`_)
  * fix source URLs for Cython (`#3636 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3636>`_)
  * add Bison as build dep and M4 as runtime dep for flex 2.6.0 (`#3656 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3656>`_)
  * enable parallel building of flex 2.6.0 (`#3630 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3630>`_)
  * add zlib and bzip2 dependencies to X11 bundle (`#3662 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3662>`_)
  * use '``letter_dir_for``' function rather than just grabbing 1st letter of software name in easyconfigs tests (`#3664 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3664>`_)
  * add patch to fix typo in GRIT 2.0.5 (`#3675 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3675>`_)
  * fix typo in patch for WRF 3.8.0 (`#3702 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3702>`_)
  * use ``$CC``, ``$CXX`` rather than ``$I_MPI_CC``, ``$I_MPI_CXX`` in patch for OpenFOAM 4.0 (`#3703 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3703>`_)
  * patch FLTK to fix '``undefined symbol``' issue when building Octave (`#3704 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3704>`_)
  * include Pillow as a proper dep for scikit-image rather than as extension, since it has deps itself (`#3723 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3723>`_)
  * update Travis config w.r.t. changes framework config defaults and required Lmod version (`#3773 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3773>`_)
  * don't limit parallellism to 4 in recent GCC easyconfigs (`#3776 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3776>`_, `#3777 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3777>`_, `#3778 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3778>`_)
  * include M4 as dependency in flex 2.5.39 easyconfigs + fix consistency issues (`#3782 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3782>`_)
  * consistently apply patch for ncurses 6.0 (`#3792 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3792>`_)
  * eliminate dependency on ``mpi-mic-rt`` in ifort (`#3793 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3793>`_)
  * include Autotools as build dependency in all beagle-lib and MrBayes easyconfigs (`#3794 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3794>`_)
  * make OpenBLAS use the LAPACK version specified in the easyconfig (v0.2.18 & v0.2.19) (`#3795 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3795>`_)
  * include original download URL for ISL source tarball in GCC easyconfigs (`#3798 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3798>`_)
  * disable installing ``libiberty`` for binutils built with intel toolchain (`#3802 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3802>`_)


.. _release_notes_eb290:

v2.9.0 (September 23rd 2016)
----------------------------

feature release

**framework**

* note: vsc-base 2.5.4 or more recent is now required
* various small enhancements, including:

  * change option ``--color`` choices to auto/always/never (`#1701 <https://github.com/hpcugent/easybuild-framework/pull/1701>`_, `#1898 <https://github.com/hpcugent/easybuild-framework/pull/1898>`_, `#1911 <https://github.com/hpcugent/easybuild-framework/pull/1911>`_)
  * add support for '``hidden``' easyconfig parameter (`#1837 <https://github.com/hpcugent/easybuild-framework/pull/1837>`_)
  * add support for using ``ccache`` and ``f90cache`` compiler caching tools (`#1844 <https://github.com/hpcugent/easybuild-framework/pull/1844>`_, `#1912 <https://github.com/hpcugent/easybuild-framework/pull/1912>`_)

    * see ``--use-ccache`` and ``--use-f90cache``

  * update Cray metadata for 16.06 CrayPE release (`#1851 <https://github.com/hpcugent/easybuild-framework/pull/1851>`_)
  * also include patch files in ``--new-pr`` and ``--update-pr`` (`#1852 <https://github.com/hpcugent/easybuild-framework/pull/1852>`_)
  * handle deleted files in ``--new-pr`` (`#1853 <https://github.com/hpcugent/easybuild-framework/pull/1853>`_)
  * add support for ``--install-latest-eb-release`` (`#1861 <https://github.com/hpcugent/easybuild-framework/pull/1861>`_)
  * add support for hiding toolchains, see ``--hide-toolchains`` and '``hidden``' key in '``toolchain``' spec (`#1871 <https://github.com/hpcugent/easybuild-framework/pull/1871>`_)
  * add template for GitHub source URL (`#1872 <https://github.com/hpcugent/easybuild-framework/pull/1872>`_)
  * add support for combining ``--new-pr``/``--update-pr`` and ``--robot`` (`#1881 <https://github.com/hpcugent/easybuild-framework/pull/1881>`_)
  * add support for ``--list-software`` and ``--list-installed-software`` (`#1883 <https://github.com/hpcugent/easybuild-framework/pull/1883>`_, `#1910 <https://github.com/hpcugent/easybuild-framework/pull/1910>`_, `#1917 <https://github.com/hpcugent/easybuild-framework/pull/1917>`_)
  * print message on which extension is being installed, incl. progress counter (`#1886 <https://github.com/hpcugent/easybuild-framework/pull/1886>`_, `#1914 <https://github.com/hpcugent/easybuild-framework/pull/1914>`_)
  * add support for ``--github-org`` to specify GitHub organisation rather than GitHub user (`#1894 <https://github.com/hpcugent/easybuild-framework/pull/1894>`_)
  * add support for running Lmod in debug mode (`#1895 <https://github.com/hpcugent/easybuild-framework/pull/1895>`_)
  * avoid needless use of deepcopy, speed up support for templating in easyconfigs (`#1897 <https://github.com/hpcugent/easybuild-framework/pull/1897>`_)
  * convert ``all_dependencies`` to a property in ``EasyConfig`` class (`#1909 <https://github.com/hpcugent/easybuild-framework/pull/1909>`_)
  * add support for ``--mpi-cmd-template`` (`#1918 <https://github.com/hpcugent/easybuild-framework/pull/1918>`_)
  * add support for ``--disable-mpi-tests`` (`#1920 <https://github.com/hpcugent/easybuild-framework/pull/1920>`_)

* various bug fixes, including:

  * merge with develop when using ``--from-pr`` (`#1838 <https://github.com/hpcugent/easybuild-framework/pull/1838>`_, `#1867 <https://github.com/hpcugent/easybuild-framework/pull/1867>`_)
  * ensure ``--new-pr`` doesn't open empty pull requests (`#1846 <https://github.com/hpcugent/easybuild-framework/pull/1846>`_)
  * better error handling for outdated ``GitPython`` module in ``--check-github`` (`#1847 <https://github.com/hpcugent/easybuild-framework/pull/1847>`_)
  * fix formatting for generated easyblocks documentation (`#1860 <https://github.com/hpcugent/easybuild-framework/pull/1860>`_)
  * make sure the robot ignores filtered dependencies when creating toolchain cache (`#1862 <https://github.com/hpcugent/easybuild-framework/pull/1862>`_)
  * honor ``--filter-deps`` under ``--minimal-toolchains`` (`#1863 <https://github.com/hpcugent/easybuild-framework/pull/1863>`_)
  * correct format for '``param``' and '``author``' tags in docstrings (`#1866 <https://github.com/hpcugent/easybuild-framework/pull/1866>`_)
  * ignore failing bootstrap test in Travis config file (`#1870 <https://github.com/hpcugent/easybuild-framework/pull/1870>`_)
  * make sure all output of executed command is included in generated temporary log file (`#1873 <https://github.com/hpcugent/easybuild-framework/pull/1873>`_, `#1874 <https://github.com/hpcugent/easybuild-framework/pull/1874>`_)
  * ensure ``--show_hidden`` is used in the correct location for '``avail``' with Lmod (`#1875 <https://github.com/hpcugent/easybuild-framework/pull/1875>`_)
  * make sure ``self.path`` is passed down in copy method of ``EasyConfig`` object (`#1884 <https://github.com/hpcugent/easybuild-framework/pull/1884>`_)
  * take into account possible multi-line modloadmsg in ``ModuleGeneratorLua`` (`#1885 <https://github.com/hpcugent/easybuild-framework/pull/1885>`_)
  * fix extracting ``.bz2`` source files (`#1889 <https://github.com/hpcugent/easybuild-framework/pull/1889>`_)
  * don't resolve path to Lmod command (`#1892 <https://github.com/hpcugent/easybuild-framework/pull/1892>`_)
  * fix skipping of stage 0 in bootstrap script (`#1893 <https://github.com/hpcugent/easybuild-framework/pull/1893>`_)
  * fix function signature of ``log.deprecated`` compared to ``fancylogger.deprecated`` (`#1896 <https://github.com/hpcugent/easybuild-framework/pull/1896>`_, `#1899 <https://github.com/hpcugent/easybuild-framework/pull/1899>`_)
  * apply patch to Tcl/C environment modules tool for Tcl 8.6 support in Travis config (`#1901 <https://github.com/hpcugent/easybuild-framework/pull/1901>`_)
  * fix combining ``--extended-dry-run`` with ``--from-pr`` (`#1902 <https://github.com/hpcugent/easybuild-framework/pull/1902>`_)
  * also template dict keys (`#1904 <https://github.com/hpcugent/easybuild-framework/pull/1904>`_)
  * don't pass '``--try-*``' command-line options to EB instance running within job script (`#1908 <https://github.com/hpcugent/easybuild-framework/pull/1908>`_)
  * add workaround for incorrectly passing command line arguments with ``--job`` (`#1915 <https://github.com/hpcugent/easybuild-framework/pull/1915>`_)
  * fix issues with ``--module-only`` (`#1919 <https://github.com/hpcugent/easybuild-framework/pull/1919>`_, `#1924 <https://github.com/hpcugent/easybuild-framework/pull/1924>`_, `#1925 <https://github.com/hpcugent/easybuild-framework/pull/1925>`_)

    * correctly deal with specified start_dir
    * do not remove installation directory when build-in-installdir is enabled

  * make sure '``which``' function returns path to a file (`#1921 <https://github.com/hpcugent/easybuild-framework/pull/1921>`_)
  * fix ``:param:``, ``:return:`` tags in docstrings & add test for it (`#1923 <https://github.com/hpcugent/easybuild-framework/pull/1923>`_)

**easyblocks**

* new easyblocks for 6 software packages that require customized support:

  * cppcheck (`#983 <https://github.com/hpcugent/easybuild-easyblocks/pull/983>`_), HEALPix (`#982 <https://github.com/hpcugent/easybuild-easyblocks/pull/982>`_), IMOD (`#847 <https://github.com/hpcugent/easybuild-easyblocks/pull/847>`_), IronPython (`#321 <https://github.com/hpcugent/easybuild-easyblocks/pull/321>`_), Mono (`#321 <https://github.com/hpcugent/easybuild-easyblocks/pull/321>`_), MyMediaLite (`#321 <https://github.com/hpcugent/easybuild-easyblocks/pull/321>`_)

* various enhancements, including:

  * extend OpenFoam-Extend sanity check for decomp libaries (`#784 <https://github.com/hpcugent/easybuild-easyblocks/pull/784>`_)
  * enhance Java easyblock to support installing Java 6.x (`#940 <https://github.com/hpcugent/easybuild-easyblocks/pull/940>`_)
  * make QuantumESPRESSO easyblock aware of multithreaded FFT (`#954 <https://github.com/hpcugent/easybuild-easyblocks/pull/954>`_)
  * extend PSI easyblock to use PCMSolver and CheMPS2 (`#967 <https://github.com/hpcugent/easybuild-easyblocks/pull/967>`_)
  * make Boost easyblock add definition for ``$BOOST_ROOT`` to generated module file (`#976 <https://github.com/hpcugent/easybuild-easyblocks/pull/976>`_)
  * add support to Bundle easyblock to install list of components (`#980 <https://github.com/hpcugent/easybuild-easyblocks/pull/980>`_)
  * enhance & clean up libxml2 easyblock to also enable installing without Python bindings (`#984 <https://github.com/hpcugent/easybuild-easyblocks/pull/984>`_)
  * update Libint easyblock for Libint 2.1.x (`#985 <https://github.com/hpcugent/easybuild-easyblocks/pull/985>`_)
  * update sanity check for OpenFOAM to support OpenFOAM 4.x (`#986 <https://github.com/hpcugent/easybuild-easyblocks/pull/986>`_)
  * make easyblocks that run MPI tests aware of '``mpi_tests``' build option (`#993 <https://github.com/hpcugent/easybuild-easyblocks/pull/993>`_)

* various bug fixes, including:

  * fix compatibility of OpenFOAM easyblock with ``--module-only`` (`#784 <https://github.com/hpcugent/easybuild-easyblocks/pull/784>`_)
  * fix testing of ``--module-only`` compatibility for OpenFOAM and IMOD easyblocks (`#784 <https://github.com/hpcugent/easybuild-easyblocks/pull/784>`_)
  * add '``include/libxml2``' to ``$CPATH`` in libxml2 easyblock (`#981 <https://github.com/hpcugent/easybuild-easyblocks/pull/981>`_)
  * fix compatibility of IntelBase generic easyblock with ``--module-only`` (`#994 <https://github.com/hpcugent/easybuild-easyblocks/pull/994>`_)
  * make sure correct config script is used for Tcl/Tk deps of R (`#995 <https://github.com/hpcugent/easybuild-easyblocks/pull/995>`_)

**easyconfigs**

* added example easyconfig files for 88 new software packages:

  * ADMIXTURE (`#3359 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3359>`_), angsd (`#3593 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3593>`_), ASHS (`#3429 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3429>`_), AutoDock (`#3465 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3465>`_), AutoGrid (`#3466 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3466>`_), BayeScan (`#2748 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2748>`_, `#3356 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3356>`_),
    BayPass (`#3451 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3451>`_), Bazel (`#3379 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3379>`_), Blender (`#3553 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3553>`_, `#3558 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3558>`_), bwakit (`#3567 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3567>`_), BXH_XCEDE_TOOLS (`#3410 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3410>`_), CastXML (`#3403 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3403>`_),
    CHASE (`#3304 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3304>`_), configparser (`#3368 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3368>`_, `#3424 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3424>`_), configurable-http-proxy (`#3380 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3380>`_), cppcheck (`#3508 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3508>`_), CRPropa (`#779 <https://github.com/hpcugent/easybuild-easyconfigs/pull/779>`_),
    DicomBrowser (`#3432 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3432>`_), DMTCP (`#3422 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3422>`_), entrypoints (`#3368 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3368>`_, `#3424 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3424>`_), f90cache (`#3570 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3570>`_), fastPHASE (`#3343 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3343>`_),
    fastQValidator (`#3192 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3192>`_), FFindex (`#1135 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1135>`_), FragGeneScan (`#1198 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1198>`_), gdc-client (`#3399 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3399>`_), gflags (`#3417 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3417>`_), glog (`#3417 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3417>`_),
    GRIT (`#3561 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3561>`_), H5hut (`#3431 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3431>`_), HAPGEN2 (`#3344 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3344>`_), HEALPix (`#779 <https://github.com/hpcugent/easybuild-easyconfigs/pull/779>`_), IMOD (`#1187 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1187>`_, `#3347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3347>`_), IronPython (`#607 <https://github.com/hpcugent/easybuild-easyconfigs/pull/607>`_),
    jhbuild (`#3476 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3476>`_), jupyterhub (`#3380 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3380>`_), Keras (`#3581 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3581>`_), khmer (`#1158 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1158>`_), LeadIT (`#3345 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3345>`_, `#3599 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3599>`_), LevelDB (`#3417 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3417>`_),
    libbitmask (`#3481 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3481>`_), libcpuset (`#3481 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3481>`_), LMDB (`#3417 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3417>`_), log4cplus (`#1136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1136>`_), MACH (`#3346 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3346>`_), Mako (`#3460 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3460>`_), Maq (`#3428 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3428>`_),
    MetaGeneAnnotator (`#3307 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3307>`_), Metal (`#3324 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3324>`_), Mono (`#607 <https://github.com/hpcugent/easybuild-easyconfigs/pull/607>`_), MyMediaLite (`#607 <https://github.com/hpcugent/easybuild-easyconfigs/pull/607>`_), nco (`#2575 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2575>`_), nose-parameterized (`#3579 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3579>`_),
    OpenEXR (`#3553 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3553>`_), OpenImageIO (`#3553 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3553>`_), path.py (`#3368 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3368>`_, `#3424 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3424>`_), PCRE2 (`#3325 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3325>`_), pftoolsV3 (`#3317 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3317>`_), PHASE (`#3385 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3385>`_),
    PLAST (`#3288 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3288>`_), PLINKSEQ (`#3402 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3402>`_), POV-Ray (`#3551 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3551>`_), ProbABEL (`#3108 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3108>`_), prompt-toolkit (`#3368 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3368>`_, `#3424 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3424>`_),
    protobuf-python (`#3563 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3563>`_), PSORTb (`#3317 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3317>`_), py (`#3403 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3403>`_, `#3482 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3482>`_), pygccxml (`#3403 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3403>`_, `#3482 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3482>`_), pyGIMLi (`#3403 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3403>`_, `#3482 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3482>`_),
    pyplusplus (`#3403 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3403>`_, `#3482 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3482>`_), PyQt5 (`#3533 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3533>`_), Pyro4 (`#3527 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3527>`_), pytest (`#3403 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3403>`_, `#3482 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3482>`_), QCA (`#3595 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3595>`_), RDMC (`#1137 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1137>`_),
    S.A.G.E. (`#3427 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3427>`_), SDL2 (`#3551 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3551>`_), SHORE (`#3531 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3531>`_), SimVascular (`#3555 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3555>`_), SortMeRNA (`#3326 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3326>`_), SUMACLUST (`#3316 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3316>`_),
    SUMATRA (`#3316 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3316>`_), Text-CSV (`#3323 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3323>`_), Triangle (`#3403 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3403>`_), VEGAS (`#3457 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3457>`_), VirSorter (`#3307 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3307>`_), wcwidth (`#3368 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3368>`_, `#3424 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3424>`_),
    X11 (`#3340 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3340>`_)

* added new easyconfigs for existing toolchains:

  * CrayGNU + CrayIntel 2016.06 (`#3377 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3377>`_)
  * foss 2016.07 (`#3517 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3517>`_) + 2016.09 (`#3523 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3523>`_)
  * iomkl 2016.07 (`#3458 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3458>`_)
  * pomkl 2016.09 (`#3516 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3516>`_)

* added additional easyconfigs for various supported software packages, including:

  * FFTW 3.3.5, GCC 4.9.4 + 6.2.0, GROMACS 5.1.4, IPython 5.1.0, LLVM 3.9.0, Mesa 12.0.1, OpenCV 3.1.0, OpenFOAM 4.0,
    OpenMPI 2.0.1, ParaView 5.1.2, PGI 16.7, QuantumESPRESSO 5.4.0, Qt5 5.7.0, R-bundle-Bioconductor 3.3, VTK 7.0.0,
    Yade 2016.06a

* various enhancements, including:

  * adjust PSI4 easyconfigs for updated easyblock (`#3312 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3312>`_)
  * clean up libxml2 easyconfigs according to updated libxml2 easyblock (`#3479 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3479>`_, `#3509 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3509>`_)
  * significantly speed up verifying of dumped easyconfig by resorting to 'shallow' parsing (`#3520 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3520>`_)
  * include sanity checks for all MATIO config files (`#3528 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3528>`_)
  * remove ``--with-tcl-config``/``--with-tk-config`` from R easyconfig, already done in R easyblock (`#3580 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3580>`_)

* various bug fixes, including:

  * disable testing in all ParaView 4.4.0 easyconfigs, required download is too much of a PITA (`#3178 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3178>`_)
  * add SQLite as dep to GDAL 2.1.0 easyconfigs (`#3342 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3342>`_)
  * add zlib/SQLite/LibTIFF as dep to R 3.3.1 easyconfigs (`#3342 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3342>`_)
  * add bzip2 as a dependency of freetype (`#3464 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3464>`_)
  * specify correct MPI target in FDS easyconfigs (`#3488 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3488>`_)
  * add tcsh as OS dep in NAMD easyconfigs (`#3491 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3491>`_)
  * statically link ncurses/libreadline in Lua easyconfig with '``dummy``' toolchain (`#3545 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3545>`_)
  * add M4 as dep for flex 2.6.x (`#3542 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3542>`_, `#3550 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3550>`_)
  * add bzip2 and libxcb dependencies to FFmpeg 3.x easyconfigs (`#3548 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3548>`_)
  * make sure & check that Graphviz does not install Tcl bindings in Tcl install prefix (`#3556 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3556>`_)
  * add missing patches for extensions in Python 3.x easyconfigs (`#3557 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3557>`_)
  * add missing XZ dependency to libxml2 2.9.4 easyconfigs, change gettext dep of XZ to build-only dep (`#3568 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3568>`_)
  * enable running of tests for HPCG (`#3578 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3578>`_)
  * fix ``buildopts`` in tabix easyconfigs (`#3584 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3584>`_)

.. _release_notes_eb282:

v2.8.2 (July 13th 2016)
-----------------------

bugfix release

**framework**

* various small enhancements, including:

  * add support for rst output for ``--list-*`` and ``--avail-*`` (`#1339 <https://github.com/hpcugent/easybuild-framework/pull/1339>`_)
  * add support for '``eb --check-conflicts``' (`#1747 <https://github.com/hpcugent/easybuild-framework/pull/1747>`_, `#1807 <https://github.com/hpcugent/easybuild-framework/pull/1807>`_, `#1833 <https://github.com/hpcugent/easybuild-framework/pull/1833>`_)
  * ensure nice error message when non-existing path is passed to ``apply_regex_substitutions`` (`#1788 <https://github.com/hpcugent/easybuild-framework/pull/1788>`_)
  * add check for module output, empty stdout is a sign of trouble with Lmod (`#1793 <https://github.com/hpcugent/easybuild-framework/pull/1793>`_)
  * add multi-threaded FFT to toolchain (`#1802 <https://github.com/hpcugent/easybuild-framework/pull/1802>`_)
  * avoid special characters like '[', ']' in path to temporary directory (`#1808 <https://github.com/hpcugent/easybuild-framework/pull/1808>`_)
  * add support for ``--zip-logs`` (`#1820 <https://github.com/hpcugent/easybuild-framework/pull/1820>`_)
  * add support for ``--extra-modules`` (`#1821 <https://github.com/hpcugent/easybuild-framework/pull/1821>`_)
  * add type conversion for 'checksums' and 'patches' parameter in .yeb easyconfigs (`#1826 <https://github.com/hpcugent/easybuild-framework/pull/1826>`_, `#1840 <https://github.com/hpcugent/easybuild-framework/pull/1840>`_)
  * add support for filtering tests by name (`#1828 <https://github.com/hpcugent/easybuild-framework/pull/1828>`_)
  * add support for ``--avail-toolchain-opts`` (`#1830 <https://github.com/hpcugent/easybuild-framework/pull/1830>`_, `#1839 <https://github.com/hpcugent/easybuild-framework/pull/1839>`_)
  * use absolute path for robot and easyconfig files (`#1834 <https://github.com/hpcugent/easybuild-framework/pull/1834>`_)
  * add backup URL for tarballs hosted on SourceForge in ``install_eb_dep.sh`` script (`#1843 <https://github.com/hpcugent/easybuild-framework/pull/1843>`_)

* various bug fixes, including:

  * fix installation of Lua in ``install_eb_dep.sh`` script (`#1789 <https://github.com/hpcugent/easybuild-framework/pull/1789>`_)
  * fix OpenMP flag for Cray compiler wrappers (`#1794 <https://github.com/hpcugent/easybuild-framework/pull/1794>`_)
  * only reset ``$MODULEPATH`` before loading a module if environment was reset (`#1795 <https://github.com/hpcugent/easybuild-framework/pull/1795>`_)
  * include vsc-install as dependency in ``setup.py`` (`#1805 <https://github.com/hpcugent/easybuild-framework/pull/1805>`_)
  * cache ``$PATH`` & ``$PYTHONPATH`` in test setUp, restore them in tests where '``eb``' is used (`#1806 <https://github.com/hpcugent/easybuild-framework/pull/1806>`_)
  * don't reset ``$MODULEPATH`` in stage 2 of bootstrap script, support forced installation during stage 2 (`#1810 <https://github.com/hpcugent/easybuild-framework/pull/1810>`_)
  * fix issue with templates defined by deps being required while still parsing deps (`#1812 <https://github.com/hpcugent/easybuild-framework/pull/1812>`_)
  * skip unneeded unuse/use commands on tail of ``$MODULEPATH`` in ``check_module_path`` (`#1813 <https://github.com/hpcugent/easybuild-framework/pull/1813>`_)
  * fix auto-convert for all ``*dependencies`` params in ``.yeb`` easyconfigs, ensure version is a string (`#1818 <https://github.com/hpcugent/easybuild-framework/pull/1818>`_)
  * fix ``keyring`` version in Travis config (`#1819 <https://github.com/hpcugent/easybuild-framework/pull/1819>`_)
  * fix dumping of ``.yeb`` easyconfig files in easyconfigs archive (`#1822 <https://github.com/hpcugent/easybuild-framework/pull/1822>`_)
  * fix format of supported easyconfig templates in help output (`#1825 <https://github.com/hpcugent/easybuild-framework/pull/1825>`_)
  * stick to ``pydot`` 1.1.0 for Python 2.6 in Travis config (`#1827 <https://github.com/hpcugent/easybuild-framework/pull/1827>`_)

**easyblocks**

* new easyblocks for 5 software packages that require customized support:

  * Amber (`#958 <https://github.com/hpcugent/easybuild-easyblocks/pull/958>`_), Extrae (`#955 <https://github.com/hpcugent/easybuild-easyblocks/pull/955>`_), Gurobi (`#962 <https://github.com/hpcugent/easybuild-easyblocks/pull/962>`_), Paraver (`#956 <https://github.com/hpcugent/easybuild-easyblocks/pull/956>`_), Tau (`#887 <https://github.com/hpcugent/easybuild-easyblocks/pull/887>`_)

* various enhancements, including:

  * add support for building & installing old GROMACS versions (`#569 <https://github.com/hpcugent/easybuild-easyblocks/pull/569>`_, `#960 <https://github.com/hpcugent/easybuild-easyblocks/pull/960>`_)
  * add support for building Boost with Cray toolchain (`#849 <https://github.com/hpcugent/easybuild-easyblocks/pull/849>`_)
  * libxsmm support for CP2K (`#942 <https://github.com/hpcugent/easybuild-easyblocks/pull/942>`_)
  * pick up specified components for imkl (`#943 <https://github.com/hpcugent/easybuild-easyblocks/pull/943>`_)
  * add support for building GROMACS with double precision (`#946 <https://github.com/hpcugent/easybuild-easyblocks/pull/946>`_, `#960 <https://github.com/hpcugent/easybuild-easyblocks/pull/960>`_)
  * add support for building GROMACS with CUDA support and using dynamic libraries using ``Cray`` toolchains (`#951 <https://github.com/hpcugent/easybuild-easyblocks/pull/951>`_, `#960 <https://github.com/hpcugent/easybuild-easyblocks/pull/960>`_)
  * also install vsc-install in ``EasyBuildMeta`` easyblock, if tarball is provided (`#957 <https://github.com/hpcugent/easybuild-easyblocks/pull/957>`_)
  * enhance PSI easyblock to support PSI4 1.0 (`#965 <https://github.com/hpcugent/easybuild-easyblocks/pull/965>`_)

* various bug fixes, including:

  * also install scripts with MRtrix 0.3.14 (`#941 <https://github.com/hpcugent/easybuild-easyblocks/pull/941>`_)
  * enhance Qt easyblock to support Qt3 (`#944 <https://github.com/hpcugent/easybuild-easyblocks/pull/944>`_)
  * create '``release``' symlink in MRtrix install dir (`#947 <https://github.com/hpcugent/easybuild-easyblocks/pull/947>`_)
  * fix ``make_installdir`` in Inspector & VTune easyblocks (`#952 <https://github.com/hpcugent/easybuild-easyblocks/pull/952>`_)
  * make ``Binary`` and ``MakeCp`` easyblocks aware of '``keepsymlinks``' (`#959 <https://github.com/hpcugent/easybuild-easyblocks/pull/959>`_)
  * correctly define ``$G4*`` environment variables in Geant4 easyblock (`#961 <https://github.com/hpcugent/easybuild-easyblocks/pull/961>`_, `#970 <https://github.com/hpcugent/easybuild-easyblocks/pull/970>`_)
  * prepend tmp install path to ``$PYTHONPATH`` in numpy test step, move to build dir when removing '``numpy``' subdir (`#963 <https://github.com/hpcugent/easybuild-easyblocks/pull/963>`_)
  * correct full path to ALADIN config file & patch it to use right Fortran compiler flags (`#964 <https://github.com/hpcugent/easybuild-easyblocks/pull/964>`_)
  * ensure correct compiler command/flags are used for SAMtools (`#966 <https://github.com/hpcugent/easybuild-easyblocks/pull/966>`_)

**easyconfigs**

* added example easyconfig files for 54 new software packages:

  * Amber (`#3200 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3200>`_), Bullet (`#3175 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3175>`_), CONTRAlign (`#690 <https://github.com/hpcugent/easybuild-easyconfigs/pull/690>`_), Cluster-Buster (`#3191 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3191>`_), damageproto (`#3222 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3222>`_, `#3308 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3308>`_), DCA++ (`#3219 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3219>`_), EIGENSOFT (`#3147 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3147>`_, `#3163 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3163>`_), Extrae (`#507 <https://github.com/hpcugent/easybuild-easyconfigs/pull/507>`_), fdstools (`#3237 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3237>`_), ffnet (`#3273 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3273>`_), GP2C (`#3257 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3257>`_), Gurobi (`#3239 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3239>`_), gc (`#3202 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3202>`_, `#3261 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3261>`_), gputools (`#546 <https://github.com/hpcugent/easybuild-easyconfigs/pull/546>`_), IMa2p (`#3300 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3300>`_), IOzone (`#3253 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3253>`_), i-cisTarget (`#3191 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3191>`_, `#3194 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3194>`_), icmake (`#3243 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3243>`_), io_lib (`#3255 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3255>`_), Kent_tools (`#3191 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3191>`_), libcmaes (`#3256 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3256>`_), libpsortb (`#3259 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3259>`_), libxsmm (`#3099 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3099>`_), MEGACC (`#3263 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3263>`_), MM-align (`#1428 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1428>`_), MOSAIK (`#880 <https://github.com/hpcugent/easybuild-easyconfigs/pull/880>`_), MView (`#1345 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1345>`_), MySQL-python (`#3172 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3172>`_, `#3189 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3189>`_), magma (`#3219 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3219>`_), mrFAST (`#862 <https://github.com/hpcugent/easybuild-easyconfigs/pull/862>`_), mrsFAST (`#862 <https://github.com/hpcugent/easybuild-easyconfigs/pull/862>`_), mysqlclient (`#3172 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3172>`_, `#3232 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3232>`_), NTL (`#3183 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3183>`_), PARI-GP (`#3257 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3257>`_), Paraver (`#508 <https://github.com/hpcugent/easybuild-easyconfigs/pull/508>`_), psutil (`#3171 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3171>`_, `#3231 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3231>`_), PSI4 (`#3293 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3293>`_), Qwt (`#3157 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3157>`_), RMBlast (`#3142 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3142>`_), STAMP (`#3191 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3191>`_), Seqmagick (`#3264 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3264>`_), splitRef (`#946 <https://github.com/hpcugent/easybuild-easyconfigs/pull/946>`_), TAU (`#509 <https://github.com/hpcugent/easybuild-easyconfigs/pull/509>`_), TRF (`#3141 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3141>`_), TVB (`#3053 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3053>`_, `#3247 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3247>`_, `#3251 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3251>`_), TVB-deps (`#3053 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3053>`_, `#3247 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3247>`_, `#3251 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3251>`_), tvb-data (`#3053 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3053>`_, `#3247 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3247>`_, `#3251 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3251>`_), tvb-framework (`#3053 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3053>`_, `#3247 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3247>`_, `#3251 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3251>`_), tvb-library (`#3053 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3053>`_, `#3247 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3247>`_, `#3251 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3251>`_), VampirTrace (`#509 <https://github.com/hpcugent/easybuild-easyconfigs/pull/509>`_), Voro++ (`#3174 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3174>`_), wheel (`#3235 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3235>`_), wxPropertyGrid (`#508 <https://github.com/hpcugent/easybuild-easyconfigs/pull/508>`_), xonsh (`#3159 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3159>`_)

* added easyconfigs for update of common toolchains: ``foss/2016b`` (`#3271 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3271>`_), ``intel/2016b`` (`#3270 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3270>`_)
* added new easyconfigs for existing toolchains: ``CrayGNU/2016.03`` & ``CrayGNU/2016.04`` (`#3291 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3291>`_), ``foss/2016.06`` (`#3184 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3184>`_), ``intel/2016.03-GCC-5.4`` (`#3185 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3185>`_)
* added additional easyconfigs for various supported software packages, including:

  * Boost 1.61.0, GCC 5.4.0, GROMACS 3.3.3, HDF5 1.8.17, netCDF 4.4.1, numpy 1.11.0, Perl 5.24.0, PETSc 3.7.2, Python 2.7.12, Python 3.5.2, Qt 3.3.8, R 3.3.1

* various enhancements, including:

  * use ``check_conflicts`` function in easyconfigs tests (`#2981 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2981>`_)
  * also include vsc-install in list of sources for recent EasyBuild easyconfigs, to support offline installation (`#3203 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3203>`_)
  * enable building of ``libmysqld.*`` in MariaDB easyconfigs (`#3230 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3230>`_)
  * add ALDEx2, phyloseq to bundles for Bioconductor 3.2 (`#3211 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3211>`_, `#3241 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3241>`_)
  * add biom, geepack, lubridate, pim to list of R 3.2.3 extensions (`#3186 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3186>`_, `#3211 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3211>`_, `#3275 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3275>`_)

* various bug fixes, including:

  * add patch for Boost 1.60.0 to fix bug resulting in ``TypeError`` (`#3162 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3162>`_)
  * add fftw dependency to CP2K 2.6.0 easyconfigs using CrayGNU (`#3176 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3176>`_)
  * fix location of ``libelf.h``, only (also) installed as ``include/libelf.h`` is there's no ``/usr/include/libelf.h`` (`#3201 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3201>`_)
  * fix software name for Guile & GnuTLS (was 'guile' & 'gnutls') (`#3207 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3207>`_)
  * added missing space in Geant4 configopts to specify ``-DGEANT4_INSTALL_DATA`` (`#3209 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3209>`_)
  * fix Cython download URL in Python 2.7.11 easyconfigs (`#3212 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3212>`_)
  * add missing build deps for X stack in easyconfigs using ``foss/2016a`` or ``intel/2016a`` (`#3222 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3222>`_, `#3308 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3308>`_)
  * fix overruling of exts_list in Perl 5.22.2 easyconfig (`#3224 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3224>`_)
  * add missing dependency on GMP in R 3.2.3 easyconfigs (`#3226 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3226>`_)
  * don't hard specify toolchain for binutils build dep in likwid easyconfig, since it matches parent toolchain (`#3240 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3240>`_)
  * fix ``homepage`` & ``source_urls`` in HMMER easyconfigs (`#3246 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3246>`_)
  * stick to ``pydot`` 1.1.0 for Python 2.6 in Travis config (`#3282 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3282>`_)
  * add ``python-dev(el)`` to OS deps in GC3Pie easyconfigs (`#3310 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3310>`_)

.. _release_notes_eb281:

v2.8.1 (May 30th 2016)
----------------------

bugfix release

**framework**

* various bug fixes, including:

  * fix error message on missing module command in bootstrap script (`#1772 <https://github.com/hpcugent/easybuild-framework/pull/1772>`_)
  * expand '``~``' in paths specified to ``--include-*`` (`#1774 <https://github.com/hpcugent/easybuild-framework/pull/1774>`_)
  * break after deleting cache entry to avoid attempt to delete cache entry again (`#1776 <https://github.com/hpcugent/easybuild-framework/pull/1776>`_)
  * avoid changing ``$MODULEPATH`` when prepending with symlink of path already at head of ``$MODULEPATH`` (`#1777 <https://github.com/hpcugent/easybuild-framework/pull/1777>`_)
  * filter out duplicates in ``find_flexlm_license`` (`#1779 <https://github.com/hpcugent/easybuild-framework/pull/1779>`_)
  * stick with GitPython < 2.0 with Py2.6 in Travis configuration (`#1781 <https://github.com/hpcugent/easybuild-framework/pull/1781>`_)
  * don't use ``LooseVersion`` to define ``version_major``/``version_minor`` (`#1783 <https://github.com/hpcugent/easybuild-framework/pull/1783>`_)


**easyblocks**

* various enhancements, including:

  * update MRtrix easyblock for version 0.3.14 (`#932 <https://github.com/hpcugent/easybuild-easyblocks/pull/932>`_)
  * update Inspector easyblock for recent versions (`#934 <https://github.com/hpcugent/easybuild-easyblocks/pull/934>`_)
  * update VTune easyblock for recent versions (`#935 <https://github.com/hpcugent/easybuild-easyblocks/pull/935>`_)
  * add debug message to IntelBase easyblock w.r.t. switching to 'exist_lic' (`#936 <https://github.com/hpcugent/easybuild-easyblocks/pull/936>`_)


**easyconfigs**

* added example easyconfig files for 13 new software packages:

  * drFAST (`#906 <https://github.com/hpcugent/easybuild-easyconfigs/pull/906>`_), git-lfs (`#2478 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2478>`_), grabix (`#3127 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3127>`_), JWM (`#3007 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3007>`_), libcroco (`#3007 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3007>`_), librsvg (`#3007 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3007>`_), MaCH (`#3136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3136>`_), mayavi (`#3106 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3106>`_), OpenMM (`#2762 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2762>`_), Pysam (`#3080 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3080>`_), SeqPrep (`#3097 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3097>`_), vt (`#3128 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3128>`_), wkhtmltopdf (`#3098 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3098>`_)

* added new easyconfigs for existing toolchains: ``intel/2016.03-GCC-4.9`` (`#3088 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3088>`_)
* added additional easyconfigs for various supported software packages, including:

  * Boost 1.61.0, ESMF 7.0.0, Inspector 2016 update 3, IPython 4.2, netCDF-C++4 4.3.0, netCDF-Fortran 4.4.4,
    Perl 5.22.2, VTune 2016 update 3

* various bug fixes, including:

  * apply libreadline patch to fix bug triggering segmentation fault (`#3086 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3086>`_)

.. _release_notes_eb280:

v2.8.0 (May 18th 2016)
----------------------

feature + bugfix release

**framework**

* significant speedup improvements of EasyBuild itself, thanks to:

  * stop creating ``ModulesTool`` instances over and over again (`#1735 <https://github.com/hpcugent/easybuild-framework/pull/1735>`_)
  * cache result of '``module avail``' calls (`#1742 <https://github.com/hpcugent/easybuild-framework/pull/1742>`_)

* add support for using PGI as toolchain compiler (`#1342 <https://github.com/hpcugent/easybuild-framework/pull/1342>`_, `#1664 <https://github.com/hpcugent/easybuild-framework/pull/1664>`_, `#1759 <https://github.com/hpcugent/easybuild-framework/pull/1759>`_, `#1761 <https://github.com/hpcugent/easybuild-framework/pull/1761>`_, `#1764 <https://github.com/hpcugent/easybuild-framework/pull/1764>`_)

  * incl. new toolchain definitions ``pompi`` and ``pomkl`` (`#1724 <https://github.com/hpcugent/easybuild-framework/pull/1724>`_)

* add test configuration for Travis (`#1733 <https://github.com/hpcugent/easybuild-framework/pull/1733>`_, `#1737 <https://github.com/hpcugent/easybuild-framework/pull/1737>`_, `#1743 <https://github.com/hpcugent/easybuild-framework/pull/1743>`_, `#1767 <https://github.com/hpcugent/easybuild-framework/pull/1767>`_)
* various other enhancements, including:

  * add ``get_total_memory()`` function in ``systemtools`` module (`#1623 <https://github.com/hpcugent/easybuild-framework/pull/1623>`_)
  * ignore ``__init__.py`` files in ``--include-*`` (`#1704 <https://github.com/hpcugent/easybuild-framework/pull/1704>`_)
  * use ``-fopenmp`` rather than ``-openmp`` for Intel compilers, since ``-openmp`` is deprecated (`#1718 <https://github.com/hpcugent/easybuild-framework/pull/1718>`_)
  * add modules to metadata for Cray modules (`#1721 <https://github.com/hpcugent/easybuild-framework/pull/1721>`_)
  * make sure user write permissions are set after failed removal attempt of installation directory (`#1722 <https://github.com/hpcugent/easybuild-framework/pull/1722>`_)
  * escape special characters in software name in ``find_related_easyconfigs`` (`#1726 <https://github.com/hpcugent/easybuild-framework/pull/1726>`_)
  * add support for ``CrayPGI`` compiler toolchain (`#1729 <https://github.com/hpcugent/easybuild-framework/pull/1729>`_)
  * ensure read permission to all installed files for everybody (unless other options specify otherwise) (`#1731 <https://github.com/hpcugent/easybuild-framework/pull/1731>`_)
  * also consider ``$LMOD_CMD`` in bootstrap script (`#1736 <https://github.com/hpcugent/easybuild-framework/pull/1736>`_)
  * translate PyPI download URL to alternate URL with a hash (`#1749 <https://github.com/hpcugent/easybuild-framework/pull/1749>`_)
  * make ``get_software_libdir`` compatible with ``-x`` (`#1750 <https://github.com/hpcugent/easybuild-framework/pull/1750>`_)
  * set ``$LMOD_REDIRECT`` to '``no``' when initialising Lmod (`#1755 <https://github.com/hpcugent/easybuild-framework/pull/1755>`_)
  * add test for broken modules tool setup affecting '``module use``' (`#1758 <https://github.com/hpcugent/easybuild-framework/pull/1758>`_)

* various bug fixes, including:

  * isolate '``options``' tests from easyblocks other than the ones included in the tests (`#1699 <https://github.com/hpcugent/easybuild-framework/pull/1699>`_)
  * don't run '``module purge``' in tests, since EasyBuild may be made available through a module (`#1702 <https://github.com/hpcugent/easybuild-framework/pull/1702>`_)
  * avoid rehandling ``--include-*`` options over and over again during ``--show-config`` (`#1705 <https://github.com/hpcugent/easybuild-framework/pull/1705>`_)
  * remove useless ``test_cwd`` (`#1706 <https://github.com/hpcugent/easybuild-framework/pull/1706>`_)
  * fix bootstrap script: make sure setuptools installed in stage0 is still available at end of stage1 (`#1727 <https://github.com/hpcugent/easybuild-framework/pull/1727>`_)
  * forcibly create target branch in ``--update-pr`` (`#1728 <https://github.com/hpcugent/easybuild-framework/pull/1728>`_)
  * remove check whether '``easybuild``' is being imported from dir that contains ``easybuild/__init__.py`` (`#1730 <https://github.com/hpcugent/easybuild-framework/pull/1730>`_)
  * (re)install vsc-base during stage1 using ``--always-copy`` in bootstrap script, if needed (`#1732 <https://github.com/hpcugent/easybuild-framework/pull/1732>`_)
  * use ``os.path.realpath`` in ``test_wrong_modulepath`` to avoid symlinked path breaking the test (`#1740 <https://github.com/hpcugent/easybuild-framework/pull/1740>`_)
  * unset ``$PYTHONPATH`` in before tested bootstrapped EasyBuild module (`#1743 <https://github.com/hpcugent/easybuild-framework/pull/1743>`_)
  * take into account that paths in modulepath may be symlinks in ``test_module_caches`` (`#1745 <https://github.com/hpcugent/easybuild-framework/pull/1745>`_)
  * change to install dir rather than buildpath in sanity check of extension, latter may not exist (`#1746 <https://github.com/hpcugent/easybuild-framework/pull/1746>`_, `#1748 <https://github.com/hpcugent/easybuild-framework/pull/1748>`_)
  * only load modules using short module names (`#1754 <https://github.com/hpcugent/easybuild-framework/pull/1754>`_)
  * (re)load modules for build deps in extensions_step (`#1762 <https://github.com/hpcugent/easybuild-framework/pull/1762>`_)
  * fix ``modpath_extensions_for method``: take into account modules in Lua syntax (`#1766 <https://github.com/hpcugent/easybuild-framework/pull/1766>`_)
  * fix broken link to VSC website in license headers (`#1768 <https://github.com/hpcugent/easybuild-framework/pull/1768>`_)

**easyblocks**

* add test configuration for Travis (`#895 <https://github.com/hpcugent/easybuild-easyblocks/pull/895>`_, `#897 <https://github.com/hpcugent/easybuild-easyblocks/pull/897>`_, `#900 <https://github.com/hpcugent/easybuild-easyblocks/pull/900>`_, `#926 <https://github.com/hpcugent/easybuild-easyblocks/pull/926>`_)
* new easyblocks for 4 software packages that require customized support:

  * binutils (`#907 <https://github.com/hpcugent/easybuild-easyblocks/pull/907>`_), libQGLViewer (`#890 <https://github.com/hpcugent/easybuild-easyblocks/pull/890>`_), SuperLU (`#860 <https://github.com/hpcugent/easybuild-easyblocks/pull/860>`_), wxPython (`#883 <https://github.com/hpcugent/easybuild-easyblocks/pull/883>`_)

* various other enhancements, including:

  * update SuiteSparse easyblock for version >= 4.5 (`#863 <https://github.com/hpcugent/easybuild-easyblocks/pull/863>`_)
  * enhance imkl easyblock to install on top of PGI (`#866 <https://github.com/hpcugent/easybuild-easyblocks/pull/866>`_, `#916 <https://github.com/hpcugent/easybuild-easyblocks/pull/916>`_)
  * enable runtime logging of install cmd in ``IntelBase`` (`#874 <https://github.com/hpcugent/easybuild-easyblocks/pull/874>`_)
  * enhance Qt easyblock to support installing with ``dummy`` toolchain (`#881 <https://github.com/hpcugent/easybuild-easyblocks/pull/881>`_)
  * delete libnuma symbolic links in PGI installation directory (`#888 <https://github.com/hpcugent/easybuild-easyblocks/pull/888>`_)
  * enhance PDT easyblock to support installing with ``dummy`` toolchain (`#894 <https://github.com/hpcugent/easybuild-easyblocks/pull/894>`_)
  * add support for building Clang with OpenMP support (`#898 <https://github.com/hpcugent/easybuild-easyblocks/pull/898>`_)
  * update Score-P easyblock for additional compilers, MPI libraries & dependencies (`#889 <https://github.com/hpcugent/easybuild-easyblocks/pull/889>`_)
  * drop deprecated '``testrb``' from sanity check in Ruby easyblock (`#901 <https://github.com/hpcugent/easybuild-easyblocks/pull/901>`_)
  * enhance WRF easyblock to support versions >= 3.7 (`#902 <https://github.com/hpcugent/easybuild-easyblocks/pull/902>`_)
  * update QuantumESPRESSO easyblock for version 5.3.0 (`#904 <https://github.com/hpcugent/easybuild-easyblocks/pull/904>`_)
  * add support in PythonPackage easyblock to use '``setup.py develop``' (`#905 <https://github.com/hpcugent/easybuild-easyblocks/pull/905>`_)
  * update Qt easyblock for Qt 5.6.0 (`#908 <https://github.com/hpcugent/easybuild-easyblocks/pull/908>`_)
  * extend bzip2 easyblock to also build dynamic libraries (`#910 <https://github.com/hpcugent/easybuild-easyblocks/pull/910>`_)
  * make threading an explicit option rather than relying on MPI library in SCOTCH easyblock (`#914 <https://github.com/hpcugent/easybuild-easyblocks/pull/914>`_)
  * update PGI easyblock to install siterc file so PGI picks up ``$LIBRARY_PATH`` (`#919 <https://github.com/hpcugent/easybuild-easyblocks/pull/919>`_)
  * enhance sanity check paths for compiler commands in PGI easyblock (`#919 <https://github.com/hpcugent/easybuild-easyblocks/pull/919>`_)
  * also filter out ``-ldl`` from $LIBBLAS & co for Intel MKL in numpy easyblock (`#920 <https://github.com/hpcugent/easybuild-easyblocks/pull/920>`_)
  * define ``$MIC_LD_LIBRARY_PATH`` for impi (`#925 <https://github.com/hpcugent/easybuild-easyblocks/pull/925>`_)

* various bug fixes, including:

  * don't hardcode Python version in ``test_make_module_pythonpackage`` (`#876 <https://github.com/hpcugent/easybuild-easyblocks/pull/876>`_)
  * make PythonPackage easyblock compatible with ``--module-only`` (`#884 <https://github.com/hpcugent/easybuild-easyblocks/pull/884>`_, `#906 <https://github.com/hpcugent/easybuild-easyblocks/pull/906>`_)
  * remove check whether '``easybuild``' is being imported from dir that contains ``easybuild/__init__.py`` (`#891 <https://github.com/hpcugent/easybuild-easyblocks/pull/891>`_)
  * fix passing compiler configure option in PDT easyblock (`#894 <https://github.com/hpcugent/easybuild-easyblocks/pull/894>`_)
  * fix bug in Score-P easyblock w.r.t. ``--with-libbfd`` (`#889 <https://github.com/hpcugent/easybuild-easyblocks/pull/889>`_)
  * fix extension filter for Ruby (`#901 <https://github.com/hpcugent/easybuild-easyblocks/pull/901>`_)
  * fix ``ACTIVATION_TYPES`` list in IntelBase + minor style change (`#913 <https://github.com/hpcugent/easybuild-easyblocks/pull/913>`_)
  * correctly define ``$MIC_LD_LIBRARY_PATH`` in imkl 11.3.x and newer (`#915 <https://github.com/hpcugent/easybuild-easyblocks/pull/915>`_)
  * fix broken link to VSC website in license headers (`#927 <https://github.com/hpcugent/easybuild-easyblocks/pull/927>`_)

**easyconfigs**

* added example easyconfig files for 69 new software packages:

  * ALPS (`#2888 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2888>`_), annovar (`#3010 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3010>`_), BayeScEnv (`#2765 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2765>`_), BayesAss (`#2870 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2870>`_), BerkeleyGW (`#2925 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2925>`_), Blitz++ (`#2784 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2784>`_, `#3004 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3004>`_), bam-readcount (`#2850 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2850>`_), Commet (`#2938 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2938>`_), CrossTalkZ (`#2939 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2939>`_), cuDNN (`#2882 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2882>`_), DBus (`#2855 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2855>`_), DFT-D3 (`#2107 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2107>`_), DIAL (`#3056 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3056>`_), dask (`#2885 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2885>`_), dbus-glib (`#2855 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2855>`_), FFLAS-FFPACK (`#2793 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2793>`_), FLAC (`#2824 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2824>`_), FLANN (`#3015 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3015>`_, `#3029 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3029>`_), FLEUR (`#3043 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3043>`_), GConf (`#2855 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2855>`_), GROMOS++ (`#1297 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1297>`_), GST-plugins-base (`#2855 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2855>`_), GStreamer (`#2855 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2855>`_), GTOOL (`#2805 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2805>`_), Givaro (`#2793 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2793>`_), gdist (`#2935 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2935>`_), gromosXX (`#1297 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1297>`_), HISAT2 (`#2809 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2809>`_), i-PI (`#2940 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2940>`_), Kraken (`#3037 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3037>`_, `#3041 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3041>`_), LAME (`#2823 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2823>`_), LASTZ (`#3002 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3002>`_), LinBox (`#2793 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2793>`_), Loki (`#2839 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2839>`_), libQGLViewer (`#2923 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2923>`_, `#3008 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3008>`_), libXxf86vm (`#2855 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2855>`_), MDSplus (`#2787 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2787>`_, `#2838 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2838>`_, `#3027 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3027>`_), MRIcron (`#2831 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2831>`_), Mawk (`#2732 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2732>`_), minieigen (`#2839 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2839>`_), mpmath (`#3058 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3058>`_), NBO (`#3047 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3047>`_, 3048), NGS (`#2803 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2803>`_), NGS-Python (`#2810 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2810>`_), ncbi-vdb (`#2808 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2808>`_), OptiX (`#2795 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2795>`_), PCL (`#3024 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3024>`_), PEAR (`#2731 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2731>`_), PLplot (`#2990 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2990>`_), Postgres-XL (`#2891 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2891>`_), PyGTS (`#2969 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2969>`_), RSeQC (`#2788 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2788>`_), Rust (`#2920 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2920>`_, `#2943 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2943>`_), rainbow (`#2730 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2730>`_), SHAPEIT (`#2806 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2806>`_), SIONlib (`#2908 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2908>`_), Saxon-HE (`#2773 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2773>`_), Singularity (`#2901 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2901>`_), SoX (`#2825 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2825>`_), Subread (`#2790 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2790>`_), SuperLU (`#2665 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2665>`_), travis (`#2953 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2953>`_), VASP (`#2950 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2950>`_), Wannier90 (`#2906 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2906>`_, `#3042 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3042>`_), wget (`#3041 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3041>`_), wxPython (`#2855 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2855>`_), xf86vidmodeproto (`#2855 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2855>`_), Yade (`#2839 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2839>`_), Yambo (`#2932 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2932>`_)

* add test configuration for Travis (`#2942 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2942>`_, `#2944 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2944>`_, `#2954 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2954>`_, `#3061 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3061>`_)
* added easyconfigs for new PGI-based toolchains

  * ``pomkl/2016.03`` (`#2899 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2899>`_, `#2900 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2900>`_, `#3046 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3046>`_), ``pomkl/2016.04`` (`#3044 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3044>`_), ``CrayPGI/2016.04`` (`#2927 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2927>`_)

* added new easyconfigs for existing toolchains:

  * ``foss/2016.04`` (`#3013 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3013>`_), ``intel/2016.02-GCC-5.3`` (`#2523 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2523>`_), ``intel/2016.03-GCC-5.3`` (`#3009 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3009>`_)

* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * incl. CGAL 4.8, Clang 3.8.0, icc/ifort 2016.2.181 & 2016.3.210, imkl 11.3.2.181 & 11.3.3.210, impi 5.1.3.181,
    LLVM 3.8.0, OpenCV 2.4.12, pandas 0.18.0, Qt 5.6.0, Scalasca 2.3, Score-P 2.0.1, SuiteSparse 4.5.2, WRF 3.8

* various other enhancements, including:

  * enhance ORCA easyconfig for compatibility with SLURM (`#1819 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1819>`_)
  * enable ``-fPIC`` in GraphicsMagick easyconfig, required by Octave (`#2764 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2764>`_)
  * clean up binutils easyconfigs to use binutils easyblock (`#3006 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3006>`_)
  * add ``include/GraphicsMagick`` to ``$CPATH`` in GraphicsMagick easyconfigs (`#3034 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3034>`_)
  * update SuiteSparse easyconfigs according to updated SuiteSparse easyblock (`#3050 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3050>`_)

* various bug fixes, including:

  * fix Perl extensions download urls (`#2738 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2738>`_)
  * add Autoconf as build dep for ``GCCcore`` (`#2772 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2772>`_)
  * fix versions of extensions in Bioconductor 3.2 bundles (`#2769 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2769>`_)
  * fix (build) deps for ``intel/2016a`` easyconfigs of cairo, libXext, libXrender (`#2785 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2785>`_, `#2874 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2874>`_)
  * use '``env``' wherever preconfig/build/installopts is used to set environmental variables (`#2807 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2807>`_, `#2811 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2811>`_, `#2812 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2812>`_)
  * add zlib as explicit dep in Tk easyconfigs (`#2815 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2815>`_)
  * consistently specify to use ``-fgnu89-inline`` flag in M4 1.4.17 easyconfigs (`#2774 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2774>`_, `#2779 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2779>`_, `#2816 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2816>`_)
  * fix homepage and description in Pygments easyconfigs (`#2822 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2822>`_)
  * include pkg-config as build dependencies for libXau, libXdmcp, libxcb (`#2827 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2827>`_)
  * consistently use ``XORG_*_SOURCE`` constants (`#2829 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2829>`_, `#2830 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2830>`_, `#2848 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2848>`_)
  * update source URLs in ScientificPython easyconfig files (`#2847 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2847>`_)
  * add checksums in SuiteSparse easyconfigs (`#2849 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2849>`_)
  * fix build deps for GObject-Introspection (`#2852 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2852>`_)
  * correctly specify Perl location in git easyconfig (`#2866 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2866>`_)
  * fix bitstring 3.1.3 download URL in Python easyconfigs, source tarball on PyPI disappeared (`#2880 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2880>`_)
  * fix Perl dependency in worker easyconfigs, it requires non-standard Perl modules (`#2884 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2884>`_)
  * add XZ as dependency in Python 3.5.1 easyconfigs, required for lzma (`#2887 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2887>`_)
  * fix download URL for packmol (`#2902 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2902>`_)
  * drop ``usempi`` toolchain in numexpr easyconfigs, not needed (`#2937 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2937>`_)
  * fix use of ``resolve_dependencies`` in tests according to changes in framework (`#2952 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2952>`_)
  * add dependency extensions for MarkupSafe and jsonscheme in IPython 3.2.3 easyconfigs (`#2967 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2967>`_)
  * add patch for matplotlib 1.5.1 to fix Tcl/Tk library paths being used (`#2971 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2971>`_)
  * add xproto build dependency for makedepend v1.0.5 (`#2982 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2982>`_)
  * disable parallel build for Doxygen (`#2986 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2986>`_)
  * fix source URLs for ``FreezeThaw`` and ``Tie::Function`` extensions for Perl v5.22.1 (`#2988 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2988>`_)
  * add ``sed`` command in worker easyconfig files to fix module_path in conf/worker.conf (`#2997 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2997>`_, `#3000 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3000>`_)
  * drop toolchainopts from Eigen easyconfigs, since it is headers-only (`#3025 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3025>`_)
  * clean up dummy bzip2 easyconfig, define buildopts rather than defining ``$CC`` and ``$CFLAGS`` via ``os.environ`` (`#3036 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3036>`_)
  * use ``%(pyshortver)s`` template rather than hardcoding 2.7 in VTK easyconfigs (`#3052 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3052>`_)
  * correct install location of OpenCV Python bindings (`#3054 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3054>`_)
  * include XZ as dependency for libunwind (`#3055 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3055>`_)
  * add patch to fix broken OpenSSL tests due to expired certificates (`#3057 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3057>`_)
  * fix broken link to VSC website in license headers (`#3062 <https://github.com/hpcugent/easybuild-easyconfigs/pull/3062>`_)

.. _release_notes_eb270:

v2.7.0 (March 20th 2016)
------------------------

feature + bugfix release

**framework**

* stabilize Cray support

  * enable '``dynamic``' toolchain option by default for ``Cray*`` toolchains (`#1581 <https://github.com/hpcugent/easybuild-framework/pull/1581>`_)
  * remove FFTW from the Cray toolchains definition (`#1585 <https://github.com/hpcugent/easybuild-framework/pull/1585>`_)
  * add external modules metadata for Cray systems (`#1638 <https://github.com/hpcugent/easybuild-framework/pull/1638>`_)
  * fix independency of Cray toolchains w.r.t. toolchain build environment (`#1641 <https://github.com/hpcugent/easybuild-framework/pull/1641>`_, `#1647 <https://github.com/hpcugent/easybuild-framework/pull/1647>`_)
  * remove requirement to use ``--experimental`` for Cray toolchains (`#1663 <https://github.com/hpcugent/easybuild-framework/pull/1663>`_)

* enable Python optimization mode in '``eb``' (`#1357 <https://github.com/hpcugent/easybuild-framework/pull/1357>`_)
* improved GitHub integration

  * improve error handling on git commands + better logging for ``--new-pr``/``--update-pr`` (`#1590 <https://github.com/hpcugent/easybuild-framework/pull/1590>`_)
  * use ``git`` rather than ``https`` in ``--new-pr``/``--update-pr`` (`#1602 <https://github.com/hpcugent/easybuild-framework/pull/1602>`_)
  * add ``-u`` as shorthand for ``--upload-test-report`` (`#1605 <https://github.com/hpcugent/easybuild-framework/pull/1605>`_)
  * fix ``--from-pr`` for PRs that include renamed/deleted files (`#1615 <https://github.com/hpcugent/easybuild-framework/pull/1615>`_)
  * add support for ``--install-github-token`` and ``--check-github`` (`#1616 <https://github.com/hpcugent/easybuild-framework/pull/1616>`_)
  * fix ``fetch_easyconfigs_from_pr`` w.r.t. duplicate files in PRs (`#1628 <https://github.com/hpcugent/easybuild-framework/pull/1628>`_)

* various other enhancements, including:

  * add support for ``--search-filename`` and ``--terse`` (`#1577 <https://github.com/hpcugent/easybuild-framework/pull/1577>`_)
  * support complete bash completion (`#1580 <https://github.com/hpcugent/easybuild-framework/pull/1580>`_)
  * add support for ``%(*ver)s`` and ``%(*shortver)s`` templates (`#1595 <https://github.com/hpcugent/easybuild-framework/pull/1595>`_, `#1604 <https://github.com/hpcugent/easybuild-framework/pull/1604>`_)

    * incl. ``%(javaver)s``, ``%(javashortver)s``, ``%(perlver)s``, ``%(perlshortver)s``, ``%(pyver)s``, ``%(pyshortver)s``, ``%(rver)s``, ``%(rshortver)s``

  * define ``HOME`` constant that can be used in easyconfig files (`#1607 <https://github.com/hpcugent/easybuild-framework/pull/1607>`_)
  * implement support for generating '``swap``' statements in module files (`#1609 <https://github.com/hpcugent/easybuild-framework/pull/1609>`_)
  * add support for ``--show-config`` (`#1611 <https://github.com/hpcugent/easybuild-framework/pull/1611>`_, `#1620 <https://github.com/hpcugent/easybuild-framework/pull/1620>`_)
  * simplified support for ``--minimal-toolchains`` (`#1614 <https://github.com/hpcugent/easybuild-framework/pull/1614>`_, `#1619 <https://github.com/hpcugent/easybuild-framework/pull/1619>`_, `#1622 <https://github.com/hpcugent/easybuild-framework/pull/1622>`_, `#1625 <https://github.com/hpcugent/easybuild-framework/pull/1625>`_, `#1646 <https://github.com/hpcugent/easybuild-framework/pull/1646>`_)
  * add support for ``--dump-env-script`` (`#1624 <https://github.com/hpcugent/easybuild-framework/pull/1624>`_)
  * enhance ModulesTool.exist to also recognize partial module names (`#1630 <https://github.com/hpcugent/easybuild-framework/pull/1630>`_)
  * improve error message for toolchain definition errors (`#1631 <https://github.com/hpcugent/easybuild-framework/pull/1631>`_)
  * make default is_short_modname_for check less strict to support versionless external modules as deps (`#1632 <https://github.com/hpcugent/easybuild-framework/pull/1632>`_)
  * mention hostname in comment made by ``--upload-test-report`` (`#1635 <https://github.com/hpcugent/easybuild-framework/pull/1635>`_)
  * support providing additional relative path for prefix in external module metadata (`#1637 <https://github.com/hpcugent/easybuild-framework/pull/1637>`_)
  * add ``ThematicModuleNamingScheme`` (`#1645 <https://github.com/hpcugent/easybuild-framework/pull/1645>`_)
  * enhance logging format: remove logger name, mention location instead (`#1649 <https://github.com/hpcugent/easybuild-framework/pull/1649>`_, `#1654 <https://github.com/hpcugent/easybuild-framework/pull/1654>`_)
  * update kernel versions for SLES12 (`#1659 <https://github.com/hpcugent/easybuild-framework/pull/1659>`_)
  * raise ``EasyBuildError`` rather than ``ImportError`` in ``only_if_module_is_available`` decorator (`#1662 <https://github.com/hpcugent/easybuild-framework/pull/1662>`_)

* various bug fixes, including:

  * fix Lmod spider output in generated modules (`#1583 <https://github.com/hpcugent/easybuild-framework/pull/1583>`_)
  * correctly define '``easybuild``' namespaces (`#1593 <https://github.com/hpcugent/easybuild-framework/pull/1593>`_, `#1666 <https://github.com/hpcugent/easybuild-framework/pull/1666>`_, `#1680 <https://github.com/hpcugent/easybuild-framework/pull/1680>`_)

    * this change requires that the ``setuptools`` Python package is available (at runtime)
    * using custom easyblocks by adding them in the Python search path (``$PYTHONPATH``) may require adjustments,
      i.e. also using ``pkg_resources.declare_namespace`` in the ``__init__.py`` files;
      *we highly recommend to use* ``--include-easyblocks`` *instead*,
      see http://easybuild.readthedocs.org/en/latest/Including_additional_Python_modules.html
    * note: this has the side-effect of not being able anymore to reliably use '``eb``' in the parent directory of
      the easybuild-framework repository (`#1667 <https://github.com/hpcugent/easybuild-framework/pull/1667>`_)

  * fix template for ``savannah.gnu.org`` source URL (`#1601 <https://github.com/hpcugent/easybuild-framework/pull/1601>`_)
  * stop running '``module purge``', only restore environment (`#1608 <https://github.com/hpcugent/easybuild-framework/pull/1608>`_)
  * fix license headers: Hercules foundation is now FWO (`#1629 <https://github.com/hpcugent/easybuild-framework/pull/1629>`_)
  * avoid that ``fancylogger`` tries to import ``mpi4py`` to determine MPI rank (`#1648 <https://github.com/hpcugent/easybuild-framework/pull/1648>`_)
  * fix error in tests when '``file``' backend is not available in Python keyring (`#1650 <https://github.com/hpcugent/easybuild-framework/pull/1650>`_)
  * update develop install script (`#1651 <https://github.com/hpcugent/easybuild-framework/pull/1651>`_)
  * handle allowed system deps during ``prepare_step`` rather than during parsing of easyconfig (`#1652 <https://github.com/hpcugent/easybuild-framework/pull/1652>`_)
  * add function to find FlexLM licenses: ``find_flexlm_license`` (`#1633 <https://github.com/hpcugent/easybuild-framework/pull/1633>`_, `#1653 <https://github.com/hpcugent/easybuild-framework/pull/1653>`_)
  * fix availability check for external modules with partial module name (`#1634 <https://github.com/hpcugent/easybuild-framework/pull/1634>`_, `#1643 <https://github.com/hpcugent/easybuild-framework/pull/1643>`_)
  * fix bootstrap script to ensure ``setuptools`` is also installed (`#1655 <https://github.com/hpcugent/easybuild-framework/pull/1655>`_)
  * fix issue in bootstrap script with ``vsc-base`` being picked up from the OS (`#1656 <https://github.com/hpcugent/easybuild-framework/pull/1656>`_)
  * fix bootstrap script for environment where '``python``' is Python 3.x (`#1660 <https://github.com/hpcugent/easybuild-framework/pull/1660>`_)
  * remove ``--experimental`` for tests related to ``--package`` (`#1665 <https://github.com/hpcugent/easybuild-framework/pull/1665>`_)
  * ensure path to setuptools is included in ``$PYTHONPATH`` being used to test scripts (`#1671 <https://github.com/hpcugent/easybuild-framework/pull/1671>`_)
  * sanitize environment before initializing easyblocks (`#1676 <https://github.com/hpcugent/easybuild-framework/pull/1676>`_)
  * remove ``reload`` statements in ``include.py``, since they are not required and break ``--include-toolchains`` (`#1679 <https://github.com/hpcugent/easybuild-framework/pull/1679>`_)


**easyblocks**

* new easyblocks for 6 software packages that require customized support:

  *  ADF (`#826 <https://github.com/hpcugent/easybuild-easyblocks/pull/826>`_), MPICH (`#844 <https://github.com/hpcugent/easybuild-easyblocks/pull/844>`_, `#852 <https://github.com/hpcugent/easybuild-easyblocks/pull/852>`_, `#868 <https://github.com/hpcugent/easybuild-easyblocks/pull/868>`_), mutil (`#859 <https://github.com/hpcugent/easybuild-easyblocks/pull/859>`_), pplacer (`#835 <https://github.com/hpcugent/easybuild-easyblocks/pull/835>`_), psmpi (`#852 <https://github.com/hpcugent/easybuild-easyblocks/pull/852>`_), SNPhylo (`#865 <https://github.com/hpcugent/easybuild-easyblocks/pull/865>`_)

* various other enhancements, including:

  * implement support for '``use_pip``' in PythonPackage easyblock (`#719 <https://github.com/hpcugent/easybuild-easyblocks/pull/719>`_, `#831 <https://github.com/hpcugent/easybuild-easyblocks/pull/831>`_)
  * add support in CUDA easyblock to install wrappers for host compilers (`#758 <https://github.com/hpcugent/easybuild-easyblocks/pull/758>`_)
  * update sanity check for picard version 1.124 and above (`#796 <https://github.com/hpcugent/easybuild-easyblocks/pull/796>`_)
  * use '``module swap``' for all components in ``CrayToolchain`` (`#823 <https://github.com/hpcugent/easybuild-easyblocks/pull/823>`_)
  * update PSI4 easyblock to cope with changed name of PSI4 data dir (`#824 <https://github.com/hpcugent/easybuild-easyblocks/pull/824>`_)
  * use ``find_flexlm_license`` function and avoid defining ``$CPATH`` in PGI easyblock (`#837 <https://github.com/hpcugent/easybuild-easyblocks/pull/837>`_)
  * use ``find_flexlm_license`` function in ``IntelBase`` generic easyblock (`#839 <https://github.com/hpcugent/easybuild-easyblocks/pull/839>`_)
  * add unit test to check module file generated by ``PythonPackage`` easyblock (`#841 <https://github.com/hpcugent/easybuild-easyblocks/pull/841>`_)
  * rework MVAPICH2 easyblock on top of new MPICH easyblock (`#844 <https://github.com/hpcugent/easybuild-easyblocks/pull/844>`_)
  * add CUDA support in CP2K easyblock (`#850 <https://github.com/hpcugent/easybuild-easyblocks/pull/850>`_)
  * also define ``$LD`` in ``buildopts`` for GATE (`#855 <https://github.com/hpcugent/easybuild-easyblocks/pull/855>`_)
  * use ``find_flexlm_license`` function in TotalView easyblock (`#839 <https://github.com/hpcugent/easybuild-easyblocks/pull/839>`_)
  * enhance ``MakeCp`` easyblock to also support renaming of files while copying them (`#859 <https://github.com/hpcugent/easybuild-easyblocks/pull/859>`_)
  * hunt for usable '``python``' command in ``PythonPackage`` easyblock when system Python is used (`#861 <https://github.com/hpcugent/easybuild-easyblocks/pull/861>`_)
  * add sanity check in ``easybuild/__init__.py`` w.r.t. current working dir (`#869 <https://github.com/hpcugent/easybuild-easyblocks/pull/869>`_)
  * change suffix of original file to ``.easybuild`` when using ``fileinput`` in impi easyblock (`#870 <https://github.com/hpcugent/easybuild-easyblocks/pull/870>`_)

* various bug fixes, including:

  * make sure Python unicode settings match that of the system Python (`#817 <https://github.com/hpcugent/easybuild-easyblocks/pull/817>`_)
  * remove FFTW related statements in HPL easyblock, since HPL doesn't require FFTW at all (`#822 <https://github.com/hpcugent/easybuild-easyblocks/pull/822>`_)
  * use ``pkg_resources.declare_namespace`` rather than ``pkgutil.extend_path`` to declare '``easybuild``' namespaces (`#827 <https://github.com/hpcugent/easybuild-easyblocks/pull/827>`_)
  * fix license headers: Hercules foundation is now FWO (`#836 <https://github.com/hpcugent/easybuild-easyblocks/pull/836>`_)
  * fix check for non-empty lib dirs in ``PythonPackage`` easyblock (`#840 <https://github.com/hpcugent/easybuild-easyblocks/pull/840>`_)
  * consider all Python lib dirs in sanity check for libxml2 (`#842 <https://github.com/hpcugent/easybuild-easyblocks/pull/842>`_)
  * correctly handle deprecated configure options (``--with-hwloc``/``--enable-mpe``) in MVAPICH2 easyblock (`#853 <https://github.com/hpcugent/easybuild-easyblocks/pull/853>`_)
  * use correct configure option for checkpoint/restart in MVAPICH2 easyblock (`#854 <https://github.com/hpcugent/easybuild-easyblocks/pull/854>`_)
  * ensure list of Python lib dirs always has a '``lib/...``' entry (`#858 <https://github.com/hpcugent/easybuild-easyblocks/pull/858>`_)
  * check whether ``rpm``/``rpmrebuild`` commands are available using '``which``', rather than checking for OS deps (`#864 <https://github.com/hpcugent/easybuild-easyblocks/pull/864>`_)
  * fix ``test_step`` in UFC easyblock (`#872 <https://github.com/hpcugent/easybuild-easyblocks/pull/872>`_)

**easyconfigs**

* added example easyconfig files for 63 new software packages:

  * ATSAS (`#616 <https://github.com/hpcugent/easybuild-easyconfigs/pull/616>`_, `#2587 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2587>`_), astropy (`#2724 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2724>`_, `#2727 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2727>`_), attr (`#2706 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2706>`_), BamUtil (`#2654 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2654>`_), BBMap (`#2322 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2322>`_), BH (`#2508 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2508>`_),
    CheMPS2 (`#2445 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2445>`_), CosmoloPy (`#2723 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2723>`_, `#2727 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2727>`_), csvkit (`#2639 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2639>`_), Firefox (`#2648 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2648>`_), FreeXL (`#2422 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2422>`_), GL2PS (`#2667 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2667>`_),
    Glade (`#2631 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2631>`_), htop (`#2538 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2538>`_), IGV (`#2019 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2019>`_), IGVTools (`#2019 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2019>`_), ImageMagick (`#2438 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2438>`_), jModelTest (`#2529 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2529>`_),
    KEALib (`#2420 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2420>`_), libcerf (`#2656 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2656>`_), libgcrypt (`#2201 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2201>`_), libglade (`#2631 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2631>`_), libgpg-error (`#2201 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2201>`_), libspatialite (`#2431 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2431>`_),
    LittleCMS (`#2438 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2438>`_), MAST (`#2542 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2542>`_), MLC (`#2577 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2577>`_), MPJ-Express (`#2529 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2529>`_), mutil (`#2201 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2201>`_), neon (`#758 <https://github.com/hpcugent/easybuild-easyconfigs/pull/758>`_), NextClip (`#2544 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2544>`_),
    npstat (`#2686 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2686>`_, `#2703 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2703>`_), Octopus (`#2643 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2643>`_), QuickFF (`#2721 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2721>`_), p4vasp (`#2328 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2328>`_), PCMSolver (`#2445 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2445>`_), PFFT (`#2643 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2643>`_),
    PHYLIP (`#2694 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2694>`_), pkgconfig (`#2475 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2475>`_, `#2476 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2476>`_), Platypus (`#2618 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2618>`_), pplacer (`#1056 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1056>`_), PRINSEQ (`#2437 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2437>`_, `#2444 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2444>`_, `#2585 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2585>`_),
    PyFFmpeg (`#2501 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2501>`_, `#2519 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2519>`_), PyGObject (`#2443 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2443>`_), PyGTK (`#2443 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2443>`_), PyOpenGL (`#2628 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2628>`_), pyringe (`#2533 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2533>`_), qrupdate (`#2675 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2675>`_),
    rgeos (`#2635 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2635>`_), rpmrebuild (`#2402 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2402>`_), shift (`#2201 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2201>`_), SNAPE-pooled (`#2688 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2688>`_), SNPhylo (`#2701 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2701>`_), sratoolkit (`#2715 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2715>`_),
    STAR-Fusion (`#2463 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2463>`_), statsmodels (`#2719 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2719>`_), StringTie (`#2527 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2527>`_), synchronicity (`#2508 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2508>`_), testpath (`#2461 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2461>`_),
    USEARCH (`#2537 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2537>`_), VarScan (`#2464 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2464>`_), vsc-install (`#2165 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2165>`_), Whoosh (`#2725 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2725>`_), xprop (`#2645 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2645>`_)

* added new easyconfigs for existing toolchains:

  * ``intel/2016.02-GCC-4.9`` (`#2620 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2620>`_), ``gmpolf/2016a`` & ``gmvolf/2016a`` (`#2589 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2589>`_)

* stable Cray-specific easyconfigs

  * delete deprecated Cray toolchains and easyconfig files (`#2400 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2400>`_)
  * don't hardcode ``PrgEnv`` version, remove ``craype`` and ``fftw`` components in Cray toolchains (`#2554 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2554>`_)
  * remove ``-XC`` versionsuffix for stable definitions for ``Cray*`` toolchains (`#2714 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2714>`_)
  * support for various software packages with ``CrayGNU`` and ``CrayIntel`` toolchains: CP2K, GROMACS, WRF

* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * including BWA 0.7.13, CMake 3.4.3, GATE 7.2, GROMACS 5.1.2, Mesa 11.1.2, netCDF 4.4.0, Perl 5.22.1, Python 3.5.1,
    R 3.2.3, R-bundle-Bioconductor 3.2, scipy 0.17.0, SuiteSparse 4.5.1

* various other enhancements, including:

  * copy ``contrib`` dir in Velvet easyconfigs so scripts are also available (`#2456 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2456>`_)
  * redefine matplotlib 1.5.1 easyconfig as a bundle, also include ``cycler`` extension (dep for matplotlib) (`#2470 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2470>`_)
  * add bitstring extension to Python 2.7.11 easyconfigs (`#2471 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2471>`_)
  * enable building of MetaVelvet in Velvet 1.2.10 easyconfigs (`#2473 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2473>`_)
  * add custom sanity check for libjpeg-turbo (`#2480 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2480>`_)
  * add Velvet easyconfigs that include BioPerl dependency, so VelvetOptimizer can use it (`#2495 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2495>`_, `#2729 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2729>`_, `#2733 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2733>`_)
  * add source URL in RAxML 7.2.6 easyconfigs (`#2536 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2536>`_)
  * update MPICH easyconfigs to use new MPICH easyblock (`#2589 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2589>`_)
  * free libX11 & co from unneeded Python dependency/versionsuffix (`#2549 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2549>`_, `#2563 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2563>`_, `#2605 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2605>`_, `#2664 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2664>`_)
  * add '``--enable-utf --enable-unicode-properties``' configure options in PCRE easyconfigs (`#2561 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2561>`_)
    * required for latest R versions
  * add HCsnip, metagenomeSeq in Bioconductor 3.1 bundles (`#2553 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2553>`_, `#2578 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2578>`_)
  * add additional extensions in R 3.2.x easyconfigs that are required for extra Bioconductor extensions (`#2547 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2547>`_, `#2556 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2556>`_)
  * update psmpi easyconfig files to use the new psmpi easyblock (`#2619 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2619>`_)
  * add easyconfig for Python 2.7.11 on top of X11-enabled Tk (`#2614 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2614>`_, `#2621 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2621>`_)
  * add virtualenv as extension in Python 2.7.11 easyconfigs (`#2660 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2660>`_)

* various bug fixes, including:

  * fix software name for GTK+ (was 'gtk+'), PyCairo (was 'pycairo') and Gdk-Pixbuf (was 'gdk-pixbuf') (`#2468 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2468>`_)
  * don't hardcode ``CC``/``CXX`` in OpenMPI easyconfigs (`#2472 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2472>`_)
  * remove Google Code source URL for mpi4py (`#2474 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2474>`_)
  * rename ffmpeg to FFmpeg (`#2425 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2425>`_, `#2481 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2481>`_)
  * use available easyblock for flex (`#2486 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2486>`_)
  * fix determining list of easyconfigs in unit test suite, don't assume locations are correct (`#2530 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2530>`_)
  * fix specifying DB dependency in DB_File easyconfigs (`#2539 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2539>`_)
  * remove hard-coded ``-xSSE4.2`` for numpy/scipy with Intel compilers (`#2546 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2546>`_)
  * fix license headers: Hercules foundation is now FWO (`#2550 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2550>`_)
  * add ``--with-zlib`` configure argument in libxml easyconfigs (`#2555 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2555>`_)
  * don't hardcode ``optarch=True`` in xextproto/xtrans easyconfigs (`#2601 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2601>`_)
  * change toolchain version to '' in easyconfigs that use ``dummy`` toolchain and include dependencies (`#2612 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2612>`_)
  * GLib doesn't require libxml2 with Python bindings (`#2632 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2632>`_)
  * add patch file to imkl 10.2.6.038 32-bit easyconfig to fix installer not being able to deal with '``--``' in build path (`#2634 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2634>`_)
  * add missing 'pkgconfig' dependency for h5py (`#2476 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2476>`_, `#2650 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2650>`_)
  * correct software name in FastQC easyconfigs (was 'fastqc'), use '``dummy``' toolchain for all FastQC version (`#2657 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2657>`_, `#2666 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2666>`_)
  * add missing libxml2 dependencies in GLib easyconfigs (`#2658 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2658>`_)
  * fix Xerces-C++ download location (`#2668 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2668>`_)
  * enable ``XML::Bare`` extension in all Perl easyconfigs (`#2672 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2672>`_)
  * update dead link for SuiteSparse (`#2679 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2679>`_)
  * remove custom ``exts_filter`` in easyconfigs used ``PythonPackage`` easyblock (`#2683 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2683>`_, `#2685 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2685>`_)
  * add M4 as build dep for binutils & flex (`#2681 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2681>`_)
  * add missing dependencies in Python 3.5.x easyconfigs: SQLite, Tk, GMP (`#2704 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2704>`_)
  * fix (OS) deps, add checksums, remove parameter definition with default values in MVAPICH2 easyconfigs (`#2707 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2707>`_)

* style cleanup in various easyconfigs (`#2378 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2378>`_, `#2387 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2387>`_, `#2395 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2395>`_, `#2396 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2396>`_, `#2488 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2488>`_-`#2493 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2493>`_, `#2496 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2496>`_-`#2500 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2500>`_, `#2502 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2502>`_-`#2504 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2504>`_, `#2602 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2602>`_)

  * working towards automated style review of pull requests

.. _release_notes_eb260:

v2.6.0 (January 26th 2016)
--------------------------

feature + bugfix release

**framework**

* add (experimental) support for opening/updating (easyconfigs) pull requests (``--new-pr``, ``--update-pr``) (`#1528 <https://github.com/hpcugent/easybuild-framework/pull/1528>`_)
* sanitize environment before each installation by undefining ``$PYTHON*`` (`#1569 <https://github.com/hpcugent/easybuild-framework/pull/1569>`_, `#1572 <https://github.com/hpcugent/easybuild-framework/pull/1572>`_)
* various other enhancements, including:

  * allow user-local modules with hierarchical naming schemes (``--subdir-user-modules``) (`#1472 <https://github.com/hpcugent/easybuild-framework/pull/1472>`_)
  * enhance ``--extended-dry-run`` output to include paths for requirements in ``make_module_req`` (`#1520 <https://github.com/hpcugent/easybuild-framework/pull/1520>`_)
  * rewrite read_file to use '``with``' (`#1534 <https://github.com/hpcugent/easybuild-framework/pull/1534>`_)
  * add support for ``eb --last-log`` (`#1541 <https://github.com/hpcugent/easybuild-framework/pull/1541>`_)
  * support using fixed install dir scheme (``--fixed-installdir-naming-scheme``) (`#1546 <https://github.com/hpcugent/easybuild-framework/pull/1546>`_)
  * add edge attributes for build dependencies in ``--dep-graph`` output (`#1548 <https://github.com/hpcugent/easybuild-framework/pull/1548>`_)
  * check whether dependencies marked as external module are hidden (`#1552 <https://github.com/hpcugent/easybuild-framework/pull/1552>`_)
  * implement support for ``--modules-header`` (`#1558 <https://github.com/hpcugent/easybuild-framework/pull/1558>`_)
  * add support to specify '``else``' body for conditional statements in modules (`#1559 <https://github.com/hpcugent/easybuild-framework/pull/1559>`_)
  * add extra test for ``--include-easyblocks`` for generic easyblocks (`#1562 <https://github.com/hpcugent/easybuild-framework/pull/1562>`_)
  * allow user to define the default compiler optimization level (``--default-opt-level``) (`#1565 <https://github.com/hpcugent/easybuild-framework/pull/1565>`_)
  * make ``toolchain.get_variable`` more robust w.r.t. dummy toolchain (`#1566 <https://github.com/hpcugent/easybuild-framework/pull/1566>`_)

* various bug fixes, including:

  * fix missing '``yaml``' module check in tests (`#1525 <https://github.com/hpcugent/easybuild-framework/pull/1525>`_)
  * fix 'develop' install script (`#1529 <https://github.com/hpcugent/easybuild-framework/pull/1529>`_)
  * correctly quote FPM option values in packagin support (`#1530 <https://github.com/hpcugent/easybuild-framework/pull/1530>`_)
  * correctly handle '``.``' in software name w.r.t. ``$EB*`` environment variables (`#1538 <https://github.com/hpcugent/easybuild-framework/pull/1538>`_)
  * exclude logs and test reports from packages (`#1544 <https://github.com/hpcugent/easybuild-framework/pull/1544>`_)
  * also pass down ``--job-cores`` for ``pbs_python`` job backend (`#1547 <https://github.com/hpcugent/easybuild-framework/pull/1547>`_)
  * skip dependencies marked as external modules when packaging (`#1550 <https://github.com/hpcugent/easybuild-framework/pull/1550>`_)
  * fix syntax for ``set_alias`` statement in Lua syntax (`#1554 <https://github.com/hpcugent/easybuild-framework/pull/1554>`_)
  * handle the case of all 'offline' nodes correctly for ``--job`` (`#1560 <https://github.com/hpcugent/easybuild-framework/pull/1560>`_)
  * fix ``test_modules_tool_stateless`` unit test for stateless ModulesTool with Lmod as modules tool (`#1570 <https://github.com/hpcugent/easybuild-framework/pull/1570>`_)

**easyblocks**

* add generic easyblock for Cray toolchains (`#766 <https://github.com/hpcugent/easybuild-easyblocks/pull/766>`_)
* new easyblocks for 2 software packages that require customized support:

  * EggLib (`#811 <https://github.com/hpcugent/easybuild-easyblocks/pull/811>`_), PGI (`#658 <https://github.com/hpcugent/easybuild-easyblocks/pull/658>`_)

* various other enhancements, including:

  * update BamTools easyblock for versions 2.3.x and newer: some shared libraries are now static) (`#785 <https://github.com/hpcugent/easybuild-easyblocks/pull/785>`_)
  * don't hardcode ``.so``, use ``get_shared_lib_ext`` instead (`#789 <https://github.com/hpcugent/easybuild-easyblocks/pull/789>`_, `#790 <https://github.com/hpcugent/easybuild-easyblocks/pull/790>`_, `#791 <https://github.com/hpcugent/easybuild-easyblocks/pull/791>`_, `#793 <https://github.com/hpcugent/easybuild-easyblocks/pull/793>`_, `#794 <https://github.com/hpcugent/easybuild-easyblocks/pull/794>`_, `#803 <https://github.com/hpcugent/easybuild-easyblocks/pull/803>`_, `#815 <https://github.com/hpcugent/easybuild-easyblocks/pull/815>`_)
  * enhance CPLEX easyblock by adding more subdirs to ``$PATH``, define ``$LD_LIBRARY`` and ``$CPLEXDIR`` (`#797 <https://github.com/hpcugent/easybuild-easyblocks/pull/797>`_)
  * make sanity check for netcdf4-python work with both egg and non-egg installs (`#799 <https://github.com/hpcugent/easybuild-easyblocks/pull/799>`_)
  * update sanity check in PETSc/SLEPc easyblocks for v3.6.x (`#800 <https://github.com/hpcugent/easybuild-easyblocks/pull/800>`_)
  * update Trinity easyblock for 2.x versions (`#802 <https://github.com/hpcugent/easybuild-easyblocks/pull/802>`_)
  * update DOLFIN easyblock for v1.6.0 (`#804 <https://github.com/hpcugent/easybuild-easyblocks/pull/804>`_)
  * check for ``libkokkoscore.a`` rather than ``libkokkos.a`` for Trilinos 12.x (`#805 <https://github.com/hpcugent/easybuild-easyblocks/pull/805>`_)
  * add an option to skip the sanitizer tests of Clang (`#806 <https://github.com/hpcugent/easybuild-easyblocks/pull/806>`_)
  * update Molpro easyblock to support binary installs and 2015 version (`#807 <https://github.com/hpcugent/easybuild-easyblocks/pull/807>`_)
  * make ``ConfigureMake`` more robust w.r.t. custom easyconfig parameters (`#810 <https://github.com/hpcugent/easybuild-easyblocks/pull/810>`_)

* various bug fixes, including:

  * add back support for Eigen 2.x in Eigen easyblock (`#798 <https://github.com/hpcugent/easybuild-easyblocks/pull/798>`_)
  * fix for vsc-base being picked up from OS in EasyBuildMeta easyblock (`#813 <https://github.com/hpcugent/easybuild-easyblocks/pull/813>`_)
  * remove ``setuptools.pth`` if it includes absolute paths after installing EasyBuild (`#813 <https://github.com/hpcugent/easybuild-easyblocks/pull/813>`_)

**easyconfigs**

* add easyconfigs for ``foss/2016a`` and ``intel/2016`` common toolchains (`#2310 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2310>`_, `#2311 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2311>`_, `#2339 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2339>`_, `#2363 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2363>`_)

  * incl. easyconfigs for Boost, CMake, Python, Perl using these toolchains

* added example easyconfig files for 21 new software packages:

  * BLASR (`#922 <https://github.com/hpcugent/easybuild-easyconfigs/pull/922>`_), BioKanga (`#2247 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2247>`_), BoltzTraP (`#2365 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2365>`_), basemap (`#2221 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2221>`_), CppUnit (`#2271 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2271>`_), EggLib (`#2335 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2335>`_), FLASH (`#2281 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2281>`_), GLM (`#2288 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2288>`_), hub (`#2249 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2249>`_), MACS2 (`#1983 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1983>`_), MotEvo (`#843 <https://github.com/hpcugent/easybuild-easyconfigs/pull/843>`_), numba (`#2243 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2243>`_), PGI (`#1833 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1833>`_, `#2367 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2367>`_), PLY (`#2305 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2305>`_), PaStiX (`#2319 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2319>`_, `#2326 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2326>`_), patchelf (`#2327 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2327>`_), pip (`#2284 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2284>`_), RSEM (`#2316 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2316>`_), RcppArmadillo (`#2289 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2289>`_), SCDE (`#2289 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2289>`_), slepc4py (`#2318 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2318>`_)
* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * including BamTools 2.4.0, Boost 1.60.0, Clang 3.7.1, DOLFIN/FFC/FIAT/Instant/UFL 1.6.0, GATE 7.0, GCC 5.3.0, LLVM 3.7.1, pandas 0.17.1, PETSc 3.6.3, SAMtools 1.3, scipy 0.16.1, SLEPc 3.6.2, Trilinos 12.4.2, Trinity 2.1.1, VTK 6.3.0

* various other enhancements, including:

  * added new ``Cray*`` toolchain versions with pinned dependency versions (`#2222 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2222>`_)
  * don't hardcode ``.so``, use ``SHLIB_EXT`` constant instead (`#2245 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2245>`_)
  * add custom sanity check in GEOS easyconfigs (`#2285 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2285>`_)

* various bug fixes, including:

  * add Autotools (M4) as a build dependency in GMP v6.x easyconfigs (`#2096 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2096>`_)
  * remove argparse from list of extensions in Python 3.2+ easyconfigs, since it became part of stdlib (`#2323 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2323>`_)

* various style fixes, including:

  * get rid of tabs (`#2302 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2302>`_)
  * remove trailing whitespace (`#2341 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2341>`_)

.. _release_notes_eb250:

v2.5.0 (December 17th 2015)
---------------------------

feature + bugfix release

**framework**

* add support for IBM XL compilers on Power7 and PowerPC (BlueGene) (`#1470 <https://github.com/hpcugent/easybuild-framework/pull/1470>`_)
* add support fo generic compilation using ``--optarch=GENERIC`` (`#1471 <https://github.com/hpcugent/easybuild-framework/pull/1471>`_)

  * see also :ref:`controlling_compiler_optimization_flags`

* update experimental support for ``.yeb`` easyconfigs (`#1515 <https://github.com/hpcugent/easybuild-framework/pull/1515>`_)

  * support clean way to specify toolchain + dependencies in ``.yeb`` easyconfigs

* various other enhancements, including:

  * add support for '``whatis``' easyconfig parameter (`#1271 <https://github.com/hpcugent/easybuild-framework/pull/1271>`_)
  * add support for SLES 12 and kernel 3.12.x (`#1412 <https://github.com/hpcugent/easybuild-framework/pull/1412>`_)
  * add GCCcore toolchain definition (`#1451 <https://github.com/hpcugent/easybuild-framework/pull/1451>`_)
  * use '``diff --git``' lines to determine patched files in pull request with ``--from-pr`` (`#1460 <https://github.com/hpcugent/easybuild-framework/pull/1460>`_)
  * add proper option parser to bootstrap script (`#1468 <https://github.com/hpcugent/easybuild-framework/pull/1468>`_)
  * add ``get_gcc_version()`` function in systemtools module (`#1496 <https://github.com/hpcugent/easybuild-framework/pull/1496>`_)
  * don't load fake module in sanity_check_step during a dry run (`#1499 <https://github.com/hpcugent/easybuild-framework/pull/1499>`_)
  * allow string values to be passed in ``make_module_req`` by hoisting them into a list (`#1502 <https://github.com/hpcugent/easybuild-framework/pull/1502>`_)
  * add support for listing build dependencies as hidden dependencies (`#1503 <https://github.com/hpcugent/easybuild-framework/pull/1503>`_)
  * also consider ``lib32/pkgconfig`` and ``lib64/pkgconfig`` for ``$PKG_CONFIG_PATH`` (`#1505 <https://github.com/hpcugent/easybuild-framework/pull/1505>`_)
  * add support to ``make_module_dep`` to specify module to unload before loading a dependency module (`#1506 <https://github.com/hpcugent/easybuild-framework/pull/1506>`_)
  * add support to ``make_module_extra`` to specify alternative root/version for ``$EBROOT``/``$EBVERSION`` (`#1508 <https://github.com/hpcugent/easybuild-framework/pull/1508>`_)
  * packaging support is no longer considered experimental (`#1510 <https://github.com/hpcugent/easybuild-framework/pull/1510>`_)

* various bug fixes, including:

  * also consider ``lib64`` in sanity check performed during EasyBuild bootstrap (`#1464 <https://github.com/hpcugent/easybuild-framework/pull/1464>`_)
  * also add description/homepage to packages created with FPM (`#1469 <https://github.com/hpcugent/easybuild-framework/pull/1469>`_)
  * fix develop setup script to install EasyBuild-develop module in subdirectory (`#1480 <https://github.com/hpcugent/easybuild-framework/pull/1480>`_)
  * don't create a whole set of temporary '``minimal-easyconfigs``' subdirs with ``--minimal-toolchains`` (`#1484 <https://github.com/hpcugent/easybuild-framework/pull/1484>`_)
  * only keep polling if exit code is ``None`` in ``run_cmd_qa``, to correctly deal with negative exit codes (`#1486 <https://github.com/hpcugent/easybuild-framework/pull/1486>`_)
  * fix bootstrap script for missing sys_platform by using newer distribute 0.6.49 in stage 0 (`#1490 <https://github.com/hpcugent/easybuild-framework/pull/1490>`_)
  * make sure that extra custom easyconfig parameters are known for extensions (`#1498 <https://github.com/hpcugent/easybuild-framework/pull/1498>`_)
  * add missing import for ``EasyBuildError`` in ``easybuild/toolchains/linalg/libsci.py`` (`#1512 <https://github.com/hpcugent/easybuild-framework/pull/1512>`_)
  * isolate tests from possible system-wide configuration files (`#1513 <https://github.com/hpcugent/easybuild-framework/pull/1513>`_)
  * only use ``glob`` in ``make_module_req`` on non-empty strings (`#1519 <https://github.com/hpcugent/easybuild-framework/pull/1519>`_)
    * this fixes the problem where ``$CUDA_HOME`` and ``$CUDA_PATH`` are not defined in module files for CUDA

**easyblocks**

* update easyblocks for Intel tools to support 2016 versions (`#691 <https://github.com/hpcugent/easybuild-easyblocks/pull/691>`_, `#745 <https://github.com/hpcugent/easybuild-easyblocks/pull/745>`_, `#756 <https://github.com/hpcugent/easybuild-easyblocks/pull/756>`_, `#777 <https://github.com/hpcugent/easybuild-easyblocks/pull/777>`_)

  * IntelBase easyblock has been enhanced to support specifying which components to install

* new easyblocks for 3 software packages that require customized support:

  * Intel Advisor (`#767 <https://github.com/hpcugent/easybuild-easyblocks/pull/767>`_), DIRAC (`#778 <https://github.com/hpcugent/easybuild-easyblocks/pull/778>`_), MRtrix (`#772 <https://github.com/hpcugent/easybuild-easyblocks/pull/772>`_)

* various other enhancements, including:

  * update numpy and SuiteSparse easyblock to use scikit-umfpack (`#718 <https://github.com/hpcugent/easybuild-easyblocks/pull/718>`_)
  * add an option to allow removal of the ``-Dusethreads`` flag in Perl easyblock (`#724 <https://github.com/hpcugent/easybuild-easyblocks/pull/724>`_)
  * update Doxygen easyblock for 1.10.x (CMake) (`#734 <https://github.com/hpcugent/easybuild-easyblocks/pull/734>`_)
  * update sanity check in Qt easyblock for Qt 5.x (`#740 <https://github.com/hpcugent/easybuild-easyblocks/pull/740>`_)
  * add support for multilib build of GCC on PowerPC (`#741 <https://github.com/hpcugent/easybuild-easyblocks/pull/741>`_)
  * add support to OpenFOAM and SCOTCH easyblocks to support 64-bit integers, via 'i8' toolchain option (`#744 <https://github.com/hpcugent/easybuild-easyblocks/pull/744>`_)
  * fix sanity check to support numpy 1.10 (dropped _dotblas.so) (`#757 <https://github.com/hpcugent/easybuild-easyblocks/pull/757>`_, `#761 <https://github.com/hpcugent/easybuild-easyblocks/pull/761>`_, `#762 <https://github.com/hpcugent/easybuild-easyblocks/pull/762>`_)
  * update IPP easyblock for v9.x (`#759 <https://github.com/hpcugent/easybuild-easyblocks/pull/759>`_)
  * cleaner output for PythonPackage under dry run, make numpy easyblock dry-run aware (`#760 <https://github.com/hpcugent/easybuild-easyblocks/pull/760>`_, `#671 <https://github.com/hpcugent/easybuild-easyblocks/pull/671>`_)
  * add support for using netCDF-Fortran as dependency in ALADIN easyblock (`#764 <https://github.com/hpcugent/easybuild-easyblocks/pull/764>`_)
  * add support for tbb 4.4.x in tbb easyblock (`#769 <https://github.com/hpcugent/easybuild-easyblocks/pull/769>`_)
  * add support for specifying altroot/altversion in Bundle easyblock (`#773 <https://github.com/hpcugent/easybuild-easyblocks/pull/773>`_)
  * update OpenFOAM easyblock for OpenFOAM-Extend 3.2 + use apply_regex_substitutions (`#770 <https://github.com/hpcugent/easybuild-easyblocks/pull/770>`_)

* various bug fixes, including:

  * fix module path extension of system compiler in HMNS setup (`#742 <https://github.com/hpcugent/easybuild-easyblocks/pull/742>`_)
  * only restore ``$PYTHONPATH`` if it was defined in EasyBuildMeta easyblock (`#743 <https://github.com/hpcugent/easybuild-easyblocks/pull/743>`_)
  * make sure ``$PYTHONPATH`` is defined correctly in module file for Python packages created with ``--module-only`` (`#748 <https://github.com/hpcugent/easybuild-easyblocks/pull/748>`_)
  * fix WRF easyblock to produce correct module under ``--module-only --force`` (`#746 <https://github.com/hpcugent/easybuild-easyblocks/pull/746>`_, `#752 <https://github.com/hpcugent/easybuild-easyblocks/pull/752>`_)
  * don't hardcode '``openPBS``' in GATE easyblock, use value for ``default_platform`` easyconfig parameter (`#753 <https://github.com/hpcugent/easybuild-easyblocks/pull/753>`_)
  * avoid adding lib subdirs to ``$*LIBRARY_PATH`` if no libraries are there in ``PythonPackage`` easyblock (`#755 <https://github.com/hpcugent/easybuild-easyblocks/pull/755>`_)
  * fix installing Python bindings for libxml2 to correct installation prefix (`#765 <https://github.com/hpcugent/easybuild-easyblocks/pull/765>`_)

**easyconfigs**

* add GCCcore easyconfig that can be used as base for all compilers (without getting in the way) (`#2214 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2214>`_)

  * along with easyconfig for ``GCC/4.9.3-2.25``: bundle of GCCcore 4.9.3 and binutils 2.25
  * intended to replace the GNU toolchain

* added example easyconfig files for 39 new software packages:

  * DIRAC (`#2212 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2212>`_), GeoIP (`#2172 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2172>`_, `#2185 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2185>`_), GeoIP-C (`#2172 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2172>`_, `#2185 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2185>`_), graph-tool (`#1591 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1591>`_), gtkglext (`#2217 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2217>`_), Intel Advisor (`#2210 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2210>`_), InterProScan (`#2225 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2225>`_, `#2227 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2227>`_, `#2234 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2234>`_), intltool (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), kallisto (`#2173 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2173>`_), LibUUID (`#1930 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1930>`_), LuaJIT (`#2153 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2153>`_), libXcursor (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), libXrandr (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), libXtst (`#2143 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2143>`_), libdap (`#1930 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1930>`_), libtasn1 (`#2208 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2208>`_), libxkbcommon (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), MRtrix (`#2217 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2217>`_, `#2218 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2218>`_), MultiNest (`#2166 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2166>`_, `#2168 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2168>`_), Nipype (`#2150 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2150>`_), PPfold (`#2183 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2183>`_, `#2187 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2187>`_), p11-kit (`#2208 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2208>`_), pangox-compat (`#2217 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2217>`_), Qt5 (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), randrproto (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), rhdf5 (`#2175 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2175>`_), Stampy (`#2180 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2180>`_, `#2182 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2182>`_), scikit-umfpack (`#2061 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2061>`_), scp (Python pkg) (`#2196 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2196>`_), sleuth (`#2175 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2175>`_), traits (`#2150 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2150>`_), vincent (`#2169 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2169>`_, `#2185 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2185>`_), XKeyboardConfig (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), xcb-util (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), xcb-util-image (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), xcb-util-keysyms (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), xcb-util-renderutil (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), xcb-util-wm (`#2136 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2136>`_), zlibbioc (`#2175 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2175>`_)

* added new easyconfigs for existing toolchains:
    ``intel/2015.08`` (`#2194 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2194>`_), ``intel/2016.00`` (`#2209 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2209>`_), ``intel/2016.01`` (`#2219 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2219>`_), ``iomkl/2015.03`` (`#2155 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2155>`_)

* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * including CMake 3.4.1, HDF5 1.8.16, netCDF 4.3.3.1, netCDF-Fortran 4.4.2, numpy 1.10.1, Octave 4.0.0,
    OpenFOAM 3.0.0, OpenFOAM-Extend 3.2, Python 2.7.11

* various other enhancements, including:

  * add tidyr to R 3.2.1 easyconfigs (`#2174 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2174>`_)
  * enable C++ support in MIGRATE-N (`#2178 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2178>`_)
  * also installed shared libraries for AMD and UMFPACK in SuiteSparse (`#2061 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2061>`_)
  * fix software name for ParaView (was: Paraview) (`#2132 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2132>`_)
  * enable building of shared libraries for binutils (`#2133 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2133>`_)
  * harden binutils built with dummy toolchain by linking to system libraries via ``RPATH`` (`#2228 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2228>`_)
  * enhance easyconfig unit tests to check that each easyconfig file is in the right subdirectory (`#2232 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2232>`_)

* various bug fixes, including:

  * fix ALADIN patch file to not use relative paths, and adjust list of ALADIN sources accordingly ((`#2207 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2207>`_), (`#2213 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2213>`_))
  * rename patch files for OpenFOAM to be in line with other patches (`#2226 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2226>`_)
  * fix typo in bzip2 source URLs (`#2204 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2204>`_)
  * force linking of ncurses in libreadline (`#2206 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2206>`_)
  * enable ``-fPIC`` in all zlib 1.2.8 easyconfigs (`#2220 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2220>`_)
  * move Net-LibIDN/SRA-Toolkit/bbftpPRO/o2scl easyconfigs to right location (`#2232 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2232>`_)
  * restrict parallel build in OpenFOAM-Extend easyconfigs via '``maxparallel``', not '``parallel``' (`#2233 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2233>`_)


.. _release_notes_eb240:

v2.4.0 (November 10th 2015)
---------------------------

feature + bugfix release

**framework**

* add support for ``--extended-dry-run``/``-x`` (`#1388 <https://github.com/hpcugent/easybuild-framework/pull/1388>`_, `#1450 <https://github.com/hpcugent/easybuild-framework/pull/1450>`_, `#1453 <https://github.com/hpcugent/easybuild-framework/pull/1453>`_, `#1455 <https://github.com/hpcugent/easybuild-framework/pull/1455>`_)

  * detailed documentation is available at :ref:`extended_dry_run`

* fix checking of sanity check paths w.r.t. discriminating between files and directories (`#1436 <https://github.com/hpcugent/easybuild-framework/pull/1436>`_)

  * this impacts several easyconfig files where ``sanity_check_paths`` was not 100% correct

* make '``eb``' script aware of Python v3.x, fall back to using ``python2`` if required (`#1411 <https://github.com/hpcugent/easybuild-framework/pull/1411>`_)
* add experimental support for parsing .yeb easyconfig files in YAML syntax (`#1447 <https://github.com/hpcugent/easybuild-framework/pull/1447>`_, `#1448 <https://github.com/hpcugent/easybuild-framework/pull/1448>`_, `#1449 <https://github.com/hpcugent/easybuild-framework/pull/1449>`_)

  * see also :ref:`easyconfig_yeb_format`

* add experimental support for resolving dependencies with minimal toolchains (`#1306 <https://github.com/hpcugent/easybuild-framework/pull/1306>`_)

  * see also :ref:`minimal_toolchains`

* various other enhancements, including:

  * refactor ``extract_cmd`` function to get rid of if/elif/else spaghetti blob (`#1382 <https://github.com/hpcugent/easybuild-framework/pull/1382>`_)
  * add support for ``--review-pr`` (`#1383 <https://github.com/hpcugent/easybuild-framework/pull/1383>`_)
  * add ``apply_regex_substitutions`` function to perform runtime patching from easyblocks (`#1388 <https://github.com/hpcugent/easybuild-framework/pull/1388>`_, `#1458 <https://github.com/hpcugent/easybuild-framework/pull/1458>`_)
  * add support for specifying alternate name to be part of generated module name (`#1389 <https://github.com/hpcugent/easybuild-framework/pull/1389>`_)
    * via '``modaltsoftname``' easyconfig parameter
  * support overriding # used cores via ``--parallel`` (`#1393 <https://github.com/hpcugent/easybuild-framework/pull/1393>`_)
  * also define ``$FC`` and ``$FCFLAGS`` in build environment (`#1394 <https://github.com/hpcugent/easybuild-framework/pull/1394>`_)
  * add support extracting for ``.tar.Z`` files (`#1396 <https://github.com/hpcugent/easybuild-framework/pull/1396>`_)
  * include easybuild/scripts in instalation (`#1397 <https://github.com/hpcugent/easybuild-framework/pull/1397>`_)
  * ignore hidden directories in find_base_dir (`#1413 <https://github.com/hpcugent/easybuild-framework/pull/1413>`_, `#1415 <https://github.com/hpcugent/easybuild-framework/pull/1415>`_)
  * add ``only_if_module_is_available`` decorator function to guard functionality that uses optional dependencies (`#1416 <https://github.com/hpcugent/easybuild-framework/pull/1416>`_)
  * give easyblocks the possibility to choose ``maxhits`` for ``run_cmd_qa`` (`#1417 <https://github.com/hpcugent/easybuild-framework/pull/1417>`_)
  * use class name (string) rather than License instances as values for software license constants (`#1418 <https://github.com/hpcugent/easybuild-framework/pull/1418>`_)
  * support controlling recursive unloading of dependencies via '``recursive_module_unload``' easyconfig parameter (`#1425 <https://github.com/hpcugent/easybuild-framework/pull/1425>`_)
  * implement basic support for type checking of easyconfig parameters (`#1427 <https://github.com/hpcugent/easybuild-framework/pull/1427>`_)
  * support auto-converting to expected value type for easyconfig parameters (enabled by default) (`#1428 <https://github.com/hpcugent/easybuild-framework/pull/1428>`_, `#1437 <https://github.com/hpcugent/easybuild-framework/pull/1437>`_)
  * add support for ``--rebuild`` command line option, alternative for ``--force`` which doesn't imply ``--ignore-osdeps`` (`#1435 <https://github.com/hpcugent/easybuild-framework/pull/1435>`_)
  * add support for Mercurial easyconfig repository (`#979 <https://github.com/hpcugent/easybuild-framework/pull/979>`_, `#1446 <https://github.com/hpcugent/easybuild-framework/pull/1446>`_)
  * add dedicated class for psmpi toolchain MPI component, and use it in gpsmpi and ipsmpi toolchains (`#1454 <https://github.com/hpcugent/easybuild-framework/pull/1454>`_)

* various bug fixes, including:

  * fix extracting of comments from an easyconfig file that includes 'tail' comments (`#1381 <https://github.com/hpcugent/easybuild-framework/pull/1381>`_)
  * fix dev version to follow PEP-440, as required by recent setuptools versions (`#1403 <https://github.com/hpcugent/easybuild-framework/pull/1403>`_)

    * required to avoid that setuptools transforms the version itself
    * see also https://www.python.org/dev/peps/pep-0440/#developmental-releases

  * allow ``get_cpu_speed`` to return ``None`` if CPU freq could not be determined (`#1421 <https://github.com/hpcugent/easybuild-framework/pull/1421>`_)
  * relax ``sanity_check_paths`` in EasyBuild bootstrap script to deal with possible zipped .egg (`#1422 <https://github.com/hpcugent/easybuild-framework/pull/1422>`_)
  * use empty list as default value for src/patches in Extension class (`#1434 <https://github.com/hpcugent/easybuild-framework/pull/1434>`_)
  * skip symlinked files in ``adjust_permissions`` function (`#1439 <https://github.com/hpcugent/easybuild-framework/pull/1439>`_)
  * fix HierarchicalMNS to always use full version number (`#1440 <https://github.com/hpcugent/easybuild-framework/pull/1440>`_)

**easyblocks**

* 3 new generic easyblocks: OCamlPackage (`#467 <https://github.com/hpcugent/easybuild-easyblocks/pull/467>`_), SCons (`#689 <https://github.com/hpcugent/easybuild-easyblocks/pull/689>`_, `#700 <https://github.com/hpcugent/easybuild-easyblocks/pull/700>`_), Waf (`#722 <https://github.com/hpcugent/easybuild-easyblocks/pull/722>`_)
* new easyblocks for 2 software packages that require customized support:

  * OCaml (`#467 <https://github.com/hpcugent/easybuild-easyblocks/pull/467>`_), Samcef (`#678 <https://github.com/hpcugent/easybuild-easyblocks/pull/678>`_)

* various other enhancements, including:

  * add support for installing OpenFOAM with external METIS, CGAL and Paraview (`#497 <https://github.com/hpcugent/easybuild-easyblocks/pull/497>`_)
  * update netCDF easyblock updated for netCDF v4.3.3.1 (`#674 <https://github.com/hpcugent/easybuild-easyblocks/pull/674>`_)
  * update Rosetta easyblock for recent Rosetta versions (`#677 <https://github.com/hpcugent/easybuild-easyblocks/pull/677>`_)
  * make unpacked source dir detection in easyblock for VSC-tools a little bit more flexible (`#679 <https://github.com/hpcugent/easybuild-easyblocks/pull/679>`_)
  * add support for building with Plumed support enabled in CP2K easyblock (`#681 <https://github.com/hpcugent/easybuild-easyblocks/pull/681>`_)
  * update Go easyblock for Go v1.5 (`#683 <https://github.com/hpcugent/easybuild-easyblocks/pull/683>`_)
  * use ``apply_regex_substitutions`` function in WRF easyblock (`#685 <https://github.com/hpcugent/easybuild-easyblocks/pull/685>`_)
  * update MUMPS easyblock for 5.x (`#686 <https://github.com/hpcugent/easybuild-easyblocks/pull/686>`_)
  * implement runtime patching of ``$WM_*`` and compiler variables for OpenFOAM (`#688 <https://github.com/hpcugent/easybuild-easyblocks/pull/688>`_)
  * specify sequential compiler to use in compiler command that gets injected in OpenFOAM easyblock (`#692 <https://github.com/hpcugent/easybuild-easyblocks/pull/692>`_)
  * make ``PythonPackage`` and WRF easyblocks dry-run aware (`#696 <https://github.com/hpcugent/easybuild-easyblocks/pull/696>`_)

    * see also :ref:`extended_dry_run_guidelines_easyblocks`

  * add support in ``PythonPackage`` for installing with ``easy_install`` + installing zipped eggs (`#698 <https://github.com/hpcugent/easybuild-easyblocks/pull/698>`_, `#711 <https://github.com/hpcugent/easybuild-easyblocks/pull/711>`_, `#715 <https://github.com/hpcugent/easybuild-easyblocks/pull/715>`_)
  * update Bowtie easyblock for recent Bowtie versions (`#707 <https://github.com/hpcugent/easybuild-easyblocks/pull/707>`_)
  * update CUDA easyblock for CUDA 7.x(`#708 <https://github.com/hpcugent/easybuild-easyblocks/pull/708>`_)
  * also consider ``config/make.sys.in`` for want in QuantumESRESSO easyblock (`#714 <https://github.com/hpcugent/easybuild-easyblocks/pull/714>`_)
  * define ``$NWCHEM_LONG_PATH`` if needed in NWChem easyblock (`#720 <https://github.com/hpcugent/easybuild-easyblocks/pull/720>`_)
  * remove custom post-install step in PDT easyblock (`#723 <https://github.com/hpcugent/easybuild-easyblocks/pull/723>`_)

    * no longer needed now that ``adjust_permissions`` functions ignores symlinks

  * use ``$LIBS`` in HPL easyblock (`#727 <https://github.com/hpcugent/easybuild-easyblocks/pull/727>`_, `#736 <https://github.com/hpcugent/easybuild-easyblocks/pull/736>`_)

* various bug fixes, including:

  * also define ``$MCRROOT`` for MCR in module (`#687 <https://github.com/hpcugent/easybuild-easyblocks/pull/687>`_)
  * add missing '``super``' call in ``configure_step`` of easyblock for python-meep (`#694 <https://github.com/hpcugent/easybuild-easyblocks/pull/694>`_)
  * only prepend existing non-empty paths to ``$PYTHONPATH`` in ``PythonPackage`` easyblock (`#697 <https://github.com/hpcugent/easybuild-easyblocks/pull/697>`_)
  * fix extra_options definition in ``CMakePythonPackage`` easyblock (`#698 <https://github.com/hpcugent/easybuild-easyblocks/pull/698>`_)
  * fix dev version to follow PEP-440, as required by recent setuptools versions (`#702 <https://github.com/hpcugent/easybuild-easyblocks/pull/702>`_, `#703 <https://github.com/hpcugent/easybuild-easyblocks/pull/703>`_, `#704 <https://github.com/hpcugent/easybuild-easyblocks/pull/704>`_)

    * required to avoid that setuptools transforms the version itself
    * see also https://www.python.org/dev/peps/pep-0440/#developmental-releases

  * consider both ``lib`` and ``lib64`` in sanity check paths for flex (`#705 <https://github.com/hpcugent/easybuild-easyblocks/pull/705>`_)
  * also copy signature file and don't copy CMake files in Eigen easyblock (`#709 <https://github.com/hpcugent/easybuild-easyblocks/pull/709>`_)
  * fix directory names in ``make_module_req_guess`` of ANSYS easyblock (`#713 <https://github.com/hpcugent/easybuild-easyblocks/pull/713>`_)
  * fix imports for ``set_tmpdir`` in easyblock unit tests after function was moved in EasyBuild framework (`#726 <https://github.com/hpcugent/easybuild-easyblocks/pull/726>`_)
  * use ``--with-tcltk*`` configure options for Python to point to ensure Tcl/Tk deps are picked up (`#729 <https://github.com/hpcugent/easybuild-easyblocks/pull/729>`_)
  * fix order of subdirs for QuantumESPRESSO binaries (`#730 <https://github.com/hpcugent/easybuild-easyblocks/pull/730>`_)
  * correctly handle having both ``$FC``/``$FCFLAGS`` and ``$F90``/``$F90FLAGS`` defined when building MVAPICH2 (`#732 <https://github.com/hpcugent/easybuild-easyblocks/pull/732>`_)
  * fix OpenSSL sanity check paths: lib/engines is a directory (`#731 <https://github.com/hpcugent/easybuild-easyblocks/pull/731>`_, `#733 <https://github.com/hpcugent/easybuild-easyblocks/pull/733>`_)
  * fix sanity check paths for netcdf-python (`#735 <https://github.com/hpcugent/easybuild-easyblocks/pull/735>`_)

**easyconfigs**

* added example easyconfig files for 45 new software packages:

  * animation (`#2007 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2007>`_), ANSYS CFD (`#1969 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1969>`_), ANTLR (`#1191 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1191>`_, `#1980 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1980>`_), APR (`#1970 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1970>`_), APR-util (`#1970 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1970>`_), Aspera Connect (`#2005 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2005>`_), ChIP-Seq (`#2119 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2119>`_), deap (`#2082 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2082>`_), DISCOVARdenovo (`#1932 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1932>`_), FastQC (`#1984 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1984>`_), fontsproto (`#1618 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1618>`_, `#2038 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2038>`_), GraphicsMagick (`#2007 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2007>`_), HBase (`#1990 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1990>`_), ISIS (`#1972 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1972>`_), libedit (`#293 <https://github.com/hpcugent/easybuild-easyconfigs/pull/293>`_), libfontenc (`#1618 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1618>`_, `#2038 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2038>`_), libGLU (`#1627 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1627>`_), libXdamage (`#1618 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1618>`_, `#2038 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2038>`_), libXfont (`#1618 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1618>`_, `#2038 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2038>`_), LLVM (`#1620 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1620>`_, `#1989 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1989>`_, `#2031 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2031>`_), MIGRATE-N (`#1944 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1944>`_), MIRA (`#1938 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1938>`_), mympingpong (`#2049 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2049>`_), MySQLdb (`#2011 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2011>`_), NCO (`#1191 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1191>`_, `#1980 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1980>`_), NIPY (`#2064 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2064>`_), Nilearn (`#2064 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2064>`_), NiBabel (`#2064 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2064>`_), PBZIP2 (`#1038 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1038>`_), PIL (`#2062 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2062>`_), PhyloCSF (`#2018 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2018>`_), pycairo (`#2085 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2085>`_), pydicom (`#2063 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2063>`_), Salmon (`#2051 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2051>`_), Samcef (`#1941 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1941>`_), scikit-image (`#1974 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1974>`_, `#2006 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2006>`_), Serf (`#1970 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1970>`_), SSAHA2 (`#1039 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1039>`_), Subversion (`#1970 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1970>`_), SWASH (`#2059 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2059>`_), time (`#1954 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1954>`_), Trim_Galore (`#1984 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1984>`_), Trimmomatic (`#1987 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1987>`_), WEKA (`#1986 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1986>`_), x264 (`#2017 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2017>`_)

* added new easyconfigs for existing toolchains: ``gimkl/2.11.5`` (`#2093 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2093>`_)
* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * including Clang + LLVM 3.7.0, CMake 3.3.2, CUDA 7.5.18, hanythingondemand v3.0.1, Mesa 11.0.2, mpi4py v2.0.0,
    ncurses 6.0, OpenFOAM 2.4.0, Paraview 4.4.0, Python 3.5.0, QuantumESPRESSO v5.2.1

* various other enhancements, including:

  * enable '``pic``' toolchain option in libxml2 easyconfigs (`#1993 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1993>`_)
  * extend list of R libraries included in R v3.2.1 easyconfigs (`#2042 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2042>`_, `#2046 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2046>`_, `#2067 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2067>`_, `#2072 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2072>`_)
  * add Rsubread in Bioconductor easyconfigs (`#1971 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1971>`_)

* various bug fixes, including:

  * fix software name for ``BEEF`` (was '``libbeef``') (`#1679 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1679>`_)
  * add patch to install ``qhull.pc`` (pkgconfig) file with Qhull (`#1975 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1975>`_)
  * don't enable experimental nouveau API in libdrm easyconfigs (`#1994 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1994>`_)
  * fix dev version to follow PEP-440, as required by recent setuptools versions (`#1997 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1997>`_)

    * required to avoid that setuptools transforms the version itself
    * see also https://www.python.org/dev/peps/pep-0440/#developmental-releases

  * correct homepage in Cufflinks easyconfigs (`#2060 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2060>`_)
  * fix imports for ``set_tmpdir`` in easyblock unit tests after function was moved in EasyBuild framework (`#2097 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2097>`_)
  * add patch for Tk 8.6.4 to fix problem with ``tk.tcl`` not being found (`#2102 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2102>`_)
  * don't use ``%(version)s`` template in toolchain version, causes problems with HierarchicalMNS (`#2104 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2104>`_)
  * fix sanity check paths in several easyconfig (`#2109 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2109>`_, `#2120 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2120>`_, `#2121 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2121>`_, `#2125 <https://github.com/hpcugent/easybuild-easyconfigs/pull/2125>`_)

    * required because of bug fix in ``sanity_check_step`` implementation
    * CVXOPT, h5py, LIBSVM, libunistring, MDP, monty, PhyloCSF, Pyke, pandas, pycosat, pyhull, pymatgen,
      python-dateutils, Seaborn, Theano, XML-LibXML, XML-Simple

.. _release_notes_eb230:

v2.3.0 (September 2nd 2015)
---------------------------

feature + bugfix release

**framework**

* requires vsc-base v2.2.4 or more recent (`#1343 <https://github.com/hpcugent/easybuild-framework/pull/1343>`_)

  * required for ``mk_rst_table`` function in ``vsc.utils.docs``

* various other enhancements, including:

  * add support for generating documentation for (generic) easyblocks in ``.rst`` format (`#1317 <https://github.com/hpcugent/easybuild-framework/pull/1317>`_)
  * preserve comments in easyconfig file in ``EasyConfig.dump()`` method (`#1327 <https://github.com/hpcugent/easybuild-framework/pull/1327>`_)
  * add ``--cleanup-tmpdir`` option (`#1365 <https://github.com/hpcugent/easybuild-framework/pull/1365>`_)

    * enables to preserve the used temporary directory via ``--disable-cleanup-tmpdir``

  * enhance ``EasyConfig.dump()`` to reformat dumped easyconfig according to style guidelines (`#1345 <https://github.com/hpcugent/easybuild-framework/pull/1345>`_)
  * add support for extracting ``.iso`` files using 7z (p7zip) (`#1375 <https://github.com/hpcugent/easybuild-framework/pull/1375>`_)

* various bug fixes, including:

  * correctly deal with special characters in template strings in ``EasyConfig.dump()`` method (`#1323 <https://github.com/hpcugent/easybuild-framework/pull/1323>`_)
  * rework ``easybuild.tools.module_generator`` module to avoid keeping state w.r.t. fake modules (`#1348 <https://github.com/hpcugent/easybuild-framework/pull/1348>`_)
  * fix dumping of hidden deps (`#1354 <https://github.com/hpcugent/easybuild-framework/pull/1354>`_)
  * fix use of ``--job`` with hidden dependencies: include ``--hidden`` in submitted job script when needed (`#1356 <https://github.com/hpcugent/easybuild-framework/pull/1356>`_)
  * fix ``ActiveMNS.det_full_module_name()`` for external modules (`#1360 <https://github.com/hpcugent/easybuild-framework/pull/1360>`_)
  * fix ``EasyConfig.all_dependencies`` definition, fix tracking of job dependencies (`#1359 <https://github.com/hpcugent/easybuild-framework/pull/1359>`_, `#1361 <https://github.com/hpcugent/easybuild-framework/pull/1361>`_)
  * fix ``ModulesTool.exist()`` for hidden Lua module files (`#1364 <https://github.com/hpcugent/easybuild-framework/pull/1364>`_)
  * only call ``EasyBlock.sanity_check_step`` for non-extensions (`#1366 <https://github.com/hpcugent/easybuild-framework/pull/1366>`_)

    * this results in significant speedup when installing easyconfigs with lots of extensions, but also
      results in checking the default sanity check paths if none were defined for extensions installed as a module

  * fix using module naming schemes that were included via ``--include-module-naming-schemes`` (`#1370 <https://github.com/hpcugent/easybuild-framework/pull/1370>`_)

**easyblocks**

* new easyblocks for 2 software packages that require customized support:

  * MCR (`#623 <https://github.com/hpcugent/easybuild-easyblocks/pull/623>`_), Molpro (`#665 <https://github.com/hpcugent/easybuild-easyblocks/pull/665>`_)

* various other enhancements, including:

  * enhance BWA easyblock to also install man pages (`#650 <https://github.com/hpcugent/easybuild-easyblocks/pull/650>`_)
  * enhance tbb easyblock to consider lib dirs in order and also define ``$CPATH``, ``$LIBRARY_PATH``, ``$TBBROOT`` (#653, #654)
  * call ``PythonPackage.configure_step`` in ``ConfigureMakePythonPackage.configure_step`` (`#668 <https://github.com/hpcugent/easybuild-easyblocks/pull/668>`_)
  * add '``foldx3b6``' as possible binary name in FoldX easyblock (`#671 <https://github.com/hpcugent/easybuild-easyblocks/pull/671>`_)
  * enhance/cleanup MATLAB easyblock (`#672 <https://github.com/hpcugent/easybuild-easyblocks/pull/672>`_)
  * move preparing of '``intel``' subdir in ``$HOME`` to ``configure_step`` in ``IntelBase`` easyblock (`#673 <https://github.com/hpcugent/easybuild-easyblocks/pull/673>`_)

* various bug fixes, including:

  * add missing super call in ``post_install_step`` of imkl easyblock (`#648 <https://github.com/hpcugent/easybuild-framework/pull/648>`_, `#660 <https://github.com/hpcugent/easybuild-framework/pull/660>`_)
  * fix regex used to correct ``I_MPI_ROOT`` in impi ``mpivars.sh`` scripts (`#662 <https://github.com/hpcugent/easybuild-easyblocks/pull/662>`_)
  * fix regex used to patch ``.mk`` file in configure step of SuiteSparse easyblock (`#666 <https://github.com/hpcugent/easybuild-easyblocks/pull/666>`_)
  * correctly specify installation prefix via ``$GEM_HOME`` in ``RubyGem`` easyblock (`#667 <https://github.com/hpcugent/easybuild-easyblocks/pull/667>`_)
  * add custom sanity check in scipy easyblock (`#669 <https://github.com/hpcugent/easybuild-easyblocks/pull/669>`_)
  * specify to always use the bfd linker for OpenFOAM, to stay away from using ``ld.gold`` (`#670 <https://github.com/hpcugent/easybuild-easyblocks/pull/670>`_)

**easyconfigs**

* added example easyconfig files for 19 new software packages:

  * ATK (`#1780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1780>`_), Atkmm (`#1780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1780>`_), cairomm (`#1780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1780>`_), GLibmm (`#1780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1780>`_), GlobalArrays (`#1868 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1868>`_), gdk-pixbuf (`#1780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1780>`_),
    gtk+ (`#1780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1780>`_), Gtkmm (`#1780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1780>`_), libbeef (`#1827 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1827>`_), libsigc++ (`#1780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1780>`_), libsodium (`#1876 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1876>`_), MACS (`#1869 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1869>`_), MCR (`#1677 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1677>`_),
    Molpro (`#1880 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1880>`_), NFFT (`#1921 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1921>`_), p7zip (`#1931 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1931>`_), Pangomm (`#1780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1780>`_), pygraphviz (`#1861 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1861>`_), pycosat (`#1859 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1859>`_)

* added new easyconfigs for existing toolchains: GNU/4.9.3-2.25 (`#1836 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1836>`_), foss/2015b (`#1695 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1695>`_), intel/2015b (`#1696 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1696>`_)

  * add easyconfigs using this toolchain for BLAST+ 2.2.31, Boost 1.58.0, CP2K 2.6.1, OpenFOAM 2.3.1,
    Perl 5.20.2 + 5.22.0 (bare), Python 2.7.10, R 3.2.1

* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * including Boost 1.59.0, CP2K 2.6.1, GCC 5.2.0

* various other enhancements, including:

  * enhance texinfo easyconfig w.r.t. ``texmf``, only use it as a build dependency (`#1840 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1840>`_)
  * enable building of ``ld.gold`` in binutils 2.25 (`#1885 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1885>`_)

* various bug fixes, including:

  * fix enabling MPI support for h5py 2.5.0 (`#1825 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1825>`_)
  * fix versions of Bioconductor packages + add a couple extra (`#1828 <https://github.com/hpcugent/easybuild-framework/pull/1828>`_, `#1852 <https://github.com/hpcugent/easybuild-framework/pull/1852>`_, `#1895 <https://github.com/hpcugent/easybuild-framework/pull/1895>`_, `#1917 <https://github.com/hpcugent/easybuild-framework/pull/1917>`_)
  * put dummy values in place for ``builddir``/``installdir`` templates in easyconfigs unit tests (`#1835 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1835>`_)
  * fix easyconfigs unit tests w.r.t. changes made in framework (`#1853 <https://github.com/hpcugent/easybuild-framework/pull/1853>`_, `#1870 <https://github.com/hpcugent/easybuild-framework/pull/1870>`_, `#1874 <https://github.com/hpcugent/easybuild-framework/pull/1874>`_, `#1875 <https://github.com/hpcugent/easybuild-framework/pull/1875>`_)
  * add GMP as missing dep in Python 2.7.10 easyconfigs, required for pycrypto extension (`#1858 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1858>`_)
  * specify installation prefix for SIP (`#1888 <https://github.com/hpcugent/easybuild-framework/pull/1888>`_, `#1892 <https://github.com/hpcugent/easybuild-framework/pull/1892>`_)
  * add custom sanity check paths in various easyconfigs (`#1889 <https://github.com/hpcugent/easybuild-framework/pull/1889>`_, `#1894 <https://github.com/hpcugent/easybuild-framework/pull/1894>`_, `#1897 <https://github.com/hpcugent/easybuild-framework/pull/1897>`_ - `#1909 <https://github.com/hpcugent/easybuild-framework/pull/1909>`_)

    * required because of fix in EasyBuild framework, causing default sanity check paths to be considered
      for extensions that are installed as a module
    * affected easyconfigs include: AnalyzeFMRI, Biggus, bibtexparser, DB_File, DBD-Pg, DBD-SQLite, DBD-mysql, evmix,
      fmri, FPM, GraphViz, gsl, GSSAPI, MDP, mpi4py, ncdf, ncdf4, netifaces, NetLibIDN, networkx, ordereddict,
      Parallel-ForkManager,  paycheck, PyQuante, Pyke, PyQt, r2py, rjags, runjags, scikit-learn, SOBAcl,
      vsc-processcontrol, vsc-mympirun-scoop, XML, XML-Dumper, XML-Parser, XML-Twig, YAML-Syck

  * don't enable '``static``' toolchain option in SuiteSparse 4.4.3 easyconfig (`#1911 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1911>`_)
  * add --exclude unpack options for OpenFOAM 2.3.1 to avoid cyclic symlink causing problems when unpacking (`#1925 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1925>`_)


.. _release_notes_eb220:

v2.2.0 (July 15th 2015)
-----------------------

feature + bugfix release

**framework**

* add support for using GC3Pie as a backend for ``--job`` (`#1008 <https://github.com/hpcugent/easybuild-framework/pull/1008>`_)

  * see also :ref:`submitting_jobs`

* add support for ``--include-*`` configuration options to include additional easyblocks, toolchains, etc. (`#1301 <https://github.com/hpcugent/easybuild-framework/pull/1301>`_)

  * see :ref:`including_additional_python_modules`

* add (experimental) support for packaging installed software using FPM (`#1224 <https://github.com/hpcugent/easybuild-framework/pull/1224>`_)

  * see :ref:`packaging_support`

* various other enhancements, including:

  * use https for PyPI URL templates (`#1286 <https://github.com/hpcugent/easybuild-framework/pull/1286>`_)
  * add GNU toolchain definition (`#1287 <https://github.com/hpcugent/easybuild-framework/pull/1287>`_)
  * make bootstrap script more robust (`#1289 <https://github.com/hpcugent/easybuild-framework/pull/1289>`_, `#1325 <https://github.com/hpcugent/easybuild-framework/pull/1325>`_):

    * exclude 'easyblocks' pkg from ``sys.path`` to avoid that ``setup.py`` for easybuild-easyblocks picks up wrong version
    * undefine ``$EASYBUILD_BOOTSTRAP*`` environment variables, since they do not correspond with known config options

  * improve error reporting/robustness in ``fix_broken_easyconfigs.py`` script (`#1290 <https://github.com/hpcugent/easybuild-framework/pull/1290>`_)
  * reset keep toolchain component class 'constants' every time (`#1294 <https://github.com/hpcugent/easybuild-framework/pull/1294>`_)
  * make ``--strict`` also a build option (`#1295 <https://github.com/hpcugent/easybuild-framework/pull/1295>`_)
  * fix purging of loaded modules in unit tests' setup method (`#1297 <https://github.com/hpcugent/easybuild-framework/pull/1297>`_)
  * promote ``MigrateFromEBToHMNS`` to a 'production' MNS (`#1302 <https://github.com/hpcugent/easybuild-framework/pull/1302>`_)
  * add support for ``--read-only-installdir`` and ``--group-writable-installdir`` configuration options (`#1304 <https://github.com/hpcugent/easybuild-framework/pull/1304>`_)
  * add support for *not* expanding relative paths in ``prepend_paths`` (`#1310 <https://github.com/hpcugent/easybuild-framework/pull/1310>`_)
  * enhance ``EasyConfig.dump()`` method to use easyconfig templates where possible (`#1314 <https://github.com/hpcugent/easybuild-framework/pull/1314>`_), `#1319 <https://github.com/hpcugent/easybuild-framework/pull/1319>`_), `#1320 <https://github.com/hpcugent/easybuild-framework/pull/1320>`_), `#1321 <https://github.com/hpcugent/easybuild-framework/pull/1321>`_)

* various bug fixes, including:

  * fix issue with cleaning up (no) logfile if ``--logtostdout``/``-l`` is used (`#1298 <https://github.com/hpcugent/easybuild-framework/pull/1298>`_)
  * stop making ``ModulesTool`` class a singleton since it causes problems when multilple toolchains are in play (`#1299 <https://github.com/hpcugent/easybuild-framework/pull/1299>`_)
  * don't modify values of 'paths' list passed as argument to prepend_paths in ``ModuleGenerator`` (`#1300 <https://github.com/hpcugent/easybuild-framework/pull/1300>`_)
  * fix issue with ``EasyConfig.dump()`` + cleanup (`#1308 <https://github.com/hpcugent/easybuild-framework/pull/1308>`_), `#1311 <https://github.com/hpcugent/easybuild-framework/pull/1311>`_)
  * reenable (and fix) accidentally disabled test (`#1316 <https://github.com/hpcugent/easybuild-framework/pull/1316>`_)

**easyblocks**

* modified easybuild.easyblocks package declaration to support giving preference to custom easyblocks (`#617 <https://github.com/hpcugent/easybuild-easyblocks/pull/617>`_)
* 2 new generic easyblocks: RubyGem (`#565 <https://github.com/hpcugent/easybuild-easyblocks/pull/565>`_), SystemCompiler (`#633 <https://github.com/hpcugent/easybuild-easyblocks/pull/633>`_)
* new easyblocks for 5 software packages that require customized support:

  * NEMO (`#564 <https://github.com/hpcugent/easybuild-easyblocks/pull/564>`_), pbdMPI (`#612 <https://github.com/hpcugent/easybuild-framework/pull/612>`_), `#620 <https://github.com/hpcugent/easybuild-framework/pull/620>`_), pbdSLAP (`#620 <https://github.com/hpcugent/easybuild-easyblocks/pull/620>`_), PDT (`#624 <https://github.com/hpcugent/easybuild-easyblocks/pull/624>`_), Ruby (`#565 <https://github.com/hpcugent/easybuild-easyblocks/pull/565>`_)

* various other enhancements, including:

  * update CUDA easyblock for v6.x (`#476 <https://github.com/hpcugent/easybuild-easyblocks/pull/476>`_)
  * make METIS easyblock take into account configopts (`#494 <https://github.com/hpcugent/easybuild-easyblocks/pull/494>`_)
  * enable building of EOMIP and EOMEA for NWChem versions 6.5 and up (`#508 <https://github.com/hpcugent/easybuild-easyblocks/pull/508>`_)
  * make out-of-source build with CMake truly out-of-source (`#615 <https://github.com/hpcugent/easybuild-easyblocks/pull/615>`_)
  * add support in Bundle easyblock to run full sanity check (`#627 <https://github.com/hpcugent/easybuild-easyblocks/pull/627>`_)
  * also take platform-specific Python lib dirs into account in PythonPackage easyblock (`#628 <https://github.com/hpcugent/easybuild-easyblocks/pull/628>`_)
  * fix mpivars scripts in Intel MPI installation for versions where the installation is moved (`#629 <https://github.com/hpcugent/easybuild-easyblocks/pull/629>`_)
  * don't restrict ``det_pylibdir`` function to only EasyBuild-provided Python (`#631 <https://github.com/hpcugent/easybuild-framework/pull/631>`_), `#641 <https://github.com/hpcugent/easybuild-framework/pull/641>`_)
  * support snappy and other optional native libs in Hadoop easyblock (`#632 <https://github.com/hpcugent/easybuild-framework/pull/632>`_), `#638 <https://github.com/hpcugent/easybuild-framework/pull/638>`_), `#640 <https://github.com/hpcugent/easybuild-framework/pull/640>`_), `#642 <https://github.com/hpcugent/easybuild-framework/pull/642>`_)

* various bug fixes, including:

  * fix Xmipp easyblock, use provided ``install.sh`` script (`#630 <https://github.com/hpcugent/easybuild-easyblocks/pull/630>`_)
  * update Clang easyblock to disable tests that may fail when unlimited stack size is used (`#622 <https://github.com/hpcugent/easybuild-easyblocks/pull/622>`_)
  * fix setting of ``$INTEL_LICENSE_FILE`` for port@server values (`#635 <https://github.com/hpcugent/easybuild-easyblocks/pull/635>`_)

**easyconfigs**

* added example easyconfig files for **62** new software packages:

  * ADF (`#899 <https://github.com/hpcugent/easybuild-easyconfigs/pull/899>`_), AutoDock_Vina (`#808 <https://github.com/hpcugent/easybuild-easyconfigs/pull/808>`_), bibtexparser (`#1726 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1726>`_), Biggus (`#1770 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1770>`_), Bismark (`#990 <https://github.com/hpcugent/easybuild-easyconfigs/pull/990>`_), blasr (`#1662 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1662>`_), BSMAP (`#1171 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1171>`_),
    Check (`#811 <https://github.com/hpcugent/easybuild-easyconfigs/pull/811>`_), Circuitscape (`#1222 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1222>`_), CONTRAfold (`#689 <https://github.com/hpcugent/easybuild-easyconfigs/pull/689>`_), cramtools (`#1741 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1741>`_), DBD-Pg (`#1066 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1066>`_), DendroPy (`#995 <https://github.com/hpcugent/easybuild-easyconfigs/pull/995>`_),
    EMAN2 (`#1737 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1737>`_), ETSF_IO (`#727 <https://github.com/hpcugent/easybuild-easyconfigs/pull/727>`_), eudev (`#1578 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1578>`_), fastqc (`#1636 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1636>`_), FDS (`#814 <https://github.com/hpcugent/easybuild-framework/pull/814>`_), `#1617 <https://github.com/hpcugent/easybuild-framework/pull/1617>`_), `#1625 <https://github.com/hpcugent/easybuild-framework/pull/1625>`_), FPM (`#1440 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1440>`_),
    frealign (`#1619 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1619>`_), g2log (`#1035 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1035>`_), GC3Pie (`#1692 <https://github.com/hpcugent/easybuild-framework/pull/1692>`_), `#1756 <https://github.com/hpcugent/easybuild-framework/pull/1756>`_), `#1768 <https://github.com/hpcugent/easybuild-framework/pull/1768>`_), GenotypeHarmonizer (`#1672 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1672>`_), gensim (`#1762 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1762>`_),
    GraphViz (`#1658 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1658>`_), hisat (`#1674 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1674>`_), IDBA-UD (`#1045 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1045>`_), IMa2 (`#828 <https://github.com/hpcugent/easybuild-easyconfigs/pull/828>`_), IMPUTE2 (`#824 <https://github.com/hpcugent/easybuild-easyconfigs/pull/824>`_), JUBE (`#1396 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1396>`_), LAMARC (`#760 <https://github.com/hpcugent/easybuild-easyconfigs/pull/760>`_),
    libXScrnSaver (`#1653 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1653>`_), MATIO (`#1004 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1004>`_), MuTect (`#1483 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1483>`_), ncdf (`#617 <https://github.com/hpcugent/easybuild-easyconfigs/pull/617>`_), NEMO (`#1640 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1640>`_), ngspice (`#1116 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1116>`_),
    ordereddict (`#1774 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1774>`_), OSU Micro-Benchmarks (`#1777 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1777>`_), Parallel-ForkManager (`#847 <https://github.com/hpcugent/easybuild-easyconfigs/pull/847>`_), pBWA (`#1009 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1009>`_), PeakSeq (`#1412 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1412>`_),
    Pillow (`#1702 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1702>`_), Pindel (`#1126 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1126>`_), PLUMED (`#1596 <https://github.com/hpcugent/easybuild-framework/pull/1596>`_), `#1665 <https://github.com/hpcugent/easybuild-framework/pull/1665>`_), PostgreSQL (`#1066 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1066>`_), PROJ (`#1006 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1006>`_), PyAMG (`#1222 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1222>`_), Pyke (`#1776 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1776>`_),
    rpy2 (`#1775 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1775>`_), Sailfish (`#1035 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1035>`_), SCANMS (`#1386 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1386>`_), Seaborn (`#1763 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1763>`_), snpEff (`#1680 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1680>`_), SOBAcl (`#1658 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1658>`_),
    SPIDER (`#1624 <https://github.com/hpcugent/easybuild-framework/pull/1624>`_), `#1723 <https://github.com/hpcugent/easybuild-framework/pull/1723>`_), STAR (`#1043 <https://github.com/hpcugent/easybuild-framework/pull/1043>`_), `#1676 <https://github.com/hpcugent/easybuild-framework/pull/1676>`_), system GCC (`#1778 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1778>`_), tabix (`#1059 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1059>`_), tecplot360ex (`#1100 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1100>`_), Vampir (`#512 <https://github.com/hpcugent/easybuild-easyconfigs/pull/512>`_),
    VampirServer (`#512 <https://github.com/hpcugent/easybuild-easyconfigs/pull/512>`_), verifyBamID (`#1675 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1675>`_)

* added easyconfigs for 4 new software bundles:

  * R-bundle-Bioconductor (`#1573 <https://github.com/hpcugent/easybuild-framework/pull/1573>`_), `#1795 <https://github.com/hpcugent/easybuild-framework/pull/1795>`_), R-bundle-devtools (`#1621 <https://github.com/hpcugent/easybuild-framework/pull/1621>`_), `#1759 <https://github.com/hpcugent/easybuild-framework/pull/1759>`_), R-bundle-extra (`#1387 <https://github.com/hpcugent/easybuild-framework/pull/1387>`_), `#1759 <https://github.com/hpcugent/easybuild-framework/pull/1759>`_), R-bundle-pbd (`#1659 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1659>`_)

* added easyconfigs for new GNU toolchain (`#1346 <https://github.com/hpcugent/easybuild-framework/pull/1346>`_), `#1669 <https://github.com/hpcugent/easybuild-framework/pull/1669>`_)
* added new easyconfigs for existing toolchains: goolf/1.5.16, intel/2014.06
* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * including BLAST 2.2.31+, Clang 3.6.1, CUDA 6.x, GCC 4.9.3, GROMACS 5.0.5, HDF5 1.8.15 + 1.8.15-patch1,
    Python 2.7.10, R 3.2.0 + 3.2.1, WRF 3.6.1

* various other enhancements, including:

  * update all ncurses easyconfigs to enable ncursesw and use ConfigureMake easyblock (`#1337 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1337>`_)
  * update PDT easyconfigs to use PDT easyblock (`#1687 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1687>`_)
  * add custom ``sanity_check_paths`` in libxml2 easyconfigs (`#1690 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1690>`_)
  * enhance unit tests to also cover EasyConfig.dump() method on all easyconfigs (`#1761 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1761>`_)
  * include snappy as dependency in Hadoop easyconfigs (`#1758 <https://github.com/hpcugent/easybuild-framework/pull/1758>`_), `#1773 <https://github.com/hpcugent/easybuild-framework/pull/1773>`_)
  * enable SSL support in CMake v3.2.3 easyconfigs (`#1784 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1784>`_)
  * add additional extensions in R easyconfigs (`#1637 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1637>`_)

* various bug fixes, including:

  * add patch file required for correct CUDA-aware OpenMPI v1.7.3 build (`#631 <https://github.com/hpcugent/easybuild-easyconfigs/pull/631>`_)
  * fix issue with OpenMPI dependency in ECore easyconfigs (`#777 <https://github.com/hpcugent/easybuild-easyconfigs/pull/777>`_)
  * don't run the Bloom tests for Jellyfish, they can randomly fail (`#1016 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1016>`_)
  * fix source URLs in BioPerl easyconfigs (`#1075 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1075>`_)
  * patch out svnversion command in Python 2.5.6 to fix build on recent systems (`#1576 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1576>`_)
  * consistently use https for PyPI URLs in homepage/source_urls (`#1616 <https://github.com/hpcugent/easybuild-framework/pull/1616>`_), `#1722 <https://github.com/hpcugent/easybuild-framework/pull/1722>`_)
  * include Tcl and Tk as dependencies in R easyconfig (`#1623 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1623>`_)
  * add patch for installing paycheck as Py3 extension (`#1629 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1629>`_)
  * add Perl dependency in git 2.x easyconfigs (`#1631 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1631>`_)
  * fix easyconfig for GMP 6.0.0, don't use 6.0.0a sources (`#1635 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1635>`_)
  * fix source_urls in QuantumESPRESSO 5.0.2 easyconfigs (`#1652 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1652>`_)
  * include Tk as dependency in Python 2.7.9 easyconfigs (`#1654 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1654>`_)
  * include tk-devel is list of OS deps for Python 2.7.9 Cray easyconfigs, make sure '``import Tkinter``' works (`#1655 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1655>`_)
  * drop gpfs versionsuffix and stop using no longer existing ``--enable-gpfs`` configopt for recent HDF5 versions (`#1657 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1657>`_)
  * include missing libxml2 dep in GLib easyconfigs (`#1666 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1666>`_)
  * fix source URLs in Qt easyconfigs (`#1673 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1673>`_)
  * fix source URLs for argparse Python extension (`#1697 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1697>`_)
  * fix source URLs for deap Python extension (`#1699 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1699>`_)
  * fix easyconfigs unit tests after making ModulesTool a non-singleton class (`#1708 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1708>`_)
  * fix names for Xmipp easyconfigs and patches (`#1719 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1719>`_)
  * add patch for Qt 4.8.6 to fix build issue on RHEL6 with intel/2015a (`#1734 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1734>`_)
  * add M4 as build dep for GCC 5.1.0 (`#1735 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1735>`_)
  * fix Bioconductor extension versions in R 3.1.3 easyconfigs (`#1748 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1748>`_)
  * remove custom exts_filter definition from Python 3.4.3 easyconfig (`#1765 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1765>`_)
  * fix source_urls in netCDF easyconfigs (`#1766 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1766>`_)
  * fix source_urls in netCDF-C++ and netCDF-Fortran easyconfigs (`#1767 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1767>`_)

.. _release_notes_eb211:

v2.1.1 (May 18th 2015)
----------------------

bugfix release

**framework**

* fix issue with missing load statements when ``--module-only`` is used, don't skip ready/prepare steps (`#1276 <https://github.com/hpcugent/easybuild-framework/pull/1276>`_)
* enhance ``--search``: only consider actual filename (not entire path), use regex syntax (`#1281 <https://github.com/hpcugent/easybuild-framework/pull/1281>`_)
* various other bug fixes, including:

  * fix ``generate_software_list.py`` script w.r.t. dependencies marked as external modules (`#1273 <https://github.com/hpcugent/easybuild-framework/pull/1273>`_)
  * only use ``$LMOD_CMD`` value if ``lmod`` binary can't be found in $PATH (`#1275 <https://github.com/hpcugent/easybuild-framework/pull/1275>`_)
  * fix location of ``module_only`` build option w.r.t. default value (`#1277 <https://github.com/hpcugent/easybuild-framework/pull/1277>`_)
  * fix combined use of ``--hide-deps`` and ``hiddendependencies`` (`#1280 <https://github.com/hpcugent/easybuild-framework/pull/1280>`_)
  * remove log handlers that were added during tests, to ensure effective cleanup of log files (`#1282 <https://github.com/hpcugent/easybuild-framework/pull/1282>`_)

    * this makes the unit test suite run ~3x faster!

  * define ``$CRAYPE_LINK_TYPE`` if '``dynamic``' toolchain option is enabled for Cray compiler wrappers (`#1283 <https://github.com/hpcugent/easybuild-framework/pull/1283>`_)

**easyblocks**

* fix compatibility of easyblocks with ``--module-only`` + dedicated unit test module (`#610 <https://github.com/hpcugent/easybuild-easyblocks/pull/610>`_)
* minor enhancements, including:

  * update GROMACS easyblock for version 5 (`#513 <https://github.com/hpcugent/easybuild-easyblocks/pull/513>`_)

* various other bug fixes, including:

  * only check compiler being used if FFTW interfaces are being built in Intel MKL easyblock (`#606 <https://github.com/hpcugent/easybuild-easyblocks/pull/606>`_)

**easyconfigs**

* added example easyconfig files for **3** new software packages:

  * networkx (`#1592 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1592>`_), Platanus (`#1597 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1597>`_), SaguaroGW (`#1600 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1600>`_)

* added new easyconfigs for existing toolchains: ``ictce/7.3.5``, ``CrayCCE/5.2.40``, ``CrayGNU/5.2.40``, ``CrayIntel/5.2.40``
* added easyconfigs using ``CrayGNU/5.2.25`` and ``CrayGNU/5.2.40`` toolchains (`#1610 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1610>`_, `#1611 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1611>`_)
* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * including Boost 1.58.0, GROMACS 5.0.4, Python 3.4.3

* various bug fixes, including:

  * enable usempi in GROMACS easyconfig using CrayGNU toolchain (as required by GROMACS easyblock) (`#1590 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1590>`_)
  * use system-provided tcsh when building WRF on Cray systems, to avoid hanging build (`#1595 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1595>`_)
  * only use '``dynamic``' toolchain option, not '``shared``', in easyconfigs using Cray toolchain (`#1609 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1609>`_)

.. _release_notes_v2.1.0:

v2.1.0 (April 30th 2015)
------------------------

feature + bugfix release

**framework**

* requires vsc-base v2.2.0 or more recent

  * added support for LoggedException (`vsc-base#160 <https://github.com/hpcugent/vsc-base/pull/160>`_, `vsc-base#163 <https://github.com/hpcugent/vsc-base/pull/163>`_, `vsc-base#165 <https://github.com/hpcugent/vsc-base/pull/165>`_, `vsc-base#167 <https://github.com/hpcugent/vsc-base/pull/167>`_)
  * added support for add_flex action in GeneralOption (`vsc-base#162 <https://github.com/hpcugent/vsc-base/pull/162>`_)
  * added support to GeneralOption to act on unknown configuration environment variables (`vsc-base#162 <https://github.com/hpcugent/vsc-base/pull/162>`_)

* add support for only (re)generating module files: ``--module-only`` (`#1018 <https://github.com/hpcugent/easybuild-framework/pull/1018>`_)

  * module naming scheme API is enhanced to include det_install_subdir method
  * see :ref:`module_only`

* add support for generating module files in Lua syntax (note: requires Lmod as modules tool) (`#1060 <https://github.com/hpcugent/easybuild-framework/pull/1060>`_, `#1255 <https://github.com/hpcugent/easybuild-framework/pull/1255>`_, `#1256 <https://github.com/hpcugent/easybuild-framework/pull/1256>`_, `#1270 <https://github.com/hpcugent/easybuild-framework/pull/1270>`_)

  * see ``--module-syntax`` configuration option and :ref:`module_syntax`

* deprecate ``log.error`` method in favor of raising ``EasyBuildError`` exception (`#1218 <https://github.com/hpcugent/easybuild-framework/pull/1218>`_)

  * see :ref:`depr_error_reporting`

* add support for using external modules as dependencies, and to provide metadata for external modules (`#1230 <https://github.com/hpcugent/easybuild-framework/pull/1230>`_, `#1265 <https://github.com/hpcugent/easybuild-framework/pull/1265>`_, `#1267 <https://github.com/hpcugent/easybuild-framework/pull/1267>`_)

  * see :ref:`using_external_modules`

* add experimental support for Cray toolchains on top of PrgEnv modules: ``CrayGNU``, ``CrayIntel``, ``CrayCCE`` (`#1234 <https://github.com/hpcugent/easybuild-framework/pull/1234>`_, `#1268 <https://github.com/hpcugent/easybuild-framework/pull/1268>`_)

  *  see https://github.com/hpcugent/easybuild/wiki/EasyBuild-on-Cray

* various other enhancements, including:

  * clear list of checksums when using ``--try-software-version`` (`#1169 <https://github.com/hpcugent/easybuild-framework/pull/1169>`_)
  * sort the results of searching for files (e.g., ``--search`` output) (`#1214 <https://github.com/hpcugent/easybuild-framework/pull/1214>`_)
  * enhance test w.r.t. use of templates in cfgfile (`#1217 <https://github.com/hpcugent/easybuild-framework/pull/1217>`_)
  * define '``%(DEFAULT_REPOSITORYPATH)s``' template for cfgfiles (see ``eb --avail-cfgfile-constants``) (`#1220 <https://github.com/hpcugent/easybuild-framework/pull/1220>`_)
  * also reset ``$LD_PRELOAD`` when running module commands, in case module defined ``$LD_PRELOAD`` (`#1222 <https://github.com/hpcugent/easybuild-framework/pull/1222>`_)
  * move location of '``module use``' statements in generated module file (*after* '``module load``' statements) (`#1232 <https://github.com/hpcugent/easybuild-framework/pull/1232>`_)
  * add support for ``--show-default-configfiles`` (`#1240 <https://github.com/hpcugent/easybuild-framework/pull/1240>`_)

    * see :ref:`default_configuration_files`

  * report error on missing configuration files, rather than ignoring them (`#1240 <https://github.com/hpcugent/easybuild-framework/pull/1240>`_)
  * clean up commit message used in easyconfig git repository (`#1248 <https://github.com/hpcugent/easybuild-framework/pull/1248>`_)
  * add ``--hide-deps`` configuration option to specify names of software that must be installed as hidden modules (`#1250 <https://github.com/hpcugent/easybuild-framework/pull/1250>`_)

    * see :ref:`hide_deps`

  * add support for appending/prepending to ``--robot-paths`` to avoid overwriting default robot search path (`#1252 <https://github.com/hpcugent/easybuild-framework/pull/1252>`_)

    * see :ref:`robot_search_path_prepend_append`

  * enable detection of use of unknown ``$EASYBUILD``-prefixed environment variables (`#1253 <https://github.com/hpcugent/easybuild-framework/pull/1253>`_)

    * see :ref:`configuration_env_vars`

  * add ``--installpath-modules`` and ``--installpath-software`` configuration options (`#1258 <https://github.com/hpcugent/easybuild-framework/pull/1258>`_)

    * see :ref:`installpath`

  * use dedicated subdirectory in temporary directory for each test to ensure better cleanup (`#1260 <https://github.com/hpcugent/easybuild-framework/pull/1260>`_)
  * get rid of ``$PROFILEREAD`` hack when running commands, not needed anymore (`#1264 <https://github.com/hpcugent/easybuild-framework/pull/1264>`_)

* various bug fixes, including:

  * make bootstrap script robust against having ``vsc-base`` already available in Python search path (`#1212 <https://github.com/hpcugent/easybuild-framework/pull/1212>`_, `#1215 <https://github.com/hpcugent/easybuild-framework/pull/1215>`_)
  * set default value for unpack_options easyconfig parameter to ``''``, so ``self.cfg.update`` works on it (`#1229 <https://github.com/hpcugent/easybuild-framework/pull/1229>`_)
  * also copy rotated log files (`#1238 <https://github.com/hpcugent/easybuild-framework/pull/1238>`_)
  * fix parsing of ``--download-timeout`` value (`#1242 <https://github.com/hpcugent/easybuild-framework/pull/1242>`_)
  * make ``test_XDG_CONFIG_env_vars`` unit test robust against existing user config file in default location (`#1259 <https://github.com/hpcugent/easybuild-framework/pull/1259>`_)
  * fix minor robustness issues w.r.t. ``$XDG_CONFIG*`` and ``$PYTHONPATH`` in unit tests (`#1262 <https://github.com/hpcugent/easybuild-framework/pull/1262>`_)
  * fix issue with handling empty toolchain variables (`#1263 <https://github.com/hpcugent/easybuild-framework/pull/1263>`_)

**easyblocks**

* replace '``log.error``' with '``raise EasyBuildError``' in all easyblocks (`#588 <https://github.com/hpcugent/easybuild-easyblocks/pull/588>`_)
* one new generic easyblock: ``ConfigureMakePythonPackage`` (`#540 <https://github.com/hpcugent/easybuild-easyblocks/pull/540>`_)
* new easyblocks for 2 software packages that require customized support:

  * TINKER (`#578 <https://github.com/hpcugent/easybuild-easyblocks/pull/578>`_), Xmipp (`#581 <https://github.com/hpcugent/easybuild-easyblocks/pull/581>`_)

* various other enhancements, including:

  * enhance WIEN2k easyblock for recent versions + cleanup (`#486 <https://github.com/hpcugent/easybuild-easyblocks/pull/486>`_)
  * define ``$PYTHONNOUSERSITE`` in PythonPackage easyblock so user-installed packages are not picked up (`#577 <https://github.com/hpcugent/easybuild-easyblocks/pull/577>`_)
  * add support in CP2K easyblock for building on top of MPICH/MPICH2 (`#579 <https://github.com/hpcugent/easybuild-easyblocks/pull/579>`_)
  * enhance Hadoop easyblock to support parallel builds (`#580 <https://github.com/hpcugent/easybuild-easyblocks/pull/580>`_)
  * drop ``-noroot`` for recent FLUENT versions, honor ``installopts``, enable ``-debug`` (`#582 <https://github.com/hpcugent/easybuild-easyblocks/pull/582>`_)
  * include ``prebuildopts`` in build command for Python packages (`#585 <https://github.com/hpcugent/easybuild-easyblocks/pull/585>`_)
  * also install ``rosetta_tools`` subdirectory for Rosetta (`#586 <https://github.com/hpcugent/easybuild-easyblocks/pull/586>`_)
  * update SLEPc easyblock for v3.5 + style cleanup (`#593 <https://github.com/hpcugent/easybuild-easyblocks/pull/593>`_)
  * minor fix in HPL easyblock w.r.t. checking defined environment variables (`#595 <https://github.com/hpcugent/easybuild-easyblocks/pull/595>`_)
  * tweak CP2K easyblock w.r.t. LAPACK/FFTW support (`#596 <https://github.com/hpcugent/easybuild-easyblocks/pull/596>`_)
  * minor update to GCC easyblock to support GCC v5.x (`#598 <https://github.com/hpcugent/easybuild-easyblocks/pull/598>`_)
  * update sanity check in R easyblock for version 3.2.0 (`#602 <https://github.com/hpcugent/easybuild-easyblocks/pull/602>`_)

* various bug fixes, including:

  * fix Score-P easyblock for compiler-only toolchains, include Qt as optional dependecy (`#552 <https://github.com/hpcugent/easybuild-easyblocks/pull/552>`_)
  * fix definition of ``$MKLROOT``, should be set to '``mkl``' subdir of install dir (`#576 <https://github.com/hpcugent/easybuild-easyblocks/pull/576>`_)
  * add ``-libmpichf90`` to list of MPI libraries in NWChem easyblock (`#584 <https://github.com/hpcugent/easybuild-easyblocks/pull/584>`_)
  * stop using '``$root``' to make easyblocks compatible with module files in Lua syntax (`#590 <https://github.com/hpcugent/easybuild-easyblocks/pull/590>`_)
  * also set ``$PYTHONPATH`` before installing Python package in temporary directory in ``test_step`` (`#591 <https://github.com/hpcugent/easybuild-easyblocks/pull/591>`_)
  * unset ``buildopts``/``installopts`` before installing Python extensions in Python easyblock (`#597 <https://github.com/hpcugent/easybuild-easyblocks/pull/597>`_)
  * allow not including vsc-base sources when installing EasyBuild (gets installed with easybuild-framework) (`#600 <https://github.com/hpcugent/easybuild-easyblocks/pull/600>`_)
  * use ``self.initial_environ`` rather than ``self.orig_environ`` in EasyBuildMeta easyblock (`#600 <https://github.com/hpcugent/easybuild-easyblocks/pull/600>`_)
  * make GCC easyblock compatible with ``--module-only`` by setting default value for ``self.platform_lib`` in constructor (`#603 <https://github.com/hpcugent/easybuild-easyblocks/pull/603>`_)


**easyconfigs**

* added example easyconfig files for **27** new software packages:

  * AFNI (`#1322 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1322>`_, `#1521 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1521>`_), BCFtools (`#1492 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1492>`_), getdp (`#1518 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1518>`_), gmsh (`#1518 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1518>`_), gtest (`#1244 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1244>`_), hanythingondemand (`#1530 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1530>`_), mawk (`#1369 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1369>`_), Minimac (`#815 <https://github.com/hpcugent/easybuild-easyconfigs/pull/815>`_), Minimac3 (`#1502 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1502>`_), monty (`#1548 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1548>`_), Octave (`#1563 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1563>`_), pbs_python (`#1530 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1530>`_), pigz (`#1036 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1036>`_), Pygments (`#1536 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1536>`_), pyhull (`#1539 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1539>`_), pymatgen (`#1549 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1549>`_), PyQt (`#1322 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1322>`_, `#1521 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1521>`_), Ray (`#1494 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1494>`_), requests (`#1536 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1536>`_), seqtk (`#1524 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1524>`_), SIP (`#1322 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1322>`_, `#1521 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1521>`_), S-Lang (`#1369 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1369>`_), Spark (`#1554 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1554>`_), spglib (`#1549 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1549>`_), TINKER (`#1465 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1465>`_), tmux (`#1369 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1369>`_), Xmipp (`#1489 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1489>`_)

* added easyconfigs for new (Cray-specific) toolchains (`#1538 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1538>`_): ``CrayGNU``, ``CrayIntel``, ``CrayCCE``

  * initially supported software (using CrayGNU toolchains): CP2K, GROMACS, HPL, Python + numpy/scipy, WRF (`#1558 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1558>`_)
  * see also https://github.com/hpcugent/easybuild/wiki/EasyBuild-on-Cray

* added new easyconfigs for existing toolchains: ``goolf/1.5.16``, ``intel/2014.06``
* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * including GCC v5.1.0, OpenFOAM v2.3.1, R v3.1.3 and v3.2.0, PETSc/SLEPc v3.5.3, WIEN2k v14.1

* various other enhancements, including:

  * include pbr dependency for lockfile Python extension in Python v2.7.9 easyconfigs + mock/pytz/pandas (`#1462 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1462>`_, `#1540 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1540>`_)
  * include SQLite as dependency in Python v2.7.9 easyconfigs (`#1468 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1468>`_)
  * set ``$LD_PRELOAD`` for Hoard and jemalloc (`#1470 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1470>`_)
  * fix homepage in SCOTCH easyconfigs (`#1485 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1485>`_)
  * adding missing six/ecdsa dependencies for dateutil/paramiko Python packages in Python easyconfigs (`#1504 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1504>`_, `#1505 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1505>`_, `#1506 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1506>`_, `#1507 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1507>`_, `#1508 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1508>`_, `#1509 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1509>`_, `#1510 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1510>`_)
  * enable ``pic`` toolchain option in expat easyconfigs (`#1562 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1562>`_)
  * extend list of source URLs for Bioconductor packages in R easyconfigs to include 'release' source URLs (`#1568 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1568>`_)

* various bug fixes, including:

  * adding missing zlib dependency in all Tcl easyconfig files (`#1344 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1344>`_)
  * fix homepage in FLUENT easyconfigs (`#1472 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1472>`_)
  * use ``--with-verbs`` rather than deprecated ``--with-openib`` in OpenMPI configure options (`#1511 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1511>`_)
  * stop relying on ``OS_NAME`` constant to specify OS dependencies in OpenMPI easyconfigs (`#1512 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1512>`_)
  * replace use of '``$root``' with '``%(installdir)s``' to ensure compatibility with module files in Lua syntax (`#1532 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1532>`_)
  * stop relying on '``$MKLROOT``' in ROOT easyconfigs (`#1537 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1537>`_)
  * use proper Bundle easyblock for biodeps/PRACE (`#1566 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1566>`_)
  * make source_urls in Cube and Scalasca easyconfigs compatible with --try-software-version (`#1574 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1574>`_)
  * add patch for Cube to fix configure script w.r.t. Qt dependency, add --without-java-reader configure option (`#1574 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1574>`_)

.. _release_notes_v2.0.0:

v2.0.0 (March 6th 2015)
-----------------------

feature + bugfix release

**framework**

* requires vsc-base v2.0.3 or more recent

  * avoid deprecation warnings w.r.t. use of ``message`` attribute (`vsc-base#155 <https://github.com/hpcugent/vsc-base/pull/155>`_)
  * fix typo in log message rendering ``--ignoreconfigfiles`` unusable (`vsc-base#158 <https://github.com/hpcugent/vsc-base/pull/158>`_)
* removed functionality that was deprecated for EasyBuild version 2.0 (`#1143 <https://github.com/hpcugent/easybuild-framework/pull//1143>`_)

  * see :ref:`removed_functionality`
  * the fix_broken_easyconfigs.py script can be used to update easyconfig files suffering from this (`#1151 <https://github.com/hpcugent/easybuild-framework/pull//1151>`_, `#1206 <https://github.com/hpcugent/easybuild-framework/pull//1206>`_, `#1207 <https://github.com/hpcugent/easybuild-framework/pull//1207>`_)
  * for more information about this script, see :ref:`fix_broken_easyconfigs_script`
* stop including a crippled copy of vsc-base, include vsc-base as a proper dependency instead (`#1160 <https://github.com/hpcugent/easybuild-framework/pull//1160>`_, `#1194 <https://github.com/hpcugent/easybuild-framework/pull//1194>`_)

  * vsc-base is automatically installed as a dependency for easybuild-framework, if a Python installation tool is used
  * see :ref:`required_python_packages`
* various other enhancements, including:

  * add support for Linux/POWER systems (`#1044 <https://github.com/hpcugent/easybuild-framework/pull//1044>`_)
  * major cleanup in ``tools/systemtools.py`` + significantly enhanced tests (`#1044 <https://github.com/hpcugent/easybuild-framework/pull//1044>`_)
  * add support for '``eb -a rst``', list available easyconfig parameters in ReST format (`#1131 <https://github.com/hpcugent/easybuild-framework/pull//1131>`_)
  * add support for specifying one or more easyconfigs in combination with ``--from-pr`` (`#1132 <https://github.com/hpcugent/easybuild-framework/pull//1132>`_)

    * see :ref:`from_pr_specifying_easyconfigs`
  * define ``__contains__`` in EasyConfig class (`#1155 <https://github.com/hpcugent/easybuild-framework/pull//1155>`_)
  * restore support for downloading over a proxy (`#1158 <https://github.com/hpcugent/easybuild-framework/pull//1158>`_)

    * i.e., use ``urllib2`` rather than ``urllib``
    * this involved sacrificing the download progress report (which was only visible in the log file)
  * let ``mpi_family`` return ``None`` if MPI is not supported by a toolchain (`#1164 <https://github.com/hpcugent/easybuild-framework/pull//1164>`_)
  * include support for specifying system-level configuration files for EasyBuild via ``$XDG_CONFIG_DIRS`` (`#1166 <https://github.com/hpcugent/easybuild-framework/pull//1166>`_)

    * see :ref:`default_configuration_files`
  * make unit tests more robust (`#1167 <https://github.com/hpcugent/easybuild-framework/pull//1167>`_, `#1196 <https://github.com/hpcugent/easybuild-framework/pull//1196>`_)

    * see :ref:`unit_tests`
  * add hierarchical module naming scheme categorizing modules by ``moduleclass`` (`#1176 <https://github.com/hpcugent/easybuild-framework/pull//1176>`_)
  * enhance bootstrap script to allow bootstrapping using supplied tarballs (`#1184 <https://github.com/hpcugent/easybuild-framework/pull//1184>`_)

    * see :ref:`bootstrap_advanced_options`
  * disable updating of Lmod user cache by default, add configuration option ``--update-modules-tool-cache`` (`#1185 <https://github.com/hpcugent/easybuild-framework/pull//1185>`_)

    * for now, only the Lmod user cache can be updated using ``--update-modules-tool-cache``
  * use available ``which()`` function, rather than running '``which``' via ``run_cmd`` (`#1192 <https://github.com/hpcugent/easybuild-framework/pull//1192>`_)
  * fix ``install-EasyBuild-develop.sh`` script w.r.t. vsc-base dependency (`#1193 <https://github.com/hpcugent/easybuild-framework/pull//1193>`_)
  * also consider robot search path when looking for specified easyconfigs (`#1201 <https://github.com/hpcugent/easybuild-framework/pull//1201>`_)

    * see :ref:`specifying_easyconfigs`
* various bug fixes, including:

  * stop triggering deprecated/no longer support functionality in unit tests (`#1126 <https://github.com/hpcugent/easybuild-framework/pull//1126>`_)
  * fix ``from_pr`` test by including dummy easyblocks for HPL and ScaLAPACK (`#1133 <https://github.com/hpcugent/easybuild-framework/pull//1133>`_)
  * escape use of '``%``' in string with command line options with ``--job`` (`#1135 <https://github.com/hpcugent/easybuild-framework/pull//1135>`_)
  * fix handling specified patch level 0 (+ enhance tests for fetch_patches method) (`#1139 <https://github.com/hpcugent/easybuild-framework/pull//1139>`_)
  * fix formatting issues in generated easyconfig file obtained via ``--try-X`` (`#1144 <https://github.com/hpcugent/easybuild-framework/pull//1144>`_)
  * use ``log.error`` in ``tools/toolchain/toolchain.py`` where applicable (`#1145 <https://github.com/hpcugent/easybuild-framework/pull//1145>`_)
  * stop hardcoding ``/tmp`` in ``mpi_cmd_for`` function (`#1146 <https://github.com/hpcugent/easybuild-framework/pull//1146>`_, `#1200 <https://github.com/hpcugent/easybuild-framework/pull//1200>`_)
  * correctly determine variable name for ``$EBEXTLIST`` when generating module file (`#1156 <https://github.com/hpcugent/easybuild-framework/pull//1156>`_)
  * do not ignore exit code of failing postinstall commands (`#1157 <https://github.com/hpcugent/easybuild-framework/pull//1157>`_)
  * fix rare case in which used easyconfig and copied easyconfig are the same (`#1159 <https://github.com/hpcugent/easybuild-framework/pull//1159>`_)
  * always filter hidden deps from list of dependencies (`#1161 <https://github.com/hpcugent/easybuild-framework/pull//1161>`_)
  * fix implementation of ``path_matches`` function in ``tools/filetools.py`` (`#1163 <https://github.com/hpcugent/easybuild-framework/pull//1163>`_)
  * make sure plain text keyring is used by unit tests (`#1165 <https://github.com/hpcugent/easybuild-framework/pull//1165>`_)
  * suppress creation of module symlinks for ``HierarchicalMNS`` (`#1173 <https://github.com/hpcugent/easybuild-framework/pull//1173>`_)
  * sort all lists obtained via ``glob.glob``, since they are in arbitrary order (`#1187 <https://github.com/hpcugent/easybuild-framework/pull//1187>`_)
  * stop modifying ``$MODULEPATH`` directly in ``setUp``/``tearDown`` of toolchain tests (`#1191 <https://github.com/hpcugent/easybuild-framework/pull//1191>`_)

**easyblocks**

* one new generic easyblock for installing a bundle of modules: ``Bundle`` (`#550 <https://github.com/hpcugent/easybuild-easyblocks/pull/550>`_)

  * and let the ``Toolchain`` generic easyblock derive from ``Bundle``
* new easyblocks for 2 software packages that require customized support:

  * GAMESS-US (`#470 <https://github.com/hpcugent/easybuild-easyblocks/pull/470>`_, `#544 <https://github.com/hpcugent/easybuild-easyblocks/pull/544>`_, `#558 <https://github.com/hpcugent/easybuild-easyblocks/pull/558>`_), Hadoop (`#563 <https://github.com/hpcugent/easybuild-easyblocks/pull/563>`_)
* various other enhancements, including:

  * move support for ``staged_install`` from CPLEX easyblock to generic ``Binary`` easyblock (`#502 <https://github.com/hpcugent/easybuild-easyblocks/pull/502>`_)
  * fix sanity check in picard easyblock for v1.119 that doesn't include ``sam.jar`` (`#522 <https://github.com/hpcugent/easybuild-easyblocks/pull/522>`_)
  * log warning message when unlinking jellyfish symlink fails in Trinity easyblock (`#534 <https://github.com/hpcugent/easybuild-easyblocks/pull/534>`_)
  * revamp ``EB_libint2`` easyblock into ``EB_Libint`` that works for both Libint v1x and v2.x (`#536 <https://github.com/hpcugent/easybuild-easyblocks/pull/536>`_)
  * update CP2K easyblock for recent versions (no more '``fes``') (`#537 <https://github.com/hpcugent/easybuild-easyblocks/pull/537>`_)
  * update SuiteSparse easyblock for recent versions (`#541 <https://github.com/hpcugent/easybuild-easyblocks/pull/541>`_)
  * fix easyblock unit tests after dropping support for deprecated behaviour in framework (`#543 <https://github.com/hpcugent/easybuild-easyblocks/pull/543>`_)
  * rework PSI easyblock to support future releases (`#545 <https://github.com/hpcugent/easybuild-easyblocks/pull/545>`_)
  * enable always generating a 'verbose' Makefile in the generic CMakeMake easyblock (`#546 <https://github.com/hpcugent/easybuild-easyblocks/pull/546>`_)
  * remove functionality in (generic) easyblocks that was deprecated for EasyBuild v2.0 (`#547 <https://github.com/hpcugent/easybuild-easyblocks/pull/547>`_)
  * enhance generic RPackage easyblock to support installing extensions in a separate prefix (`#551 <https://github.com/hpcugent/easybuild-easyblocks/pull/551>`_)
  * deprecate GenomeAnalysisTK easyblock, since it's basically equivalent to Tarball (`#557 <https://github.com/hpcugent/easybuild-easyblocks/pull/557>`_)
  * update SAMtools easyblock for v1.2 (`#562 <https://github.com/hpcugent/easybuild-easyblocks/pull/562>`_)
  * take ``preconfigopts`` easyconfig parameter into account in ROOT easyblock (`#566 <https://github.com/hpcugent/easybuild-easyblocks/pull/566>`_)
  * update easyblock for installing EasyBuild

    * to support bootstrapping with provided source tarballs (`#559 <https://github.com/hpcugent/easybuild-easyblocks/pull/559>`_)

    * to also cover vsc-base dependency, and verify ``easy-install.pth`` (`#567 <https://github.com/hpcugent/easybuild-easyblocks/pull/567>`_)
  * update disabling sanitizer tests for Clang 3.6 (`#570 <https://github.com/hpcugent/easybuild-easyblocks/pull/570>`_)
* various bug fixes, including:
  * fix handling of LTO in GCC easyblock (`#535 <https://github.com/hpcugent/easybuild-easyblocks/pull/535>`_)
  * relocate FDTD RPM to fix installation on SL6 (`#538 <https://github.com/hpcugent/easybuild-easyblocks/pull/538>`_)

**easyconfigs**

* added example easyconfig files for **29** new software packages:

  * bsoft (`#1353 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1353>`_), Coot (`#1400 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1400>`_), Cuby (`#1258 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1258>`_), DSRC (`#1242 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1242>`_), Exonerate (`#568 <https://github.com/hpcugent/easybuild-easyconfigs/pull/568>`_), fastqz (`#1242 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1242>`_), FSA (`#568 <https://github.com/hpcugent/easybuild-easyconfigs/pull/568>`_), fqzcomp (`#1242 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1242>`_), GAMESS-US (`#1153 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1153>`_, `#1406 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1406>`_), Grep (`#1308 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1308>`_), Hadoop (`#1418 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1418>`_), Hoard (`#1415 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1415>`_), IMB (`#1284 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1284>`_), ISL (`#1389 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1389>`_), jemalloc (`#1416 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1416>`_), libdwarf (`#1283 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1283>`_), libelf (`#1283 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1283>`_), MPC (`#1310 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1310>`_), multitail (`#1327 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1327>`_), Pmw (`#1403 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1403>`_), Quip (`#1242 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1242>`_), rCUDA (`#720 <https://github.com/hpcugent/easybuild-easyconfigs/pull/720>`_), SCALCE (`#1242 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1242>`_), SMALT (`#568 <https://github.com/hpcugent/easybuild-easyconfigs/pull/568>`_), STREAM (`#1332 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1332>`_), worker (`#1307 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1307>`_), Xerces-C++ (`#1370 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1370>`_), XQilla (`#1370 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1370>`_), ZPAQ (`#1242 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1242>`_)
* added easyconfigs for new (common) toolchains

  * ``foss/2015a`` (`#1239 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1239>`_), ``gompi/1.5.16`` (`#1380 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1380>`_), ``gmvolf/1.7.20`` (`#1397 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1397>`_), ``goolf/1.7.20`` (`#1294 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1294>`_), intel/2015a (`#1238 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1238>`_), ``intel/2015.02`` (`#1393 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1393>`_), ``iomkl/2015.01`` (`#1325 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1325>`_), ``iomkl/2015.02`` (`#1401 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1401>`_)
* added new software bundle: ``Autotools`` (`#1385 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1385>`_)
* various other enhancements, including:

  * don't define ``$LDSHARED`` in zlib easyconfigs (`#1350 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1350>`_)

    * this fixes the long-standing "``no version information available``" issue with zlib
    * see also `framework#108 <https://github.com/hpcugent/easybuild-framework/issues/108>`_
  * add unit test to check that all ``extra_options`` keys are defined in ``EasyConfig`` instance (`#1378 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1378>`_)
  * add source MD5 checksums in all GCC easyconfigs (`#1391 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1391>`_)
  * speeding up the unit tests by avoiding rereading of same easyconfig file (`#1432 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1432>`_)
  * fix conflict detection in unit tests by considering build deps separately from runtime deps (`#1447 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1447>`_)
  * fix toolchain for Bison build dep in ``MVAPICH2-1.9-iccifort-2011.13.367.eb`` easyconfig (`#1448 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1448>`_)
  * use ``Bundle`` generic easyblock for HPCBIOS bundles and fix ``moduleclass`` (`#1451 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1451>`_)
* various bug fixes, including:

  * revert version of Libint dependency to 1.1.4 in CP2K v2.5.1 easyconfig (`#1144 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1144>`_)
  * added Java dependencies to EMBOSS easyconfigs (`#1167 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1167>`_)
  * don't list '``lto``' as a language in GCC easyconfigs (`#1286 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1286>`_)

    * related to the fixes in the GCC easyblock, see `easyblocks#535 <https://github.com/hpcugent/easybuild-easyblocks/pull/535>`_
  * rename libint2 easyconfigs as Libint v2 easyconfigs (`#1287 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1287>`_)
  * fix mpi4py ``source_urls`` in Python easyconfigs (`#1306 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1306>`_)
  * consistently use CLooG 0.18.0 for GCC 4.8 series (`#1392 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1392>`_)
  * rename GenomeAnalysisTk easyconfigs to GATK (`#1399 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1399>`_)
  * include ``openssl-devel`` SLES11 OS dependency in cURL/MySQL/Python easyconfigs (`#1422 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1422>`_)
  * add missing Perl dependency in parallel easyconfigs (`#1430 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1430>`_)
  * correct name in BLAST+ easyconfigs (`#1443 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1443>`_)
  * fix name for sparsehash easyconfigs (`#1452 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1452>`_)


v1.16.2 (March 6th 2015)
------------------------

bugfix release

**framework**

`(no changes compared to v1.16.1, simple version bump to stay in sync with easybuild-easyblocks)`

**easyblocks**

* make ``EB_EasyBuildMeta`` easyblock aware of vsc-base to make upgrading to EasyBuild v2.0.0 possible (`#573 <https://github.com/hpcugent/easybuild-easyblocks/pull/573>`_)

**easyconfigs**

`(no changes compared to v1.16.1, simple version bump to stay in sync with easybuild-easyblocks)`

v1.16.1 (December 19th 2014)
----------------------------

bugfix release

**framework**

* fix functionality that is broken with ``--deprecated=2.0`` or with ``$EASYBUILD_DEPRECATED=2.0``

  * don't include easyconfig parameters for ``ConfigureMake`` in ``eb -a``, since fallback is deprecated (`#1123 <https://github.com/hpcugent/easybuild-framework/pull/1123>`_)
  * correctly check software_license value type (`#1124 <https://github.com/hpcugent/easybuild-framework/pull/1124>`_)
  * fix ``generate_software_list.py`` script w.r.t. deprecated fallback to ``ConfigureMake`` (`#1127 <https://github.com/hpcugent/easybuild-framework/pull/1127>`_)

* other bug fixes

  * fix logging issues in tests, sync with vsc-base v2.0.0 (`#1120 <https://github.com/hpcugent/easybuild-framework/pull/1120>`_)

**easyblocks**

* fix EasyBuild versions for which ``$EASYBUILD_DEPRECATED=1.0`` is set in EasyBuild sanity check (`#531 <https://github.com/hpcugent/easybuild-easyblocks/pull/531>`_)

**easyconfigs**

* set default easyblock to ConfigureMake in TEMPLATE.eb (`#1277 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1277>`_)

v1.16.0 (December 18th 2014)
----------------------------

feature + bugfix release

**framework**

* deprecate automagic fallback to ``ConfigureMake`` easyblock (`#1113 <https://github.com/hpcugent/easybuild-framework/pull/1113>`_)

  * easyconfigs should specify ``easyblock = 'ConfigureMake'`` instead of relying on the fallback mechanism
  * **note: automagic fallback to** ``ConfigureMake`` **easyblock will be removed in EasyBuild v2.0**
  * see also `Automagic fallback to ConfigureMake <http://easybuild.readthedocs.org/en/latest/Deprecated-functionality.html#configuremake-fallback>`_

* stop triggering deprecated functionality, to enable use of ``--deprecated=2.0`` (`#1107 <https://github.com/hpcugent/easybuild-framework/pull/1107>`_, `#1115 <https://github.com/hpcugent/easybuild-framework/pull/1115>`_, `#1119 <https://github.com/hpcugent/easybuild-framework/pull/1119>`_)

  * see `Deprecated functionality <http://easybuild.readthedocs.org/en/latest/Deprecated-functionality.html#configuremake-fallback>`_ for more information

* various other enhancements, including:

  * add script to clean up gists created via ``--upload-test-report`` (`#958 <https://github.com/hpcugent/easybuild-framework/pull/958>`_)
  * also use ``-xHost`` when using Intel compilers on AMD systems (as opposed to ``-msse3``) (`#960 <https://github.com/hpcugent/easybuild-framework/pull/960>`_)
  * add Python version check in ``eb`` command (`#1046 <https://github.com/hpcugent/easybuild-framework/pull/1046>`_)
  * take ``versionprefix`` into account in ``HierarchicalMNS`` module naming scheme (`#1058 <https://github.com/hpcugent/easybuild-framework/pull/1058>`_)
  * clean up and refactor ``main.py``, move functionality to other modules (`#1059 <https://github.com/hpcugent/easybuild-framework/pull/1059>`_, `#1064 <https://github.com/hpcugent/easybuild-framework/pull/1064>`_, `#1075 <https://github.com/hpcugent/easybuild-framework/pull/1075>`_, `#1087 <https://github.com/hpcugent/easybuild-framework/pull/1087>`_)
  * add check in ``download_file`` function for HTTP return code + show download progress report (`#1066 <https://github.com/hpcugent/easybuild-framework/pull/1066>`_, `#1090 <https://github.com/hpcugent/easybuild-framework/pull/1090>`_)
  * include info log message with name and location of used easyblock (`#1069 <https://github.com/hpcugent/easybuild-framework/pull/1069>`_)
  * add toolchains definitions for ``gpsmpi``, ``gpsolf``, ``impich``, ``intel-para``, ``ipsmpi`` toolchains (`#1072 <https://github.com/hpcugent/easybuild-framework/pull/1072>`_, `#1073 <https://github.com/hpcugent/easybuild-framework/pull/1073>`_)

    * support for Parastation MPI based toolchains

  * enforce that ``hiddendependencies`` is a subset of ``dependencies`` (`#1078 <https://github.com/hpcugent/easybuild-framework/pull/1078>`_)

    * this is done to avoid that site-specific policies w.r.t. hidden modules slip into contributed easyconfigs

  * enable use of ``--show_hidden`` for ``avail`` subcommand with recent Lmod versions (`#1081 <https://github.com/hpcugent/easybuild-framework/pull/1081>`_)
  * add ``--robot-paths`` configure option (`#1080 <https://github.com/hpcugent/easybuild-framework/pull/1080>`_, `#1093 <https://github.com/hpcugent/easybuild-framework/pull/1093>`_, `#1095 <https://github.com/hpcugent/easybuild-framework/pull/1095>`_,  `#1114 <https://github.com/hpcugent/easybuild-framework/pull/1114>`_)
  * support use of ``%(DEFAULT_ROBOT_PATHS)s`` template in EasyBuild configuration files (`#1100 <https://github.com/hpcugent/easybuild-framework/pull/1100>`_)

    * see also `Controlling the robot search path <http://easybuild.readthedocs.org/en/latest/Using_the_EasyBuild_command_line.html#controlling-the-robot-search-path>`_

  * use ``-xHost`` rather than ``-xHOST``, to match Intel documentation (`#1084 <https://github.com/hpcugent/easybuild-framework/pull/1084>`_)
  * update and cleanup ``README`` file (`#1085 <https://github.com/hpcugent/easybuild-framework/pull/1085>`_)
  * deprecate ``self.moduleGenerator`` in favor of ``self.module_generator`` in ``EasyBlock`` (`#1088 <https://github.com/hpcugent/easybuild-framework/pull/1088>`_)
  * also support ``MPICH`` MPI family in ``mpi_cmd_for`` function (`#1098 <https://github.com/hpcugent/easybuild-framework/pull/1098>`_)
  * update documentation references to point to http://easybuild.readthedocs.org (`#1102 <https://github.com/hpcugent/easybuild-framework/pull/1102>`_)
  * check for OS dependencies with *both* ``rpm`` and ``dpkg`` (if available) (`#1111 <https://github.com/hpcugent/easybuild-framework/pull/1111>`_)


* various bug fixes, including:

  * fix picking required software version specified by ``--software-version`` and clean up ``tweak.py`` (`#1062 <https://github.com/hpcugent/easybuild-framework/pull/1062>`_, `#1063 <https://github.com/hpcugent/easybuild-framework/pull/1063>`_)
  * escape ``$`` characters in module load message specified via ``modloadmsg`` easyconfig parameter) (`#1068 <https://github.com/hpcugent/easybuild-framework/pull/1068>`_)
  * take available hidden modules into account in dependency resolution (`#1065 <https://github.com/hpcugent/easybuild-framework/pull/1065>`_)
  * fix hard crash when using patch files with an empty list of sources (`#1070 <https://github.com/hpcugent/easybuild-framework/pull/1070>`_)
  * fix Intel MKL BLACS library being used for MPICH/MPICH2-based toolchains (`#1072 <https://github.com/hpcugent/easybuild-framework/pull/1072>`_)
  * fix regular expression in ``fetch_parameter_from_easyconfig_file`` function (`#1096 <https://github.com/hpcugent/easybuild-framework/pull/1096>`_)
  * don't hardcode queue names when submitting a job (`#1106 <https://github.com/hpcugent/easybuild-framework/pull/1106>`_)
  * fix affiliation/mail address for Fotis in headers (`#1105 <https://github.com/hpcugent/easybuild-framework/pull/1105>`_)
  * filter out ``/dev/null`` entries in patch file in ``det_patched_files`` function (`#1108 <https://github.com/hpcugent/easybuild-framework/pull/1108>`_)
  * fix ``gmpolf`` toolchain definition, to have ``gmpich`` as MPI components (instead of ``gmpich2``) (`#1101 <https://github.com/hpcugent/easybuild-framework/pull/1101>`_)

    * 'MPICH' refers to MPICH v3.x, while MPICH2 refers to MPICH(2) v2.x (MPICH v1.x is ancient/obsolete)
    * **note**: this requires to reinstall the ``gmpolf`` module, using the updated easyconfig from `easybuild-easyconfigs#1217 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1217>`_

**easyblocks**

* new easyblocks for **2** software packages that requires customized support:

  * Chimera (`#524 <https://github.com/hpcugent/easybuild-easyblocks/pull/524>`_), GATE (`#518 <https://github.com/hpcugent/easybuild-easyblocks/pull/518>`_)

* fix use of deprecated functionality, enhance unit tests to check for it (`#523 <https://github.com/hpcugent/easybuild-easyblocks/pull/523>`_)

* various other enhancements, including:

  * update PETSc easyblock for recent versions (v3.5) (`#446 <https://github.com/hpcugent/easybuild-easyblocks/pull/446>`_)
  * only include major/minor version numbers for FLUENT subdir (`#480 <https://github.com/hpcugent/easybuild-easyblocks/pull/480>`_)
  * factor out 'move after install' code from impi easyblock to ``IntelBase``, use it for itac (`#487 <https://github.com/hpcugent/easybuild-easyblocks/pull/487>`_)
  * support custom easyconfig parameters in ``EB_impi`` easyblock to correct behavior of MPI wrapper commands (`#493 <https://github.com/hpcugent/easybuild-easyblocks/pull/493>`_)
  * consider both ``lib`` and ``lib64`` in sanity check for GROMACS (`#501 <https://github.com/hpcugent/easybuild-easyblocks/pull/501>`_)
  * take ``preinstallopts`` and ``installopts`` into account in ``Binary`` easyblock (`#503 <https://github.com/hpcugent/easybuild-easyblocks/pull/503>`_)
  * add sanity check command ``abaqus information=all`` for ABAQUS (`#504 <https://github.com/hpcugent/easybuild-easyblocks/pull/504>`_)
  * update and clean up ``README``, refer to http://easybuild.readthedocs.org documentation (`#505 <https://github.com/hpcugent/easybuild-easyblocks/pull/505>`_, `#516 <https://github.com/hpcugent/easybuild-easyblocks/pull/516>`_)
  * rename deprecated ``self.moduleGenerator`` to ``self.module_generator`` (`#506 <https://github.com/hpcugent/easybuild-easyblocks/pull/506>`_)

    * see also `easybuild-framework#1088 <https://github.com/hpcugent/easybuild-easyblocks/pull/1088>`_

  * check whether specified ``type`` value is a known value (``psmp`` or ``popt``) in CP2K easyblock (`#509 <https://github.com/hpcugent/easybuild-easyblocks/pull/509>`_)
  * add support to ``SAMtools`` easyblock for installing recent versions (v1.x) (`#512 <https://github.com/hpcugent/easybuild-easyblocks/pull/512>`_)
  * fix version check + sanity check in Geant4 easyblock + style fixes (`#517 <https://github.com/hpcugent/easybuild-easyblocks/pull/517>`_)
  * added ``$root/modlib`` to ``$PYTHONPATH`` guesses in Modeller easyblock (`#525 <https://github.com/hpcugent/easybuild-easyblocks/pull/525>`_)
  * mark ``license`` custom easyconfig parameter as deprecated in ``IntelBase`` (`#527 <https://github.com/hpcugent/easybuild-easyblocks/pull/527>`_)

* various bug fixes, including:

  * fix Libxc version check in CP2K easyblock (`#478 <https://github.com/hpcugent/easybuild-easyblocks/pull/478>`_)
  * correctly specify ``mkl_libs`` when building *numpy* with GCC and imkl (`#485 <https://github.com/hpcugent/easybuild-easyblocks/pull/485>`_)
  * extend noqa for OpenFOAM-Extend in build_step (`#488 <https://github.com/hpcugent/easybuild-easyblocks/pull/488>`_, `#520 <https://github.com/hpcugent/easybuild-easyblocks/pull/520>`_)
  * correctly set ``$LD_LIBRARY_PATH``, ``$LIBRARY_PATH`` and ``$PKG_CONFIG_PATH`` for ``R`` (`#495 <https://github.com/hpcugent/easybuild-easyblocks/pull/495>`_)
  * fix default value for ``files_to_copy`` in ``MakeCp`` easyblock (`#500 <https://github.com/hpcugent/easybuild-easyblocks/pull/500>`_)
  * treat ``MPICH`` MPI family as MPICH v3.x instead of MPICH v1.x (`#519 <https://github.com/hpcugent/easybuild-easyblocks/pull/519>`_)

    * see also `easybuild-framework#1112 <https://github.com/hpcugent/easybuild-easyblocks/pull/1112>`_

  * fix affiliation/mail address for Fotis in headers (`#521 <https://github.com/hpcugent/easybuild-easyblocks/pull/521>`_)
  * clean up in ``extra_options`` methods, avoid casting return value to ``dict`` or returning via parent (`#528 <https://github.com/hpcugent/easybuild-easyblocks/pull/528>`_)

**easyconfigs**

* added example easyconfig files for **39** new software packages:

  * ANTs (`#1232 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1232>`_), BEOPS (`#1264 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1264>`_), Chhimera (`#1255 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1255>`_), ctffind (`#1249 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1249>`_), DBD-SQLite (`#1064 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1064>`_), DBD-mysql (`#1063 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1063>`_), DIALIGN-TX (`#668 <https://github.com/hpcugent/easybuild-easyconfigs/pull/668>`_), ffmpeg (`#1088 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1088>`_), GObject-Introspection (`#1079 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1079>`_), GTS (`#1079 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1079>`_), Graphviz (`#1079 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1079>`_), GraphViz2 (`#1079 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1079>`_), grace (`#1131 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1131>`_), HarfBuzz (`#1079 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1079>`_), HTSlib (`#1161 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1161>`_), GSSAPI (`#1048 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1048>`_), Kerberos_V5 (`#1048 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1048>`_), libevent (`#1063 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1063>`_), libXdmcp (`#1129 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1129>`_), libXft (`#1017 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1017>`_), libXinerama (`#1017 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1017>`_), libXrender (`#1017 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1017>`_), Maven (`#1094 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1094>`_), MySQL (`#1063 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1063>`_), Net-LibIDN (`#1060 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1060>`_), OpenCV (`#1088 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1088>`_), OpenMD (`#1105 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1105>`_), Qhull (`#1105 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1105>`_), Pango (`#1079 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1079>`_), psmpi (`#1245 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1245>`_, `#1246 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1246>`_), RELION (`#1017 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1017>`_), renderproto (`#1017 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1017>`_), rjags (`#1125 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1125>`_), runjags (`#1125 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1125>`_), SPRNG (`#1138 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1138>`_, `#1141 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1141>`_), xineramaproto (`#1017 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1017>`_), XML-Dumper (`#1061 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1061>`_), XML-Parser (`#1061 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1061>`_), XML-Twig (`#1061 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1061>`_)

* added easyconfigs for new toolchains

  * ``intel/2014.10`` & ``intel/2014.11`` (`#1219 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1219>`_), ``intel-para/2014.12`` (`#1246 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1246>`_), ``gpsolf/2014.12`` (`#1245 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1245>`_), ``iompi/6.6.4`` (`#1215 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1215>`_)

* include ``easyblock = 'ConfigureMake'`` in relevant easyconfigs to deal with deprecation of automagic fallback to ``ConfigureMake`` (`#1248 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1248>`_)

  * see also `easybuild-framework#1113 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1113>`_ and `Automagic fallback to ConfigureMake <http://easybuild.readthedocs.org/en/latest/Deprecated-functionality.html#configuremake-fallback>`_

* clean up use of deprecated functionality in existing easyconfigs (`#1252 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1252>`_, `#1259 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1259>`_)

  * stop using deprecated ``makeopts``, ``premakeopts`` and ``shared_lib_ext``
  * check for use of deprecated functionality in easyconfigs unit tests
  * see also http://easybuild.readthedocs.org/en/latest/Deprecated-functionality.html#easyconfig-parameters

* various other enhancements, including:

  * also build ``fftw3_threads`` libraries, and enhance sanity checks (`#1013 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1013>`_)
  * add unit test to verify specified ``sanity_check_paths`` (`#1119 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1119>`_)
  * update and clean up ``README``, refer to http://easybuild.readthedocs.org documentation (`#1184 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1184>`_, `#1224 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1224>`_)

* various bug fixes, including:

  * fix unit tests w.r.t. changes in framework (`#1146 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1146>`_)
  * remove unnecessary build dependencies for OpenMPI (`#1168 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1168>`_)
  * remove duplicate line in OpenMPI easyconfigs (`#1207 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1207>`_)
  * fix affiliation/mail address for Fotis in headers (`#1237 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1237>`_)
  * fix permissions of easyconfig files for consistency (`#1210 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1210>`_)
  * disable symbol lookup feature in cairo to fix build on SL6 (`#1241 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1241>`_)
  * fix easyconfig ``gmpolf`` toolchain w.r.t. MPICH software name (`#1217 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1217>`_)

    * see also `easybuild-framework#1112 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1112>`_

  * fix ``source_urls`` for WRF and WPS (`#1225 <h`ttps://github.com/hpcugent/easybuild-easyconfigs/pull/1225>`_)
  * fix and clean up GATE easyconfigs (`#1228 <h`ttps://github.com/hpcugent/easybuild-easyconfigs/pull/1228>`_)
  * fix broken CLHEP builds by including ``-gcc`` in ``$CXXFLAGS`` (`#1254 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1254>`_)
  * add patch to fix broken test in Go (`#1257 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1257>`_)
  * fix name of GMAP easyconfigs, should be GMAP-GSNAP (`#1268 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1268>`_)
  * fix easyconfig filenames, enhance unit test to check easyconfig filenames (`#1271 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1271>`_)


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

* only disable sanitizer tests for recent Clang versions (`#481 <https://github.com/hpcugent/easybuild-easyblocks/pull/481>`_, `#482 <https://github.com/hpcugent/easybuild-easyblocks/pull/482>`_)
* pass down installopts to CUDA install command (`#483 <https://github.com/hpcugent/easybuild-easyblocks/pull/483>`_)

**easyconfigs**

* disable parallel build for slalib (`#968 <https://github.com/hpcugent/easybuild-easyconfigs/pull/968>`_)
* fix compatibility of goolfc with HierarchicalMNS by using GCC toolchain for installing CUDA (`#1106 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1106>`_, `#1115 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1115>`_)
* fix zlib OS dependency spec for Debian in Boost easyconfigs (`#1109 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1109>`_)
* fix compatibility of gimkl with HierarchicalMNS by using gimpi subtoolchain (`#1110 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1110>`_)
* make both GCC and Clang first-class members in Clang-based toolchains to fix compatibility with HierarchicalMNS (`#1113 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1113>`_)

v1.15.1 (September 23rd 2014)
-----------------------------

bugfix release

**framework**

* take into account that multiple modules may be extending ``$MODULEPATH`` with the same path, when determining path to top of module tree (see `#1047 <https://github.com/hpcugent/easybuild-framework/pull/1047>`_)

  * this bug caused a load statement for either ``icc`` or ``ifort`` to be included in higher-level modules installed with an Intel-based compiler toolchain, under the ``HierarchicalMNS`` module naming scheme

* make ``HierarchicalMNS`` module naming scheme compatible with ``cgoolf`` and ``goolfc`` toolchain (`#1049 <https://github.com/hpcugent/easybuild-framework/pull/1049>`_)
* add definition of ``iompi`` (sub)toolchain to make ``iomkl`` toolchain compatible with ``HierarchicalMNS`` (`#1049 <https://github.com/hpcugent/easybuild-framework/pull/1049>`_)

**easyblocks**

`(no changes compared to v1.15.0, simple version bump to stay in sync with easybuild-framework)`

**easyconfigs**

* minor bug fixes, including:

  * use SHLIB_EXT in GMP/MPFR easyconfigs (`#1090 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1090>`_)
  * fix TopHat homepage and source_urls since page moved (`#1092 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1092>`_)
  * make iomkl toolchain compatible with HierarchicalMNS (`#1099 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1099>`_)

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

  * Modeller (`#392 <https://github.com/hpcugent/easybuild-easyblocks/pull/392>`_), NAMD (`#397 <https://github.com/hpcugent/easybuild-easyblocks/pull/397>`_)

* various enhancements, including:

  * fix locale used for running Perl unit tests (`#425 <https://github.com/hpcugent/easybuild-easyblocks/pull/425>`_)
  * fix Rmpi easyblock to correctly configure for Intel MPI (`#435 <https://github.com/hpcugent/easybuild-easyblocks/pull/435>`_)
  * add support in generic Rpackage easyblock for handling patches (`#435 <https://github.com/hpcugent/easybuild-easyblocks/pull/435>`_)
  * enhance OpenFOAM easyblock: fix building MPI build of Pstream and (pt)scotchDecomp + overall cleanup (`#436 <https://github.com/hpcugent/easybuild-easyblocks/pull/436>`_)
  * enhance NWChem easyblock for version 6.3, clean up running of test cases (`#441 <https://github.com/hpcugent/easybuild-easyblocks/pull/441>`_)
  * enhance noqa for interactive configuration of Qt build procedure (`#447 <https://github.com/hpcugent/easybuild-easyblocks/pull/447>`_)
  * add custom sanity check for R in easyblock (`#449 <https://github.com/hpcugent/easybuild-easyblocks/pull/449>`_)
  * make perlmodule take into account ``(pre){config,build,install}opts`` (`#450 <https://github.com/hpcugent/easybuild-easyblocks/pull/450>`_)
  * add support for specifying an activation key after installing Mathematica (`#452 <https://github.com/hpcugent/easybuild-easyblocks/pull/452>`_)
  * consider both ``lib`` and ``lib64`` directories in netCDF sanity check (`#453 <https://github.com/hpcugent/easybuild-easyblocks/pull/453>`_)
  * fix sanity check for ANSYS for v15.0.x (`#458 <https://github.com/hpcugent/easybuild-easyblocks/pull/458>`_)
  * fix Trilinos easyblock for recent version (`#462 <https://github.com/hpcugent/easybuild-easyblocks/pull/462>`_)
  * enhance impi easyblock to handle install subdir for impi v5.0.1 and future version (`#465 <https://github.com/hpcugent/easybuild-easyblocks/pull/465>`_, `#472 <https://github.com/hpcugent/easybuild-easyblocks/pull/472>`_)
  * include $CFLAGS in linker flags for HPL (`#466 <https://github.com/hpcugent/easybuild-easyblocks/pull/466>`_)
  * update sanity test checks for GROMACS 5.x (`#471 <https://github.com/hpcugent/easybuild-easyblocks/pull/471>`_)

* various bug fixes:

  * fix building of FFTW wrappers for Intel MKL v11.1.x + cleanup of imkl easyblock (`#445 <https://github.com/hpcugent/easybuild-easyblocks/pull/445>`_)

**easyconfigs**

* added example easyconfig files for **13** new software packages:

  * Circos (`#780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/780>`_), DB_File (`#913 <https://github.com/hpcugent/easybuild-easyconfigs/pull/913>`_), Emacs (`#970 <https://github.com/hpcugent/easybuild-easyconfigs/pull/970>`_), evmix (`#1077 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1077>`_), GD (`#780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/780>`_), gsl (`#1077 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1077>`_), IOR (`#949 <https://github.com/hpcugent/easybuild-easyconfigs/pull/949>`_), JAGS (`#1076 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1076>`_),
    libgd (`#780 <https://github.com/hpcugent/easybuild-easyconfigs/pull/780>`_), MethPipe (`#1070 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1070>`_), Modeller (`#825 <https://github.com/hpcugent/easybuild-easyconfigs/pull/825>`_), NAMD (`#835 <https://github.com/hpcugent/easybuild-easyconfigs/pull/835>`_), netCDF-C++4 (`#1015 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1015>`_)

* added easyconfigs for new toolchains (`#986 <https://github.com/hpcugent/easybuild-easyconfigs/pull/986>`_, `#1051 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1051>`_):

  * gimkl/1.5.9, ictce/7.1.2

* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * including Python 2.7.8/3.4.1, Perl 5.20.0, R 3.1.1, NWChem 6.3, OpenFOAM-Extend 3.1, GCC 4.9.1, Clang 3.4.2, ...

* various enhancements, including:

  * make existing ictce/intel toolchains compatible with HierarchicalMNS (`#1069 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1069>`_)

    * this involves installing impi with an iccifort toolchain, and imkl with an iimpi toolchain

* various bug fixes, including:

  * download link for Perl modules changed to use cpan.metapan.org
  * fix missing MPI-based OpenFOAM libraries (``Pstream``, ``(pt)scotchDecomp``), make sure provided SCOTCH is used (`#957 <https://github.com/hpcugent/easybuild-easyconfigs/pull/957>`_)

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

* added **one** new `generic` easyblock: CmdCp (`#395 <https://github.com/hpcugent/easybuild-easyblocks/pull/395>`_)
* added support for **2** new software packages that requires customized support:

  * ANSYS (`#398 <https://github.com/hpcugent/easybuild-easyblocks/pull/398>`_), HPCG (`#408 <https://github.com/hpcugent/easybuild-easyblocks/pull/408>`_)

* various enhancements, including:

  * updated ABAQUS easyblock so that it works for version 13.2 (`#406 <https://github.com/hpcugent/easybuild-easyblocks/pull/406>`_)
  * enhance BLAT easyblock by using ``super``'s ``build_step`` and ``prebuildopts``/``buildopts`` (`#423 <https://github.com/hpcugent/easybuild-easyblocks/pull/423>`_)
  * enhance Mothur easyblock to guess correct start dir for recent versions (`#424 <https://github.com/hpcugent/easybuild-easyblocks/pull/424>`_)
  * replace use of deprecated (pre)makeopts with (``pre``)``buildopts`` in all easyblocks (`#427 <https://github.com/hpcugent/easybuild-easyblocks/pull/427>`_)
  * fix poor mans version of toolchain compiler detection in imkl easyblock (`#429 <https://github.com/hpcugent/easybuild-easyblocks/pull/429>`_)

* various bug fixes:

  * only check for ``idb`` for older versions of icc (`#426 <https://github.com/hpcugent/easybuild-easyblocks/pull/426>`_)
  * fix issues with installing RPMS when ``rpmrebuild`` is required (`#433 <https://github.com/hpcugent/easybuild-easyblocks/pull/433>`_)
  * correctly disable parallel build for ATLAS (`#434 <https://github.com/hpcugent/easybuild-easyblocks/pull/434>`_)
  * fix sanity check for Intel MPI v5.x (only provides bin64) (`#432 <https://github.com/hpcugent/easybuild-easyblocks/pull/432>`_)
  * add ``$MIC_LD_LIBRARY_PATH`` for MKL v11.x (`#437 <https://github.com/hpcugent/easybuild-easyblocks/pull/437>`_)

**easyconfigs**

* added example easyconfig files for **17** new software packages:

  * ANSYS (`#836 <https://github.com/hpcugent/easybuild-easyconfigs/pull/836>`_), Beast (`#912 <https://github.com/hpcugent/easybuild-easyconfigs/pull/912>`_), ELPH (`#910 <https://github.com/hpcugent/easybuild-easyconfigs/pull/910>`_, `#911 <https://github.com/hpcugent/easybuild-easyconfigs/pull/911>`_), FastTree (`#900 <https://github.com/hpcugent/easybuild-easyconfigs/pull/900>`_, `#947 <https://github.com/hpcugent/easybuild-easyconfigs/pull/947>`_), GEM-library (`#858 <https://github.com/hpcugent/easybuild-easyconfigs/pull/858>`_), HPCG (`#853 <https://github.com/hpcugent/easybuild-easyconfigs/pull/853>`_),
    mdtest (`#925 <https://github.com/hpcugent/easybuild-easyconfigs/pull/925>`_), ncview (`#648 <https://github.com/hpcugent/easybuild-easyconfigs/pull/648>`_), PRANK (`#917 <https://github.com/hpcugent/easybuild-easyconfigs/pull/917>`_), RDP-Classifier (`#903 <https://github.com/hpcugent/easybuild-easyconfigs/pull/903>`_), SDPA (`#955 <https://github.com/hpcugent/easybuild-easyconfigs/pull/955>`_), SIBELia (`#886 <https://github.com/hpcugent/easybuild-easyconfigs/pull/886>`_),
    SOAPaligner (`#857 <https://github.com/hpcugent/easybuild-easyconfigs/pull/857>`_), SPAdes (`#884 <https://github.com/hpcugent/easybuild-easyconfigs/pull/884>`_), stemming (`#891 <https://github.com/hpcugent/easybuild-easyconfigs/pull/891>`_), WHAM (`#872 <https://github.com/hpcugent/easybuild-easyconfigs/pull/872>`_), YAXT (`#656 <https://github.com/hpcugent/easybuild-easyconfigs/pull/656>`_)

* added easyconfigs for new toolchains (`#935 <https://github.com/hpcugent/easybuild-easyconfigs/pull/935>`_, `#944 <https://github.com/hpcugent/easybuild-easyconfigs/pull/944>`_, `#948 <https://github.com/hpcugent/easybuild-easyconfigs/pull/948>`_):

  * foss/2014b, ictce/6.3.5, intel/2014b

* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...
* various enhancements, including:

  * replace use of deprecated ``(pre)makeopts`` with ``(pre)buildopts`` in all easyblocks (`#954 <https://github.com/hpcugent/easybuild-easyconfigs/pull/954>`_)
  * disable running embossupdate on installation of EMBOSS (`#963 <https://github.com/hpcugent/easybuild-easyconfigs/pull/963>`_)
* various bug fixes, including:
  * really enable OpenMP support in FastTree easyconfigs (`#947 <https://github.com/hpcugent/easybuild-easyconfigs/pull/947>`_)
  * fix easyconfigs unit tests after changes in framework (`#958 <https://github.com/hpcugent/easybuild-easyconfigs/pull/958>`_)

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

  * Go (`#417 <https://github.com/hpcugent/easybuild-easyblocks/pull/417>`_)

* various enhancements, including:

  * enhance OpenFOAM easyblock so OpenFOAM-Extend fork can be built too + style fixes (`#253 <https://github.com/hpcugent/easybuild-easyblocks/pull/253>`_, `#416 <https://github.com/hpcugent/easybuild-easyblocks/pull/416>`_)
  * enhance CPLEX easyblock by adding support for staged installation (`#372 <https://github.com/hpcugent/easybuild-easyblocks/pull/372>`_)
  * include support for ``configure_cmd_prefix`` easyconfig parameter in ConfigureMake generic easyblock (`#393 <https://github.com/hpcugent/easybuild-easyblocks/pull/393>`_)
  * enhance GCC easyblock for building v4.9.0 and versions prior to v4.5 (`#396 <https://github.com/hpcugent/easybuild-easyblocks/pull/396>`_, `#400 <https://github.com/hpcugent/easybuild-easyblocks/pull/400>`_)
  * enhance easyblocks for Intel ipp and itac to support recent versions (`#399 <https://github.com/hpcugent/easybuild-easyblocks/pull/399>`_)
  * enhance Clang easyblock: install static analyzer (`#402 <https://github.com/hpcugent/easybuild-easyblocks/pull/402>`_), be more robust against changing source dir names (`#413 <https://github.com/hpcugent/easybuild-easyblocks/pull/413>`_)
  * enhance FoldX easyblock, update list of potential FoldX binaries to support recent versions (`#407 <https://github.com/hpcugent/easybuild-easyblocks/pull/407>`_)
  * add runtime patching in Boost easyblock to fix build issue with old Boost versions and recent glibc (> 2.15) (`#412 <https://github.com/hpcugent/easybuild-easyblocks/pull/412>`_)
  * enhance ``MakeCp`` generic easyblock: use location of 1st unpacked source as fallback base dir for ``files_to_copy`` (`#415 <https://github.com/hpcugent/easybuild-easyblocks/pull/415>`_)

* various bug fixes:

  * fix installing Mathematica when X forwarding is enabled (make sure ``$DISPLAY`` is unset) (`#391 <https://github.com/hpcugent/easybuild-easyblocks/pull/391>`_)
  * fix permissions of installed files in SAMtools easyblock, ensure read/execute for group/other (`#409 <https://github.com/hpcugent/easybuild-easyblocks/pull/409>`_)
  * fix implementation of ``det_pylibdir`` function in PythonPackage generic easyblock (`#419 <https://github.com/hpcugent/easybuild-easyblocks/pull/419>`_, `#420 <https://github.com/hpcugent/easybuild-easyblocks/pull/420>`_)

    * determine Python lib dir via ``distutils`` Python, which works cross-OS (as opposed to hardcoding ``lib``)

**easyconfigs**

* added example easyconfig files for **32** new software packages:

  * APBS (`#742 <https://github.com/hpcugent/easybuild-easyconfigs/pull/742>`_), BayesTraits (`#770 <https://github.com/hpcugent/easybuild-easyconfigs/pull/770>`_), bc (`#888 <https://github.com/hpcugent/easybuild-easyconfigs/pull/888>`_), BitSeq (`#791 <https://github.com/hpcugent/easybuild-easyconfigs/pull/791>`_), CEM (`#789 <https://github.com/hpcugent/easybuild-easyconfigs/pull/789>`_), CVS (`#888 <https://github.com/hpcugent/easybuild-easyconfigs/pull/888>`_), eXpress (`#786 <https://github.com/hpcugent/easybuild-easyconfigs/pull/786>`_), file (`#888 <https://github.com/hpcugent/easybuild-easyconfigs/pull/888>`_),
    GEMSTAT (`#861 <https://github.com/hpcugent/easybuild-easyconfigs/pull/861>`_), GMAP (`#594 <https://github.com/hpcugent/easybuild-easyconfigs/pull/594>`_), Go (`#887 <https://github.com/hpcugent/easybuild-easyconfigs/pull/887>`_), iscp (`#602 <https://github.com/hpcugent/easybuild-easyconfigs/pull/602>`_), IsoInfer (`#773 <https://github.com/hpcugent/easybuild-easyconfigs/pull/773>`_), Jellyfish (`#868 <https://github.com/hpcugent/easybuild-easyconfigs/pull/868>`_), less (`#888 <https://github.com/hpcugent/easybuild-easyconfigs/pull/888>`_),
    libcircle (`#883 <https://github.com/hpcugent/easybuild-easyconfigs/pull/883>`_), mcpp (`#602 <https://github.com/hpcugent/easybuild-easyconfigs/pull/602>`_), MMSEQ (`#795 <https://github.com/hpcugent/easybuild-easyconfigs/pull/795>`_), MUSTANG (`#800 <https://github.com/hpcugent/easybuild-easyconfigs/pull/800>`_), OpenFOAM-Extend (`#437 <https://github.com/hpcugent/easybuild-easyconfigs/pull/437>`_), popt (`#759 <https://github.com/hpcugent/easybuild-easyconfigs/pull/759>`_), pscom (`#759 <https://github.com/hpcugent/easybuild-easyconfigs/pull/759>`_),
    psmpi2 (`#759 <https://github.com/hpcugent/easybuild-easyconfigs/pull/759>`_), QuadProg++ (`#773 <https://github.com/hpcugent/easybuild-easyconfigs/pull/773>`_), rSeq (`#771 <https://github.com/hpcugent/easybuild-easyconfigs/pull/771>`_), RSEQtools (`#870 <https://github.com/hpcugent/easybuild-easyconfigs/pull/870>`_), Ruby (`#873 <https://github.com/hpcugent/easybuild-easyconfigs/pull/873>`_), segemehl (`#792 <https://github.com/hpcugent/easybuild-easyconfigs/pull/792>`_), SOAPec (`#879 <https://github.com/hpcugent/easybuild-easyconfigs/pull/879>`_),
    SOAPdenovo2 (`#874 <https://github.com/hpcugent/easybuild-easyconfigs/pull/874>`_), SRA-Toolkit (`#793 <https://github.com/hpcugent/easybuild-easyconfigs/pull/793>`_), texinfo (`#888 <https://github.com/hpcugent/easybuild-easyconfigs/pull/888>`_)

* added easyconfig for new toolchain goolfc/1.4.10
* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * e.g., older versions of Boost (1.47.0), GCC (4.1-4.4), & recent versions of Clang, GCC, Lmod, etc.

* various enhancements, including:

  * add OpenSSL dependency for cURL, to enable HTTPS support (`#881 <https://github.com/hpcugent/easybuild-easyconfigs/pull/881>`_)
  * also install esl-X binaries for HMMER (`#889 <https://github.com/hpcugent/easybuild-easyconfigs/pull/889>`_)

* various bug fixes, including:

  * properly pass down compiler flags for ParMGridGen (`#437 <https://github.com/hpcugent/easybuild-easyconfigs/pull/437>`_)
  * specify proper make options for PLINK, fixing the build on SL6 (`#594 <https://github.com/hpcugent/easybuild-easyconfigs/pull/594>`_, `#772 <https://github.com/hpcugent/easybuild-easyconfigs/pull/772>`_)
  * fix netloc version (0.5 rather than 0.5beta) (`#707 <https://github.com/hpcugent/easybuild-easyconfigs/pull/707>`_)
  * remove Windows-style line ending in netCDF patch file (`#796 <https://github.com/hpcugent/easybuild-easyconfigs/pull/796>`_)
  * bump version of OpenSSL dep for BOINC (`#882 <https://github.com/hpcugent/easybuild-easyconfigs/pull/882>`_)

v1.12.1 (April 25th 2014)
-------------------------

bugfix release

**framework**

* return to original directory after executing a command in a subdir (`#908 <https://github.com/hpcugent/easybuild-framework/pull/908>`_)
* fix bootstrap with Lmod, fix issue with module function check and Lmod (`#911 <https://github.com/hpcugent/easybuild-framework/pull/911>`_)

**easyblocks**

`(no changes compared to v1.12.0, simple version bump to stay in sync with easybuild-framework)`

**easyconfigs**

`(no changes compared to v1.12.0, simple version bump to stay in sync with easybuild-framework)`

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

  * fix linking with ``-lcudart`` if CUDA is part of the toolchain, should also include ``-lrt`` (`#882 <https://github.com/hpcugent/easybuild-framework/pull/882>`_)

**easyblocks**

* various enhancements, including:

  * also run ``Perl Build build`` for Perl modules (usually not required, but sometimes it is) (`#380 <https://github.com/hpcugent/easybuild-easyblocks/pull/380>`_)
  * added glob support in generic makecp block (`#367 <https://github.com/hpcugent/easybuild-easyblocks/pull/367>`_, `#384 <https://github.com/hpcugent/easybuild-easyblocks/pull/384>`_)
  * enhance sanity check in GCC easyblock such that it also passes/works on OpenSuSE (`#365 <https://github.com/hpcugent/easybuild-easyblocks/pull/365>`_)
  * add multilib support in GCC easyblock (`#379 <https://github.com/hpcugent/easybuild-easyblocks/pull/379>`_)
* various bug fixes:
  * Clang: disable sanitizer tests when vmem limit is set (`#366 <https://github.com/hpcugent/easybuild-easyblocks/pull/366>`_)
  * make sure all libraries are installed for recent Intel MKL versions (`#375 <https://github.com/hpcugent/easybuild-easyblocks/pull/375>`_)
  * fix appending Intel MPI include directories to ``$CPATH`` (`#371 <https://github.com/hpcugent/easybuild-easyblocks/pull/371>`_)
  * statically link readline/ncurses libraries in Python and NWChem easyblocks (`#370 <https://github.com/hpcugent/easybuild-easyblocks/pull/370>`_, `#383 <https://github.com/hpcugent/easybuild-easyblocks/pull/383>`_, `#385 <https://github.com/hpcugent/easybuild-easyblocks/pull/385>`_)
  * fix easyblock unit tests after changes in framework (`#376 <https://github.com/hpcugent/easybuild-easyblocks/pull/376>`_, `#377 <https://github.com/hpcugent/easybuild-easyblocks/pull/377>`_, `#378 <https://github.com/hpcugent/easybuild-easyblocks/pull/378>`_)

**easyconfigs**

* added example easyconfig files for **6** new software packages:

  * CLooG (`#653 <https://github.com/hpcugent/easybuild-easyconfigs/pull/653>`_), ELPA (`#738 <https://github.com/hpcugent/easybuild-easyconfigs/pull/738>`_), LIBSVM (`#788 <https://github.com/hpcugent/easybuild-easyconfigs/pull/788>`_), netaddr (`#753 <https://github.com/hpcugent/easybuild-easyconfigs/pull/753>`_), netifcas (`#753 <https://github.com/hpcugent/easybuild-easyconfigs/pull/753>`_), slalib-c (`#750 <https://github.com/hpcugent/easybuild-easyconfigs/pull/750>`_)

* added easyconfigs for new toolchains:

  * ClangGCC/1.3.0 (`#653 <https://github.com/hpcugent/easybuild-easyconfigs/pull/653>`_), goolf/1.4.10-no-OFED (`#749 <https://github.com/hpcugent/easybuild-easyconfigs/pull/749>`_), goolf/1.5.14(-no-OFED) (`#764 <https://github.com/hpcugent/easybuild-easyconfigs/pull/764>`_, `#767 <https://github.com/hpcugent/easybuild-easyconfigs/pull/767>`_), ictce/6.2.5 (`#726 <https://github.com/hpcugent/easybuild-easyconfigs/pull/726>`_), iomkl (`#747 <https://github.com/hpcugent/easybuild-easyconfigs/pull/747>`_)

* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...
* various enhancements, including:

  * tweak BOINC easyconfig to make use of ``glob`` support available for ``files_to_copy`` (`#781 <https://github.com/hpcugent/easybuild-easyconfigs/pull/781>`_)
  * enable ``-fPIC`` for libreadline, so it can be linked into shared libs (e.g. ``libpython2.x.so``) (`#798 <https://github.com/hpcugent/easybuild-easyconfigs/pull/798>`_)
* various bug fixes, including:
  * fix Qt source_urls (`#756 <https://github.com/hpcugent/easybuild-easyconfigs/pull/756>`_)
  * enable ``-fPIC`` in ncurses 5.9 ictce/5.2.0 easyconfig, just like in the others (`#801 <https://github.com/hpcugent/easybuild-easyconfigs/pull/801>`_)
  * fix unit tests after changes to framework (`#763 <https://github.com/hpcugent/easybuild-easyconfigs/pull/763>`_, `#766 <https://github.com/hpcugent/easybuild-easyconfigs/pull/766>`_, `#769 <https://github.com/hpcugent/easybuild-easyconfigs/pull/769>`_)

v1.11.1 (February 28th 2014)
----------------------------

bugfix release

**framework**

* various bug fixes, including:

  * fix hard crash when ``$LMOD_CMD`` specified full path to lmod binary, but ``spider`` binary is not in ``$PATH`` (`#861 <https://github.com/hpcugent/easybuild-framework/pull/861>`_, `#873 <https://github.com/hpcugent/easybuild-framework/pull/873>`_)
  * fix bug in initialisation of repositories, causing problems when a repository subdirectory is specified (`#852 <https://github.com/hpcugent/easybuild-framework/pull/852>`_)
  * avoid long wait when dependency resolution fails if ``--robot`` is not specified (`#875 <https://github.com/hpcugent/easybuild-framework/pull/875>`_)

**easyblocks**

`(no changes compared to v1.11.0, simple version bump to stay in sync with easybuild-framework)`

**easyconfigs**

`(no changes compared to v1.11.0, simple version bump to stay in sync with easybuild-framework)`

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

* added **one** new `generic` easyblock: ``VSCPythonPackage`` (`#348 <https://github.com/hpcugent/easybuild-easyblocks/pull/348>`_)
* added support for **1** new software package that requires customized support:

  * netcdf4-python (`#347 <https://github.com/hpcugent/easybuild-easyblocks/pull/347>`_)

* various enhancements, including:

  * add support for installing recent tbb versions (`#341 <https://github.com/hpcugent/easybuild-easyblocks/pull/341>`_)
  * use ``makeopts`` in the build step of the generic ``PythonPackage`` easyblock (`#352 <https://github.com/hpcugent/easybuild-easyblocks/pull/352>`_)
  * define the ``$CMAKE_INCLUDE_PATH`` and ``$CMAKE_LIBRARY_PATH`` in the generic ``CMakeMake`` easyblock (`#351 <https://github.com/hpcugent/easybuild-easyblocks/pull/351>`_, `#360 <https://github.com/hpcugent/easybuild-easyblocks/pull/360>`_)
  * update Clang easyblock to support v3.4 (`#346 <https://github.com/hpcugent/easybuild-easyblocks/pull/346>`_)
  * make sure Python is built with SSL support, adjust Python easyblock to pick up OpenSSL dep (`#359 <https://github.com/hpcugent/easybuild-easyblocks/pull/359>`_)

    * note: providing OpenSSL via an OS package is still recommended, such that security updates are picked up

  * add support for recent netCDF versions (`#347 <https://github.com/hpcugent/easybuild-easyblocks/pull/347>`_)
  * update SuiteSparse easyblock for new versions, and clean it up a bit (`#350 <https://github.com/hpcugent/easybuild-easyblocks/pull/350>`_)

* various bug fixes:

  * fix name of ``VersionIndependentPythonPackage`` easyblock, deprecate ``VersionIndependendPythonPackage`` easyblock (`#348 <https://github.com/hpcugent/easybuild-easyblocks/pull/348>`_)
  * fix detection of machine architecture in FSL easyblock (`#353 <https://github.com/hpcugent/easybuild-easyblocks/pull/353>`_)
  * fix bug in NWChem easyblock w.r.t. creating local dummy ``.nwchem`` file (`#360 <https://github.com/hpcugent/easybuild-easyblocks/pull/360>`_)
  * make sure ``$LIBRARY_PATH`` is set for Intel compilers and Intel MPI, fix 64-bit specific paths (`#360 <https://github.com/hpcugent/easybuild-easyblocks/pull/360>`_)

**easyconfigs**

* added example easyconfig files for **30** new software packages:

  * argtable (`#669 <https://github.com/hpcugent/easybuild-easyconfigs/pull/669>`_), Clustal-Omega (`#669 <https://github.com/hpcugent/easybuild-easyconfigs/pull/669>`_), Coreutils (`#582 <https://github.com/hpcugent/easybuild-easyconfigs/pull/582>`_), GMT (`#560 <https://github.com/hpcugent/easybuild-easyconfigs/pull/560>`_), gperftools (`#596 <https://github.com/hpcugent/easybuild-easyconfigs/pull/596>`_), grep (`#582 <https://github.com/hpcugent/easybuild-easyconfigs/pull/582>`_), h4toh5 (`#597 <https://github.com/hpcugent/easybuild-easyconfigs/pull/597>`_),
    libunwind (`#596 <https://github.com/hpcugent/easybuild-easyconfigs/pull/596>`_), Lmod (`#600 <https://github.com/hpcugent/easybuild-easyconfigs/pull/600>`_, `#692 <https://github.com/hpcugent/easybuild-easyconfigs/pull/692>`_), Lua (`#600 <https://github.com/hpcugent/easybuild-easyconfigs/pull/600>`_, `#692 <https://github.com/hpcugent/easybuild-easyconfigs/pull/692>`_), MAFFT (`#654 <https://github.com/hpcugent/easybuild-easyconfigs/pull/654>`_), Molekel (`#597 <https://github.com/hpcugent/easybuild-easyconfigs/pull/597>`_), NEdit (`#597 <https://github.com/hpcugent/easybuild-easyconfigs/pull/597>`_),
    netcdf4-python (`#660 <https://github.com/hpcugent/easybuild-easyconfigs/pull/660>`_), nodejs (`#678 <https://github.com/hpcugent/easybuild-easyconfigs/pull/678>`_), OCaml (`#704 <https://github.com/hpcugent/easybuild-easyconfigs/pull/704>`_), patch (`#582 <https://github.com/hpcugent/easybuild-easyconfigs/pull/582>`_), PhyML (`#664 <https://github.com/hpcugent/easybuild-easyconfigs/pull/664>`_),
    PRACE Common Production Environment (`#599 <https://github.com/hpcugent/easybuild-easyconfigs/pull/599>`_), protobuf (`#680 <https://github.com/hpcugent/easybuild-easyconfigs/pull/680>`_), python-dateutil (`#438 <https://github.com/hpcugent/easybuild-easyconfigs/pull/438>`_), sed (`#582 <https://github.com/hpcugent/easybuild-easyconfigs/pull/582>`_), sickle (`#651 <https://github.com/hpcugent/easybuild-easyconfigs/pull/651>`_),
    Tesla-Deployment-Kit (`#489 <https://github.com/hpcugent/easybuild-easyconfigs/pull/489>`_), TREE-PUZZLE (`#662 <https://github.com/hpcugent/easybuild-easyconfigs/pull/662>`_), VCFtools (`#626 <https://github.com/hpcugent/easybuild-easyconfigs/pull/626>`_), Vim (`#665 <https://github.com/hpcugent/easybuild-easyconfigs/pull/665>`_), vsc-mympirun-scoop (`#661 <https://github.com/hpcugent/easybuild-easyconfigs/pull/661>`_),
    vsc-processcontrol (`#661 <https://github.com/hpcugent/easybuild-easyconfigs/pull/661>`_), XZ (`#582 <https://github.com/hpcugent/easybuild-easyconfigs/pull/582>`_)

* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * OpenSSL with ictce toolchain (`#703 <https://github.com/hpcugent/easybuild-easyconfigs/pull/703>`_)

* various enhancements, including:

  * using more constants and templates (`#613 <https://github.com/hpcugent/easybuild-easyconfigs/pull/613>`_, `#615 <https://github.com/hpcugent/easybuild-easyconfigs/pull/615>`_)
  * specify OS dependency for SSL support, with OpenSSL dependency as fallback (`#703 <https://github.com/hpcugent/easybuild-easyconfigs/pull/703>`_)

* various bug fixes, including:

  * fix unit tests after (internal) framework API changes (`#667 <https://github.com/hpcugent/easybuild-easyconfigs/pull/667>`_, `#672 <https://github.com/hpcugent/easybuild-easyconfigs/pull/672>`_)
  * fix homepage in vsc-mympirun easyconfig file (`#681 <https://github.com/hpcugent/easybuild-easyconfigs/pull/681>`_)
  * align OpenMPI easyconfigs (`#650 <https://github.com/hpcugent/easybuild-easyconfigs/pull/650>`_)
  * add additional source URL in Qt easyconfigs (`#676 <https://github.com/hpcugent/easybuild-easyconfigs/pull/676>`_)
  * specify correct $PATH specification and define ``$CHPL_HOME`` for Chapel (`#683 <https://github.com/hpcugent/easybuild-easyconfigs/pull/683>`_)

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

* added **one** new `generic` easyblock: ``VersionIndependendPythonPackage`` (`#329 <https://github.com/hpcugent/easybuild-easyblocks/pull/329>`_, `#334 <https://github.com/hpcugent/easybuild-easyblocks/pull/334>`_)
* added support for **2** new software packages that require customized support:

  * Charmm (`#318 <https://github.com/hpcugent/easybuild-easyblocks/pull/318>`_), GROMACS (`#335 <https://github.com/hpcugent/easybuild-easyblocks/pull/335>`_, `#339 <https://github.com/hpcugent/easybuild-easyblocks/pull/339>`_)

* various enhancements, including:

  * fix support for recent SAMtools version (>= 0.1.19) (`#320 <https://github.com/hpcugent/easybuild-easyblocks/pull/320>`_)
  * fix support for recent Intel tools (icc, ifort, imkl, impi) (`#325 <https://github.com/hpcugent/easybuild-easyblocks/pull/325>`_, `#327 <https://github.com/hpcugent/easybuild-easyblocks/pull/327>`_, `#338 <https://github.com/hpcugent/easybuild-easyblocks/pull/338>`_)
  * enhance generic easyblock for installing RPMs (`#332 <https://github.com/hpcugent/easybuild-easyblocks/pull/332>`_)
  * pick up ``preinstallopts`` in generic ``PythonPackage`` easyblock (`#334 <https://github.com/hpcugent/easybuild-easyblocks/pull/334>`_)
  * enhance CP2K easyblock (libxc support, new versions) + style cleanup (`#336 <https://github.com/hpcugent/easybuild-easyblocks/pull/336>`_)

* various bug fixes:

  * use unwanted env var functionality to unset ``$MKLROOT`` rather than failing with an error (`#273 <https://github.com/hpcugent/easybuild-easyblocks/pull/273>`_)
  * always include ``-w`` flag for preprocessor to supress warnings that may break QuantumESPRESSO configure (`#317 <https://github.com/hpcugent/easybuild-easyblocks/pull/317>`_)
  * link with multithreaded LAPACK libs for ESMF (`#319 <https://github.com/hpcugent/easybuild-easyblocks/pull/319>`_)
  * extend ``noqanda`` list of patterns in CUDA easyblock (`#328 <https://github.com/hpcugent/easybuild-easyblocks/pull/328>`_, `#337 <https://github.com/hpcugent/easybuild-easyblocks/pull/337>`_)
  * add ``import _ctypes`` to Python sanity check commands to capture a common build issue (`#329 <https://github.com/hpcugent/easybuild-easyblocks/pull/329>`_)
  * bug fixes in generic ``IntelBase`` easyblock (`#331 <https://github.com/hpcugent/easybuild-easyblocks/pull/331>`_, `#333 <https://github.com/hpcugent/easybuild-easyblocks/pull/333>`_, `#335 <https://github.com/hpcugent/easybuild-easyblocks/pull/335>`_)

    * remove broken symlink ``$HOME/intel`` if present
    * fix use of gettempdir to obtain a common (user-specific) tmp dir to symlink ``$HOME/intel`` to

  * fix build of recent scipy versions with GCC-based toolchain (`#334 <https://github.com/hpcugent/easybuild-easyblocks/pull/334>`_)
  * fix use of gettempdir to obtain common (user-specific) tmp dir for ``$HOME/.nwchemrc`` symlink (`#340 <https://github.com/hpcugent/easybuild-easyblocks/pull/340>`_, `#342 <https://github.com/hpcugent/easybuild-easyblocks/pull/342>`_)
  * extend ``noqanda`` list in Qt easyblock (`#342 <https://github.com/hpcugent/easybuild-easyblocks/pull/342>`_)

**easyconfigs**

* added example easyconfig files for **18** new software packages:

  * BEDTools (`#579 <https://github.com/hpcugent/easybuild-easyconfigs/pull/579>`_, `#632 <https://github.com/hpcugent/easybuild-easyconfigs/pull/632>`_, `#635 <https://github.com/hpcugent/easybuild-easyconfigs/pull/635>`_), CAP3 (`#548 <https://github.com/hpcugent/easybuild-easyconfigs/pull/548>`_), CHARMM (`#584 <https://github.com/hpcugent/easybuild-easyconfigs/pull/584>`_), cutadapt (`#620 <https://github.com/hpcugent/easybuild-easyconfigs/pull/620>`_), ErlangOTP (`#556 <https://github.com/hpcugent/easybuild-easyconfigs/pull/556>`_, `#630 <https://github.com/hpcugent/easybuild-easyconfigs/pull/630>`_),
    Ghostscript (`#547 <https://github.com/hpcugent/easybuild-easyconfigs/pull/547>`_, `#632 <https://github.com/hpcugent/easybuild-easyconfigs/pull/632>`_), HTSeq (`#554 <https://github.com/hpcugent/easybuild-easyconfigs/pull/554>`_, `#632 <https://github.com/hpcugent/easybuild-easyconfigs/pull/632>`_), Jansson (`#545 <https://github.com/hpcugent/easybuild-easyconfigs/pull/545>`_), libjpeg-turbo (`#574 <https://github.com/hpcugent/easybuild-easyconfigs/pull/574>`_), Molden (`#566 <https://github.com/hpcugent/easybuild-easyconfigs/pull/566>`_),
    netloc (`#545 <https://github.com/hpcugent/easybuild-easyconfigs/pull/545>`_), o2scl (`#633 <https://github.com/hpcugent/easybuild-easyconfigs/pull/633>`_), packmol (`#566 <https://github.com/hpcugent/easybuild-easyconfigs/pull/566>`_), PP (`#405 <https://github.com/hpcugent/easybuild-easyconfigs/pull/405>`_), qtop (`#500 <https://github.com/hpcugent/easybuild-easyconfigs/pull/500>`_), TAMkin (`#566 <https://github.com/hpcugent/easybuild-easyconfigs/pull/566>`_), vsc-base (`#621 <https://github.com/hpcugent/easybuild-easyconfigs/pull/621>`_),
    vsc-mympirun (`#621 <https://github.com/hpcugent/easybuild-easyconfigs/pull/621>`_)

* added easyconfigs for new toolchains (`#545 <https://github.com/hpcugent/easybuild-easyconfigs/pull/545>`_, `#609 <https://github.com/hpcugent/easybuild-easyconfigs/pull/609>`_, `#629 <https://github.com/hpcugent/easybuild-easyconfigs/pull/629>`_):

  * gcccuda/2.6.10, gompic/2.6.10, goolfc/2.6.10, ictce/6.0.5, ictce/6.1.5

* added additional easyconfigs for various supported software packages: version updates, different toolchains, ...

  * new versions of icc, ifort, imkl, impi (`#609 <https://github.com/hpcugent/easybuild-easyconfigs/pull/609>`_, `#629 <https://github.com/hpcugent/easybuild-easyconfigs/pull/629>`_)
  * large collection of ictce/5.3.0 easyconfigs (`#627 <https://github.com/hpcugent/easybuild-easyconfigs/pull/627>`_)

* various enhancements, including:

  * extended list of Python packages as extensions to Python (`#625 <https://github.com/hpcugent/easybuild-easyconfigs/pull/625>`_)
  * add MPI-enabled version of GROMACS + easyconfigs using ictce (`#606 <https://github.com/hpcugent/easybuild-easyconfigs/pull/606>`_, `#636 <https://github.com/hpcugent/easybuild-easyconfigs/pull/636>`_)
  * clean up templating of ``source_urls`` (`#637 <https://github.com/hpcugent/easybuild-easyconfigs/pull/637>`_)

* various bug fixes, including:

  * provide alternative download URL for Mesa (`#532 <https://github.com/hpcugent/easybuild-easyconfigs/pull/532>`_)
  * add Python versionsuffix in OpenBabel filenames (`#566 <https://github.com/hpcugent/easybuild-easyconfigs/pull/566>`_)
  * apply no-gets patch in all M4 v1.4.16 easyconfigs (`#623 <https://github.com/hpcugent/easybuild-easyconfigs/pull/623>`_)
  * fix patching of Python w.r.t. ``libffi``/``_ctypes`` issues (`#625 <https://github.com/hpcugent/easybuild-easyconfigs/pull/625>`_, `#642 <https://github.com/hpcugent/easybuild-easyconfigs/pull/642>`_)
  * bug fixes in GROMACS easyconfigs (`#606 <https://github.com/hpcugent/easybuild-easyconfigs/pull/606>`_)

    * change versionsuffix for non-MPI GROMACS easyconfigs to ``-mt``
    * stop using 'CMakeMake' easyblock for GROMACS now that there's a dedicated GROMACS easyblock,
      which correctly specifies building against external BLAS/LAPACK libraries

  * fix Qt dependency for CGAL (`#642 <https://github.com/hpcugent/easybuild-easyconfigs/pull/642>`_)
  * fix libctl, libmatheval, Meep, PSI build issues caused by full paths in ``guile-config``/``python-config`` shebang (`#642 <https://github.com/hpcugent/easybuild-easyconfigs/pull/642>`_)
  * make sure HDF easyconfigs specify dedicated ``include/hdf`` include dir (`#642 <https://github.com/hpcugent/easybuild-easyconfigs/pull/642>`_)

    * this is required to avoid build issues with NCL, because HDF ships it's own ``netcdf.h``
    * this also triggered removal of patch files for NCL that rewrote ``include/hdf`` to ``include``

  * fix WPS v3.5.1 patch file after upstream source tarball was changed, supply checksum for verification (`#642 <https://github.com/hpcugent/easybuild-easyconfigs/pull/642>`_)

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

  * Allinea DDT/MAP (`#279 <https://github.com/hpcugent/easybuild-easyblocks/pull/279>`_), ARB (`#291 <https://github.com/hpcugent/easybuild-easyblocks/pull/291>`_), GenomeAnalysisTK (`#278 <https://github.com/hpcugent/easybuild-easyblocks/pull/278>`_), OpenBabel (`#305 <https://github.com/hpcugent/easybuild-easyblocks/pull/305>`_, `#309 <https://github.com/hpcugent/easybuild-easyblocks/pull/309>`_), picard (`#278 <https://github.com/hpcugent/easybuild-easyblocks/pull/278>`_), PyQuante (`#297 <https://github.com/hpcugent/easybuild-easyblocks/pull/297>`_), Scalasca v1.x (`#304 <https://github.com/hpcugent/easybuild-easyblocks/pull/304>`_), Score-P (`#304 <https://github.com/hpcugent/easybuild-easyblocks/pull/304>`_)

    * the Score-P easyblock is also used for Cube 4.x, LWM2, OTF2, and Scalasca v2.x

* various enhancements, including:

  * add support building ScaLAPACK on top of MPICH2, required for gmpolf toolchain (`#274 <https://github.com/hpcugent/easybuild-easyblocks/pull/274>`_)
  * add support to ConfigureMake easyblock to customize configure ``--prefix`` option (`#287 <https://github.com/hpcugent/easybuild-easyblocks/pull/287>`_)
  * add support for specifying install command in Binary easyblock (`#288 <https://github.com/hpcugent/easybuild-easyblocks/pull/288>`_)
  * enhance CMakeMake easyblock to specify srcdir via easyconfig parameter, and to perform out-of-source builds (`#303 <https://github.com/hpcugent/easybuild-easyblocks/pull/303>`_)

* various bug fixes:

  * use correct configure flag for Szip in HDF5 easyblocks, should be ``--with-szlib`` (`#286 <https://github.com/hpcugent/easybuild-easyblocks/pull/286>`_, `#301 <https://github.com/hpcugent/easybuild-easyblocks/pull/301>`_)
  * add support for serial HDF5 builds (`#290 <https://github.com/hpcugent/easybuild-easyblocks/pull/290>`_, `#301 <https://github.com/hpcugent/easybuild-easyblocks/pull/301>`_)
  * enhance robustness of Qt easyblock w.r.t. interactive configure (`#295 <https://github.com/hpcugent/easybuild-easyblocks/pull/295>`_, `#302 <https://github.com/hpcugent/easybuild-easyblocks/pull/302>`_)
  * enhance support for picking up license specification via environment variables (`#298 <https://github.com/hpcugent/easybuild-easyblocks/pull/298>`_, `#307 <https://github.com/hpcugent/easybuild-easyblocks/pull/307>`_)
  * extend list of values for ``$CPATH`` in libint2 easyblock (`#300 <https://github.com/hpcugent/easybuild-easyblocks/pull/300>`_)
  * fix ``extra_options`` ``super`` call in Clang easyblock (`#306 <https://github.com/hpcugent/easybuild-easyblocks/pull/306>`_)
  * add support in Boost easyblock to specify toolset in easyconfig file (`#308 <https://github.com/hpcugent/easybuild-easyblocks/pull/308>`_)

* other:

  * add build status badges for master/develop branches to README (`#289 <https://github.com/hpcugent/easybuild-easyblocks/pull/289>`_)

**easyconfigs**

* added example easyconfig files for **58** new software packages:

  *  Allinea (`#468 <https://github.com/hpcugent/easybuild-easyconfigs/pull/468>`_), ARB + dependencies (`#396 <https://github.com/hpcugent/easybuild-easyconfigs/pull/396>`_, `#493 <https://github.com/hpcugent/easybuild-easyconfigs/pull/493>`_, `#495 <https://github.com/hpcugent/easybuild-easyconfigs/pull/495>`_), arpack-ng (`#451 <https://github.com/hpcugent/easybuild-easyconfigs/pull/451>`_, `#481 <https://github.com/hpcugent/easybuild-easyconfigs/pull/481>`_), CDO (`#484 <https://github.com/hpcugent/easybuild-easyconfigs/pull/484>`_, `#521 <https://github.com/hpcugent/easybuild-easyconfigs/pull/521>`_), Cube (`#505 <https://github.com/hpcugent/easybuild-easyconfigs/pull/505>`_), ed (`#503 <https://github.com/hpcugent/easybuild-easyconfigs/pull/503>`_), FLTK (`#503 <https://github.com/hpcugent/easybuild-easyconfigs/pull/503>`_), GenomeAnalysisTK (`#467 <https://github.com/hpcugent/easybuild-easyconfigs/pull/467>`_), GIMPS (`#527 <https://github.com/hpcugent/easybuild-easyconfigs/pull/527>`_), GTI (`#511 <https://github.com/hpcugent/easybuild-easyconfigs/pull/511>`_), IPython (`#485 <https://github.com/hpcugent/easybuild-easyconfigs/pull/485>`_, `#519 <https://github.com/hpcugent/easybuild-easyconfigs/pull/519>`_), LWM2 (`#510 <https://github.com/hpcugent/easybuild-easyconfigs/pull/510>`_), MPICH2 (`#460 <https://github.com/hpcugent/easybuild-easyconfigs/pull/460>`_), MUST (`#511 <https://github.com/hpcugent/easybuild-easyconfigs/pull/511>`_), ncdf (`#496 <https://github.com/hpcugent/easybuild-easyconfigs/pull/496>`_, `#522 <https://github.com/hpcugent/easybuild-easyconfigs/pull/522>`_), OPARI2 (`#505 <https://github.com/hpcugent/easybuild-easyconfigs/pull/505>`_), OpenBabel (`#504 <https://github.com/hpcugent/easybuild-easyconfigs/pull/504>`_, `#524 <https://github.com/hpcugent/easybuild-easyconfigs/pull/524>`_), OTF (`#505 <https://github.com/hpcugent/easybuild-easyconfigs/pull/505>`_), OTF2 (`#505 <https://github.com/hpcugent/easybuild-easyconfigs/pull/505>`_), PandaSEQ (`#475 <https://github.com/hpcugent/easybuild-easyconfigs/pull/475>`_), ParaView (`#498 <https://github.com/hpcugent/easybuild-easyconfigs/pull/498>`_, `#514 <https://github.com/hpcugent/easybuild-easyconfigs/pull/514>`_), ParFlow (`#483 <https://github.com/hpcugent/easybuild-easyconfigs/pull/483>`_, `#520 <https://github.com/hpcugent/easybuild-easyconfigs/pull/520>`_), PCC (`#486 <https://github.com/hpcugent/easybuild-easyconfigs/pull/486>`_, `#528 <https://github.com/hpcugent/easybuild-easyconfigs/pull/528>`_), PDT (`#505 <https://github.com/hpcugent/easybuild-easyconfigs/pull/505>`_), picard (`#467 <https://github.com/hpcugent/easybuild-easyconfigs/pull/467>`_), PnMPI (`#511 <https://github.com/hpcugent/easybuild-easyconfigs/pull/511>`_), PyQuante (`#499 <https://github.com/hpcugent/easybuild-easyconfigs/pull/499>`_, `#523 <https://github.com/hpcugent/easybuild-easyconfigs/pull/523>`_), pysqlite (`#519 <https://github.com/hpcugent/easybuild-easyconfigs/pull/519>`_), Scalasca (`#505 <https://github.com/hpcugent/easybuild-easyconfigs/pull/505>`_), Score-P (`#505 <https://github.com/hpcugent/easybuild-easyconfigs/pull/505>`_), SDCC (`#486 <https://github.com/hpcugent/easybuild-easyconfigs/pull/486>`_, `#528 <https://github.com/hpcugent/easybuild-easyconfigs/pull/528>`_), Silo (`#483 <https://github.com/hpcugent/easybuild-easyconfigs/pull/483>`_, `#520 <https://github.com/hpcugent/easybuild-easyconfigs/pull/520>`_), Stride (`#503 <https://github.com/hpcugent/easybuild-easyconfigs/pull/503>`_), SURF (`#503 <https://github.com/hpcugent/easybuild-easyconfigs/pull/503>`_), TCC (`#486 <https://github.com/hpcugent/easybuild-easyconfigs/pull/486>`_, `#528 <https://github.com/hpcugent/easybuild-easyconfigs/pull/528>`_)

  * ARB dependencies (23): fixesproto, imake, inputproto, kbproto, libICE, libSM, libX11, libXau, libXaw, libXext, libXfixes, libXi, libXmu, libXp, libXpm, libXt, lynx, motif, printproto, Sablotron, xbitmaps, xextproto, xtrans

* added easyconfigs for new gmpich2/1.4.8, gmpolf/1.4.8 and goolf/1.6.10 toolchains (`#460 <https://github.com/hpcugent/easybuild-easyconfigs/pull/460>`_, `#525 <https://github.com/hpcugent/easybuild-easyconfigs/pull/525>`_, `#530 <https://github.com/hpcugent/easybuild-easyconfigs/pull/530>`_)

* added additional easyconfigs for various software packages (list too long to include here)

  * version updates, different toolchains, ...

* various bug fixes, including:

  * enable building of shared libraries for MPICH (`#482 <https://github.com/hpcugent/easybuild-easyconfigs/pull/482>`_)
  * fix HDF configure option for Szip, should be ``--with-szlib`` (`#533 <https://github.com/hpcugent/easybuild-easyconfigs/pull/533>`_)

    * for HDF5, this issue is fixed in the HDF5 easyblock

* other

  * add build status badges for master/develop branches to README (`#490 <https://github.com/hpcugent/easybuild-easyconfigs/pull/490>`_)

v1.8.2 (October 18th 2013)
--------------------------

bugfix release

**framework**

* fix regular expression used for obtaining list of modules from ``module avail`` (`#724 <https://github.com/hpcugent/easybuild-framework/pull/724>`_)

  * modules marked as default were being hidden from EasyBuild, causing problems when they are used as dependency

**easyblocks**

* fix installing of EasyBuild with a loaded EasyBuild module (`#280 <https://github.com/hpcugent/easybuild-easyblocks/pull/280>`_)

  * this is important to make upgrading to the latest EasyBuild version possible with a bootstrapped EasyBuild

**easyconfigs**

* port thread pool patch to PSI 4.0b4 and include it to avoid hanging tests (`#471 <https://github.com/hpcugent/easybuild-easyconfigs/pull/471>`_)

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

  * fix problems in PSI easyblock causing build to fail (`#270 <https://github.com/hpcugent/easybuild-easyblocks/pull/270>`_)
  * fix issues with running NWChem test cases, fail early in case broken symlink is present (`#275 <https://github.com/hpcugent/easybuild-easyblocks/pull/275>`_)

**easyconfigs**

* added additional easyconfigs for various software packages (`#457 <https://github.com/hpcugent/easybuild-easyconfigs/pull/457>`_):

  * Boost, bzip2, libreadline, ncurses, PSI, Python, zlib

* various bug fixes, including:

  * fix faulty easyconfig file names for HPCBIOS_Math, MUSCLE, XML-LibXML and YAML-Syck (`#459 <https://github.com/hpcugent/easybuild-easyconfigs/pull/459>`_, `#462 <https://github.com/hpcugent/easybuild-easyconfigs/pull/462>`_)
  * stop (re)specifying default maximum ratio for failed tests in NWChem easyconfig (`#457 <https://github.com/hpcugent/easybuild-easyconfigs/pull/457>`_)

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

      * using earlier 5.x version still works, but may be very slow when 'available' is used, due to bugs and a missing
        feature in Lmod versions prior to v5.1.5 on which we rely

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

* added **one** new `generic` easyblock: ``BinariesTarball`` (`#255 <https://github.com/hpcugent/easybuild-easyblocks/pull/255>`_)
* added support for **5** new software packages that require customized support:

  * DB (`#226 <https://github.com/hpcugent/easybuild-easyblocks/pull/226>`_), FDTD Solutions (`#239 <https://github.com/hpcugent/easybuild-easyblocks/pull/239>`_), FoldX (`#256 <https://github.com/hpcugent/easybuild-easyblocks/pull/256>`_), Mathematica (`#240 <https://github.com/hpcugent/easybuild-easyblocks/pull/240>`_), MUMPS (`#262 <https://github.com/hpcugent/easybuild-easyblocks/pull/262>`_)

* various enhancements, including:

  * support optionally running configure in generic ``MakeCp`` easyblock (`#252 <https://github.com/hpcugent/easybuild-easyblocks/pull/252>`_)
  * enhanced Clang easyblock to support building Clang 3.3 (`#248 <https://github.com/hpcugent/easybuild-easyblocks/pull/248>`_)
  * add support for ``$INTEL_LICENSE_FILE`` specifying multiple paths (`#251 <https://github.com/hpcugent/easybuild-easyblocks/pull/251>`_)
  * enhanced ATLAS easyblock to support building ATLAS 3.10.1 (`#258 <https://github.com/hpcugent/easybuild-easyblocks/pull/258>`_)

* various bug fixes:

  * add zlib lib dir in link path dirs for WPS (`#249 <https://github.com/hpcugent/easybuild-easyblocks/pull/249>`_)
  * stop using deprecated ``add_module`` function in imkl easyblock (`#250 <https://github.com/hpcugent/easybuild-easyblocks/pull/250>`_)
  * fixed PSI easyblock w.r.t. support for building plugins (`#254 <https://github.com/hpcugent/easybuild-easyblocks/pull/254>`_, `#269 <https://github.com/hpcugent/easybuild-easyblocks/pull/269>`_)
  * move OS check for Clang to ``check_readiness_step``, to allow a build job to be submitted from SL5 (`#263 <https://github.com/hpcugent/easybuild-easyblocks/pull/263>`_, `#264 <https://github.com/hpcugent/easybuild-easyblocks/pull/264>`_)
  * enable verbose build for DOLFIN, to allow for proper debugging if the build fails (`#265 <https://github.com/hpcugent/easybuild-easyblocks/pull/265>`_)
  * make sure ``$LDFLAGS`` and ``$INSTANT_*_DIR`` env vars are set for DOLFIN sanity check commands (`#268 <https://github.com/hpcugent/easybuild-easyblocks/pull/268>`_)

    *  this is required after resetting the environment after running module purge (see framework release notes)

  * don't try to load module in LAPACK test-only build (`#264 <https://github.com/hpcugent/easybuild-easyblocks/pull/264>`_, `#266 <https://github.com/hpcugent/easybuild-easyblocks/pull/266>`_)

**easyconfigs**

* added example easyconfig files for **9** new software packages:

  * BOINC (`#436 <https://github.com/hpcugent/easybuild-easyconfigs/pull/436>`_), DB (`#343 <https://github.com/hpcugent/easybuild-easyconfigs/pull/343>`_, `#449 <https://github.com/hpcugent/easybuild-easyconfigs/pull/449>`_), fastahack (`#374 <https://github.com/hpcugent/easybuild-easyconfigs/pull/374>`_), FDTD Solutions (`#387 <https://github.com/hpcugent/easybuild-easyconfigs/pull/387>`_), FoldX (`#440 <https://github.com/hpcugent/easybuild-easyconfigs/pull/440>`_, `#442 <https://github.com/hpcugent/easybuild-easyconfigs/pull/442>`_), Mathematica (`#394 <https://github.com/hpcugent/easybuild-easyconfigs/pull/394>`_),
    Mesquite (`#447 <https://github.com/hpcugent/easybuild-easyconfigs/pull/447>`_), MUMPS (`#447 <https://github.com/hpcugent/easybuild-easyconfigs/pull/447>`_), ParMGridGen (`#447 <https://github.com/hpcugent/easybuild-easyconfigs/pull/447>`_)

* added additional easyconfigs for goalf, gompi, ClangGCC, cgmvapich2, cgmvolf toolchains (`#350 <https://github.com/hpcugent/easybuild-easyconfigs/pull/350>`_, `#441 <https://github.com/hpcugent/easybuild-easyconfigs/pull/441>`_)

* added additional easyconfigs for various software packages:

  * ATLAS, Bison, bzip2, Clang, CMake, cURL, EasyBuild, expat, FFTW, GDB, gettext, git, HPL, LAPACK, libreadline,
    M4, METIS, MVAPICH2, Mercurial, ncurses, OpenBLAS, OpenMPI, ParMETIS, Python, ScaLAPACK, SCOTCH, Valgrind, zlib

* various 'bug' fixes, including:

  * fix source URL for lockfile in Python easyconfigs (`#428 <https://github.com/hpcugent/easybuild-easyconfigs/pull/428>`_)
  * correct dependency specifications w.r.t. versionsuffix and toolchain (`#431 <https://github.com/hpcugent/easybuild-easyconfigs/pull/431>`_)

    * this is required to support building the affected easyconfigs with a custom module naming scheme

  * correct PSI patch file to avoid errors w.r.t. memcpy not being in scope (`#446 <https://github.com/hpcugent/easybuild-easyconfigs/pull/446>`_)
  * fix gettext build with adding ``--without-emacs`` configure options, add gettext as dependency for a2ps (`#448 <https://github.com/hpcugent/easybuild-easyconfigs/pull/448>`_)
  * exclude EMACS support in a2ps because of build failures (`#452 <https://github.com/hpcugent/easybuild-easyconfigs/pull/452>`_)

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

  * Libint2 (`#236 <https://github.com/hpcugent/easybuild-easyblocks/pull/236>`_), Qt (`#210 <https://github.com/hpcugent/easybuild-easyblocks/pull/210>`_), Rosetta (`#218 <https://github.com/hpcugent/easybuild-easyblocks/pull/218>`_)

* various enhancements, including:

  * allow building OpenFOAM without 3rd party tools (`#230 <https://github.com/hpcugent/easybuild-easyblocks/pull/230>`_)
  * also add sitelib path to ``$PERL5LIB``, refactor code to add generic ``get_site_suffix`` function (`#232 <https://github.com/hpcugent/easybuild-easyblocks/pull/232>`_, `#233 <https://github.com/hpcugent/easybuild-easyblocks/pull/233>`_)
  * support building imkl FFT wrappers using MVAPICH2 MPI library (`#234 <https://github.com/hpcugent/easybuild-easyblocks/pull/234>`_)
  * remove libnpp from CUDA sanity check to support installing CUDA v5.5 (`#238 <https://github.com/hpcugent/easybuild-easyblocks/pull/238>`_)
  * pick up ``$INTEL_LICENSE_FILE`` for Intel tools, if it is set (`#243 <https://github.com/hpcugent/easybuild-easyblocks/pull/243>`_)
    * note: gets preference over ``license_file`` easyconfig parameter

* various bug fixes:

  * call WRF build script with '``tcsh <script>`` to ensure that tcsh available in ``$PATH`` is used (`#231 <https://github.com/hpcugent/easybuild-easyblocks/pull/231>`_)
  * make sure some environment variables that may disrupt the GCC install procedure are unset (`#237 <https://github.com/hpcugent/easybuild-easyblocks/pull/237>`_)
    * e.g., ``$CPATH``, ``$C_INCLUDE_PATH``, ``$CPLUS_INCLUDE_PATH``, ``$OBJC_INCLUDE_PATH``, ``$LIBRARY_PATH``

  * code cleanup in GEANT4 easyblock: use ``self.version`` (instead of ``self.get_installversion()``) (`#242 <https://github.com/hpcugent/easybuild-easyblocks/pull/242>`_)
  * enhance list of ``noqanda`` patterns for CUDA, to get less failing installations (`#244 <https://github.com/hpcugent/easybuild-easyblocks/pull/244>`_)

**easyconfigs**

* added example easyconfig files for **15** new software packages:

  * Glib (`#294 <https://github.com/hpcugent/easybuild-easyconfigs/pull/294>`_, `#400 <https://github.com/hpcugent/easybuild-easyconfigs/pull/400>`_), GLPK (`#400 <https://github.com/hpcugent/easybuild-easyconfigs/pull/400>`_), horton (`#413 <https://github.com/hpcugent/easybuild-easyconfigs/pull/413>`_), libint2 (`#413 <https://github.com/hpcugent/easybuild-easyconfigs/pull/413>`_), molmod (`#413 <https://github.com/hpcugent/easybuild-easyconfigs/pull/413>`_), Rosetta (`#336 <https://github.com/hpcugent/easybuild-easyconfigs/pull/336>`_), SCons (`#336 <https://github.com/hpcugent/easybuild-easyconfigs/pull/336>`_), Stacks (`#367 <https://github.com/hpcugent/easybuild-easyconfigs/pull/367>`_, `#377 <https://github.com/hpcugent/easybuild-easyconfigs/pull/377>`_), sympy (`#413 <https://github.com/hpcugent/easybuild-easyconfigs/pull/413>`_), Qt (`#294 <https://github.com/hpcugent/easybuild-easyconfigs/pull/294>`_), XML-LibXML (`#397 <https://github.com/hpcugent/easybuild-easyconfigs/pull/397>`_), XML-Simple (`#397 <https://github.com/hpcugent/easybuild-easyconfigs/pull/397>`_), yaff (`#413 <https://github.com/hpcugent/easybuild-easyconfigs/pull/413>`_), YAML-Syck (`#380 <https://github.com/hpcugent/easybuild-easyconfigs/pull/380>`_), zsh (`#376 <https://github.com/hpcugent/easybuild-easyconfigs/pull/376>`_)

* added additional easyconfigs for various software packages:

  * BLAST, BamTools, BioPerl, Bison, Boost, bzip2, CMake, Cython, CUDA, FFTW, FIAT, GCC, GMP, gettext, git, h5py,
    HDF5, libffi, libreadline, libxc, matplotlib, METIS, ncurses, Oases, Python, RAxML, ScientificPython, Szip,
    tcsh, imkl, MVAPICH2, TotalView, VTune, WRF, zlib

* added toolchain easyconfig files for HPCBIOS policies (`#402 <https://github.com/hpcugent/easybuild-easyconfigs/pull/402>`_, `#407 <https://github.com/hpcugent/easybuild-easyconfigs/pull/407>`_)

  * HPCBIOS_BioInfo, HPCBIOS_Debuggers, HPCBIOS_LifeSciences, HPCBIOS_Math, HPCBIOS_Profilers

* various enhancements, including:

  * added more XML Perl modules to non-bare Perl easyconfigs (`#375 <https://github.com/hpcugent/easybuild-easyconfigs/pull/375>`_)

* various 'bug' fixes, including:

  * fix website/description in scipy easyconfigs (`#399 <https://github.com/hpcugent/easybuild-easyconfigs/pull/399>`_)
  * specify OpenMPI libibverbs-dev(el) OS dependency in an OS-dependent way (`#403 <https://github.com/hpcugent/easybuild-easyconfigs/pull/403>`_)
  * add patch file for M4 to fix building on systems with recent glibc (>=2.16) (`#406 <https://github.com/hpcugent/easybuild-easyconfigs/pull/406>`_)
  * align moduleclass in R easyconfigs (`#411 <https://github.com/hpcugent/easybuild-easyconfigs/pull/411>`_)
  * fixed filename of Biopython/CD-HIT easyconfig files (`#407 <https://github.com/hpcugent/easybuild-easyconfigs/pull/407>`_)
  * disable parallel building of otcl (`#419 <https://github.com/hpcugent/easybuild-easyconfigs/pull/419>`_)

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

  * BamTools (`#224 <https://github.com/hpcugent/easybuild-easyblocks/pull/224>`_), BLAT (`#214 <https://github.com/hpcugent/easybuild-easyblocks/pull/214>`_)

* various enhancements, including:

  * update impi easyblock to allow installing impi v4.1.1, which features a slight change in build procedure (`#217 <https://github.com/hpcugent/easybuild-easyblocks/pull/217>`_)
  * enhance ``PackedBinary`` easyblock to copy both files and directories (`#212 <https://github.com/hpcugent/easybuild-easyblocks/pull/212>`_)
  * added get ``sitearch_suffix`` to Perl search path and use it in ``PerlModule`` easyblock (`#209 <https://github.com/hpcugent/easybuild-easyblocks/pull/209>`_)

* various bug fixes:

  * make sure EasyBuild configuration is initialized when running unit tests (`#220 <https://github.com/hpcugent/easybuild-easyblocks/pull/220>`_)
  * make Boost easyblock pick up configopts easyconfig parameter (`#221 <https://github.com/hpcugent/easybuild-easyblocks/pull/221>`_)
  * add ``-DMPICH_IGNORE_CXX_SEEK`` compiler flag for Mothur when MPI support is enabled (`#222 <https://github.com/hpcugent/easybuild-easyblocks/pull/222>`_)
  * fix Boost sanity check, only check for ``libboost_python.so`` if Python module is loaded (`#223 <https://github.com/hpcugent/easybuild-easyblocks/pull/223>`_)
  * enhance Trinity support w.r.t. jellyfish (`#225 <https://github.com/hpcugent/easybuild-easyblocks/pull/225>`_, `#227 <https://github.com/hpcugent/easybuild-easyblocks/pull/227>`_)
  * fix checking for ``beagle-lib`` dep (deprecate checking for BEAGLE) for MrBayes (`#228 <https://github.com/hpcugent/easybuild-easyblocks/pull/228>`_)

**easyconfigs**

* added example easyconfig files for **26** new software packages:

  * ALLPATHS-LG (`#359 <https://github.com/hpcugent/easybuild-easyconfigs/pull/359>`_), AutoMake (`#347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/347>`_), BamTools (`#319 <https://github.com/hpcugent/easybuild-easyconfigs/pull/319>`_, `#338 <https://github.com/hpcugent/easybuild-easyconfigs/pull/338>`_), BLAT (`#340 <https://github.com/hpcugent/easybuild-easyconfigs/pull/340>`_), Biopython (`#356 <https://github.com/hpcugent/easybuild-easyconfigs/pull/356>`_), cairo (`#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_),
    CCfits (`#327 <https://github.com/hpcugent/easybuild-easyconfigs/pull/327>`_), CD-HIT (`#344 <https://github.com/hpcugent/easybuild-easyconfigs/pull/344>`_), CFITSIO (`#327 <https://github.com/hpcugent/easybuild-easyconfigs/pull/327>`_), Diffutils (`#347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/347>`_), FASTA (`#358 <https://github.com/hpcugent/easybuild-easyconfigs/pull/358>`_, `#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_), findutils (`#347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/347>`_),
    fontconfig (`#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_), gawk (`#347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/347>`_), gettext (`#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_), GLIMMER (`#357 <https://github.com/hpcugent/easybuild-easyconfigs/pull/357>`_, `#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_), libidn (`#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_), LibTIFF (`#347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/347>`_),
    libungif (`#347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/347>`_), make (`#355 <https://github.com/hpcugent/easybuild-easyconfigs/pull/355>`_), MUSCLE (`#339 <https://github.com/hpcugent/easybuild-easyconfigs/pull/339>`_), Oases (`#354 <https://github.com/hpcugent/easybuild-easyconfigs/pull/354>`_), pixman (`#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_), PLINK (`#352 <https://github.com/hpcugent/easybuild-easyconfigs/pull/352>`_), RCS (`#347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/347>`_), SQLite (`#347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/347>`_)

* added additional easyconfigs for various software packages:

  * ant, Bash, Bison, bzip2, cURL, expat, GCC, EasyBuild, freetype, FFTW, GDB, git, HMMER, JUnit, libreadline, libpng,
    libtool, libxml2, libxslt, M4, makedepend, Mothur, MVAPICH2, Mercurial, ncurses, OpenBLAS, Python, ScaLAPACK, Tcl,
    tcsh, TopHat, Trinity, Valgrind, Velvet, VTune, zlib (see `#169 <https://github.com/hpcugent/easybuild-easyconfigs/pull/169>`_, `#297 <https://github.com/hpcugent/easybuild-easyconfigs/pull/297>`_, `#298 <https://github.com/hpcugent/easybuild-easyconfigs/pull/298>`_, `#301 <https://github.com/hpcugent/easybuild-easyconfigs/pull/301>`_, `#309 <https://github.com/hpcugent/easybuild-easyconfigs/pull/309>`_, `#323 <https://github.com/hpcugent/easybuild-easyconfigs/pull/323>`_, `#331 <https://github.com/hpcugent/easybuild-easyconfigs/pull/331>`_, `#332 <https://github.com/hpcugent/easybuild-easyconfigs/pull/332>`_, `#341 <https://github.com/hpcugent/easybuild-easyconfigs/pull/341>`_, `#347 <https://github.com/hpcugent/easybuild-easyconfigs/pull/347>`_, `#349 <https://github.com/hpcugent/easybuild-easyconfigs/pull/349>`_, `#351 <https://github.com/hpcugent/easybuild-easyconfigs/pull/351>`_, `#355 <https://github.com/hpcugent/easybuild-easyconfigs/pull/355>`_, `#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_)

* various enhancements, including:

  * added easyconfigs for ``ictce/5.4.0``, ``ictce/5.5.0`` and ``gmvolf/1.7.12`` toolchain modules (`#297 <https://github.com/hpcugent/easybuild-easyconfigs/pull/297>`_, `#332 <https://github.com/hpcugent/easybuild-easyconfigs/pull/332>`_, `#349 <https://github.com/hpcugent/easybuild-easyconfigs/pull/349>`_)
  * added a template sanity_check_paths as 'MUST' in TEMPLATE.eb (`#329 <https://github.com/hpcugent/easybuild-easyconfigs/pull/329>`_)
  * introduced biodeps 'toolchain' to ease keeping common dependencies for bio* software in sync (`#309 <https://github.com/hpcugent/easybuild-easyconfigs/pull/309>`_)
  * added collection of easyconfigs for ictce/5.3.0 (`#309 <https://github.com/hpcugent/easybuild-easyconfigs/pull/309>`_, `#323 <https://github.com/hpcugent/easybuild-easyconfigs/pull/323>`_)

    * bam2fastq, bbFTP, BLAST, Boost, DL_POLY Classic, EMBOSS, FFTW, libharu, libxml2, libxslt, libyaml, lxml,
      Mercurial, Mothur, mpi4py, ncurses, ns, orthomcl, otcl, PAML, Perl, PyYAML, pandas, problog, scikit-learn,
      TiCCutils, TiMBL, TinySVM, TopHat, tclcl, YamCha

  * added missing dependencies for various software packages (`#323 <https://github.com/hpcugent/easybuild-easyconfigs/pull/323>`_, `#328 <https://github.com/hpcugent/easybuild-easyconfigs/pull/328>`_, `#348 <https://github.com/hpcugent/easybuild-easyconfigs/pull/348>`_, `#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_)
  * style fixes in various easyconfigs (`#309 <https://github.com/hpcugent/easybuild-easyconfigs/pull/309>`_, `#323 <https://github.com/hpcugent/easybuild-easyconfigs/pull/323>`_, `#345 <https://github.com/hpcugent/easybuild-easyconfigs/pull/345>`_, `#349 <https://github.com/hpcugent/easybuild-easyconfigs/pull/349>`_, `#355 <https://github.com/hpcugent/easybuild-easyconfigs/pull/355>`_, `#361 <https://github.com/hpcugent/easybuild-easyconfigs/pull/361>`_)

* various 'bug' fixes, including:

  * added ``pic`` toolchain option for Perl goolf easyconfig (`#299 <https://github.com/hpcugent/easybuild-easyconfigs/pull/299>`_)
  * fixed source URLs for R (use correct template ``%(version_major)s``) (`#302 <https://github.com/hpcugent/easybuild-easyconfigs/pull/302>`_)
  * synced libreadline easyconfigs w.r.t. ncurses dependency (`#303 <https://github.com/hpcugent/easybuild-easyconfigs/pull/303>`_)
  * make sure EasyBuild configuration is initialized when running unit tests (`#334 <https://github.com/hpcugent/easybuild-easyconfigs/pull/334>`_)
  * specify ``lowopt`` (-O1) optimization level for OpenIFS, to avoid floating-point related issues (`#328 <https://github.com/hpcugent/easybuild-easyconfigs/pull/328>`_)
  * fix naming of 'beagle-lib' (used to be 'BEAGLE'), to avoid name clashes with other software package(s) (`#346 <https://github.com/hpcugent/easybuild-easyconfigs/pull/346>`_)

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

* added **one** new `generic` easyblock: ``MakeCp`` (`#208 <https://github.com/hpcugent/easybuild-easyblocks/pull/208>`_)
* added support for **5** new software packages that require customized support:

  * CBLAS (`#192 <https://github.com/hpcugent/easybuild-easyblocks/pull/192>`_), FreeSurfer (`#194 <https://github.com/hpcugent/easybuild-easyblocks/pull/194>`_), Mothur (`#206 <https://github.com/hpcugent/easybuild-easyblocks/pull/206>`_), OpenIFS (`#200 <https://github.com/hpcugent/easybuild-easyblocks/pull/200>`_), PSI (`#191 <https://github.com/hpcugent/easybuild-easyblocks/pull/191>`_)

* various enhancements, including:

  * add support for building ScaLAPACK 2.x on top of QLogic MPI (`#195 <https://github.com/hpcugent/easybuild-easyblocks/pull/195>`_)
  * support newer BWA versions (`#199 <https://github.com/hpcugent/easybuild-easyblocks/pull/199>`_)
  * explicitly list license server type in ABAQUS install options, required for correct installation of v6.12 (`#198 <https://github.com/hpcugent/easybuild-easyblocks/pull/198>`_)
  * update SCOTCH and OpenFOAM easyblock for recent versions (`#201 <https://github.com/hpcugent/easybuild-easyblocks/pull/201>`_)

* various bug fixes:

  * fix numpy easyblock to get an optimal build (w.r.t. ``numpy.dot`` performance) (`#192 <https://github.com/hpcugent/easybuild-easyblocks/pull/192>`_)
  * correct build procedure for MUMmer to yield a complete installation (`#196 <https://github.com/hpcugent/easybuild-easyblocks/pull/196>`_, `#197 <https://github.com/hpcugent/easybuild-easyblocks/pull/197>`_)
  * make unit tests clean up after themselves more thoroughly (`#203 <https://github.com/hpcugent/easybuild-easyblocks/pull/203>`_, `#204 <https://github.com/hpcugent/easybuild-easyblocks/pull/204>`_)
  * fix getting Perl version for extensions (`#205 <https://github.com/hpcugent/easybuild-easyblocks/pull/205>`_)

**easyconfigs**

* added example easyconfig files for **23** new software packages:

  * bam2fastq (`#287 <https://github.com/hpcugent/easybuild-easyconfigs/pull/287>`_), CBLAS (`#263 <https://github.com/hpcugent/easybuild-easyconfigs/pull/263>`_), EMBOSS (`#265 <https://github.com/hpcugent/easybuild-easyconfigs/pull/265>`_, `#290 <https://github.com/hpcugent/easybuild-easyconfigs/pull/290>`_), FCM (`#272 <https://github.com/hpcugent/easybuild-easyconfigs/pull/272>`_), FRC_align (`#273 <https://github.com/hpcugent/easybuild-easyconfigs/pull/273>`_), freeglut (`#271 <https://github.com/hpcugent/easybuild-easyconfigs/pull/271>`_),
    FreeSurfer (`#271 <https://github.com/hpcugent/easybuild-easyconfigs/pull/271>`_), FSL (`#271 <https://github.com/hpcugent/easybuild-easyconfigs/pull/271>`_), GATK (`#287 <https://github.com/hpcugent/easybuild-easyconfigs/pull/287>`_), libharu (`#290 <https://github.com/hpcugent/easybuild-easyconfigs/pull/290>`_), libxslt (`#235 <https://github.com/hpcugent/easybuild-easyconfigs/pull/235>`_), MariaDB (`#292 <https://github.com/hpcugent/easybuild-easyconfigs/pull/292>`_), Mothur (`#265 <https://github.com/hpcugent/easybuild-easyconfigs/pull/265>`_)
    mpi4py (`#276 <https://github.com/hpcugent/easybuild-easyconfigs/pull/276>`_), OpenIFS (`#272 <https://github.com/hpcugent/easybuild-easyconfigs/pull/272>`_), orthomcl (`#265 <https://github.com/hpcugent/easybuild-easyconfigs/pull/265>`_), PAML (`#287 <https://github.com/hpcugent/easybuild-easyconfigs/pull/287>`_), pandas (`#262 <https://github.com/hpcugent/easybuild-easyconfigs/pull/262>`_), phonopy (`#235 <https://github.com/hpcugent/easybuild-easyconfigs/pull/235>`_), problog (`#277 <https://github.com/hpcugent/easybuild-easyconfigs/pull/277>`_),
    PSI (`#258 <https://github.com/hpcugent/easybuild-easyconfigs/pull/258>`_), PyYAML (`#235 <https://github.com/hpcugent/easybuild-easyconfigs/pull/235>`_), RAxML (`#277 <https://github.com/hpcugent/easybuild-easyconfigs/pull/277>`_)

* added additional example easyconfig files for:

  * ABINIT (`#235 <https://github.com/hpcugent/easybuild-easyconfigs/pull/235>`_), ACML (`#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_), BLAST (`#275 <https://github.com/hpcugent/easybuild-easyconfigs/pull/275>`_), Boost (`#273 <https://github.com/hpcugent/easybuild-easyconfigs/pull/273>`_), BWA (`#270 <https://github.com/hpcugent/easybuild-easyconfigs/pull/270>`_), bzip2 (`#263 <https://github.com/hpcugent/easybuild-easyconfigs/pull/263>`_), Chapel (`#240 <https://github.com/hpcugent/easybuild-easyconfigs/pull/240>`_), CMake (`#290 <https://github.com/hpcugent/easybuild-easyconfigs/pull/290>`_),
    FFTW2 (`#247 <https://github.com/hpcugent/easybuild-easyconfigs/pull/247>`_, `#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_), flex (`#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_), freetype (`#235 <https://github.com/hpcugent/easybuild-easyconfigs/pull/235>`_), grib_api (`#272 <https://github.com/hpcugent/easybuild-easyconfigs/pull/272>`_), gzip (`#265 <https://github.com/hpcugent/easybuild-easyconfigs/pull/265>`_), Java (`#279 <https://github.com/hpcugent/easybuild-easyconfigs/pull/279>`_), libpng (`#240 <https://github.com/hpcugent/easybuild-easyconfigs/pull/240>`_, `#279 <https://github.com/hpcugent/easybuild-easyconfigs/pull/279>`_),
    libreadline (`#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_), libxml2 (`#235 <https://github.com/hpcugent/easybuild-easyconfigs/pull/235>`_), libxml (`#235 <https://github.com/hpcugent/easybuild-easyconfigs/pull/235>`_), matplotlib (`#235 <https://github.com/hpcugent/easybuild-easyconfigs/pull/235>`_), MCL (`#265 <https://github.com/hpcugent/easybuild-easyconfigs/pull/265>`_), MUMmer (`#265 <https://github.com/hpcugent/easybuild-easyconfigs/pull/265>`_), ncurses (`#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_),
    numpy (`#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_), OpenFOAM (`#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_), Perl (`#265 <https://github.com/hpcugent/easybuild-easyconfigs/pull/265>`_), Python (`#276 <https://github.com/hpcugent/easybuild-easyconfigs/pull/276>`_, `#263 <https://github.com/hpcugent/easybuild-easyconfigs/pull/263>`_), R (`#240 <https://github.com/hpcugent/easybuild-easyconfigs/pull/240>`_, `#279 <https://github.com/hpcugent/easybuild-easyconfigs/pull/279>`_), SCOTCH (`#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_), ScaLAPACK (`#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_),
    TopHat (`#289 <https://github.com/hpcugent/easybuild-easyconfigs/pull/289>`_), Valgrind (`#255 <https://github.com/hpcugent/easybuild-easyconfigs/pull/255>`_), zlib (`#267 <https://github.com/hpcugent/easybuild-easyconfigs/pull/267>`_)

* various enhancements, including:

  * enhance unit test suite, include testing for module conflicts (`#256 <https://github.com/hpcugent/easybuild-easyconfigs/pull/256>`_) and presence of patch files (`#264 <https://github.com/hpcugent/easybuild-easyconfigs/pull/264>`_)
  * use provided constants and templates in easyconfig files where appropriate (`#248 <https://github.com/hpcugent/easybuild-easyconfigs/pull/248>`_, `#266 <https://github.com/hpcugent/easybuild-easyconfigs/pull/266>`_, `#281 <https://github.com/hpcugent/easybuild-easyconfigs/pull/281>`_)

* various 'bug' fixes, including:

  * get rid of hardcoded license_file paths for VTune, Inspector (`#253 <https://github.com/hpcugent/easybuild-easyconfigs/pull/253>`_)
  * assign proper moduleclass where they were missing (`#278 <https://github.com/hpcugent/easybuild-easyconfigs/pull/278>`_)
  * fix naming for LZO (`#280 <https://github.com/hpcugent/easybuild-easyconfigs/pull/280>`_)
  * make unit tests clean up after themselves more thoroughly (`#283 <https://github.com/hpcugent/easybuild-easyconfigs/pull/283>`_, `#284 <https://github.com/hpcugent/easybuild-easyconfigs/pull/284>`_, `#285 <https://github.com/hpcugent/easybuild-easyconfigs/pull/285>`_, `#286 <https://github.com/hpcugent/easybuild-easyconfigs/pull/286>`_)
  * fix TopHat dependencies (`#289 <https://github.com/hpcugent/easybuild-easyconfigs/pull/289>`_)
  * fix source URLs for XML (`#279 <https://github.com/hpcugent/easybuild-easyconfigs/pull/279>`_)
  * fix versions for all listed R extensions (`#279 <https://github.com/hpcugent/easybuild-easyconfigs/pull/279>`_)
  * fix CUDA easyconfig file for use on Debian Squeeze (`#291 <https://github.com/hpcugent/easybuild-easyconfigs/pull/291>`_)
  * correct easyconfig filename and module name mismatches (bbcp, DL_POLY Classic, ...) (`#295 <https://github.com/hpcugent/easybuild-easyconfigs/pull/295>`_)

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

* added a unit test suite for easyblocks (`#175 <https://github.com/hpcugent/easybuild-easyblocks/pull/175>`_, `#177 <https://github.com/hpcugent/easybuild-easyblocks/pull/177>`_, `#178 <https://github.com/hpcugent/easybuild-easyblocks/pull/178>`_)

  * every easyblock is parsed and instantiated as a sanity check

* added **one** new `generic` easyblock: ``PerlModule`` (`#183 <https://github.com/hpcugent/easybuild-easyblocks/pull/183>`_)
* added support for **8** new software packages that require customized support:

  * ABAQUS (`#179 <https://github.com/hpcugent/easybuild-easyblocks/pull/179>`_), Bowtie (`#174 <https://github.com/hpcugent/easybuild-easyblocks/pull/174>`_, `#185 <https://github.com/hpcugent/easybuild-easyblocks/pull/185>`_, `#186 <https://github.com/hpcugent/easybuild-easyblocks/pull/186>`_), Clang (`#151 <https://github.com/hpcugent/easybuild-easyblocks/pull/151>`_), DL_POLY Classic (`#118 <https://github.com/hpcugent/easybuild-easyblocks/pull/118>`_), ESMF (`#171 <https://github.com/hpcugent/easybuild-easyblocks/pull/171>`_), Perl (`#183 <https://github.com/hpcugent/easybuild-easyblocks/pull/183>`_),
    Intel VTune and Intel Inspector (`#180 <https://github.com/hpcugent/easybuild-easyblocks/pull/180>`_)

* the ``CMakeMake.configure_step`` parameter ``builddir`` was renamed to ``srcdir``, because the name ``builddir`` is incorrect (`#151 <https://github.com/hpcugent/easybuild-easyblocks/pull/151>`_)

  * ``builddir`` will remain supported for legacy purposes up until v2.0

* various enhancements, including:

  * reverted back to hardcoding Python library path, since it's hardcoded by setuptools too (`#184 <https://github.com/hpcugent/easybuild-easyblocks/pull/184>`_)
  * added MPICH support in ScaLAPACK easyblock (`#172 <https://github.com/hpcugent/easybuild-easyblocks/pull/172>`_)
  * enhanced NCL easyblock: add support UDUNITS and ESMF dependencies (`#171 <https://github.com/hpcugent/easybuild-easyblocks/pull/171>`_)
  * enhanced MATLAB easyblock: avoid hardcoding Java options, make sure ``$DISPLAY`` is unset, extend list of sanity check paths (`#181 <https://github.com/hpcugent/easybuild-easyblocks/pull/181>`_)
  * enhanced TotalView easyblock: add support for license file (`#146 <https://github.com/hpcugent/easybuild-easyblocks/pull/146>`_)

**easyconfigs**

* added a unit test suite for easyconfigs (`#228 <https://github.com/hpcugent/easybuild-easyconfigs/pull/228>`_, `#230 <https://github.com/hpcugent/easybuild-easyconfigs/pull/230>`_)
* added example easyconfig files for **20** new software packages:
  * ABAQUS (`#231 <https://github.com/hpcugent/easybuild-easyconfigs/pull/231>`_), BioPerl (`#242 <https://github.com/hpcugent/easybuild-easyconfigs/pull/242>`_), Bowtie (`#227 <https://github.com/hpcugent/easybuild-easyconfigs/pull/227>`_), Clang (`#177 <https://github.com/hpcugent/easybuild-easyconfigs/pull/177>`_), CRF++ (`#131 <https://github.com/hpcugent/easybuild-easyconfigs/pull/131>`_), DL_POLY Classic (`#132 <https://github.com/hpcugent/easybuild-easyconfigs/pull/132>`_), ESMF, GROMACS (`#165 <https://github.com/hpcugent/easybuild-easyconfigs/pull/165>`_), HH-suite (`#219 <https://github.com/hpcugent/easybuild-easyconfigs/pull/219>`_), Inspector (`#232 <https://github.com/hpcugent/easybuild-easyconfigs/pull/232>`_), likwid (`#131 <https://github.com/hpcugent/easybuild-easyconfigs/pull/131>`_), Perl (`#242 <https://github.com/hpcugent/easybuild-easyconfigs/pull/242>`_), scikit (`#133 <https://github.com/hpcugent/easybuild-easyconfigs/pull/133>`_), TiCCutils (`#131 <https://github.com/hpcugent/easybuild-easyconfigs/pull/131>`_), TiMBL (`#131 <https://github.com/hpcugent/easybuild-easyconfigs/pull/131>`_), TinySVM (`#131 <https://github.com/hpcugent/easybuild-easyconfigs/pull/131>`_), UDUNITS (`#167 <https://github.com/hpcugent/easybuild-easyconfigs/pull/167>`_), VTune (`#232 <https://github.com/hpcugent/easybuild-easyconfigs/pull/232>`_), YamCha (`#131 <https://github.com/hpcugent/easybuild-easyconfigs/pull/131>`_)

* add example easyconfigs for new compiler toolchains (use ``eb --list-toolchains`` for a full list of supported toolchains):

  * the newly added toolchains only differ in compilers/MPI library, and all feature OpenBLAS, LAPACK, ScaLAPACK and FFTW
  * `goolfc`: GCC, CUDA (co-compiler), OpenMPI (`#191 <https://github.com/hpcugent/easybuild-easyconfigs/pull/191>`_)

    * a goolfc easyconfig for GROMACS is inluded as proof-of-concept (`#165 <https://github.com/hpcugent/easybuild-easyconfigs/pull/165>`_)

  * `cgmpolf`: Clang (C/C++ compilers), GCC (Fortran compilers), MPICH (`#213 <https://github.com/hpcugent/easybuild-easyconfigs/pull/213>`_)
  * `cgmvolf`: Clang, GCC, MVAPICH2 (`#218 <https://github.com/hpcugent/easybuild-easyconfigs/pull/218>`_)
  * `cgoolf`: Clang, GCC, OpenMPI (`#213 <https://github.com/hpcugent/easybuild-easyconfigs/pull/213>`_)
  * `gmvolf`: GCC, MVAPICH (`#202 <https://github.com/hpcugent/easybuild-easyconfigs/pull/202>`_, `#222 <https://github.com/hpcugent/easybuild-easyconfigs/pull/222>`_)

* ported already available easyconfigs to new compiler toolchains:

  * `ictce-5.3.0`: 193 easyconfigs (`#229 <https://github.com/hpcugent/easybuild-easyconfigs/pull/229>`_)
  * `cgmpolf`: 11 easyconfigs (`#213 <https://github.com/hpcugent/easybuild-easyconfigs/pull/213>`_)
  * `cgmvolf`: 11 easyconfigs (`#218 <https://github.com/hpcugent/easybuild-easyconfigs/pull/218>`_)
  * `cgoolf`: 12 easyconfigs (`#213 <https://github.com/hpcugent/easybuild-easyconfigs/pull/213>`_)
  * `gmvolf`: 10 easyconfigs (`#215 <https://github.com/hpcugent/easybuild-easyconfigs/pull/215>`_)

* added additional example easyconfig files for:

  * CMake (`#163 <https://github.com/hpcugent/easybuild-easyconfigs/pull/163>`_), git (`#210 <https://github.com/hpcugent/easybuild-easyconfigs/pull/210>`_), Java (`#206 <https://github.com/hpcugent/easybuild-easyconfigs/pull/206>`_), `#221 <https://github.com/hpcugent/easybuild-easyconfigs/pull/221>`_, Mercurial (`#201 <https://github.com/hpcugent/easybuild-easyconfigs/pull/201>`_, `#215 <https://github.com/hpcugent/easybuild-easyconfigs/pull/215>`_), ncurses (`#225 <https://github.com/hpcugent/easybuild-easyconfigs/pull/225>`_), TotalView (`#160 <https://github.com/hpcugent/easybuild-easyconfigs/pull/160>`_)

* various enhancements, including:

  * added ESMF and UDUNITS dependencies to NCL easyconfigs (`#211 <https://github.com/hpcugent/easybuild-easyconfigs/pull/211>`_)
  * changed value of source_urls in R easyconfigs, to be generic enough for version 3.0 and possibly beyond (`#251 <https://github.com/hpcugent/easybuild-easyconfigs/pull/251>`_)

* various 'bug' fixes, including:

  * add ``--enable-mpirun-prefix-by-default`` configure option for all OpenMPI easyconfigs (#205)

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

  * CUDA (`#145 <https://github.com/hpcugent/easybuild-easyblocks/pull/145>`_), Ferret (`#160 <https://github.com/hpcugent/easybuild-easyblocks/pull/160>`_, `#163 <https://github.com/hpcugent/easybuild-easyblocks/pull/163>`_)

* remove ``license`` easyconfig parameter from ``IntelBase``, since it clashes with generic ``license`` parameter (`#153 <https://github.com/hpcugent/easybuild-easyblocks/pull/153>`_, `#158 <https://github.com/hpcugent/easybuild-easyblocks/pull/158>`_)

  * ``license_file`` should be used instead (see `framework#569 <https://github.com/hpcugent/easybuild-easyblocks/pull/569/files>`_)
  * using ``license`` instead of ``license_file`` will be supported until v2.x for legacy purposes

* various enhancements, including:

  * stop hardcoding Python site-packages library dir, obtain it via ``distutils.sysconfig`` instead (`#141 <https://github.com/hpcugent/easybuild-easyblocks/pull/141>`_, `#156 <https://github.com/hpcugent/easybuild-easyblocks/pull/156>`_, `#159 <https://github.com/hpcugent/easybuild-easyblocks/pull/159>`_, `#161 <https://github.com/hpcugent/easybuild-easyblocks/pull/161>`_)
  * stop hardcoding list of libraries for BLAS libs, ask toolchain modules or use ``$LIBBLAS`` instead (`#150 <https://github.com/hpcugent/easybuild-easyblocks/pull/150>`_, `#155 <https://github.com/hpcugent/easybuild-easyblocks/pull/155>`_)
  * enhanced CP2K easyblock, following Intel guidelines for ``ictce`` builds (`#138 <https://github.com/hpcugent/easybuild-easyblocks/pull/138>`_)
  * added ``setup.cfg`` for ``setup.py`` to allow creating RPMs (`#140 <https://github.com/hpcugent/easybuild-easyblocks/pull/140>`_)
  * clean up specifying BLAS/LAPACK libs for building numpy, check whether requires patch is being used for IMKL builds (`#155 <https://github.com/hpcugent/easybuild-easyblocks/pull/155>`_, `#161 <https://github.com/hpcugent/easybuild-easyblocks/pull/161>`_)

* various bug fixes, including:

  * added ``zip_safe`` flag to ``setup.py``, to silence multitude of warnings (`#135 <https://github.com/hpcugent/easybuild-easyblocks/pull/135>`_)
  * install EasyBuild packages in reversed order to avoid funky setuptools issues (`#139 <https://github.com/hpcugent/easybuild-easyblocks/pull/139>`_)
  * fixed a typo in the ScaLAPACK easyblock, and set CCFLAGS and FCFLAGS for v2.x (`#149 <https://github.com/hpcugent/easybuild-easyblocks/pull/149>`_, `#162 <https://github.com/hpcugent/easybuild-easyblocks/pull/162>`_)
  * fix sanity check for python-meep (`#159 <https://github.com/hpcugent/easybuild-easyblocks/pull/159>`_)
  * exclude Python tests from DOLFIN sanity check, since they hang sometimes (`#161 <https://github.com/hpcugent/easybuild-easyblocks/pull/161>`_)
  * add support in ALADIN easyblock for answering question on location of ``libgrib_api.a`` (`#165 <https://github.com/hpcugent/easybuild-easyblocks/pull/165>`_)

**easyconfigs**

* added example easyconfig files for **13** new software packages:

  * Bash, CUDA, ccache, Ferret, gzip, libxc, ns, numactl, OpenBLAS, otcl, Tar, tclcl, tcsh
  * several of these easyconfig files were contributed by attendees of the EasyBuild hackathon in Cyprus!

* added example easyconfigs for goolf toolchain (`#158 <https://github.com/hpcugent/easybuild-easyconfigs/pull/158>`_)
* added example easyconfigs for builds with goolf toolchain, i.e. for all goalf easyconfigs (`#189 <https://github.com/hpcugent/easybuild-easyconfigs/pull/189>`_)

  * for several software packages, a patch file was needed to get them to build with GCC 4.7:

    * AMOS, BEAGLE, Cufflinks, DOLFIN, GATE, ns, Pasha, Trilinos, Trinity

  * for PETSc, a patch file was required to make it build with a toolchain that doesn't include BLACS

* added additional example easyconfig files for:

  * gompi, hwloc, LAPACK, MVAPICH2, OpenMPI, ScaLAPACK

* various enhancements, including:

  * define a proper module class in `all` easyconfigs, cfr. default module classes defined in framework (`#150 <https://github.com/hpcugent/easybuild-easyconfigs/pull/150>`_, `#159 <https://github.com/hpcugent/easybuild-easyconfigs/pull/159>`_, `#161 <https://github.com/hpcugent/easybuild-easyconfigs/pull/161>`_, `#162 <https://github.com/hpcugent/easybuild-easyconfigs/pull/162>`_, `#179 <https://github.com/hpcugent/easybuild-easyconfigs/pull/179>`_, `#181 <https://github.com/hpcugent/easybuild-easyconfigs/pull/181>`_)
  * extend FFTW easyconfig to 'fat' builds that include single, double, long double and quad precision libraries in the same module

    * quad precision is disabled for Intel compiler based builds (it requires GCC v4.6+)

  * the imkl easyconfigs used for the ictce 3.2.2.u3 toolchain now also enable FFTW interfaces

* various 'bug' fixes, including:

  * fix filename for Mercurial and ROOT easyconfig files
  * fix homepage/description for Hypre
  * fix enabling OpenMP support in OpenMPI: use ``--enable-openmp``, not ``--with-openmp``
  * use correct configure flag for enabling OpenMPI threading support in v1.6 (`#186 <https://github.com/hpcugent/easybuild-easyconfigs/pull/186>`_)

    * ``--enable-mpi-thread-multiple`` instead of ``--enable-mpi-threads``

  * explicitely add ``--without-openib --without-udapl`` configure options in OpenMPI easyconfig using versionsuffix ``-no-OFED`` (`#168 <https://github.com/hpcugent/easybuild-easyconfigs/pull/168>`_)

    * this avoids that OpenMPI auto-detects that it can enable Infiniband (OpenIB) support, which doesn't fit the -no-OFED versionsuffix
    * Note: this makes goalf-1.1.0-no-OFED effectively not suitable to produce software builds that are IB-capable!

  * remove explicit ``--with-udapl`` from OpenMPI easyconfigs, does more harm than good (`#178 <https://github.com/hpcugent/easybuild-easyconfigs/pull/178>`_)
  * remove libibvers, libibmad, libibumad as explicit dependencies for OpenMPI/MVAPICH2 (`#173 <https://github.com/hpcugent/easybuild-easyconfigs/pull/173>`_, `#182 <https://github.com/hpcugent/easybuild-easyconfigs/pull/182>`_)

    * leave it up to the OS to provide these, since the required version is too much tied to the version of IB drivers

  * use ``license_file`` in Intel tools easyconfigs, as opposed to the new generic ``license`` parameter with a different meaning (`#180 <https://github.com/hpcugent/easybuild-easyconfigs/pull/180>`_)
  * modify patch for impi to avoid installation problems due to hardcoded path in /tmp (`#185 <https://github.com/hpcugent/easybuild-easyconfigs/pull/185>`_)

    * now uses ``$USER-$RANDOM`` subdir to avoid clashes between different users on the same system

  * the patch file for numpy was extended to also supporting ATLAS and other BLAS libraries spread across multiple directories

    * the extension for ATLAS is required because we now no longer rely on the automatic numpy mechanism to find the ATLAS libs

  * fixed dependencies:

    * libibumad as dependency for libibmad
    * ncurses as dependency for libreadline
    * ncurses and zlib as dependency for SAMtools (+ enhanced patch)
    * remove explicit FFTW dependency for Meep, ... since toolchain already provided FFTW

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

* added example easyconfig files for **41** new software packages:

  * a2ps, AnalyzeFMRI, aria, bbcp, bbFTP, bbftpPRO, binutils, Bonnie++, ccache, cflow, cgdb, Corkscrew, EasyBuild,
    Elinks, EPD, FLUENT, fmri, GDB, GDAL, gnuplot, gnutls, gperf, Iperf, lftp, libyaml, lzo, MATLAB, mc, nano, NASM,
    nettle, numexpr, parallel, pyTables, QLogic MPI, Stow, TotalView, Valgrind, VTK, Yasm, zsync

* added example easyconfigs for iqacml and iiqmpi toolchains
* added additional example easyconfig files for:

  * ABINIT, ABySS, ACML, BFAST, Bison, BLACS, Cython, cURL, Doxygen, FFTW, flex, g2clib, g2lib, GHC, h5py, HDF, HDF5,
    HMMER, JasPer, icc, ictce, ifort, imkl, impi, libpng, libreadline, M4, matplotlib, MCL, MEME, mpiBLAST, NCL,
    ncurses, netCDF, netCDF-Fortran, NWChem, R, ScaLAPACK, Tcl, Tk, WPS, WRF, zlib

* various enhancements, including:

  * fix version of xtable R library in list of extensions for R, to avoid installation failures

* various 'bug' fixes, including:

  * fix toolchain and file names for ABINIT easyconfigs
  * fix sanity check paths for cURL
  * don't disable ``optarch`` for WRF, it's not needed (only disable heavy optimizations is required)
  * fix homepage/description for ALADIN

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

* added example easyconfig files for **48** new software packages:

  * ABINIT, ABySS, ACML, ALADIN, ant, BFAST, BLAST, Chapel, CLHEP, Cufflinks, ESPRresSo, GATE, GHC, Geant4,
    Greenlet, google-sparsehash, grib_api, HMMER, Java, JUnit, libibmad, libibumad, libibverbs, MCL, MDP,
    MEME, mpiBLAST, NCBI Toolkit, NEURON, NWChem, numpy, MDP, Oger, OpenPGM, paycheck, PyZMQ, QuantumESPRESSO,
    R, ROOT, SCOOP, scipy, Tophat, Trinity, util-linux, VSC-tools, wiki2beamer, XML, ZeroMQ

* added example easyconfigs for gmacml, gmvapich2, iccifort, ictce, iomkl toolchains
* added additional example easyconfig files for:

  * ATLAS, BLACS, Boost, Bowtie2, bzip2, CP2K, Doxygen, FFTW, GCC, HDF5, hwloc, icc, ifort, imkl, impi,
    JasPer, Libint, libreadline, libsmm, libxml, ncurses, netCDF, M4, Meep, MVAPICH2, OpenMPI, Python,
    ScaLAPACK, Szip, zlib

* various enhancements, including:

  * major style cleanup of all example easyconfig file (PEP008 compliance)
  * added setuptools to list of Python extensions
  * get rid of ``parallel`` versionsuffix for HDF5, as its meaningless (MPI-enabled build is always parallel)

* various 'bug' fixes, i.e. added missing dependencies or replaced OS dependencies with proper dependencies

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

* fixed source URL for ligtextutils (toolchain refactoring error)

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

* remove patch file for OpenMPI to resolve issue with pax hanging configure

  * ``tar_config_opts`` should be enabled as needed

* disable parallel build for PAPI, seems to be causing problems

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

  * Armadillo, BiSearch, Boost, Bowtie2, BWA, bzip2, CGAL, CPLEX, DOLFIN, Eigen, flex, FSL, Hypre, libxml2, MetaVelvet,
    METIS, MTL4, MUMmer, ncurses, OpenFOAM, OpenSSL, ParMETIS, Pasha, PETSc, Primer3, python-meep, SAMtools, SCOTCH,
    SHRiMP, SLEPc, SOAPdenovo, SuiteSparse, SWIG, Tornado, Trilinos, UFC, Velvet, WIEN2k, XCrySDen

* various enhancements and bug fixes to existing easyblocks

**easyconfigs**

* added example easyconfig files for **106** new software packages:

  * AMOS, Armadillo, ASE, Autoconf, BiSearch, Boost, Bowtie2, BWA, byacc, bzip2, CGAL, ClustalW2, CMake,
    CPLEX, cURL, CVXOPT, Cython, Docutils, DOLFIN, ECore, Eigen, expat, FASTX-Toolkit, FFC, FIAT,
    freetype, FSL, GEOS, git, glproto, GMP, gmvapich2, gompi, GPAW, GSL, guile, h5py, h5utils, Harminv,
    hwloc, Hypre, Infernal, Instant, Jinja2, libctl, libdrm, libffi, libgtextutils, libmatheval,
    libpciaccess, libpthread-stubs, libreadline, libtool, libunistring, libxcb, libxml2, makedepend,
    matplotlib, Meep, Mercurial, Mesa, MetaVelvet, METIS, MPFR, MTL4, MUMmer, ncurses, OpenFOAM, OpenSSL,
    ORCA, PAPI, ParMETIS, Pasha, PCRE, PETSc, petsc4py, pkg-config, Primer3, python-meep, RNAz, SAMtools,
    ScientificPython, SCOTCH, setuptools, Shapely, SHRiMP, SLEPc, SOAPdenovo, Sphinx, SuiteSparse, SWIG,
    Tcl, Theano, Tk, Tornado, Trilinos, UFC, UFL, Velvet, ViennaRNA, Viper, WIEN2k, xcb-proto, XCrySDen,
    xorg-macros, xproto

* added additional example easyconfig files (versions, builds) for several software packages

  * Bison, BLACS, Doxygen, flex, GCC, HDF5, icc, ifort, libpng, M4, MVAPICH2, OpenMPI, Szip, tbb, zlib

* replaced GCC/OpenMPI based easyconfig files with equivalents using the `gompi` toolchain
  * ATLAS, BLACS, FFTW, LAPACK, ScaLAPACK

* enhanced Python example easyconfig files (more dependencies required for features, e.g. libreadline, bzip2, zlib, ...)
* corrected file name of easyconfig files to adher to standard as followed by EasyBuild robot dependency resolver
* style cleanup in existing easyconfig files

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
