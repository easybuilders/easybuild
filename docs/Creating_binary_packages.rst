.. _creating_binary_packages:

Creating binary packages
========================

As an experimental feature (see :ref:`experimental_features`), support for `FPM <https://github.com/jordansissel/fpm>`_ has been integrated into EasyBuild v2.2.0 (see :ref:`release_notes_v2.2.0`). 

FPM is provided by EasyBuild itself, along with Ruby. 

Overview
--------

Installing prerequisites
------------------------

First you will need the Ruby package that includes FPM::

    $ eb Ruby-2.1.5.eb
    [...]
    == COMPLETED: Installation ended successfully
    == 2015-05-18 15:12:58,526 main.easyblock INFO Results of the build can be found in the log file /home/example/easybuild/software/Ruby/2.1.5/easybuild/easybuild-Ruby-2.1.5-20150518.151258.log
    == Results of the build can be found in the log file /home/example/easybuild/software/Ruby/2.1.5/easybuild/easybuild-Ruby-2.1.5-20150518.151258.log
    == 2015-05-18 15:12:58,528 main INFO Build succeeded for 1 out of 1
    == Build succeeded for 1 out of 1





