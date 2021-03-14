.. _rpath_support:

Support for RPATH
=================

Since EasyBuild v3.5.2, (stable) support is available for using RPATH.

.. note:: RPATH support has been available since EasyBuild v3.0.0, but was considered experimental
          until EasyBuild v3.5.2 (cfr. :ref:`experimental_features` for more information on experimental features).

.. contents::
    :depth: 3
    :backlinks: none


.. _rpath_support_what:

What is RPATH?
--------------

RPATH is a mechanism to include a list of directories in a binary where required shared libraries may be available.
These locations are considered by the dynamic loader (``ld*.so``) to locate the libraries that are required by a particular binary.

Hence, instructing the dynamic linker (``ld``) to include RPATH entries in a binary is an alternative to specifying library locations
through ``$LD_LIBRARY_PATH``.

For more information on RPATH, see https://linux.die.net/man/8/ld-linux


.. _rpath_support_why:

Why RPATH?
----------

Using RPATH can be interesting for a number of reasons:

* it can help to avoid a (too) large environment, since:

  * ``$LD_LIBRARY_PATH`` does not need to be set anymore for all dependencies providing libraries
  * it leads to fewer runtime dependencies (and hence fewer modules need to be loaded)

* binaries can be used without problems w.r.t. resolving required libraries in other environments

* it may result in better startup performance, since ``$LD_LIBRARY_PATH`` does not have to be iterated over

A minor downside is that it becomes less trivial to move installations of dependencies to a different location
(which is something that you should not do without good reason anyway).


.. _rpath_support_enable:

Enabling RPATH linking
----------------------

To instruct EasyBuild to enable RPATH linking, use the ``--rpath`` configuration option.

.. note:: For now, ``--experimental`` is also required, since the implementation of RPATH support is not considered fully stable yet.


.. _rpath_support_implementation:

Implementation
--------------

When EasyBuild is configured to use RPATH, wrapper scripts are put in place for the dynamic linker commands (``ld``, ``ld.gold``),
as well as for every compiler command that is part of the toolchain being used. This is done during the ``prepare`` step.

The wrapper scripts will analyze and rewrite the list of arguments supplied to the command they are wrapping as needed, i.e.:

* inject an ``-rpath`` argument for every ``-L`` argument that specifies a library directory (with some exceptions, see also :ref:`rpath_support_filtered_paths`)
* filter out arguments that affect RPATH (e.g., ``--enable-new-dtags``)
* ensure that the library subdirectories (``lib``, ``/lib64``) of the installation directory also have an RPATH entry
* include additional  arguments related to RPATH (e.g. ``--disable-new-dtags``)

As such, ``ps`` may show something like::

  \_ /bin/bash /tmp/eb-M3393U/tmpRVJqwr/rpath_wrappers/gcc -O2 example.c -L/example -lexample
  |  \_ /example/software/GCCcore/4.9.3/bin/gcc -Wl,-rpath=$ORIGIN/../lib -Wl,-rpath=$ORIGIN/../lib64 -Wl,--disable-new-dtags -Wl,-rpath=/example -O2 example.c -L/example -lexample

Here, ``/tmp/eb-M3393U/tmpRVJqwr/rpath_wrappers/gcc`` is the wrapper script for ``gcc``,
which tweaks the list of command line arguments for ``gcc``
before calling out to the real ``gcc`` command (i.e., ``/example/software/GCCcore/4.9.3/bin/gcc`` in this example).

.. _rpath_support_impl_logs:

RPATH wrapper script log files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When EasyBuild is used in debug mode (``--debug``), the RPATH wrapper script will generate log files in
the temporary directory used by EasyBuild, for debugging purposes::

  $ ls -l /tmp/eb-_hoff5/rpath_wrapper*log | sed 's/vsc40023/example/g'
  -rw-rw-r-- 1 example example  739692 Nov 16 15:50 /tmp/eb-_hoff5/rpath_wrapper_gcc.log
  -rw-rw-r-- 1 example example   27814 Nov 16 15:50 /tmp/eb-_hoff5/rpath_wrapper_g++.log
  -rw-rw-r-- 1 example example 1589626 Nov 16 15:50 /tmp/eb-_hoff5/rpath_wrapper_ld.gold.log
  -rw-rw-r-- 1 example example    8870 Nov 16 15:50 /tmp/eb-_hoff5/rpath_wrapper_ld.log

These log files include details on every captured compiler/linker command, i.e. the original list of arguments,
the tweaked list of arguments that includes the injected ``-rpath`` arguments, etc., and may be helpful to debug the RPATH support.

.. _rpath_support_impl_overhead:

Overhead of RPATH wrapper scripts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wrapping each compiler and linker command being executed comes at a cost,
especially since the wrapper (shell) script calls out to a Python script (``rpath_args.py``) to do the heavy lifting.

Some early benchmarking has shown that this overhead is quite limited however,
with observed slowdowns of the build and installation procedure of 10-15%.


.. _rpath_support_filtered_paths:

Filtering RPATH entries via ``--rpath-filter``
----------------------------------------------

To avoid that the wrapper scripts inject RPATH entries for particular locations,
EasyBuild can be configured with an RPATH filter via ``--rpath-filter``.

The specified value should be a comma-separated list of (Python) regular expressions for paths.
Only paths that *match* either of the specified patterns will be filtered out.

For example, to filter out locations in either ``/opt/lib`` or ``/apps/lib``, use::

  eb --rpath-filter='/opt/lib.*,/apps/lib.*'

By default, no RPATH entries will be injected for system locations
that start with either ``/lib`` (incl. ``/lib64``) or ``/usr``
(which is equivalent with ``--rpath-filter='/lib.*,/usr.*'``).

.. note:: If you are specifying ``--rpath--filter``, the default filter is *overwritten*,
          so if you want to retain the filtering for system locations you should also
          include ``/lib.*`` and ``/usr.*``.

          For example, to also filter out paths starting with ``/example``::

            eb --rpath-filter='/lib.*,/usr.*,/example.*'


.. _rpath_support_LD_LIBRARY_PATH:

Relation to ``$LD_LIBRARY_PATH``
--------------------------------

As mentioned above (:ref:`rpath_support_why`), using RPATH avoids the need to update ``$LD_LIBRARY_PATH`` for every dependency.

However, there is a chicken-or-egg situation: even though a particular dependency itself can be built and installed using RPATH,
it does not mean that software packages that require it *have* to built with RPATH...

Hence, EasyBuild does not automatically exclude ``$LD_LIBRARY_PATH`` update statements from the generated module files.
You need to configure EasyBuild to do so, using the ``---filter-env-vars`` configuration option.

For example::

  eb --rpath --filter-env-vars=LD_LIBRARY_PATH example.eb

To consistently configure EasyBuild to both use RPATH and not include ``$LD_LIBRARY_PATH`` update statements in generated
module files, you can use either environment variables or a configuration file; see :ref:`configuring_easybuild`.
