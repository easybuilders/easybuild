.. _system_toolchain:

``system`` toolchain
====================

In EasyBuild v4.0, the infamous ``dummy`` toolchain was deprecated, and replaced with the ``system`` toolchain.

This page provides more information about this change, and how to deal with the transition.

.. note:: To easy the transition from ``dummy`` to ``system``, EasyBuild v3.9.4 already supports using the ``system``
          toolchain as an alias for the ``dummy`` toolchain.

.. contents::
    :depth: 1
    :backlinks: none
    :local:


.. _system_toolchain_semantics:

Use case for the ``system`` toolchain
-------------------------------------

The :ref:`system_toolchain` is intended for the same use case as the ``dummy`` toolchain was: it should (only) be used
for software installations where the compiler & libraries provided by the operating system are assumed to
be sufficient.

This includes installing binary software (for which no compiler is used at all), installations that boil down to
only unpacking a source tarball, and building and installing a (base) toolchain compiler like GCC.

For all intents and purposes, the ``system`` **toolchain can be considered as a drop-in replacement for
the (deprecated)** ``dummy`` **toolchain** (see also :ref:`system_toolchain_impact_deprecated_dummy`).

.. _system_toolchain_usage:

Using the ``system`` compiler
-----------------------------

To use the ``system`` toolchain in an easyconfig file, simply use ``'system'`` as toolchain name:

.. code:: python

  toolchain = {'name': 'system', 'version': ''}

.. note:: The toolchain version you specify is totally irrelevant when using the ``system`` compiler,
          it could be ``'system'``, ``''`` or any other (string) value.
          
          EasyBuild does not interpret the version of the ``system`` toolchain in any way
          (as opposed to the ``dummy`` toolchain in EasyBuild versions prior to version 4.0,
          see :ref:`system_toolchain_motivation_deprecating_dummy_version_and_deps`).


.. _system_toolchain_SYSTEM_constant:

``SYSTEM`` constant
-------------------

For convenience, a ``SYSTEM`` constant is available to easily specify the use of the ``system`` toolchain
(and to make it stand out against using a regular toolchain):

.. code:: python

  toolchain = SYSTEM


.. _system_toolchain_impact_deprecated_dummy:

Impact of deprecating ``dummy`` toolchain
-----------------------------------------

The only impact of deprecating the ``dummy`` toolchain is that a warning will be printed whenever an easyconfig file
that still uses the ``dummy`` toolchain is parsed::

  WARNING: Deprecated functionality, will no longer work in v5.0:
  Use of 'dummy' toolchain is deprecated, use 'system' toolchain instead;
  see http://easybuild.readthedocs.org/en/latest/Deprecated-functionality.html for more information


Other than this warning, **there is no impact on the EasyBuild functionality whatsoever**.

Use of the ``dummy`` toolchain has been deprecated, but is still supported in EasyBuild v4.x; it is simply
an alias for the ``system`` toolchain which replaces it.

Hence, software installations for easyconfig files that are still using the ``dummy`` toolchain will proceed as before,
and the contents of the easyconfig files will be interpreted exactly as before, with one exception:
the (build) dependencies specified in the easyconfig files will *always* be loaded in the build environment,
*regardless* of the toolchain version (see also :ref:`system_toolchain_motivation_deprecating_dummy_version_and_deps`).

Since the ``dummy`` toolchain has been deprecated, so has the ``--add-dummy-to-minimal-toolchains`` configuration option.
It has been replaced with the ``--add-system-to-minimal-toolchains`` configuration option (see also :ref:`minimal_toolchains_dummy`).


.. _system_toolchain_updating_dummy:

Updating easyconfig files that use the ``dummy`` toolchain
--------------------------------------------------------

To update easyconfig files that still use the ``dummy`` toolchain, you should simply change the definition
of the ``toolchain`` parameter to use ``'system'`` as a toolchain name (see also :ref:`system_toolchain_usage`).

We recommend using the ``SYSTEM`` constant for this, see :ref:`system_toolchain_SYSTEM_constant`.

To automatically update easyconfig files still using the ``dummy`` toolchain, you can also use
``eb --fix-deprecated-easyconfigs``. Do take into account that this option could also result in
additional changes being made to the easyconfig files,
see :ref:`easyconfig_files_local_variables_fix_deprecated_easyconfigs`.


.. _system_toolchain_motivation_deprecating_dummy:

Motivation for deprecating the ``dummy`` toolchain
--------------------------------------------------

Deprecating the ``dummy`` toolchain was done for a number of reasons:

* :ref:`system_toolchain_motivation_deprecating_dummy_name`
* :ref:`system_toolchain_motivation_deprecating_dummy_version_and_deps`

.. _system_toolchain_motivation_deprecating_dummy_name:

``dummy`` toolchain name
~~~~~~~~~~~~~~~~~~~~~~~~

The ``dummy`` name may be rather confusing, especially if you are new to EasyBuild.
Just based on the name, it is unclear how the ``dummy`` toolchain is different from a regular toolchain.

Hopefully, the name of the ``system`` toolchain does speak more for itself: when using it, you are relying on the
compiler & lilbraries provided by the operating system (as opposed to compilers & libraries that are a part of a regular toolchain).

.. _system_toolchain_motivation_deprecating_dummy_version_and_deps:

Impact of version of ``dummy`` toolchain w.r.t. dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The *version* that was being used for a ``dummy`` toolchain was interpreted by EasyBuild in a rather surprising way.

If ``'dummy'`` was specified as a toolchain version, then the (build) dependencies that were specified in the
easyconfig file were *not* loaded in the build environment. ``module load`` statements for the (non-build)
dependencies *were* included in the generated module file, however...

Using any version other than ``'dummy'`` resulted in the usual behaviour of loading the dependencies in the build
environment.

Why this mechanism was in place has been lost to the sands of time...

This often led to outright confusing installation problems, and hence it was the main motivator for deprecating the
``dummy`` toolchain. Rather than just changing the semantics of the ``dummy`` toolchain, we saw this as an opportunity
to also fix the name.
