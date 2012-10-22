import os
from distutils import log

VERSION = "0.9.0dev"
API_VERSION = str(VERSION).split('.')[0]
EB_VERSION = '.'.join(VERSION.split('.')[0:2])
if VERSION.endswith('dev'):
    EB_VERSION += 'dev'

# Utility function to read README file
def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

# log levels: 0 = WARN (default), 1 = INFO, 2 = DEBUG
log.set_verbosity(1)

try:
    from setuptools import setup
    log.info("Installing with setuptools.setup...")
except ImportError, err:
    log.info("Failed to import setuptools.setup, so falling back to distutils.setup")
    from distutils import setup

log.info("Installing version %s (API version %s)" % (VERSION, API_VERSION))

setup(
    name = "easybuild",
    version = str(VERSION),
    author = "EasyBuild community",
    author_email = "easybuild@lists.ugent.be",
    description = """EasyBuild is a software installation framework in Python that allows you to \
install software in a structured and robust way. """,
    license = "GPLv2",
    keywords = "software build building installation installing compilation HPC scientific",
    url = "http://hpcugent.github.com/easybuild",
    long_description = read("README.rst"),
    classifiers = [
                   "Development Status :: 5 - Production/Stable",
                   "Environment :: Console",
                   "Intended Audience :: System Administrators",
                   "License :: OSI Approved :: GNU General Public License v2 (GPLv2)",
                   "Operating System :: POSIX :: Linux",
                   "Programming Language :: Python :: 2.4",
                   "Topic :: Software Development :: Build Tools",
                  ],
    platforms = "Linux",
    install_requires = [
                        "easybuild-easyconfigs >= %s" % EB_VERSION,
                        "easybuild-easyblocks >= %s" % EB_VERSION,
                        "easybuild-framework >= %s" % API_VERSION,  # order matters here, framework should be after easyblocks!
                       ]
)
