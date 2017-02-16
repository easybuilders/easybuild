.. _contributing_back:

Contributing back
=================

This documentation explains how you can contribute back to EasyBuild,
and discusses the review process for contributions.

.. contents::
    :depth: 3
    :backlinks: none

.. _contributing_back_how:

How to contribute back
----------------------

.. _contributing_back_feedback:

Giving feedback
~~~~~~~~~~~~~~~

.. _contributing_back_issues:

Opening issues
~~~~~~~~~~~~~~

* report problems
* feature requests
* change requests

.. _contributing_back_code:

Code contributions
~~~~~~~~~~~~~~~~~~


.. _contributing_back_docs:

Documentation
~~~~~~~~~~~~~


.. _contributing_back_pull_requests:

Pull requests
-------------

To contribute back to the EasyBuild framework, easyblocks, easyconfig files
or the EasyBuild documentation, you will need to open a pull request to the
corresponding GitHub repository:

* EasyBuild framework: https://github.com/hpcugent/easybuild-framework
* easyblocks: https://github.com/hpcugent/easybuild-easyblocks
* easyconfigs: https://github.com/hpcugent/easybuild-easyconfigs
* documentation: https://github.com/hpcugent/easybuild (see ```docs`` subdirectory)

Doing this the traditional way requires some knowledge about using ``git``
(i.e. creating commits, using branches, pushing to and pulling from remote
Git repositories, etc.), and being familiar with GitHub.

However, this can be largely circumvented by using the GitHub integration
provided by the EasyBuild command line interface, see :ref:`integration_with_github`.


.. _contributing_back_pull_request_setup:

Setting up
~~~~~~~~~~

.. note:: These instructions assume that you already have a working GitHub account.
          If you don't have a GitHub account yet, visit https://github.com/ to create one.

          Make sure you have registered your SSH public key in your GitHub account,
          via https://github.com/settings/keys.

Before you can open pull requests, you will need to *fork* the GitHub repository
you are targeting, and create a local *working copy* of that repository. This only
needs to be done *once* for every of the EasyBuild repositories.

.. note:: For the purpose of this guide, we will be using the ``easybuild-framework`` repository;
          however, the instructions are analogous for the other EasyBuild repositories.

.. _contributing_back_pull_request_setup_fork_repo:

Forking the repository
++++++++++++++++++++++

First, create your own *fork* of the repository in your GitHub account, using the
``Fork`` button on the top right at https://github.com/hpcugent/easybuild-framework.

This will basically create a 'copy' of the ``easybuild-framework`` repository
owned by the ``hpcugent`` GitHub organisation to your own personal GitHub account.
You will have to use this as a staging area for your work,
to prepare your contribution before creating the actual pull request.

.. _contributing_back_pull_request_setup_working_copy:

Creating a working copy
+++++++++++++++++++++++

In addition to forking the repository on GitHub, you also need to create
a local *working copy* of the repository. This is basically a local checkout
of the repository where you can track the changes you are making.

First, *clone* the repository:

.. code:: shell

  git clone git@github.com:hpcugent/easybuild-framework.git

If that worked as expected, you should have a new directory named ``easybuild-framework``.
Move into the ``easybuild-framework`` directory:

.. code:: shell

  cd easybuild-framework

Then, add your own fork as a '*remote*' repository:

.. code:: shell

  git remote add myfork git@github.com:example/easybuild-framework.git

.. note:: Do not forget to *replace* '``example``' with the your GitHub account name.

          '``myfork``' is just a name that you give to the remote for your
          fork of the repository on GitHub; you can modify this to your liking
          if desired (but do take that into account for the further instructions).

          For the central repository, a default remote named ``origin`` should
          have been created via ``git clone`` (see also the output of ``git remote -v``).

Finally, it is recommended to also check out the ``develop`` branch:

.. code:: shell

  git checkout -b develop origin/develop

With this in place, you are all set to open pull requests for your contributions.

.. _contributing_back_creating_pull_requests:

Opening a new pull request
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: This section describes the manual procedure to open a new pull
          request; please consider using ``eb --new-pr`` instead, see
          :ref:`github_new_pr`.

i. create a new branch in your


.. _contributing_back_updating_pull_requests:

Updating existing pull requests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: This section describes the manual procedure to create a new pull
          request; please consider using ``eb --update-pr`` instead, see
          :ref:`github_update_pr`.

.. _contributing_back_review_process:

Review process for contributions
--------------------------------

* comparison with existing easyconfigs via ``--review-pr``
* style review
* test suite run by Travis
* test reports
