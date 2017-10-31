.. _integration_with_github:

Integration with GitHub
=======================

EasyBuild provides several features that integrate with GitHub, where the different EasyBuild repositories are located.

From the EasyBuild command line ``eb`` several options are available to reach out to GitHub,
which are documented below.

.. contents::
    :depth: 3
    :backlinks: none

.. _github_requirements:

Requirements
------------

Depending on which GitHub integration features you want to use, there are a couple of requirements:

* **a GitHub account**

  * see https://github.com; creating an account is free but requires registration

* **a GitHub user name**

  * only required for authenticated access to the GitHub API, which can help to avoid rate limitations
  * *not* strictly necessary for read-only operations

    * i.e. *not* required for :ref:`github_from_pr` and :ref:`github_review_pr` (but it can help)

  * see :ref:`github_user`

* **a GitHub token** + ``keyring`` **Python package**

  * allows accessing the GitHub API with authentication
  * only strictly required for features that require GitHub 'write' permissions

    * i.e. for :ref:`github_upload_test_report` and :ref:`github_new_pr`

  * see :ref:`github_token`

* ``git`` **command** / ``GitPython`` **Python package**

  * only required when local ``git`` commands need to be executed, e.g. to manipulate a Git repository

    * i.e. for :ref:`github_new_pr` and :ref:`github_update_pr`

* **SSH public key registered on GitHub**

  * only required when ``push`` access to Git repositories that reside on GitHub is required

    * i.e. for :ref:`github_new_pr` and :ref:`github_update_pr`

  * see https://github.com/settings/ssh

* **fork of the EasyBuild repositories on GitHub**

  * only required for submitting/updating pull requests (:ref:`github_new_pr` and :ref:`github_update_pr`)
  * see ``Fork`` button (top right) at https://github.com/easybuilders/easybuild-easyconfigs (for example)

See also :ref:`github_requirements_check`.

.. _github_configuration:

Configuration
-------------

The following sections discuss the EasyBuild configuration options relevant to the GitHub integration features.

.. _github_user:

Providing a GitHub username (``--github-user``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To specify your GitHub username, do one of the following:

* use the ``--github-user`` configuration option on the ``eb`` command line
* define the ``$EASYBUILD_GITHUB_USER`` environment variable
* specify ``github-user`` in your EasyBuild configuraton file

(see also :ref:`configuring_easybuild`)


.. _github_token:

Installing a GitHub token (``--install-github-token``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: *requires*: GitHub username + ``keyring`` Python package

A GitHub token is a string of 40 hexidecimal (lowercase) characters that is tied to your GitHub account,
allowing you to access the GitHub API authenticated.

Using a GitHub token is beneficial with respect to rate limitations, and enables write permissions on GitHub
(e.g., posting comments, creating gists, opening pull requests, etc.).

To obtain a GitHub token:

* visit https://github.com/settings/tokens/new and log in with your GitHub account
* enter a token description, for example: "``EasyBuild``"
* make sure (only) the ``gist`` and ``repo`` scopes are fully enabled
* click ``Generate token``
* *copy-paste* the generated token

.. note:: You will only be able to copy-paste the generated token right after you have created it.
          The value corresponding to an existing token can *not* be retrieved later through the GitHub interface.

          **Please keep your token secret at all times**; it allows fully authenticated access to your GitHub account!


You can install the GitHub token in your keyring using EasyBuild, so it can pick it up when it needs to,
using ``eb --install-github-token``::

    $ eb --github-user example --install-github-token
    Token: <copy-paste-your-40-character-token-here>
    Validating token...
    Token seems to be valid, installing it.
    Token 'e3a..0c2' installed!

EasyBuild will validate the provided token, to check that authenticated access to your GitHub account works as expected.

.. note:: EasyBuild will never print the full token value, to avoid leaking it.
          For debugging purposes, only the first and last 3 characters will be shown.


.. _github_git_working_dirs_path:

Specify location of working directories (``--git-working-dirs-path``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can specify the location of your Git working directories using ``--git-working-dirs-path``.

The provided path should be the *parent* directory of the location of the working directories (i.e. clones)
of the EasyBuild repositories (``easybuild-easyconfigs``, etc.); the assumption is that you keep them all in a single
parent directory.

Although not strictly required, this is useful for speeding up ``--new-pr`` and ``--update-pr``,
since it allows that the repository can be copied & updated, rather than being cloned from scratch.


.. _github_requirements_check:

Checking status of GitHub integration (``--check-github``)
----------------------------------------------------------

To check the status of your setup w.r.t. GitHub integration, the ``--check-github`` command line option can be used.

Using this will trigger EasyBuild to perform a number of checks, and report back on what the test results mean
for the different GitHub integration features.

If all requirements are taken care of in your setup, you should see output like this::

    $ eb --check-github

    == temporary log file in case of crash /tmp/eb-xWCpWl/easybuild-hGnKS5.log

    Checking status of GitHub integration...

    Making sure we're online... OK

    * GitHub user... example => OK
    * GitHub token... e3f..0c8 (len: 40) => OK (validated)
    * git command... OK ("git version 2.7.4 (Apple Git-66); ")
    * GitPython module... OK
    * push access to example/easybuild-easyconfigs repo @ GitHub... OK
    * creating gists... OK
    * location to Git working dirs...  OK (/home/example/git-working-dirs)

    All checks PASSed!

    Status of GitHub integration:
    * --from-pr: OK
    * --new-pr: OK
    * --review-pr: OK
    * --update-pr: OK
    * --upload-test-report: OK

.. note:: Checking whether push access to GitHub works may take some time, since a recent clone of
          the easybuild-easyconfigs GitHub repository will be created in the process (at a temporary location).

See also :ref:`github_requirements`.


.. _github_from_pr:

Using easyconfigs from pull requests (``--from-pr``)
----------------------------------------------------

*(supported since EasyBuild v1.13.0)*

Via the ``--from-pr`` command line option (available since EasyBuild v1.13.0), easyconfig files that are added or
modified by a particular pull request to the `easybuild-easyconfigs GitHub repository
<https://github.com/easybuilders/easybuild-easyconfigs>`_ can be used (regardless of whether the pull request is merged
or not).

This can be useful to employ easyconfig files that are not available yet in the active EasyBuild installation,
or to test new contributions by combining ``--from-pr`` with ``--upload-test-report``
(see :ref:`github_upload_test_report`).

When ``--from-pr`` is used, EasyBuild will download all modified files (easyconfig files and patches) to a temporary
directory before processing them.

For example, to use the GCC v4.9.2 easyconfigs contributed via `easyconfigs pull request #1177
<https://github.com/easybuilders/easybuild-easyconfigs/pull/1177>`_::

    $ eb --from-pr 1177 --dry-run
    == temporary log file in case of crash /tmp/eb-88quZc/easybuild-62fFdo.log
    Dry run: printing build status of easyconfigs and dependencies
     * [ ] /tmp/eb-88quZc/files_pr1177/GCC-4.9.2-CLooG-multilib.eb (module: GCC/4.9.2-CLooG-multilib)
     * [ ] /tmp/eb-88quZc/files_pr1177/GCC-4.9.2-CLooG.eb (module: GCC/4.9.2-CLooG)
     * [ ] /tmp/eb-88quZc/files_pr1177/GCC-4.9.2.eb (module: GCC/4.9.2)
    == temporary log file /tmp/eb-88quZc/easybuild-62fFdo.log has been removed.
    == temporary directory /tmp/eb-88quZc has been removed.

.. note::

  To avoid GitHub rate limiting, let EasyBuild know which GitHub account should be used to query the GitHub API,
  and provide a matching GitHub token; see also :ref:`github_token`.

.. _github_from_pr_vs_develop:

Relation between pull requests and current ``develop`` branch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since EasyBuild v2.9.0, the current ``develop`` branch of the central ``easybuild-easyconfigs`` GitHub repository
is taken into account when applicable with ``--from-pr``. Before, only the branch corresponding to the specified pull
request itself was being considered, which potentially did not reflect the correct state of things, in particular
for pull requests based on an outdated branch in which easyconfigs are changed that have been updated in ``develop``
as well.

As such, the exact semantics of ``--from-pr`` depends on the state of the specified pull request, i.e. whether or not
the pull request was merged already, whether the pull request is mergeable and stable (as indicated by Travis), etc.

.. _github_from_pr_vs_develop_open_stable_prs:

Open stable pull requests
+++++++++++++++++++++++++

For *open* pull requests that are *stable* (i.e. tests pass and no merge conflicts), the pull request is effectively
treated as a patch to the current ``develop`` branch. This is done to ensure that contributions that are picked
up via ``--from-pr`` are correctly evaluated.

First, the current ``develop`` branch of the central ``easybuild-easyconfigs`` GitHub repository is downloaded to a
temporary directory. Afterwards, the patch corresponding to the specified pull request is applied on top of the
``develop`` branch. This results in a correct reflection of how the easyconfig files would look
like if the pull request would be merged, which is particularly important for testing of contributions (see also
:ref:`github_upload_test_report`).

Easyconfig files touched by the pull request that are explicitely specified are then picked up from this location;
see also :ref:`github_from_pr_specifying_easyconfigs`.

.. _github_from_pr_vs_develop_merged_prs:

Merged pull requests
++++++++++++++++++++

For merged pull requests, the current ``develop`` branch is considered to be the correct state of
the easyconfigs touched by the pull request.

Note that this implies that the easyconfig files being picked up are potentially different from the ones that
appear in the specified pull request itself, taking into account that further updates may have been applied
in the ``develop`` branch since the pull request got merged.

.. _github_from_pr_vs_develop_closed_unstable_prs:

Closed or unstable pull requests
++++++++++++++++++++++++++++++++

For closed and unstable pull requests, only the branch corresponding to the pull request itself is being considered,
which aligns with the semantics of ``--from-pr`` as it was before EasyBuild v2.9.0. In this case, the current
``develop`` branch is *not* taken into account.

.. note:: A pull request is considered unstable when GitHub reports merge conflicts or when Travis reports
          one or more failing tests.


.. _github_from_pr_robot_synergy:

Synergy with ``--robot``
~~~~~~~~~~~~~~~~~~~~~~~~

Since EasyBuild v1.15.0, the temporary directory containing the easyconfigs (and patch files) from the specified
pull request is included in the robot search path.

Up until EasyBuild v2.9.0, this directory was *prepended* to the robot search path, to ensure that easyconfigs
that were modified in the respective pull request are picked up via ``--robot`` when they are required.
Thus, for easyconfig files that were available in the pull request as well as locally, the ones from the
specified pull request were preferred.

This was changed in EasyBuild v2.9.0, where the directory containing the easyconfigs touched by the pull request
is *appended* to the robot search path. This change was made to ensure that customized easyconfig files that are
available in the robot search path are preferred over the (patched) easyconfig files from the ``develop`` branch
(see also :ref:`github_from_pr_vs_develop`).

For example, to build and install ``HPL`` with the ``intel/2015a`` toolchain, both of which are contributed via
`easyconfigs pull request #1238 <https://github.com/easybuilders/easybuild-easyconfigs/pull/1238>`_::

    $ eb --from-pr 1238 --dry-run --robot $HOME/easyconfigs
    == temporary log file in case of crash /tmp/eb-A1fRvw/easybuild-Eqc8Oi.log
    Dry run: printing build status of easyconfigs and dependencies
     * [x] /home/example/easyconfigs/g/GCC/GCC-4.9.2.eb (module: GCC/4.9.2)
     * [x] /home/example/easyconfigs/i/icc/icc-2015.1.133-GCC-4.9.2.eb (module: icc/2015.1.133-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/ifort/ifort-2015.1.133-GCC-4.9.2.eb (module: ifort/2015.1.133-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/iccifort/iccifort-2015.1.133-GCC-4.9.2.eb (module: iccifort/2015.1.133-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/impi/impi-5.0.2.044-iccifort-2015.1.133-GCC-4.9.2.eb (module: impi/5.0.2.044-iccifort-2015.1.133-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/iimpi/iimpi-7.2.3-GCC-4.9.2.eb (module: iimpi/7.2.3-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/imkl/imkl-11.2.1.133-iimpi-7.2.3-GCC-4.9.2.eb (module: imkl/11.2.1.133-iimpi-7.2.3-GCC-4.9.2)
     * [ ] /tmp/eb-A1fRvw/files_pr1238/intel-2015a.eb (module: intel/2015a)
     * [ ] /tmp/eb-A1fRvw/files_pr1238/HPL-2.1-intel-2015a.eb (module: HPL/2.1-intel-2015a)
    == temporary log file /tmp/eb-A1fRvw/easybuild-Eqc8Oi.log has been removed.
    == temporary directory /tmp/eb-A1fRvw has been removed.

Note that the easyconfigs that are required to resolve dependencies and are available locally in
``$HOME/easyconfigs`` are being picked up as needed.

.. _github_from_pr_specifying_easyconfigs:

Specifying particular easyconfig files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since EasyBuid v2.0.0 the particular easyconfigs to be used can be specified, rather than using all easyconfigs that are
touched by the pull request (which is the default if no easyconfigs are specified alongside ``--from-pr``).

For example, to only use ``CMake-3.0.0-intel-2015a.eb`` from `easyconfigs pull request #1330
<https://github.com/easybuilders/easybuild-easyconfigs/pull/1330>`_, and ignore the other easyconfigs being contributed
in that same pull request for netCDF, WRF, ...::

    $ eb --from-pr 1330 CMake-3.0.0-intel-2015a.eb --dry-run --robot $HOME/easyconfigs
    == temporary log file in case of crash /tmp/eb-QhM_qc/easybuild-TPvMkJ.log
    Dry run: printing build status of easyconfigs and dependencies
     * [x] /home/example/easyconfigs/g/GCC/GCC-4.9.2.eb (module: GCC/4.9.2)
     * [x] /home/example/easyconfigs/i/icc/icc-2015.1.133-GCC-4.9.2.eb (module: icc/2015.1.133-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/ifort/ifort-2015.1.133-GCC-4.9.2.eb (module: ifort/2015.1.133-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/iccifort/iccifort-2015.1.133-GCC-4.9.2.eb (module: iccifort/2015.1.133-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/impi/impi-5.0.2.044-iccifort-2015.1.133-GCC-4.9.2.eb (module: impi/5.0.2.044-iccifort-2015.1.133-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/iimpi/iimpi-7.2.3-GCC-4.9.2.eb (module: iimpi/7.2.3-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/imkl/imkl-11.2.1.133-iimpi-7.2.3-GCC-4.9.2.eb (module: imkl/11.2.1.133-iimpi-7.2.3-GCC-4.9.2)
     * [x] /home/example/easyconfigs/i/intel/intel-2015a.eb (module: intel/2015a)
     * [x] /home/example/easyconfigs/n/ncurses/ncurses-5.9-intel-2015a.eb (module: ncurses/5.9-intel-2015a)
     * [ ] /tmp/eb-QhM_qc/files_pr1330/CMake-3.0.0-intel-2015a.eb (module: CMake/3.0.0-intel-2015a)
    == temporary log file /tmp/eb-QhM_qc/easybuild-TPvMkJ.log has been removed.
    == temporary directory /tmp/eb-QhM_qc has been removed.

Again, note that locally available easyconfigs that are required to resolve dependencies are being picked up as needed.


.. _github_upload_test_report:

Uploading test reports (``--upload-test-report``)
-------------------------------------------------

*(supported since EasyBuild v1.13.0)*

.. note:: requires that a GitHub token was required ``gist`` permissions is available, cfr. :ref:`github_token`

For every installation performed with EasyBuild, a test report is generated.
By default, the test report is copied in the installation directory, right next to the log file
(see also :ref:`understanding_easyBuild_logs`).

Using ``--upload-test-report``, the test report can also be pushed to GitHub
(as a *gist*, cfr. https://gist.github.com) to share it with others.

Each test report includes:

* an overview of the easyconfigs being processed
* time & date
* the exact ``eb`` command line that was used
* the full EasyBuild configuration that was in place
* information about the system on which EasyBuild was used (hostname, OS, architecture, etc.)
* the list of modules that was loaded
* the full environment of the session in which ``eb`` was run
  (note: can be filtered, see :ref:`github_test_report_env_filter`)

For each easyconfig that *failed* to install a partial log will be uploaded as a separate gist,
and a link to this gist will be included in the test report.

If ``--upload-test-report`` is combined with ``--from-pr``, a comment referring to the test report (incl. a brief
summary) will be placed in the respective pull request. This makes it a very powerful tool when testing contributions.

.. note:: If you want to easily access a test report without uploading it to GitHub, use ``--dump-test-report``.

Example::

    $ eb --from-pr 3153 --rebuild --upload-test-report
    == temporary log file in case of crash /tmp/eb-aqk20q/easybuild-wuyZBV.log
    == processing EasyBuild easyconfig /tmp/eb-aqk20q/files_pr3153/EasyBuild/EasyBuild-2.8.1.eb
    == building and installing EasyBuild/2.8.1...
    ...
    == COMPLETED: Installation ended successfully
    == Results of the build can be found in the log file /home/example/software/EasyBuild/2.8.1/easybuild/easybuild-EasyBuild-2.8.1-20160603.090702.log
    == Test report uploaded to https://gist.github.com/1cb2db8a2913a1b8ddbf1c6fee3ff83c and mentioned in a comment in easyconfigs PR#3153
    == Build succeeded for 1 out of 1
    == Temporary log file(s) /tmp/eb-aqk20q/easybuild-wuyZBV.log* have been removed.
    == Temporary directory /tmp/eb-aqk20q has been removed.

The resulting test report can be viewed at https://gist.github.com/1cb2db8a2913a1b8ddbf1c6fee3ff83c .

.. note:: It is common to use ``--rebuild`` in combination with ``--upload-test-report``, to ensure that all easyconfigs
          in the pull request are rebuilt, resulting in a complete test report.

.. _github_test_report_env_filter:

Filtering the environment details (``--test-report-env-filter``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since the environment of the session in which ``eb`` was used may contain sensitive information,
it can be filtered through ``--test-report-env-filter``.

This configuration option takes a regular expression that is used to determine which environment variables
can be included in the test report (based on their name).
Environment variables for which the name *matches* the specified regular expression will *not* be included
in the test report.

An example of a typical setting::

    export EASYBUILD_TEST_REPORT_ENV_FILTER='^SSH|USER|HOSTNAME|UID|.*COOKIE.*'


.. _github_review_pr:

Reviewing easyconfig pull requests (``--review-pr``)
----------------------------------------------------

A useful tool when reviewing pull requests for the `easybuild-easyconfigs repository
<https://github.com/easybuilders/easybuild-easyconfigs>`_ that add new or update existing easyconfig files is
``--review-pr``.

The 'files' tab in the GitHub interface shows the changes being made to existing files;
using ``--review-pr`` the differences with one or more other *similar* easyconfig files, for example the one(s)
with the same toolchain (version) and/or software version, can also be evaluated.

This is very useful to quickly see how easyconfig files in pull requests differ from existing easyconfig files,
and to maintain consistency across easyconfig files where desired.

The ``--review-pr`` output consists of a 'multidiff' view per easyconfig file that is being touched by
the specified pull request. The exact format of the output depends on whether EasyBuild is configured to allow
colored output (enabled by default, see ``--color``).

Search criteria for similar easyconfigs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The set of existing similar easyconfig files is determined by specific search criteria; the first one that results
in a non-empty set of easyconfigs is retained.

The search criteria consists of a combination of the *software version criterion* with additional restrictions.

The software version criterion is one of the criterions below (considered in order), with ``x.y.z`` the software
version of the easyconfig file from the pull request:

* exact same software version
* same major/minor software version (same ``x`` and ``y``)
* same major software version (same ``x``)
* no (partial) version match (so consider any version)

The addition restrictions are the following (also considered in order):

* matching versionsuffix and toolchain name/version
* matching versionsuffix and toolchain name (any toolchain version)
* matching versionsuffix (any toolchain name/version)
* matching toolchain name/version (any versionsuffix)
* matching toolchain name (any versionsuffix, toolchain version)
* no extra requirements (any versionsuffix, toolchain name/version)


.. _github_merge_pr:

Merging easyconfig pull requests (``--merge-pr``)
-------------------------------------------------

*(supported since EasyBuild v3.3.1)*

:ref:`maintainers` need to take the :ref:`contributing_review_process_pr_requirements` into account.

They can merge a pull request to the ``easybuild-easyconfigs`` repository via ``eb --merge-pr``,
which will first verify whether the pull request meets the prescribed requirements
(at least the ones that can be verified automatically).

For example, for a pull request that is not eligible for merging yet::

    $ eb --merge-pr 4725
    == temporary log file in case of crash /tmp/eb-ba7rVp/easybuild-fBfcwN.log

    easybuilders/easybuild-easyconfigs PR #4725 was submitted by vanzod, you are using GitHub account 'example'

    Checking eligibility of easybuilders/easybuild-easyconfigs PR #4725 for merging...
    * targets develop branch: OK
    * test suite passes: FAILED => not eligible for merging!
    * last test report is successful: (no test reports found) => not eligible for merging!
    * approved review: MISSING => not eligible for merging!
    * milestone is set: no milestone found => not eligible for merging!

    WARNING: Review indicates this PR should not be merged (use -f/--force to do so anyway)


When a PR is considered eligible for merging, EasyBuild will go ahead and merge it::


    $ eb --merge-pr 4829
    == temporary log file in case of crash /tmp/eb-F9a3oB/easybuild-3B2wdq.log

    easybuilders/easybuild-easyconfigs PR #4829 was submitted by SethosII, you are using GitHub account 'example'

    Checking eligibility of easybuilders/easybuild-easyconfigs PR #4829 for merging...
    * targets develop branch: OK
    * test suite passes: OK
    * last test report is successful: OK
    * approved review: OK (by boegel)
    * milestone is set: OK (3.3.1)

    Review OK, merging pull request!

    Adding comment to easybuild-easyconfigs issue #4829: 'Going in, thanks @SethosII!'
    Merged easybuilders/easybuild-easyconfigs pull request #4829


.. note:: ``eb --merge-pr`` can also be run in dry run mode, by also using one of the following options:
          ``--dry-run``, ``-D``, ``--extended-dry-run``, ``-x``.

          This results in the same checks being performed but skips the actual merging of the pull request,
          resulting in messages like::

            $ eb --merge-pr 4829 --dry-run

            ...

            Review OK, merging pull request!

            [DRY RUN] Adding comment to easybuild-easyconfigs issue #4829: 'Going in, thanks @SethosII!'
            [DRY RUN] Merged easybuilders/easybuild-easyconfigs pull request #4829


.. _github_new_update_pr:

Submitting new and updating pull requests (``--new-pr``, ``--update-pr``)
-------------------------------------------------------------------------

*(supported since EasyBuild v2.6.0)*

EasyBuild provides two simple yet powerful features that make contributing to the central EasyBuild repositories
significantly easier and less error-prone, especially for people who are not very familiar with ``git`` and/or GitHub
yet:

* ``--new-pr`` to create new pull requests
* ``--update-pr`` to update existing pull requests

.. _github_preview_pr:

Previewing easyconfig pull requests (``--preview-pr``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*(supported since EasyBuild v3.5.0)*

It is very useful to quickly see how easyconfig files in pull requests differ from existing easyconfig files, and to 
maintain consistency across easyconfig files where desired. 

Maintainers will use ``--review-pr`` as part of the review process once the PR is submitted (see :ref:`github_review_pr`),
but it is now possible to preview that output before submitting a PR, eventually fixing any inconsistencies in advance.

To preview a PR before submitting, simply use ``--preview-pr`` with the list of files to submit::

    $ eb --preview-pr example.eb example.patch 

Besides accepting local files instead of a PR number, ``--preview-pr`` works the same as ``--review-pr``,
as described in :ref:`contributing_review_process_review_pr`.

.. _github_new_pr:

Submitting pull requests (``--new-pr``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: Submitting pull requests using ``--new-pr`` only works for the ``easybuild-easyconfigs`` repository, for now.
          For other repositories, see the manual procedure documented at :ref:`contributing_pull_requests`.

To create a new pull request, the ``--new-pr`` command line option can be used, provided that the necessary
requirements are fullfilled (see :ref:`github_requirements`).

In its simplest form, you just provide the location of the file(s) that you want to include in the pull request::

    $ eb --new-pr test.eb

This takes care of all the steps required to make a contribution, i.e.:

* set up a working copy of the relevant EasyBuild repository (e.g., ``easybuild-easyconfigs``)
* create a new 'feature' branch, starting from the up-to-date ``develop`` branch
* renaming easyconfig files according to their ``name``, ``version``, ``versionsuffix`` and ``toolchain``
* moving easyconfig files to the right location in the repository (e.g. ``easybuild/easyconfigs/e/EasyBuild/``)
* staging and committing the files in the feature branch
* pushing the feature branch to your fork of the relevant EasyBuild repository on GitHub
* creating the pull request, targetting the ``develop`` branch of the central EasyBuild repository (e.g. ``easybuilders/easybuild-easyconfigs``)

It should be clear that automating this whole procedure with a single simple ``eb`` command greatly lowers the bar
for contributing, especially since it even alleviates the need for interacting directly with ``git`` entirely!

The working copy of the EasyBuild repository is created in a temporary location, and cleaned up once the pull request
has been created. EasyBuild does *not* make changes to an existing working copy you may have in place already
(cfr. :ref:`github_git_working_dirs_path`).

.. note:: When modifying existing files via ``--new-pr``,
          you *must* specify a (meaningful) commit message using `--pr-commit-msg`, see :ref:`github_controlling_pr_metadata`.

Example
+++++++

For example, to create a pull request for a new version of, let's say, EasyBuild::

    $ eb --new-pr example.eb
    == temporary log file in case of crash /tmp/eb-mWKR9u/easybuild-cTpf2W.log
    == copying /home/example/git-working-dirs/easybuild-easyconfigs...
    == fetching branch 'develop' from https://github.com/easybuilders/easybuild-easyconfigs.git...

    Opening pull request
    * target: easybuilders/easybuild-easyconfigs:develop
    * from: boegel/easybuild-easyconfigs:20160530131447_new_pr_EasyBuild281
    * title: "{tools}[dummy/dummy] EasyBuild v2.8.1"
    * description:
    """
    (created using `eb --new-pr`)

    """
    * overview of changes:
     .../easyconfigs/e/EasyBuild/EasyBuild-2.8.1.eb     | 35 ++++++++++++++++++++++
     1 file changed, 35 insertions(+)

    Opened pull request: https://github.com/easybuilders/easybuild-easyconfigs/pull/3153

Yes, it's that easy!

.. _github_update_pr:

Updating existing pull requests (``--update-pr``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: Updating pull requests using ``--update-pr`` only works for the ``easybuild-easyconfigs`` repository, for now.
          For other repositories, see the manual procedure documented at :ref:`contributing_pull_requests`.

Similarly to creating new pull requests, existing pull requests can be easily updated using ``eb --update-pr``
(regardless of whether or not they were created with ``--new-pr``).

The usage is equally simple, for example to update pull request ``#1234`` just list the changed/new file(s)::

    $ eb --update-pr 1234 example.eb

Again, this take care of the whole procedure required to update an existing pull request:

* set up a working copy of the relevant EasyBuild repository (e.g., ``easybuild-easyconfigs``)
* determining the branch corresponding to the pull request, which should be updated by pushing a new commit to it
* checking out that branch
* renaming easyconfig files according to their ``name``, ``version``, ``versionsuffix`` and ``toolchain``
* moving easyconfig files to the right location in the repository (e.g. ``easybuild/easyconfigs/e/EasyBuild/``)
* staging and committing the (changed/new) files
* pushing the updated branch to GitHub

Again, not a single ``git`` command to be executed; the only thing that is required is the ID of the pull request
that should be updated.

Just like with ``--new-pr``, this is done in a temporary working copy of the repository, no changes are made to
a possible existing working copy.

.. note:: When using ``--update-pr`` you *must* specify a (meaningful) commit message
          via ``--pr-commit-msg``, see :ref:`github_controlling_pr_metadata`.

Example
+++++++

For example, to update pull request #3153 with a changed easyconfig file::

    eb --update-pr 3153 example.eb
    == temporary log file in case of crash /tmp/eb-gO2wJu/easybuild-37Oo2z.log
    == Determined branch name corresponding to easybuilders/easybuild-easyconfigs PR #3153: 20160530131447_new_pr_EasyBuild281
    == copying /home/example/git-working-dirs/easybuild-easyconfigs...
    == fetching branch '20160530131447_new_pr_EasyBuild281' from https://github.com/boegel/easybuild-easyconfigs.git...
    Overview of changes:
     easybuild/easyconfigs/e/EasyBuild/EasyBuild-2.8.1.eb | 3 +++
     1 file changed, 3 insertions(+)

    Updated easybuilders/easybuild-easyconfigs PR #3159 by pushing to branch boegel/20160530131447_new_pr_EasyBuild281

.. _github_new_update_pr_patches:

Including patch files in easyconfigs pull requests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Next to providing one or more easyconfig files to add/update via ``--new-pr`` or ``--update-pr``,
you can also include patch files that are required by those easyconfig files.

EasyBuild will try and figure out where each patch file should be located
(i.e. in the same directory as the easyconfig files that require that patch file),
by scanning the provided easyconfigs (or, if needed, scanning *all* existing easyconfig files).

For example::

  eb --new-pr example.eb example.patch --pr-commit-msg "just an example"

.. note:: When providing one or more patch files, you *must* specify a (meaningful) commit message
          via ``--pr-commit-msg``, see :ref:`github_controlling_pr_metadata`.

.. _github_new_update_pr_delete:

Deleting easyconfig files or patches
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Next to adding easyconfigs files or patches, or modifying existing ones, you can also specify to *delete*
particular files, by including a colon character ```:`` before the name of the file.

For example::

  eb --new-pr :example-1.0.eb --pr-commit-msg "delete example-1.0.eb easyconfig file"

.. note:: When deleting existing files, you *must* specify a custom commit message using ``--pr-commit-msg``,
          see also :ref:`github_controlling_pr_metadata`.

.. _github_controlling_pr_metadata:

Controlling pull request metadata
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can control the metadata for pull requests using the following configuration options:

* ``--pr-branch-name``: branch name for new pull requests
* ``--pr-commit-msg``: commit message to use when creating new or updating existing pull requests
* ``--pr-descr``: pull request description
* ``--pr-title``: pull request title

EasyBuild will use sensible defaults for each of these, see below.

Default branch name for new pull requests
+++++++++++++++++++++++++++++++++++++++++

The branch name for new pull requests will be composed from:

* a timestamp, down to the second in an attempt to make it unique

  * example: ``20160513141133`` for a pull request created on May 13th 2016, 2:11:33 PM

* a label ``new_pr``

* the software name and version of the first easyconfig file, with some filtering (e.g. remove ``.``'s)

  * example: ``GCC530`` for GCC v5.3.0

Full example: ``20160513141133_new_pr_GCC530``

Although there is usually no reason to change this default, it can be done if desired using ``--pr-branch-name``
when opening a new pull request with ``--new-pr``.

Default commit message
++++++++++++++++++++++

EasyBuild will try to generate an appropriate default commit message when only new easyconfigs are being added via ``--new-pr``.

When existing easyconfigs are being modified, patch files are being added/updated or ``--update-pr`` is used,
a custom (meaningful) commit message *must* be provided via ``--pr-commit-msg`` (see :ref:`github_controlling_pr_metadata`).

Default pull request description
++++++++++++++++++++++++++++++++

By default, the pull description will only contain the following text::

    (created using eb --new-pr)

It is generally advised to provide more descriptive information, although the changes made by the pull request
may be self-explanatory (e.g. when only adding new easyconfig files).

To change this default text, you can either use ``--pr-descr`` or edit the description via the GitHub interface
after the pull request has been opened.

Particularly useful information to specify here is dependencies on other pull requests, by copy-pasting the
respective URLs with a short descriptive message like '``depends on PR <URL>``'.

Default pull request title
++++++++++++++++++++++++++

The pull request title is derived from the easyconfig files being changed/added, taking into account the
recommendation for easyconfig pull requests to clearly specify module class, toolchain, software name/version, as
follows: ``{<module_class>}[<toolchain>] <software_name> v<software_version>``.

For example, when opening a pull request for an easyconfig for Python 2.7.11 with the ``intel/2016a`` toolchain,
the default pull request title will be something like: ``{lang}[intel/2016a] Python v2.7.11`` .

If multiple easyconfig files are provided, the respective software names/versions will be included separated by a ``,``,
up until the first 3 easyconfig files (to avoid excessively lenghty pull request titles).

In case (only) existing easyconfig files are being changed, it's advisable to provide a more descriptive title
using ``--pr-title``.

.. _github_configuring_new_update_pr:

Configuring ``--new-pr`` and ``--update-pr``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default, ``--new-pr`` and ``--update-pr`` affect pull requests to the central ``easybuilders/easybuild-easyconfigs``
repository.

However, this can be changed with the following configurations options:

* ``--pr-target-account`` (default: ``easybuilders``): target GitHub account for new pull requests
* ``--pr-target-branch`` (default: ``develop``): target branch for new pull requests
* ``--pr-target-repo`` (default: ``easybuild-easyconfigs``): target repository for new pull requests

.. _github_synergy_new_update_pr_dry_run:

Synergy with ``--dry-run``/``-D`` and ``--extended-dry-run``/``-x``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Both ``--new-pr`` and ``--update-pr`` are 'dry run-aware', in the sense that you can combine them with either
``--dry-run``/``-D-`` or ``--extended-dry-run``/``-x`` to preview the pull request they would create/update without
actually doing so.

For example::

    $ eb --new-pr EasyBuild-2.9.0.eb -D
    == temporary log file in case of crash /tmp/eb-1ny69k/easybuild-UR1Wr4.log
    == copying /home/example/git-working-dirs/easybuild-easyconfigs...
    == fetching branch 'develop' from https://github.com/easybuilders/easybuild-easyconfigs.git...

    Opening pull request [DRY RUN]
    * target: easybuilders/easybuild-easyconfigs:develop
    * from: boegel/easybuild-easyconfigs:20160603105641_new_pr_EasyBuild290
    * title: "{tools}[dummy/dummy] EasyBuild v2.9.0"
    * description:
    """
    (created using `eb --new-pr`)

    """
    * overview of changes:
     .../easyconfigs/e/EasyBuild/EasyBuild-2.9.0.eb     | 35 ++++++++++++++++++++++
     1 file changed, 35 insertions(+)

The only difference between using ``--dry-run`` and ``--extended-dry-run`` is that the latter will show the full diff
of the changes (equivalent to ``git diff``), while the former will only show a summary of the changes
(equivalent to ``git diff --stat``, see example above).
