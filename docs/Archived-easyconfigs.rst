.. _archived_easyconfigs:

Archived easyconfigs
====================

Since EasyBuild v3.0.0, easyconfig files using deprecated (i.e., old and inactive) toolchains are *archived*.

.. contents::
    :depth: 3
    :backlinks: none

.. _archived_easyconfigs_toolchain_deprecation:

Toolchain deprecation
----------------------

Once in a blue moon, we review the list of toolchains (& versions) that are included in EasyBuild.

Easyconfig files that use toolchains that become *deprecated* are then moved to the *easyconfigs archive*,
i.e. the ``__archive__`` subdirectory in the ``easybuild-easyconfigs`` repository
(see https://github.com/easybuilders/easybuild-easyconfigs/tree/master/easybuild/easyconfigs/__archive__).

.. _archived_easyconfigs_deprecated_toolchains_what:

What are deprecated toolchains?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Toolchains become deprecated if:

* no easyconfig files using that toolchain have been contributed recently (e.g., in the last year)
* that toolchain is considered to be inactive, after consulting the EasyBuild community (via mailing list, bi-weekly conf calls)

Deprecating a toolchain implies that all easyconfigs using that toolchain are moved to the easyconfigs archive,
and that they are no longer included in the EasyBuild regression test.
In addition, these easyconfigs are 'hidden' from plain sight, in the sense that you need to use ``--consider-archived-easyconfigs``
to make EasyBuild consider them when it is looking for easyconfigs (e.g., with ```--search`` or ``--robot``).

This does *not* mean that the support for using these toolchains is removed from the EasyBuild framework,
although not testing them anymore may imply that using them may no longer work at some point in time.

For toolchains for which no active versions are available (outside of the easyconfigs archive),
it is possible that they will be reactivated, if a new toolchain version is contributed.

.. _archived_easyconfigs_deprecated_toolchains_why:

Why are toolchains being deprecated?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* using old toolchains (incl. old compilers and/or libraries) is likely to become more and more difficult on modern operating systems
* these toolchains put a significant burden on the regression testing for EasyBuild releases
* easyconfigs using old toolchains are likely to be for old software versions, which may no longer be relevant anyway

.. _archived_easyconfigs_consider:

Using ``--consider-archived-easyconfigs``
-----------------------------------------

To make EasyBuild consider archived easyconfig files, you need to enable the ``--consider-archived-easyconfigs`` configuration option::

  $ eb -S '^goolfc'
  CFGS=/home/example/work/easybuild-easyconfigs/easybuild/easyconfigs
   * $CFGS1/g/goolfc/goolfc-2016.08.eb
   * $CFGS1/g/goolfc/goolfc-2016.10.eb

  Note: 6 matching archived easyconfig(s) found, use --consider-archived-easyconfigs to see them

.. code::

  $ eb -S '^goolfc' --consider-archived-easyconfigs
  CFGS=/home/example/easybuild-easyconfigs/easybuild/easyconfigs
   * $CFGS/g/goolfc/goolfc-2016.08.eb
   * $CFGS/g/goolfc/goolfc-2016.10.eb

  Matching archived easyconfigs:

   * $CFGS/__archive__/g/goolfc/goolfc-1.3.12.eb
   * $CFGS/__archive__/g/goolfc/goolfc-1.4.10.eb
   * $CFGS/__archive__/g/goolfc/goolfc-2.6.10.eb
