.. _controlling_compiler_optimization_flags:

Controlling compiler optimization flags
=======================================

This page provides an overview on the different ways in which compiler optimization flags used by EasyBuild
can be controlled.

.. contents::
    :depth: 3
    :backlinks: none

.. _controlling_compiler_optimization_flags_optarch:

Controlling target architecture specific optimizations via ``--optarch``
------------------------------------------------------------------------

.. _controlling_compiler_optimization_flags_optarch_default:

Default behaviour
~~~~~~~~~~~~~~~~~

By default, EasyBuild optimizes builds for the CPU architecture of the build host, by instructing the compiler to
generate instructions for the highest instruction set supported by the process architecture of the build host processor.

This is done by including specific compiler flags in ``$CFLAGS``, ``$CXXFLAGS``, ``$FFLAGS``, ``$F90FLAGS``, etc.

For example:

* for toolchains using the GCC compilers, ``--march=native`` will be used
  (see https://gcc.gnu.org/onlinedocs/gcc-4.9.0/gcc/i386-and-x86-64-Options.html)
* for toolchains using the Intel compilers, ``-xHost`` will be used
  (https://software.intel.com/en-us/node/522846)

.. _controlling_compiler_optimization_flags_optarch_caveats:

Caveats
~~~~~~~

.. _controlling_compiler_optimization_flags_optarch_caveats_heterogeneous:

Heterogeneous clusters
^^^^^^^^^^^^^^^^^^^^^^

Optimizing for the processor architecture of the build host is usually what you want in an HPC cluster,
but it has some implications if your cluster is heterogeneous (i.e., has different processor generations),
or if you want to execute your applications in a machine with a processor architecture that is different from
the one of the build host.

For example, if you compile your application optimized for an Intel Haswell processor (i.e. using AVX2 instructions),
it will not run on a system with an older Intel Nehalem processor.

One possible workaround for heterogeneous HPC clusters is to build as many copies of the software stack as you have
processor generations in your cluster, and to configure your system so each compute node uses the right software stack
matching its processor architecture type.
Details for one way of doing this, using automounter/autofs are available at http://hpcugent.github.io/easybuild/files/sciCORE-software-management_20150611.pdf .

Another solution is to configure EasyBuild to not optimize for the processor architecture of the build host via
``--optarch``, see below.

.. _controlling_compiler_optimization_flags_optarch_caveats_hardcoding:

Build environment vs hardcoding in build scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Be aware that that using ``--optarch`` as described below does not provide hard guarantees that the build
will be executed using the intended compiler flags.

EasyBuild will define the appropriate environment variables (``$CFLAGS`` and co) to use the compiler flags as
specified, but some MakeFiles or build systems could have hardcoded values that have not been dealt with yet
(for example, via a patch file or by specifying options to the ``make`` command).

For example, the OpenBLAS build system will autodetect the processor architecture in the build host,
and will optimize for that processor architecture by default.

If you want a generic OpenBLAS build you will need to tweak the OpenBLAS easyconfig file to define
the desired ``TARGET`` to use. For this you will need to modify the ``buildopts`` easyconfig parameter, for example::

    buildopts = 'TARGET=PRESCOTT BINARY=64 ' + threading + ' CC="$CC" FC="$F77"'

See these links for more details w.r.t. OpenBLAS:

* https://github.com/xianyi/OpenBLAS/blob/develop/TargetList.txt
* https://github.com/xianyi/OpenBLAS/issues/685

.. _controlling_compiler_optimization_flags_optarch_flags:

Specifying target architecture specific optimization flags to use via ``--optarch=<flags>``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using the ``--optarch`` EasyBuild configuration option, specific compiler flags can be provided that EasyBuild
should use, rather than the ones used by default (depending on the compiler in the toolchain being used).

Like any other configuration setting, this can also be specified via ``$EASYBUILD_OPTARCH``, or by defining ``optarch``
in an EasyBuild configuration file (cfr. :ref:`configuration_consistency`).

For example, by specifying ``--optarch=march=core2``, EasyBuild will use ``-march=core2`` rather than the default
flag ``--march=native`` (when using GCC compilers).

Likewise, to avoid using the default ``-xHost`` flag with the Intel compilers and using ``-xSSSE3`` instead,
you can define ``$EASYBUILD_OPTARCH`` to be equal to ``xSSSE3``.

.. note::

  The first dash (``-``) is added automagically to the value specified to ``--optarch``,
  because of technicalities with the current implementation.

The ``--optarch`` configuration option gives you flexibility to define the specific target architecture optimization
flags you want, but requires that you take care of specifying different flags for different compilers and choose
the right flags depending on your specific processor architecture.


.. _controlling_compiler_optimization_flags_optarch_generic:

Optimizing for a generic processor architecture via ``--optarch=GENERIC``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To make EasyBuild optimize for a *generic* processor architecture, ``--optarch`` can be set to '``GENERIC``'.

When this is the case, EasyBuild will use the right compiler flags to optimize for a generic processor
architecture, i.e. avoid using machine instructions that are only supported by very recent processors.

The ``GENERIC`` keyword for ``--optarch`` is recognized since EasyBuild v2.5.0, and is supported for GCC and Intel
compilers on x86-64 systems (Intel or AMD).
For other compilers that can be used in toolchains and other system architectures,
the necessary compiler flags will be defined in later EasyBuild versions.

Currently, using ``--optarch=GENERIC`` will result in the following target architecture optimization flags being used,
(on a Linux x86-64 system):

* for toolchains using GCC compilers: ``-march=x86-64 -mtune=generic``
* for toolchains using Intel compilers: ``-xSSE2``

On other systems or for other compilers, you can check which compiler flags will be used via :ref:`extended_dry_run`.


.. _controlling_compiler_optimization_flags_optarch_per_compiler:

Setting architecture flags for different compilers via ``--optarch=<compiler:flags>;<compiler:flags>``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Starting with version 3.1.0, EasyBuild supports specifying architecture flags on a per-compiler basis. This enables to
"set and forget" the ``--optarch`` option for your compilers of interest, as opposed to change it depending on the
compiler used on the packages to be installed.

The syntax is ``<compiler:flags>;<compiler:flags>``, where ``:`` separates the compiler name from the compiler flags,
and ``;`` separates different compilers. This is an example for the Intel and GCC compilers:
``--optarch='Intel:xHost;GCC:march=x86-64 -mtune=generic'``. As in the simple cases, EasyBuild adds one ``-`` to the
flags specified, so the flags passed to the Intel and GCC compilers in this case are ``-xHost`` and
``-march=x86-64 -mtune=generic``. Please note the quotes to escape the space in the GCC flags.

Additionally, ``GENERIC`` is also supported on a compiler basis, allowing to specify a generic compilation for the
desired compilers. This is an example of this usage: ``--optarch=Intel:xHost;GCC:GENERIC``. Of course, this is
supported just for compiler toolchains that recognize ``GENERIC``.

The options for each compiler are set independently. That means that if a GCC-based toolchain is used, but the only
compiler specified is ``Intel`` (for example with ``--optarch=Intel:xCORE-AVX2``), then EasyBuild will behave as if
``--optarch`` was not specified for this toolchain.

The compiler name corresponds to the value of the ``COMPILER_FAMILY`` constant of the toolchain. Two common examples
are ``GCC`` and ``Intel``.

Due to the special treatment of ``--optarch`` in Cray environments, this feature is not supported on this platform.
