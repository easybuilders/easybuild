.. _eb4_relocated_functions_classes_constants:

Overview of relocated functions, classes and constants in EasyBuild v4.0
========================================================================

This page provides an alphabetical overview of relocated functions, classes and constants in EasyBuild version 4.0;
see :ref:`eb4_changes_backwards_incompatible` for motivation and high-level information.


.. _eb4_relocated_basestring:

``basestring`` type
-------------------

Rather than using the ``basestring`` type from the Python 2 standard library directly (for example in
an ``isinstance`` expression), the ``string_type`` type from the ``easybuild.tools.py2vs3`` package should be used instead,
to ensure that the code is compatible with both Python 2 and 3.

See also :ref:`py2_py3_compatibility`.


.. _eb4_relocated_configparser:

``configparser`` module
------------------------

The ``configparser`` module that is part of the Python 2 standard library (via ``ConfigParser``)
must now be imported from the ``easybuild.tools.py2vs3`` package, to ensure that the code is compatible with both Python 2 and 3.

See also :ref:`py2_py3_compatibility`.


.. _eb4_relocated_DEVEL_MODULE_SUFFIX:


``DEVEL_MODULE_SUFFIX`` constant
--------------------------------

The ``DEVEL_MODULE_SUFFIX`` constant was relocated from ``easybuild.tools.module_naming_scheme`` to ``easybuild.tools.module_naming_scheme.mns``.


.. _eb4_relocated_DUMMY_TOOLCHAIN_NAME_VERSION:

``DUMMY_TOOLCHAIN_NAME`` and ``DUMMY_TOOLCHAIN_VERSION`` constants
------------------------------------------------------------------

The ``DUMMY_TOOLCHAIN_NAME`` and ``DUMMY_TOOLCHAIN_VERSION`` constants were relocated from ``easybuild.tools.toolchain`` to ``easybuild.tools.toolchain.toolchain``.

.. note:: Since the ``dummy`` toolchain has been deprecated and is replaced by the ``system`` toolchain (see :ref:`system_toolchain`),
          you should use the ``is_system_toolchain`` function or ``Toolchain.is_system_toolchain`` method to check whether a toolchain
          is a ``dummy`` or ``system`` toolchain, rather than using these constants directly (or using the ``SYSTEM_TOOLCHAIN-*`` equivalents).


.. _eb4_relocated_FrozenDictKnownKeys:

``FrozenDictKnownKeys`` class
-----------------------------

The ``FrozenDictKnownKeys`` class from ``vsc.utils.missing`` is now avaialble from ``easybuild.base.frozendict``.


.. _eb4_relocated_GEENRAL_CLASS:

``GENERAL_CLASS`` constant
--------------------------

The ``GENERAL_CLASS`` constant was relocated from ``easybuild.tools.module_naming_scheme`` to ``easybuild.tools.config``.


.. _eb4_relocated_get_class_for:

``get_class_for`` function
--------------------------

The ``get_class_for`` function from ``vsc.utils.missing`` is now available from ``easybuild.tools.utilities``.


.. _eb4_relocated_get_subclasses:

``get_subclasses`` function
---------------------------

The ``get_subclasses`` function from ``vsc.utils.missing`` is now available from ``easybuild.tools.utilities``.


.. _eb4_relocated_INDENT_4SPACES:

``INDENT_4SPACES`` constant
---------------------------

The ``INDENT_4SPACES`` constants was relocated from ``easybuild.framework.easyconfig.format.format`` to ``easybuild.tools.utilities``.


.. _eb4_relocated_mk_rst_table:

``mk_rst_table`` function
--------------------------

The ``mk_rst_table`` function from ``vsc.utils.docs`` is now available from ``easybuild.tools.docs``.


.. _eb4_relocated_ModuleNamingScheme:

``ModuleNamingScheme`` class
----------------------------

The ``ModuleNamingScheme`` class was relocated from ``easybuild.tools.module_naming_scheme`` to ``easybuild.tools.module_naming_scheme.mns``.


.. _eb4_relocated_nub:

``nub`` function
----------------

The ``nub`` function from ``vsc.utils.missing`` is now available from ``easybuild.tools.utilities``.


.. _eb4_relocated_OrderedDict:

``OrderedDict`` class
---------------------

The ``OrderedDict`` class that is part of the Python 2 standard library (via ``collections``)
must now be imported from the ``easybuild.tools.py2vs3`` package, to ensure that the code is compatible with both Python 2 and 3.

See also :ref:`py2_py3_compatibility`.


.. _eb4_relocated_reload:

``reload`` function
-------------------

The ``reload`` function that is a built-in function of the Python 2 standard library
must now be imported from the ``easybuild.tools.py2vs3`` package, to ensure that the code is compatible with both Python 2 and 3.

See also :ref:`py2_py3_compatibility`.


.. _eb4_relocated_shell_quote:

``shell_quote`` function
------------------------

The ``shell_quote`` function from ``vsc.utils.missing`` is now available from ``easybuild.tools.utilities``.


.. _eb4_relocated_sched_getaffinity:

``sched_getaffinity`` function
------------------------------

The ``sched_getaffinity`` function from ``vsc.utils.affinity`` is now available from ``easybuild.tools.systemtools``.


.. _eb4_relocated_Singleton:

``Singleton`` class
-------------------

The ``Singleton`` class from ``vsc.utils.patterns`` is now available from ``easybuild.tools.config``.


.. _eb4_relocated_StringIO:

``StringIO`` class
------------------

Rather than importing the ``StringIO`` class from the ``StringIO`` module of the Python 2 standard library,
it should be imported from the ``easybuild.tools.py2vs3`` package instead,
to ensure that the code is compatible with both Python 2 and 3.

See also :ref:`py2_py3_compatibility`.


.. _eb4_relocated_subprocess_Popen:

``subprocess.Popen`` function
-----------------------------

Rather than using the ``subprocess.Popen`` function directly, the ``subprocess_popen_text`` function from
the ``easybuild.tools.py2vs3`` package should be used instead, to ensure that the code is compatible with both Python 2 and 3.

See also :ref:`py2_py3_compatibility`.


.. _eb4_relocated_urlencode:

``urlencode`` function
----------------------

Rather than importing the ``urlencode`` function from the ``urllib`` module of the Python 2 standard library,
it should be imported from the ``easybuild.tools.py2vs3`` package instead,
to ensure that the code is compatible with both Python 2 and 3.

See also :ref:`py2_py3_compatibility`.


.. _eb4_relocated_urllib:

``urllib`` module
-----------------

Rather than using the ``urllib`` module from the Python 2 standard library directly,
the ``std_urllib`` module from the ``easybuild.tools.py2vs3`` package should be used instead,
to ensure that the code is compatible with both Python 2 and 3.

See also :ref:`py2_py3_compatibility`.


.. _eb4_relocated_urllib2:

``urllib2`` module
------------------

Functions that were imported from the ``urllib2`` package that is part of the Python 2 standard library
must now be imported from the ``easybuild.tools.py2vs3`` package, to ensure that the code is compatible with both Python 2 and 3.

See also :ref:`py2_py3_compatibility`.


.. _eb4_relocated_vsc_utils_modules:

``vsc.utils.*`` modules
-----------------------

The functionality from the following ``vsc.utils.*`` modules required by EasyBuild has been ingested in the corresponding ``easybuild.base.*`` module:

* ``vsc.utils.exceptions``
* ``vsc.utils.fancylogger``
* ``vsc.utils.generaloption``
* ``vsc.utils.optcomplete``
* ``vsc.utils.rest``
* ``vsc.utils.testing``
* ``vsc.utils.wrapper``

See also :ref:`eb4_no_required_deps`.
