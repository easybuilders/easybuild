.. _cray_support:

EasyBuild on Cray
=================

As of EasyBuild v2.7.0, the support for using EasyBuild on Cray systems is considered stable.
Tt enables building/installing software using the ``PrgEnv`` modules provided by Cray.
This page provides an overview of the current status.

For more information about this, contact:

* Guilherme Peretti-Pezzi (CSCS, Switzerland, peretti@cscs.ch)
* Kenneth Hoste (HPC-UGent, Belgium; kenneth.hoste@ugent.be)
* Petar Forai (IMBA/IMP, Austria; petar.forai@imp.ac.at).

Thanks to:

* Olli-Pekka Letho (CSC.fi)
* Tim Robinson and Guilherme Peretti-Pezzi (CSCS.ch)
* Eric Bavier (Cray)
* Brett Bode (NCSA)

for providing us access to Cray systems, for their support and for testing and contributing to this work.

Test systems
------------

* Piz Daint & Piz Dora @ CSCS.ch (http://www.cscs.ch/computers/piz_daint_piz_dora/index.html)
* Santis & Brisi (TDS) @ CSCS.ch
* Sisu @ CSC.fi (https://research.csc.fi/sisu-supercomputer)
* Swan (TDS) @ Cray
* Blue Waters @ NCSA

EasyBuild toolchains
--------------------

* ``CrayCCE``: ``PrgEnv-cray`` with pinned versions of ``cce``, ``cray-libsci`` and ``cray-mpich``
* ``CrayGNU``: ``PrgEnv-gnu`` with pinned versions of ``gcc``, ``cray-libsci`` and ``cray-mpich``
* ``CrayIntel``: ``PrgEnv-intel`` with pinned versions of ``intel``, ``cray-libsci`` and ``cray-mpich``
* ``CrayPGI``: ``PrgEnv-pgi`` with pinned versions of ``pgi`` and ``cray-mpich``

versions:

* ``Cray{CCE,GNU,Intel}/2015.06`` (requires Cray PE June/2015)
* ``Cray{CCE,GNU,Intel}/2015.11`` (requires Cray PE November/2015)
* ``CrayGNU/2016.03`` (requires Cray PE March/2016)
* ``Cray{GNU,PGI}/2016.04`` (requires Cray PE April/2016)
* ``Cray{GNU,Intel}/2016.06`` (requires Cray PE June/2016)

What works already?
-------------------
(see below for more information)

*  **HPL** (LINPACK) benchmark version 2.1

Major scientific software applications
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **CP2K** 2.6.0
* **GROMACS** 4.6.7
* **Python** 2.7.9 + numpy 1.9.2 + scipy 0.15.1
* **WRF** 3.6.1 (pending on Sisu)

An up-to-date list of software applications built on Cray systems at CSCS can be found https://github.com/eth-cscs/production/,
see https://github.com/eth-cscs/production/tree/master/jenkins-builds .

Required EasyBuild configuration
--------------------------------


Modules tool 
~~~~~~~~~~~~
* Sisu: self-installed Lmod 5.8
* Piz Daint, Dora, Swan, Santis, Brisi: system-provided environment modules 3.2.10 

Example for environment modules 3.2.10::

 source /opt/modules/3.2.10.3/init/bash
 export PATH=/opt/modules/3.2.10.3/bin/:$PATH
 export EASYBUILD_MODULES_TOOL=EnvironmentModulesC
 export EASYBUILD_MODULE_SYNTAX=Tcl

Architecture 
~~~~~~~~~~~~

* the ``craype-<target>`` module to load must be specified using ``--optarch``

  * e.g., ``--optarch=sandybridge`` results in ``craype-sandybridge`` being loaded in the build environment used by EasyBuild 

You can also export this option as a shell variable. Example for ``sandybridge``::

 $ export EASYBUILD_OPTARCH=sandybridge

Metadata for Cray-provided modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Easybuild provides a sample metadata file in order to use modules provided by Cray:

::

 easybuild-framework/etc/cray_external_modules_metadata.cfg


This file is loaded by default and contains enough information to build the easyconfig files shipped with EasyBuild.

If you need to use a customized file, it can be specified using ``--external-modules-metadata``.
For more details see :ref:`using_external_modules_metadata`.

Major supported/tested applications
-----------------------------------

(in alphabetical order)

CP2K
~~~~

* http://www.cp2k.org
* version(s): 2.6.0

::
 
 $ eb CP2K-2.6.0-CrayGNU-2015.06.eb -dr 

GROMACS
~~~~~~~

* http://www.gromacs.org
* version(s): 4.6.7

::

 eb GROMACS-4.6.7-CrayGNU-2015.06-mpi.eb -dr 

HPL
~~~

* http://www.netlib.org/benchmark/hpl
* version(s): 2.1

::

 eb HPL-2.1-CrayCCE-2015.06.eb -dr
 eb HPL-2.1-CrayGNU-2015.06.eb -dr 
 eb HPL-2.1-CrayIntel-2015.06.eb -dr 

Python + numpy/scipy
~~~~~~~~~~~~~~~~~~~~

* http://python.org, http://www.numpy.org, http://www.scipy.org
* version(s): Python 2.7.9, numpy 1.9.2, scipy 0.15.1

::

 eb Python-2.7.9-CrayGNU-2015.06.eb -dr 
 # includes a few python packages (such as mpi4py, numpy and scipy)

WRF
~~~

* http://www.wrf-model.org
* version(s): 3.6.1

::

 eb WRF-3.6.1-CrayGNU-2015.06-dmpar.eb --dr 
