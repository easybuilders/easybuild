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
for which support will be removed in EasyBuild version 3.0.

For EasyBuild users:

*(nothing yet)*

For authors of easyconfig files:

*(nothing yet)*

For developers of easyblocks:

* :ref:`depr_error_reporting`

For EasyBuild framework developers:

* :ref:`depr_error_reporting`

.. _depr_error_reporting:

Report errors by raising ``EasyBuildError`` rather than using log methods
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Use of the** ``error()`` **and** ``exception()`` **log methods is deprecated.**

* *deprecated since:* EasyBuild v2.1.0 (April'15)
* *removed in:* EasyBuild v3.0
* *alternative(s)*: **use** ``raise EasyBuildError(...)`` **instead**

The ``error()`` and ``exception()`` log methods defined by EasyBuild (in the ``easybuild.tools.build_log`` module)
do not match the semantics of the `standard Python log methods
<https://docs.python.org/2/library/logging.html#logging.Logger.error>`_, in the sense that they also raise an
exception next to logging messages.

This may cause problems when 3rd party libraries (e.g., `gc3pie <https://pypi.python.org/pypi/gc3pie>`_) are being
used by EasyBuild, since they may be using these log methods without expecting an exception being raised.

The custom definitions for the ``error()`` and ``exception()`` log methods will be removed in EasyBuild v3.0.

Hence, these log methods should no longer be used to report errors since they will not raise an exception anymore once
their custom definitions are removed. Note that this applies both to the EasyBuild framework and to (custom) easyblocks.

To report errors, an ``EasyBuildError`` should be raised instead. For example:

.. code:: python

    # make sure config.sh script is there
    if not os.path.exists(os.path.join(self.builddir, 'config.sh'):
        raise EasyBuildError("config.sh script is missing in %s", self.builddir)

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
