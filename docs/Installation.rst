
.. toctree::
     :maxdepth: 1

Installing EasyBuild
====================

EasyBuild is Python software, so there are a couple of ways to install it.
Because of various issues with the different installation tools that are available
for Python packages, we recommend using the **bootstrap** install procedure described here.

Notes on other ways of installing EasyBuild are available under section :ref:`alt_inst_methods`.

-  `Bootstrapping EasyBuild`_

  -  `Bootstrapping procedure`_
  -  `Sanity check`_
  -  `Running unit tests`_
  -  `Example boostrap run`_

-  `Dependencies`_

-  `In case of installation issues...`_

  -  `How to collect info in case sanity checks fail or there is another issue`_

--------------


Bootstrapping EasyBuild
-----------------------

Installing any Python package can be a real pain, and since EasyBuild is
a set of Python packages (framework, easyblocks and easyconfigs) glued together,
installing EasyBuild may, ironically, also cause some headaches.

To resolve this, we have created a bootstrap script that installs the
latest EasyBuild version for you together with an environment module for
it - and yes, we use EasyBuild for doing so.

.. XXX - UPDATE BY VERSION, below

.. tip::
  All you really need as required `dependencies`_ are `Python 2.4 (or 2.x)`
  and `environment modules` (Tcl/C or Lmod variants) installed on your system, beforehand.
  Practically speaking, `a compiler able to build GCC` is desired for initiating most software builds,
  yet the EasyBuild framework, by itself, does not restrict you in what is possible.

Bootstrapping procedure
~~~~~~~~~~~~~~~~~~~~~~~

The easiest way (by far) to install EasyBuild is by bootstrapping it,
i.e. installing EasyBuild via EasyBuild itself.

Download the bootstrap script, and run it, specifying an install path
for EasyBuild, to obtain an ``EasyBuild`` module that you can then load::

    curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py
    python bootstrap_eb.py $HOME/.local/easybuild

.. note::

  The path you specify to the bootstrap script is where EasyBuild should be installed
  and ``$MODULEPATH`` should be aligned with it to make sure the EasyBuild module can be loaded,
  i.e. you should include .../modules/all in your $MODULEPATH.". If you also want
  software that is built using EasyBuild to be installed there, you will need to set
  ``$EASYBUILD_INSTALLPATH``, and/or look into the details on :ref:`configuring_easyBuild`.

.. XXX - UPDATE BY VERSION

.. tip::

  The bootstrap script will only succeed if command ``module --version`` reports a sufficiently recent version
  (e.g., environments-modules-c >=v3.2.10 or Lmd >= 5.6.3), because modules are applied throughout,
  e.g., to resolve dependencies and detect already installed software.

Normally, only when the above fails to work for you for some reason, should you resort
to one of the alternative approaches documented at :ref:`alt_inst_methods`
(these are more involved but also they may give more control).


Sanity check
~~~~~~~~~~~~

Set your ``$MODULEPATH`` correctly if needed, and load the EasyBuild
module with the specific version (see output of bootstrap script for more details)::

    export MODULEPATH=$HOME/.local/easybuild/modules/all:$MODULEPATH
    module load EasyBuild

Determine the version of the loaded EasyBuild, which should match the expected module::

    eb --version

.. tip::

  The Tcl-based or Lmod implementations of environment modules do their default sorting differently;
  The former will normally sort in the lexicographic order, while Lmod follows
  an approach that is closer to Python's construct ``LooseVersion`` way of ordering. Such aspects
  may make a big difference, if you have installed both versions 1.9.0 & 1.15.2 etc,
  about what is the default version.

Running unit tests
~~~~~~~~~~~~~~~~~~

After completion of the bootstrap procedure and loading the
``EasyBuild`` module, try running the EasyBuild unit tests::

    python -m test.framework.suite

If this does not complete successfully, `please open an issue`_ to report it.

.. _details on configuring EasyBuild: https://github.com/hpcugent/easybuild/wiki/Configuration
.. _please open an issue: https://github.com/hpcugent/easybuild-framework/issues/new


Example boostrap run
~~~~~~~~~~~~~~~~~~~~

This is an example run from a recent setup attempt, using EasyBuild/1.15.2::

  $ module --version 2>&1 |head -3 ## This should report something reasonable
  VERSION=3.2.10
  DATE=2012-12-21
  
  $ curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                   Dload  Upload   Total   Spent    Left  Speed
  100 26650  100 26650    0     0  25874      0  0:00:01  0:00:01 --:--:-- 25898
  
  $ python bootstrap_eb.py $HOME/.local/easybuild
  [[INFO]] Found module command 'modulecmd' (EnvironmentModulesC), so using it.
  [[INFO]]
  
  +++ STAGE 0: installing distribute via included (patched) distribute_setup.py...
  
  Downloading http://pypi.python.org/packages/source/d/distribute/distribute-0.6.34.tar.gz
  Extracting in /tmp/tmpgUDe59
  Now working in /tmp/tmpgUDe59/distribute-0.6.34
  Installing Distribute
  [[INFO]]
  
  +++ STAGE 1: installing EasyBuild in temporary dir with easy_install...
  
  Installing with setuptools.setup...
  Installing version 1.15.2
  warning: install_lib: 'build/lib' does not exist -- no Python modules to install
  
  zip_safe flag not set; analyzing archive contents...
  Installing with setuptools.setup...
  Installing version 1.15.2 (API version 1)
  Installing with setuptools.setup...
  Installing version 1.15.2 (required versions: API >= 1)
  Installing with setuptools.setup...
  Installing version 1.15.2.0 (required versions: API >= 1, easyblocks >= 1.15)
  warning: install_lib: 'build/lib' does not exist -- no Python modules to install
  
  [[INFO]]
  
  +++ STAGE 2: installing EasyBuild in /Users/fgeorgatos/.local/easybuild with EasyBuild from stage 1...
  
  == temporary log file in case of crash /tmp/easybuild-I0RSpc/easybuild-4e14kP.log
  == resolving dependencies ...
  == processing EasyBuild easyconfig /tmp/tmprQwWo0/EasyBuild-1.15.2.eb
  == building and installing EasyBuild/1.15.2...
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
  == Results of the build can be found in the log file /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/easybuild/easybuild-EasyBuild-1.15.2-20141023.225606.log
  == Build succeeded for 1 out of 1
  == temporary log file /tmp/easybuild-I0RSpc/easybuild-4e14kP.log has been removed.
  == temporary directory /tmp/easybuild-I0RSpc has been removed.
  [[INFO]] Done!
  [[INFO]]
  [[INFO]] EasyBuild v1.15.2 was installed to /Users/fgeorgatos/.local/easybuild, so make sure your $MODULEPATH includes /Users/fgeorgatos/.local/easybuild/modules/all
  [[INFO]]
  [[INFO]] Run 'module load EasyBuild', and run 'eb --help' to get help on using EasyBuild.
  [[INFO]] Set $EASYBUILD_MODULES_TOOL to 'EnvironmentModulesC' to use the same modules tool as was used now.
  [[INFO]]
  [[INFO]] By default, EasyBuild will install software to $HOME/.local/easybuild.
  [[INFO]] To install software with EasyBuild to /Users/fgeorgatos/.local/easybuild, make sure $EASYBUILD_INSTALLPATH is set accordingly.
  [[INFO]] See https://github.com/hpcugent/easybuild/wiki/Configuration for details on configuring EasyBuild.
  
  $ export MODULEPATH=$HOME/.local/easybuild/modules/all
  $ module av
  
  ------------------------- /Users/fgeorgatos/.local/easybuild/modules/all --------------------------
  EasyBuild/1.15.2
  $ module load EasyBuild
  $ module list
  Currently Loaded Modulefiles:
    1) EasyBuild/1.15.2
  $ which eb
  /Users/fgeorgatos/.local/easybuild/software/EasyBuild/1.15.2/bin/eb
  $ eb --version
  This is EasyBuild 1.15.2 (framework: 1.15.2, easyblocks: 1.15.2) on host CTFwork.local.

Now, enjoy!


.. _dependencies:

Dependencies
------------

EasyBuild has a couple of dependencies, some of them optional:

Required dependencies
~~~~~~~~~~~~~~~~~~~~~

-  **Linux** (or OSX) operating system; preferably x86_64 based
-  `Python 2.4 <http://python.org>`_, or a more recent 2.x version
-  `Tcl/C environment-modules, version >= 3.2.10
   <http://modules.sourceforge.net/>`_ 
   or `Lmod, version >=5.6.3 <lmod.sourceforge.net>`_

  -  environment-modules requires `Tcl <http://www.tcl.tk/>`_ to be
     installed (with header files and development libraries)
  -  Lmod requires Lua and a couple of non-standard Lua libraries to be available
  -  a guide on installing Tcl/C environment modules without having root
     permissions is available at :ref:`installing_env_mod_c`.
  -  a guide on installing Lmod without having root permissions is available at
     :ref:`installing_lmod`.

-  a C/C++ compiler

.. tip::  
 A packaged version of Tcl/C env. modules is available for 
 `RPM-based systems <https://rhn.redhat.com/errata/RHBA-2014-0327.html>`_ and
 `Debian/Ubuntu <https://packages.debian.org/testing/main/environment-modules>`_

Details
^^^^^^^

EasyBuild is written in Python, so a Python installation is indispensable.

EasyBuild not only generates module files to be used along with the
software it installs, it also depends on the generated modules for some
of its functionality. In practice, you need an environment modules (Tcl/C or Lmod) to make
full use of EasyBuild’s features.

The C/C++ compiler is only required when an open-source compiler will be
used to build software applications. EasyBuild will construct a GCC
compiler toolchain first, before building the software applications, and
to build the compiler to be part of the toolchain from source typically
a C/C++ (system) compiler is required.

Required Python modules
^^^^^^^^^^^^^^^^^^^^^^^

There are no required dependencies on non-standard Python modules.

Optional dependencies
~~~~~~~~~~~~~~~~~~~~~

Some dependencies are optional and are only required to support certain features.

Optional Python modules
^^^^^^^^^^^^^^^^^^^^^^^

-  `GitPython <http://gitorious.org/git-python>`_, only needed if
   EasyBuild is hosted in a git repository or if you’re using a git
   repository for easyconfig files (.eb)
-  `pysvn <http://pysvn.tigris.org/>`_, only needed if you’re using an
   SVN repository for easyconfig files (.eb)
-  `python-graph-dot <https://pypi.python.org/pypi/python-graph-dot/>`_,
   only needed for building nice-looking dependency graphs using ``--dep-graph *.dot``.
-  `graphviz for Python <https://pypi.python.org/pypi/graphviz>`_,
   only needed for building nice-looking dependency graphs using ``--dep-graph *.pdf / *.png``.


In case of installation issues...
---------------------------------

**Please open an issue:**
https://github.com/hpcugent/easybuild/issues/new

How to collect info in case sanity checks fail or there is another issue
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to get a better understanding in which kind of environment
you are using the bootstrap script, please copy-paste the commands below
and provide the output.
**Do not worry if some of these commands fail or spit out error messages.**

.. code:: sh

    python -V
    type -f module
    module --version
    module av EasyBuild
    which -a eb
    eb --version

