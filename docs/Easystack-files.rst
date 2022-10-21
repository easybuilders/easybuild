.. _easystack:

Easystack files
===============

This documentation covers aspects of specifying a software stack to install with Easybuild with *easystack files*.

**Note: this is an** :ref:`experimental feature <experimental_features>`. **Some of the mentioned functionality may be subject to change or be prone to errors.**

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

Essentially, easystack files list the EasyConfigs you want to install. These are listed under the 'easyconfigs:' key:

.. code:: yaml

  easyconfigs:
    - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb
    - OpenFOAM-v2206-foss-2022a.eb

(note the use of the ``-`` to list the items).

In addition, you can specify additional options that will only apply to the installation of that EasyConfig:

.. code:: yaml

  easyconfigs:
    - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb:
      options: {
        'from-pr': 15924,
        'debug': True
      }
    - Hypre-2.25.0-foss-2022a.eb:
    - OpenFOAM-v2206-foss-2022a.eb:
      options: {
        'installpath': '/my/custom/installpath'
      }

The same command line arguments and options that are valid for the ``eb`` command can be used here, but any prefixed ``-`` or ``--`` that are commonly used on the command line are ommitted in easystack files.

Running the easystack file above would be equivalent to running:

.. code::

  eb PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb --from-pr 15924 --debug
  eb Hypre-2.25.0-foss-2022a.eb
  eb OpenFOAM-v2206-foss-2022a.eb --installpath /my/custom/installpath

Note that whenever options are *not* specified (as is the case for ``Hypre`` in the above easystack file), you are 
still allowed to use ``:`` the EasyConfig name: there is no difference in behaviour in ending with or without ``:``.

Specifying short options in an easystack file, e.g.

.. code:: yaml

  easyconfigs:
    - OpenFOAM-v2206-foss-2022a.eb:
      options: {
        'D': True
      }

is allowed, but not recommended as they are more difficult to interpret by humans.

.. _easystack_combining_options:

Combining command line options with options in an easystack file
------------------------------

When building software with an easystack file, you can still add additional options on the command line as well.
These apply to *all* items in the easystack file. For example, if you have an easystack file named 
``my_easystack.yaml``

.. code:: yaml

  easyconfigs:
    - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb:
      options: {
        'from-pr': 15924,
        'debug': True
      }
    - OpenFOAM-v2206-foss-2022a.eb:

and you run with

.. code::

  eb --experimental --easystack my_easystack.yaml -D

this will have the same effect as running

.. code::

  eb PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb -D --from-pr 15924 --debug
  eb OpenFOAM-v2206-foss-2022a.eb -D --installpath /my/custom/installpath

Note that options specified on the command line are placed *before* the EasyConfig-specific options in the easystack file. EasyBuild will always respect the argument that was put *last*, for example:

.. code::

  eb PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb --dry-run --disable-dry-run

will effectively run with ``--disabe-dry-run``. Since EasyConfig-specific options in from the easystack file are put *last*, this implies that they take priority over the the ones on the command line, if the same option is specified in both. For example, running

.. code::

  eb --experimental --easystack my_easystack.yaml --disable-debug

will effectively cause the build of ``PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb`` to be build with ``--debug``, while ``OpenFOAM-v2206-foss-2022a.eb`` is effectively build with ``--disable-debug``.


To be developed
---------------

In the future, we are planning to support additional also global options specified in the easystack file. For example:

.. code:: yaml

  options: {
   robot: True
  }
  easyconfigs:
  - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb
  - OpenFOAM-v2206-foss-2022a.eb

would build both ``PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb`` and ``OpenFOAM-v2206-foss-2022a.eb`` with ``--robot`` (see https://github.com/easybuilders/easybuild-framework/issues/4105).

Additionally, we plan to support specifying for which easybuild version an easystack file was intended, which can be helpful in more accurately recreating a certain software stack (see https://github.com/easybuilders/easybuild-framework/issues/4106).

In the future, the need for specifying ``--easystack`` specifically will probably be dropped (see https://github.com/easybuilders/easybuild-framework/issues/4104).

Finally, we plan to support specifying labels, which would make it more easy to build only a certain subset of the items in the easystack file. For example, by labelling all GPU-capable software with one specific label, one could easily choose to *not* build anything labeled ``gpu`` on a CPU node. (see https://github.com/easybuilders/easybuild-framework/issues/3512)
