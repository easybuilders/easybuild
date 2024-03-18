Using the Conda package manager in Easybuild
===========================================

`Conda <https://github.com/conda/conda>` is Anaconda package manager. Conda is different from most programming language package managers because it aims to be  modular. To use conda, you must have an Easybuild Anaconda2 or Anaconda3 module built. Conda is also a lightweight module manager, but since we are using Environment Modules or Lmod for our environments, we will not be using this functionality.

Conda uses two commands to create environments. The first is using `conda create`, and the second is using `conda env create`. The two share most functionality. Conda env uses a configuration file for its channels and dependendies.Conda env also gives you the ability to export an environment and share it on `anaconda cloud <https://anaconda.org/nyuad-cgsb/environments>`.  If you are using the default conda-create this becomes a two step process where first we create the environment and then install the packages.

Create Easyblocks with Conda Create
++++++++++++++++++++++++++++++++++++

If you are using `conda create` you can optionally supply a list of requirements, as you would with pip. Please note that the requirements a separate file, but is an actual list of required packages.

Conda Create EasyConfig Example
++++++++++++++++++++++++++++++++

  easyblock = 'Conda'

  name = "perl-app-cpanminus"
  version = "1.7039"
  variant = "Linux-x86_64"

  homepage = 'https://github.com/miyagawa/cpanminus'
  description = """ cpanm - get, unpack build and install modules from CPAN """

  toolchain = {'name': 'dummy', 'version': ''}

  requirements = "%(name)s=%(version)s"
  channels = ['bioconda']

  builddependencies = [('Anaconda2', '4.0.0')]

  sanity_check_paths = {
      'files': ['bin/cpanm', 'bin/perl'],
      'dirs': ['lib', 'lib/perl5']
  }

  moduleclass = 'tools'

The perl-app-cpanminus conda example would execute

  conda create -p $EASYBUILD_PREFIX/software/perl-app-cpanminus/1.7039
  conda install -c bioconda perl-app-cpanminus=1.7039

Conda Env Create EasyConfig Example
++++++++++++++++++++++++++++++++

  easyblock = 'Conda'

  name = "gencore_variant_detection"
  version = "1.0"
  variant = "Linux-x86_64"

  homepage = "https://nyuad-cgsb.github.io/variant_detection/public/index.html"
  description = """ This is a bundled install of software packages for doing variant detection analysis. """

  toolchain = {'name': 'dummy', 'version': ''}

  builddependencies = [('Anaconda3', '4.0.0')]

  # Use one of the following  - either an environment.yml file or a remote environment definition
  #environment_file = '/path/to/conda-environment.yml'
  remote_environment = "nyuad-cgsb/%(name)s_%(version)s"

  sanity_check_paths = {
      'files': ["bin/conda"],
      'dirs': []
  }

  moduleclass = 'tools'

The gencore_variant_detection conda example would execute

  conda env create nyuad_cgsb/gencore_variant_detection_1.0 -p $EASYBUILD_PREFIX/software/gencore_variant_detection/1.0

In this particular case we are fetching a remote environment from anaconda cloud. Alternately, create an environment from a environment.yml file.

Loaded the module in the usual fashion.

  module load gencore_variant_detection/1.0

For users who have experience with anaconda/conda, running `module load gencore_variant_detection/1.0` is functionally equivalent to `source activate $EASYBUILD_PREFIX/software/gencore_variant_detection/1.0`.

Resources
=========

`Conda Resource <http://conda.pydata.org/docs/test-drive.html>`
