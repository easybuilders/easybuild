.. _wrapping_dependencies:

Wrapping dependencies
=====================

Since EasyBuild v3.7.0 a special-purpose generic easyblock named ``ModuleRC`` is available,
which can be used to generate a (software-specific) ``.modulerc`` file
(as opposed to generating an actual module file).

.. note:: For compatibility with the different modules tools supported by EasyBuild (see :ref:`modules_tool`),
          the ``.modulerc`` file is always generated in Tcl syntax (for now), regardless of the module syntax
          that is used for module files. Only Lmod 7.8 (or later) supports ``.modulerc.lua`` files
          in Lua syntax.

The ``ModuleRC`` easyblock supports including ``module-version`` in the generated ``.modulerc`` file,
which defines a so-called *"symbolic version"*.

This can be used to install a *"wrapper"* for a particular module, which can be useful in the context
of dependencies. For example, it can be used to avoid depending on a specific version of
a particular software package by specifying the dependency only on the ``<major>.<minor>`` version instead
(i.e., without including the "subminor" version, which usually corresponds to a bugfix release).

One particular example where this is employed is for ``Java``. Since the ``2018b`` generation of
the :ref:`common_toolchains`, we use a wrapper for ``Java`` (e.g., ``Java/1.8``), rather than
depending on a specific version (e.g., ``Java/1.8.0_181``):

.. code::

  # specify dependency on Java/1.8 "wrapper", rather than a specific Java version
  dependencies = [('Java', '1.8', '', SYSTEM)]

This has a couple of advantages:

* it helps with avoiding version conflicts on the ``Java`` dependency used by two (or more) otherwise independent
  module files;

* it allows to perform an in-place update of the ``Java`` wrapper to a more recent ``Java`` (bugfix) release
  in the blink of an eye, since it only involves re-generating a ``.modulerc`` file (as opposed to performing
  actual installation and generating a module file); in addition, it doesn't require updating/re-generating existing
  module files that depend on the ``Java`` wrapper (since the version of the wrapper does not change)

Since ``ModuleRC`` is a generic easyblock , it can also be employed to install module "wrappers" for dependencies
other than ``Java``.
