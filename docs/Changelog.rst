.. _changelog:

Changelog for EasyBuild documentation
-------------------------------------

* **release 20150427.01** (`Apr 27th 2015`): updates for EasyBuild v2.1.0

  * add documentation on :ref:`partial_installations`, covering ``--stop``, ``--skip`` and ``--module-only``
  * add documentation on :ref:`manipulating_dependencies`, covering ``--filter-deps`` and ``--hide-deps``
  * document ``-module-syntax`` configuration option (see :ref:`module_syntax`)
  * add note on detection of unknown ``$EASYBUILD``-prefixed environment variables (see :ref:`:ref:`configuration_env_vars`)
  * mention support for prepending/appending to ``--robot-paths`` (see :ref:`robot_search_path_prepend_append`)
  * update release notes for EasyBuild v2.1.0 (see :ref:`release_notes`)

* **release 20150425.01** (`Apr 25th 2015`):

  * add documentation on :ref:`using_external_modules`

* **release 20150407.01** (`Apr 7th 2015`):

  * add link to :ref:`unit_tests` page in dedicated section at :ref:`installation` page
    (see :ref:`install_running_unit_tests`)
  * clarify relation between ``--installpath``, ``--prefix``, ``-subdir-*`` and ``--installpath-*``
    configuration options (see :ref:`installpath`)
  * mention ``--show-default-configfiles`` command line option in relevant section
    (see :ref:`default_configuration_files`)

* **release 20150327.01** (`Mar 27th 2015`):

  * documented deprecated functionality w.r.t. error reporting (see :ref:`depr_error_reporting`)
* **release 20150316.01** (`Mar 16th 2015`):

  * include list of EasyBuild repositories cloned by ``install-EasyBuild-develop.sh`` script
    (see :ref:`install_latest_develop_using_script`)
* **release 20150312.01** (`Mar 12th 2015`):

  * enhance documentation w.r.t. template values in configuration files (see :ref:`configuration_file_templates_constants`)
  * improve documentation on ``--robot`` and ``--robot-paths`` (see :ref:`controlling_robot_search_path`)
* **release 20150310.01** (`Mar 10th 2015`):

  * document peculiarties w.r.t. dependencies in combination with a ``dummy`` toolchain (see :ref:`dependency_specs`)
  * document ``clean_gists.py`` script (see :ref:`clean_gists_script`)
  * mention taking into account of proxy settings for downloading sources (see :ref:`common_easyconfig_param_sources`)
* **release 20150306.03** (`Mar 6th 2015`): add release notes for EasyBuild v2.0.0 (see :ref:`release_notes`)
* **release 20150306.02** (`Mar 6th 2015`):

  * add documentation on GitHub integration features (see :ref:`integration_with_github`), mainly ``--from-pr`` (see :ref:`from_pr`)
  * document locations where (specified) easyconfig files are being searched for (see :ref:`specifying_easyconfigs`)
* **release 20150306.01** (`Mar 6th 2015`):

  * add documentation on removed functionality (see :ref:`removed_functionality`)
  * clean up documentation on deprecated functionality (see :ref:`deprecated`)
  * add documentation on provided scripts, in particular ``fix-broken-easyconfigs.py`` (see :ref:`useful_scripts`)
* **release 20150302.01** (`Mar 2nd 2015`): update/cleanup documentation on :ref:`alt_inst_methods`
* **release 20150227.02** (`Feb 27th 2015`): add documentation on the EasyBuild unit test suites, see :ref:`unit_tests`
* **release 20150227.01** (`Feb 27th 2015`): enhance documentation w.r.t. to (optional dependencies), see :ref:`installation`
* **release 20150220.01** (`Feb 20th 2015`):

  * document new advanced bootstrapping options: skipping stage 0 and providing source tarballs (see :ref:`installation`)
* **release 20150219.01** (`Feb 19th 2015`): first updates for EasyBuild v2.0.0

  * extend section on (default) EasyBuild configuration files to also cover ``$XDG_CONFIG_DIRS`` (see :ref:`configuration_file:`)
* **release 20150205.01** (`Feb 5th 2015`): include information on deprecated functionality in (generic) easyblocks (see :ref:`deprecated`)
* **release 20150126.01** (`Jan 26th 2015`):

  * fix ``pip`` installation prefix option (:ref:`alt_inst_methods`)
  * clarify need to have modules tool binary available in ``$PATH`` (:ref:`installation`)
* **release 20150112.01** (`Jan 12th 2015`): mention need to escape ``%`` when setting log file format via config file (see :ref:`logfile_format`)
* **release 20150107.01** (`Jan 7th 2015`): document behaviour of `dummy` toolchain (:ref:`dummy_toolchain`)
* **release 20141219.01** (`Dec 19th 2014`): add release notes for EasyBuild v1.16.1 (see :ref:`release_notes`)
* **release 20141218.01** (`Dec 18th 2014`): add release notes for EasyBuild v1.16.0 (see :ref:`release_notes`)
* **release 20141217.01** (`Dec 17th 2014`): document deprecated functionality in EasyBuild v1.x (:ref:`deprecated`)
* **release 20141204.02** (`Dec 4th 2014`): add EasyBuild release notes (see :ref:`release_notes`)
* **release 20141204.01** (`Dec 4th 2014`): updates for EasyBuild v1.16.0

  * document details w.r.t. (controlling of) robot search path, incl. ``--robot-paths`` (:ref:`using_the_easybuild_command_line`)
  * document use of templates and constants in EasyBuild configuration files (:ref:`configuring_easybuild`)
  * bump EasyBuild version to 1.16.0
  * changed release number scheme for documentation (based on datestamp)
* **release 1.0.3** (`Dec 3rd 2014`): add page on :ref:`code_style`
* **release 1.0.2** (`Nov 6th 2014`): typo and grammar fixes, update Lmod installation instructions for Lmod v5.8
* **release 1.0.1** (`Nov 4th 2014`): fix issues with Changelog
* **release 1.0.0** `(Nov 4th 2014)`: initial release of revamped EasyBuild documentation
  @ http://easybuild.readthedocs.org, covering basic topics:

  * introductory topics:

    * :ref:`what_is_easybuild`
    * :ref:`concepts_and_terminology`
    * :ref:`typical_workflow`
  * getting started:

    * :ref:`installation`
    * :ref:`configuring_easybuild`
  * basic usage topics:

    * :ref:`using_the_easybuild_command_line`
    * :ref:`writing_easyconfig_files`
    * :ref:`understanding_easyBuild_logs`
