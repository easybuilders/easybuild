
Introduction
------------

EasyBuild is motivated by the need for a tool that combines the following features:

  * a **flexible framework** for building/installing (scientific) software
     * divert from the standard ``configure`` / ``make`` / ``make install`` with custom procedures
  * fully **automates** software builds
  * allows for **reproducible** builds 
  * keep the software build recipes/specifications **simple and human-readable**
  * supports **co-existence of versions/builds**
  * enables **sharing** with the HPC community (win-win situation)
  * automagic **dependency resolution**
  * **generates module files**
  * **retain logs** for traceability of the build processes

Some key features of EasyBuild:

 * build & install software **fully autonomously**
    * also interactive installers, code patching, generating module file, ...
 * easily :ref:`**configurable** <configuring_easybuild>`: config file/environment/command line
    * including aspects like module naming scheme
 * thorough logging and archiving (see :doc:`Logfiles`)
    * entire build process is logged thoroughly, logs are stored in install directory;
    * easyconfig file used for build is archived (install directory + file/svn/git repo) 
 * automatic **dependency resolution** (see :ref:`use_robot`)
    * build entire software stack with a single command, using ``--robot``
 * building software in **parallel**
    * e.g., on a (PBS) cluster, using ``--job``
 * comprehensive **testing**: unit tests, regression testing 
 * thriving, growing **community**

Take a look at our HUST'14 workshop paper
`Modern Scientific Software Management Using EasyBuild and Lmod <http://hpcugent.github.io/easybuild/files/hust14_paper.pdf>`_
and use that as a reference in case you present academic work mentioning EasyBuild.
