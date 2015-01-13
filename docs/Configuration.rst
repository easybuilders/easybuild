
.. toctree::
     :maxdepth: 1

.. _configuring_easybuild:

Configuring EasyBuild
=====================

This page discusses the recommended style of configuring
EasyBuild, which is supported since EasyBuild v1.3.0.

.. _configuration_types:

Supported configuration types
-----------------------------

Configuring EasyBuild can be done by:

* using ``eb`` with **command line arguments**
* setting **environment variables** (``$EASYBUILD_...``)
* providing one or more **configuration files**

Of course, combining any of these types of configuration works too (and
is even fairly common).

The order of preference for the different configuration types is as listed above, that is:

* environment variables override the corresponding entries in the configuration file
* command line arguments in turn override the corresponding environment variables *and* matching entries in the configuration file


Consistentency across supported configuration types
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note that the various available configuration options are handled
**consistently** across the supported configuration types.

For example: to configure EasyBuild to use Lmod as modules tool, the following alternatives are available:

* configuration file entry (key-value assignment):

  .. code:: ini

   [config]
   modules-tool = Lmod

* environment variable (upper case, ``EASYBUILD_`` prefix, ``-``'s becomes ``_``'s):

  .. code::

   $ export EASYBUILD_MODULES_TOOL=Lmod

* command line argument (long options preceded by ``--`` and (optionally) using ``=``):

  .. code::

   $ eb --modules-tool=Lmod

  or

  .. code::

   $ eb --modules-tool Lmod

For more details w.r.t. each of the supported configuration types, see below.

.. _configuration_file:

Configuration file
~~~~~~~~~~~~~~~~~~

.. _list_of_configuration_files:

List of used configuration files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The set of configuration files that will be used by EasyBuild is
determined in the following order of preference:

* the path(s) specified via **command line argument** ``--configfiles``
* the path(s) specified via the ``$EASYBUILD_CONFIGFILES`` **environment variable**
* the **default path** for the EasyBuild configuration file, i.e.
   ``$XDG_CONFIG_HOME/easybuild/config.cfg`` (``$XDG_CONFIG_HOME`` defaults to ``$HOME/.config``).

Note that each available configuration file will be used, and that the
configuration settings specified in these files will be retained according to the order of preference as indicated above.

On top of this, the command line argument ``--ignoreconfigfiles``
allows to specify configuration files that should be *ignored* by EasyBuild
(regardless of whether they are specified via any of the options above).


Configuration file format
^^^^^^^^^^^^^^^^^^^^^^^^^

The EasyBuild configuration file follows the default Python
configuration format as parsed by the ``configparser`` module
(see `http://docs.python.org/2/library/configparser.html`_).

Configuration files are organized in sections, the section name for a
particular configuration setting is indicated in the output of ``eb --help``.
Some examples sections are: ``MAIN``, ``basic``, ``config``,
``informative``, ``override``, ``regtest``, ``software``, ``unittest``, etc.

Sections are indicated by specifying the section name in square brackets
on a dedicated line, e.g., ``[basic]``.

Configuration settings are specified in a ``key = value`` or
``key: value`` format, **without using quotes for string-like values**.
For boolean configuration settings, values that evaluated to ``True``
(e.g., ``true``, ``1``, …) are all equivalent to enabling the setting.

Comment lines start with a hash character ``#`` (just like in Python code).

An example configuration file that should make everything clear is shown below.

.. code:: python

    [basic]
    # always enable logging to stdout
    logtostdout = true
    [config]
    # use Lmod as modules tool
    modules-tool: Lmod
    # use different default installation path
    prefix=/home/you/work/easybuild/

.. _configuration_file_templates_constants:

Templates and constants supported in configuration files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For each configuration option, a matching template is available to refer to its corresponding value.

A couple of predefined constants are available to be used (only) in EasyBuild configuration files.
An overview of supported constants is available via ``eb --avail-cfgfile-constants``.

For both templates and constants, the syntax format is ``%(template_or_constant_name)s``.

Example
+++++++

To include both the easyconfigs archive repository and the default list of robot search paths in the
active robot search path, the following configuration file entry can be used, featuring the template for the
``repositorypath`` configuration option and the provided ``DEFAULT_ROBOT_PATHS`` constant::

    robot-paths = %(repositorypath)s:%(DEFAULT_ROBOT_PATHS)s

See also :ref:`controlling_robot_search_path`.

Generating a template configuration file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Since EasyBuild v1.10, a command line option ``--confighelp`` is
available that prints out the help text as an annotated configuration
file. This can be used as an empty template configuration file:

.. code:: shell-session

    $ mkdir -p $HOME/.easybuild
    $ eb --confighelp > $HOME/.easybuild/config.cfg

.. code:: shell-session

    $ head $HOME/.easybuild/config.cfg
    [MAIN]
    # Enable debug log mode (def False)
    #debug=
    # Enable info log mode (def False)
    #info=
    # Enable info quiet/warning mode (def False)
    #quiet=

    [basic]
    # Print build overview incl. dependencies (full paths) (def False)

Environment variables
~~~~~~~~~~~~~~~~~~~~~

All configuration settings listed as long options in ``eb --help`` can
also be specified via ``EASYBUILD_``-prefixed environment variables.

Configuration settings specified this way always override the
corresponding setting specified in a configuration file.

For example, to enable debug logging using an environment variable:

.. code:: shell-session

    $ export EASYBUILD_DEBUG=1

More examples of using environment variables to configure EasyBuild are
shown in the sections below.

.. tip:: Any configuration option of EasyBuild which can be tuned by command line
  or via the configuration file, can also be tuned via a corresponding environment variable.


Command line arguments
~~~~~~~~~~~~~~~~~~~~~~

The configuration type with the highest precedence are the ``eb``
command line arguments, which override settings specified through environment variables or in configuration files.

For some configuration options, both short and long command line
arguments are available (see ``eb --help``); the long options indicate
how the configuration setting should be specified in a configuration file
or via an environment variable (``$EASYBUILD_<LONGOPTION>``).

For boolean configuration settings, both the ``--<option>`` and
``--disable-<option>`` variants are always available.

Examples (more below):

* enable debug logging (long option) and logging to stdout (short option)

.. code:: shell-session

    $ eb --debug -l ...

* use ``/dev/shm`` as build path, install to temporary install path, disable debug logging

.. code:: shell-session

    $ eb --buildpath=/dev/shm --installpath=/tmp/$USER --disable-debug ...

Available configuration settings
--------------------------------

To obtain a full and up-to-date list of available configuration
settings, see ``eb --help``. We refrain from listing all available configuration settings here, to avoid outdated documentation.

A couple of selected configuration settings are discussed below,
in particular the mandatory settings.

Mandatory configuration settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A handful of configuration settings are **mandatory**, and should be
provided using one of the supported configuration types.

The following configuration settings are currently mandatory
(more details in the sections below):

* :ref:`sourcepath`
* :ref:`buildpath`
* :ref:`installpath`
* :ref:`easyconfigs_repo`
* :ref:`logfile_format`

If any of these configuration settings is not provided in one way or another, EasyBuild will complain and exit.

In practice, all of these have reasonable defaults (see ``eb --help`` for the default settings).


.. _sourcepath:

Source path (``--sourcepath``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``$HOME/.local/easybuild/sources/``

The ``sourcepath`` configuration setting specifies the parent path of
the directory in which EasyBuild looks for software source and install files.

Looking for the files specified via the ``sources`` parameter in the .eb
easyconfig file is done in the following order of preference:

* ``<sourcepath>/<name>``: a subdirectory determined by the name of the software package
* ``<sourcepath>/<letter>/<name>``:  in the style of the ``easyblocks``/``easyconfigs`` directories: in a subdirectory determined by the first letter (in lower case) of the software package and by its full ``name``
* ``<sourcepath>``: directly in the source path

Note that these locations are also used when EasyBuild looks for patch
files in addition to the various ``easybuild/easyconfigs`` directories that are listed in the $PYTHONPATH.

.. _buildpath:

Build path (``--buildpath``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``$HOME/.local/easybuild/build/``

The ``buildpath`` configuration setting specifies the parent path of the
(temporary) directories in which EasyBuild builds its software packages.

Each software package is (by default) built in a subdirectory of the
specified ``buildpath`` under
``<name>/<version>/<toolchain><versionsuffix>``.

Note that the build directories are emptied and removed by EasyBuild
when the installation is completed (by default).

.. tip::
  Using ``/dev/shm`` as build path can significantly speed up builds,
  if it is available and provides a sufficient amount of space. Setting up
  the variable ``EASYBUILD_BUILDPATH`` in your shell startup files makes this default.
  However be aware that, fi., two parallel GCC builds may fill up ``/dev/shm`` !

.. _installpath:

Install path (``--installpath``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``$HOME/.local/easybuild/``

The ``installpath`` configuration setting specifies the parent path of
the directories in which EasyBuild installs software packages and the
corresponding module files.

By default, the packages themselves are installed under ``<installpath>/software``
in their own subdirectory following the active module naming scheme
(e.g., ``<name>/<version>-<toolchain><versionsuffix>``, by default).
The corresponding module files are installed under
``<installpath>/modules/all``, and symlinks are installed in ``<installpath>/modules/<moduleclass>``.

Different configuration options are available for changing the default behaviour, i.e.,
--subdir-software, --subdir-modules, --suffix-modules-path, --module-naming-scheme, etc.

For more information, see `Optional configuration settings`_.

Setting ``$MODULEPATH``
+++++++++++++++++++++++

After (re)configuring EasyBuild, you need to make sure that
``$MODULEPATH`` environment variable is extended with the
``modules/all`` subdirectory of the ``installpath``
so you can load the modules created for the software built with EasyBuild, i.e.:

.. code:: shell-session

    $ module use <installpath>/modules/all

It is probably a good idea to add this to your (favourite) shell
``.rc`` file, e.g., ``~/.bashrc``, and/or the ``~/.profile`` login scripts,
so you do not need to adjust ``$MODULEPATH`` every time you start a new session.

.. _easyconfigs_repo:

Easyconfigs repository (``--repository``, ``--repositorypath``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``FileRepository`` at ``$HOME/.local/easybuild/ebfiles_repo``

EasyBuild has support for archiving (tested) ``.eb`` easyconfig files.
After successfully installing a software package using EasyBuild, the
corresponding ``.eb`` file is uploaded to a repository defined by the ``repository`` and ``repositorypath`` configuration settings.

Currently, EasyBuild supports the following repository types (see also
``eb --avail-repositories``):

* ``FileRepository('path', 'subdir')``: a plain flat file repository;
   ``path`` is the path where files will be stored, ``subdir`` is an
   *optional* subdirectory of
   that path where the files should be stored
* ``GitRepository('path', 'subdir/in/repo'``: a *non-empty* **bare**
   git repository (created with ``git init --bare`` or ``git clone --bare``);
   ``path`` is the path to the git repository (can also be a URL);
   ``subdir/in/repo`` is optional, and specifies a subdirectory of the
   repository where files should be stored in
* ``SvnRepository('path', 'subdir/in/repo')``: an SVN repository;
   ``path`` contains the subversion repository location (directory or
   URL), the optional second value
   specifies a subdirectory in the repository

You need to set the ``repository`` setting inside a configuration file like this:

.. code:: python

    [config]
    repository = FileRepository
    repositorypath = <path>

Or, optionally an extra argument representing a subdirectory can be specified, e.g.:

.. code:: shell-session

    $ export EASYBUILD_REPOSITORY=GitRepository
    $ export EASYBUILD_REPOSITORYPATH=<path>,<subdir>

You do not have to worry about importing these classes,
EasyBuild will make them available to the configuration file.

Using ``git`` requires the ``GitPython`` Python modules, using ``svn``
requires the ``pysvn`` Python module (see :ref:`dependencies`).

If access to the easyconfigs repository fails for some reason
(e.g., no network or a missing required Python module), EasyBuild will
issue a warning. The software package will still be installed, but the
(successful) easyconfig will not be automatically added to the archive
(i.e., it is not considered a fatal error).

.. _logfile_format:

Logfile format (``--logfile-format``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*:
``easybuild, easybuild-%(name)s-%(version)s-%(date)s.%(time)s.log``

The `logfile format` configuration setting contains a tuple
specifying a log directory name and a template log file name.
In both of these values, using the following string templates
is supported:

* ``%(name)s``: the name of the software package to install
* ``%(version)s``: the version of the software package to install
* ``%(date)s``: the date on which the installation was performed (in ``YYYYMMDD`` format, e.g. ``20120324``)
* ``%(time)s``: the time at which the installation was started (in ``HHMMSS`` format, e.g. ``214359``)

.. note:: Because templating is supported in configuration files themselves (see
          :ref:`configuration_file_templates_constants`), the '``%``' character in these template values must be escaped
          when used in a configuration file (and only then), e.g., '``%%(name)s``'. Without escaping, an error like
          ``InterpolationMissingOptionError: Bad value substitution`` will be thrown by ``ConfigParser``.

For example, configuring EasyBuild to generate a log file mentioning only the software name in a directory named
``easybuild`` can be done via the ``--logfile-format`` command line option::

    eb --logfile-format="easybuild,easybuild-%(name)s.log" ...

or the ``$EASYBUILD_LOGFILE_FORMAT`` environment variable::

    export EASYBUILD_LOGFILE_FORMAT="easybuild,easybuild-%(name)s.log"

or by including the following in an EasyBuild configuration file (note the use of '``%%``' to escape the ``name``
template value here)::

    logfile-format = easybuild,easybuild-%%(name)s.log


Optional configuration settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Software and modules install path suffixes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This section describes configuration options
``--subdir-software``, ``--subdir-modules``, ``--suffix-modules-path``,
which are supported since v1.14.0.

*defaults*: ``software`` as software install path suffix, ``modules`` as
modules install path suffix

The software and modules install path suffixes can be adjusted using the
``subdir-software`` and/or ``subdir-modules`` / ``suffix-modules-path`` configuration settings,
for example:

.. code:: shell-session

    $ export EASYBUILD_SUBDIR_SOFTWARE=installs
    $ eb --subdir-modules=module_files ...

Modules tool (``--modules-tool``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``EnvironmentModulesC``

Specifying the modules tool that should be used by EasyBuild can be
done using the ``modules-tool`` configuration setting.
A list of supported modules tools can be obtained using ``eb --avail-modules-tools``.

Currently, the following modules tools are supported:

* ``EnvironmentModulesC``: Tcl/C version of environment modules (``modulecmd``)
* ``EnvironmentModulesTcl``: Tcl-only version of environment modules (``modulecmd.tcl``)
* ``Lmod``: Lmod, an modern alternative to environment modules, written in Lua (``lmod``)

You can determine which modules tool you are using by checking the
output of ``type -f module`` (in a ``bash`` shell), or ``alias module`` (in a ``tcsh`` shell).

The actual module command (i.e., ``modulecmd``, ``modulecmd.tcl``,
``lmod``, ...) must be available via ``$PATH`` (which is not standard).

For example, to indicate that EasyBuild should be using ``Lmod`` as modules tool:

.. code:: shell-session

    $ eb --modules-tool=Lmod ...

Active module naming scheme (``--module-naming-scheme``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``EasyBuildModuleNamingScheme``

The module naming scheme that should be used by EasyBuild can be
specified using the ``module-naming-scheme`` configuration setting.

.. code:: shell-session

    $ eb --module-naming-scheme=HierarchicalMNS ...

For more details, see the dedicated page: https://github.com/hpcugent/easybuild/wiki/Using-a-custom-module-naming-scheme .

.. _`http://docs.python.org/2/library/configparser.html`: http://docs.python.org/2/library/configparser.html

