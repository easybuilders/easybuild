
Configuration Legacy
====================

Configuring `EasyBuild` is done by providing a configuration file.

EasyBuild expects the configuration file to contain valid Python code,
because it executes its contents (using ``exec``).
The rationale is that this approach provides a lot of flexibility for
configuring EasyBuild. However,
we are going to move away from this path, and use the default python
configuration format as parsed by `configparser`_
This new format is already available, you can see it showing up in
``eb --help`` (all the configfile section names) and use it using the
``--configfiles`` option, or put a configfile in
``$HOME/.easybuild/config.cfg``
**This new format is** usable, but it is **not yet documented here.**

EasyBuild will use the file that is provided by the path/filename in the
following order of preference:

-  path/filename specified on the EasyBuild command line (using
   ``--config``),
-  path/filename obtained from the environment variable
   ``EASYBUILDCONFIG`` (if it is defined)
-  ``$HOME/.easybuild/config.py`` (as of EasyBuild v1.1)
-  the (default) configuration file at
   ``<path where EasyBuild was installed>/easybuild/easybuild_config.py``

Configuration variables
-----------------------

The configuration file must define the following five variables:
``build_path``, ``install_path``, ``source_path``, ``repository``, and
``log_format``.
If one of them is not defined, EasyBuild will complain and exit.

Build path (required)
~~~~~~~~~~~~~~~~~~~~~

The ``build_path`` variable specifies the directory in which EasyBuild
builds its software packages.

Each software package is (by default) built in a subdirectory of the
``build_path`` under ``<name>/<version>/<toolchain><versionsuffix>``.

Note that the build directories are emptied by EasyBuild when the
installation is completed (by default).

Install path (required)
~~~~~~~~~~~~~~~~~~~~~~~

The ``install_path`` variable specifies the directory in which EasyBuild
installs software packages and the corresponding module files.

The packages themselves are installed under ``install_path/software``
in their own subdirectory aptly named
``<name>/<version>-<toolchain><versionsuffix>``
(by default), where name is the package name. The corresponding module
files are installed under ``install_path/modules``.

**Setting MODULEPATH**

After the configuration, you need to make sure that ``MODULEPATH``
environment variable is extended with the ``modules/all`` subdirectory
of the ``install_path``, i.e.:

.. code:: bash

    export MODULEPATH=<install_path>/modules/all:$MODULEPATH

It is probably a good idea to add this to your (favourite) shell .rc
file, e.g., ``.bashrc``, and/or the ``.profile`` login scripts, so you do not need to adjust the ``MODULEPATH`` variable every time
you start a new session.

Source path (required)
~~~~~~~~~~~~~~~~~~~~~~

The ``source_path`` variable specifies the directory in which EasyBuild
looks for software source and install files.

Similarly to the configuration file lookup, EasyBuild looks for the
installation files as given by the ``sources`` variable in the .eb easyconfig file, in the following order of preference:

-  ``<source_path>/<name>``: a subdirectory determined by the name 
   of the software package
-  ``<source_path>/<letter>/<name>``: in the style of the
   ``easyblocks``/``easyconfigs`` directories:
   in a subdirectory determined by the first letter (in lower case) of
   the software package and by its full ``name``
-  ``<source_path>``: directly in the source path

Note that these locations are also used when EasyBuild looks for patch
files in addition to the various ``easybuild/easyconfigs`` directories that are listed in the PYTHONPATH.


.. _configparser: http://docs.python.org/2/library/configparser.html
