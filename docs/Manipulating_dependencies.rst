.. _manipulating_dependencies:

Manipulating dependencies
=========================

A couple of different ways are available to manipulate the list of dependencies that are specified for the software
packages being installed.

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
  Using Lmod (version >= 5.75), hidden modules can be made visible in the output of '``module avail`` using the
  ``--show-hidden`` option, for example::

   $ module avail bzip2

   Use "module spider" to find all possible modules.
   Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".

   $ module --show-hidden avail bzip2
   ----- /home/example/.local/easybuild/modules/all -----
   bzip2/.1.0.6

   Use "module spider" to find all possible modules.
   Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
