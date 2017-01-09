.. _common_toolchains:

Common toolchains
=================

This page documents the concept of *common toolchains* in the EasyBuild community;
for a more general definition of what (compiler) toolchains are, see :ref:`toolchains`.

.. contents::
    :depth: 3
    :backlinks: none


.. _common_toolchains_what:

Definition and motivation
-------------------------

Picking a :ref:`compiler toolchain <toolchains>` to use is one of the first things you (need to) do when starting to use EasyBuild.
This can be a daunting task, since a whole bunch of toolchains and different toolchain versions
are readily available in EasyBuild. It may be difficult to determine which toolchain would be most rewarding to use,
in terms of stability, performance of the resulting binaries and readily available easyconfig files.

In an attempt to focus the effort of the EasyBuild community,
the concept of so-called *common toolchains* was introduced.

The idea is to compose and maintain a limited set of specific compiler toolchains,
and try and convince many HPC sites to employ these toolchains.
This helps in assuring stability of these toolchains w.r.t. which software can be built (correctly) with them,
since they get significantly more testing. In addition, the expectation/hope is that more easyconfigs are
contributed back to the central easyconfigs repository (https://github.com/hpcugent/easybuild-easyconfigs),
resulting in a wide range of readily available easyconfig files using the common toolchains.

The intention is to revise/update the definitions of the common toolchains regularly
(see :ref:`common_toolchains_update_cycle`), which again can be a joint effort
that benefits many HPC sites.

Currently, two different common toolchains are being maintained: ``foss`` and ``intel``;
see below for more details, and also :ref:`common_toolchains_overview`.


.. _common_toolchains_foss:

``foss`` toolchain
~~~~~~~~~~~~~~~~~~

The ``foss`` common compiler toolchain consists entirely of open source software (hence the name,
derived from the common term 'FOSS', which is short for "Free and Open Source Software").

This toolchain consists of:

* binutils (https://www.gnu.org/software/binutils/)

* the GNU Compiler Collection (GCC, https://gcc.gnu.org/),
  i.e. ``gcc`` (C), ``g++`` (C++) and ``gofrtran`` (Fortran)

* the Open MPI library (https://www.open-mpi.org/)

* the OpenBLAS (http://www.openblas.net/) + LAPACK (http://netlib.org/lapack) libraries

  * the ScaLAPACK (http://netlib.org/scalapack) library is also included

* the FFTW library (http://fftw.org/)

.. note:: The toolchain name was deliberately chosen to be generic, to allow for swapping
          any of the toolchain components with a better (open source) alternative in the future,
          should the need or opportunity arise.


.. _common_toolchains_intel:

``intel`` common toolchain
~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``intel`` common compiler toolchain consists of the Intel compilers and libraries, i.e.:

* the Intel C/C++/Fortran compilers (https://software.intel.com/en-us/intel-compilers),
  i.e. ``icc``, ``icpc`` and ``ifort``,

  * binutils and GCC, which serve as a base for the Intel compilers, are also included

* the Intel MPI library (https://software.intel.com/en-us/intel-mpi-library)

* the Intel Math Kernel Library (MKL, https://software.intel.com/en-us/intel-mkl) for BLAS/LAPACK/FFT functionality

.. note:: This compiler toolchain includes licensed software;
          valid licenses must be available to install and use it.


.. _common_toolchains_versioning_scheme:

Versioning scheme for common toolchains
---------------------------------------

The common toolchain follow a specific versioning scheme, which takes the
:ref:`6-month update cycle <common_toolchains_update_cycle>` into account.

Each revision of the common toolchains is versioned as the *year* in which it
was defined, plus an additional '`a`' or '`b`' to indicate whether the toolchain
was defined at the start of the year ('`a`') or halfway through the year ('`b`');
in short, the common toolchains are versioned as ``<year>{a,b}``.

For example, ``foss/2016b`` is a revision of the ``foss`` that was composed mid-2016.

A full historic overview of the ``foss`` and ``intel`` common toolchains is
available in :ref:`common_toolchains_overview`.

.. note:: Next to the versions that follow the ``<year>{a,b}`` versioning scheme,
          additional versions of the ``foss`` and ``intel`` versions are available
          as well.

          These are **not** considered to be part of the series of common
          toolchains (even though they consists of the same toolchain components).
          These versions may be site-specific, or compositions that were put in
          place to evaluate a potential future common toolchain.

          Typically, they are versioned as ``<year>.<month>``, indicating when
          the most recent component included was releases, or when that particular
          composition was defined.


.. _common_toolchains_update_cycle:

Update cycle for common toolchains
----------------------------------

.. _common_toolchains_overview:

Overview of common toolchains
-----------------------------

.. _common_toolchains_customizing:

Customizing common toolchains
-----------------------------
