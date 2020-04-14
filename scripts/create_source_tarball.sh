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

# make sure source tarball doesn't already exist in dist/ subdirectory
sdist_tar_gz=dist/${repo}-${version}.tar.gz
echo -n ">> making sure $sdist_tar_gz doesn't exist yet ... "
if [ -f $sdist_tar_gz ]; then
    error "Found $sdist_tar_gz, which will be blindly overwritten by this script, please (re)move first!"
else
    ok
fi

# make sure we're on the master branch
curr_branch=$(git status -b --porcelain | grep '^##' | cut -f2 -d' ' | cut -f1 -d'.')
echo -n ">> checking current Git branch ... ${curr_branch} "
if [ "$curr_branch" == "master" ]; then
    ok
else
    error "Not on master branch!"
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
sdist_cmd="python setup.py sdist"
out=$tmpdir/sdist.out
echo -n ">> running '$sdist_cmd'... "
eval $sdist_cmd &> $out
if [ $? -eq 0 ]; then
    ok
    echo ">> output of '$sdist_cmd' in $out"
else
    error "Creating source tarball failed, output in $out"
fi

echo -n ">> checking for $sdist_tar_gz ... "
if [ -f $sdist_tar_gz ]; then
    ok
else
    error "Expected file $sdist_tar_gz not found!"
fi

# sanity checks on source tarball
cd $tmpdir; tar xfz $cwd/$sdist_tar_gz; cd - > /dev/null
unpacked_sdist=$tmpdir/${repo}-${version}
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
    for file in `cat $index_in_sdist | grep -v '^#'`; do
        echo -e -n "\r>> checking whether all files in index actually exist in unpacked source tarball ... $idx/$file_cnt"
        if [ ! -f $unpacked_sdist/easybuild/easyconfigs/$file ]; then
            error "File $file listed in index, but not found in $cwd!"
        fi
        idx=$(($idx + 1))
    done
    echo -e -n "\r>> checking whether all files in index actually exist in unpacked source tarball ... $idx/$file_cnt "
    ok

    # cfr. https://github.com/easybuilders/easybuild-easyconfigs/issues/10325
    echo -n ">> checking for CVS easyconfigs in source tarball... "
    CVS_easyconfigs=`ls $unpacked_sdist/easybuild/easyconfigs/c/CVS/*.eb 2> /dev/null`
    if [ -z "$CVS_easyconfigs" ]; then
        error "No CVS easyconfigs found in source tarball!"
    else
        ok
    fi

fi

# all done checking, if no checks failed up until now, we're done!
echo
success
echo "Source tarball for $repo $version is ready for publishing with:"
echo "    twine upload $sdist_tar_gz"
echo
echo ">> (end: `date`)"

# cleanup
rm -rf $tmpdir
