.. _partial_installations:

Partial installations
=====================

Several ways of performing partial installations are supported. These may be useful when debugging a particular issue
with the installation procedure being performed by EasyBuild, updating existing software installations or module files,
or after changing the EasyBuild configuration (e.g., switching to module files in Lua syntax or a different module
naming scheme).

* :ref:`partial_installation_stop`
* :ref:`partial_installation_skip`
* :ref:`module_only`

  * :ref:`module_only_only_regenerate`
  * :ref:`module_only_additional`
  * :ref:`module_only`

.. _partial_installation_stop:

Stopping the installation procedure *after* a step using ``-s``/``--stop``
--------------------------------------------------------------------------

To stop the installation procedure *after* a specific step in the installation procedure, the ``-s``/``--stop``
command line option can be used; the name of the step must be supplied as an argument.

The following step names are recognized (listed in execution order): ``fetch``, ``ready``, ``source``, ``patch``,
``prepare``, ``configure``, ``build``, ``test``, ``install``, ``extensions``, ``package``, ``postproc``,
``sanitycheck``, ``cleanup``, ``module``, ``testcases``.

Example usage::

 $ eb GCC-4.9.2.eb --stop configure
 == temporary log file in case of crash /tmp/eb-X2Z0b7/easybuild-mGxmNb.log
 == processing EasyBuild easyconfig /home/example/GCC-4.9.2.eb
 == building and installing GCC/4.9.2...
 == fetching files...
 == creating build dir, resetting environment...
 == unpacking...
 == patching...
 == preparing...
 == configuring...
 == COMPLETED: Installation STOPPED successfully
 == Results of the build can be found in the log file /dev/shm/example/GCC/4.9.2/dummy-dummy/easybuild/easybuild-GCC-4.9.2-20150430.091644.log
 == Build succeeded for 1 out of 1
 == temporary log file(s) /tmp/eb-X2Z0b7/easybuild-mGxmNb.log* have been removed.
 == temporary directory /tmp/eb-X2Z0b7 has been removed.


.. _partial_installation_skip:

Installing additional extensions using ``-k``/``-skip``
-------------------------------------------------------

For software applications that may include :ref:`extensions`, it is often required to install one or more additional
extensions without having to reinstall the software package (and all extensions) from scratch.
For this purpose, the ``-k``/``--skip`` command line option is available.

To actually skip an existing software installation and all installed extensions, a corresponding module must be
available already; if not, the installation procedure will be performed from scratch.
To trigger the installation of missing extensions, ``--force`` must be used as well; without it, the installation
procedure will be skipped as a whole (since the module is already available).

When ``--skip`` is combined with ``--force``, EasyBuild will:

i) ensure that all (extension) sources are available (and try to fetch them if needed);
ii) prepare the build environment;
iii) check which extensions have not been installed yet;
iv) install the missing extensions;
v) run the sanity check (which includes checking that all extensions are available)
vi) regenerate the module file (since it contains a list of installed extensions)

Example usage::

 $ eb Python-2.7.9-intel-2015a.eb --skip
 ...
 == Python/2.7.9-intel-2015a is already installed (module found), skipping
 == No easyconfigs left to be built.
 == Build succeeded for 0 out of 0

.. code::

 $ eb Python-2.7.9-intel-2015a.eb --skip --force
 ...
 == building and installing Python/2.7.9-intel-2015a...
 ...
 == configuring [skipped]
 == building [skipped]
 == testing [skipped]
 == installing [skipped]
 == taking care of extensions...
 ...
 == sanity checking...
 == cleaning up...
 == creating module...
 == COMPLETED: Installation ended successfully

.. note::
  Upgrading of extensions to a newer version does not work (yet) using ``--skip``, because the way in which extensions
  are checked for availability, i.e. the extensions filter, is (usually) version-agnogstic.

.. note::
  The '``skipsteps``' easyconfig parameter has a different purpose, i.e. to specify which installation steps should
  *always* be skipped when the installation of a particular software package is performed, no matter whether the
  software or corresponding module is already available or not.

.. _module_only:

Only (e)generating (additional) module files using ``--module-only``
---------------------------------------------------------------------

Since EasyBuild v2.1, it is possible to only (re)generate the module file that matches the specifications in the
easyconfig file, using ``--module-only``. Depending on the use case, additional options should be supplied.

Usually ``--force`` is also required, either to ignore the existing module file (if the module is available under the
same name as the one being (re)generated), or to skip the sanity check that verifies the software installation (if no
software installation is available).

Combining ``--module-only`` with ``--installpath-modules`` is also a common use case, to generate the module file in
a (test) location other than the software installation prefix (see :ref:`installpath`).

Use cases:

* :ref:`module_only_only_regenerate`
* :ref:`module_only_existing_different`
* :ref:`module_only_force`

.. _module_only_only_regenerate:

Only (re)generating (existing) module file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To only generate a module file (i.e., skip actually building and installing the software), or to regenerate an
existing module file, ``--module-only`` can be used.

In the former case, enabling ``--force`` is required because the sanity check step that verifies whether the
installation produced the expected files and/or directories is not skipped unless forced.
In the latter case, ``--force`` must be used to make EasyBuild ignore that the module is already available
according to the modules tool.

Example usage:

* only generate module file::

   $ module avail GCC
   ---------------------------- /home/example/.local/modules/all ----------------------------
   GCC/4.8.2
   
   $ eb GCC-5.1.0.eb --module-only --force
   ...
   == building and installing GCC/5.1.0...
   == fetching files [skipped]
   ...
   == configuring [skipped]
   == building [skipped]
   == testing [skipped]
   == installing [skipped]
   ...
   == sanity checking [skipped]
   == cleaning up [skipped]
   == creating module...
   == COMPLETED: Installation ended successfully
   ...

   $ module avail GCC

   ---------------------------- /home/example/.local/modules/all ----------------------------
   GCC/4.8.2     GCC/5.1.0

* regenerate existing module file::

   $ module avail GCC/4.8.2

   ---------------------------- /home/example/.local/modules/all ----------------------------
   GCC/4.8.2

   $ ls -l /home/example/.local/modules/all/GCC/4.8.2
   -rw-rw-r-- 1 example example 1002 Jan 11 17:19 /home/example/.local/modules/all/GCC/4.8.2

   $ eb GCC-4.8.2.eb --module-only --force
   ...
   == building and installing GCC/4.8.2...
   ...
   == sanity checking [skipped]
   == creating module...
   == COMPLETED: Installation ended successfully
   ...

   $ ls -l /home/example/.local/modules/all/GCC/4.8.2
   -rw-rw-r-- 1 example example 1064 Apr 30 10:54 /home/example/.local/modules/all/GCC/4.8.2

.. _module_only_additional:

Generating additional module files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Generating an additional module file, next to the one(s) already available, is also supported. This can achieved by
combining ``--module-only`` with additional configuration options that apply to the module generation.

Examples:

* to generate a module file in Lua syntax, next to an already existing module file in Tcl syntax,
  ``--module-only --module-syntax=Lua`` can be used::

    $ module avail GCC/4.8.2

    ---------------------------- /home/example/.local/modules/all ----------------------------
    GCC/4.8.2

    $ ls -l /home/example/.local/modules/all/GCC/4.8.2*
    -rw-rw-r-- 1 example example 1064 Apr 30 10:54 /home/example/.local/modules/all/GCC/4.8.2

    $ eb GCC-4.8.2.eb --modules-tool=Lmod --module-only --module-syntax=Lua --force
    ...
    == building and installing GCC/4.8.2...
    ...
    == sanity checking [skipped]
    == creating module...
    == COMPLETED: Installation ended successfully
    ...

    $ ls -l /home/example/.local/modules/all/GCC/4.8.2*
    -rw-rw-r-- 1 example example 1064 Apr 30 10:54 /home/example/.local/modules/all/GCC/4.8.2
    -rw-rw-r-- 1 example example 1249 Apr 30 11:56 /home/example/.local/modules/all/GCC/4.8.2.lua

  .. note::
      Since only Lmod can consume module files in Lua syntax, it must be used as a modules tool;
      see also :ref:`module_syntax`.

      Only changing the syntax of the module file does not affect the module name, so Lmod will
      report the module as being available. Hence, ``--force`` must be used here as well.

* to generate a module file using a different naming scheme, ``--module-only`` can be combined with
  ``--module-naming-scheme``::

     $ eb --installpath-modules=$HOME/test/modules --module-only --module-naming-scheme=HierarchicalMNS --force
     ...
     == building and installing Core/GCC/4.8.2...
     ...
     == sanity checking [skipped]
     == creating module...
     == COMPLETED: Installation ended successfully

     $ module unuse $HOME/.local/modules/all
     $ module use $HOME/test/modules/all
     $ module avail

     ---------------------------- /home/example/test/modules/all ----------------------------
     Core/GCC/4.8.2

  .. note:: Modules that are generated used different module naming schemes should *never* be mixed, hence the use
            of ``--installpath-modules``, see also :ref:`installpath_direct_options`.

  .. note:: The modules files generated using the specified module naming scheme will most likely **not** be tied to
            an existing software installation in this case (unless the software installation was already there somehow),
            since the name of the subdirectory of the software installation prefix is also governed by the active
            module naming scheme. This is also why ``--force`` must be used in the example above (to skip the sanity
            check that verifies the software installation).

            Thus, this is only useful to assess how the module tree would look like under a particular module naming
            scheme; the modules themselves are useless since they point to empty installation directories.

            To tie a module file generated using to an existing software installation that was performed under a
            different module naming scheme, a simple module naming scheme can be implemented that mixes two modules
            naming schemes, by providing the name of the software installation subdirectory using one scheme, and the
            module names (and other metadata for module files) with the other.

            See for example the `MigrateFromEBToHMNS module naming scheme that is used by the EasyBuild framework unit
            tests <https://github.com/hpcugent/easybuild-framework/blob/master/test/framework/sandbox/easybuild/tools/module_naming_scheme/migrate_from_eb_to_hmns.py>`_.
