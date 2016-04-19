.. _integration_with_github:

Integration with GitHub
=======================

EasyBuild provides some integration with GitHub, where the different EasyBuild repositories are located.

From the EasyBuild command line ``eb`` several options are available to reach out to GitHub,
which are documented below:

* :ref:`github_token`
* :ref:`from_pr`

.. _github_token:

Using a GitHub token to enable authenticated access via ``--github-user``
-------------------------------------------------------------------------

To specify that a particular GitHub account should be used to query the GitHub API, use ``--github-user``.
A matching GitHub token must be available for the specified account if ``--github-user`` is used.

If a GitHub token is available EasyBuild can access the GitHub API authenticated. This is beneficial with respect
to rate limiting constraints, and required for posting comments or when another form of write/push access is needed.

For more information on obtaining a GitHub token and providing it to EasyBuild, see
https://github.com/hpcugent/easybuild/wiki/Review-process-for-contributions#setting-things-up .

.. _from_pr:

Using easyconfigs from pull requests via ``--from-pr``
------------------------------------------------------

Via the ``--from-pr`` command line option (available since EasyBuild v1.13.0), easyconfig files that are added or
modified by a particular pull request to the `easybuild-easyconfigs GitHub repository
<https://github.com/hpcugent/easybuild-easyconfigs>`_ can be used (regardless of whether the pull request is still
open or not).

This can be useful to use easyconfig files that are not available yet in the active EasyBuild installation,
or to test new contributions by combining ``--from-pr`` with ``-upload-test-report`` (see
https://github.com/hpcugent/easybuild/wiki/Review-process-for-contributions#automated-testing-of-easyconfigs-pull-requests
).

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

.. _from_pr_robot_synergy:

Synergy with --robot
~~~~~~~~~~~~~~~~~~~~

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

.. _from_pr_specifying_easyconfigs:

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
