.. _locks:

Locks to prevent duplicate installations running at the same time
=================================================================

Easybuild creates a lock before starting the installation of an easyconfig file,
to avoid a collision between multiple installations running at the same time.

If an EasyBuild session tries to install an easyconfig file when a lock for that installation already exists,
it will be automatically aborted with an error like "``Lock ... already exists, aborting!``".

.. note:: Locking of installations was implemented in EasyBuild version 4.2.0 .


.. contents::
    :depth: 3
    :backlinks: none

.. _locks_implementation:

Locking implementation details
------------------------------

Easybuild will create a lock when starting an installation if no corresponding lock exists yet,
regardless of whether the installation was requested explicitly or is performed to resolve a dependency.

The name of the lock corresponds to the *full* path of the installation directory, with slashes (``/``) and
dashes (``-``) replaced by underscores (``_``), and with an additional ``.lock`` added at the end.

Locks are created in the :ref:`locks_dir`.

The lock created by EasyBuild is an empty directory (rather than a file),
because that can be created more atomically on modern filesystems.

For example, if ``OpenFOAM-7-foss-2019b.eb`` is being installed to ``/apps/easybuild/software``,
an empty directory that serves as a lock for this installation will be created at
``/apps/easybuild/software/.locks/_apps_easybuild_software_OpenFOAM_7_foss_2019b.lock``
(assuming the default :ref:`locks_dir` is used).

A lock is automatically removed by Easybuild when the installation ends, regardless of whether the installation
was successful or not. Therefore, new installations of the same easyconfig will be aborted in case of:

* another installation for the same easyconfig is in progress;
* a previous installation of the same easyconfig was abruptly interrupted;


.. _locks_removing:

Removing locks
--------------

If a previous installation was abruptly interrupted and a lock was left in place,
it can be easily removed using the ``rmdir`` command (since the lock is actually an empty directory).


.. _locks_configuration_options:

Configuration options related to installation locks
---------------------------------------------------

The behaviour of the locking mechanism in Easybuild can be tuned with the following configuration options:

.. _locks_ignore:

Ignoring locks (``--ignore-locks``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using the ``--ignore-locks`` configuration option, you can instruct EasyBuild to ignore any existing locks.
Locks that exist are left untouched, even if the installation completes successfully.

**Use this with caution, since installations may be (partially) overwritten if another EasyBuild session is also
performing those installations!**


.. _locks_wait:

Waiting for locks to be removed (``--wait-on-lock``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using the ``--wait-on-lock`` configuration option, you can change how EasyBuild deals with existing locks,
by specifying how frequently EasyBuild should check whether an existing lock was removed. By specifying a non-zero value ``S``,
you can indicate how many seconds EasyBuild should wait before checking again whether the lock is still in place.

.. note:: EasyBuild will wait indefinitely for an existing lock to be removed if ``--wait-on-lock`` is set to a non-zero value...

  If the lock is never removed, the EasyBuild session will never terminate; it will keep checking every ``S`` seconds whether the lock is still in place.

By default, EasyBuild will *abort* the installation with an error like "``Lock ... already exists, aborting!``"
if a corresponding lock already exists, which is equivalent to setting ``--wait-on-lock`` to zero (``0``),
implying that no waiting should be done at all.


.. _locks_dir:

Locks directory
---------------

If desired, an alternate location where locks should be created and checked for can be specified via the ``--locks-dir`` configuration option.

.. note:: Keep in mind that a path on a *shared* filesystem should be used, to ensure that active EasyBuild sessions running on different systems use the same locks directory.

By default, locks are created in a hidden subdirectory ``.locks`` in the top-level ``software`` installation directory; that is, the ``software`` subdirectory of the ``installpath`` configuration setting of the active EasyBuild session.
