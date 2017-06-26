.. _detecting_loaded_modules:

Detection of loaded modules
===========================

Since EasyBuild v3.3.0, the ``eb`` command performs a check to see if any (EasyBuild-generated)
modules have been loaded in the current environment.

This check can be controlled via the ``--detect-loaded-modules`` and ``--allow-loaded-modules`` configuration options.

In addition any unknown ``$EBROOT*`` environment variables are detected and acted upon, according to how
the ``--check-ebroot-env-vars`` configuration option was set.


.. contents::
    :depth: 3
    :backlinks: none


.. _detecting_loaded_modules_motivation:

Motivation
----------

Running EasyBuild in an environment where one or more (EasyBuild-generated) modules are loaded may interfere
with the software installations performed by EasyBuild, i.e.:

* they may cause installations failures, for example due to incompatibilities with the modules being loaded
  during the installation procedure being performed;
* they may cause installations to work in that particular environment, for example by providing a neccessary
  dependency

Since manually loading modules may affect the reproducibility of software installations, it should be discouraged.

In EasyBuild versions before v3.3.0, having a loaded module for the same software packages as the one being installed
resulted in an EasyBuild error message.

Since EasyBuild v3.3.0 a more extensive detection mechanism is available
and the action that should be taken for loaded modules can be controlled via ``--detect-loaded-modules``.
Having a module loaded for any software package that is being installed still results in a hard error.


.. _detecting_loaded_modules_mechanism:

Detection mechanism
-------------------

Detecting loaded EasyBuild-generated modules is done by checking the environment for defined ``$EBROOT*``
environment variables. If any are found, the corresponding loaded module is determined for better reporting.

In case defined ``$EBROOT*`` environment variables are found that do not match a loaded modules,
action is taken as well; see :ref:`detecting_loaded_modules_EBROOT_env_vars`.


.. _detecting_loaded_modules_action:

Action to take if loaded modules are detected
---------------------------------------------

The action that should be taken when one or more loaded (EasyBuild-generated) modules are detected
can be specified via the ``--detect-loaded-modules`` configuration option.

Supported values include:

* :ref:`detecting_loadeD_modules_action_error`
* :ref:`detecting_loadeD_modules_action_ignore`
* :ref:`detecting_loadeD_modules_action_purge`
* :ref:`detecting_loadeD_modules_action_unload`
* :ref:`detecting_loadeD_modules_action_warn` (current default)

The specified action is only taken for non-allowed loaded modules, see :ref:`detecting_loaded_modules_allow`.


.. _detecting_loaded_modules_action_error:

``error``: report error and stop EasyBuild upon detection of loaded modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When EasyBuild is configured with ``--detect-loaded-modules=error``, it will print a clear error and stop when
any (non-allowed) loaded modules are detected.

For example::

    $ eb example.eb --detect-loaded-modules=error
    == temporary log file in case of crash /tmp/eb-UlKMRN/easybuild-MgfEHi.log
    ERROR: Found one or more non-allowed loaded (EasyBuild-generated) modules in current environment:
    * Spack/0.10.0

    To make EasyBuild allow particular loaded modules, use the --allow-loaded-modules configuration option.
    Use --detect-loaded-modules={error,ignore,purge,unload,warn} to specify action to take when loaded modules are detected.

    See http://easybuild.readthedocs.io/en/latest/Detecting_loaded_modules.html for more information.


.. _detecting_loaded_modules_action_ignore:

``ignore``: ignore any loaded modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

With ``--detect-loaded-modules=ignore`` in place, any loaded modules are simply ignored and EasyBuild continues silently.

This is equivalent to the behaviour of EasyBuild versions prior to version 3.3.0.

.. note:: This is **not** recommended!


.. _detecting_loaded_modules_action_purge:

``purge``: run '``module purge``' to clean environment of loaded modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using ``--detect-loaded-modules=purge``, EasyBuild will run ``module purge`` if any (non-allowed) loaded modules
are detected, in an attempt to restore the environment to a clean state before starting software installations.

A short warning message is printed in case ``module purge`` was used to clean up the environment::

    $ export EASYBUILD_DETECT_LOADED_MODULES=purge
    $ eb example.eb
    == temporary log file in case of crash /tmp/eb-QLTV9v/easybuild-6mOmIN.log

    WARNING: Found non-allowed loaded (EasyBuild-generated) modules (Spack/0.10.0), running 'module purge'

    ...

.. note::
  Whether or not ``module purge`` is a suitable action is site-specific, since this will unload *all* loaded modules
  (except for 'sticky' modules when Lmod is used),
  including modules that were not installed with EasyBuild and which may be always required.

  Configuring EasyBuild to use ``module purge`` when (non-allowed) loaded modules are found should *not* be
  done on Cray systems, since it will result in a broken environment.


.. _detecting_loaded_modules_action_unload:

``unload``: unload loaded modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When ``--detect-loaded-modules=unload`` is used, EasyBuild will only unload the (non-allowed & EasyBuild-generated) modules.
The modules are unloaded in reverse order, i.e. the last loaded module is unloaded first.

This is an alternative to using ``module purge``, in case some other (allowed) modules are loaded and should remain loaded.

A short warning message is printed when loaded modules are unloaded::

    $ eb example.eb --detect-loaded-modules=unload
    == temporary log file in case of crash /tmp/eb-JyyaEF/easybuild-WyGqZs.log

    WARNING: Unloading non-allowed loaded (EasyBuild-generated) modules: Spack/0.10.0

    ...


.. _detecting_loaded_modules_action_warn:

``warn``: print warning and continue upon detection of loaded modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When EasyBuild is configured with ``--detect-loaded-modules=warn``, EasyBuild will print a warning
mentioning that one or more loaded (EasyBuild-generated) were detected, before continuing as normal.

The warning is intended to make the user aware that the environment in which EasyBuild is being run is not clean.

For example::

    $ export EASYBUILD_DETECT_LOADED_MODULES=warn
    $ eb example.eb
    == temporary log file in case of crash /tmp/eb-9HD20m/easybuild-WAYzK2.log

    WARNING: Found one or more non-allowed loaded (EasyBuild-generated) modules in current environment:
    * Spack/0.10.0

    To make EasyBuild allow particular loaded modules, use the --allow-loaded-modules configuration option.
    Use --detect-loaded-modules={error,ignore,purge,unload,warn} to specify action to take when loaded modules are detected.

    See http://easybuild.readthedocs.io/en/latest/Detecting_loaded_modules.html for more information.

    ...

.. note:: This is the default behaviour in EasyBuild v3.3.0 and newer.


.. _detecting_loaded_modules_allow:

Allowing particular loaded modules
----------------------------------

EasyBuild can be configured to allow particular modules to be loaded via ``--allow-loaded-modules``,
by specifying a comma-seperated list of software names.

For example::

  $ export EASYBUILD_DETECT_LOADED_MODULES=error
  $ export EASYBUILD_ALLOW_LOADED_MODULES=EasyBuild,GC3Pie

  $ module load EasyBuild
  $ module load GC3Pie
  $ eb example.eb
  ...

By default, only EasyBuild itself is listed as an allowed module. If you want to allow modules for other software
to be loaded as well, you should include ``EasyBuild`` in the specified list of software names if you are using an
EasyBuild installation provided through a module.

.. _detecting_loaded_modules_EBROOT_env_vars:

Checking of ``$EBROOT*`` environment variables
----------------------------------------------

The detection mechanism for loaded modules relies on defined ``$EBROOT*`` environment variables, and
determining by which loaded module they were set.

When one or more ``$EBROOT*`` environment variables are found for which the corresponding loaded modules can not
be found, this can lead to problems.

Hence, EasyBuild will detect this and act on it, according to the value specified to ``--check-ebroot-env-vars``:

* :ref:`detecting_loaded_modules_EBROOT_env_vars_error`
* :ref:`detecting_loaded_modules_EBROOT_env_vars_ignore`
* :ref:`detecting_loaded_modules_EBROOT_env_vars_unset`
* :ref:`detecting_loaded_modules_EBROOT_env_vars_warn` (current default)


.. _detecting_loaded_modules_EBROOT_env_vars_error:

``error``: report error and stop EasyBuild on unknown ``$EBROOT*`` environment variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When configured with ``--check-ebroot-env-vars=error``, EasyBuild will stop with a clear error message
when it discovers one or more ``$EBROOT*`` environment variables that do not correspond to a loaded module::

  $ export EBROOTUNKNOWN=just_an_example

  $ eb example.eb --check-ebroot-env-vars=error

  == temporary log file in case of crash /tmp/eb-cNqOzG/easybuild-xmV8vc.log
  ERROR: Found defined $EBROOT* environment variables without matching loaded module: $EBROOTUNKNOWN
  (control action via --check-ebroot-env-vars={error,ignore,unset,warn})

.. _detecting_loaded_modules_EBROOT_env_vars_ignore:

``ignore``: ignore unknown ``$EBROOT*`` environment variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To simply ignore any defined ``$EBROOT*`` environment variables that do not correspond with a loaded module,
configure EasyBuild with ``--check-ebroot-env-vars=ignore``.

.. _detecting_loaded_modules_EBROOT_env_vars_unset:

``unset``: unset unknown ``$EBROOT*`` environment variables and print warning
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you are confident that the defined ``$EBROOT*`` environment variables for which no matching loaded module was found
are harmless, you can specify that EasyBuild should clean up the environment by unsetting them, before continuing.
A clear warning message will be printed whenever this occurs::

    $ export EBROOTUNKNOWN=just_an_example

    $ eb bzip2-1.0.6.eb --check-ebroot-env-vars=unset

    == temporary log file in case of crash /tmp/eb-IvXik8/easybuild-cjHjhs.log

    WARNING: Found defined $EBROOT* environment variables without matching loaded module: $EBROOTUNKNOWN; unsetting them

    ...

Note that these unknown ``$EBROOT*`` will only be unset in the environment of the running EasyBuild session,
not in the current session in which ``eb`` is being run.


.. _detecting_loaded_modules_EBROOT_env_vars_warn:

``warn``: print warning for unknown ``$EBROOT*`` environment variables and continue
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If EasyBuild was configured with ``--check-ebroot-env-vars=warn``, a warning will be printed
when one or more defined ``$EBROOT*`` environment variables are encountered for which no corresponding loaded module
was found::

    $ export EBROOTUNKNOWN=just_an_example

    $ export EASYBUILD_CHECK_EBROOT_ENV_VARS=warn
    $ eb example.eb

    == temporary log file in case of crash /tmp/eb-1h_LQ9/easybuild-BHrPk4.log
    WARNING: Found defined $EBROOT* environment variables without matching loaded module: $EBROOTUNKNOWN
    (control action via --check-ebroot-env-vars={error,ignore,unset,warn})

    ...

.. note:: This is the default behaviour in EasyBuild v3.3.0 and newer.

