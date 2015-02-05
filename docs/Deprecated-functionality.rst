.. _deprecated:

Deprecated functionality
========================

Some of the functionality that was available in previous EasyBuild versions is *deprecated*, and should no longer be used.

This page describes the :ref:`deprecation policy <deprecation_policy>` in EasyBuild, explains how to easily :ref:`check
whether you are still relying on deprecated functionality <how_to_check_use_of_deprecated_functionality>`, and provides
an :ref:`overview of currently deprecated functionality <overview_deprecated>`, together with available alternatives.

.. _deprecation_policy:

Deprecation policy
------------------

With every EasyBuild release, we try very hard to maintain *backward compatibility*. That is, EasyBuild version ``X.Y``
should still build software packages that could be built with EasyBuild version ``X.(Y-1)``, without requiring
modifications to the used easyconfig file or easyblock.

However, every now and then a breaking change needs to be made to EasyBuild, because of design decisions or to resolve
mistakes that were made in the past. These changes involve *deprecating* the behaviour or functionality we want to get
rid of, together with supporting a better alternative.

**Deprecating functionaliy:**

* using a ``log.deprecated("msg", 'X.Y')`` statement in EasyBuild version ``X.(Y-n)`` a certain block of code is tagged
  as *deprecated*, indicating that the corresponding functionality will no longer be supported in EasyBuild version
  ``X.Y``; for example, to deprecate the use of the ``makeopts`` easyconfig parameter with EasyBuild v2.0::

    if self.cfg['makeopts']:
        self.log.deprecated("Easyconfig parameter 'makeopts' is deprecated, use 'buildopts' instead", '2.0')

* until EasyBuild version ``X.Y``, the deprecation log message will manifest itself as a *warning*, highlighting the use
  of deprecated functionality; for example::

    == 2014-12-16 16:29:07,906 main.easyconfig.easyconfig WARNING Deprecated functionality, will no longer work in v2.0:
    Easyconfig parameter 'makeopts' is deprecated, use 'buildopts' instead;
    see http://easybuild.readthedocs.org/en/latest/Deprecated-functionality.html for more information

**Removing support for deprecated behavior:**

* starting with EasyBuild version ``X.Y``, the deprecation log message will result in an *error*,
  indicating that the deprecated behavior is no longer supported; for example::

    ERROR: EasyBuild encountered an exception (at easybuild/framework/easyconfig/easyconfig.py:937 in process_easyconfig):
    Failed to process easyconfig /home/example/gzip-1.5-goolf-1.4.10.eb:
    DEPRECATED (since v2.0) functionality used: Easyconfig parameter 'makeopts' is deprecated, use 'buildopts' instead;
    see http://easybuild.readthedocs.org/en/latest/Deprecated-functionality.html for more informatio

* the code supporting the deprecated functionality is *removed* in EasyBuild version ``X.(Y+1)`` (i.e., the first
  non-bugfix-only release after version ``X.Y``)

* until EasyBuild version ``X.(Y+1)``, the code supporting the deprecated functionality will still be available; using
  the ``--deprecated`` command line option (or, equivalently, the ``$EASYBUILD_DEPRECATED`` environment variable), the
  deprecated functionality can be reactivated by specifying a *lower* version; for example, to avoid running into an
  error with EasyBuild v2.0 for functionality that was deprecated for EasyBuild v2.0::

    eb gzip-1.5-goolf-1.4.10.eb --deprecated=1.0


.. _how_to_check_use_of_deprecated_functionality:

How to check for use of deprecated functionality
------------------------------------------------

Since EasyBuild v1.16.0, the ``--deprecated`` command line option can be used to check whether deprecated behavior is
still being triggered in your EasyBuild setup.

For example, using ``--deprecated=2.0`` in EasyBuild v1.x will transform any deprecation warning for functionality that
will no longer be supported in EasyBuild v2.0 into an error message. For example::

  $ eb OpenMPI-1.8.1-GCC-4.8.3.eb --deprecated=2.0
  == temporary log file in case of crash /tmp/easybuild-WWalWX/easybuild-aoL9Nd.log
  ERROR: EasyBuild encountered an exception (at easybuild/framework/easyconfig/easyconfig.py:945 in process_easyconfig):
  Failed to process easyconfig /home/example/work/easybuild-easyconfigs/easybuild/easyconfigs/o/OpenMPI/OpenMPI-1.8.1-GCC-4.8.3.eb:
  DEPRECATED (since v2.0) functionality used: Magic 'global' easyconfigs variables like shared_lib_ext should no longer
  be used; see http://easybuild.readthedocs.org/en/latest/Deprecated-functionality.html for more information


.. tip:: Define ``deprecated`` to the next major EasyBuild version in one of your EasyBuild configuration files
         (see :ref:`configuration_file`) or by defining ``$EASYBUILD_DEPRECATED=2.0``, to ensure you are made aware
         of deprecated behavior as early as possible.

         You can (temporarily) still rely on the deprecated functionality by
         specifying a *lower* version via ``--deprecated`` to overrule that setting, until the
         functionality is actually disabled.

.. _overview_deprecated:

Overview of deprecated functionality
------------------------------------

For EasyBuild users:

* :ref:`python_version_compatibility`
* :ref:`easybuild_configuration`
* :ref:`softroot_version_env_vars`

For authors of easyconfig files:

* :ref:`ConfigureMake_fallback`
* :ref:`easyconfig_parameters`
* :ref:`mrbayes_beagle`

For developers of easyblocks:

* :ref:`easyblocks_API`
* :ref:`renamed_relocated_functions`
* :ref:`changes_generic_easyblocks`

For EasyBuild framework developers:

* :ref:`easybuild_tools_modules`

.. _python_version_compatibility:

Python version compatibility
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Compatibility with Python 2.4 is deprecated.**

* *deprecated since:* EasyBuild v1.14.0 (July'14)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: **upgrade to Python v2.6.x or v2.7.x**

Ever since EasyBuild v1.0, the codebase has been Python 2.4 compatible. One reason for this is that EasyBuild was
being used on a daily basis on Scientific Linux 5, in which the Python 2.4.x is the system default.

Starting with EasyBuild v2.0 we will drop support for Python 2.4, and only ensure compatibility with Python 2.6.x or a
more recent Python 2.x.

This will enable us to gradually also make the codebase compatible with Python 3.x, which is difficult to do without
dropping support for Python 2.4.

.. _easybuild_configuration:

EasyBuild configuration
~~~~~~~~~~~~~~~~~~~~~~~

**Old-style EasyBuild configuration is deprecated.**

* *deprecated since:* EasyBuild v1.3.0 (Apr'13)
* *no longer supported starting*: EasyBuild v2.0
* *alternatives:* **new-style configuration** (see :ref:`configuring_easybuild`)

Early versions of EasyBuild v1.x provided support for configuring EasyBuild via a *Python module* that was automagically
executed when available.

Since EasyBuild v1.3 a safer and more consistent way of configuring EasyBuild is supported, which aligns the EasyBuild
command line options, ``$EASYBUILD_X`` environment variables and key-value style configuration files.

More information about the new(er) and recommended configuration style is available :ref:`here <configuring_easybuild>`.

For detailed information with respect to porting from the old to the new configuration style, see
:ref:`configuring_easybuild_legacy`.

Location of default configuration file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**The default configuration file location** ``$HOME/.easybuild/config.cfg`` **is deprecated.**

* *deprecated since:* EasyBuild v1.11.0 (Feb'14)
* *no longer supported starting*: EasyBuild v2.0
* *alternatives:* ``$XDG_CONFIG_HOME/easybuild/config.cfg`` (equivalent to ``$HOME/.config/easybuild/config.cfg``)

The default path for the new-style configuration path is ``$XDG_CONFIG_HOME/easybuild/config.cfg`` (or
``$HOME/.config/easybuild/config.cfg`` if ``$XDG_CONFIG_HOME`` is not set), see :ref:`list_of_configuration_files`.

The previous default path ``$HOME/.easybuild/config.cfg`` that was in place since EasyBuild v1.3.0 is deprecated.

.. _ConfigureMake_fallback:

Automagic fallback to ``ConfigureMake``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**The automagic fallback to the** ``ConfigureMake`` **easyblock is deprecated.**

* *deprecated since:* EasyBuild v1.16.0 (Dec'14)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: specify ``easyblock = 'ConfigureMake'`` in easyconfig file

If the ``easyblock`` easyconfig was not specified, EasyBuild tries to find a matching easyblock based on the software
name. In EasyBuild v1.x, the generic ``ConfigureMake`` easyblock was used if no matching easyblock could be found.

This behavior is now deprecated; instead, easyconfigs that require using the ``ConfigureMake`` easyblock *must* include
the following::

  easyblock = 'ConfigureMake'

.. _easyconfig_parameters:

Easyconfig parameters
~~~~~~~~~~~~~~~~~~~~~

Options for build command
^^^^^^^^^^^^^^^^^^^^^^^^^

**Use of** ``premakeopts`` **or** ``makeopts`` **easyconfig parameters is deprecated.**

* *deprecated since:* EasyBuild v1.13.0 (May'14)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: use ``prebuildopts``/``buildopts`` instead

For consistency in terminology, use of the ``premakeopts`` and ``makeopts`` generic easyconfig parameters is deprecated,
in favor of their alternative parameters, ``prebuildopts`` and ``buildopts``, resp.

(see also :ref:`configure_build_install_command_options`)

.. note:: Since EasyBuild v1.13.0, ``buildopts`` will be automatically defined with the value of ``makeopts``, unless
  ``buildopts`` was specified by itself. When both values are specified, ``buildopts`` takes precedence of ``makeopts``
  (analogous for ``prebuildopts``/``premakeopts``).

Shared library extension
^^^^^^^^^^^^^^^^^^^^^^^^

**Use of the** ``shared_lib_ext`` **'constant' in easyconfigs is deprecated.**

* *deprecated since:* EasyBuild v1.5.0 (June'13)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: use ``SHLIB_EXT`` instead

Using the ``shared_lib_ext`` "magic" variable representing the extension for shared libraries (``.so`` on Linux,
``.dylib`` on OS X) is deprecated; the easyconfig constant ``SHLIB_EXT`` should be using instead.

Software license
^^^^^^^^^^^^^^^^

**Use of the** ``license`` **easyconfig parameter is deprecated.**

* *deprecated since:* EasyBuild v1.11.0 (Feb'14)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: use ``license_file`` or ``software_license`` instead

The ``license`` easyconfig parameter, which was specific to the ``IntelBase`` generic easyblock and thus relevant
for Intel tools, is deprecated. The generic ``license_file`` easyconfig parameter should be used instead, to specify 
the location of the license file (or server).

This change was made to avoid confusion with the ``software_license`` generic easyconfig parameter, which can be used
to specify the license under which the software was released (e.g., GPLv2, BSD, etc.). Here, the specified value *must*
be a known license type (see ``eb --avail-easyconfig-licenses``).

.. note:: The `software_license` easyconfig parameter will become **mandatory** at some point.

.. _mrbayes_beagle:

``BEAGLE`` dependency in ``MrBayes`` easyblock replaced by ``beagle-lib``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**The** ``MrBayes`` **easyblock no longer considers** ``BEAGLE`` **as a valid dependency.**

* *deprecated since:* EasyBuild v1.6.0 (Jul'14)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: use ``beagle-lib`` instead

Due to a misnomer in the easyconfig files for ``beagle-lib`` (formerly named ``BEAGLE``), the custom easyblock for
``MrBayes`` now no longer considers ``BEAGLE`` as a dependency.

The library required by ``MrBayes`` must now be provided as a dependency named ``beagle-lib``.


EasyBuild API changes
~~~~~~~~~~~~~~~~~~~~~

Some changes in the EasyBuild API were made, which potentiallty affects easyblocks and the EasyBuild framework itself.

.. _easyblocks_API:

Easyblocks API (``EasyBlock`` class from ``easybuild.framework.easyblock``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The API for easyblocks was modified slightly, to correct for a couple of historic mistakes.

Return type of ``extra_options`` method
+++++++++++++++++++++++++++++++++++++++

**The list-of-tuples return type of the** ``extra_options`` **method is deprecated, should be a** ``dict`` **instead.**

* *deprecated since:* EasyBuild v1.12.0 (Apr'14)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: ensure/assume ``dict`` return type

The return type of the ``extra_options`` static method in the ``EasyBlock`` class has been changed to a *dictionary*
(``dict``), rather than a list of key-value tuples.

Custom easyconfig parameters should be added via a *dict*-typed value to the ``extra_options`` function of parent
easyblock.

For example (taken from the generic easyblock ``Binary``)::

      @staticmethod
      def extra_options(extra_vars=None):
          """Extra easyconfig parameters specific to Binary easyblock."""
          extra_vars = EasyBlock.extra_options(extra_vars)
          extra_vars.update({
              'install_cmd': [None, "Install command to be used.", CUSTOM],
          })
          return extra_vars

Extension filter template
+++++++++++++++++++++++++

**Use of the** ``name`` **and** ``version`` **templates in** ``exts_filter`` **is deprecated.**

* *deprecated since:* EasyBuild v1.2.0 (Feb'13)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: use ``ext_name`` and ``ext_version`` instead

Only the ``ext_name``, ``ext_version`` and ``src`` template strings can be used in the ``exts_filter`` extension filter
easyconfig parameter; using the ``name`` and ``version`` template strings is deprecated.

For example (default extension filter for Python packages)::

  exts_filter = ("python -c 'import %(ext_name)s'", "")

Module path of default class for extensions
+++++++++++++++++++++++++++++++++++++++++++

**Specifying the module path in** ``exts_defaultclass`` **is deprecated.**

* *deprecated since:* EasyBuild v0.5 (Apr'12)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: *(none required, module path is derived from specified class name)*

Explicitely specifying the module path for the default class to use for extensions (via ``exts_defaultclass``) is
deprecated. Only the class name should be specified, the corresponding module path is derived from it.

Module path for easyblocks
++++++++++++++++++++++++++

**Deriving the module path for easyblocks from the software name is deprecated.**

* *deprecated since:* EasyBuild v1.4.0 (May'13)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: use easyblock class name according to encoding scheme (e.g., ``EB_Foo``)

Determining the *location* of Python modules representing easyblocks based on the software name (``name``) is deprecated.

EasyBuild *must* be able to determine the easyblock module path solely based on the name of the easyblock Python class.

Easyblocks with a class name that is already honoring the encoding scheme implemented by the ``encode_class_name``
function will not be affected.

.. _easybuild_tools_modules:

``easybuild.tools.modules`` Python module
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**The API of the** ``easybuild.tools.modules`` **module has been updated, certain aspects of the old API are deprecated.**

* *deprecated since:* EasyBuild v1.8.0 (Oct'13) & v1.15.0 (Sept'15)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: use equivalents available in new API (see below)

The API of the ``easybuild.tools.modules`` Python module has been changed extensively when implementing support for
alternative module naming schemes:

* use of the ``modules`` class variable and the ``add_module``/``remove_module`` methods is deprecated; modules should be
  (un)loaded using the ``load`` and ``unload`` methods instead
* the ``mod_paths`` and ``modulePath`` named arguments for the ``run_module`` method are deprecated; the class instance
  should be created with a specific list of module paths instead
* using the ``Modules`` class to obtain a class instance representing a modules tool interface is deprecated;
  the ``modules_tool`` function should be used instead

Additionally, usage of the ``exists`` method which only takes a single module name is deprecated; it is replaced by
the ``exist`` method, which takes a list of module names *(since EasyBuild v1.15.0 (Sept'15))*.

**Easyblocks should not be using** ``easybuild.tools.modules`` **directly, and hence should be unaffected.**

.. _softroot_version_env_vars:

``$SOFTX`` environment variables in generated module files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``$SOFTX`` **environment variables set by module files generated with EasyBuild v0.x will no longer be taken into
account.**

* *deprecated since:* EasyBuild v1.3.0 (Apr'13)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: reinstall (ancient) module files which are only defining the ``$SOFTX`` environment variables

The ``get_software_root`` and ``get_software_version`` functions will only take ``$EBROOTFOO`` and ``$EBVERSIONFOO``
environment variables into account, as opposed to also considering the ``$SOFTROOTFOO`` and ``$SOFTVERSIONFOO``
environment variables (which were set in modules generated by EasyBuild v0.x).
Likewise, adhering to the ``$SOFTDEVELFOO`` environment variables is deprecated.

*This is only relevant to early adopters who are still using module files generated by EasyBuild v0.x.*

.. _renamed_relocated_functions:

Renamed/relocated functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Some functions/methods have been renamed or relocated, use via their previous location/name is deprecated.**

* *deprecated since:* *(depends on function/method, see below)*
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: use new location/name

A number of functions and methods that are part of the EasyBuild framework API have been renamed, mainly for consistency
reasons.

* the ``moduleGenerator`` handle to the ``ModuleGenerator`` object instance has been renamed to ``module_generator``;
  hence, easyblock should be using ``self.module_generator`` rather than ``self.moduleGenerator`` *(since EasyBuild v1.16.0 (Dec'14))*
* ``source_paths()`` (in ``easybuild.tools.config``) replaces the deprecated ``source_path()`` *(since EasyBuild v1.8.0 (Oct'13))*
* ``get_avail_core_count()`` (in ``easybuild.tools.systemtools``) replaces the deprecated ``get_core_count()``
  *(since EasyBuild v1.9.0 (Nov'13))*
* ``get_os_type()`` (in ``easybuild.tools.systemtools``) replaces the deprecated ``get_kernel_name``
  *(since EasyBuild v1.3.0 (Apr'13))*
* the ``det_full_ec_version`` function available from ``easybuild.tools.module_generator`` replaces the deprecated
  ``det_installversion`` function that was available from ``easybuild.framework.easyconfig.*`` *(since EasyBuild v1.8.0
  (Oct'13))*

Some functions have moved to a different location:

* the ``read_environment`` function is now provided by the ``easybuild.tools.environment`` module, rather than by
  ``easybuild.tools.config`` or ``easybuild.tools.utilities`` *(since EasyBuild v1.7.0 (Sept'13))*
* the ``modify_env`` function is now provided by the ``easybuild.tools.environment`` module, rather than by
  ``easybuild.tools.filetools`` *(since EasyBuild v1.7.0 (Sep'13))*
* the ``run_cmd``, ``run_cmd_qa`` and ``parse_log_for_error`` functions are now provided by the ``easybuild.tools.run`` module,
  rather than by ``easybuild.tools.filetools`` *(since EasyBuild v1.11.0 (Feb'14))*

The ``get_log`` function provided by the ``easybuild.tools.build_log`` module has been deprecated entirely,
no alternatives are provided (since none are needed). *(since EasyBuild v1.3.0 (Apr'13))*

.. _changes_generic_easyblocks:

Changes in (generic) easyblocks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``srcdir`` replaces ``builddir`` as named argument in ``CMakeMake.configure_step``
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**The named argument** ``builddir`` **in the** ``configure_step`` **method of the generic** ``CMakeMake`` **easyblock
was replaced by** ``srcdir`` **.**

* *deprecated since:* EasyBuild v1.4.0 (May'13)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: equivalent ``srcdir`` named argument

Since the ``builddir`` named argument in the ``configure_step`` method of the generic ``CMakeMake`` easyblock was a
misnomer (it specifies the location of the *source* directory that should be provided to ``cmake``), it was replaced
with an equivalent named argument ``srcdir``.

``VersionIndependentPythonPackage`` replaces ``VersionIndependendPythonPackage``
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**The generic easyblock** ``VersionIndependendPythonPackage`` **was replaced with the equivalent generic easyblock**
``VersionIndependentPythonPackage`` **.**

* *deprecated since:* EasyBuild v1.11.0 (Feb'14)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: ``VersionIndependentPythonPackage``

Because of to a typo in the name, the ``VersionIndependendPythonPackage`` generic easyblock was replaced by the
equivalent ``VersionIndependentPythonPackage`` generic easyblock.

``get_sitearch_suffix`` function in ``Perl`` easyblock is removed
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**The** ``get_sitearch_suffix`` **function in the** ``Perl`` **easyblock was replaced in favor of the more generic**
``get_site_suffix`` **function.**

* *deprecated since:* EasyBuild v1.7.0 (Sept'13)
* *no longer supported in:* EasyBuild v2.0
* *alternative(s)*: ``get_site_suffix('sitearch')``

The ``get_sitearch_suffix`` function provided by the ``Perl`` easyblock, which can be (and is) imported in/used by other
easyblocks, has been replaced by the more generic ``get_site_suffix`` function.

To obtain the same functionality as was provided by ``get_sitearch_suffix``, use ``get_site_suffix('sitearch')`` instead.
