.. _deprecated:

Deprecated functionality
========================

Some of the functionality that was available in previous EasyBuild versions is *deprecated*, and should no longer be used.

This functionality will be removed in a future version of EasyBuild (see :ref:`removed_functionality`
for more information about functionality that has been removed already).

This page:

* provides an :ref:`overview of currently deprecated functionality <overview_deprecated>` together with
  available alternatives
* describes the :ref:`EasyBuild deprecation policy <deprecation_policy>`
* explains how to easily :ref:`check whether you are still relying on deprecated functionality
  <how_to_check_use_of_deprecated_functionality>`

.. _overview_deprecated:

Overview of deprecated functionality in EasyBuild version |version|
-------------------------------------------------------------------

The different section below document the functionality that is deprecated in EasyBuild version |version|,
for which support will be removed in EasyBuild version 4.0.

For EasyBuild users:

*(nothing yet)*

For authors of easyconfig files:

* :ref:`depr_fftw_use_fma4`
* :ref:`depr_sources_2_element_tuple`
* :ref:`depr_pythonpackage_use_easy_install_setup_py_develop`

For developers of easyblocks:

* :ref:`depr_copytree_function`
* :ref:`depr_adjust_permissions_skip_symlinks`

For EasyBuild framework developers:

* :ref:`depr_get_easyblock_class_default_fallback`


.. _depr_fftw_use_fma4:

``use_fma`` custom easyconfig parameter for FFTW
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.2.0 (May 5th 2017)
* *will be removed in:* EasyBuild v4.0
* *alternatives*: **use** ``use_fma4`` **easyconfig parameter instead**

The ``use_fma`` easyconfig parameter has been deprecated in favor of the equivalent easyconfig parameter ``use_fma4``.

``use_fma`` was introduced in EasyBuild v3.1.0 allow configuring FFTW with ``--enable-avx-128-fma``.
Since it is only supported on systems with AMD processors that have the ``FMA4`` feature, it was replaced by
the more fittingly named ``use_fma4`` parameter in EasyBuild v3.2.0.


.. _depr_sources_2_element_tuple:

Specifying source files as 2-element tuples to provide a custom extraction command
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.3.0 (June 22nd 2017)
* *will be removed in:* EasyBuild v4.0
* *alternatives*: **use** ``extract_cmd`` **key in Python dictionary format instead**

Specyfing a custom extraction command for a particular source file by using a 2-element tuple in ``sources``
has been deprecated.

Instead, a Python dictionary containing the ``filename`` and ``extract_cmd`` keys should be used instead,
see :ref:`common_easyconfig_param_sources_alt`.

So, this:

.. code:: python

    # source file is actually a gzipped tarball (filename should be .tar.gz)
    # DEPRECATED FORMAT, don't use this anymore!
    sources = [('example.gz', "tar xfvz %s")]

should be replaced with:

.. code:: python

  sources = [{
    'filename': 'example-%(version)s.gz',
    'extract_cmd': "tar xfvz %s",  # source file is actually a gzipped tarball (filename should be .tar.gz)
  }]


.. _depr_pythonpackage_use_easy_install_setup_py_develop:

``use_easy_install`` and ``use_setup_py_develop`` custom easyconfig parameters for ``PythonPackage`` easyblock
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.5.1 (Jan 17th 2018)
* *will be removed in:* EasyBuild v4.0
* *alternatives*: **use** ``install_target`` **easyconfig parameter instead**

The custom easyconfig parameters ``use_easy_install`` and ``use_setup_py_develop`` for the ``PythonPackage``
easyblock have been deprecated, since they are obsolete since the ``install_target`` custom easyconfig parameter was
added in https://github.com/easybuilders/easybuild-easyblocks/pull/1341.

Rather than using ``use_easy_install = True``, you should now use ``install_target = 'easy_install'`` instead.

Rather than using ``use_setup_py_develop = True``, you should now use ``install_target = 'develop'`` instead.


.. _depr_copytree_function:

``copytree`` function
~~~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.2.0 (May 5th 2017)
* *will be removed in:* EasyBuild v4.0
* *alternatives*: **use** ``copy_dir`` **instead**

The ``copytree`` function, which was a copy of the ``shutil.copytree`` function (introduced when Python 2.4 was still
supported) has been deprecated in favor of the superior ``copy_dir`` function in the ``easybuild.tools.filetools`` module.

``copy_dir`` graciously handles any exceptions that occur, and is aware of the EasyBuild *dry run* mode.

.. _depr_adjust_permissions_skip_symlinks:

``skip_symlinks`` named argument for ``adjust_permissions``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.8.0 (Nov 2018)
* *will be removed in:* EasyBuild v4.0
* *alternatives*: *(none required)*

The ``skip_symlinks`` argument for the ``adjust_permissions`` function has been deprecated since ``adjust_permissions``
has been changed to *always* skip symbolic links (this was already the default behaviour); see also
https://github.com/easybuilders/easybuild-framework/pull/2644 .


.. _depr_get_easyblock_class_default_fallback:

``default_fallback`` named argument for ``get_easyblock_class``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.2.0 (May 5th 2017)
* *will be removed in:* EasyBuild v4.0
* *alternatives*: **use** ``error_on_missing_easyblock`` **named parameter instead**

The ``get_easyblock_class`` implementation was cleaned up to remove the support for falling back to the
generic ``ConfigureMake`` easyblock in EasyBuild v3.2.0 (see https://github.com/easybuilders/easybuild-framework/pull/2178),
following the disabling of the :ref:`depr_ConfigureMake_fallback_eb1` in EasyBuild v2.0.

The ``default_fallback`` named argument for ``get_easyblock_class`` was replaced by ``error_on_missing_easyblock``,
to retain support for ignoring a missing matching easyblock rather than raising an error.


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
  non-bugfix-only release after version ``X.Y``), see also :ref:`removed_functionality`

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
