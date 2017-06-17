.. _detecting_loaded_modules:

Detection of loaded modules
===========================

Since EasyBuild v3.3.0, the ``eb`` command performs a check to see if any (EasyBuild-generated)
modules have been loaded in the current environment.

This check can be controlled via the ``--detect-loaded-modules`` and ``--allow-loaded-modules`` configuration options.


.. contents::
    :depth: 3
    :backlinks: none


.. _detecting_loaded_modules_motivation:

Motivation
----------

Running EasyBuild in an environment where one or more EasyBuild-generated modules are loaded may interfere
with the software installations performed by EasyBuild, i.e.:

* they may cause installations failures, for example due to incompatibilities with the modules being loaded
  during the installation procedure being performed;
* they make cause installations to work in that particular environment, for example by providing a neccessary
  dependency

Since manually loading modules may affect the reproducability of software installations, it should be discouraged.

In EasyBuild versions before v3.3.0, having a loaded module for the same software packages as the one being installed
resulted in an EasyBuild error message. With ``--detect-loaded-modules``, a more extensive detection mechanism
is available and the action taken for loaded modules can be controlled.


.. _detecting_loaded_modules_mechanism:

Detection mechanism
-------------------

Detecting loaded EasyBuild-generated modules is done by checking the environment for defined ``$EBROOT*``
environment variables. If any are found, the corresponding loaded module is determined for better reporting.

In case defined ``$EBROOT*`` environment variables are found that do not match a loaded modules,
a clear warning will printed. For example::

    WARNING: Found 1 defined $EBROOT* environment variables without matching loaded module: $EBROOTTEST


.. _detecting_loaded_modules_action:

Action to perform if loaded modules are detected
------------------------------------------------

The action that should be performed when one or more loaded (EasyBuild-generated) modules are detected
can be specified via the ``--detect-loaded-modules`` configuration option.

Supported values include:

* :ref:`detecting_loadeD_modules_action_fail`
* :ref:`detecting_loadeD_modules_action_ignore`
* :ref:`detecting_loadeD_modules_action_purge`
* :ref:`detecting_loadeD_modules_action_unload`
* :ref:`detecting_loadeD_modules_action_warn` (current default)


.. _detecting_loaded_modules_action_fail:

``fail``: print error and stop EasyBuild
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When EasyBuild is configured with ``--detect-loaded-modules=fail``, it will print a clear error and stop when
any loaded modules are detected.

For example::

    $ eb example.eb --detect-loaded-modules=fail
    == temporary log file in case of crash /tmp/eb-UlKMRN/easybuild-MgfEHi.log
    ERROR: Found one or more non-ignored loaded (EasyBuild-generated) modules in current environment:
    * Spack/0.10.0

    To make EasyBuild allow particular loaded modules, use the --allow-loaded-modules configuration option.
    Use --detect-loaded-modules={fail,ignore,purge,unload,warn} to specify action to take when loaded modules are detected.

    See http://easybuild.readthedocs.io/en/latest/Detecting_loaded_modules.html for more information.

Allowed loaded modules do not trigger a failure (see :ref:`detecting_loaded_modules_allow`).


.. _detecting_loaded_modules_action_ignore:

``ignore``: ignore any loaded modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

With ``--detect-loaded-modules=ignore`` in place, any loaded modules are simply ignored and EasyBuild continues.

.. note:: This is **not** recommended!


.. _detecting_loaded_modules_action_purge:

``purge``: run '``module purge``'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using ``--detect-loaded-modules=purge``, EasyBuild will run ``module purge`` if any loaded modules are detected,
in an attempt to restore the environment to a clean state before starting software installations.

A short warning message are printed in case ``module purge`` was used to clean up the environment::

    $ eb example.eb --detect-loaded-modules=purge
    == temporary log file in case of crash /tmp/eb-QLTV9v/easybuild-6mOmIN.log

    WARNING: Found non-ignored loaded (EasyBuild-generated) modules, running 'module purge': Spack/0.10.0

    ...

.. note::
  Whether or not ``module purge`` is a suitable action is site-specific, since this will unload *all* loaded modules
  (except for 'sticky' modules when Lmod is used),
  including modules that were not installed with EasyBuild and which may be always required.

Allowed loaded modules do not trigger a ``module purge`` (see :ref:`detecting_loaded_modules_allow`).


.. _detecting_loaded_modules_action_unload:

``unload``: unload loaded modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When ``--detect-loaded-modules=unload`` is used, EasyBuild will only unload the loaded (EasyBuild-generated) modules.
The modules are unloaded in reverse order, i.e. the last loaded module is unloaded first.

This is an alternative to using ``module purge``, in case some other modules are loaded and should remain loaded.

A short warning message is printed when loaded modules are unloaded::

    eb example.eb --detect-loaded-modules=unload
    == temporary log file in case of crash /tmp/eb-JyyaEF/easybuild-WyGqZs.log

    WARNING: Unloading non-ignored loaded (EasyBuild-generated) modules: Spack/0.10.0

    ...

Allowed loaded modules are not unloaded (see :ref:`detecting_loaded_modules_allow`).


.. _detecting_loaded_modules_action_warn:

``warn``: print warning and continue
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When EasyBuild is configured with ``--detect-loaded-modules=warn``, EasyBuild will print a warning
mentioning that one or more loaded (EasyBuild-generated) were detected, before continuing as normal.

The warning is intended to make the user aware that the environment in which EasyBuild is run is not clean.

For example::

    $ eb example.eb --detect-loaded-modules=warn
    == temporary log file in case of crash /tmp/eb-9HD20m/easybuild-WAYzK2.log

    WARNING: Found one or more non-ignored loaded (EasyBuild-generated) modules in current environment:
    * Spack/0.10.0

    To make EasyBuild allow particular loaded modules, use the --allow-loaded-modules configuration option.
    Use --detect-loaded-modules={fail,ignore,purge,unload,warn} to specify action to take when loaded modules are detected.

    See http://easybuild.readthedocs.io/en/latest/Detecting_loaded_modules.html for more information.

    ...

Allowed loaded modules do not trigger a warning (see :ref:`detecting_loaded_modules_allow`).

.. note:: This is the default behaviour in EasyBuild v3.x.


.. _detecting_loaded_modules_allow:

Allowing particular loaded modules
----------------------------------

EasyBuild can be configured to allow particular modules to be loaded via ``--allow-loaded-modules``,
by specifying a comma-seperated list of software names.

For example::

  $ export EASYBUILD_DETECT_LOADED_MODULES=fail
  $ export EASYBUILD_ALLOW_LOADED_MODULES=EasyBuild,GC3Pie

  $ module load EasyBuild
  $ module load GC3Pie
  $ eb example.eb
  ...

By default, only EasyBuild itself is listed as an allowed module. If you want to allow modules for other software
to be loaded as well, you should include ``EasyBuild`` in the specified list of software names if you are using an
EasyBuild installation provided through a module.
