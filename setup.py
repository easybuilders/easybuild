##
# Copyright 2012-2014 Ghent University
#
# This file is part of EasyBuild,
# originally created by the HPC team of Ghent University (http://ugent.be/hpc/en),
# with support of Ghent University (http://ugent.be/hpc),
# the Flemish Supercomputer Centre (VSC) (https://www.vscentrum.be),
# the Hercules foundation (http://www.herculesstichting.be/in_English)
# and the Department of Economy, Science and Innovation (EWI) (http://www.ewi-vlaanderen.be/en).
#
# https://github.com/easybuilders/easybuild
#
# EasyBuild is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation v2.
#
# EasyBuild is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with EasyBuild.  If not, see <http://www.gnu.org/licenses/>.
##

"""
This script can be used to install easybuild, e.g. using:
  easy_install --user .
or
  python setup.py --prefix=$HOME/easybuild
"""

import os
from distutils import log
from distutils.core import setup

# note: release candidates should be versioned as a pre-release, e.g. "1.1rc1"
# 1.1-rc1 would indicate a post-release, i.e., and update of 1.1, so beware
VERSION = '4.9.4'


# Utility function to read README file
def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()


# log levels: 0 = WARN (default), 1 = INFO, 2 = DEBUG
log.set_verbosity(1)

log.info("Installing version %s" % VERSION)

setup(
    name="easybuild",
    version=str(VERSION),
    author="EasyBuild community",
    author_email="easybuild@lists.ugent.be",
    description="""EasyBuild is a software build \
and installation framework that allows you to manage (scientific) software \
on High Performance Computing (HPC) systems in an efficient way.""",
    license="GPLv2",
    keywords="software build building installation installing compilation HPC scientific",
    url="https://easybuild.io",
    long_description=read("README.rst"),
    classifiers=[
        "Development Status :: 5 - Production/Stable",
        "Environment :: Console",
        "Intended Audience :: End Users/Desktop",
        "Intended Audience :: Science/Research",
        "Intended Audience :: System Administrators",
        "License :: OSI Approved :: GNU General Public License v2 (GPLv2)",
        "Operating System :: POSIX :: Linux",
        "Programming Language :: Python :: 2.7",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Scientific/Engineering",
        "Topic :: Software Development :: Build Tools",
    ],
    platforms="Linux",
    # for distutils
    requires=[
        'easybuild_framework(==%s)' % VERSION,
        'easybuild_easyblocks(==%s)' % VERSION,
        'easybuild_easyconfigs(==%s)' % VERSION,
    ],
    # for setuptools/pip
    install_requires=[
        'easybuild-framework == %s' % VERSION,
        'easybuild-easyblocks == %s' % VERSION,
        'easybuild-easyconfigs == %s' % VERSION,
    ],
)
