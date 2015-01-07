
.. _toolchains_table:

List of known toolchains
========================

The list of known toolchains can easily be obtained with::

  $ eb --list-toolchains
  List of known toolchains (toolchainname: module[,module...]):
  [...]

.. include:: version-specific/eb_list_toolchains.txt

.. note:: The `dummy` toolchain is a special case. It is an 'empty' toolchain, i.e. a toolchain without any components, and corresponds to using the
  readily available compilers and libraries (e.g., the ones provided by the OS). As such, a corresponding `dummy` module file is not required/loaded.

  When the toolchain version is also set to `dummy`, no (build) dependencies will be loaded when the build is performed.
  If the toolchain version is specified as an empty string, the listed dependencies will be loaded (as with other toolchains).
