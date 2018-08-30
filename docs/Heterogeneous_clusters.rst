.. _heterogeneous_clusters:

Heterogeneous clusters
=======================================

This page provides an overview on the different ways in which EasyBuild can be setup in heterogeneous clusters.

Here, by "heterogeneous clusters" we mean clusters with nodes that support different instruction sets, either
of the same family (e.g. Intel "broadwell", "skylake") or different ones (e.g. Intel "skylake", AMD "epyc").
There are other ways in which a cluster can be heterogeneous, e.g. different OS versions, and some of the options
covered here can be applied to those, but they will not be covered explicitly.

For some time now new instruction sets are how the most significant performance differences in new architectures
are realized. The most common example is the width and operations of vectorization extensions (e.g. SSE, AVX),
and so building software that takes advantage of those is crucial for HPC.

.. contents::
    :depth: 3
    :backlinks: none

.. _heterogenous_clusters_defaults:

Default behaviour of EasyBuild in heterogeneous clusters
--------------------------------------------------------

By default, EasyBuild optimizes builds for the CPU architecture of the build host, by instructing the compiler to
generate instructions for the highest instruction set supported by the process architecture of the build host
processor (cfr. :ref:`controlling_compiler_optimization_flags`).

In an heterogenous cluster, this means that the software may not run in nodes that do not support the build host's
instruction set (it would exit with an ``Illegal instruction`` error, in the case of software built with GNU toolchains,
or ``Please verify that both the operating system and the processor support X, Y and Z instructions`` for software built
with Intel toolchains), and that it will not be fully optimized when running in nodes that support higher instruction
sets than those of the build host. The first problem can be solved by building with ``--optarch=GENERIC``, but it will
make the second problem even worse.

(With an Intel toolchain, the problem can be reduced by generating multiple code paths with the ``-ax`` compiler option
in ``--optarch`` and by leveraging on MKL's automatic dispatch according to the execution node's instruction set, but no
such option is available (yet) in the GNU toolchains)

The solution is	then to	build multiple copies of each software,	at least for those where performance is	crucial, which is
easily achieved simply by running EasyBuild from each type of node, the caveat being where exactly to install copies for
different architectures in a way that they can be loaded, with their dependencies, and used effectively across the cluster
by all users.

.. _heterogeneous_clusters_visibility:                                                                                                                                                                                                         
Visibility of achitectures in heterogenous clusters
---------------------------------------------------
                                                           
One way of distinguishing between the many alternatives for using EasyBuild in an heterogeneous cluster concerns whether
each host only sees the software compiled for its own architecture (plus any software eventually compiled for ``GENERIC``)
or if it sees everything.

By mounting architecture dependent targets on the same mountpoint in every host, the configuration is then very similar to
what it would be in an homogeneous cluster, except that each (non-``GENERIC``) software still needs to be built for each
architecture.                                                                                                          

This can be more robust, in the sense that from the point of view of each node, it looks like an homogeneous cluster.
On the other hand, it is less flexible, as there are situations where it can be useful to load software built for another
instruction set (usually, a subset).

In order to maximize visibility and flexibility, all architectures can be visible, and the default architecture controlled
with an architecture environment variable inserted into ``EASYBUILD_INSTALLPATH`` and ``MODULEPATH``, at least.

.. _heterogenous_clusters_reducing_clutter:

Reducing clutter in heterogeneous clusters
------------------------------------------

In either of the two options above, multiple paths can be used to separate ``GENERIC`` software that only needs to be compiled
once, or not at all (template libraries and software only available in binary form), from software that needs to be optimized
for each architecture.

One specific case is the one of the Hierarchical Module Naming Scheme (HMNS), since the packages in the ``Core`` level are good
candidates for a single ``GENERIC`` build, but this needs to be done manually. Since most of the modules here are typically
built as dependencies, this option implies separately building all ``Core`` software with ``--optarch=GENERIC`` once before
building applications that depend on them. 

Alternatively, instead of using the hierarchy to decide what to build for a generic architecture, one could decide based on
the toolchain, e.g. by associating ``--optarch=GENERIC`` with the ``GCCcore`` toolchain.

...
