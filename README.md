EasyBuild: building software with ease
=======================================

[EasyBuild] [1] is a software build and installation framework written in Python
that allows you to install software in a structured, repeatable and robust way.

It is motivated by the need for a tool that allows to:

 * independently install multiple versions of software side-by-side
 * support multiple compilers and libraries for building software
   and its dependencies
 * keep the software build configuration simple
 * divert from the standard configure / make / make install with custom
   procedures (which is often necessary for scientific software)
 * use environment modules for dependency resolution and making the software
   available to users in a transparent way
 * keep record of the installation logs
 * keep track of installation configuration in version control

Some key properties of EasyBuild:

 * installation configuration is done using a (very concise) .eb specification file
 * custom behaviour is described in easyblocks; these are Python classes that can be
   plugged into the EasyBuild framework
 * the generation of the module files to easily make the software available to users
 * the dependencies for installation are resolved using environment modules and can
   be automatically installed using the robot feature
 * after the installation, the specification files can be sent to a repository for
   archiving

For more information on EasyBuild, see the [EasyBuild wiki] [2] on GitHub.


REQUIREMENTS
-------------

EasyBuild requires Python 2.4 (or a more recent 2.x version) to be available,
as well as the [environment modules] [3] tool.

The [GitPython] [4] Python module is recommended, especially when EasyBuild is
being used from a git repository.

See the EasyBuild wiki for more information on [EasyBuild dependencies] [5].


AVAILABILITY
-------------

EasyBuild is split up into three different packages, which are available from the Python Package Index (PyPi):

* [easybuild-framework] [6] - the EasyBuild framework, which includes the easybuild.framework and easybuild.tools Python packages that provide general support for building and installing software
* [easybuild-easyblocks] [7] - a collection of easyblocks, in the form of the easybuild.easyblocks Python package, that implement support for building and installing (collections of) software applications; this depends on the framework being available, of course
* [easybuild-easyconfigs] [8] - a collection of example easyconfig files that specify which software to build, and using which build options; these easyconfigs will be well tested with the latest compatible versions of the easybuild-framework and easybuild-easyblocks packages

Next to these packages, a meta-package named _easybuild_ to easily install the full EasyBuild distribution is also available, see [PyPi] [9].

The source code for these packages is available on GitHub, see [easybuild-framework sources] [10], [easybuild-easyblocks sources] [11], [easybuild-easyconfigs sources] [12].


INSTALLATION
-------------

Installing EasyBuild is really easy: just run "easy\_install --prefix=/some/dir easybuild" to install the latest available version of all three EasyBuild packages.

You can also download the tarballs for the EasyBuild packages yourself, unpack them and run "python setup.py install --prefix=/some/dir" for each of the packages.

Do make sure you set your PYTHONPATH before performing the installation procedure (if not, easy\_install or setup.py will complain).

Do not forget to also update your PATH environment variable, to include "/some/dir/bin" such that the main 'eb' program will be available.


QUICK DEMO FOR THE IMPATIENT
-----------------------------

To see EasyBuild in action, build HPL with the robot feature of EasyBuild, by
running the following command:

    eb HPL-2.0-goalf-1.1.0-no-OFED.eb --robot

This will build and install HPL, after building and installing a GCC-based
compiler toolchain and all of its dependencies using the default EasyBuild
configuration, which will install to $HOME/.local/easybuild/software.

The entire process should take about an hour on a recent system.

Module files will be provided in $HOME/.local/easybuild/modules/all, so to load
the provided modules, update your MODULEPATH environment variable.

Note: this demo requires a C and C++ compiler to be available on your system,
e.g., gcc and g++.


QUICK START
------------

To get started, you first need to [configure EasyBuild] [13] for use.

Once this is done, using EasyBuild is as simple as creating a .eb specification
file, and providing it to the framework:

	eb example.eb

For command line options, see

	eb -h (or --help)

See the EasyBuild wiki for documentation on writing your own [easyconfig files] [14] (.eb).

To add support for particular software that requires a custom
installation procedure, you will need to implement an easyblock that can be
plugged into the EasyBuild framework (see [Development guide] [15]).

On the EasyBuild wiki, a step-by-step guide to [getting started] [16] with EasyBuild is provided.

CONTACT INFO
------------

You can get in contact with the EasyBuild community in different ways:

### Mailing list

An EasyBuild mailinglist easybuild@lists.ugent.be is available to subscribe to.

This list is used by both users and developers of EasyBuild, so if you have any questions or suggestions, you can post them there.

Only members can post to this mailinglist. To request membership, see https://lists.ugent.be/sympa/info/easybuild.

### IRC

An IRC channel #easybuild has been set up on the FreeNode network.

Just connect your IRC client to the irc.freenode.net server, and join the #easybuild channel.

There is an IRC bot present (easybuilder). Just type !help to get pointers to the available commands.

### Twitter

The EasyBuild team also has a Twitter feed: [@easy_build] [17].

DISCLAIMER
-----------

EasyBuild has mainly been tested on RPM-based 64-bit Linux systems, i.e.,
Scientific Linux 5.x/6.x.  Support for other Linux distributions and operating
systems is pending.


LICENSE
--------

EasyBuild is developed by the [High-Performance Computing team at Ghent University] [18]
and is made available under the GNU General Public License (GPL) version 2.


[1]: https://hpcugent.github.com/easybuild "EasyBuild"
[2]: https://github.com/hpcugent/easybuild/wiki/Home "EasyBuild wiki"
[3]: http://modules.sourceforge.net/ "environment modules"
[4]: http://gitorious.org/git-python "GitPython"
[5]: https://github.com/hpcugent/easybuild/wiki/Dependencies "EasyBuild dependencies"
[6]: http://pypi.python.org/pypi/easybuild-framework "easybuild-framework"
[7]: http://pypi.python.org/pypi/easybuild-easyblocks "easybuild-easyblocks"
[8]: http://pypi.python.org/pypi/easybuild-easyconfigs "easybuild-easyconfigs"
[9]: http://pypi.python.org/pypi/easybuild "easybuild"
[10]: https://github.com/hpcugent/easybuild-framwork "easybuild-framework sources"
[11]: https://github.com/hpcugent/easybuild-easyblocks "easybuild-easyblocks sources"
[12]: https://github.com/hpcugent/easybuild-easyconfigs "easybuild-easyconfigs sources"
[13]: https://github.com/hpcugent/easybuild/wiki/Configuration "configure EasyBuild"
[14]: https://github.com/hpcugent/easybuild/wiki/Specification-files "easyconfig files"
[15]: https://github.com/hpcugent/easybuild/wiki/Development-guide "Development guide"
[16]: https://github.com/hpcugent/easybuild/wiki/Step-by-step-guide "getting started"
[17]: http://twitter.com/easy_build "@easy_build"
[18]: https://ugent.be/hpcugent "High-Performance Computing team at Ghent University"
