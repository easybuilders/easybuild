.. _removed_functionality:

Removed functionality
=====================

Some of the functionality that was available in previous EasyBuild versions is now *removed*,
after it was deprecated first in an earlier EasyBuild version (see :ref:`deprecation_policy`).

.. _overview_removed_20:

Overview of removed functionality since EasyBuild v2.0
-------------------------------------------------------

In EasyBuild v2.0, some intrusive changes were made that break backward compatibility with EasyBuild v1.x.

For EasyBuild users:

* :ref:`depr_python_version_compatibility_eb1`
* :ref:`depr_easybuild_configuration_eb1`
* :ref:`depr_softroot_version_env_vars_eb1`

For authors of easyconfig files:

* :ref:`depr_ConfigureMake_fallback_eb1`
* :ref:`depr_easyconfig_parameters_eb1`
* :ref:`depr_mrbayes_beagle_eb1`

For developers of easyblocks:

* :ref:`depr_easyblocks_API_eb1`
* :ref:`depr_renamed_relocated_functions_eb1`
* :ref:`depr_changes_generic_easyblocks_eb1`

For EasyBuild framework developers:

* :ref:`depr_easybuild_tools_modules_eb1`

.. note::
    A script ``fix-broken-easyconfigs.py`` is provided to fix easyconfig files that were broken by the
    backward-incompatible changes documented at :ref:`depr_ConfigureMake_fallback_eb1` and
    :ref:`depr_easyconfig_parameters_eb1`. See :ref:`fix_broken_easyconfigs_script` for more information.

.. _depr_python_version_compatibility_eb1:

Python version compatibility
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Compatibility with Python 2.4 is removed.**

* *deprecated since:* EasyBuild v1.14.0 (July'14)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: **upgrade to Python v2.6.x or v2.7.x**

Ever since EasyBuild v1.0, the codebase has been Python 2.4 compatible. One reason for this is that EasyBuild was
being used on a daily basis on Scientific Linux 5, in which the Python 2.4.x is the system default.

Starting with EasyBuild v2.0 support for Python 2.4 is removed, and only ensure compatibility with Python 2.6.x or a
more recent Python 2.x.

This will enable us to gradually also make the codebase compatible with Python 3.x, which is difficult to do without
removing support for Python 2.4.

.. _depr_easybuild_configuration_eb1:

EasyBuild configuration
~~~~~~~~~~~~~~~~~~~~~~~

**Old-style EasyBuild configuration is removed.**

* *deprecated since:* EasyBuild v1.3.0 (Apr'13)
* *removed in*: EasyBuild v2.0
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

**The default configuration file location** ``$HOME/.easybuild/config.cfg`` **is no longer considered.**

* *deprecated since:* EasyBuild v1.11.0 (Feb'14)
* *removed in*: EasyBuild v2.0
* *alternatives:* ``$XDG_CONFIG_HOME/easybuild/config.cfg`` (equivalent to ``$HOME/.config/easybuild/config.cfg``)

The default path for the new-style configuration path is ``$XDG_CONFIG_HOME/easybuild/config.cfg`` (or
``$HOME/.config/easybuild/config.cfg`` if ``$XDG_CONFIG_HOME`` is not set), see :ref:`list_of_configuration_files`.

The previous default path ``$HOME/.easybuild/config.cfg`` that was in place since EasyBuild v1.3.0 is no longer
considered.

.. _depr_ConfigureMake_fallback_eb1:

Automagic fallback to ``ConfigureMake``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**The automagic fallback to the** ``ConfigureMake`` **easyblock is removed.**

* *deprecated since:* EasyBuild v1.16.0 (Dec'14)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: specify ``easyblock = 'ConfigureMake'`` in easyconfig file

If the ``easyblock`` easyconfig was not specified, EasyBuild tries to find a matching easyblock based on the software
name. In EasyBuild v1.x, the generic ``ConfigureMake`` easyblock was used if no matching easyblock could be found.

This behavior is now removed; instead, easyconfigs that require using the ``ConfigureMake`` easyblock *must* include
the following::

  easyblock = 'ConfigureMake'

.. _depr_easyconfig_parameters_eb1:

Easyconfig parameters
~~~~~~~~~~~~~~~~~~~~~

Some easyconfig parameters are removed.

.. note::
  A script is available to fix easyconfig files that are broken because they still rely on this functionality,
  see :ref:`fix_broken_easyconfigs_script`.

.. _depr_premakeopts_makeopts_eb1:

Options for build command
^^^^^^^^^^^^^^^^^^^^^^^^^

**The** ``premakeopts`` **and** ``makeopts`` **easyconfig parameters are removed.**

* *deprecated since:* EasyBuild v1.13.0 (May'14)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: use ``prebuildopts``/``buildopts`` instead

For consistency in terminology, the ``premakeopts`` and ``makeopts`` generic easyconfig parameters are removed,
in favor of their alternative parameters, ``prebuildopts`` and ``buildopts``, resp.

(see also :ref:`configure_build_install_command_options`)

.. note:: Since EasyBuild v1.13.0, ``buildopts`` is automatically defined with the value of ``makeopts``, unless
  ``buildopts`` was specified by itself. When both values are specified, ``buildopts`` takes precedence of ``makeopts``
  (analogous for ``prebuildopts``/``premakeopts``).

.. _depr_shared_lib_ext_eb1:

Shared library extension
^^^^^^^^^^^^^^^^^^^^^^^^

**The** ``shared_lib_ext`` **'constant' in easyconfigs is no longer defined.**

* *deprecated since:* EasyBuild v1.5.0 (June'13)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: use ``SHLIB_EXT`` instead

The ``shared_lib_ext`` "magic" variable representing the extension for shared libraries (``.so`` on Linux,
``.dylib`` on OS X) is no longer defined; the easyconfig constant ``SHLIB_EXT`` should be using instead.

.. _depr_license_eb1:

Software license
^^^^^^^^^^^^^^^^

**The** ``license`` **easyconfig parameter is removed.**

* *deprecated since:* EasyBuild v1.11.0 (Feb'14)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: use ``license_file`` or ``software_license`` instead

The ``license`` easyconfig parameter, which was specific to the ``IntelBase`` generic easyblock and thus relevant
for Intel tools, is removed. The generic ``license_file`` easyconfig parameter should be used instead, to specify 
the location of the license file (or server).

This change was made to avoid confusion with the ``software_license`` generic easyconfig parameter, which can be used
to specify the license under which the software was released (e.g., GPLv2, BSD, etc.). Here, the specified value *must*
be a known license type (see ``eb --avail-easyconfig-licenses``).

.. note:: The `software_license` easyconfig parameter will become **mandatory** at some point.

.. _depr_mrbayes_beagle_eb1:

``BEAGLE`` dependency in ``MrBayes`` easyblock replaced by ``beagle-lib``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**The** ``MrBayes`` **easyblock no longer considers** ``BEAGLE`` **as a valid dependency.**

* *deprecated since:* EasyBuild v1.6.0 (Jul'14)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: use ``beagle-lib`` instead

Due to a misnomer in the easyconfig files for ``beagle-lib`` (formerly named ``BEAGLE``), the custom easyblock for
``MrBayes`` now no longer considers ``BEAGLE`` as a dependency.

The library required by ``MrBayes`` must now be provided as a dependency named ``beagle-lib``.


EasyBuild API changes
~~~~~~~~~~~~~~~~~~~~~

Some changes in the EasyBuild API were made, which potentiallty affects easyblocks and the EasyBuild framework itself.

.. _depr_easyblocks_API_eb1:

Easyblocks API (``EasyBlock`` class from ``easybuild.framework.easyblock``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The API for easyblocks was modified slightly, to correct for a couple of historic mistakes.

Return type of ``extra_options`` method
+++++++++++++++++++++++++++++++++++++++

**The list-of-tuples return type of the** ``extra_options`` **method must now be a** ``dict`` **instead.**

* *deprecated since:* EasyBuild v1.12.0 (Apr'14)
* *removed in:* EasyBuild v2.0
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

**The** ``name`` **and** ``version`` **templates in** ``exts_filter`` **are removed.**

* *deprecated since:* EasyBuild v1.2.0 (Feb'13)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: use ``ext_name`` and ``ext_version`` instead

Only the ``ext_name``, ``ext_version`` and ``src`` template strings can be used in the ``exts_filter`` extension filter
easyconfig parameter; the ``name`` and ``version`` template strings are removed.

For example (default extension filter for Python packages)::

  exts_filter = ("python -c 'import %(ext_name)s'", "")

Module path of default class for extensions
+++++++++++++++++++++++++++++++++++++++++++

**Specifying the module path in** ``exts_defaultclass`` **is no longer possible.**

* *deprecated since:* EasyBuild v0.5 (Apr'12)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: *(none required, module path is derived from specified class name)*

Explicitely specifying the module path for the default class to use for extensions (via ``exts_defaultclass``) is
no longer possible. Only the class name should be specified, the corresponding module path is derived from it.

Module path for easyblocks
++++++++++++++++++++++++++

**Deriving the module path for easyblocks from the software name is removed.**

* *deprecated since:* EasyBuild v1.4.0 (May'13)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: use easyblock class name according to encoding scheme (e.g., ``EB_Foo``)

Determining the *location* of Python modules representing easyblocks based on the software name (``name``) is removed.

EasyBuild *must* be able to determine the easyblock module path solely based on the name of the easyblock Python class.

Easyblocks with a class name that is already honoring the encoding scheme implemented by the ``encode_class_name``
function will not be affected.

.. _depr_easybuild_tools_modules_eb1:

``easybuild.tools.modules`` Python module
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**The API of the** ``easybuild.tools.modules`` **module has been updated, certain aspects of the old API are removed.**

* *deprecated since:* EasyBuild v1.8.0 (Oct'13) & v1.15.0 (Sept'15)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: use equivalents available in new API (see below)

The API of the ``easybuild.tools.modules`` Python module has been changed extensively when implementing support for
alternative module naming schemes:

* the ``modules`` class variable and the ``add_module``/``remove_module`` methods are removed; modules should be
  (un)loaded using the ``load`` and ``unload`` methods instead
* the ``mod_paths`` and ``modulePath`` named arguments for the ``run_module`` method aare removed; the class instance
  should be created with a specific list of module paths instead
* the ``Modules`` class to obtain a class instance representing a modules tool interface is removed;
  the ``modules_tool`` function should be used instead

Additionally, the ``exists`` method which only takes a single module name is removed; it is replaced by
the ``exist`` method, which takes a list of module names *(since EasyBuild v1.15.0 (Sept'15))*.

**Easyblocks should not be using** ``easybuild.tools.modules`` **directly, and hence should be unaffected.**

.. _depr_softroot_version_env_vars_eb1:

``$SOFTX`` environment variables in generated module files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``$SOFTX`` **environment variables set by module files generated with EasyBuild v0.x will no longer be taken into
account.**

* *deprecated since:* EasyBuild v1.3.0 (Apr'13)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: reinstall (ancient) module files which are only defining the ``$SOFTX`` environment variables

The ``get_software_root`` and ``get_software_version`` functions will only take ``$EBROOTFOO`` and ``$EBVERSIONFOO``
environment variables into account, as opposed to also considering the ``$SOFTROOTFOO`` and ``$SOFTVERSIONFOO``
environment variables (which were set in modules generated by EasyBuild v0.x).
Likewise, adhering to the ``$SOFTDEVELFOO`` environment variables is removed.

*This is only relevant to early adopters who are still using module files generated by EasyBuild v0.x.*

.. _depr_renamed_relocated_functions_eb1:

Renamed/relocated functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Some functions/methods have been renamed or relocated, their equivalents under a previous location/name are removed.**

* *deprecated since:* *(depends on function/method, see below)*
* *removed in:* EasyBuild v2.0
* *alternative(s)*: use new location/name

A number of functions and methods that are part of the EasyBuild framework API have been renamed, mainly for consistency
reasons.

* the ``moduleGenerator`` handle to the ``ModuleGenerator`` object instance has been renamed to ``module_generator``;
  hence, easyblock should be using ``self.module_generator`` rather than ``self.moduleGenerator`` *(since EasyBuild v1.16.0 (Dec'14))*
* ``source_paths()`` (in ``easybuild.tools.config``) replaces the removed ``source_path()`` *(since EasyBuild v1.8.0 (Oct'13))*
* ``get_avail_core_count()`` (in ``easybuild.tools.systemtools``) replaces the removed ``get_core_count()``
  *(since EasyBuild v1.9.0 (Nov'13))*
* ``get_os_type()`` (in ``easybuild.tools.systemtools``) replaces the removed ``get_kernel_name``
  *(since EasyBuild v1.3.0 (Apr'13))*
* the ``det_full_ec_version`` function available from ``easybuild.tools.module_generator`` replaces the removed
  ``det_installversion`` function that was available from ``easybuild.framework.easyconfig.*`` *(since EasyBuild v1.8.0
  (Oct'13))*

Some functions have moved to a different location:

* the ``read_environment`` function is now provided by the ``easybuild.tools.environment`` module, rather than by
  ``easybuild.tools.config`` or ``easybuild.tools.utilities`` *(since EasyBuild v1.7.0 (Sept'13))*
* the ``modify_env`` function is now provided by the ``easybuild.tools.environment`` module, rather than by
  ``easybuild.tools.filetools`` *(since EasyBuild v1.7.0 (Sep'13))*
* the ``run_cmd``, ``run_cmd_qa`` and ``parse_log_for_error`` functions are now provided by the ``easybuild.tools.run`` module,
  rather than by ``easybuild.tools.filetools`` *(since EasyBuild v1.11.0 (Feb'14))*

The ``get_log`` function provided by the ``easybuild.tools.build_log`` module has been removed entirely,
no alternatives are provided (since none are needed). *(since EasyBuild v1.3.0 (Apr'13))*

.. _depr_changes_generic_easyblocks_eb1:

Changes in (generic) easyblocks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``srcdir`` replaces ``builddir`` as named argument in ``CMakeMake.configure_step``
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**The named argument** ``builddir`` **in the** ``configure_step`` **method of the generic** ``CMakeMake`` **easyblock
was replaced by** ``srcdir`` **.**

* *deprecated since:* EasyBuild v1.4.0 (May'13)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: equivalent ``srcdir`` named argument

Since the ``builddir`` named argument in the ``configure_step`` method of the generic ``CMakeMake`` easyblock was a
misnomer (it specifies the location of the *source* directory that should be provided to ``cmake``), it was replaced
with an equivalent named argument ``srcdir``.

``VersionIndependentPythonPackage`` replaces ``VersionIndependendPythonPackage``
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**The generic easyblock** ``VersionIndependendPythonPackage`` **was replaced with the equivalent generic easyblock**
``VersionIndependentPythonPackage`` **.**

* *deprecated since:* EasyBuild v1.11.0 (Feb'14)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: ``VersionIndependentPythonPackage``

Because of to a typo in the name, the ``VersionIndependendPythonPackage`` generic easyblock was replaced by the
equivalent ``VersionIndependentPythonPackage`` generic easyblock.

``get_sitearch_suffix`` function in ``Perl`` easyblock is removed
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**The** ``get_sitearch_suffix`` **function in the** ``Perl`` **easyblock was replaced in favor of the more generic**
``get_site_suffix`` **function.**

* *deprecated since:* EasyBuild v1.7.0 (Sept'13)
* *removed in:* EasyBuild v2.0
* *alternative(s)*: ``get_site_suffix('sitearch')``

The ``get_sitearch_suffix`` function provided by the ``Perl`` easyblock, which can be (and is) imported in/used by other
easyblocks, has been replaced by the more generic ``get_site_suffix`` function.

To obtain the same functionality as was provided by ``get_sitearch_suffix``, use ``get_site_suffix('sitearch')`` instead.
