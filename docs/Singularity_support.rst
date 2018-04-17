.. _singularity_support:

EasyBuild Singularity (Experimental)
====================================

Singularity Options
-------------------

``eb`` comes with a several options to control singularity configuration for creating
singularity recipe and containers.

Shown below is a list of container options.

.. code::


   -C, --containerize  Generate container recipe/image (def False)

    --containerpath=CONTAINERPATH
                        Location where container recipe & image will be stored (def /home/siddis14/.local/easybuild/containers)

  Container options:
    Options related to generating container recipes & images (configfile section container)

    --container-base=BASE
                        Base for container image. Examples (for Singularity): --container-base localimage:/path/to/image.img, --container-base shub:<image>:<tag>, --container-base docker:<image>:<tag>
                        (type <type 'str'>)
    --container-build-image
                        Build container image (requires sudo privileges!) (def False)
    --container-image-format=IMAGE-FORMAT
                        Container image format (type choice) (choices: ext3, sandbox, squashfs)
    --container-image-name=IMAGE-NAME
                        Custom name for container image (defaults to name of easyconfig)
    --container-type=TYPE
                        Type of container recipe/image to create (type choice; def singularity) (choices: docker, singularity)


EasyBuild Base Containers
-------------------------

To get started there are two easybuild bootstrap containers for centos 7.3.1611 and centos 7.4.1708 in Singularity HUB. You may pull these containers from SHUB to see how they are built.

.. code::

        singularity pull shub://shahzebsiddiqui/eb-singularity:centos-7.3.1611
        singularity pull shub://shahzebsiddiqui/eb-singularity:centos-7.4.1708

You will be using these images with ``--container-base`` with ``shub`` option to initialize the base container (i.e Bootstrap)

In the future, easybuild will provide a few base containers that could be available in SHUB and DockerHUB.


Modifying Container Path
------------------------

You may want to modify path where to write container and recipe file. This can be done at the command line ``--containerpath``, environment variable ``EASYBUILD_CONTAINERPATH`` or configuration file
``$HOME/.local/easybuild/config.cfg``


The default path will be ``$HOME/.local/easybuild/containers`` but this can be changed to any directory in filesystem


Command Line
~~~~~~~~~~~~

.. code::

        eb --containerpathpath=/path/to/easybuild_containers


Environment Variable
~~~~~~~~~~~~~~~~~~~~

.. code::

        export EASYBUILD_CONTAINERPATH=$HOME
        eb --show-full-config | grep containerpath
        containerpath                           (E) = /home/siddis14

Configuration File
~~~~~~~~~~~~~~~~~~

.. code::

        [config]
        containerpath = /path/to/easybuild_containers


.. Note::

    If you are building containers please choose a path in filesystem with sufficient storage so you don't run out of space. Singularity
    will pull metadata during the builds and each image can range from several hundred MBs to few GBs depending on application.

Singularity Recipes
-------------------

easybuild will generate singularity recipe files that are used for building Singularity containers. Users can build containers on-prem or cloud. You may build your containers through ``singularity`` command or use ``eb --container-build`` which will invoke ``sudo singularity build``. You must be root to do this operation or have sudo rights. Also note you must have singularity 2.4 to use this feature since eb will invoke ``singularity build`` prior version of singularity used ``singularity bootstrap`` which is deprecated

If you dont have root, you may upload your recipe to github and use Singularity Hub to build your containers.

Getting Started
---------------

In order to use easybuild with singularity you must use the option ``--experimental`` for the time being.

If you want to build the singularity recipe for ``M4-1.4.17.eb`` with the base container ``shahzebsiddiqui/eb-singularity:centos-7.3.1611`` then you can do the following

.. code::

   $ eb M4-1.4.17.eb -C --experimental --container-base shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611
   == temporary log file in case of crash /tmp/eb-nuDM_3/easybuild-Y0PyDr.log
   == Singularity definition file created at /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17
   == Temporary log file(s) /tmp/eb-nuDM_3/easybuild-Y0PyDr.log* have been removed.
   == Temporary directory /tmp/eb-nuDM_3 has been removed.

The recipe file will be in the format ``Singularity.<easyconfig>`` by default which is the intended if you plan to build these containers in SHUB. For more information on Singularity Recipes for Singularity Hub see https://github.com/singularityhub/singularityhub.github.io/wiki/Build-A-Container 

If you try rerunning the command you will get the following error

.. code::

  $ eb M4-1.4.17.eb -C --experimental --container-base shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611
   == temporary log file in case of crash /tmp/eb-t75EMP/easybuild-3c0F9i.log
   ERROR: Container recipe at /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17 already exists, not overwriting it without --force


This was intended to avoid overwriting singularity recipe files so in this case use the ``--force`` option to overwrite the recipe file.

.. code::

  $ eb M4-1.4.17.eb -C --experimental --container-base shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --force
   == temporary log file in case of crash /tmp/eb-6wPdUe/easybuild-b9EzD_.log
   == WARNING: overwriting existing container recipe at /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17 due to --force
   == Singularity definition file created at /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17
   == Temporary log file(s) /tmp/eb-6wPdUe/easybuild-b9EzD_.log* have been removed.
   == Temporary directory /tmp/eb-6wPdUe has been removed.


If you want to build a container and have sudo rights you may run the ``--container-build`` option. If you don't have sudo rights either copy the recipe to a system where you have sudo rights or build it in Singularity Hub. 

.. code::

   $ eb M4-1.4.17.eb -C --experimental --container-base shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --force --container-build
   == temporary log file in case of crash /tmp/eb-WTrmaL/easybuild-zrAnfe.log
   == Singularity tool found at /usr/local/bin/singularity
   == Singularity version '2.4' is 2.4 or higher ... OK
   == WARNING: overwriting existing container recipe at /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17 due to --force
   == Singularity definition file created at /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17
   == Running 'sudo singularity build  /home/siddis14/.local/easybuild/containers/M4-1.4.17.simg /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17', you may need to enter your 'sudo' password...
   [sudo] password for siddis14:
   == Singularity image created at /home/siddis14/.local/easybuild/containers/M4-1.4.17.simg
   == Temporary log file(s) /tmp/eb-WTrmaL/easybuild-zrAnfe.log* have been removed.
   == Temporary directory /tmp/eb-WTrmaL has been removed.

easybuild will build containers using squashfs format (.simg) which is the default image format for singularity containers. Now that you have a container you may shell inside the environment and see the modules. Note you must be in interactive shell (``singularity shell -s /bin/bash``) inside the container if you want ``module`` command to work properly inside the container. This is only an issue with bash and Lmod for more details see https://lmod.readthedocs.io/en/latest/030_installing.html#issues-with-bash 

.. code::

   $ singularity shell -s /bin/bash /home/siddis14/.local/easybuild/containers/M4-1.4.17.simg
   Singularity: Invoking an interactive shell within container...

   Singularity> ml av

   ---------------------------------------------------------------------------------------------- /app/modules/all -----------------------------------------------------------------------------------------------
      M4/1.4.17 (L)

   ------------------------------------------------------------------------------------ /usr/share/lmod/lmod/modulefiles/Core ------------------------------------------------------------------------------------
      lmod/6.5.1    settarg/6.5.1


Note that module will be loaded automatically , if you want to test m4 you may do the following. Note that you don't need to load any module since this is done automatically

.. code::

   $ singularity exec  /home/siddis14/.local/easybuild/containers/M4-1.4.17.simg m4 --version

   m4 (GNU M4) 1.4.17
   Copyright (C) 2013 Free Software Foundation, Inc.
   License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
   This is free software: you are free to change and redistribute it.
   There is NO WARRANTY, to the extent permitted by law.
   

easybuild will install apps in ``/app/`` so you can run ``which`` command to determine if your binary is from easybuild or a system binary

.. code::

   $ singularity exec  /home/siddis14/.local/easybuild/containers/M4-1.4.17.simg which m4
   /app/software/M4/1.4.17/bin/m4


Other Bootstrap options
-----------------------


You may change singularity bootstrap agent to docker or localimage. localimage bootstrap can be useful if you plan to build
containers on-prem. Let's suppose you do the following

.. code::

        cd $HOME
        singularity pull shub://shahzebsiddiqui/eb-singularity:centos-7.3.1611

Now you can specify localimage as bootstrap as follows

.. code::

   [siddis14@amrndhl1157 easybuild-framework]$ eb Anaconda3-4.2.0.eb -C --container-base localimage:$HOME/shahzebsiddiqui-eb-singularity-eb_images.simg --experimental
   == temporary log file in case of crash /tmp/eb-Wml38a/easybuild-0084Nv.log
   == Singularity definition file created at /home/siddis14/.local/easybuild/containers/Singularity.Anaconda3-4.2.0
   == Temporary log file(s) /tmp/eb-Wml38a/easybuild-0084Nv.log* have been removed.
   == Temporary directory /tmp/eb-Wml38a has been removed.

If we peek into the recipe file we notice the ``Bootstrap:`` section is will use ``localimage`` and ``From:`` will use the container we pulled.

.. code::

   [siddis14@amrndhl1157 easybuild-framework]$ head  /home/siddis14/.local/easybuild/containers/Singularity.Anaconda3-4.2.0

   Bootstrap: localimage
   From: /home/siddis14/shahzebsiddiqui-eb-singularity-eb_images.simg

easybuild will do some checks to ensure you specify a valid container for bootstrapping the container. For instance if user specifies an invalid path you will get the following

.. code::

   [siddis14@amrndhl1157 easybuild-framework]$ eb Anaconda3-4.2.0.eb -C --container-base localimage:$HOME/shahzebsiddiqui-eb-singularity-eb_images.simg1 --experimental
   == temporary log file in case of crash /tmp/eb-uBjx2_/easybuild-MrhODZ.log
   ERROR: Singularity base image at specified path does not exist: /home/siddis14/shahzebsiddiqui-eb-singularity-eb_images.simg1

Easybuild will only bootstrap from squashfs(.simg) and ext3(.img) image formats. easybuild will look for file extension so in the case of localimage bootstrap you may get the following error 

.. code::

   [siddis14@amrndhl1157 easybuild-framework]$  eb Anaconda3-4.2.0.eb -C --container-base localimage:$HOME/.local/easybuild/containers/git-lfs-1.1.1/ --experimental
   == temporary log file in case of crash /tmp/eb-EoN_Dw/easybuild-7_P_YM.log
   ERROR: Invalid image extension '' must be .img or .simg

Currently there is no easybuild base container in docker which be coming soon. You may still try to bootstrap with docker container but it will not work for building images. easybuild can generate the recipe files with docker bootstrap.        

.. code::

   $ eb M4-1.4.17.eb -C --experimental --container-base docker:centos:7.3.1611 --force
   == temporary log file in case of crash /tmp/eb-Ya8D6t/easybuild-HIlT6S.log
   == WARNING: overwriting existing container recipe at /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17 due to --force
   == Singularity definition file created at /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17
   == Temporary log file(s) /tmp/eb-Ya8D6t/easybuild-HIlT6S.log* have been removed.
   == Temporary directory /tmp/eb-Ya8D6t has been removed.

   $ head /home/siddis14/.local/easybuild/containers/Singularity.M4-1.4.17

   Bootstrap: docker
   From: centos:7.3.1611

Image Formats
-------------

Image Formats
--------------

Singularity support three image formats ``squashfs`` ``sandbox`` ``ext3``. The default image format is squashfs with extension ``.simg``. ext3 has image format ``.img`` which can be used to edit container as root but not allowed in squashfs. Sandbox
will create a directory structure for container image that can be useful for testing an application container. For more details on image format see http://singularity.lbl.gov/docs-build-container

easybuild will use squashfs image format by default but if you want to change the image format use ``--container-image-format`` option 

Example with squashfs format

.. code::

   [siddis14@amrndhl1157 easybuild-framework]$ eb M4-1.4.18.eb -C --container-base shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --container-build  --experimental --force --containerpath /lustre/workspace/home/siddis14/ebimages/
   == temporary log file in case of crash /tmp/eb-xwYGdq/easybuild-YVzbmF.log
   == Singularity tool found at /usr/local/bin/singularity
   == Singularity version '2.4' is 2.4 or higher ... OK
   == WARNING: overwriting existing container recipe at /lustre/workspace/home/siddis14/ebimages/Singularity.M4-1.4.18 due to --force
   == Singularity definition file created at /lustre/workspace/home/siddis14/ebimages/Singularity.M4-1.4.18
   == Running 'sudo singularity build  /lustre/workspace/home/siddis14/ebimages/M4-1.4.18.simg /lustre/workspace/home/siddis14/ebimages/Singularity.M4-1.4.18', you may need to enter your 'sudo' password...
   == Singularity image created at /lustre/workspace/home/siddis14/ebimages/M4-1.4.18.simg
   == Temporary log file(s) /tmp/eb-xwYGdq/easybuild-YVzbmF.log* have been removed.
   == Temporary directory /tmp/eb-xwYGdq has been removed.

Example using ext3 image format

.. code::

        eb M4-1.4.18.eb -C --container-base shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --container-build --container-image-format=ext3 --experimental --force


Example using sandbox image format

.. code::

   [siddis14@amrndhl1157 easybuild-framework]$ eb M4-1.4.18.eb -C --container-base shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --container-build --container-image-format=sandbox --experimental --force --containerpath /lustre/workspace/home/siddis14/ebimages/
   == temporary log file in case of crash /tmp/eb-9MhfcA/easybuild-0aNMA4.log
   == Singularity tool found at /usr/local/bin/singularity
   == Singularity version '2.4' is 2.4 or higher ... OK
   == Singularity definition file created at /lustre/workspace/home/siddis14/ebimages/Singularity.M4-1.4.18
   == Running 'sudo singularity build --sandbox /lustre/workspace/home/siddis14/ebimages/M4-1.4.18 /lustre/workspace/home/siddis14/ebimages/Singularity.M4-1.4.18', you may need to enter your 'sudo' password...
   == Singularity image created at /lustre/workspace/home/siddis14/ebimages/M4-1.4.18
   == Temporary log file(s) /tmp/eb-9MhfcA/easybuild-0aNMA4.log* have been removed.
   == Temporary directory /tmp/eb-9MhfcA has been removed.




See how the three image formats

.. code::

    [siddis14@amrndhl1157 easybuild-framework]$ ls -l /lustre/workspace/home/siddis14/ebimages/M4-1.4.18.simg
   -rwxr-xr-x 1 root root 231800863 Apr 17 19:08 /lustre/workspace/home/siddis14/ebimages/M4-1.4.18.simg

   [siddis14@amrndhl1157 easybuild-framework]$ ls -l /lustre/workspace/home/siddis14/ebimages/M4-1.4.18
   total 92
   -rw-r--r--  1 root root     15712 Dec 14  2016 anaconda-post.log
   drwxrwxr-x  4 1000 gcgadmin  4096 Feb 14 12:27 app
   lrwxrwxrwx  1 root root         7 Dec 14  2016 bin -> usr/bin
   drwxr-xr-x  2 root root      4096 Dec 14  2016 dev
   lrwxrwxrwx  1 root root        36 Nov 26 01:54 environment -> .singularity.d/env/90-environment.sh
   drwxr-xr-x 52 root root     12288 Feb 14 12:27 etc
   drwxr-xr-x  3 root root      4096 Feb 14 12:27 home
   lrwxrwxrwx  1 root root         7 Dec 14  2016 lib -> usr/lib
   lrwxrwxrwx  1 root root         9 Dec 14  2016 lib64 -> usr/lib64
   drwx------  2 root root      4096 Dec 14  2016 lost+found
   drwxr-xr-x  2 root root      4096 Nov  5  2016 media
   drwxr-xr-x  2 root root      4096 Nov  5  2016 mnt
   drwxr-xr-x  2 root root      4096 Nov  5  2016 opt
   drwxr-xr-x  2 root root      4096 Dec 14  2016 proc
   dr-xr-x---  4 root root      4096 Feb 14 12:27 root
   drwxr-xr-x 12 root root      4096 Feb 14 12:27 run
   lrwxrwxrwx  1 root root         8 Dec 14  2016 sbin -> usr/sbin
   drwxrwxr-x  3 1000 gcgadmin  4096 Apr 17 19:03 scratch
   lrwxrwxrwx  1 root root        24 Nov 26 01:54 singularity -> .singularity.d/runscript
   drwxr-xr-x  2 root root      4096 Nov  5  2016 srv
   drwxr-xr-x  2 root root      4096 Dec 14  2016 sys
   drwxrwxrwt  7 root root      4096 Dec 14  2016 tmp
   drwxr-xr-x 14 root root      4096 Apr 17 19:01 usr
   drwxr-xr-x 18 root root      4096 Dec 14  2016 var


Casecade builds for easybuild toolchain
----------------------------------------

Since easybuild invokes ``eb --robot`` in the recipe file, this can be problematic when building larger toolchains like ``GCCcore``, ``GCC``, ``gompi``, ``foss`` which will build the entire dependency list inside container that can increase container size and build time. To avoid this situation, try building the toolchains from bottom up and using them to bootstrap other toolchains.

Lets assume you are building ``GCCcore-5.4.0``, ``GCC-5.4.0-2.26``, ``gompi-2016.06`` and ``foss-2016.06``.

First build GCCcore-5.4.0

.. code::

        eb GCCcore-5.4.0.eb -C --container-base shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --container-build --experimental

Once the image is built, assuming it is in default path do the following for GCC-5.4.0-2.26

.. code::

        eb GCC-5.4.0-2.26.eb -C --container-base localimage:$HOME/.local/easybuild/containers/GCCcore-5.4.0.simg --container-build --experimental

Afterwards build gompi-2016.06 using GCC-5.4.0-2.26 container image

.. code::

        eb gompi-2016.06.eb -C --container-base localimage:$HOME/.local/easybuild/containers/GCC-5.4.0-2.26.simg --container-build --experimental

Next build foss-2016.06 using gompi-2016.06 image

.. code::

        eb foss-2016.06.eb -C --container-base localimage:$HOME/.local/easybuild/containers/gompi-2016.06.simg --container-build --experimental


Custom Image Name
-----------------

If you want to modify the name of the generated recipe file and image you can use ``--container-image-name``. Please note that ``.img`` or ``.simg`` is added to file name if you are building as squashfs or ext3

.. code::

   [siddis14@amrndhl1157 easybuild-framework]$ eb M4-1.4.17.eb -C --container-base shub:shahzebsiddiqui/eb-singularity:centos-7.3.1611 --container-build --container-image-name=M4 --containerpath /lustre/workspace/home/siddis14/ebimages --experimental
   == temporary log file in case of crash /tmp/eb-LWUS8G/easybuild-2AWdl7.log
   == Singularity tool found at /usr/local/bin/singularity
   == Singularity version '2.4' is 2.4 or higher ... OK
   == Singularity definition file created at /lustre/workspace/home/siddis14/ebimages/Singularity.M4
   == Running 'sudo singularity build  /lustre/workspace/home/siddis14/ebimages/M4.simg /lustre/workspace/home/siddis14/ebimages/Singularity.M4', you may need to enter your 'sudo' password...
   [sudo] password for siddis14:
   == Singularity image created at /lustre/workspace/home/siddis14/ebimages/M4.simg
   == Temporary log file(s) /tmp/eb-LWUS8G/easybuild-2AWdl7.log* have been removed.
   == Temporary directory /tmp/eb-LWUS8G has been removed.

