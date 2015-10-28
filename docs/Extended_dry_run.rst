.. _extended_dry_run:

Extended dry run
================

Using ``--extended-dry-run`` or ``-x`` (supported since EasyBuild v2.4.0, see release notes for
:ref:`release_notes_eb240`), a detailed overview of the build and install procedure that EasyBuild is going to execute
can be obtained almost instantly.

All time-consuming operations, including executing commands to configure/build/install the software,
are only *reported* rather than being actually performed.

Example output is available at :ref:`extended_dry_run_examples`.

.. contents::
    :depth: 3
    :backlinks: none

.. _extended_dry_run_notes:

Important notes
---------------

There are a couple of things you should be aware of when using ``--extended-dry-run`` and interpreting the output it
produces.

.. _extended_dry_run_notes_differences:

Build/install procedure reported by dryn run may be (slightly) different
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The actual build and install procedure may (slightly) differ from the one reported by ``--extended-dry-run``,
due to conditional checks in the easyblock being used.

For example, expressions that are conditional on the presence of certain files or directories in the build directory
will always be false, since the build directory is never actually populated.

.. _extended_dry_run_notes_ignored_errors:

Errors are ignored (by default) during dry run
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Any errors that occur are ignored, and are reported with a clear warning message.
This is done because it is possible that these errors occur because of the dry run mechanism.

For example, the install step could assume that certain files created by a previous step will be present, but they
will not be there since the commands that are supposed to produce them were not actually performed in dry run mode.

Errors are ignored *on a per-step basis*. When an error is ignored in a particular step, that step is aborted,
which may result in partial dry run output for that particular step. Subsequent steps will still be run (in dry run
mode), however.

Since it's possible that these errors occur due to a bug in the easyblock being used, it's important to pay
attention to these ignored errors.

Ignored errors are reported as follows, for example::

    == testing... [DRY RUN]

    [test_step method]
    !!!
    !!! WARNING: ignoring error "[Errno 2] No such file or directory: 'test'"
    !!!

At the end of dry run output, anonother warning message is shown if any ignored errors occurred::

    == COMPLETED: Installation ended successfully

    !!!
    !!! WARNING: One or more errors were ignored, see warnings above
    !!!

.. _extended_dry_run_notes_ignored_errors_disabling:

Disabling ignoring errors during dry run
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ignoring errors that occur during a dry run is enabled by default; it can be disabled using the configuration option
that is available for it, i.e. by:

* the ``--disable-extended-dry-run-ignore-errors`` command line option
* by defining the ``$EASYBUILD_DISABLE_EXTENDED_DRY_RUN_IGNORE_ERRORS`` environment variable
* or by defining ``disable-extended-dry-run-ignore-errors`` in an EasyBuild configuration file

(see also :ref:`configuring_easybuild`)

.. _extended_dry_run_overview:

Overview of dry run mechanism
-----------------------------

During an extended dry run, several operations are not performed, or are only simulated.

The sections below give a detailed overview of the dry run mechanism.

.. _extended_dry_run_overview_build_install_dirs:

Temporary directories as build/install directories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To make very sure that EasyBuild does not touch any files or directories during the dry run, the build and
(software/module) install directories are replaced by subdirectories of the temporary directory used by that
particular EasyBuild session.

In the background, the values for ``self.builddir``, ``self.installdir`` and ``self.installdir_mod`` are changed
in the ``EasyBlock`` instance(s) being used; this also affects the use of the ``%(builddir)s`` and ``$(installdir)s``
values in easyconfig files.

Although the build and install directories are effectively temporary directories during a dry run (under a prefix like
``/tmp/eb-aD_yNu/__ROOT__``), this is not visible in the dry run output: the 'fake' build and install directories are
replaced by the corresponding original value in the dry run output. For example::

    [extract_step method]
      running command "tar xzf /home/example/easybuild/sources/b/bzip2/bzip2-1.0.6.tar.gz"
      (in /tmp/example/eb_build/bzip2/1.0.6/GCC-4.9.2)

.. _extended_dry_run_overview_build_dir_guess:

Note on build directory in dry run mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The build (sub)directory used during an actual (non-dry run) EasyBuild session may be different than the one mentioned
in the dry run output.

This is because during a dry run, EasyBuild will *guess* the name of the subdirectory that is created by unpacking the
first source file in the build directory as being ``<name>-<version>``.
Although this is a common pattern, it is not always 100% correct.

For example, you may see this in the dry run output for WRF (for which a build-in-installdir procedure is used)::

    [build_step method]
      running command "tcsh ./compile -j 4 wrf"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar/WRF-3.6.1)


The actual build (and install) subdirectory is slightly different while not in dry run mode however, i.e.:
``/home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar/WRFV3``.


.. _extended_dry_run_overview_downloading:

No downloading of missing source files/patches
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Required files (source files/patches) are not downloaded during a dry run if they are not available yet.

The dry run output will specify whether files are found (and if so, at which path) or not; the exact output
for files that were not found depends on whether or not source URLs are available.

For example: if the required source file for ``bzip2`` is not available yet, it is indicated where EasyBuild
will try to download it to::

    [fetch_step method]
    Available download URLs for sources/patches:
      * http://www.bzip.org/1.0.6/$source

    List of sources:
      * bzip2-1.0.6.tar.gz downloaded to /home/example/easybuild/sources/b/bzip2/bzip2-1.0.6.tar.gz

    List of patches:
    (none)

If the source file is already available in the source path that EasyBuild was configured with, it is indicated as such::

    List of sources:
      * bzip2-1.0.6.tar.gz found at /home/example/easybuild/sources/b/bzip2/bzip2-1.0.6.tar.gz

In case no source URLs are available and required files are missing, they are simply marked as such::

    Available download URLs for sources/patches:
    (none)

    List of sources:
      * bzip2-1.0.6.tar.bz2 (MISSING)

However, since the dry run mechanism never actually uses the source files/patches, this does not affect the
remainder of the output of ``--extended-dry-run``/``-x``.


.. _extended_dry_run_overview_checksum_verification:

Checksum verification is skipped
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Computing checksums of sources files/patches, and verifying them against specified checksums (if available) is
*skipped* during a dry run, because it is considered potentially too time-consuming.
In addition, source files/patches may not be available anyway.

If checksums are available they are only reported, for example (for GCC v4.9.3)::

    [checksum_step method]
    * expected checksum for gcc-4.9.3.tar.bz2: 6f831b4d251872736e8e9cc09746f327
    * expected checksum for gmp-6.0.0a.tar.bz2: b7ff2d88cae7f8085bd5006096eed470
    * expected checksum for mpfr-3.1.2.tar.gz: 181aa7bb0e452c409f2788a4a7f38476
    * expected checksum for mpc-1.0.2.tar.gz: 68fadff3358fb3e7976c7a398a0af4c3
    * expected checksum for mpfr-3.1.2-allpatches-20141204.patch: 58aec98d15982f9744a043d2f1c5af82

.. _extended_dry_run_overview_unpacking_sources:

Source files are not unpacked
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Source files are *not* unpacked, since this may require too much time (in case of large source files).
Additionally, source files may not be available anyway.

This has a number of implications:

* files or directories that may be expected to be there are not, which may lead to (ignored) errors
  if the used easyblock does not take this into account (see also :ref:`extended_dry_run_notes_ignored_errors`)
* the build directory in which commands are executed may be incorrect in the dry run output
  (see also :ref:`extended_dry_run_overview_build_dir_guess`)

The extraction command is mentioned in the dry run output however, for example::

    [extract_step method]
      running command "tar xjf bzip2-1.0.6.tar.bz2"
      (in /tmp/example/eb_build/bzip2/1.0.6/GCC-4.9.2)

.. _extended_dry_run_overview_patching:

Patch files are not applied, no runtime patching
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since source files are not unpacked, patch files can not applied either.

The dry run output does provide an overview of patch files, together with where they are found
and how they are applied::

    [patch_step method]
    * applying patch file WRF_parallel_build_fix.patch
      running command "patch -b -p<derived> -i /home/example/easybuild/sources/w/WRF/WRF_parallel_build_fix.patch"
      (in /home/example/easybuild/easybuild/software/WRF/3.6.1-intel-2015a-dmpar)
    * applying patch file WRF-3.6.1_known_problems.patch
      running command "patch -b -p<derived> -i /home/example/easybuild/sources/w/WRF/WRF-3.6.1_known_problems.patch"
      (in /home/example/easybuild/easybuild/software/WRF/3.6.1-intel-2015a-dmpar)

Likewise, runtime patching performed by the easyblock itself can not work either. If the ``apply_regex_substitutions``
function (available from ``easybuild.tools.filetools``) is used, a clear overview is included in the dry run output
(see also :ref:`extended_dry_run_guidelines_easyblocks_framework_functions_runtime_patching`).

For example, in the ``configure`` step of the WRF easyblock when using the Intel compilers, this yields::

    [configure_step method]
    ...
    applying regex substitutions to file configure.wrf
      * regex pattern '^(DM_FC\s*=\s*).*$', replacement string '\1 mpif90'
      * regex pattern '^(DM_CC\s*=\s*).*$', replacement string '\1 mpicc -DMPI2_SUPPORT'

If the ``apply_regex_substitutions`` function provided for runtime patching is not used (and ``fileinput`` is used
directly, for example), runtime patching performed by the easyblock will most likely result in an error, leading to
the step in which it is being performed being aborted (see :ref:`extended_dry_run_notes_ignored_errors`).

.. _extended_dry_run_overview_module_load:

Module ``load`` statements are executed or simulated
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``module load`` statements are either effectively executed or simulated, dependending on whether the corresponding
module files are available or not.

.. _extended_dry_run_overview_module_load_available:

Available modules are loaded
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``module load`` statements are fairly light-weight, so they are effectively executed if the module being loaded is
available.

The dry run output includes an overview of the modules being loaded. In addition an overview of
all loaded modules, including the ones that were loaded indirectly, is shown.

For example::

    [prepare_step method]
    Defining build environment, based on toolchain (options) and specified dependencies...

    Loading toolchain module...

    module load GCC/4.9.2

    Loading modules for dependencies...

    module load M4/1.4.17-GCC-4.9.2

    Full list of loaded modules:
      1) GCC/4.8.2
      2) M4/1.4.17-GCC-4.9.2

.. _extended_dry_run_overview_module_load_simulated:

Loading of non-available modules is simulated
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If the module file required to execute a particular ``module load`` statement is not available, the dry run mechanism
will *simulate* the loading of the module.

The ``module load`` statements that were simulated rather than actually performed are clearly indicated using
``[SIMULATED]`` in the dry run output, for example::

    [prepare_step method]
    Defining build environment, based on toolchain (options) and specified dependencies...

    Loading toolchain module...

    module load intel/2015a

    Loading modules for dependencies...

    module load JasPer/1.900.1-intel-2015a
    module load netCDF/4.3.2-intel-2015a [SIMULATED]
    module load netCDF-Fortran/4.4.0-intel-2015a [SIMULATED]
    module load tcsh/6.18.01-intel-2015a

Only modules that were effectively loaded will appear in the full list of modules being printed; modules for which
the load was simulated will not be included.

.. _extended_dry_run_overview_module_load_simulated_deps:

Simulated loading of non-available *dependency* modules
#######################################################

For dependencies, simulating a ``module load`` statement basically (only) entails defining the ``$EBROOT*`` and
``$EBVERSION*`` environment variables (the full variable names are determined by the software name), which are picked
up by resp. the ``get_software_root`` and ``get_software_version`` functions often used in easyblocks.

The ``$EBVERSION*`` environment variable is defined with the actual software version of the dependency.

For the ``$EBROOT*`` environment variable, the name of the environment variable itself prefixed with a '``$``'
is used as a dummy value, rather than using an fake installation software prefix.
For example, when simulating the load statement for a ``GCC`` module, the environment variable ``$EBROOTGCC`` is
defined as the string value ``'$EBROOTGCC'`` (literally).

This results in sensible output when this value is picked up via ``get_software_root`` by the easyblock.

For example, for netCDF used as a dependency for WRF the following is included in the module file contents included in
the dry run output::

        setenv	NETCDF		"$EBROOTNETCDF"
        setenv	NETCDFF		"$EBROOTNETCDFMINFORTRAN"

.. _extended_dry_run_overview_module_load_simulated_toolchain:

Simulated loading of non-available *toolchain* module
#####################################################

When the module that corresponds to the toolchain being used is not available, the dry run mechanism will also simulate
the ``module load`` statements for the individual toolchain components, to ensure that version checks on the toolchain
components can work as expected.

For example, if the toolchain module ``intel/2015a`` is not available, the loading of the ``icc``, ``ifort``, ``impi``
and ``imkl`` modules that would be loaded by the ``intel`` module is also simulated::

    [prepare_step method]
    Defining build environment, based on toolchain (options) and specified dependencies...

    Loading toolchain module...

    module load icc/2015.1.133-GCC-4.9.2 [SIMULATED]
    module load ifort/2015.1.133-GCC-4.9.2 [SIMULATED]
    module load impi/5.0.2.044-iccifort-2015.1.133-GCC-4.9.2 [SIMULATED]
    module load imkl/11.2.1.133-iimpi-7.2.3-GCC-4.9.2 [SIMULATED]
    module load intel/2015a [SIMULATED]


.. _extended_dry_run_build_environment:

Build environment is reported
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The build environment that is set up based on the toolchain (and toolchain options) being used, and the dependencies
being loaded is reported as a part of the dry run output.

For example, when ``GCC`` is used as a toolchain something like this will be included in the ``prepare_step`` part
of the dry run output::

    Defining build environment...

      export CC="gcc"
      export CFLAGS="-O2"
      export CXX="g++"
      export CXXFLAGS="-O2"
      export F77="gfortran"
      export F90="gfortran"
      export F90FLAGS="-O2"
      export FFLAGS="-O2"
      export FLIBS="-lgfortran"
      export LDFLAGS="-L/home/example/eb/software/GCC/4.8.2/lib"
      export LIBS="-lm -lpthread"
      export OPTFLAGS="-O2"
      export PRECFLAGS=""

This is particularly useful as an overview of which environment variables that are defined by the toolchain mechanism,
and to assess the effect of changing toolchain options.

The output is deliberately formatted such that is can be easily copy-pasted, which can be useful to mimic the
environment in which EasyBuild will perform the build and install procedure.

.. _extended_dry_run_overview_run_cmd:

Shell commands are not executed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Any shell commands that are executed via the ``run_cmd`` and ``run_cmd_qa`` functions that are provided by the
EasyBuild framework via the ``easybuild.tools.run`` are *not* executed, only reported
(see also :ref:`extended_dry_run_guidelines_easyblocks_framework_functions_run_cmd`).

This typically includes the commands that are defined in the easyblock to be run as a part of the
configure/build/install steps.

For example::

    configuring... [DRY RUN]

    [configure_step method]
      running command " ./configure --prefix=/home/example/eb/software/make/3.82-GCC-4.8.2 "
      (in /home/example/eb/build/make/3.82/GCC-4.8.2/make-3.82)

    building... [DRY RUN]

    [build_step method]
      running command " make -j 4 "
      (in /home/example/eb/build/make/3.82/GCC-4.8.2/make-3.82)

    ...

    installing... [DRY RUN]

    [stage_install_step method]

    [make_installdir method]

    [install_step method]
      running command " make install "
      (in /home/example/eb/build/make/3.82/GCC-4.8.2/make-3.82)

There are a couple of minor exceptions though. Some (light-weight) commands are always run by the EasyBuild framework,
even in dry run mode, and an easyblock can specify that particular commands *must* always be run
(see also :ref:`extended_dry_run_guidelines_easyblocks_framework_functions_run_cmd`).

.. _extended_dry_run_overview_sanity_check:

Sanity check paths/commands are not checked
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since nothing is actually being installed during a dry run, the sanity check paths/commands can not be checked.

Instead, the dry run mechanism will produce a clear overview of which paths are expected to be found in the
installation directory, and which commands are expected to work (if any).

For example::

    sanity checking... [DRY RUN]

    [sanity_check_step method]
    Sanity check paths - file ['files']
      * WRFV3/main/ideal.exe
      * WRFV3/main/libwrflib.a
      * WRFV3/main/ndown.exe
      * WRFV3/main/nup.exe
      * WRFV3/main/real.exe
      * WRFV3/main/tc.exe
      * WRFV3/main/wrf.exe
    Sanity check paths - (non-empty) directory ['dirs']
      * WRFV3/main
      * WRFV3/run
    Sanity check commands
      (none)

.. _extended_dry_run_overview_no_downloading:

Module file is incomplete and only printed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

During a dry run, the contents of the module file that would be installed is still generated, but only printed; it
is not actually written to file.

More importantly however, the module file being reported is bound to be **incomplete**, since the module generator
only includes certain statements conditionally, for example only if the files/directories to which they relate
actually exist. This typically affects ``prepend-path`` statements, e.g. for ``$PATH``, ``$LD_LIBRARY_PATH``,
etc.

For example, the reported module file for make v3.82 built with ``GCC/4.8.2`` may look something like::

    creating module... [DRY RUN]

    [make_module_step method]
    Generating module file /home/example/eb/modules/all/make/3.82-GCC-4.8.2, with contents:

        #%Module
        proc ModulesHelp { } {
            puts stderr { make-3.82: GNU version of make utility - Homepage: http://www.gnu.org/software/make/make.html
            }
        }
        
        module-whatis {Description: make-3.82: GNU version of make utility - Homepage: http://www.gnu.org/software/make/make.html}
        
        set root /home/example/eb/software/make/3.82-GCC-4.8.2
        
        conflict make
        
        if { ![ is-loaded GCC/4.8.2 ] } {
            module load GCC/4.8.2
        }
        
        setenv	EBROOTMAKE		"$root"
        setenv	EBVERSIONMAKE		"3.82"
        setenv	EBDEVELMAKE		"$root/easybuild/make-3.82-GCC-4.8.2-easybuild-devel"
        
        # Built with EasyBuild version 2.4.0

Note that there is no ``prepend-path PATH`` statement for the ``bin`` subdirectory, for example.


.. _extended_dry_run_guidelines_easyblocks:

Guidelines for easyblocks
-------------------------

To ensure useful output under ``--extended-dry-run``, easyblocks should be implemented keeping in mind that some
operations are possible not performed, to avoid generating errors in dry run mode.

Although errors are just ignored by the dry run mechanism on a per-step basis, they may hide subsequent operations and
useful information for the remainder of the step (see also :ref:`extended_dry_run_notes_ignored_errors`).

.. _extended_dry_run_guidelines_easyblocks_detect_dry_run:

Detecting dry run mode and enhancing the dry run output
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To detect whether an easyblock is being used in dry run mode, it suffices to check the ``self.dry_run`` class variable.

Additional messages can be included in the dry run output using the ``self.dry_run_msg`` method.

For example::

    class Example(EasyBlock):

        def configure_step(self):

            if self.dry_run:
                self.dry_run_msg("Dry run mode detected, not reading template configuration files")
                ...

.. _extended_dry_run_guidelines_files_dirs_checks:

Check whether files/directories exist before accessing them
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Rather than assuming that particular files or directories will be there, easyblocks should take into that they may
not be, for example because EasyBuild is being run in dry run mode.

For example, instead of simply assuming that a directory named '``test``' will be there, the existence should be
checked first. If not, an appropriate error should be produced, but only when the easyblock is *not* being used in
dry run mode.

**Bad** example::

    # *BAD* example: maybe the 'test' directory is not there (e.g., because we're in dry run mode)!
    try:
        testcases = os.listdir('test')
    except OSError as err:
        raise EasyBuildError("Unexpected error when determining list of test cases: %s", err)

Good example::

    # make sure the 'test' directory is there before trying to access it
    if os.path.exists('test'):
        try:
            testcases = os.listdir('test')
        except OSError as err:
            raise EasyBuildError("Unexpected error when determining list of test cases: %s", err)

    # only raise an error if we're not in dry run mode
    elif not self.dry_run:
        raise EasyBuildError("Test directory not found, failed to determine list of test cases")

Easyblocks that do not take this into account are likely to result in ignored errors during a dry run (see also
:ref:`extended_dry_run_notes_ignored_errors`). For example, for the bad example shown above::

    !!!
    !!! WARNING: ignoring error "Unexpected error when determining list of test cases: [Errno 2] No such file or directory: 'test'"
    !!!

.. _extended_dry_run_guidelines_easyblocks_framework_functions:

Use functions provided by the EasyBuild framework
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The EasyBuild framework provides a bunch of functions that are "*dry run-aware*", and which can significantly help
in keeping easyblocks free from conditional statements checking ``self.dry_run``:

* :ref:`extended_dry_run_guidelines_easyblocks_framework_functions_setvar`
* :ref:`extended_dry_run_guidelines_easyblocks_framework_functions_write_file`
* :ref:`extended_dry_run_guidelines_easyblocks_framework_functions_runtime_patching`
* :ref:`extended_dry_run_guidelines_easyblocks_framework_functions_run_cmd`

.. _extended_dry_run_guidelines_easyblocks_framework_functions_setvar:

Defining environment variables: ``setvar``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For defining environment variables, the ``setvar`` function available in the ``easybuild.tools.environment`` module
should be used.

For example, from the WRF easyblock::

    jasper = get_software_root('JasPer')
    if jasper:
        env.setvar('JASPERINC', os.path.join(jasper, 'include'))

When triggered in dry run mode, this will result in a clear dry run message like::

      export JASPERINC="$EBROOTJASPER/include"
 
The actual output depends on whether or not the required module for ``JasPer`` is available
(see :ref:`extended_dry_run_overview_module_load_simulated_deps`).

Silently defining environment variables
#######################################

The ``setvar`` function also supports defining environment variables *silently*, i.e. without producing a
corresponding dry run message, via the named argument ``verbose``.

This is used in a couple of places in the EasyBuild framework, to avoid some environment variables being defined
cluttering the dry run output without added value. It can be used for similar reasons in easyblocks.

For example, the ``PythonPackage`` uses it in the *install* step, to modify ``$PYTHONPATH`` as required by the
``python setup.py install`` procedure (which is considered not relevant to include in the dry run output, since
it's a technicality)::

    env.setvar('PYTHONPATH', new_pythonpath, verbose=False)


.. _extended_dry_run_guidelines_easyblocks_framework_functions_write_file:

Writing or appending to files: ``write_file``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For writing and appending to files, the EasyBuild framework provides the ``write_file`` function (available from
the ``easybuild.tools.filetools`` module).

Using it is straightforward, for example::

    write_file('example.txt', "Contents for the example file")

To append to an existing file, ``write_file`` support a named argument ``append``.

When used in dry run mode, ``write_file`` does not actually (attempt to) write to the file; instead, it just produces
an appropriate dry run message and returns.

For example::

    file written: /tmp/eb-ksVC07/tmp.conf

.. _extended_dry_run_guidelines_easyblocks_framework_functions_runtime_patching:

Runtime patching of files: ``apply_regex_substitutions``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To make runtime patching of files in easyblocks easier, and to do it with taking the possibility of being in dry run
module into account, the EasyBuild framework provides the ``apply_regex_substitutions`` function (available from the
``easybuild.tools.filetools`` module, since EasyBuild v2.4.0).

This function takes two arguments: a path to the file that should be patched, and a list of tuples specifying the regular
expression pattern to match on, and the string value that should be used as replacement text.

For example (simple fictional example)::

    # replace value for C++ compiler
    apply_regex_substitutions('config.mk', [('^(CPLUSPLUS\s*=).*', '\1 %s' % os.environ['CXX'])])

When used in dry run mode, it will produce a message like::

    applying regex substitutions to file config.mk
      * regex pattern '^(CPLUSPLUS\s*=\s).*', replacement string '\1 g++'

.. _extended_dry_run_guidelines_easyblocks_framework_functions_run_cmd:

Executing commands: ``run_cmd`` and ``run_cmd_qa``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To execute shell commands, the ``run_cmd`` and ``run_cmd_qa`` functions are provided by the EasyBuild framework in the
``easybuild.tools.run`` module, with the latter providing support for running interactive commands.

In their simplest form, they simply take the command to execute as a string. For example::

      run_cmd("tcsh ./compile -j %s wrf" % self.cfg['parallel'])

In dry run mode, these functions just produce a dry run message, rather than actually executing the specified command.
For example::

      running command "tcsh ./compile -j 4 wrf"
      (in /home/example/eb/software/WRF/3.6.1-intel-2015a-dmpar/WRF-3.6.1)

Take into account that the directory included in the message may not be 100% accurate,
see :ref:`extended_dry_run_overview_build_dir_guess`.

Silently executing commands
###########################

The ``verbose`` named argument supported by the ``run_cmd`` function allows to execute a particular command silently,
i.e. without producing a dry run message.

For example::

    # only run for debugging purposes
    run_cmd("ulimit -v", verbose=False)

Forced execution of particular commands
#######################################

Sometimes, it can be required that specific (light-weight) commands are *always* executed, because they have
side-effects that are assumed to have taken place later in the easyblock.

For this, the ``run_cmd`` function support another named argument, i.e. ``forced``.
When set to ``True``, the specified command will always be executed, even when in dry run mode.

This is mainly intended for use in the EasyBuild framework itself, where commands that verify certain things must
be executed, but it can also be useful for easyblocks (if used correctly).

For example::

    out, exit_code = run_cmd("type module", simple=False, forced=True)


Example output
--------------

Output examples for ``eb --extended-dry-run``/``eb -x``:

* :ref:`extended_dry_run_examples_make382_GCC482`
* :ref:`extended_dry_run_examples_WRF361_intel2015a`
