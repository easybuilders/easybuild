.. _changes:

Backwards-incompatible changes in EasyBuild 4.0
===============================================

Mainly in order to support Python 3.x, remove the dependency on setuptools and ingest vsc-base and vsc-install, EasyBuild 4.0 includes several backwards-incompatible changes that are important to take note of.

This page provides an :ref:`overview of backwards-incompatible changes <overview_changes>` together with available alternatives.

.. _overview_changes:

Overview of backwards-incompatible changes in EasyBuild version 4.0
-------------------------------------------------------------------

The different sections below document the backwards-incompatible changes in EasyBuild version 4.0.

* :ref:`moved_declarations`
* :ref:`py2vspy3`
* :ref:`easybuild_base`
* :ref:`deprecated_dummy_toolchain`

...

.. _moved_declarations:

declarations that have moved
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As a result of dropping the setuptools requirement (which implies that the __init__.py files must be empty other than the pkgutil statement), the following declarations have moved, so `import` statements will need to be changed:

* the ModuleNamingScheme class and DEVEL_MODULE_SUFFIX_CONSTANT is longer available from the easybuild.tools.module_naming_scheme namespace, only from the easybuild.tools.module_naming_scheme.mns namespace.
* the GENERAL_CLASS constant is longer available from the easybuild.tools.module_naming_scheme namespace, only from the easybuild.tools.config namespace.
* the DUMMY_TOOLCHAIN_NAME and DUMMY_TOOLCHAIN_VERSION constants were moved from easybuild.tools.toolchain to easybuild.tools.toolchain.toolchain (see ... w.r.t. the DUMMY toolchain)

.. _py2vspy3:

functions that should now be imported from the py2vspy3 package
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Proxy Imports

* OrderedDict
* HTTPError, HTTPSHandler, Request, URLError, build_opener, urlopen
* StringIO
* ascii_letters and ascii_lowercase
* configparser
* json
* subprocess
* sys
* std_urllib
* urlencode
* reload
* string_type (instead of basestring)

Wrappers

* json_loads (Wrapper for json.loads that takes into account that Python versions older than 3.6 require a string value)
* subprocess_popen_text (Call subprocess.Popen in text mode with specified named arguments)
* raise_with_traceback (Raise exception of specified class with given message and traceback)
* extract_method_name (Extract method name from lambda function.)
* mk_wrapper_baseclass (Returns wrapper class that provides proxy access to an instance of some internal instance)

.. _easybuild_base:

functions that should now be imported from the easybuild.base package
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* moved from vsc.utils to easybuild.base
    * exceptions
    * fancylogger
    * missing.FrozenDictKnownKeys ( now in frozendict.FrozenDictKnownKeys)
    * generaloption
    * rest
    * testing
    * wrapper
* moved from vsc.utils to easybuild.tools.config
    * patterns.Singleton
* moved from vsc.utils to easybuild.tools.utilities
    * docs.mk_rst_table
    * missing.nub, get_class_for, get_subclasses, shell_quote
* moved from vsc.utils to easybuild.tools.systemtools
    * affinity.sched_getaffinity

...

.. _deprecated_dummy_toolchain:

consequences of deprecating the dummy toolchain in favour of `system`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/easybuilders/easybuild-framework/pull/2877

* A new system toolchain was introduced (see also System toolchain definition + SystemCompiler compiler used by it).

* In contrast with the dummy toolchain, the version of the system toolchain is totally meaningless (so no more special behavior like we had with using 'dummy' as a version for the dummy toolchain).

* The use of the dummy toolchain is deprecated: it will produce a big fat warning in EasyBuild 4.x, and will result in an error being raised starting with EasyBuild 5.0 (see Toolchain.__init__ in easybuild/tools/toolchain/toolchain.py). In addition, whenever the dummy toolchain is specified, it will be replaced by the system toolchain under the covers.

* The --add-dummy-to-minimal-toolchains configuration option has been renamed to --add-system-to-minimal-toolchains (so --add-dummy-to-minimal-toolchains is no longer a valid configuration option).

* A new function is_system_toolchain (+ utility method Toolchain.is_system_toolchain()) has been added, which should be used wherever we need to check whether or not a system toolchain is used (rather than checking the toolchain name against DUMMY_TOOLCHAIN_NAME).

* A new constant SYSTEM was added which allows for using toolchain = SYSTEM in easyconfig files, to make the use of a system toolchain stand out a bit more, and to make it cleaner (compared to using toolchain = {'name': 'system', 'version': 'system'}.

* A new (internal) constant SYSTEM_TOOLCHAIN_NAME was introduced, equivalent with DUMMY_TOOLCHAIN_NAME (but easyblocks should be updated to use is_system_toolchain instead).

* dummy is filtered from the output of --list-toolchains (since it's deprecated)


