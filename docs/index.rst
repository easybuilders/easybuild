.. toctree::
     :maxdepth: 3

.. EasyBuild documentation master file

EasyBuild documentation
=======================

Welcome to the documentation of `EasyBuild <https://hpcugent.github.io/easybuild>`_, a software build and installation framework
that allows you to manage (scientific) software on High Performance Computing (HPC) systems in an efficient way.

This documentation is intended for EasyBuild version |version|, and was last rebuilt on |today|.

.. _contents:

Introductory topics
===================

.. toctree::
    :glob:
    :maxdepth: 3

    Introduction
    Concepts_and_Terminology
    Typical_workflow_example_with_WRF


Getting started
===============

.. toctree::
    :glob:
    :maxdepth: 3

    Installation
    Configuration


Basic usage topics
==================

.. toctree::
    :glob:
    :maxdepth: 3

    Using_the_EasyBuild_command_line
    Writing_easyconfig_files
    Logfiles

Getting help
============

Having trouble? We'd like to help!

* :ref:`Search <search>` this documentation collection
* Search for information in the `archives`_ of the easybuild@lists.ugent.be mailing list or `subscribe`_ to post a question.
* Did you try ``eb --help``?
* Ask a question in the `#easybuild IRC channel`_ on the Freenode network
* Consider participating to an EasyBuild `conference call <https://github.com/hpcugent/easybuild/wiki/Conference-calls>`_
* Report issues with EasyBuild framework in our `framework ticket tracker`_.
* Report issues with EasyBuild easyblocks in our `easyblocks ticket tracker`_.
* Report issues with EasyBuild easyconfigs in our `easyconfigs ticket tracker`_.
* Report issues with EasyBuild documentation or other aspects in our `general ticket tracker`_.

.. _archives: https://lists.ugent.be/wws/arc/easybuild
.. _subscribe: https://lists.ugent.be/wws/subscribe/easybuild
.. _#easybuild IRC channel: irc://irc.freenode.net/easybuild
.. _IRC logs: http://www.google.com/
.. _framework ticket tracker: https://github.com/hpcugent/easybuild-framework/issues
.. _easyblocks ticket tracker: https://github.com/hpcugent/easybuild-easyblocks/issues
.. _easyconfigs ticket tracker: https://github.com/hpcugent/easybuild-easyconfigs/issues
.. _general ticket tracker: https://github.com/hpcugent/easybuild/issues

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
    Code_style
    Configuration_Legacy
    eb_*
    Installation_Alternative
    Installing-environment-modules-without-root-permissions
    Installing-Lmod-without-root-permissions
    Useful_links
    Release_notes
