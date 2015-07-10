# #
# Copyright 2015-2015 Ghent University
#
# This file is part of EasyBuild,
# originally created by the HPC team of Ghent University (http://ugent.be/hpc/en),
# with support of Ghent University (http://ugent.be/hpc),
# the Flemish Supercomputer Centre (VSC) (https://vscentrum.be/nl/en),
# the Hercules foundation (http://www.herculesstichting.be/in_English)
# and the Department of Economy, Science and Innovation (EWI) (http://www.ewi-vlaanderen.be/en).
#
# http://github.com/hpcugent/easybuild
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
# #
"""
Generates readthedocs documentation for easyblocks (rst format)

@author Caroline De Brouwer (Ghent University)
"""

import os
import easybuild.tools.config as config

from vsc.utils.generaloption import simple_option
from easybuild.tools.docs import gen_easyblocks_overview_rst
from easybuild.tools.filetools import write_file

COMMON_PARAMS = {
    'ConfigureMake': ['configopts', 'buildopts', 'installopts'],
    # needs to be extended
}
DOC_FUNCTIONS = ['build_step', 'configure_step', 'install_step']

DEFAULT_OUT_PATH = os.path.join(os.getcwd(), 'Generic_easyblocks.rst')
DEFAULT_EXAMPLE_PATH = os.path.join(os.getcwd(), 'examples')
DEFAULT_MODULE = 'easybuild.easyblocks.generic'


options = {
    'out-file': ('Path to output file', 'string', 'store', DEFAULT_OUT_PATH, 'o'),
    'examples': ('Path to dir that contains example files', 'string', 'store', DEFAULT_EXAMPLE_PATH, 'e'),
    'module': ('Name of module to load the easyblocks from', 'string', 'store', DEFAULT_MODULE, 'm')
}
so = simple_option(options)

config.init_build_options({'validate': False, 'external_modules_metadata': {}})

easyblocks_overview = gen_easyblocks_overview_rst(so.options.module, so.options.examples, COMMON_PARAMS, DOC_FUNCTIONS)
write_file(so.options.out_file, '\n'.join(easyblocks_overview))
