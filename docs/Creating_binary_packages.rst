.. _creating_binary_packages:

Creating binary packages
========================

As an experimental feature (see :ref:`experimental_features`), support for `FPM <https://github.com/jordansissel/fpm>`_ has been integrated into EasyBuild v2.2.0 (see :ref:`release_notes_v2.2.0`). 

FPM is provided by EasyBuild itself, along with Ruby. You can install FPM using the FPM-1.3.3-Ruby-2.1.6.eb easyblock.

Overview
--------

.. contents::
    :depth: 2

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

Options associated with packaging currently available.

* ``--package``:

  * Enables packaging and is required for other options to work

* ``--package-tool=<tool>``:

  * Sets which tool you wish to package with. Only ``fpm`` is currently supported.


* ``--package-type=<type>``:

  * Specify which type of package you wish to build. Passed to fpm, but rpm is the default and tested. Also supports debs thorough FPM.

* ``--package-naming-scheme=<PNS>``:

  * Gives you the ability to override the default package naming scheme of ``EasyBuildPNS``.

.. note:: Changing the naming scheme should be done with caution. RPM will only allow one package of a particular name to be installed, so if you wish multiple versions of a package to be installed in parallel you need to ensure variables like the version are included in that part of the naming scheme.

* ``--packagepath``:

  * Allows you to specify a destination path for the packages being built in this run

* ``--package-release``:

  * The release to be added to the end of the package, by default ``1.`` This allows the packager to package that will upgrade an existing one with the same name and version.

Example
-------

It is sufficient to add ``--experimental --package --package-tool=fpm`` to get started with EasyBuild packaging::

    $ eb --experimental --package Perl-5.20.1-GCC-4.9.2-bare.eb -r -f
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
   
    $ rpm -qip --requires --provides eb2.2.0dev-Perl-5.20.1-bare-GCC-4.9.2-5.20.1-1.x86_64.rpm
    Name        : eb2.2.0dev-Perl-5.20.1-bare-GCC-4.9.2
    Version     : 5.20.1
    Release     : 1
    Architecture: x86_64
    Install Date: (not installed)
    Group       : default
    Size        : 64539427
    License     : unknown
    Signature   : (none)
    Source RPM  : eb2.2.0dev-Perl-5.20.1-bare-GCC-4.9.2-5.20.1-1.src.rpm
    Build Date  : Tue 07 Jul 2015 11:27:54 PM EDT
    Build Host  : 59e46bbf1cd0
    Relocations : /
    Packager    : <easybuild@59e46bbf1cd0>
    Vendor      : easybuild@59e46bbf1cd0
    URL         : http://example.com/no-uri-given
    Summary     : no description given
    Description :
    no description given
    eb2.2.0dev-GCC-4.9.2-dummy-dummy
    rpmlib(PartialHardlinkSets) <= 4.0.4-1
    rpmlib(PayloadFilesHavePrefix) <= 4.0-1
    rpmlib(CompressedFileNames) <= 3.0.4-1
    eb2.2.0dev-Perl-5.20.1-bare-GCC-4.9.2
    eb2.2.0dev-Perl-5.20.1-bare-GCC-4.9.2 = 5.20.1-1
    eb2.2.0dev-Perl-5.20.1-bare-GCC-4.9.2(x86-64) = 5.20.1-1
