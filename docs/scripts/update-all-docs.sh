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
echo ".. _generic_easyblocks:" > $VERSION_SPECIFIC_DIR/generic_easyblocks.rst
echo "" >> $VERSION_SPECIFIC_DIR/generic_easyblocks.rst
python $generic_easyblocks_script >> $VERSION_SPECIFIC_DIR/generic_easyblocks.rst

#  help doc
echo ".. _eb_help:" > $VERSION_SPECIFIC_DIR/help.rst
echo ".. _basic_usage_help:" >> $VERSION_SPECIFIC_DIR/help.rst
echo "*(see also* \`\`eb --help\`\` *)*" >> $VERSION_SPECIFIC_DIR/help.rst
echo >> $VERSION_SPECIFIC_DIR/help.rst
eb --help=rst >> $VERSION_SPECIFIC_DIR/help.rst

#  available easyconfig params
echo ".. _avail_easyconfig_params:" > $VERSION_SPECIFIC_DIR/easyconfig_parameters.rst
echo ".. _easyconfig_params:" >> $VERSION_SPECIFIC_DIR/easyconfig_parameters.rst
echo "*(see also* \`\`eb -a\`\` or \`\`eb --avail-easyconfig-params\`\` *)*" >> $VERSION_SPECIFIC_DIR/easyconfig_parameters.rst
echo >> $VERSION_SPECIFIC_DIR/easyconfig_parameters.rst
eb -a --output-format rst >> $VERSION_SPECIFIC_DIR/easyconfig_parameters.rst

#  available configfile constants
echo ".. _avail_cfgfile_constants:" > $VERSION_SPECIFIC_DIR/config_file_constants.rst
echo "*(see also* \`\`eb --avail-cfgfile-constants\`\` *)*" >> $VERSION_SPECIFIC_DIR/config_file_constants.rst
echo >> $VERSION_SPECIFIC_DIR/config_file_constants.rst
eb --avail-cfgfile-constants --output-format rst >> $VERSION_SPECIFIC_DIR/config_file_constants.rst

# available easyconfig constants
echo ".. _avail_easyconfig_constants:" > $VERSION_SPECIFIC_DIR/easyconfig_constants.rst
echo "*(see also* \`\`eb --avail-easyconfig-constants\`\` *)*" >> $VERSION_SPECIFIC_DIR/easyconfig_constants.rst
echo >> $VERSION_SPECIFIC_DIR/easyconfig_constants.rst
eb --avail-easyconfig-constants --output-format rst >> $VERSION_SPECIFIC_DIR/easyconfig_constants.rst

# available easyconfig licenses
echo ".. _avail_easyconfig_licenses:" > $VERSION_SPECIFIC_DIR/easyconfig_license_constants.rst
echo "*(see also* \`\`eb --avail-easyconfig-licenses\`\` *)*" >> $VERSION_SPECIFIC_DIR/easyconfig_license_constants.rst
echo >> $VERSION_SPECIFIC_DIR/easyconfig_license_constants.rst
eb --avail-easyconfig-licenses --output-format rst >> $VERSION_SPECIFIC_DIR/easyconfig_license_constants.rst

# available easyconfig templates
echo ".. _avail_easyconfig_templates" > $VERSION_SPECIFIC_DIR/easyconfig_templates.rst
echo "*(see also* \`\`eb --avail-easyconfig-templates\`\` *)*" >> $VERSION_SPECIFIC_DIR/easyconfig_templates.rst
echo >> $VERSION_SPECIFIC_DIR/easyconfig_templates.rst
eb --avail-easyconfig-templates --output-format rst >> $VERSION_SPECIFIC_DIR/easyconfig_templates.rst

#  list-easyblocks doc
echo ".. _list_easyblocks:" > $VERSION_SPECIFIC_DIR/easyblocks.rst
echo "*(see also* \`\`eb --list-easyblocks\`\` and :ref:\`generic_easyblocks\` *)*" >> $VERSION_SPECIFIC_DIR/easyblocks.rst
echo >> $VERSION_SPECIFIC_DIR/easyblocks.rst
eb --list-easyblocks --output-format rst >> $VERSION_SPECIFIC_DIR/easyblocks.rst

#  list-toolchain doc
echo ".. _list_toolchains:" > $VERSION_SPECIFIC_DIR/toolchains.rst
echo "*(see also* \`\`eb --list-toolchains\`\` *)*" >> $VERSION_SPECIFIC_DIR/toolchains.rst
echo >> $VERSION_SPECIFIC_DIR/toolchains.rst
eb --list-toolchains --output-format rst >> $VERSION_SPECIFIC_DIR/toolchains.rst

#  available toolchain options
echo ".. _avail_toolchain_opts:" > $VERSION_SPECIFIC_DIR/toolchain_opts.rst
echo >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
title="Available toolchain options (by toolchain)"
length=${#title}
echo $title >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
printf '=%.0s' $(seq 1 $length) >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
echo >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
echo >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
echo "*(see also* \`\`eb --avail-toolchain-opts <tcname>\`\` *)*" >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
echo >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
IFS=$'\n'

temp_tc="$(mktemp)"

for i in `eb --list-toolchains | sed 1d | sort`
do
    tc=`echo $i | cut -d ':' -f1`
    echo "${tc//[[:blank:]]/}" >> $temp_tc
done

echo -n `cat $temp_tc | sed -n 1p`"_" >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst

cat $temp_tc | sed 1d | while read line
do
    echo -n " - ""$line""_" >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
done
echo >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst

cat $temp_tc | while read line
do
    echo >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
    echo ".. _""$line"":" >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
    echo >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
    eb --avail-toolchain-opts $line --output-format rst >> $VERSION_SPECIFIC_DIR/toolchain_opts.rst
done

rm $temp_tc
