.. _creating_binary_packages:

Creating binary packages
========================

As an experimental feature (see :ref:`experimental_features`), support for `FPM <https://github.com/jordansissel/fpm>`_ has been integrated into EasyBuild v2.2.0 (see :ref:`release_notes_v2.2.0`). 

FPM is provided by EasyBuild itself, along with Ruby. You can install FPM using the FPM-1.3.3-Ruby-2.1.6.eb easyblock.

Overview
--------

Installing prerequisites
------------------------

First you will need the FPM package, which will also install Ruby if you haven't already::

    $ eb FPM-1.3.3-Ruby-2.1.6.eb -r
    [...]
    == building and installing Ruby/2.1.6...
    [...]
    == COMPLETED: Installation ended successfully
    [...]
    == building and installing FPM/1.3.3-Ruby-2.1.6...
    [...]
    == COMPLETED: Installation ended successfully
    == Results of the build can be found in the log file /export/easybuild/software/FPM/1.3.3-Ruby-2.1.6/easybuild/easybui
    ld-FPM-1.3.3-20150524.181859.log
    == Build succeeded for 2 out of 2

Runtime options
---------------

There are four main options associated with packaging currently available.

* ``--package-tool=<tool>``:

  * Sets which tool you wish to package with. Only ``fpm`` is currently supported.


* ``--package-type=<type>``:

  * Specify which type of package you wish to build. Passed to fpm, but rpm is the default and tested. Also supports debs thorough FPM.

* ``--package-template=<template>``:

  * Gives you the ability to override the default template of ``eb-%(name)s-%(version)s-%(toolchain)s``, this can be used to change the prefix or to reorder the variables.
  * Further allows you to create parallel installable packages.

.. note:: Changing the template also affects dependencies so should be done with caution. Generally the format should be set for your site and all packages, or at least interoperable packages, should be built using the same template.

* ``--packagepath``:

  * Allows you to specify a destination path for the packages being built in this run


Example
-------

It is sufficient to add ``--experimental --package-tool=fpm`` to get started with EasyBuild packaging::

    $ eb --experimental --package-tool=fpm Perl-5.20.1-GCC-4.9.2-bare.eb -r -f
    [...]
    == building and installing Perl/5.20.1-GCC-4.9.2-bare...
    == fetching files...
    == creating build dir, resetting environment...
    == unpacking...
    == patching...
    == preparing...
    == configuring...
    == building...
    == testing...
    == installing...
    == taking care of extensions...
    == postprocessing...
    == sanity checking...
    == cleaning up...
    == creating module...
    == packaging...
    == COMPLETED: Installation ended successfully
    == Results of the build can be found in the log file /home/example/software/Perl/5.20.1-GCC-4.9.2-bare/easybuild/easybuild-Perl-5.20.1-20150527.023522.log
    == Build succeeded for 1 out of 1


And in your packages directory (by default $prefix/packages) you will find your new package!

The package by default will have the following properties::
    
    $ rpm -q --requires -p eb-Perl-5.20.1-bare-GCC-4.9.2-eb-1.x86_64.rpm
    eb-GCC-4.9.2-dummy-dummy
    rpmlib(PartialHardlinkSets) <= 4.0.4-1
    rpmlib(PayloadFilesHavePrefix) <= 4.0-1
    rpmlib(CompressedFileNames) <= 3.0.4-1
    $ rpm -q --provides -p eb-Perl-5.20.1-bare-GCC-4.9.2-eb-1.x86_64.rpm
    eb-Perl-5.20.1-bare-GCC-4.9.2
    eb-Perl-5.20.1-bare-GCC-4.9.2 = eb-1
    eb-Perl-5.20.1-bare-GCC-4.9.2(x86-64) = eb-1
