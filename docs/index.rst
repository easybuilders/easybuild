.. toctree::
     :maxdepth: 3

.. EasyBuild documentation master file

EasyBuild documentation
=======================

Welcome to the documentation of `EasyBuild <https://easybuilders.github.io/easybuild>`_, a software build and installation framework
that allows you to manage (scientific) software on High Performance Computing (HPC) systems in an efficient way.

This documentation is intended for EasyBuild version |version|, and was last rebuilt on |today|.

.. _contents:

Introductory topics
===================

.. toctree::
    :glob:
    :maxdepth: 2

    Introduction
    Concepts_and_Terminology
    Typical_workflow_example_with_WRF


Getting started
===============

.. toctree::
    :glob:
    :maxdepth: 2

    Installation
    Configuration


Basic usage topics
==================

.. toctree::
    :glob:
    :maxdepth: 2

    Using_the_EasyBuild_command_line
    Writing_easyconfig_files
    Logfiles

Advanced usage topics
=====================

.. toctree::
    :glob:
    :maxdepth: 2

    Archived-easyconfigs
    Backup_modules
    Common-toolchains
    Contributing
    Controlling_compiler_optimization_flags
    Cray-support
    Experimental_features
    Extended_dry_run
    Hooks
    Implementing-easyblocks
    Including_additional_Python_modules
    Integration_with_GitHub
    Manipulating_dependencies
    Packaging_support
    Partial_installations
    RPATH-support
    Submitting_jobs
    Tracing_progress
    Using_external_modules
    Detecting_loaded_modules

Other topics
============

.. toctree::
    :glob:
    :maxdepth: 2

    Code_style
    Unit-tests
    Useful-scripts
    Deprecated-functionality
    Removed-functionality
    Maintainers


Overview of version specific (auto-generated) documentation pages
=================================================================

* :ref:`Available config file constants <avail_cfgfile_constants>`
* :ref:`Available easyconfig parameters <vsd_avail_easyconfig_params>`
* :ref:`Constants available for easyconfig files <avail_easyconfig_constants>`
* :ref:`demos`
* :ref:`EasyBuild framework API <easybuild_api_top>`
* :ref:`License constants available for easyconfig files <avail_easyconfig_licenses>`
* :ref:`List of available easyblocks <vsd_list_easyblocks>`
* :ref:`List of available toolchain options <avail_toolchain_opts>`
* :ref:`List of known toolchains <vsd_list_toolchains>`
* :ref:`List of supported software <list_software>`
* :ref:`Overview of configuration options (eb --help) <eb_help>`
* :ref:`Overview of generic easyblocks <generic_easyblocks>`
* :ref:`Templates available for easyconfig files <avail_easyconfig_templates>`


.. _getting_help:

Getting help
============

Having trouble? We'd like to help!

* :ref:`Search <search>` this documentation collection
* Search for information in the `archives`_ of the easybuild@lists.ugent.be mailing list or `subscribe`_ to post a question.
* Did you try ``eb --help``?
* Ask a question in the `#easybuild IRC channel`_ on the Freenode network,
  or in the EasyBuild Slack channel https://easybuild.slack.com/
  (subscribe via https://easybuild-slack.herokuapp.com)
* Consider participating to an EasyBuild `conference call <https://github.com/easybuilders/easybuild/wiki/Conference-calls>`_
* Report issues with EasyBuild framework in our `framework ticket tracker`_.
* Report issues with EasyBuild easyblocks in our `easyblocks ticket tracker`_.
* Report issues with EasyBuild easyconfigs in our `easyconfigs ticket tracker`_.
* Report issues with EasyBuild documentation or other aspects in our `general ticket tracker`_.

.. _archives: https://lists.ugent.be/wws/arc/easybuild
.. _subscribe: https://lists.ugent.be/wws/subscribe/easybuild
.. _#easybuild IRC channel: irc://irc.freenode.net/easybuild
.. _IRC logs: http://www.google.com/
.. _framework ticket tracker: https://github.com/easybuilders/easybuild-framework/issues
.. _easyblocks ticket tracker: https://github.com/easybuilders/easybuild-easyblocks/issues
.. _easyconfigs ticket tracker: https://github.com/easybuilders/easybuild-easyconfigs/issues
.. _general ticket tracker: https://github.com/easybuilders/easybuild/issues

-------

Lists and tables
==================

As of version EasyBuild version |version|:

* The complete table of available toolchains is visible at :ref:`toolchains_table`
* The list of available easyblocks is visible at :ref:`basic_usage_easyblocks`
* The list of available (generic) easyconfig parameters is visible at :ref:`easyconfigs_parameters`

Appendices
==========

.. toctree::
    :maxdepth: 1

* :ref:`Documentation changelog <changelog>`
* :ref:`EasyBuild release notes <release_notes>`
* :ref:`Search <search>`
* :ref:`Useful Links <useful_links>`

.. toctree::
    :hidden:
    :glob:
    :maxdepth: 1

    Changelog
    Configuration_Legacy
    eb_*
    Installation_Alternative
    Installing-environment-modules-without-root-permissions
    Installing-Lmod-without-root-permissions
    Useful_links
    Release_notes
