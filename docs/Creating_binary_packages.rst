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


