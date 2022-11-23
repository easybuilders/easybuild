.. _easystack:

Easystack files
===============

This documentation covers aspects of specifying a software stack to install with Easybuild with *easystack files*.

**Note: this is an** :ref:`experimental feature <experimental_features>`. **Some of the mentioned functionality may be subject to change or be prone to errors.**

.. note::
   Some breaking changes were made to the experimental easystack support in EasyBuild v4.7.0.

   Easystack files must now use the ``easyconfigs`` top-level key to list *easyconfig filenames*,
   as opposed to the ``software`` top-level key and separate subkeys like ``version``, ``versionsuffix`` and
   ``toolchain`` to specify aspects of an easyconfig file that were supported before.

.. contents::
    :depth: 3
    :backlinks: none


.. _easystack_basics:

The basics
----------

*Easystack files* describe an entire software stack, and can be used to specify to EasyBuild what to install.

.. _easystack_usage:

Usage
-----

To build software with *Easystack*, type:

.. code::

  eb --easystack example.yaml --experimental

where ``example.yaml`` is the file with specifications that you just created (more about this in the next section).


.. _easystack_structure:

Structure of an easystack file
------------------------------

Easystack files are written in `YAML syntax <https://learnxinyminutes.com/docs/yaml>`_.

Essentially, an easystack file lists the easyconfig files you want to install, which are specified under the
`easyconfigs` key.

For example:

.. code:: yaml

  easyconfigs:
    - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb
    - OpenFOAM-v2206-foss-2022a.eb

.. note::
   You must use '``-``' to list the easyconfigs in an easystack file.

In addition, you can specify additional configuration options via the ``options`` subkey
which will only apply to the installation of a particular easyconfig file.

For example:

.. code:: yaml

  easyconfigs:
    - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb:
      options:
        from-pr: 15924
        debug: True
    - Hypre-2.25.0-foss-2022a.eb:
    - OpenFOAM-v2206-foss-2022a.eb:
      options:
        installpath: /my/custom/installpath

.. note::
   You need to take care with some values in YAML, especially integers, booleans, etc.
   To avoid that the YAML parser assumes that a value is of a particular type,
   use quotes (``'...'``) to force a string value.

The configuration options that are valid for the ``eb`` command can be used (see ``eb --help``),
but the ``-`` or ``--`` prefixes that are commonly used on the command line are omitted in easystack files.

Using the example easystack file above would be equivalent to running:

.. code::

  eb PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb --from-pr 15924 --debug
  eb Hypre-2.25.0-foss-2022a.eb
  eb OpenFOAM-v2206-foss-2022a.eb --installpath /my/custom/installpath

Note that whenever configuration options are *not* specified (as is the case for ``Hypre`` in the example easystack file above),
you are still allowed to use '``:``' after the easyconfig filename: there is no difference in behaviour in ending with or without '``:``'.

Specifying short options in an easystack file is allowed, for example:

.. code:: yaml

  easyconfigs:
    - OpenFOAM-v2206-foss-2022a.eb:
      options:
        D: True

This is not recommended however, as short options are more difficult to interpret by humans.


.. _easystack_combining_options:

Combining command line options with options in an easystack file
----------------------------------------------------------------

When building software with an easystack file, you can still add additional options on the command line as well.
These apply to *all* items in the easystack file. For example, if you have an easystack file named 
``my_easystack.yaml``

.. code:: yaml

  easyconfigs:
    - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb:
      options:
        from-pr: 15924
        debug: True
    - OpenFOAM-v2206-foss-2022a.eb:

and you run with

.. code::

  eb --experimental --easystack my_easystack.yaml --dry-run

this will have the same effect as running

.. code::

  eb PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb --dry-run --from-pr 15924 --debug
  eb OpenFOAM-v2206-foss-2022a.eb --dry-run --installpath /my/custom/installpath

Note that options specified on the command line are placed *before* the easyconfig-specific options in the easystack file.
EasyBuild will always respect the argument that was put *last*.

For example:

.. code::

  eb PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb --dry-run --disable-dry-run

will effectively run *without* enabling dry run mode, since ``--disable-dry-run`` is specified after ``--dry-run``.

Since easyconfig-specific configuration options specified in the easystack file are put *last*,
they take priority over the the ones on the command line, if the same configuration option is specified in both.

For example, running:

.. code::

  eb --experimental --easystack my_easystack.yaml --disable-debug

will effectively cause ``PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb`` to be installed with debug logging enabled,
while ``OpenFOAM-v2206-foss-2022a.eb`` will be effectively installed *without* debug logging.


To be developed
---------------

In the future, we are planning to support additional also global options specified in the easystack file. For example:

.. code:: yaml

  options:
    robot: True

  easyconfigs:
  - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb
  - OpenFOAM-v2206-foss-2022a.eb

would installed both ``PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb`` and ``OpenFOAM-v2206-foss-2022a.eb`` using ``--robot``
(see `issue #4105 <https://github.com/easybuilders/easybuild-framework/issues/4105>`_).

Additionally, we plan to support specifying for which EasyBuild version an easystack file was intended,
which can be helpful in more accurately recreating a certain software stack
(see `issue #4106 <https://github.com/easybuilders/easybuild-framework/issues/4106>`_).

In the future, the ``--easystack`` option will probably be dropped, and EasyBuild will automatically detect
the use of easystack files (see `issue #4104 <https://github.com/easybuilders/easybuild-framework/issues/4104>`_).

Finally, we plan to support specifying *labels*, which would make it more easy to install only a certain subset of
the items listed in an easystack file. For example, by labelling all GPU-capable software with a ``gpu`` label,
one could easily choose to *not* build anything labeled ``gpu`` on a CPU node
(see `issue #3512 <https://github.com/easybuilders/easybuild-framework/issues/3512>`_).
