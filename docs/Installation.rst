.. _installation:

Installing EasyBuild
====================

EasyBuild is Python software, so there are a couple of ways to install it.

We recommend installing EasyBuild into a virtualenv, described at :ref:`virtualenv`.

It is also possible to install EasyBuild as a module. To do this,
use the 3-step procedure outlined at https://easybuilders.github.io/easybuild-tutorial/2021-lust/installation/#method-2-installing-easybuild-with-easybuild

Do take into account the required and optional dependencies (see :ref:`requirements` and :ref:`dependencies`).

Notes on other ways of installing EasyBuild are available under section :ref:`alt_inst_methods`.

.. contents::
    :depth: 3
    :backlinks: none

--------------

.. _requirements:

Requirements
------------

The only strict requirements are:

* a **GNU/Linux distribution** as operating system

* **Python**:

  * Python 2.7, or Python 3.x (>= 3.5)

  * **note**: only EasyBuild v4.0 (or newer) is compatible with Python 3, earlier EasyBuild releases require Python 2

  * no Python packages other than the ones included in the Python standard library are strictly required

    * **note**: only EasyBuild versions prior to v4.0 require ``vsc-base`` (& ``vsc-install``),
      see also :ref:`required_python_packages_eb3`

  * for some specific features, additional Python packages are needed though, see :ref:`optional_python_packages`

* a **modules tool**: Tcl(/C) environment modules or Lmod

  * the actual module command/script (``modulecmd``, ``modulecmd.tcl`` or ``lmod``) *must* be available via ``$PATH``
  * see :ref:`required_modules_tool` for more details

For more information on (optional) dependencies, see :ref:`dependencies`.

.. _virtualenv:

EasyBuild in a VirtualEnv
-----------------------

The easiest way to install EasyBuild is in a virtualenv::

  # Create a virtualenv
  python -m venv easybuild
  
  # Enter the virtualenv
  source easybuild/bin/activate
  
  # Install EasyBuild
  pip install easybuild

Then, when you wish to use EasyBuild again you need to do the ``source easybuild/bin/activate``.

The installation above will create the virtualenv in your current directory. You can instead specfiy an absolute path for the
location of the virtualenv.

To leave the virtualenv, use ``deactivate``.

Sanity check
~~~~~~~~~~~~

Compare the version of ``eb``, the main EasyBuild command, with the version of the EasyBuild module that was installed.
For example::

    $ module load EasyBuild
    $ module list

    Currently Loaded Modules:
      1) EasyBuild/1.16.1

    $ eb --version
    This is EasyBuild 1.16.1 (framework: 1.16.1, easyblocks: 1.16.1) on host example.local

.. tip::

  The Tcl-based or Lmod implementations of environment modules do their default sorting differently.
  The former will normally sort in the lexicographic order, while Lmod follows
  an approach that is closer to Python's construct ``LooseVersion`` way of ordering. Such aspects
  may make a big difference, if you have installed both versions 1.9.0 and 1.15.2,
  with respect to what is the version being loaded by default.

You can also run ``eb --show-config`` to see the default EasyBuild configuration. See the Configuring EasyBuild section
for more information :ref:`configuring_easybuild`


.. _updating:

Updating an existing EasyBuild installation
-------------------------------------------

To upgrade to a newer EasyBuild version (say, |version|) than the one currently installed:

* Activate your EasyBuild virtualenv

* ``pip install --upgrade easybuild`` will upgrade EasyBuild to the latest release.

.. _dependencies:

Dependencies
------------

EasyBuild has a couple of dependencies, some are optional.

.. _required_dependencies:

Required dependencies
~~~~~~~~~~~~~~~~~~~~~

* a **GNU/Linux** distribution as operating system

  * some common shell tools are expected to be available, see :ref:`required_shell_tools`

* `Python <http://python.org>`_:

  * Python 2.7, or Python 3.x (>= 3.5)

  * no third-party Python packages are strictly required (the Python standard library is sufficient)

  * for some *specific* EasyBuild features additional Python packages are required however, see :ref:`optional_python_packages`

* a **modules tool**: Tcl(/C) environment modules or Lmod

  * the actual modules tool *must* be available via ``$PATH``, see :ref:`required_modules_tool`

* a C/C++ compiler (e.g., ``gcc`` and ``g++``)

  * only required to build and install GCC with, or as a dependency for the Intel compilers, for example

.. _required_shell_tools:

Required shell tools
^^^^^^^^^^^^^^^^^^^^

.. XXX - UPDATE BY VERSION, below

A couple of shell tools may be required, depending on the particular use case (in relative order of importance):

* shell builtin commands:

  * ``type``, for inspecting the ``module`` function (if defined)
  * ``ulimit``, for querying user limits

* tools for unpacking (source) archives:

  * commonly required: ``tar``, ``gunzip``, ``bunzip2``
  * occasionally required: ``unzip``, ``unxz``

* ``patch``, for applying patch files to unpacked sources (relatively common)
* ``rpm`` or ``dpkg``, for querying OS dependencies (only needed occasionally)
* ``locate``, only as a (poor mans) fallback to ``rpm``/``dpkg`` (rarely needed)
* ``sysctl``, for querying system characteristics (only required on non-Linux systems)

.. _required_modules_tool:

Required modules tool
^^^^^^^^^^^^^^^^^^^^^

EasyBuild not only generates module files to be used along with the software it installs,
it also depends on the generated modules, mainly for resolving dependencies.
Hence, a modules tool must be available to consume module files with.

.. XXX - UPDATE BY VERSION, below

Supported module tools:

* `Tcl/C environment-modules <http://modules.sourceforge.net/>`_ (version >= 3.2.10)
* `Tcl-only variant of environment modules <http://sourceforge.net/p/modules/modules-tcl>`_
* `Lmod <http://lmod.sourceforge.net>`_ (version >= 6.5.1), *highly recommended*

.. note::
  The path to the actual modules tool binary/script used *must* be included in ``$PATH``,
  to make it readily available to EasyBuild.

  * for Tcl/C environment modules: ``modulecmd``
  * for Tcl-only environment modules: ``modulecmd.tcl``
  * for Lmod: ``lmod``

  The path where the modules tool binary/script is located can be determined via the definition of
  the ``module`` function; for example, using ``type module`` or ``type -f module``.

.. note::
  For Lmod specifically, EasyBuild will try to fall back to finding the ``lmod`` binary via the ``$LMOD_CMD``
  environment variable, in case ``lmod`` is not available in ``$PATH``.

  In EasyBuild versions *prior* to 2.1.1, the path specified by ``$LMOD_CMD`` was (erroneously) preferred over the
  (first) ``lmod`` binary available via ``$PATH``.


Additional notes:

* Tcl(/C) environment-modules requires `Tcl <http://www.tcl.tk/>`_ to be
  installed (with header files and development libraries)
* Lmod requires `Lua <http://www.lua.org/>`_ and a couple of non-standard Lua libraries
  (``lua-posix``, ``lua-filesystem``) to be available

  * Tcl (``tclsh``) must also be available for Lmod to support module files in ``Tcl`` syntax
* a guide to installing Tcl/C environment modules without having root
  permissions is available at :ref:`installing_env_mod_c`.
* a guide to installing Lmod without having root permissions is available at
  :ref:`installing_lmod`.

.. _required_python_packages:

Required Python packages
^^^^^^^^^^^^^^^^^^^^^^^^

Since EasyBuild v4.0, *no* Python packages outside of the Python standard library are required.

.. _required_python_packages_eb3:

Required Python packages for older EasyBuild versions
+++++++++++++++++++++++++++++++++++++++++++++++++++++

For EasyBuild versions prior to version 4.0, a couple of additional Python packages are required:

* ``setuptools``: used to define the ``easybuild`` namespace across different directories

  * available at https://pypi.python.org/pypi/setuptools
  * must be version 0.6 or more recent
  * strictly required since EasyBuild v2.7.0

* ``vsc-install``: provides setuptools functions and support for unit test suites for Python tools

  * also required to install ``vsc-base`` (see below)
  * available at https://pypi.python.org/pypi/vsc-install
  * the required version depends primarily on the ``vsc-base`` version

* ``vsc-base``: a Python library providing the ``fancylogger`` and ``generaloption`` Python modules

  * available at https://pypi.python.org/pypi/vsc-base and https://github.com/hpcugent/vsc-base
  * the required version of ``vsc-base`` depends on the EasyBuild version

.. note::
   ``vsc-base`` is installed automatically along with EasyBuild 3.x, if an installation procedure is used that
   consumes the ``setup.py`` script that comes with the EasyBuild framework (e.g., EasyBuild or the EasyBuild
   bootstrap script, ``pip``, ``easy_install``, ...)

Other Python packages are optional dependencies, see :ref:`optional_python_packages`.

Optional dependencies
~~~~~~~~~~~~~~~~~~~~~

Some dependencies are optional and are only required to support certain features.

.. _optional_python_packages:

Optional Python packages
^^^^^^^^^^^^^^^^^^^^^^^^

* `GC3Pie <https://pypi.org/project/gc3pie>`_, only needed when using `GC3Pie` as a backend for ``--job``,
  see also :ref:`submitting_jobs`;
* `GitPython <http://gitorious.org/git-python>`_, only needed if
  EasyBuild is hosted in a git repository or if you’re using a git
  repository for easyconfig files (.eb);
* `graphviz for Python <https://pypi.python.org/pypi/graphviz>`_,
  only needed for building nice-looking dependency graphs using ``--dep-graph *.pdf / *.png``;
* `keyring <https://pypi.org/project/keyring>`_, only needed for securely storing a GitHub token
  (see :ref:`integration_with_github`);
* `pycodestyle <https://pypi.org/project/pycodestyle>`_,
  only required for ``--check-style`` and ``--check-contrib``;
* `pysvn <http://pysvn.tigris.org/>`_, only needed if you’re using an
  SVN repository for easyconfig files;
* `python-graph-dot <https://pypi.python.org/pypi/python-graph-dot/>`_,
  only needed for building nice-looking dependency graphs using ``--dep-graph *.dot``

Sources
-------

EasyBuild is split up into three different packages, which are available
from the Python Package Index (PyPi):

* `easybuild-framework <http://pypi.python.org/pypi/easybuild-framework>`_ - the EasyBuild framework, which includes the
  easybuild.framework and easybuild.tools Python packages that provide
  general support for building and installing software
* `easybuild-easyblocks <http://pypi.python.org/pypi/easybuild-easyblocks>`_ - a collection of easyblocks that implement
  support for building and installing (collections of) software
  packages
* `easybuild-easyconfigs <http://pypi.python.org/pypi/easybuild-easyconfigs>`_ - a collection of example easyconfig files
  that specify which software to build, and using which build options;
  these easyconfigs will be well tested with the latest compatible
  versions of the easybuild-framework and easybuild-easyblocks packages

Next to these packages, a meta-package named `easybuild <http://pypi.python.org/pypi/easybuild>`_ is also
available on PyPi, in order to easily install the full EasyBuild
distribution.

The source code for these packages is also available on GitHub:

* `easybuild-framework git repository <https://github.com/easybuilders/easybuild-framework>`_
* `easybuild-easyblocks git repository <https://github.com/easybuilders/easybuild-easyblocks>`_
* `easybuild-easyconfigs git repository <https://github.com/easybuilders/easybuild-easyconfigs>`_
* the `main EasyBuild repository <https://github.com/easybuilders/easybuild>`_ mainly hosts *this* EasyBuild documentation


In case of installation issues...
---------------------------------

Should the installation of EasyBuild fail for you, `please open an issue`_
to report the problems you're running into.

How to collect info in case sanity checks fail or there is another issue
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to get a better understanding in which kind of environment
you are using the bootstrap script, please copy-paste the commands below
and provide the output in your problem report.
**Do not worry if some of these commands fail or spit out error messages.**

.. code:: sh

    python -V
    type module
    type -f module
    module --version
    module av EasyBuild
    which -a eb
    eb --version
