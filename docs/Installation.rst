.. _installation:

Installing EasyBuild
====================

EasyBuild is Python software, so there are a couple of ways to install it.

We recommend using the **bootstrap** install procedure described at :ref:`bootstrapping`, because of various issues
with the different installation tools that are available for Python packages.

Do take into account the required and optional dependencies (see :ref:`requirements` and :ref:`dependencies`).

For advanced options, see :ref:`bootstrap_advanced_options`.

Notes on other ways of installing EasyBuild are available under section :ref:`alt_inst_methods`.

.. contents::
    :depth: 3
    :backlinks: none

--------------

.. _requirements:

Requirements
------------

The only strict requirements are:

* Linux (or OS X)
* **Python version 2.6**, or a more recent 2.x version + ``setuptools``, ``vsc-install`` & ``vsc-base``

  * see also :ref:`required_python_packages`

* a **modules tool**: Tcl(/C) environment modules or Lmod

  * the actual module command/script (``modulecmd``, ``modulecmd.tcl`` or ``lmod``) *must* be available via ``$PATH``
  * see :ref:`required_modules_tool` for more details

For more information on (optional) dependencies, see :ref:`dependencies`.

.. _bootstrapping:

Bootstrapping EasyBuild
-----------------------

Installing any Python package can be a real pain, and since EasyBuild is basically
a set of Python packages glued together, installing EasyBuild may (ironically) cause some headaches.

To resolve this, we have created a bootstrap script that installs the
latest EasyBuild version for you together with an environment module for
it - and yes, we use EasyBuild for doing so.

A demo of bootstrapping EasyBuild is available at :ref:`demo_boostrapping`.


Bootstrapping procedure
~~~~~~~~~~~~~~~~~~~~~~~

The easiest way (by far) to install EasyBuild is by bootstrapping it,
i.e., installing the latest EasyBuild release (obtained from PyPI) using EasyBuild itself.

To bootstrap EasyBuild:

* download the bootstrap script from https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py
* execute it, and specify an installation prefix as an argument

Yes, it's that easy!

The bootstrap script will perform a 3-stage bootstrap procedure:

* *stage 0:* download and install a specific version of the ``distribute`` Python package, which provides
  the ``easy_install`` tool for installing Python software into a temporary directory
* *stage 1:* download and install the most recent version of EasyBuild from PyPI into a temporary location, using the
  ``easy_install`` tool from stage 0
* *stage 2:* install the most recent version of EasyBuild into the specified installation prefix,
  using the temporary EasyBuild installation from stage 1 (inception!)

This should result in an ``EasyBuild`` module that you can load to start using EasyBuild, after making sure the
module is available by updating ``$MODULEPATH``. More specifically, you need to include the ``modules/all``
subdirectory of the specified installation prefix into ``$MODULEPATH``.

For example::

  # pick an installation prefix to install EasyBuild to (change this to your liking)
  EASYBUILD_PREFIX=$HOME/.local/easybuild

  # download script
  curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py

  # bootstrap EasyBuild
  python bootstrap_eb.py $EASYBUILD_PREFIX

  # update $MODULEPATH, and load the EasyBuild module
  module use $EASYBUILD_PREFIX/modules/all
  module load EasyBuild

.. note::

  The path you specify to the bootstrap script is where EasyBuild should be installed.
  If you also want software that is built/installed using EasyBuild to be located there, you will need
  to configure EasyBuild accordingly (see :ref:`configuring_easybuild`), for example by
  putting the definition for ``$EASYBUILD_PREFIX`` in your ``.bashrc``.

  See also :ref:`configuring_easybuild`.

.. XXX - UPDATE BY VERSION

.. tip::

  The bootstrap script will only succeed if command ``module --version`` reports a sufficiently recent version
  (e.g., environments-modules-c >=v3.2.10 or Lmod >= 5.6.3), because modules are applied throughout,
  e.g., to resolve dependencies and detect already installed software.

Normally, only when the above fails to work for you for some reason, should you resort
to one of the alternative approaches documented at :ref:`alt_inst_methods`
(these are more involved but also they may give more control).

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

.. _install_running_unit_tests:

Running unit tests
~~~~~~~~~~~~~~~~~~

After completion of the bootstrap procedure and loading the
``EasyBuild`` module, try running the EasyBuild unit tests::

    # specify modules tool to use: EnvironmentModulesC (default), EnvironmentModulesTcl, Lmod)
    # see also http://easybuild.readthedocs.org/en/latest/Configuration.html#modules-tool-modules-tool
    export TEST_EASYBUILD_MODULES_TOOL=Lmod
    
    # run full unit test suite for EasyBuild framework
    python -m test.framework.suite

Keep in mind that this is just an example, more details about the EasyBuild unit tests are available at :ref:`unit_tests`.

If this does not complete successfully, `please open an issue`_ to report it.

.. _please open an issue: https://github.com/hpcugent/easybuild-framework/issues/new


Example bootstrap run
~~~~~~~~~~~~~~~~~~~~~

Example output for bootstrapping EasyBuild v1.16.1::

    [[INFO]] Found module command 'lmod' (Lmod), so using it.
    [[INFO]] 

    +++ STAGE 0: installing distribute via included (patched) distribute_setup.py...


    Downloading http://pypi.python.org/packages/source/d/distribute/distribute-0.6.34.tar.gz
    Extracting in /tmp/tmpz0zyAG
    Now working in /tmp/tmpz0zyAG/distribute-0.6.34
    Installing Distribute
    [[INFO]] 

    +++ STAGE 1: installing EasyBuild in temporary dir with easy_install...


    Installing with setuptools.setup...
    Installing version 1.16.1
    warning: install_lib: 'build/lib' does not exist -- no Python modules to install

    zip_safe flag not set; analyzing archive contents...
    Installing with setuptools.setup...
    Installing version 1.16.1 (API version 1)
    Installing with setuptools.setup...
    Installing version 1.16.1 (required versions: API >= 1)
    Installing with setuptools.setup...
    Installing version 1.16.1.0 (required versions: API >= 1, easyblocks >= 1.16)
    warning: install_lib: 'build/lib' does not exist -- no Python modules to install

    [[INFO]] 

    +++ STAGE 2: installing EasyBuild in /home/example/.local/easybuild with EasyBuild from stage 1...


    Couldn't import dot_parser, loading of dot files will not be possible.
    == temporary log file in case of crash /tmp/easybuild-zql_Ft/easybuild-peQ8GA.log
    == processing EasyBuild easyconfig /tmp/tmp_gzHPM/EasyBuild-1.16.1.eb
    == building and installing EasyBuild/1.16.1...
    == fetching files...
    == creating build dir, resetting environment...
    == unpacking...
    == patching...
    == preparing...
    == configuring...
    == building...
    == testing...
    == installing...
    == taking care of extensions...
    == packaging...
    == postprocessing...
    == sanity checking...
    == cleaning up...
    == creating module...
    == COMPLETED: Installation ended successfully
    == Results of the build can be found in the log file /home/example/.local/easybuild/software/EasyBuild/1.16.1/easybuild/easybuild-EasyBuild-1.16.1-20150220.210610.log
    == Build succeeded for 1 out of 1
    == temporary log file /tmp/easybuild-zql_Ft/easybuild-peQ8GA.log has been removed.
    == temporary directory /tmp/easybuild-zql_Ft has been removed.
    [[INFO]] Done!
    [[INFO]] 
    [[INFO]] EasyBuild v1.16.1 was installed to /home/example/.local/easybuild, so make sure your $MODULEPATH includes /home/example/.local/easybuild/modules/all
    [[INFO]] 
    [[INFO]] Run 'module load EasyBuild', and run 'eb --help' to get help on using EasyBuild.
    [[INFO]] Set $EASYBUILD_MODULES_TOOL to 'Lmod' to use the same modules tool as was used now.
    [[INFO]] 
    [[INFO]] By default, EasyBuild will install software to $HOME/.local/easybuild.
    [[INFO]] To install software with EasyBuild to /home/example/.local/easybuild, make sure $EASYBUILD_INSTALLPATH is set accordingly.
    [[INFO]] See http://easybuild.readthedocs.org/en/latest/Configuration.html for details on configuring EasyBuild.
  

After the bootstrap completes, the installed ``EasyBuild`` module can be loaded::
  
  $ module use $HOME/.local/easybuild/modules/all
  $ module av
  ------------------------- /home/example/.local/easybuild/modules/all --------------------------
  EasyBuild/1.16.1

  $ module load EasyBuild
  $ module list
  Currently Loaded Modulefiles:
    1) EasyBuild/1.16.1

  $ which eb
  /home/example/.local/easybuild/software/EasyBuild/1.16.1/bin/eb

  $ eb --version
  This is EasyBuild 1.16.1 (framework: 1.16.1, easyblocks: 1.16.1) on host example.local.

Now, enjoy!

.. _bootstrap_advanced_options:

Advanced bootstrapping options
------------------------------

To use these advanced options, make sure you are using the latest version of the bootstrap script, available
at https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py .

Skipping the installation of ``easy_install`` (stage 0)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The first stage of the bootstrap procedure consists of installing a specific version of the
``distribute`` Python package, which provides the ``easy_install`` installation tool for Python software,
in a temporary location. The bootstrap script then tries to ensure this particular installation is used
during the other bootstrap stages.

If you already have a version of ``easy_install`` on your system, and if you are confident that it behaves (in particular,
that it complies to the installation prefix specified via ``--prefix``), you can skip stage 0 of the bootstrap procedure.

To do so, simply define the ``EASYBUILD_BOOTSTRAP_SKIP_STAGE0`` environment variable (the value doesn't matter)::

  $ export EASYBUILD_BOOTSTRAP_SKIP_STAGE0=1
  $ python bootstrap_eb.py $HOME/eb/test_nostage0
  ...
  [[INFO]] Skipping stage0, using local distribute/setuptools providing easy_install
  ...

  +++ STAGE 1: installing EasyBuild in temporary dir with easy_install...

  ...

Bootstrapping using supplied source tarballs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default, the bootstrap script will download the most recent (stable) EasyBuild version from PyPI, the Python Package
Index (https://pypi.python.org/pypi).

Recent versions of the bootstrap script also allow to supply source tarballs for the different EasyBuild components
(framework, easyblocks, easyconfigs), and (optionally) the vsc-base library EasyBuild depends on.

The source tarball filenames must match a pattern like ``<pkg>*.tar.gz``, where ``<pkg>`` denotes the name of the
respective EasyBuild component:

 * ``vsc-base*.tar.gz``
 * ``easybuild-framework*.tar.gz``
 * ``easybuild-easyblocks*.tar.gz``
 * ``easybuild-easyconfigs*.tar.gz``

The location of the source tarballs can be specified using the ``$EASYBUILD_BOOTSTRAP_SOURCEPATH`` environment variable.

Example usage, with the relevant output at the start of stage 1 of the bootstrap process::

  $ export EASYBUILD_BOOTSTRAP_SOURCEPATH=/tmp/$USER
  $ python bootstrap_eb.py $HOME/eb/test_tarballs

  +++ STAGE 0: installing distribute via included (patched) distribute_setup.py...

  ...

  +++ STAGE 1: installing EasyBuild in temporary dir with easy_install...

  [[INFO]] Fetching sources from /tmp/example...
  [[INFO]] Found /tmp/example/vsc-base-2.0.2.tar.gz for vsc-base package
  [[INFO]] Found /tmp/example/easybuild-framework-v2.0.0dev.tar.gz for easybuild-framework package
  [[INFO]] Found /tmp/example/easybuild-easyblocks.tar.gz for easybuild-easyblocks package
  [[INFO]] Found /tmp/example/easybuild-easyconfigs.tar.gz for easybuild-easyconfigs package
  ...

.. note:: Providing a source tarball for ``vsc-base`` is *optional*. If not specified, the most recent version available
          on PyPI will be downloaded and installed automatically when the ``easybuild-framework`` package is installed.
          Source tarballs for all three EasyBuild components *must* be provided when ``$EASYBUILD_BOOTSTRAP_SOURCEPATH``
          is defined, however.

.. _updating:

Updating an existing EasyBuild installation
-------------------------------------------

To upgrade to a newer EasyBuild version (say, |version|) than the one currently installed there are several options:

     (i) (re)bootstrap EasyBuild to obtain an ``EasyBuild`` module for version |version|, using the instructions above, see :ref:`bootstrapping`.
     (ii) install EasyBuild version |version| with a previous version of EasyBuild, using the easyconfig file available `on the develop branch at Github <https://github.com/hpcugent/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/e/EasyBuild>`__
     (iii) install EasyBuild version |version| from PyPI, using one of the standard Python installation tools (``easy_install``, ``pip``, ...), see also :ref:`alt_inst_easy_install_pip`
     (iv) update the ``master`` branch of your Git working copies of the different EasyBuild repositories

.. _dependencies:

Dependencies
------------

EasyBuild has a couple of dependencies, some are optional.

.. _required_dependencies:

Required dependencies
~~~~~~~~~~~~~~~~~~~~~

.. XXX - UPDATE BY VERSION, below

* **Linux** (or OSX) operating system

  * some common shell tools are expected to be available, see :ref:`required_shell_tools`

* `Python 2.6 <http://python.org>`_, or a more recent 2.x version

  * some additional non-standard Python packages are required, see :ref:`required_python_packages`

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
  * ``ulimit``, for quering user limits

* tools for unpacking (source) archives:

  * commonly required: ``tar``, ``gunzip``, ``bunzip2``
  * occasionally required: ``unzip``, ``unxz``

* ``patch``, for applying patch files to unpacked sources (relatively common)
* ``rpm`` or ``dpkg``, for quering OS dependencies (only needed occasionally)
* ``locate``, only as a (poor mans) fallback to ``rpm``/``dpkg`` (rarely needed)
* ``sysctl``, for quering system characteristics (only required on non-Linux systems)

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
* `Lmod <http://lmod.sourceforge.net>`_ (version >= 5.6.3), *highly recommended*

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
  environment variable, in case ``lmod`` is not availabe in ``$PATH``.

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
   ``vsc-base`` is installed automatically along with EasyBuild, if an installation procedure is used that 
   consumes the ``setup.py`` script that comes with the EasyBuild framework (e.g., EasyBuild or the EasyBuild
   bootstrap script, ``pip``, ``easy_install``, ...)

Other Python packages are optional dependencies, see :ref:`optional_python_packages`.

Optional dependencies
~~~~~~~~~~~~~~~~~~~~~

Some dependencies are optional and are only required to support certain features.

.. _optional_python_packages:

Optional Python packages
^^^^^^^^^^^^^^^^^^^^^^^^

* `GitPython <http://gitorious.org/git-python>`_, only needed if
  EasyBuild is hosted in a git repository or if you’re using a git
  repository for easyconfig files (.eb)
* `pysvn <http://pysvn.tigris.org/>`_, only needed if you’re using an
  SVN repository for easyconfig files (.eb)
* `python-graph-dot <https://pypi.python.org/pypi/python-graph-dot/>`_,
  only needed for building nice-looking dependency graphs using ``--dep-graph *.dot``.
* `graphviz for Python <https://pypi.python.org/pypi/graphviz>`_,
   only needed for building nice-looking dependency graphs using ``--dep-graph *.pdf / *.png``.

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

* `easybuild-framework git repository <https://github.com/hpcugent/easybuild-framework>`_
* `easybuild-easyblocks git repository <https://github.com/hpcugent/easybuild-easyblocks>`_
* `easybuild-easyconfigs git repository <https://github.com/hpcugent/easybuild-easyconfigs>`_
* the `main EasyBuild repository <https://github.com/hpcugent/easybuild>`_ mainly hosts *this* EasyBuild documentation


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

