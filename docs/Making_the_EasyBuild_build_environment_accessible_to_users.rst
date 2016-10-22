.. _eb_build_env:

Making the EasyBuild build environment accessible to users
==========================================================

This page discusses how the build environment used by EasyBuild internally can also be provided to users,
outside of EasyBuild.

.. contents::
    :depth: 3
    :backlinks: none

.. _eb_build_env_dump_env_script:

Creating a script that sets up the build environment using ``--dump-env-script``
--------------------------------------------------------------------------------


.. _eb_build_env_buildenv_easyblock:

Creating a module that sets up the build environment using the ``BuildEnv`` easyblock
-------------------------------------------------------------------------------------
