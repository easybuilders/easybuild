.. _deprecated_easyconfigs:

Deprecated easyconfigs
======================

Since EasyBuild v3.8.0, individual easyconfig files or particular (versions of) toolchains can be marked as deprecated.

.. contents::
    :depth: 3
    :backlinks: none


.. _deprecated_easyconfigs_symptoms:

Symptoms
--------

Using an easyconfig file or toolchain that was marked as deprecated results in a warning message like::

  WARNING: Deprecated functionality, will no longer work in v4.0: easyconfig file '/home/example/test.eb' is marked as deprecated:
  This is an example message explaining why the easyconfig file was deprecated.
  (see also http://easybuild.readthedocs.org/en/latest/Deprecated-easyconfigs.html)

Or, in case you are trying to use an easyconfig file or toolchain that was marked deprecated in a previous major version
of EasyBuild::

  ERROR: Failed to process easyconfig /home/example/test.eb: DEPRECATED (since v4.0) functionality used: easyconfig file '/home/example/test.eb' is marked as deprecated:
  This is an example message explaining why the easyconfig file was deprecated.
  (see also http://easybuild.readthedocs.org/en/latest/Deprecated-easyconfigs.html)


.. _deprecated_easyconfigs_why:

Reasons for deprecation
-----------------------

There are several possible reasons why a particular easyconfig file or toolchain was deprecated, some of which include:

* old/obsolete versions of software or toolchain components
* toolchains that are superseded by other toolchains
* known installation problems that are hard to resolve (or not worth the effort to resolve)


.. _deprecated_easyconfigs_implications:

Implications
------------

Easyconfig files that are deprecated or which use a deprecated toolchain are *not actively maintained*,
and are *no longer included in the EasyBuild regression test* (which means they may be broken by recent changes
to the EasyBuild framework or relevant easyblocks).

In a future major version of EasyBuild, these easyconfig files will be archived (see also :ref:`archived_easyconfigs`).
