
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
* command line arguments in turn override the corresponding environment variables *and* matching entries in the
  configuration file


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

Configuration file(s)
~~~~~~~~~~~~~~~~~~~~~

.. _list_of_configuration_files:

List of used configuration files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The list of configuration files that will be used by EasyBuild is determined in the following order of preference:

* the path(s) specified via the **command line argument** ``--configfiles``
* the path(s) specified via the ``$EASYBUILD_CONFIGFILES`` **environment variable**
* the **default paths** for EasyBuild configuration files

.. _default_configuration_files:

Default configuration files
+++++++++++++++++++++++++++

By default, EasyBuild will use existing configuration files at the following paths:

* ``$dir/easybuild.d/*.cfg``, for each directory ``$dir`` listed in ``$XDG_CONFIG_DIRS`` (where ``$XDG_CONFIG_DIRS``
  defaults to ``/etc``)
* ``$XDG_CONFIG_HOME/easybuild/config.cfg`` (where ``$XDG_CONFIG_HOME`` defaults to ``$HOME/.config``)

Hence, if ``$XDG_CONFIG_HOME`` and ``$XDG_CONFIG_DIRS`` are not defined, EasyBuild will only consider default
configuration files at ``/etc/easybuild.d/*.cfg`` and ``$HOME/.config/easybuild/config.cfg``.

The configuration file located in ``$XDG_CONFIG_HOME`` will be listed *after* the ones obtained via ``$XDG_CONFIG_DIRS``,
such that user-defined configuration settings have preference over system defaults.

Multiple configuration files
++++++++++++++++++++++++++++

If multiple configuration files are listed via a mechanism listed above, the settings in the last
configuration file have preference over the others.

Each available configuration file will be used, and the configuration settings specified in these files
will be retained according to the order of preference as indicated above: settings in configuration files specfied via
``--configfiles`` override those in configuration files specified via ``$EASYBUILD_CONFIGFILES``, which in turns override
settings in default configuration files.

Ignored configuration files
+++++++++++++++++++++++++++

On top of this, the ``--ignoreconfigfiles`` configuration option allows to specify configuration files that should be
*ignored* by EasyBuild (regardless of whether they are specified via any of the options above).


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

Two types of template values ``%(...)s`` are supported in configuration files:

* for configuration options defined in the configuration file (and only those)
  * *syntax:* ``%(opt)s``, i.e., using the (lowercase) name of the configuration option
* for the default value of selected configuration options (see ``eb --avail-cfgfile-constants``)
  * *syntax:* ``%(DEFAULT_OPT)s``, i.e., using the uppercase name of the configuration option and prefixed with ``DEFAULT_``

.. note::
  These template values are only supported in configuration files, *not* in environment variable values or 
  command line option values.

.. note::
  Using an unknown template value, i.e. either one for a configuration option that was not defined in the
  configuration file, or a non-existing one for a particular default value, will result in an error like:
  ``ConfigParser.InterpolationMissingOptionError: Bad value substitution``.

Example
+++++++

To include both the (custom) location for the easyconfigs archive repository and the default list of robot search
paths in the active robot search path, the following configuration file entry can be used, featuring the template
for the ``repositorypath`` configuration option and the provided ``DEFAULT_ROBOT_PATHS`` constant::

    repositorypath = /home/example/easybuild/easyconfigs_archive
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

.. note:: The mandatory path-related options can be tweaked collectively via ``--prefix``, see :ref:`prefix` for more
          information.

.. _sourcepath:

Source path (``--sourcepath``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``$HOME/.local/easybuild/sources/`` (determined via :ref:`prefix`)

The ``sourcepath`` configuration setting specifies the parent path of
the directory in which EasyBuild looks for software source and install files.

Looking for the files specified via the ``sources`` parameter in the .eb
easyconfig file is done in the following order of preference:

* ``<sourcepath>/<name>``: a subdirectory determined by the name of the software package
* ``<sourcepath>/<letter>/<name>``:  in the style of the ``easyblocks``/``easyconfigs`` directories: in a
  subdirectory determined by the first letter (in lower case) of the software package and by its full ``name``
* ``<sourcepath>``: directly in the source path

Note that these locations are also used when EasyBuild looks for patch
files in addition to the various ``easybuild/easyconfigs`` directories that are listed in the $PYTHONPATH.

.. _buildpath:

Build path (``--buildpath``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``$HOME/.local/easybuild/build/`` (determined via :ref:`prefix`)

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

Software and modules install path (``--installpath``, ``--installpath-software``, ``--installpath-modules``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

defaults:

* *software install path:* ``$HOME/.local/easybuild/software``  (determined via :ref:`prefix` and ``--subdir-software``)
* *modules install path:* ``$HOME/.local/easybuild/modules/all``  (determined via :ref:`prefix`,
  ``--subdir-modules`` and ``--suffix-modules-path``)

There are several ways in which the software and modules install path used by EasyBuild can be configured:

* using the direct configuration options ``--installpath-software`` and ``--installpath-modules`` (see
  :ref:`installpath_direct_options`)
* using the parent install path configuration option ``--installpath`` (see :ref:`parent_installpath`) or overall
  prefix path configuration option ``--prefix`` (see :ref:`prefix`), along with the ``--subdir-*`` and
  ``--suffix-modules-path`` companion configuration options (see :ref:`installpath_subdirs`)

.. _installpath_direct_options:

Direct options: ``--installpath-software`` and ``--installpath-modules``
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

*default*: *(no default specified)*

The ``--installpath-software`` and ``--installpath-modules`` configuration options (available since EasyBuild v2.1.0)
allow to directly specify the software and modules install paths, respectively.

These configuration options have precedence over all of the other configuration options that relate to specifying the
install path for software and/or modules (see below).

.. _parent_installpath:

Parent install path: ``--installpath``
++++++++++++++++++++++++++++++++++++++

*default*: *(no default specified)*

The ``--installpath`` configuration option specifies the *parent* path of
the directories in which EasyBuild should install software packages and the
corresponding module files.

The install path for software and modules specifically is determined by combining ``--installpath`` with
``--subdir-software``, and combining ``--installpath`` with ``--subdir-modules`` and ``--suffix-modules-path``,
respectively. For more information on these companion configuration options, see :ref:`installpath_subdirs`.

Full install path for software and module file
++++++++++++++++++++++++++++++++++++++++++++++

The full software and module install paths for a particular software package are determined by the active
module naming scheme along with the general software and modules install paths specified by the EasyBuild configuration.

Both the software itself and the corresponding module file will be installed in a subdirectory of the corresponding
install path named according to the active module naming scheme (default format:
``<name>/<version>-<toolchain><versionsuffix>``).
Additionally, symlinks to the actual module file are installed in a subdirectory of the modules install path
named according to the value of the ``moduleclass`` easyconfig parameter.
For more information on the module naming scheme used by EasyBuild, see :ref:`module_naming_scheme`.

Updating ``$MODULEPATH``
++++++++++++++++++++++++

To make the modules generated by EasyBuild available, the ``$MODULEPATH`` environment variable must be updated
to include the modules install path.

The recommended way to do this is to use the ``module use`` command.
For example:

.. code:: shell-session

    $ eb --installpath=$HOME/easybuild
    $ module use $HOME/easybuild/modules/all

It is probably a good idea to add this to your (favourite) shell
``.rc`` file, e.g., ``~/.bashrc``, and/or the ``~/.profile`` login scripts,
so you do not need to adjust ``$MODULEPATH`` every time you start a new session.

.. note:: Updating ``$MODULEPATH`` is not required for EasyBuild itself, since ``eb`` updates ``$MODULEPATH`` itself at
          runtime according to the modules install path it is configured with.

.. _easyconfigs_repo:

Easyconfigs repository (``--repository``, ``--repositorypath``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``FileRepository`` at ``$HOME/.local/easybuild/ebfiles_repo`` (determined via :ref:`prefix`)

EasyBuild has support for archiving (tested) ``.eb`` easyconfig files.
After successfully installing a software package using EasyBuild, the
corresponding ``.eb`` file is uploaded to a repository defined by the ``repository`` and ``repositorypath`` configuration settings.

Currently, EasyBuild supports the following repository types (see also
``eb --avail-repositories``):
* ``FileRepository('path', 'subdir')``: a plain flat file repository;
  ``path`` is the path where files will be stored, ``subdir`` is an
  *optional* subdirectory of that path where the files should be stored
* ``GitRepository('path', 'subdir/in/repo'``: a *non-empty* **bare**
  git repository (created with ``git init --bare`` or ``git clone --bare``);
  ``path`` is the path to the git repository (can also be a URL);
  ``subdir/in/repo`` is optional, and specifies a subdirectory of the
  repository where files should be stored in
* ``SvnRepository('path', 'subdir/in/repo')``: an SVN repository;
  ``path`` contains the subversion repository location (directory or
  URL), the optional second value specifies a subdirectory in the repository

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

.. _prefix:

Overall prefix path
^^^^^^^^^^^^^^^^^^^

*default:* ``$HOME/.local/easybuild``

The overall prefix path used by EasyBuild can be specified using the ``--prefix`` configuration option.

This affects the default value of several configuration options:

* source path (see :ref:`sourcepath`)
* build path (see :ref:`buildpath`)
* software and modules install path (see :ref:`installpath`)
* easyconfigs repository path (see :ref:`easyconfigs_repo`)

.. _installpath_subdirs:

Software and modules install path subdirectories (``--subdir-software``, ``--subdir-modules``, ``--suffix-modules-path``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*defaults*:

* *software install path subdirectory* (``--subdir-software``): ``software``
* *modules install path subdirectory* (``--subdir-modules``): ``modules``
* *modules install path suffix* (``--suffix-modules-path``): ``all``

The subdirectories for the software and modules install paths (relative to ``--installpath``) can be specified using
the corresponding dedicated configuration options (available since EasyBuild v1.14.0).

For example:

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

.. _module_naming_scheme:

Active module naming scheme (``--module-naming-scheme``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*default*: ``EasyBuildModuleNamingScheme``

The module naming scheme that should be used by EasyBuild can be
specified using the ``module-naming-scheme`` configuration setting.

.. code:: shell-session

    $ eb --module-naming-scheme=HierarchicalMNS ...

For more details, see the dedicated page: https://github.com/hpcugent/easybuild/wiki/Using-a-custom-module-naming-scheme .

.. _`http://docs.python.org/2/library/configparser.html`: http://docs.python.org/2/library/configparser.html

