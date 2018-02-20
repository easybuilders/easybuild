.. _singularity_support:

EasyBuild Singularity 0.2
===========================

Singularity Options
-------------------

``eb`` comes with a few options to control singularity configuration for creating
singularity recipe and containers.

See below for the Singularity options.

.. code::

   Singularity options:
       Options passed to EasyBuild for generating Singularity definition files. (configfile section singularity)

   --buildimage        Build container will require sudo privileges!  (def False)
   --imageformat=IMAGEFORMAT
                           Image format for singularity container. (type choice; def squashfs) (choices: squashfs, ext3, sandbox)
   --imagename=IMAGENAME
                           Custom name of image (defaults to name of easyconfig)
   --import-easyblock-repo=IMPORT-EASYBLOCK-REPO
                           Import easyblock repo in the container build. Format: --import-easyblock-repo=https://github.com/GITUSER/easybuild-easyblock:<BRANCH>:<FILE>
                           (type <type 'str'>; def '')
    --import-easyconfig-repo=IMPORT-EASYCONFIG-REPO
                            Import easyconfig repo in the container build. Format: --import-easyconfig-repo=https://github.com/GITUSER/easybuild-easyconfigs:<BRANCH>
                            (type <type 'str'>; def '')
    --singularity       Enabling Singularity Integration (def False)
    --singularity-bootstrap=SINGULARITY-BOOTSTRAP
                             Singularity bootstrap agent.   Format: --singularity-bootstrap localimage:/path/to/image.img --singularity-bootstrap shub:<image>:<tag>
                        --singularity-bootstrap docker:<image>:<tag>  (type <type 'str'>; def '')

    --singularitypath=SINGULARITYPATH
                            Path where definition and container will be written.  (def /home/siddis14/.local/easybuild/singularity)



You must specify ``--singularity`` and ``--singularity-bootstrap`` with ``eb`` to tell Easybuild to enable Singularity and specify
a bootstrap agent. Easybuild will generate recipe files and build container if ``--buildimage`` is specified. 

Easybuild will write recipe and container in directory specified by ``--singularitypath``. By default this will be ``$HOME/.local/easybuild/singularity`` but this can be changed to any directory in filesystem


You can alter the singularity path by setting the configuration in command line, environment variable, or configuration file.

To specify the path on command line use the following

.. code::

        eb --singularitypath=/path/to/easybuild_singularity
        
       
To specify the path using environment variable use the environment **EASYBUILD_SINGULARITYPATH**
 
.. code::
 
        export EASYBUILD_SINGULARITYPATH=$HOME
        eb --show-full-config | grep singularitypath
        singularitypath                           (E) = /home/siddis14

To set singularitypath in configuration file you can do the following

.. code::

        [config]
        singularitypath = /lustre
        

If you are building containers please choose a path in filesystem with decent storage so you don't run into space issue. Singularity
will pull metadata during the builds and each image can range from several hundred MBs to few GBs depending on application. 

Singularity Recipes
-------------------

easybuild will generate singularity recipe files that are used for building Singularity containers. Users can build containers on-prem or cloud. You may build your containers through ``singularity`` command or use ``eb --buildimage`` which will invoke ``singularity build``. You must be root to do this operation. Also note you must have singularity 2.4 to use this feature since eb will invoke ``singularity build`` prior version of singularity used ``singularity bootstrap`` which is deprecated 

If you dont have root, you may upload your recipe to github and use Singularity Hub to build your containers.

To get started there is a bootstrap easybuild singularity container for centos 7.3.1611 and centos 7.4.1708 in Singularity HUB. You may pull these containers from SHUB to see how they are build.

.. code::

        singularity pull shub://shahzebsiddiqui/eb-singularity:centos-7.3.1611
        singularity pull shub://shahzebsiddiqui/eb-singularity:centos-7.4.1708

You will be using these images with ``--singularity-bootstrap`` to initialize the base environment to build your easybuild apps.

Shown below is an examples for building Anaconda3 with centos 7.3

.. code::

        
        $  eb Anaconda3-5.0.1.eb --singularity --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611
        == temporary log file in case of crash /tmp/eb-Mv7p_5/easybuild-JSlXlo.log
        Singularity tool found at /usr/local/bin/singularity
        Singularity version is 2.4 or higher ... OK
        Singularity Version is 2.4
        Writing Singularity Definition File: /home/siddis14/.local/easybuild/singularity/Singularity.Anaconda3-5.0.1      
        
By default easybuild singularity supports EasyBuildMNS module naming scheme but option was added to support HiearchicalMNS. Adding this option further complicates environment inside container and depending on community feedback this option could be deprecated for Singularity. The easybuild bootstrap installs Lmod and assumes eb will generate Lua modules. In HierarchicalMNS you will have a different moduletree path as pose to EasyBuildMNS. To demonstrate this example see the difference in %environment section with EasyBuildMNS and HierarchicalMNS

.. code::
        
        eb Anaconda3-5.0.1.eb --singularity --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611
        
        BootStrap: shub
        From: shahzebsiddiqui/eb-singularity:centos-7.3.1611

        %post
        su - easybuild
        eb Anaconda3-5.0.1.eb --robot --installpath=/app/ --prefix=/scratch --tmpdir=/scratch/tmp  --module-naming-scheme=EasyBuildMNS
        exit
        rm -rf /scratch/tmp/*
        rm -rf /scratch/build
        rm -rf /scratch/sources
        rm -rf /scratch/ebfiles_repo

        %runscript
        eval "$@"

        %environment
        source /etc/profile
        module use /app/modules/all/
        module load Anaconda3/5.0.1

        %labels

.. code::
        
        eb Anaconda3-5.0.1.eb --singularity --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --module-naming-scheme=HierarchicalMNS
        
        BootStrap: shub
        From: shahzebsiddiqui/eb-singularity:centos-7.3.1611

        %post
        su - easybuild
        eb Anaconda3-5.0.1.eb --robot --installpath=/app/ --prefix=/scratch --tmpdir=/scratch/tmp  --module-naming-scheme=HierarchicalMNS
        exit
        rm -rf /scratch/tmp/*
        rm -rf /scratch/build
        rm -rf /scratch/sources
        rm -rf /scratch/ebfiles_repo

        %runscript
        eval "$@"

        %environment
        source /etc/profile
        module use /app/modules/all/Core
        module load Anaconda3/5.0.1

        %labels

  
You may change singularity bootstrap agent to docker or localimage. localimage bootstrap can be particularly useful if you plan to build 
images on-prem. Let's suppose you do the following
        
.. code::

        cd $HOME
        singularity pull shub://shahzebsiddiqui/eb-singularity:centos-7.3.1611

Now you can specify localimage as bootstrap as follows

.. code::

        eb Anaconda3-5.0.1.eb --singularity --singularity-bootstrap localimage:$HOME/shahzebsiddiqui-eb-singularity-eb_images.simg

Build images
-------------

To build singuality image use --buildimage. You should be root on your system or have sudo rights. If you have sudo rights you will be requested to type your password as shown below

.. code::

        $ eb M4-1.4.18.eb --singularity --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --buildimage
        == temporary log file in case of crash /tmp/eb-mgtgIn/easybuild-Qsznaj.log
        Singularity tool found at /usr/local/bin/singularity
        Singularity version is 2.4 or higher ... OK
        Singularity Version is 2.4
        Writing Singularity Definition File: /home/siddis14/.local/easybuild/singularity/Singularity.M4-1.4.18
        [sudo] password for siddis14:


A typical build inside container will look like this. Note that ``eb --robot`` is set in all recipe files to ensure all
dependencies are build.

.. code::

        [sudo] password for siddis14:
        Using container recipe deffile: Singularity.M4-1.4.18
        Sanitizing environment
        Adding base Singularity environment to container
        Progress |===================================| 100.0%
        Exporting contents of shub://shahzebsiddiqui/eb-singularity:centos-7.3.1611 to /tmp/.singularity-build.8rSz3L
        User defined %runscript found! Taking priority.
        Adding environment to container
        Lmod has detected the following error: The following module(s) are unknown:
        "M4/1.4.18"

        Please check the spelling or version number. Also try "module spider ..."




        Running post scriptlet
        + su - easybuild
        == temporary log file in case of crash /scratch/tmp/eb-mDNplx/easybuild-fDXtjQ.log
        == resolving dependencies ...
        == processing EasyBuild easyconfig /usr/easybuild/easyconfigs/m/M4/M4-1.4.18.eb
        == building and installing M4/1.4.18...
        == fetching files...
        == creating build dir, resetting environment...
        == unpacking...
        == patching...
        == preparing...
        == configuring...
        == building...
        == testing...
        == installing...
        == taking care of extensions...
        == postprocessing...
        == sanity checking...
        == cleaning up...
        == creating module...
        == permissions...
        == packaging...
        == COMPLETED: Installation ended successfully
        == Results of the build can be found in the log file(s) /app/software/M4/1.4.18/easybuild/easybuild-M4-1.4.18-20180219.194157.log
        == Build succeeded for 1 out of 1
        == Temporary log file(s) /scratch/tmp/eb-mDNplx/easybuild-fDXtjQ.log* have been removed.
        == Temporary directory /scratch/tmp/eb-mDNplx has been removed.
        + rm -rf '/scratch/tmp/*'
        + rm -rf /scratch/build
        + rm -rf /scratch/sources
        + rm -rf /scratch/ebfiles_repo
        Adding deffile section labels to container
        Adding runscript
        Found an existing definition file
        Adding a bootstrap_history directory
        Finalizing Singularity container


Casecade builds for easybuild toolchain
----------------------------------------

Since easybuild invokes ``eb --robot`` in the recipe file, this can be problematic when building larger toolchains like ``GCCcore``, ``GCC``, ``gompi``, ``foss`` which will build the entire dependency list inside container that can increase container size and build time. To avoid this situation, try building the toolchains from bottom up and using them to bootstrap other toolchains.

Lets assume you are building ``GCCcore-5.4.0``, ``GCC-5.4.0-2.26``, ``gompi-2016.06`` and ``foss-2016.06``. 

First build GCCcore-5.4.0

.. code::

        eb GCCcore-5.4.0.eb --singularity --singularity-bootstrap --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --buildimage

Once the image is built, assuming it is in default path do the following for GCC-5.4.0-2.26

.. code::

        eb GCC-5.4.0-2.26.eb --singularity --singularity-bootstrap localimage:$HOME/.local/easybuild/singularity/GCCcore-5.4.0.simg --buildimage

Afterwards build gomp-2016.06 using GCC-5.4.0-2.26 container image

.. code::

        eb gompi-2016.06.eb --singularity --singularity-bootstrap localimage:$HOME/.local/easybuild/singularity/GCC-5.4.0-2.26.simg --buildimage

Next build foss-2016.06 using gompi-2016.06 image

.. code::

        eb foss-2016.06.eb --singularity --singularity-bootstrap localimage:$HOME/.local/easybuild/singularity/gompi-2016.06.simg --buildimage

Image Formats
--------------

Singularity support three image formats ``squashfs`` ``sandbox`` ``ext3``. The default image format is squashfs with extension ``.simg``. ext3 has image format ``.img`` which can be used to edit container as root whereas squashfs this is not allowed. Sandbox
will create a directory structure for container image. For more details on image format see http://singularity.lbl.gov/docs-build-container 

Example using ext3 image format

.. code::

        eb M4-1.4.18.eb --singularity --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --buildimage --imageformat=ext3
        

Example using sandbox image format

.. code::

        eb M4-1.4.18.eb --singularity --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --buildimage --imageformat=sandbox


See how the three image formats

.. code::

        $ ls -l ~/.local/easybuild/singularity/M4-1.4.18*
        -rw-r--r--  1 siddis14 root 908066816 Feb 19 15:28 /home/siddis14/.local/easybuild/singularity/M4-1.4.18.img
        -rwxr-xr-x  1 siddis14 root 225968159 Feb 19 14:42 /home/siddis14/.local/easybuild/singularity/M4-1.4.18.simg

        /home/siddis14/.local/easybuild/singularity/M4-1.4.18:
        total 18
        drwxr-xr-x 2 siddis14 root 2048 Oct 24 08:25 dev
        lrwxr-xr-x 1 siddis14 root   36 Oct 24 08:25 environment -> .singularity.d/env/90-environment.sh
        drwxr-xr-x 2 siddis14 root 2048 Oct 24 08:25 etc
        drwxr-xr-x 2 siddis14 root 2048 Oct 24 08:25 home
        drwxr-xr-x 2 siddis14 root 2048 Oct 24 08:25 proc
        drwxr-xr-x 2 siddis14 root 2048 Oct 24 08:25 root
        lrwxr-xr-x 1 siddis14 root   24 Oct 24 08:25 singularity -> .singularity.d/runscript
        drwxr-xr-x 2 siddis14 root 2048 Oct 24 08:25 sys
        drwxr-xr-x 2 siddis14 root 2048 Oct 24 08:25 tmp
        drwxr-xr-x 3 siddis14 root 2048 Oct 24 08:25 var


If you want to specify an alternate path to write container and recipe file use ``--singularitypath`` 

.. code::

        eb Bison-3.0.4.eb --singularity --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --buildimage --singularitypath=/lustre/workspace/home/siddis14/eb_images

If you want to modify the name of the generated image you can use ``--imagename``. Please note that ``.img`` or ``.simg`` is added to file name if you are building as squashfs or ext3

.. code::

        $ eb M4-1.4.17.eb --singularity --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --buildimage --imagename=M4
        == temporary log file in case of crash /tmp/eb-w8loVP/easybuild-8NZ6vg.log
        Singularity tool found at /usr/local/bin/singularity
        Singularity version is 2.4 or higher ... OK
        Singularity Version is 2.4
        Writing Singularity Definition File: /home/siddis14/.local/easybuild/singularity/Singularity.M4-1.4.17
        M4
        Using container recipe deffile: Singularity.M4-1.4.17
        Sanitizing environment
        Adding base Singularity environment to container
        Exporting contents of shub://shahzebsiddiqui/eb-singularity:centos-7.3.1611 to /tmp/.singularity-build.n3pfOS
        User defined %runscript found! Taking priority.
        Adding environment to container
        Lmod has detected the following error: The following module(s) are unknown:
        "M4/1.4.17"

        Please check the spelling or version number. Also try "module spider ..."




        Running post scriptlet
        + su - easybuild
        == temporary log file in case of crash /scratch/tmp/eb-RiEUIa/easybuild-KpvEy2.log
        == resolving dependencies ...
        == processing EasyBuild easyconfig /usr/easybuild/easyconfigs/m/M4/M4-1.4.17.eb
        == building and installing M4/1.4.17...
        == fetching files...
        == creating build dir, resetting environment...
        == unpacking...
        == patching...
        == preparing...
        == configuring...
        == building...
        == testing...
        == installing...
        == taking care of extensions...
        == postprocessing...
        == sanity checking...
        == cleaning up...
        == creating module...
        == permissions...
        == packaging...
        == COMPLETED: Installation ended successfully
        == Results of the build can be found in the log file(s) /app/software/M4/1.4.17/easybuild/easybuild-M4-1.4.17-20180219.202811.log
        == Build succeeded for 1 out of 1
        == Temporary log file(s) /scratch/tmp/eb-RiEUIa/easybuild-KpvEy2.log* have been removed.
        == Temporary directory /scratch/tmp/eb-RiEUIa has been removed.
        + rm -rf '/scratch/tmp/*'
        + rm -rf /scratch/build
        + rm -rf /scratch/sources
        + rm -rf /scratch/ebfiles_repo
        Adding deffile section labels to container
        Adding runscript
        Found an existing definition file
        Adding a bootstrap_history directory
        Finalizing Singularity container


        
        $ ls -l ~/.local/easybuild/singularity/M4.simg
        -rwxr-xr-x 1 siddis14 root 225988639 Feb 19 15:28 /home/siddis14/.local/easybuild/singularity/M4.simg


Custom easyconfig/easyblock repo in container
----------------------------------------------

So far we have been building singularity containers based on easyconfig provided by master repo, users may want to use their
own easyconfig repo to build application. To do this you can use ``--import-easyconfig-repo`` and ``--import-easyblock-repo`` flags.

With these parameters, user must specify path to github repo for easybuild-easyconfigs and easybuild-easyblocks repo along with branch name. This feature is experimental! Further check needs to be done for error handling.

.. code::

        eb CUDA-9.0.176.eb --singularity --import-easyconfig-repo https://github.com/shahzebsiddiqui/easybuild-easyconfigs:master --import-easyblock-repo https://github.com/shahzebsiddiqui/easybuild-easyblocks:master:c/cuda.py --singularity-bootstrap shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611
        == temporary log file in case of crash /tmp/eb-mD4M0v/easybuild-oYJ2Uj.log

        WARNING: Found one or more non-allowed loaded (EasyBuild-generated) modules in current environment:
        * Anaconda2/4.2.0

        This is not recommended since it may affect the installation procedure(s) performed by EasyBuild.

        To make EasyBuild allow particular loaded modules, use the --allow-loaded-modules configuration option.
        To specify action to take when loaded modules are detected, use --detect-loaded-modules={error,ignore,purge,unload,warn}.

        See http://easybuild.readthedocs.io/en/latest/Detecting_loaded_modules.html for more information.

        Singularity tool found at /usr/local/bin/singularity
        Singularity version is 2.4 or higher ... OK
        Singularity Version is 2.4
        Writing Singularity Definition File: /lustre/workspace/home/siddis14/eb_images/Singularity.CUDA-9.0.176
        [sudo] password for siddis14:
        Using container recipe deffile: Singularity.CUDA-9.0.176
        Sanitizing environment
        Adding base Singularity environment to container
        Progress |===================================| 100.0%
        Exporting contents of shub://shahzebsiddiqui/eb-singularity:centos-7.3.1611 to /tmp/.singularity-build.qUG7M7
        User defined %runscript found! Taking priority.
        Adding environment to container
        Lmod has detected the following error: The following module(s) are unknown:
        "CUDA/9.0.176"

        Please check the spelling or version number. Also try "module spider ..."




        Running post scriptlet
        + su - easybuild
        Cloning into 'easybuild-easyconfigs'...
        remote: Counting objects: 173752, done.
        remote: Compressing objects: 100% (40/40), done.
        remote: Total 173752 (delta 16), reused 1 (delta 1), pack-reused 173711
        Receiving objects: 100% (173752/173752), 30.74 MiB | 29.55 MiB/s, done.
        Resolving deltas: 100% (104807/104807), done.
        Cloning into 'easybuild-easyblocks'...
        remote: Counting objects: 41830, done.
        remote: Total 41830 (delta 0), reused 0 (delta 0), pack-reused 41830
        Receiving objects: 100% (41830/41830), 8.41 MiB | 0 bytes/s, done.
        Resolving deltas: 100% (24806/24806), done.
        == temporary log file in case of crash /scratch/tmp/eb-M2MeSQ/easybuild-HLALcJ.log
        == resolving dependencies ...
        == processing EasyBuild easyconfig /home/easybuild/easybuild-easyconfigs/easybuild/easyconfigs/c/CUDA/CUDA-9.0.176.eb
        == building and installing CUDA/9.0.176...
        == fetching files...
        == creating build dir, resetting environment...
        == unpacking...
        == patching...
        == preparing...
        == configuring...
        == building...
        == testing...
        == installing...
        == taking care of extensions...
        == postprocessing...
        == sanity checking...
        == cleaning up...
        == creating module...
        == permissions...
        == packaging...
        == COMPLETED: Installation ended successfully
        == Results of the build can be found in the log file(s) /app/software/CUDA/9.0.176/easybuild/easybuild-CUDA-9.0.176-20180217.022558.log
        == Build succeeded for 1 out of 1
        == Temporary log file(s) /scratch/tmp/eb-M2MeSQ/easybuild-HLALcJ.log* have been removed.
        == Temporary directory /scratch/tmp/eb-M2MeSQ has been removed.
        + rm -rf '/scratch/tmp/*'
        + rm -rf /scratch/build
        + rm -rf /scratch/sources
        + rm -rf /scratch/ebfiles_repo
        Adding deffile section labels to container
        Adding runscript
        Found an existing definition file
        Adding a bootstrap_history directory
        Finalizing Singularity container


The generated Singularity file is the following, note we are doing git clone as ``easybuild`` user and setting the environment variables 
to get the easyconfigs and easyblocks process

.. code::

        $ cat Singularity.CUDA-9.0.176
        BootStrap: shub
        From: shahzebsiddiqui/eb-singularity:centos-7.3.1611

        %post
        su - easybuild
        git clone -b master https://github.com/shahzebsiddiqui/easybuild-easyconfigs
        export EASYBUILD_ROBOT_PATHS=/home/easybuild/easybuild-easyconfigs/easybuild/easyconfigs
        git clone -b master https://github.com/shahzebsiddiqui/easybuild-easyblocks
        export EASYBUILD_INCLUDE_EASYBLOCKS=/home/easybuild/easybuild-easyblocks/easybuild/easyblocks/c/cuda.py
        eb CUDA-9.0.176.eb --robot --installpath=/app/ --prefix=/scratch --tmpdir=/scratch/tmp  --module-naming-scheme=EasyBuildMNS
        rm -rf easybuild-easyconfigs
        rm -rf easybuild-easyblocks
        exit
        rm -rf /scratch/tmp/*
        rm -rf /scratch/build
        rm -rf /scratch/sources
        rm -rf /scratch/ebfiles_repo

        %runscript
        eval "$@"

        %environment
        source /etc/profile
        module use /app/modules/all/
        module load CUDA/9.0.176

        %labels
