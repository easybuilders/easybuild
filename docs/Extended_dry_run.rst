.. _extended_dry_run:

Extended dry run
================

Using ``--extended-dry-run`` or ``-x`` (supported since EasyBuild v2.4.0), a detailed overview of the build and install
procedure that EasyBuild is going to execute can be obtained almost instantly.

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
produces:

* The **actual build and install procedure may differ** from the one reported by ``--extended-dry-run``,
  due to conditional checks in the easyblock being used. For example, statements that are conditional on the presence
  of certain files or directories in the build directory will always be false, since the build directory is never
  actually populated. See for example :ref:`extended_dry_run_overview_wrong_build_dir`.

* **Any errors that occur are ignored**, and are reported with a clear warning message. This is done because it is not
  unlikely that these errors occur because of the dry run mechanism; for example, the install step could require that
  certain files created during a previous step are present. However, it is also possible that these errors occur due
  to a bug in the easyblock being used, so it is important to pay attention to them.

  Ignored errors are reported as follows::

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

.. _extended_dry_run_overview:

Overview of dry run mechanism
-----------------------------

During an extended dry run, several operations are not performed, or are only simulated.

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
replaced by the corresponding original value in the dry run output::

    [extract_step method]
      running command "tar xzf /home/example/easybuild/sources/b/bzip2/bzip2-1.0.6.tar.gz"
      (in /tmp/example/eb_build/bzip2/1.0.6/GCC-4.9.2)

.. _extended_dry_run_overview_wrong_build_dir:

Note on build directory in dry run mode
#######################################

The build directory used during an actual (non-dry run) EasyBuild session is most likely going to be slightly
different, since EasyBuild typically moves into the subdirectory that is created by unpacking the first
source file.

For example, while you may see this in the dry run output::

    [build_step method]
      running command " make -j 4"
      (in /tmp/example/eb_build/bzip2/1.0.6/GCC-4.9.2)

However, the actual build directory is more likely to be one level deeper, for example
``/tmp/example/eb_build/bzip2/1.0.6/GCC-4.9.2/bzip2-1.0.6``.

.. _extended_dry_run_overview_downloading:

No downloading of missing source files/patches
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Required files (source files/patches) are not downloaded during a dry run if they are not available yet.

The dry run output will specify whether files are have been found (and if so, at which path) or not; the exact output
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

.. _extended_dry_run_overview_checksum_verification:

Checksum verification is skipped
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Computing checksums of sources files/patches, and verifying them against specified checksums (if available) is
*skipped* during a dry run, because it is considered potentially too time-consuming.
In addition source files/patches may not be available anyway.

.. _extended_dry_run_overview_unpacking_sources:

Source files are not unpacked
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Source files are *not* unpacked, since this may require too much time (in case of large source files).
Additionally, source files may not be available anyway.

This has a number of implications:

* files or directories that may be expected to be there are not, which may lead to (ignored) errors
  if the used easyblock does not take this into account (see also :ref:`extended_dry_run_notes`)
* the build directory in which commands are executed is likely incorrect in the dry run output
  (see also :ref:`extended_dry_run_overview_wrong_build_dir`)

The extraction command is mentioned however::

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
    * applying patch file WRF-3.6.1_netCDF-Fortran_separate_path.patch
      running command "patch -b -p<derived> -i /home/example/easybuild/sources/w/WRF/WRF-3.6.1_netCDF-Fortran_separate_path.patch"
      (in /home/example/easybuild/easybuild/software/WRF/3.6.1-intel-2015a-dmpar)
    * applying patch file WRF-3.6.1_known_problems.patch
      running command "patch -b -p<derived> -i /home/example/easybuild/sources/w/WRF/WRF-3.6.1_known_problems.patch"
      (in /home/example/easybuild/easybuild/software/WRF/3.6.1-intel-2015a-dmpar)
    * applying patch file WRF_tests_limit-runtimes.patch
      running command "patch -b -p<derived> -i /home/example/easybuild/sources/w/WRF/WRF_tests_limit-runtimes.patch"
      (in /home/example/easybuild/easybuild/software/WRF/3.6.1-intel-2015a-dmpar)


.. _extended_dry_run_overview_module_load:

``module load`` statements are executed or simulated
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* ``module load`` statements for dependencies and toolchain for which no module file is available yet are *simulated*;
  if the module file does exist, it is loaded

.. _extended_dry_run_overview_run_cmd:

Shell commands are not executed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* shell commands, typically including configure/build/install commands, are *not* executed
  (except for some light-weight commands that are forcibly run by the EasyBuild framework)

.. _extended_dry_run_overview_sanity_check:

Sanity check paths/commands are not checked
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* the sanity check paths/commands are *not* checked (since they would fail anyway), and are only reported

.. _extended_dry_run_overview_no_downloading:

Module file is incomplete and only printed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* no module file is generated; the contents of the would-be generated module is printed (but is very likely incomplete)


.. _extended_dry_run_guidelines_easyblocks:

Guidelines for easyblocks
-------------------------

To ensure useful output under ``--extended-dry-run``, easyblocks should be implemented keeping in mind that some
operations are possible not performed, to avoid running generating errors. Although errors are ignored by the dry run
mechanism on a per-step basis, they may hide subsequent operations and useful information for the remainder of the step.

.. _extended_dry_run_guidelines_easyblocks_framework_functions:

Use functions provided by the EasyBuild framework
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``setvar``, ``write_file``, ``apply_regex_substitutions``, ``run_cmd``, ``run_cmd_qa``

.. _extended_dry_run_guidelines_easyblocks_verbosity:

Disable verbosity for selected operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``run_cmd(..., verbose=False)``
``setvar(..., verbose=False)``

.. _extended_dry_run_guidelines_files_dirs_checks:

Check whether files/directories exist before accessing them
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``read_file``, ``chdir``, ...


Example output
--------------

Output examples for ``eb --extended-dry-run``/``eb -x``:

* :ref:`extended_dry_run_examples_WRF361_intel2015a`
