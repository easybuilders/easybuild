.. _locks:

Build locks
===========

Easybuild creates a lock during installation to avoid collision errors from multiple installations running in parallel. The lock is created in the installation path. By default, any new installation including any software package of an already running build will be automatically aborted with a ``lock already exists`` error.

.. note:: Build locks support was added with EasyBuild v4.2.0.


.. contents::
    :depth: 3
    :backlinks: none

.. _lock_system:

Lock system characteristics
---------------------------

Easybuild will create a lock for each new easyconfig being installed if one does not already exists, being it the main software of the installation or any of its dependencies. These locks will only be removed by Easybuild whenever the original installation ends, successfully or not. Therefore, new installations will be aborted in the following circumstances (by default):

* another installation for the same easyconfig is in progress
* previous installation of the same easyconfig was abruptly interrupted

If a previous installation was abruptly interrupted and locks were left in the installation path, those can be easily removed with ``rmdir``. All locks of Easybuild are empty directories stored in a folder called ``.locks`` located in the root directory of the installation path. Each lock has a unique name identifying the installation it belongs to.


.. _lock_options:

Lock system options
-------------------

The behaviour of the lock system in Easybuild can be tuned with the following options

* ``--ignore-locks``: Ignore any existing locks for the current installation. Default: False
* ``--wait-on-lock``: Wait for the lift of any existing locks for the current installation the given amount time (seconds). If set to 0 the installation will be automatically aborted if a lock exists. Default: 0
* ``--locks-dir``: Path to the directory holding the installation locks. Default: ``.locks`` in installation path
