.. _experimental_features:

Experimental features
=====================

First introduced in EasyBuild v2.1.0 (see :ref:`EasyBuild v2.1.0 Release Notes <release_notes_v2.1.0>`),
experimental features can only be used by enabling the ``--experimental`` configuration option.

An experimental feature indicates to users that these features may change significantly in a future release
and should be used only for testing, not (yet) for production usage.

Currently enabled experimental features include:

 * support for easyconfig files in YAML syntax (see :ref:`easyconfig_yeb_format`)
 * support for generating container recipes & images (see :ref:`containers`)
 * support for using easystack files (see :ref:`easystack`)
 * support for trying to update versions of the dependencies of an easyconfig based on what is available in the robot path (see :ref:`basic_usage_help`)
