#!/bin/bash

# -u: consider use of undefined variables as an error
set -u

# =================================================================================================

function error() {
    # error message in red
    echo -e "\033[31mERROR: $1\033[0m" >&2
    exit 1
}

function ok() {
    # OK in green
    echo -e "\033[32mOK\033[0m"
}

function success() {
    # success message in green
    echo -e "\033[32mSUCCESS!\033[0m"
}

function warning() {
    echo -e "\033[33mWARNING: $1\033[0m" >&2
    warnings="$warnings$1 "
}

# =================================================================================================

if [ $# -ne 2 ]; then
    error "Usage $0 <repo name> <version>"
fi
repo=$1
version=$2

echo ">> (start: `date`)"
echo ">> creating source tarball for $repo $version..."

# =================================================================================================

# create temporary directory
tmpdir=`mktemp -d`

warnings=""

# we need to create an index file when composing the source tarball for easybuild-easyconfigs,
# which requires running 'eb --create-index'
if [[ "$repo" == "easybuild-easyconfigs" ]]; then

    # 'eb' command must be available, and it must support '--create-index'
    echo -n ">> checking whether 'eb' command is available ... "
    which eb > /dev/null
    if [ $? -eq 0 ]; then
        ok
    else
        error "'eb' command not found!"
    fi

    echo -n ">> checking whether 'eb --create-index' is supported ... "
    eb --help | grep create-index &> /dev/null
    if [ $? -eq 0 ]; then
        ok
    else
        error "'eb --create-index' not supported!"
    fi

fi

# check whether this script is being run from the expected directory
cwd=`pwd`
echo -n ">> current working directory: $cwd ... "

if [[ "`basename $cwd`" == "$repo" ]]; then
    ok
else
    echo
    error "Expected to be in $repo directory, found myself in $cwd"
fi

# recent version of setuptools normalize source tarball name by replacing dashes ('-)
# in package name with underscores ('_'), so easybuild-framework becomes easybuild_framework;
repo_underscore=$(echo ${repo} | tr '-' '_')

# make sure source tarball doesn't already exist in dist/ subdirectory
for sdist_tar_gz in dist/${repo_underscore}-${version}.tar.gz dist/${repo}-${version}.tar.gz; do
    echo -n ">> making sure $sdist_tar_gz doesn't exist yet ... "
    if [ -f $sdist_tar_gz ]; then
        error "Found $sdist_tar_gz, which will be blindly overwritten by this script, please (re)move first!"
    else
        ok
    fi
done

# make sure we're on the main branch
curr_branch=$(git status -b --porcelain | grep '^##' | cut -f2 -d' ' | cut -f1 -d'.')
echo -n ">> checking current Git branch ... ${curr_branch} "
if [ "$curr_branch" == "main" ]; then
    ok
else
    error "Not on main branch!"
fi

# check that the working directory is clean
out=$tmpdir/git_status.out
echo -n ">> checking for clean working directory... "
git status &> $out
grep "nothing to commit, working tree clean" $tmpdir/git_status.out > /dev/null
if [[ $? -eq 0 ]]; then
    ok
else
    error "Working directory not clean: `cat $out`"
fi

# check whether specified version matches current version
echo -n ">> checking whether current version matches specified version '$version' ... "
if [[ "$repo" == "easybuild-framework" ]]; then
    curr_version_file='easybuild/tools/version.py'
elif [[ "$repo" == "easybuild-easyblocks" ]]; then
    curr_version_file='easybuild/easyblocks/__init__.py'
else
    curr_version_file='setup.py'
fi
# grab version from file, usually a line like "VERSION = '...'", but could slightly diverge
curr_version=$(grep '^[A-Z_]*VERSION\s*=' $curr_version_file | head -1 | sed 's/[^0-9]*\([0-9a-zA-Z.]*\).*/\1/g')
if [[ "$curr_version" == "$version" ]]; then
    ok
else
    error "Found version '$curr_version'"
fi

if [[ "$repo" == "easybuild" ]]; then
    # check whether 'requires' statements are what we expect
    # if not, print a clear warning, since it may actually be fine if the version for some of the required easybuild-*
    # packages diverges from the version of the 'easybuid' package...
    # examples:
    # - easybuild-4.1.2 which requires easybuild-easyblocks and easybuild-easyconfigs v4.1.1
    # - easybuild-4.2.0.post0 which requires easybuild-{framework,easyblocks,easyconfigs} v4.2.0
    echo ">> checking whether required packages for 'easybuild' are what's expected ... "
    python3 setup.py --requires 2> /dev/null | grep '^easybuild' | tee $tmpdir/easybuild_requires.txt
    for dep in framework easyblocks easyconfigs; do
        echo -n ">>>> $dep ... "
        pattern="^easybuild_${dep}(==${curr_version})"
        grep $pattern $tmpdir/easybuild_requires.txt > /dev/null
        if [ $? -eq 0 ]; then
            ok
        else
            warning "expected pattern '$pattern' in 'requires' in setup.py not found"
        fi
    done
fi

if [[ "$repo" == "easybuild-easyconfigs" ]]; then

    # create index file
    create_index_cmd="eb --create-index easybuild/easyconfigs --index-max-age=0 --force"
    out=$tmpdir/eb_create_index.out
    echo -n ">> creating index file with '$create_index_cmd'... "
    eval $create_index_cmd > $out
    if [ $? -eq 0 ]; then
        ok
    else
        error "Creating index file failed, output in $out"
    fi

    expected_index_file=easybuild/easyconfigs/.eb-path-index
    echo -n ">> checking for $expected_index_file ... "
    if [ -f $expected_index_file ]; then
        ok
    else
        error "Expected to find index file $expected_index_file, not found! (output: $out)"
    fi

    # make sure index file is valid indefinitely
    echo -n ">> checking whether index file is valid indefinitely ... "
    grep "^# valid until: 9999-12-31" $expected_index_file > /dev/null
    if [[ $? -eq 0 ]]; then
        ok
    else
        error "Index file $expected_index_file is not valid indefinitely!"
    fi

fi

# create source tarball
sdist_cmd="python3 setup.py sdist"
out=$tmpdir/sdist.out
echo -n ">> running '$sdist_cmd'... "
eval $sdist_cmd &> $out
if [ $? -eq 0 ]; then
    ok
    echo ">> output of '$sdist_cmd' in $out"
else
    error "Creating source tarball failed, output in $out"
fi

for sdist_tar_gz in dist/${repo_underscore}-${version}.tar.gz dist/${repo}-${version}.tar.gz; do
    echo -n ">> checking for $sdist_tar_gz ... "
    if [ -f $sdist_tar_gz ]; then
        ok
        break
    else
        warning "$sdist_tar_gz not found"
    fi
done
if [ ! -f $sdist_tar_gz ]; then
    error "No source tarball for ${repo} ${version} found in $PWD/dist!"
fi

# sanity checks on source tarball
cd $tmpdir; tar xfz $cwd/$sdist_tar_gz; cd - > /dev/null
unpacked_sdist=$tmpdir/${repo_underscore}-${version}
echo -n ">> checking for unpacked source tarball at $unpacked_sdist ... "
if [ -d $unpacked_sdist ]; then
    ok
else
    error "Expected unpacked source tarball at $unpacked_sdist, not found!"
fi

if [[ "$repo" == "easybuild-easyconfigs" ]]; then

    index_in_sdist=$unpacked_sdist/easybuild/easyconfigs/.eb-path-index
    echo -n ">> checking for $index_in_sdist ... "
    if [ -f $index_in_sdist ]; then
        ok
    else
        error "Expected to found index file in unpacked source tarball at $index_in_sdist, not found!"
    fi

    # make sure all files are included in index
    # (this take a couple of minutes, since we're running 'grep' thousands of times...)
    file_list=$tmpdir/files.txt
    echo -n ">> checking whether all files are included in index ... "
    cd $cwd/easybuild/easyconfigs
    find . -type f | sed 's@^\./@@g' | grep -v '^\.eb-path-index$' > $file_list
    cd - > /dev/null
    file_cnt=`cat $file_list | wc -l | sed 's/ //g'`
    idx=1
    for file in `cat $file_list`; do
        echo -e -n "\r>> checking whether all files are included in index ... $idx/$file_cnt"
        grep $file $index_in_sdist > /dev/null
        if [ $? -ne 0 ]; then
            error "File $file not listed in index $index_in_sdist!"
        fi
        idx=$(($idx + 1))
    done
    echo -e -n "\r>> checking whether all files are included in index ... $idx/$file_cnt "
    ok

    # make sure all files listed in index actually exist in unpacked source tarball
    echo -n ">> checking whether all files in index actually exist in unpacked source tarball ... "
    file_cnt=`cat $index_in_sdist | grep -v '^#' | wc -l | sed 's/ //g'`
    idx=1
    for file in `cat $index_in_sdist | grep -v '^#' | grep -v '__archive__/r/RCS/'`; do
        echo -e -n "\r>> checking whether all files in index actually exist in unpacked source tarball ... $idx/$file_cnt"
        if [ ! -f $unpacked_sdist/easybuild/easyconfigs/$file ]; then
            error "File $file listed in index, but not found in $cwd!"
        fi
        idx=$(($idx + 1))
    done
    echo -e -n "\r>> checking whether all files in index actually exist in unpacked source tarball ... $idx/$file_cnt "
    ok

fi

# all done checking, if no checks failed up until now, we're done!
echo
if [ -z "$warnings" ]; then
  success
else
  warning "One or more warnings were raised, proceed with caution!"
fi

echo "Source tarball for $repo $version is ready for publishing with:"
echo "    twine upload $sdist_tar_gz"
echo
echo ">> (end: `date`)"

# cleanup
rm -rf $tmpdir
