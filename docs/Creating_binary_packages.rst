.. _creating_binary_pages:

Creating Binary Packages
========================

As an experimental feature, support for `FPM <https://github.com/jordansissel/fpm>`_ has been integrated into EasyBuild. This creates a dependency on Ruby and a few other RubyGems and they have been provided through `Ruby-2.1.5.eb <https://github.com/rjeschmi/easybuild-easyconfigs/blob/a297788484eb778faeef5c9f335a58cc3b33c9b4/easybuild/easyconfigs/r/Ruby/Ruby-2.1.5.eb>`_.


First you will need the Ruby package that includes FPM::

    [easybuild@b018c9b7ec95 ~]$ eb Ruby-2.1.5.eb
    == COMPLETED: Installation ended successfully
    == 2015-05-18 15:12:58,526 main.easyblock INFO Results of the build can be found in the log file /export/easybuild/software/Ruby/2.1.5/easybuild/easybuild-Ruby-2.1.5-20150518.151258.log
    == Results of the build can be found in the log file /export/easybuild/software/Ruby/2.1.5/easybuild/easybuild-Ruby-2.1.5-20150518.151258.log
    == 2015-05-18 15:12:58,528 main INFO Build succeeded for 1 out of 1
    == Build succeeded for 1 out of 1




