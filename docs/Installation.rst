
.. toctree::
     :maxdepth: 1

EasyBuild configuration
=======================





There are a couple of ways to install EasyBuild, depending on your use
case. This page describes the various installation methods.


-  `Bootstrapping`_
-  `Standard installation of latest release`_
-  `Installation from downloaded sources`_
-  `Installation of latest release from GitHub`_
-  `Installation of latest development version`_

.. toctree::
   :maxdepth: 1

--------------

Bootstrapping
-------------

Bootstrapping EasyBuild
~~~~~~~~~~~~~~~~~~~~~~~

The easiest way (by far) to install EasyBuild is by bootstrapping,
i.e. installing EasyBuild via EasyBuild itself. You think this is a chichen-egg issue? Just read on!

Installing any Python package can be a real pain, and since EasyBuild is
a set of Python packages (framework, easyblocks and easyconfigs) glued together, installing EasyBuild may, ironically, also cause some headaches. To resolve this, we have created a bootstrap script that installs the 
latest EasyBuild version for you together with an environment module for
it - and yes, we use EasyBuild for doing so. All you really need is `Python 2.4 (or 2.x)` and `environment modules` (C, Tcl or Lmod variants) installed on your system, beforehand.


Download the bootstrap script, and run it, specifying an install path
for EasyBuild, to obtain an ``EasyBuild`` module which you can then load::

    curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py
    python bootstrap_eb.py $HOME/.local/easybuild

.. note:: The path you specify to the bootstrap script is where EasyBuild should be installed and ``MODULEPATH`` would possibly be aligned to point towards it. If you also want software that is built using EasyBuild to be installed there, you will need to set ``EASYBUILDINSTALLPATH``, and/or look into the details on configuring EasyBuild. XXX

.. warning::

 N.B. Last command will only succeed if commands `module version` and `modulecmd bash version` work as expected (fi. environments-modules-c >=v3.2.10), because they are used throughout the tool, fi. to resolve dependencies.


Only when the above fails to work for you for some reason, should you resort
to one of the alternative approaches documented later on (which are more involved but also give more control in certain circumstances).


Sanity check
~~~~~~~~~~~~

**Please provide the results of the commands below as well, to verify
that everything worked.**

Set your ``MODULEPATH`` correctly if needed, and load the EasyBuild
module with the specific version (see output of bootstrap script for
more details)::

    export MODULEPATH=$HOME/.local/easybuild/modules/all:$MODULEPATH
    module load EasyBuild/<version>

Determine the version of the installed EasyBuild, which should match the
name of the module::

    eb --version

Running unit tests
~~~~~~~~~~~~~~~~~~

After completion of the bootstrap procedure and loading the
``EasyBuild`` module, try running the EasyBuild unit tests. If this
doesn’t complete successfully, **`please open an issue`_** to report it.::

    python -m test.framework.suite

.. _details on configuring EasyBuild: https://github.com/hpcugent/easybuild/wiki/Configuration
.. _please open an issue: https://github.com/hpcugent/easybuild-framework/issues/new







Alternative installation methods
--------------------------------

Standard installation of latest release
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Usually, you just want to install the latest (stable) version of each of
the EasyBuild packages (framework, easyblocks, easyconfigs).

Python provides a couple of ways to do that.
Every version of the EasyBuild packages is released via PyPi.


Installing EasyBuild without admin rights
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you do not have EasyBuild installed yet, or if you just want to
install the most recent version of each of the EasyBuild packages,
you can use one of the following simple commands:

-  using ``easy_install`` (old tool, but still works)::

       easy_install --user easybuild

-  using ``pip`` (more recent and better installation tool for Python software)::

       pip install --user easybuild

The ``--user`` part in these commands allows you to install EasyBuild without admin rights.
It will just install EasyBuild in your home directory (the exact location depends on the OS).

If you don’t have ``pip`` or ``easy_install`` available, see XXX_source_install

Adjusting ``PATH`` environment variable
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After installing EasyBuild with either ``easy_install`` or ``pip``
like this, you will need to
update the ``PATH`` environment variable to make sure the system can
find the main EasyBuild command ``eb``.
On (most) Linux distributions, the command for doing this is:"

    export PATH=$HOME/.local/bin:$PATH

On Mac OS X systems, the user-site install location is different, so the
command would look something like::

    export PATH=$HOME/Library/Python/2.7/bin:$PATH

Depending on the OS X version and the Python version that comes with it,
you may need to adjust the Python version used in the path.



Install with admin rights
^^^^^^^^^^^^^^^^^^^^^^^^^

If you do have admin rights on the system where you want to install
EasyBuild, you can simply omit the ``--user`` flag
to have EasyBuild installed system-wide. In that case, you do not need
to touch the ``PATH`` environment variable since
the ``eb`` command will be installed in one of the default paths.

Alternatives to ``--user``
^^^^^^^^^^^^^^^^^^^^^^^^^^

One problem is that the ``--user`` option is relatively new, and thus
only available in recent Python installations.
As an alternative when you do not have admin rights, you can control
where EasyBuild is installed using the ``--prefix`` option.
However, that does require that you also adjust the ``PYTHONPATH``
environment variable that specifies the Python search path.
With the ``--user`` option, Python takes care of that itself.

The full list of commands to install EasyBuild in the installation
prefix ``/tmp`` using ``pip`` would be:

    pip install --prefix=/tmp easybuild
    export PATH=/tmp/bin:$PATH
    export PYTHONPATH=/tmp/lib/python2.7/site-packages:$PYTHONPATH

Or alternatively (with an old pip)::

    pip install --install-option="--prefix=/tmp" easybuild

To determine the path that should be added to the ``PYTHONPATH``
environment variable for a given installation prefix, you can use the
following command::

    python -c "import distutils.sysconfig; print distutils.sysconfig.get_python_lib(prefix='/tmp');"


Installing the EasyBuild packages separately
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each of the EasyBuild packages can also be installed separetely::

    pip install --user easybuild-framework
    pip install --user easybuild-easyblocks
    pip install --user easybuild-easyconfigs

This is basically the exact same sequence of steps as they will be
performed when running ``pip install --user easybuild``.

Installation from downloaded sources
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To install one of the EasyBuild packages from a downloaded source
tarball, use the following steps::

    tar xfvz easybuild-framework-1.0.tar.gz
    cd easybuild-framework-1.0
    pip install --user .

Do note that when an EasyBuild package is being installed without
having the EasyBuild packages that it depends upon available,
both ``easy_install`` and ``pip`` will try and pull in the latest
available version of those packages from PyPi.

Thus, to have full control over the EasyBuild installation, you need
to respect the following installation order:
easybuild-framework, easybuild-easyblocks, easybuild-easyconfigs. The
easyblocks package depends on the framework package;
the easyconfigs package depends on both the framework and easyblocks
packages.

If you do not have ``pip`` or ``easy_install`` available, you can also
fall back to using the ``setup.py`` script directly::

    python setup.py --user install


or, using ``--prefix`` (see also `here`_)::

    python setup.py install --prefix $HOME/.local

Installation of latest release from GitHub
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To install the latest (stable) release of an EasyBuild package directly
from GitHub, use the following command::

    pip install --user http://github.com/hpcugent/easybuild-framework/archive/master.tar.gz

Again, the order in which the EasyBuild packages are installed is
important to have full control over the installation process, see
previous section.

Installation of latest development version
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To install the latest development version of an EasyBuild package from
GitHub, you can simply adjust the command
from the previous section to install from the ``develop`` branch (or
any of the available feature branches in any
EasyBuild repository for that matter)::

    pip install --user http://github.com/hpcugent/easybuild-framework/archive/develop.tar.gz

.. note:: you should use this only if you are interested in developing for EasyBuild. Although it is well tested, the development version of EasyBuild may be unstable at a given point in time.

.. _here: #user_alternatives

Installation of latest development version, last but not least
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can setup a development version of EasyBuild, quite well in the following manner::

    curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/master/easybuild/scripts/install-EasyBuild-develop.sh
    bash install-EasyBuild-develop.sh hpcugent /tmp/$$ # N.B. delivery directory

.. note:: The above creates a modulefile which you can load/inspect at will. The interesting aspect about it is that it is pointing to an EasyBuild installation directly on local git repositories, which allows you to customise it easily. Remember to commit/push or otherwise save your changes, if you intend them for future usage!



In case of problems...
~~~~~~~~~~~~~~~~~~~~~~

**Please open an issue:**
https://github.com/hpcugent/easybuild-framework/issues/new

How to collect info in case sanity checks fail or there is another problem
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to get a better understanding in which kind of environment
you are using the bootstrap script, please copy-paste the commands below
and provide the output.
**Don’t worry if some of these commands fail or spit out error messages.**::

    python -V
    modulecmd bash version
    module av EasyBuild
    which -a eb
    eb --version

