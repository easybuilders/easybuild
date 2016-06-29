#!/bin/bash
##
# Copyright 2015-2016 Ghent University
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
##

# This script generates all readthedocs documentation that can be automatically updated.
#
# authors: Caroline De Brouwer, Kenneth Hoste (HPC-UGent)

set -eu

VERSION_SPECIFIC_DIR='version-specific'
SCRIPTS_DIR='scripts'

if [[ $PWD =~ "easybuild/docs$" ]]; then
    echo "script should be run from easybuild/docs"
    exit 1
fi

if [ ! -d $VERSION_SPECIFIC_DIR ]; then
    echo "version-specific dir does not exits"
    exit 1
fi

if [ ! -d $SCRIPTS_DIR ]; then
    echo "scripts dir does not exist"
    exit 1
fi

generate_api_script=$SCRIPTS_DIR/gen_api_docs.py
generic_easyblocks_script=$SCRIPTS_DIR/gen_easyblocks_docs.py

if [ ! -f $generate_api_script -a -f $generic_easyblocks_script ]; then
    echo "Could not find all required scripts: $generate_api_script, $generic_easyblocks_script" >&2
    exit 1
fi

#  api docs
python $generate_api_script

#  generic easyblocks doc
python $generic_easyblocks_script > $VERSION_SPECIFIC_DIR/Generic_easyblocks.rst

#  help doc
eb --help=rst > $VERSION_SPECIFIC_DIR/generated_configuration_options.rst

#  available easyconfig params
eb -a --output-format rst > $VERSION_SPECIFIC_DIR/generated_ec_params.rst

#  available configfile constants
eb --avail-cfgfile-constants --output-format rst > $VERSION_SPECIFIC_DIR/generated_cfgfile_constants.rst

# available easyconfig constants
eb --avail-easyconfig-constants --output-format rst > $VERSION_SPECIFIC_DIR/generated_ec_constants.rst

# available easyconfig licenses
eb --avail-easyconfig-licenses --output-format rst > $VERSION_SPECIFIC_DIR/generated_ec_licenses.rst

# available easyconfig templates
eb --avail-easyconfig-templates --output-format rst > $VERSION_SPECIFIC_DIR/generated_ec_templates.rst

#  list-easyblocks doc
eb --list-easyblocks --output-format rst > $VERSION_SPECIFIC_DIR/generated_list_easyblocks.rst

#  list-toolchain doc
eb --list-toolchains --output-format rst > $VERSION_SPECIFIC_DIR/generated_list_toolchains.rst
