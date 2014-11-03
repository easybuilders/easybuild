
Writing easyconfig files: the basics
====================================

This page explains all the basic information about how to write easyconfig files.

For software builds that not deviate significantly from established build patterns,
an easyconfig is all that you need to specify in order to derive a build and a module file.

Luckily, the majority of software delivery mechanisms are being designed around
either autotools or CMake or, perhaps, some simple file extraction/copy pattern.
Yet, in case the software build calls for more elaborate steps
(scientific software never fails to surprise us in this regard),
an :ref:`easyblocks` may be needed, which is the subject of other part of this documentation.

What is an easyconfig (file)?
-----------------------------

An easyconfig file serves as a `build specification` for EasyBuild.

It consists of a plain text file (in Python syntax; strings, lists, dictionaries, etc.) with mostly `key-value` assignment to define **easyconfig parameters**.

Easyconfigs typically follow a (fixed) strict naming scheme, i.e.  ``<name>-<version>[-<toolchain>][-<versionsuffix>].eb``.

The toolchain label (which includes the toolchain name and version) is omitted when a ``dummy`` toolchain is used; the version suffix is omitted when it's empty.

.. note:: the filename of an easyconfig is only important w.r.t. dependency resolution (``--robot``), see :ref:`use_robot`.

Example:

.. code:: python

  # easyconfig file for GCC v4.8.3
  name = 'GCC'
  version = '4.8.3'
  ...

.. tip:: Comments can be included in easyconfig files using the hash (``#``) character (just like in Python code).

Available easyconfig parameters
-------------------------------

.. XXX UPDATE BY VERSION

About 50 different (generic) easyconfig parameters are supported currently.

An overview of all available easyconfig parameters is available via the ``-a`` command line option.
By default, the parameters specific to generic (default) easyblock ``ConfigureMake`` are included;
using ``--easyblock``/``-e`` parameters that are specific to a particular easyblock can be consulted.
See :ref:`_avail_easyconfig_params` for more details.

Example::

 $ eb -a -e Binary
 Available easyconfig parameters (* indicates specific for the Binary EasyBlock)
 MANDATORY
 ---------
 [..]
 name:           Name of software (default: None)
 [...]
 EASYBLOCK-SPECIFIC
 ------------------
 install_cmd(*):     Install command to be used. (default: None)
 [...]

Mandatory easyconfig parameters
-------------------------------

A handful of easyconfig parameters are `mandatory`:

* **name, version**: specify what software (version) to build
* **homepage**, description: metadata (used for module help)
* **toolchain**: specifies name and version of compiler toolchain to use
   * format: dictionary with name/version keys, e.g. ``{'name': 'foo', 'version': '1.2.3'}``

Remarks:

* some others are planned to be required in the future
   * `docurls, software license, software license urls`

Example:

.. code:: python

  name = 'HPL'
  version = '2.0'

  homepage = 'http://www.netlib.org/benchmark/hpl/'
  description = "High Performance Computing Linpack Benchmark"

  toolchain = {'name': 'goolf', 'version': '1.4.10'}
  [...]

Common easyconfig parameters
----------------------------

This section includes an overview of some commonly used (optional) easyconfig parameters.

Source files and patches
~~~~~~~~~~~~~~~~~~~~~~~~

* **sources**: list of source files (filenames only)
* **source urls**: list of URLs where sources can be downloaded
* **patches**: list of patch files to be applied (``.patch`` extension)

Remarks:

* sources are downloaded (best effort), unless already available
* patches need to be EasyBuild-compatible
   * unified diff format (``diff -ru``)
   * patched locations relative to unpacked sources

Example:

.. code:: python

  name = 'HPL'
  [...]
  source_urls = ['http://www.netlib.org/benchmark/hpl']
  sources = ['hpl-2.0.tar.gz']

  # fix Make dependencies, so parallel build also works
  patches = ['HPL_parallel-make.patch']

.. note:: Rather than hardcoding the version (and name) in the list of sources, a string template `%(version)s` can be used, see also :ref:`easyconfig_param_templates`.

Dependencies
~~~~~~~~~~~~

* **dependencies**: build/runtime dependencies
* **builddependencies**: build-only dependencies (not in module)
* **hiddendependencies**: dependencies via hidden modules
* **osdependencies**: system dependencies (package names)

Remarks:

* modules must exist for all (non-system) dependencies
* (non-system) dependencies can be resolved via ``--robot``
* format: (``<name>, <version>[, <versionsuffix>[, <toolchain>]]``)

Example:

.. code:: python

  name = 'GTI'
  ...
  toolchain = {'name': 'goolf', 'version': '1.5.14'}
  dependencies = [('PnMPI', '1.2.0')]
  builddependencies = [('CMake', '2.8.12', '', ('GCC', '4.8.2')]

.. note:: By default, EasyBuild will try to resolve dependencies using the same toolchain as specified for the software being installed.
  Exceptions can be specified on a per-dependency level (cfr. the ``CMake`` build dependency in the example).

Configure/build/install command options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **configopts**: options for configure command
* **preconfigopts**: options used as prefix for configure command

In analogy to `configure`, also `build` and `install` commands are tuneable:

* **buildopts, prebuildopts**: options for build command
* **installopts, preinstallopts**: options for install command

Example:

.. code:: python

    easyblock = 'ConfigureMake'
    ...
    # configure with: ./autogen.sh && ./configure CC="$CC" CFLAGS="$CFLAGS"
    preconfigopts = "./autogen.sh && "
    buildopts = 'CC="$CC" CFLAGS="$CFLAGS"'
    # install with: make install PREFIX=<installation prefix>
    installopts = 'PREFIX=%(installdir)s'

.. note:: For more details w.r.t. use of string templates like ``%(installdir)s``, see :ref:`easyconfig_param_templates`.

Sanity check
~~~~~~~~~~~~

Custom paths and commands to be used in the sanity check step can be specified using the respective parameters.
These are used to make sure that an installation didn't (partly) fail unnoticed.

* **sanity_check_paths**: files/directories that must get installed
* **sanity_check_commands**: (simple) commands that must work when the installed module is loaded

Remarks:

* format: Python dictionary with (`only`) ``files`/``dirs`` keys
* values must be lists of (tuples of) strings, one of both **must** be non-empty
   * paths are `relative` to installation directory
   * for a path specified as a tuple, only one of the specified paths must be available
* default values:
   * paths: non-empty ``bin`` and ``lib`` or ``lib64`` directories
   * commands: none

Example:

.. code:: python

  sanity_check_paths = {
    'files': ["bin/xhpl"],
    'dirs': [],
  }

Easyblock specification
~~~~~~~~~~~~~~~~~~~~~~~

By default, EasyBuild will derive the easyblock to use based on the software name: if a matching easyblock is found, it will use that;
if not, it will fall back to the generic ``ConfigureMake`` easyblock.

To make EasyBuild use a specific (usually generic) easyblock rather than deriving it from the software name, the ``easyblock`` parameter can be used.

A list of available easyblocks is available via ``--list-easyblocks``; generic easyblocks are the ones for which the name does `not` start with ``EB_``.

Example:

.. code:: python

    easyblock = 'CMakeMake'
    name = 'GTI'
    version = '1.2.0'
    ...

.. tip::
  It is highly recommended to use existing (generic) easyblocks, where applicable.
  This avoids the need for creating (and maintaining) new easyblocks.
  Typically, generic easyblocks support several custom easyconfig parameters which allow to steer
  their behavior (see also :ref:`avail_easyconfig_params`).

Example:
.. code:: python

  easyblock = 'Binary'
  [...]
  install_cmd = "./install.bin"
  [...]


Module class
~~~~~~~~~~~~

The category to which the software belongs to can be specified using the ``moduleclass`` easyconfig parameter.
By default, the ``base`` module class is used.

EasyBuild enforces that only known module classes can be specified (to avoid misclassification due to typos).

The default list of module classes is available via ``--show-default-moduleclasses``;
additional module classes can be defined via the ``--moduleclasses`` configure option.

Example:

.. code:: python

    name = 'GCC'
    [...]
    moduleclass = 'compiler'

.. note:: By default, EasyBuild will create a symlink to the generated module file in a module class-specific path.
This behavior is configurable through the module naming scheme being used.

.. tip:: The module class may play a significant role in other aspects. For example, the alternative (hierarchical)
module naming scheme ``HierarchicalMNS`` heavily relies on the ``moduleclass`` parameter for discriminating compilers
and MPI libraries.

Tweaking existing easyconfig files
----------------------------------

The ability to modify easyconfig files on the fly with EasyBuild,
provides a very powerful and flexible feature to describe builds,
without having to manually create all the input files.

Tweaking existing easyconfigs can be done using the ``--try-*`` command lines options.
See :ref:`tweaking_easyconfigs_using_try` for more details.

Example:

* GCC version update::

   eb GCC-4.9.0.eb --try-software-version=4.9.1

* install WRF + its dozen dependencies with another toolchain (!)::

   eb WRF-3.5.1-ictce-5.3.0-dmpar.eb --try-toolchain=intel,2014b -r

.. _easyconfig_param_templates:

Dynamic values for easyconfig parameters
----------------------------------------

String templates are completed using the value of particular easyconfig parameters, typically ``name`` and/or ``version``.
These help to avoid hardcoding values in multiple locations.

A list of available string templates can be obtained using ``--avail-easyconfig-templates``.

Additionally, constants that can be used in easyconfig files are available via ``--avail-easyconfig-constants``.

Example:

.. code:: python

  name = 'GCC'
  version = '4.8.3'
  ...
  source_urls = [
    # http://ftpmirror.gnu.org/gcc/gcc-4.8.3
    'http://ftpmirror.gnu.org/%(namelower)s/%(namelower)s-%(version)s',
  ]
  sources = [SOURCELOWER_TAR_GZ]  # gcc-4.8.3.tar.gz
  ...

.. note:: Proper use of string templates is important, in particular to avoid hardcoding the software version
in multiple locations of an easyconfig file; this is critical to make ``--try-software-version`` behave
as expected (see also :ref:`tweaking_easyconfigs`).


Contributing back
-----------------

**Contribute back your working easyconfig files!**

Share your expertise with the community, avoid duplicate work, especially if:
   * the software package is not supported yet
   * an existing easyconfig needs (non-trivial) changes for a different version/toolchain
   * it is a frequently used software package (compilers, MPI, etc.)

Notes:

 * over 25% of easyconfigs are provided by contributors outside of HPC-UGent
 * contributing back does require a limited amount of knowledge on Git/GitHub
 * contributions are reviewed & thoroughly tested before inclusion
    * see https://github.com/hpcugent/easybuild/wiki/Contributing-back for a step-by-step walkthrough

