EasyBuild: building software with ease
--------------------------------------

`EasyBuild <https://hpcugent.github.com/easybuild>`_ is a software build
and installation framework written in Python that allows you to install
software in a structured, repeatable and robust way.

It is motivated by the need for a tool that allows to:

-  independently install multiple versions of software side-by-side
-  support multiple compilers and libraries for building software and
   its dependencies
-  keep the software build configuration simple
-  divert from the standard configure / make / make install with custom
   procedures (which is often necessary for scientific software)
-  use environment modules for dependency resolution and making the
   software available to users in a transparent way
-  keep record of the installation logs
-  keep track of installation configuration in version control

Some key properties of EasyBuild:

-  installation configuration is done using a (very concise) .eb
   specification file
-  custom behaviour is described in easyblocks; these are Python classes
   that can be plugged into the EasyBuild framework
-  the generation of the module files to easily make the software
   available to users
-  the dependencies for installation are resolved using environment
   modules and can be automatically installed using the robot feature
-  after the installation, the specification files can be sent to a
   repository for archiving

For more information on EasyBuild, see the `EasyBuild
wiki <https://github.com/hpcugent/easybuild/wiki/Home>`_ on GitHub.

Requirements
~~~~~~~~~~~~

EasyBuild requires Python 2.4 (or a more recent 2.x version) to be
available, as well as the `environment
modules <http://modules.sourceforge.net/>`_ tool.

The `GitPython <http://gitorious.org/git-python>`_ Python module is
recommended, especially when EasyBuild is being used from a git
repository.

See the EasyBuild wiki for more information on `EasyBuild
dependencies <https://github.com/hpcugent/easybuild/wiki/Dependencies>`_.

Availability
~~~~~~~~~~~~

EasyBuild is split up into three different packages, which are available
from the Python Package Index (PyPi):

-  `easybuild-framework <http://pypi.python.org/pypi/easybuild-framework>`_
   - the EasyBuild framework, which includes the easybuild.framework and
   easybuild.tools Python packages that provide general support for
   building and installing software
-  `easybuild-easyblocks <http://pypi.python.org/pypi/easybuild-easyblocks>`_
   - a collection of easyblocks that implement support for building and
   installing (collections of) software packages
-  `easybuild-easyconfigs <http://pypi.python.org/pypi/easybuild-easyconfigs>`_
   - a collection of example easyconfig files that specify which
   software to build, and using which build options; these easyconfigs
   will be well tested with the latest compatible versions of the
   easybuild-framework and easybuild-easyblocks packages

Next to these packages, a meta-package named *easybuild* to easily
install the full EasyBuild distribution is also available, see
`PyPi <http://pypi.python.org/pypi/easybuild>`_.

The source code for these packages is available on GitHub, see
`easybuild-framework
sources <https://github.com/hpcugent/easybuild-framework>`_,
`easybuild-easyblocks
sources <https://github.com/hpcugent/easybuild-easyblocks>`_,
`easybuild-easyconfigs
sources <https://github.com/hpcugent/easybuild-easyconfigs>`_.

Installation
~~~~~~~~~~~~

Installing EasyBuild is really easy: just run 

::

    easy_install --user easybuild

or

::

    easy_install --prefix=/some/dir easybuild

to install the latest available version of all three EasyBuild packages.

You can also download the tarballs for the EasyBuild packages yourself,
unpack them and run 

::

    python setup.py install --prefix=/some/dir

for each of the packages.

Do make sure you set your PYTHONPATH before performing the installation
procedure (if not, easy\_install or setup.py will complain).

Do not forget to also update your PATH environment variable, to include
"/some/dir/bin" such that the main 'eb' program will be available.

Quick demo for the impatient
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To see EasyBuild in action, install it and build HPL with the robot feature of
EasyBuild, by running the following commands:

::

    easy_install --user easybuild
    export PATH=$PATH:$HOME/.local/bin
    eb HPL-2.0-goalf-1.1.0-no-OFED.eb --robot

This will install EasyBuild to your home directory ($HOME/.local), update
the PATH environment variable such that the 'eb' command is available and
subsequently build and install HPL, after building and installing a
GCC-based compiler toolchain and all of its dependencies using the
default EasyBuild configuration, which will install to
$HOME/.local/easybuild/software.

The entire process should take about an hour on a recent system.

Module files will be provided in $HOME/.local/easybuild/modules/all, so
to load the provided modules, update your MODULEPATH environment
variable.

Notes:
 * next to Python and the environment-modules package, a C and C++ compiler are required on your system, e.g., gcc and g++
 * you will needs a coupe of GBs of free space in your home directory (mainly due to the GCC build)
 * the installation ATLAS library, which is part of this demo, may fail on a virtual machine
   due to the self-tuning install mechanism
 * if the --user option for easy_install is not available on your system, you can use the following commands instead:

::

    PYLIB=`python -c "import distutils.sysconfig; print distutils.sysconfig.get_python_lib(prefix='$HOME/.local'); "`
    mkdir -p $PYLIB
    export PYTHONPATH=$PYLIB:$PYTHONPATH
    easy_install --prefix=$HOME/.local easybuild
    export PATH=$PATH:$HOME/.local/bin
    eb HPL-2.0-goalf-1.1.0-no-OFED.eb --robot

Quick start
~~~~~~~~~~~

To get started, you first need to `configure
EasyBuild <https://github.com/hpcugent/easybuild/wiki/Configuration>`_
for use.

Once this is done, using EasyBuild is as simple as creating a .eb
specification file, and providing it to the framework:

::

    eb example.eb

For command line options, see

::

    eb -h (or --help)

See the EasyBuild wiki for documentation on writing your own `easyconfig
files <https://github.com/hpcugent/easybuild/wiki/Specification-files>`_
(.eb).

To add support for particular software that requires a custom
installation procedure, you will need to implement an easyblock that can
be plugged into the EasyBuild framework (see `Development
guide <https://github.com/hpcugent/easybuild/wiki/Development-guide>`_).

On the EasyBuild wiki, a step-by-step guide to `getting
started <https://github.com/hpcugent/easybuild/wiki/Step-by-step-guide>`_
with EasyBuild is provided.

Contact info
~~~~~~~~~~~~

You can get in contact with the EasyBuild community in different ways:

Mailing list
^^^^^^^^^^^^

An EasyBuild mailinglist easybuild@lists.ugent.be is available to
subscribe to.

This list is used by both users and developers of EasyBuild, so if you
have any questions or suggestions, you can post them there.

Only members can post to this mailinglist. To request membership, see
https://lists.ugent.be/wws/info/easybuild.

IRC
^^^

An IRC channel #easybuild has been set up on the FreeNode network.

Just connect your IRC client to the irc.freenode.net server, and join
the #easybuild channel.

There is an IRC bot present (easybuilder). Just type !help to get
pointers to the available commands.

Twitter
^^^^^^^

The EasyBuild team also has a Twitter feed:
`@easy\_build <http://twitter.com/easy_build>`_.

Disclaimer
~~~~~~~~~~

EasyBuild has mainly been tested on RPM-based 64-bit Linux systems,
i.e., Scientific Linux 5.x/6.x. Support for other Linux distributions
and operating systems is pending.

License
~~~~~~~

EasyBuild is developed by the `High-Performance Computing team at Ghent
University <https://ugent.be/hpcugent>`_ and is made available under the
GNU General Public License (GPL) version 2.

Acknowledgements
~~~~~~~~~~~~~~~~

EasyBuild was created with support of `Ghent University <http://www.ugent.be/en>`_ , `the Flemish Supercomputer Centre (VSC) <https://vscentrum.be/nl/en>`_ , `the Hercules foundation <http://www.herculesstichting.be/in_English>`_ and `the Department of Economy, Science and Innovation (EWI) <http://www.ewi-vlaanderen.be/en>`_ .

