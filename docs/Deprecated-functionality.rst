.. _deprecated:

Deprecated functionality in EasyBuild v1.x
==========================================

Some of the functionality that was available in previous EasyBuild versions is *deprecated* (or will be soon),
and should no longer be used.

This page presents an overview of deprecated functionality, together with available alternatives.

**In EasyBuild v2.0 (planned for release Jan'15) we will drop the support for this deprecated functionality,
forcing you to use the alternative features instead.**

For EasyBuild users:

* :ref:`how_to_check_use_of_deprecated_functionality`
* :ref:`python_version_compatibility`
* :ref:`easybuild_configuration`
* :ref:`softroot_version_env_vars`

For authors of easyconfig files:

* :ref:`ConfigureMake_fallback`
* :ref:`easyconfig_parameters`

For developers of easyblocks:

* :ref:`easyblocks_API`
* :ref:`renamed_relocated_functions`

For EasyBuild framework developers:

* :ref:`easybuild_tools_modules`

.. _how_to_check_use_of_deprecated_functionality:

How to check for use of deprecated functionality
------------------------------------------------

Since EasyBuild v1.16.0, the ``--deprecated`` command line option can be used to check whether deprecated behavior is
still being triggered in your EasyBuild setup.

For example, using ``--deprecated=2.0`` will transform any deprecation warning for functionality that will no longer
be available in EasyBuild v2.0 into an error message. For example::

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
         specifying a higher version via ``--deprecated`` to overrule that setting, until the
         functionality is actually disabled.

.. _python_version_compatibility:

Python version compatibility
----------------------------

**Compatibility with Python 2.4 is deprecated.**

* *deprecated since:* EasyBuild v1.14.0 (July'14)
* *no longer supported starting:* EasyBuild v2.0
* *alternative(s)*: **upgrade to Python v2.6.x or v2.7.x**

Ever since EasyBuild v1.0, the codebase has been Python 2.4 compatible. One reason for this is that EasyBuild was
being used on a daily basis on Scientific Linux 5, in which the Python 2.4.x is the system default.

**With EasyBuild v2.0 we will drop support for Python 2.4**, and only ensure compatibility with Python 2.6.x or a
more recent Python 2.x.

This will enable us to gradually also make the codebase compatible with Python 3.x, which is difficult to do without
dropping support for Python 2.4.

.. _easybuild_configuration:

EasyBuild configuration
-----------------------

**Old-style EasyBuild configuration is deprecated.**

* *deprecated since:* EasyBuild v1.3.0 (Apr'13)
* *no longer supported starting*: EasyBuild v2.0
* *alternatives:* **new-style configuration** (see :ref:`configuring_easybuild`)

Early versions of EasyBuild v1.x provided support for configuring EasyBuild via a *Python module* that was automagically
executed when available.

Since EasyBuild v1.3 a safer and more consistent way of configuring EasyBuild is supported, which aligns the EasyBuild
command line, ``$EASYBUILD_X`` environment variables and key-value style configuration files.

More information about the new(er) and recommended configuration style is available :ref:`here <configuring_easybuild>`.

For detailed information with respect to porting from the old to the new configuration style, see
:ref:`configuring_easybuild_legacy`.

Note that the default path for the new-style configuration path is ``$XDG_CONFIG_HOME/easybuild/config.cfg`` (or
``$HOME/.config/easybuild/config.cfg`` if ``$XDG_CONFIG_HOME`` is not set), see :ref:`list_of_configuration_files`.
The previous default path ``$HOME/.easybuild/config.cfg`` that was in place since EasyBuild v1.3.0 is deprecated since
*EasyBuild v1.11.0 (Feb'14)*.

**Support for the old-style configuration options will be dropped in EasyBuild v2.0.**


.. _ConfigureMake_fallback:

Automagic fallback to ``ConfigureMake``
---------------------------------------

**The automagic fallback to the** ``ConfigureMake`` **easyblock is deprecated.**

If the ``easyblock`` easyconfig was not specified, EasyBuild tries to find a matching easyblock based on the software
name. In EasyBuild v1.x, the generic ``ConfigureMake`` easyblock was used if no matching easyblock could be found.

This behavior is deprecated since *EasyBuild v1.16.0 (Dec'14)*; instead, easyconfigs that require using the
``ConfigureMake`` easyblock *must* specify the following::

  easyblock = 'ConfigureMake'

.. _easyconfig_parameters:

Easyconfig parameters
---------------------

**Some easyconfig parameters are deprecated:** ``premakeopts`` **,** ``makeopts`` **; so is the use of the**
``shared_lib_ext`` **'constant'.**

A couple of easyconfig parameters have been renamed, for consistency reasons:

* ``makeopts`` is deprecated, and replaced by ``buildopts`` *(since EasyBuild v1.13.0 (May'14))*
* ``premakeopts`` is deprecated, and replaced by ``prebuildopts`` *(since EasyBuild v1.13.0 (May'14))*

(see also :ref:`configure_build_install_command_options`)

Using the ``shared_lib_ext`` "magic" variable representing the extension for shared libraries (``.so`` on Linux,
``.dylib`` on OS X) is deprecated; the easyconfig constant ``SHLIB_EXT`` should be using instead *(since
EasyBuild v1.5.0 (June'13))*.

**These deprecated easyconfig parameters/templates will no longer be supported in EasyBuild v2.0 and later.**

After that, EasyBuild will throw an error
if it detects any of these are still being used in an easyblock and/or defined by an easyconfig file.

.. note:: The `software_license` easyconfig parameter will become **mandatory** at some point.

EasyBuild API changes
---------------------

.. _easyblocks_API:

Easyblocks API (``easybuild.framework.easyblock``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some changes were made to the easyblocks API:

* the return type of the ``extra_options`` static method has been changed to a *dictionary*, rather than a list of
  key-value tuples *(since EasyBuild v1.12.0 (Apr'13))*

  * to work around this, you can add custom easyconfig parameters via a *dict*-typed value
    to the ``extra_options`` function of parent easyblock; for example (taken from the generic ``Binary`` easyblock)::

      @staticmethod
      def extra_options(extra_vars=None):
          """Extra easyconfig parameters specific to Binary easyblock."""
          extra_vars = dict(EasyBlock.extra_options(extra_vars))
          extra_vars.update({
              'install_cmd': [None, "Install command to be used.", CUSTOM],
          })
          return EasyBlock.extra_options(extra_vars)

* only the ``ext_name``, ``ext_version`` and ``src`` template strings can be used in the ``exts_filter`` extension filter
  easyconfig parameter; using the ``name`` and ``version`` template strings is deprecated *(since EasyBuild v1.2.0 (Feb'13))*
* determining the *location* of Python modules representing easyblocks based on the software name is deprecated; EasyBuild
  must be able to determine the easyblock module path solely based on the name of the easyblock Python class *(since
  EasyBuild v1.4.0 (May'13))*

  * easyblocks with a class name that is already honoring the encoding scheme implemented by the ``encode_class_name``
    function will not be affected

**Easyblocks not taking into account these changes will no longer be supported in EasyBuild v2.0 and later.**

.. _easybuild_tools_modules:

``easybuild.tools.modules`` Python module
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The API of the ``easybuild.tools.modules`` Python module has been changed extensively when implementing support for
alternative module naming schemes *(EasyBuild v1.8.0 (Oct'13))*:

* use of ``modules`` class variable and the ``add_module``/``remove_module`` methods is deprecated; modules should be
  (un)loaded using the ``load`` and ``unload`` methods instead
* the ``mod_paths`` and ``modulePath`` named arguments for the ``run_module`` method are deprecated; the class instance
  should be created with a specific list of module paths instead
* using the ``Modules`` class to obtain a class instance representing a modules tool interface is deprecated,;
  the ``modules_tool`` function should be used instead

Easyblocks should not be using ``easybuild.tools.modules`` directly, and hence should be unaffected.

.. _softroot_version_env_vars:

``$SOFTROOTX`` and ``$SOFTVERSIONX`` environment variables in generated module files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``get_software_root`` and ``get_software_version`` functions will only take ``$EBROOTFOO`` and
``$EBVERSIONFOO`` environment variables into account starting with EasyBuild v2.0, as opposed to also considering
the ``$SOFTROOTFOO`` and ``$SOFTVERSIONFOO`` environment variables (which were set in modules generated by EasyBuild v0.x).
Likewise, adhering to the ``$SOFTDEVELFOO`` environment variables is deprecated.

*This is only relevant to early adopters who are still using module files generated by EasyBuild v0.x.*

.. _renamed_relocated_functions:

Renamed/relocated functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~

A number of functions and methods that are part of the EasyBuild framework API have been renamed, mainly for consistency
reasons:

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

**These functions and methods will no longer be available under their deprecated name/location starting with
EasyBuild v2.0**. After that, EasyBuild will throw an error if they're still being used (e.g., in easyblocks).

