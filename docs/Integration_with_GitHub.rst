.. _integration_with_github:

Integration with GitHub
=======================

EasyBuild provides several features that integrate with GitHub, where the different EasyBuild repositories are located.

From the EasyBuild command line ``eb`` several options are available to reach out to GitHub,
which are documented below.

.. contents::
    :depth: 2
    :backlinks: none

.. _github_requirements:

Requirements
------------

Depending on which GitHub integration features you want to use, there are a couple of requirements:

* **a GitHub user name**

  * only required for authenticated access to the GitHub API, which can help to avoid rate limitations
  * *not* strictly necessary for read-only operations (:ref:`github_from_pr` and :ref:`github_review_pr`)
  * see :ref:`github_user`

* **a GitHub token** + ``keyring`` **Python package**

  * allows accessing the GitHub API with authentication
  * only strictly required for features that require GitHub write permissions
    (:ref:`github_upload_test_report` and :ref:`github_new_pr`)
  * see :ref:`github_token`

* ``git`` **command** / ``GitPython`` **Python package**

  * only required when local ``git`` commands need to be executed, e.g. to manipulate a Git repository
    (:ref:`github_new_pr` and :ref:`github_update_pr`)

* **SSH public key registered on GitHub**

  * only required when push access to Git repositories that reside on GitHub is required
    (:ref:`github_new_pr` and :ref:`github_update_pr`)
  * see https://github.com/settings/ssh

* **fork of the EasyBuild repositories on GitHub**

  * only required for submitting pull requests (:ref:`github_new_pr` and :ref:`github_update_pr`)
  * see ``Fork`` button (top right) at https://github.com/hpcugent/easybuild-easyconfigs (for example)

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


.. _github_requirements_check:

Checking status of GitHub integration (``--check-github``)
----------------------------------------------------------

To check the status of your setup w.r.t. GitHub integration, the ``--check-github`` command line option can be used.

Using this will trigger EasyBuild to perform a number of checks, and report back on what the test results mean
for the different GitHub integration features.

If all requirements are taken care of in your setup, you should see output like this::

    $ eb --check-github

    FIXME

.. note:: Checking whether push access to GitHub works may take some time, since a recent clone of
          the easybuild-easyconfigs GitHub repository will be created in the process (at a temporary location).


.. _github_from_pr:

Using easyconfigs from pull requests (``--from-pr``)
----------------------------------------------------

*(supported since EasyBuild v1.13.0)*

Via the ``--from-pr`` command line option (available since EasyBuild v1.13.0), easyconfig files that are added or
modified by a particular pull request to the `easybuild-easyconfigs GitHub repository
<https://github.com/hpcugent/easybuild-easyconfigs>`_ can be used (regardless of whether the pull request is still
open or not).

This can be useful to use easyconfig files that are not available yet in the active EasyBuild installation,
or to test new contributions by combining ``--from-pr`` with ``-upload-test-report`` (see :ref:`upload_test_report`).

When ``--from-pr`` is used, EasyBuild will download all modified files (easyconfig files and patches) to a temporary
directory before processing them.

For example, to use the GCC v4.9.2 easyconfigs contributed via `easyconfigs pull request #1177
<https://github.com/hpcugent/easybuild-easyconfigs/pull/1177>`_::

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
  via ``--github-user``. 

.. _github_from_pr_robot_synergy:

Synergy with ``--robot``
~~~~~~~~~~~~~~~~~~~~~~~~

Since EasyBuild v1.15.0, the temporary directory containing the easyconfigs (and patch files) from the specified
pull request is *prepended* to the robot search path, to ensure that easyconfigs
that were modified in the respective pull request are picked up via ``--robot`` when they are required.
Thus, for easyconfig files that are both available in the pull request and are available locally, the ones from the
specified pull request will be preferred.

For example, to build and install HPL with the ``intel/2015a`` toolchain, both of which are contributed via
`easyconfigs pull request #1238 <https://github.com/hpcugent/easybuild-easyconfigs/pull/1238>`_::

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
<https://github.com/hpcugent/easybuild-easyconfigs/pull/1330>`_, and ignore the other easyconfigs being contributed
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

https://github.com/hpcugent/easybuild/wiki/Review-process-for-contributions#automated-testing-of-easyconfigs-pull-requests


.. _github_review_pr:

Reviewing easyconfig pull requests (``--review-pr``)
----------------------------------------------------


.. _github_new_pr:

Submitting new pull requests (``--new-pr``)
-------------------------------------------

*(supported since EasyBuild v2.6.0)*

.. _github_update_pr:

Updating existing pull requests (``--update-pr``)
-------------------------------------------------

*(supported since EasyBuild v2.6.0)*
