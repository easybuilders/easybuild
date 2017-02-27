.. _contributing:

Contributing
============

This documentation explains how you can contribute to EasyBuild,
and discusses the review process for contributions.

.. contents::
    :depth: 3
    :backlinks: none

.. _contributing_how:

How to contribute
-----------------

It is a common misconception that contributing to an open source project
requires being intimately familiar with its codebase.

There are various ways to contribute, even if you don't have any experience
with the programming language(s) being used by the project you are interested in.

You can contribute to EasyBuild by:

* :ref:`contributing_feedback`
* :ref:`contributing_bugs`
* :ref:`contributing_requests`
* :ref:`contributing_helping_others`
* :ref:`contributing_easyconfigs`
* :ref:`contributing_code`
* :ref:`contributing_docs`
* :ref:`contributing_conversation`

.. _contributing_feedback:

Giving feedback
~~~~~~~~~~~~~~~

An easy way to contribute to EasyBuild, even without having a lot of
hands-on experience with it, is to **provide feedback** on your experiences.

Feedback from people new to EasyBuild is valuable, since it provides
a perspective that is easily overlooked by more experienced users.

You can contact the EasyBuild community via the EasyBuild mailing
list (``easybuild@lists.ugent.be``), the ``#easybuild`` IRC channel (see also :ref:`getting_help`).

.. _contributing_bugs:

Reporting bugs
~~~~~~~~~~~~~~

If you run into unexpected problems when using EasyBuild, please **open a bug report**
in the issue tracker of the relevant GitHub repository:

* https://github.com/hpcugent/easybuild-framework/issues: for general problems with ``eb``, the EasyBuild framework, etc.
* https://github.com/hpcugent/easybuild-easyblocks/issues: for problems specific to a particular (generic or software-specific) easyblock, etc.
* https://github.com/hpcugent/easybuild-easyconfigs/issues: for problems specific to a particular software package,
  e.g., with building and installing a particular version of that software, or when using a particular toolchain, etc.
* https://github.com/hpcugent/easybuild/issues: for problems with the EasyBuild documentation, etc.

Please try and provide all relevant information, which may include:

* the EasyBuild version you are using
* the specifics of the system you are using, incl. OS + version, Python version, modules tool & version, etc.
* the active EasyBuild configuration; usually the output of ``eb --show-config`` is sufficient
* the full ``eb`` command line that was used
* warning or error messages, or other relevant informative messages
* filename or contents of easyconfig file(s) being used
* EasyBuild log file (for example via https://gist.github.com/), preferably collected with ``eb --debug``


.. _contributing_requests:

Submitting feature/change requests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you have **suggestions for enhancements or ideas for new features** that could be useful,
please open an issue in the relevant GitHub repository (see :ref:`contributing_bugs`).

Describe what you have in mind, and maybe also provide a concrete example to illustrate
how your suggestion would improve the current functionality.


.. _contributing_helping_others:

Helping others
~~~~~~~~~~~~~~

Try and **help others** based on your experience, or help them figure out an answer to their question
or a solution to their problem using the EasyBuild documentation or by reaching out
to someone else in the EasyBuild community that may know the answer.

The EasyBuild community is known to be very welcoming and helpful, and you too can be a part of that.


.. _contributing_easyconfigs:

Contributing easyconfig files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Please **contribute easyconfig files** that are not included yet in
(the ``develop`` branch of) the ``easybuild-easyconfigs`` GitHub repository at
https://github.com/hpcugent/easybuild-easyconfigs.

This includes easyconfigs for software that is not supported yet by EasyBuild,
as well as updates to existing easyconfigs (e.g., version updates, using a
different toolchain, etc.), even if you consider the updates to be trivial.
Keep in mind that being able to use something that is known to work out-of-the-box
can save quite a bit of time compared to having to tweak existing easyconfigs
and validate the result installations.

We highly recommend using the ``--new-pr`` and ``--update-pr`` command
line options for contributing easyconfig files; see :ref:`github_new_update_pr`.


.. _contributing_code:

Contributing code changes
~~~~~~~~~~~~~~~~~~~~~~~~~

Of course you can also **contribute code changes**, including bug fixes,
enhancements or additional features in the EasyBuild framework, the easyblocks repository,
the test suites or in related scripts.

Do keep in mind that this requires some experience with Python,
although you should be able to go a long way by using the existing code base as support.

See :ref:`contributing_pull_requests` for more information on the practical
aspects of contributing code.


.. _contributing_docs:

Writing documentation
~~~~~~~~~~~~~~~~~~~~~

Another way to contribute to EasyBuild without having to implement Python
code is by **writing documentation**, i.e. enhancing or updating existing
documentation or documenting features that are not covered yet.

To contribute to the documentation hosted at http://easybuild.readthedocs.io/,
you should open a pull request to the ``develop`` branch of the
main EasyBuild repository at https://github.com/hpcugent/easybuild; see the ``docs`` subdirectory.

A particularly useful tool is http://rst.ninjs.org/, which can be used to
preview how the documentation written in ``reStructuredText`` format
will be rendered on ``readthedocs.org`` (select the ``Nature`` theme for optimal
results).


.. _contributing_conversation:

Joining the conversation
~~~~~~~~~~~~~~~~~~~~~~~~

Last but not least, you can actively **join the conversation** that arise on the EasyBuild
mailing list, the ``#easybuild`` IRC channel and during the bi-weekly EasyBuild
conference calls (see https://github.com/hpcugent/easybuild/wiki/Conference-calls).

Engage with the EasyBuild community, and help steer EasyBuild development by participating
in the conversations regarding a variety of topics related to building and installing (scientific) software.


.. _contributing_pull_requests:

Pull requests
-------------

To contribute to the EasyBuild framework, easyblocks, easyconfig files
or the EasyBuild documentation, you will need to open a **pull request** to the
corresponding GitHub repository:

* EasyBuild framework: https://github.com/hpcugent/easybuild-framework
* easyblocks: https://github.com/hpcugent/easybuild-easyblocks
* easyconfigs: https://github.com/hpcugent/easybuild-easyconfigs
* documentation: https://github.com/hpcugent/easybuild (see ``docs`` subdirectory)

Doing this the traditional way requires some knowledge about using ``git``
(i.e. creating commits, using branches, pushing to and pulling from remote
Git repositories, etc.), and being familiar with GitHub.

However, this can be largely circumvented by using the GitHub integration
provided by EasyBuild, see :ref:`integration_with_github`.


.. _contributing_pull_request_setup:

Setting up
~~~~~~~~~~

.. note:: These instructions assume that you already have a working GitHub account.

          If you don't have a GitHub account yet, visit https://github.com/ to create one.

          We highly recommend registering your SSH public key in your GitHub account,
          via https://github.com/settings/keys. This allows pushing to your fork of
          the GitHub repositories without using a password.

Before you can open pull requests, you will need to **fork** the GitHub repository
you are targeting, and create a local **working copy** of that repository. This only
needs to be done *once* for every of the EasyBuild repositories.

.. note:: For the purpose of this guide, we will be using the ``easybuild-framework`` repository.

          However, the instructions are equivalent for the other EasyBuild repositories.

.. _contributing_pull_request_setup_fork_repo:

Forking the repository
++++++++++++++++++++++

First, create your own *fork* of the repository in your GitHub account using the
'``Fork``' button on the top right at https://github.com/hpcugent/easybuild-framework.

This will create a 'copy' of the ``easybuild-framework`` repository
owned by the ``hpcugent`` GitHub organisation to your own personal GitHub account.

You will have to use this fork as a staging area for your work,
to prepare your contributions before creating the actual pull requests.

.. _contributing_pull_request_setup_working_copy:

Creating a working copy
+++++++++++++++++++++++

.. note:: Do not forget to replace '``EXAMPLE``' with your GitHub account name in the instructions below.

In addition to forking the repository on GitHub, you also need to create
a local *working copy* of the repository. This is basically a local checkout
of the repository where you can track the changes you are making.

First, *clone* your fork of the repository:

.. code:: shell

  git clone git@github.com:EXAMPLE/easybuild-framework.git

If that worked as expected, you should have a new directory named ``easybuild-framework``.
Move into the ``easybuild-framework`` directory:

.. code:: shell

  cd easybuild-framework

Finally, we recommended to also check out the ``develop`` branch,
which will be used as the base for your own branches:

.. code:: shell

  git checkout -b develop origin/develop

With this in place, you are all set to open pull requests for your contributions.

Keeping the ``develop`` branch in sync
######################################

It is important to keep the ``develop`` branch in your working copy in sync
with the upstream repository in the GitHub ``hpcugent`` organization.

For this, you need to add the upstream repository as a '*remote*' repository:

.. code:: shell

  git remote add upstream git@github.com:hpcugent/easybuild-framework.git

.. note:: '``upstream``' is just a name that you give to the remote the central
          ``hpcugent`` repository on GitHub; you can modify this to your liking
          if desired (but do take that into account for the further instructions if you do so).

          For your fork of the repository, a default remote named ``origin`` should
          have been created via ``git clone`` (see the output of ``git remote -v``).

To sync your ``develop`` branch, use ``git pull upstream develop`` after making
sure you have the ``develop`` branch checked out:

.. code:: shell

  git checkout develop
  git pull upstream develop


.. _contributing_creating_pull_requests:

Opening a new pull request
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: This section describes the manual procedure to open a new pull request.

          Please consider using ``eb --new-pr`` instead, see :ref:`github_new_pr`.

.. note:: We assume you are already located in your local working copy of
          the repository you want to contribute to (e.g., ``easybuild-framework``).

To open a pull request for your contribution, you must follow these steps:

i. :ref:`contributing_creating_pull_requests_branch`
ii. :ref:`contributing_creating_pull_requests_commit`
iii. :ref:`contributing_creating_pull_requests_push`
iv. :ref:`contributing_creating_pull_requests_open_pr`


.. _contributing_creating_pull_requests_branch:

Creating a new branch
+++++++++++++++++++++

First, create a new branch for your work. You can do this either before
or after making the changes that you would like to contribute, but we
recommend to create a new branch before making any changes.

Make sure you have the ``develop`` branch checked out before creating your branch:

.. code:: shell

  git checkout develop

To create a new branch, you should use ``git branch <branch_name>`` followed by
``git checkout <branch_name>``, or equivalently ``git checkout -b <branch_name>``.

For example, to create a new branch named ``mybranch``:

.. code:: shell

  git checkout -b mybranch

You can choose the branch name freely, but make it sufficiently descriptive --
your future self will thank you.


.. _contributing_creating_pull_requests_commit:

Committing your changes
+++++++++++++++++++++++

To 'save' your changes, you should create one or more *commits* in the branch
you created. We recommended making separate commits for different 'units of work'.

First, make sure you have checked out the branch were you want to commit the changes to.
For example, to prepare for committing changes to the ``mybranch`` branch:

.. code:: shell

  git checkout mybranch

To check which branch is currently checked out, use ``git branch``.

To get a high-level overview of the changes before committing them, you can use ``git status``.

To see the actual changes that were made, use ``git diff``.

To commit the changes you want to contribute, use ``git add <files>``
to *stage* the changes, followed by ``git commit -m "<message>"`` to create
the actual commit.

For example, to commit the changes that were made to ``easybuild/tools/filetools.py``:

.. code:: shell

  git add easybuild/tools/filetools.py
  git status  # check which files are staged for commit
  git commit -m "example commit message for changes to filetools.py"

.. note:: Please use a concise commit message that describes the changes you made.

.. note:: For files that are already being tracked, you can use ``git commit -am <message>``
          to commit all changes at once.

To verify that your work was committed, use ``git log`` to see all commits
on the current branch. Use ``git log --stat`` and/or ``git log --diff`` to see
more details about which changes are included in each of the commits.


.. _contributing_creating_pull_requests_push:

Pushing your branch
+++++++++++++++++++

Once you have committed your changes to a branch, you should *push* your
branch to your fork of the GitHub repository using ``git push``.

For example, to push the ``mybranch`` branch to your fork of the GitHub repository
(via the ``origin`` remote, see :ref:`contributing_pull_request_setup_working_copy`):

.. code:: shell

  git push origin mybranch

Note: this will make your work public.


.. _contributing_creating_pull_requests_open_pr:

Opening the pull request
++++++++++++++++++++++++

To open a pull request using the branch you pushed,
you should use the GitHub interface, and follow the steps outlined below.

.. note:: Replace '``EXAMPLE``' with your GitHub account name, and
          '``easybuild-framework``' with the name of the target EasyBuild repository.

i. visit https://github.com/EXAMPLE/easybuild-framework;
ii. switch to the branch that includes the changes you want to contribute
    using the '``Branch: master``' button on the left,
    for example by selecting ``Branch: mybranch`` from the dropdown list
iii. click the '``New pull request``' button;
iv. change the target branch to ``develop`` using the '``base: master``' button;
v. review your changes using the 'diff' view presented by GitHub;
vi. provide an appropriate title and description for your contribution;
vii. open the pull request by clicking the green '``Create pull request``' button

Next, your pull request will be reviewed & tested, see :ref:`contributing_review_process`.

.. _contributing_updating_pull_requests:

Updating existing pull requests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: This section describes the manual procedure to create a new pull request.

          Please consider using ``eb --update-pr`` instead, see :ref:`github_update_pr`.

It is quite common to update a pull request after creating it,
for example if Travis reports problems with the changes being made, or as a response
to someone reviewing your contribution.

To update an existing pull request, it suffices to add commits to the branch
that was used for opening the pull request, and pushing the updated branch to GitHub.

For example, to update the pull request that was created using the ``mybranch`` branch:

.. code:: shell

  git checkout mybranch
  # make changes...
  git add <paths to changed files>
  git commit -m "example commit message for additional changes"
  git push origin mybranch

Updating a pull request will trigger Travis to re-test your contribution,
and a notification will be sent out to whoever is 'watching' your pull request.


.. _contributing_merging_pull_requests:

Merging of pull requests
~~~~~~~~~~~~~~~~~~~~~~~~

Once your pull request has been given the green light by Travis and one or more
people reviewing have approved the changes, it can be merged into
the ``develop`` branch. **This can only be done by a member of the EasyBuild admin team.**

Merging a pull request usually implies that the changes will be part of the next EasyBuild release.


.. _contributing_review_process:

Review process for contributions
--------------------------------

Each contribution is thoroughly reviewed and tested before it gets merged in.
Some aspects of this are automated, others require human intervention.

**Only contributions that fulfill the requirements listed below are eligible to be merged**,
so it is important to be aware of all of the aspects of the review process.

* unit tests must still pass; see :ref:`contributing_review_process_travis`

  * more tests must be added when appropriate; see :ref:`contributing_review_process_adding_tests`

* backward compatibility should be retained; see :ref:`contributing_review_process_backward_compatibility`
* code style must be kept consistent; see :ref:`contributing_review_process_code_style`

  * easyconfigs should be kept consistent across versions & toolchains; see :ref:`contributing_review_process_review_pr`

* test reports must be submitted for easyconfig contributions; see :ref:`contributing_review_process_test_reports`


.. _contributing_review_process_travis:

Test suite (Travis)
~~~~~~~~~~~~~~~~~~~

Each pull request is tested automatically by Travis and the test result is reported in the pull request.

**Only pull requests that have been tested and approved by Travis are
eligible for being merged!**

Note that Travis will only run the *unit test suite* for that particular repository.
That is, for easyconfig contributions it does *not* include
actually building and installing software.

.. _contributing_review_process_adding_tests:

Adding tests
++++++++++++

An implicit requirement for contributions, in particular contributions to the EasyBuild framework,
is that they **must be accompanied by additional tests or test cases**.

For new features or enhancements, a dedicated test (case) must be added
which verifies that the feature implementation works as expected.

For bug fixes, a test (case) must be added that triggers the code path where the bug manifested,
and which verifies that the bug was indeed fixed.

Tests not only confirm that the implementation is correct, it also helps to ensure
that any future changes will not break the functionality you contributed.


.. _contributing_review_process_backward_compatibility:

Backward compatibility
~~~~~~~~~~~~~~~~~~~~~~

**Contributions should retain backward compatibility**, i.e., they should *not*
make any changes that alter the (default) functionality of the existing code base.
Of course, enhancements to existing code that retain backward compatibility can be made.

One exception to this rule is *bug fixes*, where the whole point is usually
to fix functionality that was implemented incorrectly.

This also applies to existing easyconfig files; for example, the versions
of dependencies should *not* be altered. Adding dependencies that were missing
or otherwise enhancing existing easyconfigs (e.g., adding extra extensions,
enabling additional features, etc.) are usually considered acceptable.

Changes that break backward compatibility have to be motivated
well with technical arguments, and must be approved by the EasyBuild maintainers.


.. _contributing_review_process_code_style:

Code style review
~~~~~~~~~~~~~~~~~

Next to functional evaluation of contributions, care is also taken to
maintain a consistent code style across the EasyBuild code base
(see also :ref:`code_style`);
**contributions must take the (mostly PEP8) code style into account.**

This aspect is sometimes considered to be needless overhead, yet it is an
important aspect of the review process. A consistent code style is invaluable
in a large code base that is constantly being updated by a worldwide community.

This also applies to easyconfig files, where we try to maintain a strict style
that mostly matches the established PEP8 coding style for Python (since
easyconfigs are written in Python syntax). However, also the grouping and
ordering of easyconfig parameters is a part of the 'code' style we maintain.

See :ref:`code_style_easyconfigs` for more information.


.. _contributing_review_process_review_pr:

Comparing with existing easyconfigs (``--review-pr``)
+++++++++++++++++++++++++++++++++++++++++++++++++++++

We try to maintain **consistency across easyconfig files** for a particular
software package, across multiple software versions, toolchains and variants
(with a different ``versionsuffix``).

Therefore, easyconfig contributions are also reviewed using ``eb --review-pr <PR #>``,
which compares the touched easyconfig files to those in the current
``develop`` branch that are most closely related.

The easyconfig files to compare with are selected based on similarity,
by combining two criteria, in order.

First, the software version is taken into account, using one of the following
criteria:

* exact match on software version match
* match on major/minor software version
* match on major software version
* no match on software version

This is combined with one of the criteria below (in order):

* matching versionsuffix and toolchain name/version
* matching versionsuffix and toolchain name (any toolchain version)
* matching versionsuffix (any toolchain name/version)
* matching toolchain name/version (any versionsuffix)
* matching toolchain name (any versionsuffix, toolchain version)
* no extra requirements (any versionsuffix, toolchain name/version)

The first combination of one of the software version criteria with one of
the other criteria that yields one or more matching easyconfig files is used.
If none of the combinations match, no easyconfig files for that particular software
package are available yet, and no comparison is made.

The output of ``--review-pr`` provides a 'multidiff' comparison, which highlights
the differences between the easyconfig file in the pull request and the most similar
selected ones from the current ``develop`` branch.

For example:

.. raw:: html

  <script type="text/javascript" src="https://asciinema.org/a/103889.js" id="asciicast-103889" async></script>

Interpreting this output is a quick and easy way to assess how different the
contributed easyconfig files are from the existing easyconfigs, although it
does require a bit of practice because of the density of the provided information.


.. _contributing_review_process_test_reports:

Test reports for easyconfig contributions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For easyconfig contributions, an accompanying **test report must be submitted** to confirm that the touched easyconfig files (still) work as expected.

We recommended that you submit a test report for your own easyconfig pull requests.
Other people can also submit test reports to confirm that your contribution works as expected on their system(s).

With EasyBuild being properly configured (see :ref:`github_configuration`), this should be as simple as running ``eb --from-pr <PR#> --upload-test-report --force --robot``.

See :ref:`github_upload_test_report` for more information.
