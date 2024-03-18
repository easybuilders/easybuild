.. _anaconda:

Anaconda
=========

`Anaconda <https://www.continuum.io/downloads/>` is a scientific distribution of python distributed by Continuum Analytics.

.. contents::
    :depth: 3
    :backlinks: none

Similarities to Python
-----------------------

Like python, anaconda comes in two main flavors, Anaconda2 and Anaconda3. The greatest differences lie in requiring system libraries or admin privileges. Most linux OSes come with Python. In order to install python packages with the OS python you must have admin privileges, and python itself requires admin privileges. Anaconda, however, does not. In the case of Easybuild, using the Anaconda easyblock is a possible alternative to Python.

Anaconda Install Process
-------------------------

Anaconda is a bootstrapped install process, that includes its own prepackaged application libraries, and does not require any compiler toolchains. The easyblock itself inherits from the Binary easyblock.

Conda Package Manager
------------------------
Anaconda comes with conda, the anaconda package manager. It is similar in functionality to `pip <https://pypi.python.org/pypi/pip>`. Like anaconda, conda does not require root access. Conda can create environments and install packages into any of those environments.

You can find out more about using conda with Easybuild here (How do i add a url in rst?).

.. _examples:

Anaconda2 EasyConfig Example
+++++++++++++++++++++++++++++

  easyblock = 'EB_Anaconda'

  name = 'Anaconda2'
  version = '4.0.0'

  homepage = 'https://www.continuum.io/anaconda-overview'
  description = """Built to complement the rich, open source Python community,
  the Anaconda platform provides an enterprise-ready data analytics platform
  that empowers companies to adopt a modern open data science analytics architecture.
  """

  toolchain = {'name': 'dummy', 'version': 'dummy'}

  source_urls = ['http://repo.continuum.io/archive/']
  sources = ['%(name)s-%(version)s-Linux-x86_64.sh']
  checksums = ['31ed3ef07435d7068e1e03be49381b13']

  postinstallcmds = ["conda install -f -c conda conda-env=2.5.2"]


  moduleclass = 'lang'

Anaconda3 EasyConfig Example
+++++++++++++++++++++++++++++

  easyblock = 'EB_Anaconda'

  name = 'Anaconda3'
  version = '4.0.0'

  homepage = 'https://www.continuum.io/anaconda-overview'
  description = """Built to complement the rich, open source Python community,
  the Anaconda platform provides an enterprise-ready data analytics platform
  that empowers companies to adopt a modern open data science analytics architecture.
  """

  toolchain = {'name': 'dummy', 'version': 'dummy'}

  source_urls = ['http://repo.continuum.io/archive/']
  sources = ['%(name)s-%(version)s-Linux-x86_64.sh']
  checksums = ['546d1f02597587c685fa890c1d713b51']

  postinstallcmds = ["conda install -f -c conda conda-env=2.5.2"]

  moduleclass = 'lang'

Resources
=========

`All the versions! <https://repo.continuum.io/archive/>` <- Check out all the versions and their md5s on the anaconda archive page.
