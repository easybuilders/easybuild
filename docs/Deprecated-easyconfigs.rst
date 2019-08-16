.. _deprecated_easyconfigs:

Deprecated easyconfigs
======================

Since EasyBuild v3.8.0, individual easyconfig files or particular (versions of) toolchains can be marked as deprecated.

.. contents::
    :depth: 3
    :backlinks: none


.. _deprecated_easyconfigs_symptoms:

Symptoms
--------

Using an easyconfig file or toolchain that was marked as deprecated results in a warning message like:

::

  WARNING: Deprecated functionality, will no longer work in v4.0: easyconfig file '/home/example/test.eb' is marked as deprecated:
  This is an example message explaining why the easyconfig file was deprecated.
  (see also http://easybuild.readthedocs.org/en/latest/Deprecated-easyconfigs.html)

Or, in case you are trying to use an easyconfig file or toolchain that was marked deprecated in a previous major version
of EasyBuild:

::

  ERROR: Failed to process easyconfig /home/example/test.eb: DEPRECATED (since v4.0) functionality used: easyconfig file '/home/example/test.eb' is marked as deprecated:
  This is an example message explaining why the easyconfig file was deprecated.
  (see also http://easybuild.readthedocs.org/en/latest/Deprecated-easyconfigs.html)


.. _deprecated_easyconfigs_why:

Reasons for deprecation
-----------------------

There are several possible reasons why a particular easyconfig file or toolchain was deprecated, some of which include:

* old/obsolete versions of software or toolchain components
* toolchains that are superseded by other toolchains
* known installation problems that are hard to resolve (or not worth the effort to resolve)


.. _deprecated_easyconfigs_implications:

Implications
------------

Easyconfig files that are deprecated or which use a deprecated toolchain are *not actively maintained*,
and are *no longer included in the EasyBuild regression test* (which means they may be broken by recent changes
to the EasyBuild framework or relevant easyblocks).

In a future major version of EasyBuild, these easyconfig files will be archived (see also :ref:`archived_easyconfigs`).

.. _deprecated_easyconfigs_toolchains:

Deprecated toolchains
---------------------

Overview of deprecated toolchains:

* :ref:`deprecated_easyconfigs_toolchains_foss`
* :ref:`deprecated_easyconfigs_toolchains_gompi`
* :ref:`deprecated_easyconfigs_toolchains_goolf`
* :ref:`deprecated_easyconfigs_toolchains_ictce`
* :ref:`deprecated_easyconfigs_toolchains_intel`


.. _deprecated_easyconfigs_toolchains_foss:

``foss`` toolchain
~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.9.4
* *will be archived in:* EasyBuild v4.0.0

The oldest versions of the ``foss`` toolchain have been deprecated,
which currently includes any version older than ``foss/2016a``.


.. _deprecated_easyconfigs_toolchains_gompi:

``gompi`` toolchain
~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.8.0
* *will be archived in:* EasyBuild v4.0.0

Versions of the ``gompi`` toolchain that were used as a subtoolchain for a deprecated toolchain
have also been deprecated; this includes ``gompi`` toolchain versions that match ``1.*``, and any version
older than ``gompi/2016a`` (the latter only since EasyBuild v3.9.4).


.. _deprecated_easyconfigs_toolchains_goolf:

``goolf`` and ``goolfc`` toolchains
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.8.0
* *will be archived in:* EasyBuild v4.0.0

The ``goolf`` and ``goolfc`` toolchains have been deprecated,
since they are superseded by the :ref:`common_toolchains_foss` and ``fosscuda`` toolchains, respectively.

The ``foss*`` toolchains are equivalent to the ``goolf*`` toolchains,
except that ``binutils`` is also included as a companion to ``GCC(core)`` in the ``foss*`` toolchains.


.. _deprecated_easyconfigs_toolchains_ictce:

``ictce`` toolchain
~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.8.0
* *will be archived in:* EasyBuild v4.0.0

The ``ictce`` toolchain has been deprecated, since it is superseded by the :ref:`common_toolchains_intel`.

The ``ictce`` toolchain is equivalent to ``intel`` w.r.t. toolchain components,
except that ``binutils`` is also included as a companion to ``GCC(core)`` (which serves as a base
for the Intel compilers) in the ``intel`` toolchain.


.. _deprecated_easyconfigs_toolchains_intel:

Oldest versions of the ``iccifort``, ``iimpi`` and ``intel`` toolchains
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* *deprecated since:* EasyBuild v3.8.0
* *will be archived in:* EasyBuild v4.0.0

The oldest versions of the ``iccifort``, ``iimpi`` and :ref:`common_toolchains_intel` have been deprecated,
since they are no longer considered relevant for recent systems.

More specifically, deprecated versions include:

* ``iccifort`` versions older than ``2016.1.150``
* ``iimpi`` versions older than ``2016.01``, except version ``8.1.5-*``
* ``intel`` versions older than ``2016a``
