.. image:: https://easybuilders.github.io/easybuild/images/easybuild_logo_small.png
   :align: center

.. image:: https://github.com/easybuilders/easybuild/actions/workflows/doc_build.yml/badge.svg
    :target: https://github.com/easybuilders/easybuild/actions/workflows/doc_build.yml

`EasyBuild <https://easybuilders.github.io/easybuild>`_ is a software build
and installation framework that allows you to manage (scientific) software
on High Performance Computing (HPC) systems in an efficient way.

Sources
~~~~~~~

The EasyBuild sources are spread across different GitHub repositories:

* the `main easybuild repository <https://github.com/easybuilders/easybuild>`_ hosts the documentation and the `easybuild` Python metapackage
* the `easybuild-framework repository <https://github.com/easybuilders/easybuild-framework>`_ hosts the source code of the EasyBuild `framework`
* the `easybuild-easyblocks repository <https://github.com/easybuilders/easybuild-easyblocks>`_ hosts `easyblocks`, i.e. implementations of install procedures
* the `easybuild-easyconfigs repository <https://github.com/easybuilders/easybuild-easyconfigs>`_ hosts `easyconfigs`, i.e. EasyBuild specification files

Corresponding Python packages are available via PyPi:

* https://pypi.python.org/pypi/easybuild
* https://pypi.python.org/pypi/easybuild-framework
* https://pypi.python.org/pypi/easybuild-easyblocks
* https://pypi.python.org/pypi/easybuild-easyconfigs

Documentation
~~~~~~~~~~~~~

Read the fine manual (RTFM!) at http://easybuild.readthedocs.org .

Getting started
~~~~~~~~~~~~~~~

The recommended way of installing EasyBuild is via the
`documented bootstrap procedure <http://easybuild.readthedocs.org/en/latest/Installation.html#bootstrapping-procedure>`_
You should `configure <http://easybuild.readthedocs.org/en/latest/Configuration.html>`_
EasyBuild to behave as you prefer, subsequently.

That is all that is needed to get started with installing (scientific) software with ease.
Take a look at the `typical workflow <http://easybuild.readthedocs.org/en/latest/Typical_workflow_example_with_WRF.html>`_
example in the EasyBuild documentation that shows how to make EasyBuild build and **install WRF with a single command**.

Quick demo for the impatient
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After `installing EasyBuild <http://easybuild.readthedocs.org/en/latest/Installation.html>`_,
you can build and install **HPL** on top of a compiler toolchain that consists of open source
components (GCC, OpenMPI, etc.) by running the following commands::

  $ module load EasyBuild
  $ export EASYBUILD_PREFIX=/tmp/$USER  # example installation prefix
  $ eb HPL-2.3-foss-2019b.eb --robot

This should install a module file for HPL which you can load to start using it::

  $ export MODULEPATH=$EASYBUILD_PREFIX/modules/all:$MODULEPATH
  $ module load HPL

For more information on using EasyBuild, see the
`EasyBuild documentation <http://easybuild.readthedocs.org/>`_

Contact info
~~~~~~~~~~~~

You can get in contact with the EasyBuild community in different ways:

Mailing list
^^^^^^^^^^^^

An EasyBuild mailinglist easybuild@lists.ugent.be is available to subscribe to.

This list is used by both users and developers of EasyBuild, so if you
have any questions or suggestions, you can post them there.

Only members can post to this mailinglist. To request membership, see
https://lists.ugent.be/wws/info/easybuild.

Slack/IRC
^^^^^^^^^

Contact the EasyBuild community via Slack: https://easybuild.slack.com,
self-request an invite via https://easybuild-slack.herokuapp.com.

An IRC channel #easybuild has been set up on the FreeNode network.

Just connect your IRC client to the chat.freenode.net server, and join the #easybuild channel.

Twitter
^^^^^^^

The EasyBuild team also has a Twitter feed:
`@easy\_build <http://twitter.com/easy_build>`_.

Disclaimer
~~~~~~~~~~

EasyBuild has mostly been used and tested on x86_64-based Linux systems (RedHat-based, Debian, SuSE, ...),
but can be easily extended for other platforms.
Limited provisions for other Unix-based operating systems (e.g., Mac OS X) are also available.

License
~~~~~~~

EasyBuild was created by the `High-Performance Computing team at Ghent
University <https://ugent.be/hpc>`_, is currently maintained by the
`EasyBuild community <https://github.com/easybuilders>`_,
and is made available under the GNU General Public License (GPL) version 2.

Acknowledgements
~~~~~~~~~~~~~~~~

EasyBuild was created with support of `Ghent University <http://www.ugent.be/en>`_ ,
`the Flemish Supercomputer Centre (VSC) <https://www.vscentrum.be>`_ ,
`the Hercules foundation <http://www.herculesstichting.be/in_English>`_ and
`the Department of Economy, Science and Innovation (EWI) <http://www.ewi-vlaanderen.be/en>`_ .

