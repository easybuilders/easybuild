.. _cray_support:

EasyBuild on Cray
=================

As of EasyBuild v2.7.0, Cray support (XC series) is considered stable and it enables building/installing software using the PrgEnv modules provided by Cray. This page provides an overview of the current status.

 For more information about this, contact Kenneth Hoste (HPC-UGent, Belgium; kenneth.hoste@ugent.be) and Petar Forai (IMBA/IMP, Austria; petar.forai@imp.ac.at).

Thanks to Olli-Pekka Letho (CSC.fi), Tim Robinson and Guilherme Peretti-Pezzi (CSCS.ch), and Eric Bavier (Cray) for providing us access to Cray systems and for their support.

Test systems
------------

* Piz Daint & Piz Dora @ CSCS.ch (http://www.cscs.ch/computers/piz_daint_piz_dora/index.html)
* Santis & Brisi (TDS) @ CSCS.ch
* Sisu @ CSC.fi (https://research.csc.fi/sisu-supercomputer)
* Swan (TDS) @ Cray

EasyBuild toolchains
--------------------

* CrayGNU: PrgEnv-gnu with pinned versions of gcc, cray-libsci and cray-mpich
* CrayIntel: PrgEnv-intel with pinned versions of intel, cray-libsci and cray-mpich
* CrayCCE: PrgEnv-cray with pinned versions of cce, cray-libsci and cray-mpich

versions:

* Cray*/2015.06-XC: PrgEnv-(*)/5.2.40 (Requires Cray PE June/2015)
* Cray*/2015.11-XC: PrgEnv-(*)/5.2.82 (Requires Cray PE November/2015)

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

Required EasyBuild configuration
--------------------------------


Modules tool 
~~~~~~~~~~~~
* Sisu: self-installed Lmod 5.8
* Piz Daint, Dora, Swan, Santis, Brisi: system-provided environment modules 3.2.10 

Example for C-modules::

 source /opt/modules/3.2.10.3/init/bash
 export PATH=/opt/modules/3.2.10.3/bin/:$PATH

Architecture 
~~~~~~~~~~~~

* the craype-<target> module to load must be specified using --optarch

  * e.g., --optarch=sandybridge results in craype-sandybridge being loaded in the build environment used by EasyBuild 

You can also export this option as a shell variable: Example for sandybridge::

 $ export EASYBUILD_OPTARCH=sandybridge

Metadata for Cray-provided modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Easybuild provides a sample metadata file in order to use modules provided by Cray:

::

 easybuild-framework/etc/cray_external_modules_metadata.cfg


* This file is loaded by default and contains enough information to build the easyconfig files shipped with EasyBuild
* If you need to use a customized file, it can be specified using --external-modules-metadata. For more details see :ref:`using_external_modules_metadata`

Major supported/tested applications
-----------------------------------

(in alphabetical order)

CP2K
~~~~

* http://www.cp2k.org
* version(s): 2.6.0

::
 
 $ eb CP2K-2.6.0-CrayGNU-2015.06-XC.eb -dr 

GROMACS
~~~~~~~

* http://www.gromacs.org
* version(s): 4.6.7

::

 eb GROMACS-4.6.7-CrayGNU-2015.06-XC-mpi.eb -dr 

HPL
~~~

* http://www.netlib.org/benchmark/hpl
* version(s): 2.1

::

 eb HPL-2.1-CrayCCE-2015.06-XC.eb -dr
 eb HPL-2.1-CrayGNU-2015.06-XC.eb -dr 
 eb HPL-2.1-CrayIntel-2015.06-XC.eb -dr 

Python + numpy/scipy
~~~~~~~~~~~~~~~~~~~~

* http://python.org, http://www.numpy.org, http://www.scipy.org
* version(s): Python 2.7.9, numpy 1.9.2, scipy 0.15.1

::

 eb Python-2.7.9-CrayGNU-2015.06-XC.eb -dr 
 # includes a few python packages (such as mpi4py, numpy and scipy)

WRF
~~~

* http://www.wrf-model.org
* version(s): 3.6.1

::

 eb WRF-3.6.1-CrayGNU-2015.06-XC-dmpar.eb --dr 
