

Writing easyconfig files
========================

XXX - ONGOING

All available easyconfig parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

EasyBuild provides a significant amount of easyconfig parameters.
An overview of all available easyconfig parameters can be obtained via
``eb --avail-easyconfig-params``, or ``eb -a`` for short.

Refer to page :ref:`easyconfigs_parameters` for more information, the possible parameters are a very rich set.

Combine -a with ``--easyblock/-e`` to include parameters that are specific to a particular easyblock;
by default, the ones specific to the generic ConfigureMake easyblock are included. For example::

  $ eb -a -e EB_WRF




List of available easyblocks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can obtain a list of available :ref:`easyblocks` via ``--list-easyblocks``.

The ``--list-easyblocks`` command line option prints the easyblocks in a hierarchical way,
showing the inheritance patterns, with the "base" easyblock class ``EasyBlock`` on top.

Software-specific easyblocks have a name that starts with ``EB_``; the ones that do not are generic easyblocks.
(cfr. :ref:`easyblocks` for the distinction between both types of easyblocks).

For example, a list of easyblocks can be obtained with::

  $ eb --list-easyblocks

Refer to page :ref:`basic_usage_easyblocks` for more information.


