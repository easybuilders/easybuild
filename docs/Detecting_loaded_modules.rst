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

This is done because manually loading modules for software that was installed through EasyBuild before issueing
an ``eb`` command may affect the performed software installations procedures, either positively (fixing problems with
installations), or negatively (breaking installations). In either case, influencing EasyBuild by manually loading
modules should be avoided, since it affects reproducability of installations.



.. _detecting_loaded_modules_mechanism:

Detection mechanism
-------------------


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
any loaded modules are detected (unless they are listed as being allowed, see :ref:`detecting_loaded_modules_allow`).

For example::

    $ eb example.eb --detect-loaded-modules=fail
    == temporary log file in case of crash /tmp/eb-UlKMRN/easybuild-MgfEHi.log
    ERROR: Found one or more non-ignored loaded (EasyBuild-generated) modules in current environment:
    * Spack/0.10.0

    To make EasyBuild allow particular loaded modules, use the --allow-loaded-modules configuration option.
    Use --detect-loaded-modules={fail,ignore,purge,unload,warn} to specify action to take when loaded modules are detected.

    See http://easybuild.readthedocs.io/en/latest/Detecting_loaded_modules.html for more information.


.. _detecting_loaded_modules_action_ignore:

``ignore``: ignore any loaded modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

With ``--detect-loaded-modules=ignore`` in place, any loaded modules are ignored and EasyBuild continues.

.. note:: This is **not** recommended!


.. _detecting_loaded_modules_action_purge:

``purge``: run ``module purge``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using ``--detect-loaded-modules=purge``, EasyBuild will run ``module purge`` if any loaded modules are detected
(unless they are listed as being allowed, see :ref:`detecting_loaded_modules_allow`), in an attempt to restore
the environment to a clean state before starting software installations.

Whether or not ``module purge`` is a suitable action is site-specific, since this will unload *all* loaded modules,
including modules that were not installed with EasyBuild and which may be always required.


.. _detecting_loaded_modules_action_unload:

``unload``: unload loaded modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. _detecting_loaded_modules_action_warn:

``warn``: print warning and continue
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: This is the default behaviour in EasyBuild v3.x.


.. _detecting_loaded_modules_allow:

Allowing particular loaded modules
----------------------------------

