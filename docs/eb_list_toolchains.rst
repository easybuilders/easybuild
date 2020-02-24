
.. _toolchains_table:

List of known toolchains
========================

The list of known toolchains can easily be obtained with::

  $ eb --list-toolchains
  List of known toolchains (toolchainname: module[,module...]):
  [...]

.. include:: version-specific/eb_list_toolchains.txt

.. note:: The `system` toolchain is a special case.  See the section on :ref:`toolchains` for a brief explanation of the `system` toolchain and the deprecated `dummy` toolchain (used in EasyBuild versions prior to v4.0, and see :ref:`system_toolchain` for more detailed information.
