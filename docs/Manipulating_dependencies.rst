.. _manipulating_dependencies:

Manipulating dependencies
=========================

A couple of different ways are available to manipulate the list of dependencies that are specified for the software
packages being installed.

.. contents::
    :depth: 3
    :backlinks: none

.. _filter_deps:

Filtering out dependencies using ``--filter-deps``
--------------------------------------------------

To avoid that certain dependencies are being installed, a list of software names can be specified to ``--filter-deps``.
Any time a dependency with a name from this list is specified, it will be simply filtered out by EasyBuild, and
thus disregarded when resolving dependencies, loading modules for the dependencies in the build environment, and
including '``module load``' statements in the generated module files.

This can be useful when particular tools and libraries are already provided by OS packages (or in some other way),
and should not be reinstalled as modules by EasyBuild.

For example:

* overview of dependencies of HDF5::

    $ eb HDF5-1.8.13-intel-2015a.eb -D
     ...
     * [ ] $CFGS/i/intel/intel-2015a.eb (module: intel/2015a)
     * [ ] $CFGS/z/zlib/zlib-1.2.8-intel-2015a.eb (module: zlib/1.2.8-intel-2015a)   
     * [ ] $CFGS/s/Szip/Szip-2.1-intel-2015a.eb (module: Szip/2.1-intel-2015a)
     * [ ] $CFGS/h/HDF5/HDF5-1.8.13-intel-2015a.eb (module: HDF5/1.8.13-intel-2015a)

* overview of dependencies of HDF5, with zlib and Szip excluded::

    $ eb HDF5-1.8.13-intel-2015a.eb --filter-deps=zlib,Szip -D 
     ... 
     * [ ] $CFGS/i/intel/intel-2015a.eb (module: intel/2015a)
     * [ ] $CFGS/h/HDF5/HDF5-1.8.13-intel-2015a.eb (module: HDF5/1.8.13-intel-2015a)


.. _filter_deps_by_version

Filtering dependencies based on version
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since EasyBuild v3.8.0, filtering dependencies based on their version is also supported.

For each entry in ``--filter-deps``, the expected format is either:

* ``<name>``: a software name without any version specification, to indicate that this dependency
  should *always* be filtered out (regardless of its version)

  * examples: ``X11``, ``zlib``

* ``<name>=<version>``: a software name and version, to indicate that a *particular version* of this dependency
  should be filtered out

  * examples: ``zlib=1.2.8``, ``ncurses=5.9``

* ``<name>=<lower_limit>:<upper_limit>``: a software name and a version range, to indicate that any version
  of this dependency that falls *within the specified range* should be filtered out

When a version range is specified, a lower limit and/or upper limit *can* be specified (separated by ``:``).
In other words, the version range can be open ended. The ``:`` separator is strictly required.

For both limits, you *must* indicate whether it is either:

* *inclusive*, by using ``[`` for the lower limit, and ``]`` for the upper limit
* *exclusive*, by using ``]`` for the lower limit, and ``[`` for the upper limit

Examples:

* to filter out ``zlib`` version ``1.2`` up until ``1.2.99`` (incl.), use: ``zlib=[1.2:1.2.99]``

* to filter out ``ncurses`` version 5.0 or newer, use: ``ncurses=[5.0:``

* to filter out any version of ``CMake`` that is older than ``4.0``, use: ``CMake=:4.0[``


.. _hide_deps:

Installing dependencies as hidden modules using ``--hide-deps``
---------------------------------------------------------------

Selected software packages can be marked to be installed as hidden modules (i.e., modules that are not visible via
'``module avail``', but can be loaded) whenever they are included as a dependency, via the ``--hide-deps``
configuration option.

For example (note the preceding '``.``' in the last part of the module names for zlib and Szip)::

 $ eb HDF5-1.8.13-intel-2015a.eb --hide-deps=zlib,Szip -D
  ...
  * [ ] $CFGS/i/intel/intel-2015a.eb (module: intel/2015a)
  * [ ] $CFGS/z/zlib/zlib-1.2.8-intel-2015a.eb (module: zlib/.1.2.8-intel-2015a)
  * [ ] $CFGS/s/Szip/Szip-2.1-intel-2015a.eb (module: Szip/.2.1-intel-2015a)
  * [ ] $CFGS/h/HDF5/HDF5-1.8.13-intel-2015a.eb (module: HDF5/1.8.13-intel-2015a)


.. note::
  Using Lmod (version >= 5.7.5), hidden modules can be made visible in the output of '``module avail``' using the
  ``--show-hidden`` option.

  For example::

   $ module avail bzip2

   Use "module spider" to find all possible modules.
   Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".

   $ module --show-hidden avail bzip2
   ----- /home/example/.local/easybuild/modules/all -----
   bzip2/.1.0.6

   Use "module spider" to find all possible modules.
   Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".


.. _minimal_toolchains:

Using minimal toolchains for dependencies
-----------------------------------------

By default, EasyBuild will try to resolve dependencies using the same toolchain as the one that is used for the
software being installed, unless a specific toolchain is specified for the dependency itself
(see :ref:`dependency_specs`).

Using the ``--minimal-toolchains`` configuration option, you can instruct EasyBuild to consider subtoolchains
for dependencies in the reverse order (from the bottom of the toolchain hierarchy to the top). This can be useful to
refrain from having to frequently hardcode specific toolchains in order to avoid having the same dependency version
installed with multiple toolchains that are compatible with each other. Although hardcoding the toolchain for
dependencies will work fine, it severely limits the power of other EasyBuild features, like ``--try-toolchain`` for
example.

When instructed to use minimal toolchains, EasyBuild will check whether an easyconfig file is available (in the robot
search path, see :ref:`robot_search_path`) for that dependency using the different subtoolchains of the toolchain
specified for the 'parent' software. Subtoolchains are considered 'bottom-up', i.e. starting with the most minimal
subtoolchain (typically a compiler-only toolchain), and then climbing up towards the toolchain that is specified for
the software being installed.

Note that if a specific toolchain is specified for a particular dependency, EasyBuild will stick to using it, even
when instructed to use minimal toolchains. Also note that as of v3.0, if no easyconfig exists to resolve a dependency
using the default toolchain EasyBuild will search for the dependency using a compatible subtoolchain (the
difference being that the search order is from the top of the toolchain hierarchy to the bottom).

.. _minimal_toolchains_dummy:

Considering ``dummy`` as minimal toolchain
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The :ref:`dummy_toolchain` is only considered as the most minimal subtoolchain if the
``--add-dummy-to-minimal-toolchains`` configuration option is enabled.
By default, this configuration option is *disabled*.

.. _minimal_toolchains_existing_modules:

Taking existing modules into account
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can instruct EasyBuild to take existing modules into account when determining which subtoolchain should be used
for each of the dependencies, using the ``--use-existing-modules`` configuration option.

By default existing modules are ignored, meaning that the EasyBuild dependency resolution mechanism will pick a
minimal toolchain for each dependency solely based on the available easyconfig files (if the ``--minimal-toolchains``
configuration option is enabled, that is).

With ``--use-existing-modules`` enabled, EasyBuild will first check whether modules exist for the dependencies that were
built with the toolchain or any of the subtoolchains (searching top-down). If so, the toolchain of the first encountered
existing module will determine the toolchain being selected. If not, the toolchain to use will be determined based on the
available easyconfig files.

.. _minimal_toolchains_example:

Example
~~~~~~~

Consider the following (partial) easyconfig file for Python v2.7.9 with the ``foss/2015b`` toolchain::

    name = 'Python'
    version = '2.7.9'

    toolchain = {'name': 'foss', 'version': '2015b'}

    dependencies = [
        ('zlib', '1.2.8'),
    ]

When the ``--minimal-toolchains`` configuration option is enabled, EasyBuild will also consider the subtoolchains
``GCC/4.9.3`` and ``gompi/2015b`` of the ``foss/2015b`` toolchain (in that order) as potential minimal toolchains
when determining the toolchain to use for dependencies.

So, for the zlib v1.2.8 dependency included in the example above, the following scenarios are possible:

* without the use of ``--minimal-toolchains``, the default behaviour of EasyBuild is to first consider the
  ``foss/2015b`` toolchain for zlib v1.2.8, if no such easyconfig file is found, it will continue searching using the
  ``gompi/2015b`` toolchain, and finally the ``GCC/4.9.3`` toolchain
* if (only) ``--minimal-toolchains`` is enabled, EasyBuild will search for an easyconfig file for
  zlib v1.2.8 using the ``GCC/4.9.3`` toolchain; if no such easyconfig file is found, it will continue searching
  using the ``gompi/2015b`` toolchain, and finally the ``foss/2015b`` toolchain
* if ``--add-dummy-to-minimal-toolchains`` is also enabled, EasyBuild will try locating an easyconfig file for
  zlib v1.2.8 that uses the ``dummy`` toolchain prior to consider the ``GCC/4.9.3`` toolchain
* additionally, with ``--use-existing-modules`` enabled, EasyBuild will first check whether a ``zlib`` module for
  version 1.2.8 built with the (sub)toolchains being considered exists; if not, it will search for an easyconfig file
  for zlib as outlined above
