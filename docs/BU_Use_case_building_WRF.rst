
Use case: building WRF
======================

Building and installing WRF (Weather Research and Forecasting Model) 

- http://www.wrf-model.org
- complex(ish) dependency graph
- very non-standard build procedure
- interactive configure script (!) 
- resulting configure.wrf needs work (hardcoding, tweaking of options, ...) 
- compile script (wraps around make) 
- no actual installation step

XXX - ADD GRAPH


The easyblock that comes with EasyBuild implements a full build procedure.

- running interactive configure script autonomously
- patching configure.wrf 
- building with compile script 
- testing build with standard included tests/benchmarks 
- easyconfig files for different versions, toolchains, build options, ... 
- building and installing WRF becomes child’s play, for example:

   eb --software=WRF,3.4 --toolchain-name=ictce --robot

