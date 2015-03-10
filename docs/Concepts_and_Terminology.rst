.. _concepts_and_terminology:

Concepts and terminology
========================


EasyBuild consists of a collection of Python modules and packages that interact with each other,
dynamically picking up additional Python modules as needed for building and installing
a (stack of) software package(s) specified via simple specification files.

Or, in EasyBuild terminology: the `EasyBuild framework`_ leverages `easyblocks`_ to automatically
build and install software using particular compiler `toolchains`_, as specified by one or multiple `easyconfig files`_.


EasyBuild framework
-------------------

The EasyBuild **framework** embodies the core of the tool, providing functionality commonly
needed when installing scientific software on HPC systems. For example, it deals with downloading,
unpacking and patching of sources, loading module files for dependencies,
setting up the build environment, autonomously running (interactive) shell commands,
creating module files that match the specification files, etc.

Included in the framework is an `abstract` implementation of a software build and install procedure,
which is split up into different `steps`:

* unpacking sources
* configuration
* build
* installation
* module generation
* etc.

Most of these steps, i.e., the ones which are generally more-or-less
analogous across different software packages, have appropriate (default) implementations.
The only exceptions are the configuration, build and installation steps that are purposely
left unimplemented (since there is no common procedure for them).

Each of the steps can be
tweaked and steered via different parameters known to the framework, for which values are
either obtained from the provided specification files or set to reasonable default values.
See :ref:`easyconfig_files`.

.. XXX - UPDATE BY VERSION

In EasyBuild version |version| the framework source code consists of about 19000 lines of code,
organized across about 125 Python modules in roughly a dozen Python package directories,
next to almost 7000 lines of code for tests. This provides some notion of the size of the
EasyBuild framework and the amount of supporting functionality it has to offer.


.. _Easyblocks:

Easyblocks
----------

The implementation of a particular software build and install procedure is done in a Python module,
which is aptly referred to as an **easyblock**.

Each easyblock ties in with the framework API
by defining (or extending/replacing) one or more of the step functions that are part
of the abstract procedure used by the EasyBuild framework. Easyblocks typically heavily
rely on the supporting functionality provided by the framework, for example for
(autonomously) executing (interactive) shell commands and obtaining the command's output and exit code.

A distinction is made between **software-specific** and **generic** easyblocks. Software-specific
easyblocks implement a build and install procedure which is entirely custom to one particular
software package (e.g., WRF), while generic easyblocks implement a procedure using standard
tools (e.g., CMake). Since easyblocks are implemented in an object-oriented scheme, the step
methods implemented by a particular easyblock can be reused in others via inheritance,
enabling code reuse across build procedure implementations.

For each software package being built, the EasyBuild framework will determine which easyblock
should be used, based on the name of the software package or the value of the easyblock
specification parameter. In case an easyblock specification is not provided and no (software-specific)
easyblock matching the software name could be found, a fallback mechanism will resort to using
the generic ``ConfigureMake`` easyblock, which implements the common ``configure`` / ``make`` / ``make install`` procedure.

.. XXX - UPDATE BY VERSION

The most recent release of EasyBuild (version |version|) includes 139 software-specific easyblocks and 20 generic
easyblocks (see also :ref:`basic_usage_easyblocks`), providing support for automatically installing a wide range
of software packages. Examples range from fairly easy-to-build programs like gzip, other basic tools
like compilers, various MPI stacks and commonly used libraries, primarily for x86_64 architecture systems,
to large scientific software packages that are notorious for their involved and tedious install procedures, such as:
`CP2K`, `NWChem`, `OpenFOAM`, `QuantumESPRESSO`, `WRF`.


Toolchains
----------

EasyBuild employs so-called **compiler toolchains** or, simply `toolchains` for short,
which are a major concept in handling the build and installation processes.

A typical toolchain consists of one or more compilers, usually put together with some libraries for specific functionality,
e.g., for using an MPI stack for distributed computing, or which provide optimized routines for commonly
used math operations, e.g., the well-known BLAS/LAPACK APIs for linear algebra routines.

For each software package being built, the toolchain to be used must be specified in some way.

The EasyBuild framework prepares the `build environment` for the different toolchain components,
by loading their respective modules and defining environment variables to specify compiler commands
(e.g., via ``$F90``), compiler and linker options (e.g., via ``$CFLAGS`` and ``$LDFLAGS``), the list
of library names to supply to the linker (via ``$LIBS``), etc. This enables making easyblocks largely
`toolchain-agnostic` since they can simply rely on these environment variables; that is, unless they
need to be aware of, for example, the particular compiler being used to determine the build configuration options.

Recent releases of EasyBuild include out-of-the-box toolchain support for:

- various compilers, including GCC, Intel, Clang, CUDA
- common MPI libraries, such as Intel MPI, MPICH, MVAPICH2, OpenMPI
- various numerical libraries, including ATLAS, Intel MKL, OpenBLAS, ScalaPACK, FFTW

.. _dummy_toolchain:

``dummy`` toolchain
~~~~~~~~~~~~~~~~~~~

The ``dummy`` toolchain is a special case. It is an `empty` toolchain, i.e. a toolchain without any components,
and corresponds to using the readily available compilers and libraries (e.g., the ones provided by the OS, or
by modules which were loaded before issuing the ``eb`` command).

When the ``dummy`` toolchain is used, a corresponding ``dummy`` module file is not required/loaded and no build
environment is being defined.

When the toolchain version is also specified as ``dummy``, no (build) dependencies will be loaded when the build
is performed. If the toolchain version is specified as an empty string, the listed dependencies will be loaded (as
is done with other toolchains).

.. _easyconfig_files:

Easyconfig files
----------------

The specification files that are supplied to EasyBuild are referred to as **easyconfig files**
(or simply `easyconfigs`), which are basically plain text files containing (mostly)
key-value assignments for build parameters supported by the framework, also referred
to as **easyconfig parameters** (see :doc:`Writing_easyconfig_files` for more information).

Note that easyconfig files only provide the bits of information required
to determine the corresponding module name; the module name itself is computed by EasyBuild
framework by querying the module naming scheme being used. The complete
list of supported easyconfig parameters can be easily obtained via the EasyBuild command line using
``eb -a`` (see also :ref:`avail_easyconfig_params`).

As such, each easyconfig file provides a complete specification of which particular software
package should be installed, and which settings should be used for building it. After completing
an installation, EasyBuild copies the used easyconfig file to the install directory, as a template,
and also supports maintaining an easyconfig archive which is updated on every successful installation.
Therefore, reproducing installations becomes trivial.

.. XXX - UPDATE BY VERSION

EasyBuild version |version| includes support for over 511 different software packages,
spread over 2800 easyconfig files describing distinct builds.
