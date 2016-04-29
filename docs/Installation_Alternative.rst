
.. toctree::
     :maxdepth: 1

.. _alt_inst_methods:

Alternative installation methods
================================

We warmly recommend installing EasyBuild via the bootstrap procedure, see :ref:`bootstrapping`.

This page describes the alternative installation methods:

*  `Standard installation of latest release`_
*  `Installation from downloaded sources`_
*  `Installation of latest release from GitHub`_
*  `Installation of latest development version`_

Do take into account the list of (required) dependencies (see :ref:`dependencies`).

--------------


Standard installation of latest release
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Usually, you just want to install the latest (stable) version of each of
the EasyBuild packages (framework, easyblocks, easyconfigs).

Python provides a couple of ways to do that.
Every version of the EasyBuild packages is released via PyPi.


.. _alt_inst_easy_install_pip:

Installing EasyBuild without admin rights
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you do not have EasyBuild installed yet, or if you just want to
install the most recent version of each of the EasyBuild packages,
you can use one of the following simple commands:

-  using ``easy_install`` (old tool, but still works)::

       easy_install --prefix $HOME/EasyBuild easybuild

.. note:: If you already have `easybuild` installed, you may need to instruct ``easy_install`` to install a newer version,
          using ``--upgrade`` or ``-U``.

-  using ``pip`` (more recent and better installation tool for Python software)::

       pip install --install-option "--prefix=$HOME/EasyBuild" easybuild

The ``--prefix $HOME/EasyBuild`` part in these commands allows you to install EasyBuild without admin rights into ``$HOME/EasyBuild``.

.. note:: For pip v8.0 and newer, ``pip install --prefix=$HOM/EasyBuild easybuild`` works too.

Adjusting ``$PATH`` and ``$PYTHONPATH`` environment variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After installing EasyBuild with either ``easy_install`` or ``pip``
like this, you will need to update the ``$PATH`` and ``$PYTHONPATH``
environment variable to make sure the system can find the main EasyBuild command ``eb``.
On (most) Linux distributions, the command for doing this is:

.. code:: bash

    export PATH=$HOME/EasyBuild/bin:$PATH
    export PYTHONPATH=$HOME/EasyBuild/lib/python2.7/site-packages:$PYTHONPATH

.. tip::

  To determine the path that should be added to the ``$PYTHONPATH``
  environment variable for a given installation prefix, you can use the
  following command::

    python -c "import distutils.sysconfig; print distutils.sysconfig.get_python_lib(prefix='$HOME/EasyBuild/');"


Install with admin rights
^^^^^^^^^^^^^^^^^^^^^^^^^

If you do have admin rights on the system where you want to install
EasyBuild, you can simply omit the ``--prefix $HOME/EasyBuild/``
to have EasyBuild installed system-wide. In that case, you do not need
to touch the ``$PATH`` or ``$PYTHONPATH`` environment variables since
the ``eb`` command will be installed in one of the default paths.

Alternatives to --prefix
^^^^^^^^^^^^^^^^^^^^^^^^

As an alternative to ``--prefix`` when you do not have admin rights,
you can specify that EasyBuild should be installed in your ``$HOME``
directory using the ``--user`` option.

The full list of commands to install EasyBuild in your ``$HOME``
directory using ``pip`` would be::

    pip install --user easybuild
    export PATH=$HOME/.local/bin:$PATH

.. warning::

  In our experience, using ``--user`` creates more problems than it solves.
  We have run into unexpected behavior with Python software installed in your
  home directory using ``--user``, for example it **always** being preferred over
  versions installed somewhere else. Hence, we strongly discourage using `--user`
  to install EasyBuild (or other Python software).

Installing the EasyBuild packages separately
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each of the EasyBuild packages can also be installed separetely::

    pip install --install-option "--prefix=$HOME/EasyBuild" easybuild-framework
    pip install --install-option "--prefix=$HOME/EasyBuild" easybuild-easyblocks
    pip install --install-option "--prefix=$HOME/EasyBuild" easybuild-easyconfigs

This is the exact same sequence of steps as they will be
performed when running ``pip install --install-option "--prefix=$HOME/EasyBuild" easybuild``.

Installation from downloaded sources
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To install one of the EasyBuild packages from a downloaded source
tarball, use the following steps::

    tar xfvz easybuild-framework-1.0.tar.gz
    cd easybuild-framework-1.0
    pip install --install-option "--prefix=$HOME/EasyBuild" .

Do note that when an EasyBuild package is being installed without
having the EasyBuild packages that it depends upon available,
both ``easy_install`` and ``pip`` will try and pull in the latest
available version of those packages from PyPi.

Thus, to have full control over the EasyBuild installation, you need
to respect the following installation order:
easybuild-framework, easybuild-easyblocks, easybuild-easyconfigs. The
easyblocks package depends on the framework package;
the easyconfigs package depends on both the framework and easyblocks packages.

If you do not have ``pip`` or ``easy_install`` available, you can also
fall back to using the ``setup.py`` script directly::

    python setup.py --prefix $HOME/EasyBuild install


Installation of latest release from GitHub
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To install the latest (stable) release of an EasyBuild package directly
from GitHub, use the following command::

    pip install --install-option "--prefix=$HOME/EasyBuild" http://github.com/hpcugent/easybuild-framework/archive/master.tar.gz

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

    pip install --install-option "--prefix=$HOME/EasyBuild" http://github.com/hpcugent/easybuild-framework/archive/develop.tar.gz

.. note::
  You should use this only if you are interested in developing for EasyBuild.
  Although it is well tested, the development version of the EasyBuild repositories may be unstable at a given point
  in time.

.. _install_latest_develop_using_script:

Installation of latest development version using provided script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After you have forked each of the EasyBuild repositories on GitHub (+ vsc-base), you can set up a development version
of EasyBuild using the ``install-EasyBuild-develop.sh`` script.

This script will clone the different EasyBuild repositories from GitHub:

 * `easybuild <https://github.com/hpcugent/easybuild>`_:
   EasyBuild metapackage & documentation sources for http://easybuild.readthedocs.org
 * `vsc-base <https://github.com/hpcugent/vsc-base>`_:
   dependency for EasyBuild framework (logging, command line interface, ...)
 * `easybuild-framework <https://github.com/hpcugent/easybuild-framework>`_:
   EasyBuild framework
 * `easybuild-easyblocks <https://github.com/hpcugent/easybuild-easyblocks>`_:
   collection of easyblocks
 * `easybuild-easyconfigs <https://github.com/hpcugent/easybuild-easyconfigs>`_:
   collection of easyconfig files
 * `easybuild-wiki <https://github.com/hpcugent/easybuild-wiki>`_:
   EasyBuild wiki pages

It can be used as follows::

    # pick an installation prefix (adjust as you like)
    INSTALL_PREFIX=$(mktemp -d $HOME/EasyBuild-XXXXXX)
    # download script
    curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/master/easybuild/scripts/install-EasyBuild-develop.sh
    # run downloaded script, specifying *your* GitHub username and the installation prefix
    bash install-EasyBuild-develop.sh GITHUB_USERNAME $INSTALL_PREFIX
    # update $MODULEPATH via 'module use', and load the module
    module use $INSTALL_PREFIX/modules
    module load EasyBuild-develop
    eb --version  ## This should ensure you have a reasonable instance of EasyBuild

.. note:: The above creates a module file which you can load/inspect at will.
  The interesting aspect about it is that it is pointing to an EasyBuild
  installation directly on local git repositories, which allows you to
  customise it easily. Remember to commit/push or otherwise save your changes,
  if you intend to use them later.
