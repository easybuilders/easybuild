.. _writing_easyconfig_files:

Writing easyconfig files: the basics
====================================

This page explains all the basic information about how to write easyconfig files.

For software builds that follow established build patterns, an easyconfig is all that you need to create in order to
build and install the software and the corresponding module file.

Luckily, the majority of software delivery mechanisms are being designed around
either autotools or CMake or, perhaps, some simple file extraction/copy pattern.
Yet, in case the software build calls for more elaborate steps
(scientific software never fails to surprise us in this regard),
an :ref:`easyblock <easyblocks>` may be needed, which is the subject of other part of this documentation.

.. _what_is_an_easyconfig:

What is an easyconfig (file)?
-----------------------------

An easyconfig file serves as a `build specification` for EasyBuild.

It consists of a plain text file (in Python syntax) with mostly `key-value` assignment to define **easyconfig parameters**.

Easyconfigs typically follow a (fixed) strict naming scheme, i.e.  ``<name>-<version>[-<toolchain>][<versionsuffix>].eb``.

The ``-<toolchain>`` label (which includes the toolchain name and version) is omitted when a :ref:`dummy_toolchain` is used.
The ``<versionsuffix>`` label is omitted when the version suffix is empty.

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

See :ref:`avail_easyconfig_params` for more details.

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
* **homepage, description**: metadata (used for module help)
* **toolchain**: specifies name and version of compiler toolchain to use

  * format: dictionary with name/version keys, e.g., ``{'name': 'foo', 'version': '1.2.3'}``
  * a list of supported toolchains can be found :ref:`here <vsd_list_toolchains>`

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

.. _common_easyconfig_param_sources:

Source files, patches and checksums
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **sources**: list of source files (filenames only)
* **source urls**: list of URLs where sources can be downloaded
* **patches**: list of patch files to be applied (``.patch`` extension)
* **checksums**: list of checksums for source and patch files

Remarks:

* sources are downloaded (best effort), unless already available
* proxy settings are taken into account, since the `urllib2 Python package <https://docs.python.org/2/library/urllib2.html>`_
  is used for downloading (since EasyBuild v2.0)
* patches need to be EasyBuild-compatible

  * unified diff format (``diff -ru``)
  * patched locations relative to unpacked sources

* see :ref:`common_easyconfig_param_sources_checksums` for more information on ``checksums``
* ``sources`` is usually specified as a list of strings representing filenames for source files,
  but other formats are supported too, see :ref:`common_easyconfig_param_sources_alt`

Example:

.. code:: python

  name = 'HPL'
  version = '2.2'

  [...]

  source_urls = ['http://www.netlib.org/benchmark/hpl']
  sources = ['hpl-%(version)s.tar.gz']

  # fix Make dependencies, so parallel build also works
  patches = ['HPL_parallel-make.patch']

  checksums = ['ac7534163a09e21a5fa763e4e16dfc119bc84043f6e6a807aba666518f8df440']

  [...]

.. note:: Rather than hardcoding the version (and name) in the list of sources,
  a string template `%(version)s` can be used, see also :ref:`easyconfig_param_templates`.

.. _common_easyconfig_param_sources_checksums:

Checksums
^^^^^^^^^

Checksums for source files and patches can be provided via the ``checksums`` easyconfig parameter.

EasyBuild does not enforce checksums to be available for all source files and patches.
Provided checksums will be 'consumed' first for the specified sources (in order), and subsequently also for patches.

Nevertheless, providing checksums for *all* source files and patches is highly recommended.

If checksums are provided, the checksum of the corresponding source files and patches is verified to match.


The ``checksums`` easyconfig parameter is usually defined as a list of strings.

Until EasyBuild v3.3.0, only MD5 checksums could be provided through a list of strings.
Since EasyBuild v3.3.0, the checksum type is determined by looking at the length of the string:

* 32-character strings are considered to be MD5 checksums (``md5``)
* 64-character strings are considered to be SHA256 checksums (``sha256``)
* (other lengths will result in an error message)

Other checksum types are also supported: ``adler32``, ``crc32``, ``sha1``, ``sha512``, ``size`` (filesize in bytes).
To provide checksum values of a specific type, elements of the ``checksums`` list can also be 2-element tuples
of the form ``('<checksum value>', '<checksum type>')``.

The intention is to move towards making ``sha256`` the recommended and default checksum type.


.. _common_easyconfig_param_sources_alt:

Alternative formats for ``sources``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In some cases, it can be required to provide additional information next to the name of a source file,
e.g., a custom extraction command (because the one derived from the file extension is not correct),
or an altername filename that should be used to download the source file.

This can be specified using a Python dictionary value in the ``sources`` easyconfig parameter.

Since EasyBuild v3.3.0, three keys are supported:

* ``filename`` (*mandatory*): filename of source file
* ``download_filename``: filename that should be used when downloading this source file; the downloaded file will be
  saved using the ``filename`` value
* ``extract_cmd``: custom extraction command for this source file

For example:

.. code:: python

  sources = [{
    'filename': 'example-%(version)s.gz',
    'download_filename': 'example.gz',  # provided source tarball is not versioned...
    'extract_cmd': "tar xfvz %s",  # source file is actually a gzipped tarball (filename should be .tar.gz)
  }]

.. note:: Custom extraction commands can also be specified as a 2-element tuple, but this format has been deprecated
          in favor of the Python dictionary format described above; see also :ref:`depr_sources_2_element_tuple`.

.. _dependency_specs:

Dependencies
~~~~~~~~~~~~

* **dependencies**: build/runtime dependencies
* **builddependencies**: build-only dependencies (not in module)
* **hiddendependencies**: dependencies via hidden modules (see also :ref:`hide_deps`)
* **osdependencies**: system dependencies (package names)

Remarks:

* modules must exist for all (non-system) dependencies
* (non-system) dependencies can be resolved via ``--robot``
* format: ``(<name>, <version>[, <versionsuffix>[, <toolchain>]])``

Example:

.. code:: python

  name = 'GTI'
  ...
  toolchain = {'name': 'goolf', 'version': '1.5.14'}
  dependencies = [('PnMPI', '1.2.0')]
  builddependencies = [('CMake', '2.8.12', '', ('GCC', '4.8.2'))]

For each of the specified (build) dependencies, the corresponding module will be loaded in the build environment
defined by EasyBuild. For the *runtime* dependencies, ``module load`` statements will be included in the generated
module file.

.. note:: By default, EasyBuild will try to resolve dependencies using the same toolchain as specified for the
  software being installed.

  A different toolchain can be specified on a per-dependency level (cfr. the ``CMake`` build dependency in the
  example above).

  Alternatively, you can instruct EasyBuild to use the most minimal (sub)toolchain when resolving dependencies,
  see :ref:`minimal_toolchains`.

Loading of modules for dependencies with a ``dummy`` toolchain
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When a :ref:`dummy_toolchain` is used, EasyBuild will only load the modules for each of the (build)
dependencies when an *empty* string is used as a toolchain version, i.e. ::

  toolchain = {'name': 'dummy', 'version': ''}

When specifying a non-empty string as version for the :ref:`dummy_toolchain` (e.g., ``dummy``),
modules for the (build) dependencies will *not* be loaded in the build environment as defined by EasyBuild.
Load statements for the runtime dependencies will still be included in the generated module file, however.

Specifying dependencies using ``dummy`` toolchain
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To make EasyBuild resolve a dependency using the ``dummy`` toolchain, either specify '``dummy``' as toolchain name
in the tuple representing the dependency specification, or simply use ``True`` as 4th value in the tuple.

For example, to specify PnMPI version 1.2.0 built with the ``dummy`` toolchain as a (runtime) dependency::

  dependencies = [('PnMPI', '1.2.0', '', ('dummy', ''))]

which is equivalent to::

  dependencies = [('PnMPI', '1.2.0', '', True)]

Using external modules as dependencies
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Since EasyBuild v2.1, specifying modules that are not provided via EasyBuild as dependencies is also supported.
See :ref:`using_external_modules` for more information.

.. _configure_build_install_command_options:

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


.. _configure_build_install_command_options_iterate:

List of configure/build/install options
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In some cases, the *configure-build-install* cycle must be executed multiple times during a single installation,
using different options for one or more steps.

EasyBuild supports specifying a *list* of strings, each of which specifying a particular set of options to use.

For example, to perform the installation procedure with three different sets of configuration options:

.. code:: python

    configopts = [
        "--common-opt --one --one-more",
        "--common-opt --two",
        "--common-opt --three",
    ]

This way, EasyBuild will perform the *configure-build-install* cycle **three** times:

* configure using ``--common-opt --one --one-more``, build and install
* configure using ``--common-opt --two``, build and install on top of the existing installation
* configure using ``--common-opt --three``, build and install once more on top of what is installed already

During this process, the environment is reset and the build directory is cleaned up after each cycle,
while the installation directory is left untouched (in order to not destroy the result of earlier cycles).

If several ``(pre){config|build|install}opts`` parameters are defined as being a list of strings, the number of
items in the lists must be the same. Any of these parameters defined as a single string value are just reused
for each of the cycles performed. For example:

.. code:: python

    easyblock = 'ConfigureMake'
    configopts = ['--one', '--two', '--three']
    buildopts = 'lib'
    preinstallopts = ['TYPE=one', 'TYPE=two', 'TYPE=three']

would result in:

* ``./configure --prefix=... --one; make lib; TYPE=one make install``
* ``./configure --prefix=... --two; make lib; TYPE=two make install``
* ``./configure --prefix=... --three; make lib; TYPE=three make install``


An example use case of this is building FFTW with different precisions, see the
`FFTW easyconfig files <https://github.com/easybuilders/easybuild-easyconfigs/tree/master/easybuild/easyconfigs/f/FFTW>`_.

Sanity check
~~~~~~~~~~~~

Custom paths and commands to be used in the sanity check step can be specified using the respective parameters.
These are used to make sure that an installation didn't (partly) fail unnoticed.

* **sanity_check_paths**: files/directories that must get installed
* **sanity_check_commands**: (simple) commands that must work when the installed module is loaded

Remarks:

* format: Python dictionary with (`only`) ``files``/``dirs`` keys
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

.. _writing_easyconfigs_easyblock_spec:

Easyblock specification
~~~~~~~~~~~~~~~~~~~~~~~

To make EasyBuild use a specific (usually generic) easyblock the **easyblock** parameter can be used.

By default, EasyBuild will assume that the easyblock to use can be derived from the software name.
For example: for ``GCC``, EasyBuild will look for an easyblock class named ``EB_GCC`` in the Python module
``easybuild.easyblocks.gcc``.

A list of available easyblocks is available via ``--list-easyblocks`` (see also :ref:`list_easyblocks`);
generic easyblocks are the ones for which the name does *not* start with ``EB_``.

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

The category to which the software belongs to can be specified using the **moduleclass** easyconfig parameter.
By default, the ``base`` module class is used (which should be replaced with a more appropriate category).

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

* install WRF + its dozen dependencies with a different toolchain (!)::

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
  as expected (see also :ref:`tweaking_easyconfigs_using_try`).


Contributing easyconfigs
------------------------

**Contribute your working easyconfig files!**

Share your expertise with the community, avoid duplicate work, especially if:

* the software package is not supported yet
* an existing easyconfig needs (non-trivial) changes for a different version/toolchain
* it is a frequently used software package (compilers, MPI, etc.)

See :ref:`contributing` for more information.
