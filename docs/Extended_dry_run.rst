.. _extended_dry_run:

Extended dry run
================

Using ``--extended-dry-run`` or ``-x`` (supported since EasyBuild v2.4.0), a detailed overview of the build and install
procedure that EasyBuild is going to execute can be obtained almost instantly.

All time-consuming operations, such as extracting the source files and running commands to configure/build/install the
software are only reported, not actually performed.

.. _extended_dry_run_notes:

Important notes
---------------

There are a couple of things you should be aware of when using ``--extended-dry-run`` and interpreting the output it
produces:

* The **actual build and install procedure may differ** from the one reported by ``--extended-dry-run``,
  due to conditional checks in the easyblock being used. For example, statements that are conditional on the presence
  of certain files or directories in the build directory will always be false, since the build directory is never
  actually populated.

* **Any errors that occur are ignored**, and are reported with a clear warning message. This is done because it is not
  unlikely that these errors occur because of the dry run mechanism; for example, the install step could require that
  certain files created during a previous step are present. However, it is also possible that these errors occur due
  to a bug in the easyblock being used, so it is important to pay attention to them.

  .. code::

    == testing... [DRY RUN]

    [test_step method]
    !!! WARNING !!! ignoring error: "[Errno 2] No such file or directory: 'test'"

    ...

    !!! WARNING !!! One or more errors were ignored, see warnings above

    ...

Overview of dry run mechanism
-----------------------------

During an extended dry run, several operations are not performed, or are only simulated.

* temporary directories are used as build/install directory, to ensure that no persistent changes are made on the
  filesystem
* missing source files/patches are *not* downloaded
* computing/verifying checksums of source files/patches is skipped
* extraction of source files is not performed
* ``module load`` statements for dependencies and toolchain for which no module file is available yet are *simulated*;
  if the module file does exist, it is loaded
* shell commands, typically including configure/build/install commands, are *not* executed
  (except for some light-weight commands that are forcibly run by the EasyBuild framework)
* the sanity check paths/commands are *not* checked (since they would fail anyway), and are only reported
* no module file is generated; the contents of the would-be generated module is printed (but is very likely incomplete)

Example
-------

Output examples for ``eb --extended-dry-run``/``eb -x``:

* :ref:`extended_dry_run_examples_WRF361_intel2015a`
