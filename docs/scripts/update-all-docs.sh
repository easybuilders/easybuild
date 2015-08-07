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

# This script generates all readthedocs documentation that can be automatically updated.


#!/bin/bash

set -eu
framework_path=`python -c "import os; import easybuild; print os.path.dirname(os.path.abspath(easybuild.__file__))"`
vs=version-specific
scripts_dir=scripts

if [ ! -d $vs ]; then
    echo "version-specific dir does not exits"
    exit 1
fi

if [ ! -d $scripts_dir ]; then
    echo "scripts dir does not exist"
    exit 1
fi

generate_api_script=$scripts_dir/generate_api.py
generic_easyblocks_script=$scripts_dir/generic_easyblocks.py

if [ ! -f $generate_api_script -a -f $generic_easyblocks_script ]; then
    exit 1
fi

#  api docs
python $generate_api_script -m $framework_path

#  generic easyblocks doc
python $generic_easyblocks_script

#  help doc
eb --help=rst > $vs/generated_configuration_options.rst

#  available easyconfig params
eb -a --output-format rst > $vs/generated_ec_params.rst

#  available configfile constants
eb --avail-cfgfile-constants --output-format rst > $vs/generated_cfgfile_constants.rst

# available easyconfig constants
eb --avail-easyconfig-constants --output-format rst > $vs/generated_ec_constants.rst

# available easyconfig licenses
eb --avail-easyconfig-licenses --output-format rst > $vs/generated_ec_licenses.rst

# available easyconfig templates
eb --avail-easyconfig-templates --output-format rst > $vs/generated_ec_templates.rst

#  list-easyblocks doc
eb --list-easyblocks --output-format rst > version-specific/generated_list_easyblocks.rst

#  list-toolchain doc
eb --list-toolchains --output-format rst > version-specific/generated_list_toolchains.rst
