.. _implementing_easyblocks:

Implementing easyblocks
=======================

This documentation covers aspects of implementing *easyblocks* and how to use them.
For a concise definition of easyblocks, see :ref:`easyblocks`.

.. contents::
    :depth: 3
    :backlinks: none


.. _implementing_easyblocks_basics:

The basics
----------

An *easyblock* is a Python module that implements a software build and installation procedure.

This concept is essentially implemented as a Python script that plugs into the :ref:`framework`.

EasyBuild will leverage easyblocks as needed, depending on which software packages it needs to install.
Which easyblock is required is determined by the ``easyblock`` easyconfig parameter, if it is present,
or the software name (see :ref:`implementing_easyblocks_generic_vs_software_specific`).


.. _implementing_easyblocks_generic_vs_software_specific:

Generic vs software-specific easyblocks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Easyblocks can either be *generic* or *software-specific*.

Generic easyblocks implement a 'standard' software build and installation procedure that is used by multiple different
software packages.
A commonly used example is the
`ConfigureMake <https://github.com/easybuilders/easybuild-easyblocks/blob/master/easybuild/easyblocks/generic/configuremake.py>`_ 
generic easyblock, which implements the standard ``configure`` - ``make`` - ``make install`` installation procedure used
by most GNU software packages.

Software-specific easyblocks implement the build and installation procedure for a particular software package
(see also :ref:`implementing_easyblocks_naming_scheme_module`).
Typically this involves highly customised substeps, for example specifying dedicated configuration options, creating
or adjusting specific files, executing non-standard shell commands, etc. Usually a custom implementation of the
sanity check is also included.

Since EasyBuild v2.0, using a generic easyblock requires specifying the ``easyblock`` parameter in the easyconfig file.
If it is not specified, EasyBuild will try and find the software-specific easyblock derived from the software name.

The distinction between generic and software-specific easyblocks can be made based on the naming scheme that is used
for an easyblock (see also :ref:`implementing_easyblocks_naming_scheme`).

See also :ref:`generic_easyblocks`.


.. _implementing_easyblocks_vs_easyconfigs:

Easyblocks vs easyconfigs
-------------------------

Before you start implementing an easyblock, you should determine whether or not you really need an easyblock.

:ref:`easyconfig_files` provide quite a bit of flexibility that alleviate the need for implementing many (software-specific)
easyblocks. Examples include easyconfig parameters like ``(pre){config,build,installopts}`` (available for any easyblock),
``install_cmd`` (only for ``Binary`` generic easyblock or derivates), etc. See :ref:`writing_easyconfig_files` for an
overview of what is supported in easyconfig files, and :ref:`generic_easyblocks` for custom easyconfig parameters for
the existing generic easyblocks (see also '``eb -e <easyblock> -a``').

On the other hand, somewhat complex or heavily customised software build and installation procedures may be handled better
via a custom easyblock.

Easyblocks are "do once and forget", and can provide a *central* solution for peculiarities of installations.
Since they are basically Python scripts, they are very flexible and can take care of the
'heavy lifting' that goes beyond the key-value defining scope of easyconfig files.

Hence, there is a fine line between using 'fat' easyconfigs with a generic easyblock and using a custom software-specific easyblock.

Reasons to consider implementing a custom easyblock include:

* 'critical' values for easyconfig parameters, which are required to make the installation succeed
* compiler- or toolchain-specific aspects of the build and installation procedure (e.g., configure/build/install options)
* interactive commands that need to be run
* custom (configure) options for dependencies
* having to create or adjust specific (configuration) files
* 'hackish' usage of existing (generic) easyblocks and available easyconfig parameters

One important aspect to consider of course is that implementing easyblocks requires some familiarity with Python,
while easyconfig files can mostly be seen as a set of pure key-value definitions and hence are easier to create or
update.


.. _implementing_easyblocks_naming_scheme:

Naming scheme for easyblocks
----------------------------

Easyblocks need to follow a strict naming scheme, to ensure that EasyBuild can pick them up as needed.
This involves two aspects: i) the name of the Python class, and ii) the name and location of the Python module file.


.. _implementing_easyblocks_naming_scheme_class_name_specific:

Class name for software-specific easyblocks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The name of the Python class is determined by the *software name* for software-specific easyblocks.
It consists of a prefix '``EB_``', followed by the (original) software name.

Because of limitations in Python on characters allowed in names of Python classes,
only alphanumeric characters and ``_`` are allowed. Any other characters are replaced following an encoding scheme:

* spaces are replaced by underscores (``_``)
* dashes ``-`` are replaced by ``_minus_``
* underscores are replaced by ``_underscore_``
* etc.

The ``encode_class_name`` function provided in ``easybuild.tools.filetools`` returns the expected class name
for a given software name; for example:

.. code::

  >>> from easybuild.tools.filetools import encode_class_name
  >>> encode_class_name('netCDF-Fortran')
  'EB_netCDF_minus_Fortran'


.. _implementing_easyblocks_naming_scheme_class_name_generic:

Class name for generic easyblocks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For *generic* easyblocks, the class name does *not* include an ``EB_`` prefix (since there is no need for an escaping
mechanism) and hence the name is fully free to choose, taking into account the restriction to alphanumeric characters
and underscores.

For code style reasons, the class name should start with a capital letter.

Examples include ``Bundle``, ``ConfigureMake``, ``CMakePythonPackage``.


.. _implementing_easyblocks_naming_scheme_module:

Module name/location
~~~~~~~~~~~~~~~~~~~~

The *name* of the Python module file is directly related to the name of Python class (i.e., the actual easyblock) that it provides.

It should:

* *not* include the ``EB_`` prefix of the class name for software-specific easyblocks
* consists only of lower-case alphanumeric characters (``[a-z0-9]``) and underscores (``_``)

  * dashes (``-``) are replaced by underscores (``_``)
  * any other non-alphanumeric characters (incl. spaces) are simply dropped

Examples include:

* ``gcc.py`` (for *GCC*)
* ``netcdf_fortran.py`` (for *netCDF-Fortran*)
* ``gamess_us.py`` (for *GAMESS (US)*)

The ``get_module_path`` function provided in ``easybuild.framework.easyconfig.easyconfig`` returns the (full)
module location for a particular software name or easyblock class name; for example:

.. code::

  >>> from easybuild.framework.easyconfig.easyconfig import get_module_path
  >>> get_module_path('netCDF-Fortran')
  'easybuild.easyblocks.netcdf_fortran'
  >>> get_module_path('EB_netCDF_minus_Fortran')
  'easybuild.easyblocks.netcdf_fortran'

The location of the Python module is determined by whether the easyblock is generic or software-specific.
Generic easyblocks are located in the ``easybuid.easyblocks.generic`` namespace, while software-specific easyblocks
live in the ``easybuild.easyblocks`` namespace directly. To keep things organised, the actual Python module file
for software-specific easyblocks are kept in 'letter' subdirectories,
rather than in one large '``easyblocks``' directory
(see https://github.com/easybuilders/easybuild-easyblocks/blob/master/easybuild/easyblocks/).

Note that you shouldn't concern yourself too much with getting the location of an easyblock right, as long as you
use ``--include-easyblocks`` to make EasyBuild use additional or customised easyblocks
(see :ref:`include_easyblocks` for more information).


.. _implementing_easyblocks_structure:

Structure of an easyblock
-------------------------

The example below shows the overal structure of an easyblock:

.. code:: python

    from easybuild.framework.easyblock import EasyBlock
    from easybuild.tools.run import run_cmd

    class EB_Example(EasyBlock):
        """Custom easyblock for Example"""

        def configure_step(self):
            """Custom implementation of configure step for Example"""

            # run configure.sh to configure the build
            run_cmd("./configure.sh --install-prefix=%s" % self.installdir)


Each easyblock includes an implementation of a ``class`` that (directly or indirectly) derives from the abstract
``EasyBlock`` class.

Typically some useful functions provided by the EasyBuild framework are imported at the top of the Python module.

In the class definition, one or more '``*_step``' methods are redefined, to implement the corresponding step
in the build and installation procedure.

Each easyblock *must* implement the ``configure``, ``build`` and ``install`` steps, since these are not implemented
in the abstract ``EasyBlock`` class. This could be done explicitly by redefining the corresponding ``*_step`` methods,
or implicitly by deriving from existing (generic) easyblocks.


.. _implementing_easyblocks_deriving:

Deriving from existing (generic) easyblocks
-------------------------------------------

When implementing an easyblock, it is common to derive from an existing (usually generic) easyblock,
and to leverage the functionality provided by it. This approach is typically used when only a specific part
of the build and installation procedure needs to be customised.

In the (fictitious) example below, we derive from the generic ``ConfigureMake`` easyblock to redefine the ``configure``
step. In this case, we are *extending* the ``configure`` step as implemented by ``ConfigureMake`` rather than
redefining it entirely, since we call out to the original ``configure_step`` method at the end.

.. code:: python

    from easybuild.easyblocks.generic.configuremake import ConfigureMake
    from easybuild.tools.filetools import copy_file

    class EB_Example(ConfigureMake):
        """Custom easyblock for Example"""

        def configure_step(self):
            """Custom implementation of configure step for Example"""

            # use example make.cfg for x86-64
            copy_file('make.cfg.x86', 'make.cfg')

            # call out to original configure_step implementation of ConfigureMake easyblock
            super(EB_Example, self).configure_step()


.. _implementing_easyblocks_specifics:

Specific aspects of easyblocks
------------------------------

.. _implementing_easyblocks_default_parameters:

Default easyconfig parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All of the parameters which are "set" in an easyconfig file (see :ref:`vsd_avail_easyconfig_params`)
become key-value pairs in the ``self.cfg`` dictionary.  For instance, where the easyconfig file might
specify

.. code:: python

  name = 'example'
  version = '2.5.3'
  versionsuffix = '-Python-3.7.4'

you could access these within an easyblock via

.. code:: python

  ec_name = self.cfg['name']
  ec_ver = self.cfg['version']
  ec_suffix = self.cfg['versionsuffix']

For these particular "universal" arguments, this mapping is done for you in the ``EasyBlock`` base
class and generic subclasses, so most easyconfig parameters are directly available as local Python
variables (``name``, ``version``, etc.).

Some variables, and in particular :ref:`custom parameters
<implementing_easyblocks_custom_parameters>` which you define for your own easyblock, will not be
automatically mapped.  You will need to use ``self.cfg`` to access them in your code.


.. _implementing_easyblocks_custom_parameters:

Custom easyconfig parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In an easyblock, additional custom easyconfig parameters can be defined to steer the behaviour of the easyblock.
This is done via the ``extra_options`` static method. Custom parameters can be defined to be mandatory or optional.

The example below shows how this can be implemented:

.. code:: python

    from easybuild.easyblocks.generic.configuremake import ConfigureMake
    from easybuild.framework.easyconfig import CUSTOM, MANDATORY

    class EB_Example(ConfigureMake):
        """Custom easyblock for Example"""

        @staticmethod
        def extra_options():
            """Custom easyconfig parameters for Example"""
            extra_vars = {
                'required_example_param': [None, "Help text for required example custom parameter", MANDATORY],
                'optional_example_param': [None, "Help text for (optional) example custom parameter", CUSTOM],
            }
            return ConfigureMake.extra_options(extra_vars)

The first element in the list of a defined custom parameter corresponds to the default value for that parameter
(both ``None`` in the example above). The second element provides some informative help text, and the last element
indicates whether the parameter is mandatory (``MANDATORY``) or just a custom parameter (``CUSTOM``).


.. _implementing_easyblocks_constructor:

Easyblock constructor
~~~~~~~~~~~~~~~~~~~~~

In the ``class`` constructor of the easyblock, i.e. the ``__init__`` method, one or more class variables
can be initialised. These can be used for sharing information between different ``*_step`` methods in the easyblock.

For example:

.. code:: python

    from easybuild.framework.easyblock import EasyBlock

    class EB_Example(EasyBlock):
        """Custom easyblock for Example"""

        def __init__(self, *args, **kwargs):
            """Constructor for Example easyblock, initialises class variables."""

            # call out to original constructor first, so 'self' (i.e. the class instance) is initialised
            super(EB_Example, self).__init__(*args, **kwargs)

            # initialise class variables
            self.var1 = None
            self.var2 = None


.. _implementing_easyblocks_files:

Reading/writing/copying/patching files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

File manipulation is a common use case for implementing easyblocks, hence the EasyBuild framework provides a
number of useful functions related to this, including:

* ``read_file(<path>)``: read file at a specified location and returns its contents

* ``write_file(<path>, <text>)`` at a specified location with provided contents;
  to append to an existing file, use ``append=True`` as an extra argument

* ``copy_file(<src>, <dest>)`` to copy an existing file

* ``apply_regex_substitutions(<path>, <list of regex substitutions>)`` to patch an existing file

All of these functions are provided by the ``easybuild.tools.filetools`` module.


.. _implementing_easyblocks_commands:

Executing (interactive) shell commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For executing shell commands two functions are provided by the ``easybuild.tools.run`` module:

* ``run_cmd(<cmd>)`` to run a non-interactive shell command

* ``run_cmd_qa(<cmd>, <dict with questions & answers>)`` to run an interactive shell command

Both of these accept a number of optional arguments:

* ``simple=True`` to just return ``True`` or ``False`` to indicate a successful execution,
  rather than the default return value, i.e., a tuple that provides the command output and the exit code (in that order)

* ``path=<path>`` to run the command in a specific subdirectory

The ``run_cmd_qa`` function takes two additional specific arguments:

* ``no_qa=<list>`` to specify a list of patterns to recognize non-questions

* ``std_qa=<dict>`` to specify patterns for common questions and the matching answer


.. _implementing_easyblocks_environment:

Manipulating the environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To (re)define environment variables, the ``setvar`` function provided by the ``easybuild.tools.environment`` module
should be used.

This makes sure that the changes being made to the specified environment variable are kept track of,
and that they are handled correctly under ``--extended-dry-run``.


.. _implementing_easyblocks_logging:

Log statements
~~~~~~~~~~~~~~

It is good practice to include meaningful log messages in the ``*_step`` methods being customised in the easyblock,
to enrich the build log with useful information for later debugging or diagnostics.

For logging, the provided ``self.log`` logger class should be used, i.e. the ``self.log.info`` or ``self.log.debug``
methods should be called.


.. _implementing_easyblocks_sanity_check:

Custom (default) sanity check
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For software-specific easyblocks, a custom sanity check is usually included to verify that the installation was
successful or not.

This is done by redefining the ``sanity_check_step`` method in the easyblock. For example:

.. code:: python

    from easybuild.framework.easyblock import EasyBlock

    class EB_Example(EasyBlock):
        """Custom easyblock for Example"""

        def sanity_check_step(self):
            """Custom sanity check for Example."""

            custom_paths = {
                'files': ['bin/example'],
                'dirs': [],
            }
            custom_commands = ['example --version']

            # call out to parent to do the actual sanity checking, pass through custom paths and commands
            super(EB_Example, self).sanity_check_step(custom_paths=custom_paths, custom_commands=custom_commands)


You can both specify file path and subdirectories to check for, which are specified relative to the installation directory,
as well as simple commands that should execute successfully after completing the installation and loading the generated module file.

Note that it is up to you how extensive you make the sanity check, but it is recommended to make the check as complete
as possible to catch any potential build or installation problems that may occur.


.. _implementing_easyblocks_version_specific:

Version-specific parts
~~~~~~~~~~~~~~~~~~~~~~

In some case, version-specific actions or checks need to be included in an easyblock.
For this, it is recommended to use ``LooseVersion`` rather than directly comparing version numbers using string values.

For example:


.. code:: python

    from distutils.version import LooseVersion

    from easybuild.framework.easyblock import EasyBlock

    class EB_Example(EasyBlock):
        """Custom easyblock for Example"""

        def sanity_check_step(self):
            """Custom sanity check for Example."""

            custom_paths = {
                'files': [],
                'dirs': [],
            }

            # in older version, the binary used to be named 'EXAMPLE' rather than 'example'
            if LooseVersion(self.version) < LooseVersion('1.0'):
                custom_paths['files'].append('bin/EXAMPLE')
            else:
                custom_paths['files'].append('bin/example')

            super(EB_Example, self).sanity_check_step(custom_paths=custom_paths)


.. _implementing_easyblocks_module_only_compatibility:

Compatibility with ``--extended-dry-run``/``-x`` and ``--module-only``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some special care must be taken to ensure that an easyblock is fully compatible with ``--extended-dry-run`` / ``-x``
(see :ref:`extended_dry_run`) and ``--module-only`` (see :ref:`module_only`).

For ``--extended-dry-run``/``-x``, this is already well covered at :ref:`extended_dry_run_guidelines_easyblocks_detect_dry_run`.

For ``--module-only``, you should make sure that both the ``make_module_step``, including the ``make_module_*`` submethods,
and the ``sanity_check_step`` methods do not make any assumptions about the presence of certain environment variables
or that class variables have been defined already.

This needs to be handled with care since under ``--module-only`` the large majority of the ``*_step`` functions is
simply skipped entirely. So, if the ``configure_step`` method is responsible for defining class variables that are
picked up in ``sanity_check_step``, the latter may run into unexpected initial values like ``None``.
A possible workaround is to define a separate custom method to define the class variables, and to call out to this
method from ``configure_step`` and ``sanity_check_step`` (for the latter, conditionally, i.e., only if the class
variables still have the initial values).


.. _implementing_easyblocks_using:

Using new/custom easyblocks
---------------------------

The best way to make EasyBuild aware of new or customized easyblocks is via ``--include-easyblocks``,
see :ref:`include_easyblocks` for more information.

To verify that your easyblocks are indeed picked up correctly, you can use ``--list-easyblocks=detailed``,
see also :ref:`list_easyblocks`.


.. _implementing_easyblocks_testing:

Testing easyblocks
------------------

Before testing your easyblock implementation by actually building and installing the software package(s) it
was implemented for, it is recommended to:

* study the output produced by ``--extended-dry-run``/``-x``
* evaluate the generated module file that is obtained by using ``--module-only --force``

For the output of ``--extended-dry-run``/``-x``, there should be no ignored errors (cfr. :ref:`extended_dry_run_notes_ignored_errors`),
that is the end of the output produced should include this message:

.. code::

  (no ignored errors during dry run)


With ``--module-only --force``, the easyblock complete successfully without crashing, and should generate a module
file that includes everything that is expected (except for statements that require that the actual installation was
performend).


.. _implementing_easyblocks_use_case_tensorlow:

Use case: an easyblock for Tensorflow
-------------------------------------

*(work in progress)*
