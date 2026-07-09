.. _controlling_permissions:

Controlling permissions of installations
========================================

Various configuration options and easyconfig parameters are available that control (group) ownership and permissions of
software installations performed with EasyBuild.

These can be used to protect installations of licensed software, or to make sure that installations can be
modified/removed by other users which can be interesting in case multiple users are performing installations using
EasyBuild to a shared filesystem.

.. note::

  These options and parameters only affect the permissions and (group) ownership of the actual software installations
  themselves, not of the module files that are generated for them or other files being generated/copied (e.g. the
  easyconfig file that is copied to the easyconfigs repository).

Configuration options
---------------------

These configuration options are *global*, in the sense that they apply to all software installations being performed
when they are set.

We'll refer to them via their respective command line option, but just like all other configuration option these can
also be set via an EasyBuild configuration file or via an ``$EASYBUILD*`` environment variable
(see :ref:`configuration_consistency`).

Group ownership (``--group``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Force group-writeable installations (``--group-writable-installdir``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Forced read-only installations (``--read-only-installdir``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GID bit (``--set-gid-bit``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sticky bit (``--sticky-bit``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

File creation mode mask (``--umask``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Easyconfig parameters
---------------------

These easyconfig parameters can be defined in easyconfig files to control ownership/permission aspects for the
particular installation that results from using that easyconfig file.

Group ownership (``group``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Post installation commands (``postinstallcmds``) ??
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. can be useful for fixing permissions of individual files via chmod/chown
