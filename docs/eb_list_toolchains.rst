
.. _toolchains_table:

Toolchains table
================

The list of toolchains can easily be obtained with::

  $ eb --list-toolchains
  List of known toolchains (toolchainname: module[,module...]):
  [...]

.. include:: version-specific/eb_list_toolchains.txt

There is one special case: the `dummy` toolchain. This will not load anything and so you will be using whatever compiler can be found in the current path. If you also specify `dummy` as the toolchainversion, no dependencies will be loaded. If you leav the toolchainversion empty, the dependencies will get loaded.
