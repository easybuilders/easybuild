.. _unit_tests:

Unit tests
==========

Since EasyBuild v1.0, an extensive suite of unit tests has been implemented. The unit tests have become an indispensable
factor in keeping EasyBuild stable and backward-compatible during development.

We refer to the available tests as unit tests, even though they may not be *unit* tests in the strict sense of the word.
Some tests are actually end-to-end tests or integration tests, see also
http://en.wikipedia.org/wiki/Software_testing#Testing_levels.

Following the test-driven development paradigm, additional unit tests are implemented when new features are added or
when bugs are uncovered (and fixed).

What the unit tests are *not*
-----------------------------

Each of the EasyBuild unit tests aim to test a specific characteristic of EasyBuild, e.g., a configuration option, a
particular function or method in the EasyBuild framework, some specific feature, how EasyBuild handles a particular
type of input, etc.

The unit tests do *not* test the build and installation process of particular supported software packages (other than
a handful of toy ones included in the tests themselves), let alone test the software installations obtained using
EasyBuild themselves.

Each stable EasyBuild release is subjected to a (time- and resource-consuming) *regression test*, however,
which is out of scope here.

Available unit test suites
--------------------------

Three different unit test suites are available for EasyBuild, each of which tied to one of the EasyBuild code
repositories on GitHub: *EasyBuild framework*, *easyblocks*, *easyconfigs*.

EasyBuild framework unit tests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The unit test suite for the EasyBuild framework is by far the most extensive one, in terms of code size, coverage and
the amount of effort that is put into it.

These tests probe the functionality provided by the EasyBuild framework, ranging from standard operation (building and
installing software, and generating module files) to specific configuration options, selected functional aspects,
optional features and edge cases.

At the time of writing (EasyBuild v2.0), more than 250 tests were implemented, organised in 28 subgroups.

Running the full EasyBuild framework unit test suite takes about 15-40 minutes, depending on your system resources and
testing configuration (see for example https://jenkins1.ugent.be/view/EasyBuild/).

easyblocks unit tests
~~~~~~~~~~~~~~~~~~~~~

The easyblocks unit test suite consists of a coupe of light-weight tests that are run per easyblock:

* initialising the easyblock, to check for Python syntax errors and faulty imports
* checking for the use of deprecated (or no longer supported) functionality

Running the full easyblocks unit test suite takes less than one minute.

easyconfigs unit tests
~~~~~~~~~~~~~~~~~~~~~~

The easyconfigs unit test suite consists a couple of tests for each of the available easyconfig files, followed by two
large-scale overall tests.

For each of the available easyconfig files, the following aspects are tested:

* parsing the easyconfig file, to make sure no syntax errors are present
* verifying that the filename matches the contents of the easyconfig file (software name/version, version suffix and
  toolchain name/version)
* creating an ``EasyBlock`` instance using the parsed easyconfig, to check whether mandatory easyconfig parameters
  are defined
* ensuring that all required patch files are available (right next to the easyconfig file)
* making sure that the specified sanity check paths adher to the requirements, i.e. only (and both) the ``files``/``dirs``
  keys are listed, with the value for either one being non-empty
* checking for the use of deprecated (or no longer supported) functionality

If these tests pass for each and every available easyconfig file, two additional overall tests are run, i.e.:

* ensuring that an easyconfig file is available for each specified dependency
* checking whether any version conflicts occur in the dependency graph for each easyconfig file

Running the full easyconfigs unit test suite should only take a couple of minutes.


Applications
------------

The unit test suites are automatically triggered by `Jenkins <https://jenkins1.ugent.be>`_ for:

* each pull request (update), see https://jenkins1.ugent.be/view/pull-request-builder/
* each (set of) change(s) that is merged in (usually via a pull request)

The status of the different unit test suites is tracked separately for the ``master`` and ``develop`` branches
of the EasyBuild code repositories:

* ``master`` (stable, latest EasyBuild release): https://jenkins1.ugent.be/view/EasyBuild/
* ``develop`` (development, potentially unstable): https://jenkins1.ugent.be/view/EasyBuild%20(develop)/

We strictly adher to the policy of only merging pull requests for which the corresponding (latest) run of the *full* unit
test suite passes successfully.


Usage
-----

Using the unit tests is deliberately kept very simple.

Configuration
~~~~~~~~~~~~~

Since EasyBuild v2.0, the unit test suites are fully isolated from any (system- or user-level)
EasyBuild configuration which is in place in the environment where the tests are being run.

The easyblocks and easyconfigs unit test suite are oblivious to any defined configuration options.

For the EasyBuild framework unit tests, all configuration files and ``EASYBUILD_``-prefixed environment variables
are ignored (see also :ref:`configuration_types:`).

To enable running the EasyBuild framework unit test suite under a specific configuration that differs from
the default, environment variables can be defined for each of the configuration options supported by EasyBuild.

Before starting a set of EasyBuild framework tests, all defined environment variables for which the name is prefixed by
``TEST_EASYBUILD_`` will be injected into the test environment as environment variables prefixed with ``EASYBUILD_``
instead. Thus, to set a particular configuration option ``--foo``, you should define the environment variable
``$TEST_EASYBUILD_FOO``.

.. _unit_tests_modules_tool:

Modules tool to use for running tests
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

One particular configuration option worth mentioning explicitely is the modules tool that is to be used by the EasyBuild
framework, which is by default the traditional Tcl/C environment modules, referred to as ``EnvironmentModulesC`` in
EasyBuild configuration terms (see ``eb --help`` and ``eb --avail-modules-tools``).

To run the EasyBuild framework unit tests with a particular modules tool, simply define the
``$TEST_EASYBUILD_MODULES_TOOL`` environment variable with the corresponding value. For example::

  export TEST_EASYBUILD_MODULES_TOOL=Lmod

Just like for EasyBuild itself, the EasyBuild framework unit test suite expects that the modules tool binary/script
(``modulecmd``, ``modulecmd.tcl`` or ``lmod``) is available via ``$PATH``, see :ref:`required_modules_tool`.

Installing a GitHub token for the unit tests
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Some of the EasyBuild framework unit tests require that a GitHub token is in place for the ``easybuild_test`` user,
in a non-encrypted keyring (so it can be obtained without having to provide a password).

This can be done as follows (copy-paste the GitHub token at the ``Password:`` prompt)::

    $ python
    >>> import getpass, keyring
    >>> keyring.set_keyring(keyring.backends.file.PlaintextKeyring())
    >>> keyring.set_password('github_token', 'easybuild_test', getpass.getpass())
    Password:
    >>> exit()

More details about obtaining and installing a GitHub token in your keyring are available at
https://github.com/hpcugent/easybuild/wiki/Review-process-for-contributions#setting-things-up.

Running
~~~~~~~

To run a full unit test suite, simply run the respective ``suite`` Python module.

* EasyBuild framework: ``python -m test.framework.suite``
* easyblocks: ``python -m test.easyblocks.suite``
* easyconfigs: ``python -m test.easyconfigs.suite``

For the EasyBuild framework unit tests, each of the test subgroups can be run separately via a dedicated Python module
other than ``suite``, to focus on testing a particular aspect. See
https://github.com/hpcugent/easybuild-framework/tree/master/test/framework for an overview of the available Python
modules corresponding to subgroups of tests (note: ``__init__.py`` and ``utilities.py`` are *not* such modules).

For example, to run the full EasyBuild framework unit test suite using Lmod as a modules tool::

    $ export TEST_EASYBUILD_MODULES_TOOL=Lmod
    $ python -m test.framework.suite

To only run the subgroup of tests for ``filetools``::

    $ python -m test.framework.filetools

Since EasyBuild v2.8.2, tests can be *filtered* by name. Simply add the string to filter with to the test command.

For example, to run only the tests containing the word ``load`` in the subgroup ``modules``, run::

    $ python -m test.framework.modules load

    Filtered ModulesTest tests using 'load', retained 2/19 tests: test_load, test_load_in_hierarchy
    ..
    ----------------------------------------------------------------------
    Ran 2 tests in 2.688s

    OK


This works with as many filter words as you want to use. For example, to run every test method in ``modules``
containing the words ``load`` or ``bash``: ::

    $ python -m test.framework.modules load bash



Results
~~~~~~~

The test results will be printed as the unit test suite progresses, potentially producing a lot of information for
failing tests to help determine the cause of the failure. It may thus be useful to capture the output for later inspection,
for example::

    python -m test.framework.suite 2>&1 | tee eb_test.log


.. note::
    Some tests will be skipped deliberately, because of missing optional dependencies or other provisions, for example
    a GitHub token. The output of the unit tests will clearly indicate which tests were skipped.

Examples
^^^^^^^^

A successful run of the EasyBuild framework test suite, without skipped tests::

    $ python -m test.framework.suite
    Running tests...
    ----------------------------------------------------------------------
    ..........................................................................................................................................................................................................................................................
    ----------------------------------------------------------------------
    Ran 250 tests in 1404.897s

    OK

A run with a couple of deliberately skipped tests and a single failed test (denoted by ``F``), along with the
corresponding traceback::

    $ python -m test.framework.suite
    Running tests...
    ----------------------------------------------------------------------
    ................Skipping test_from_pr, no GitHub token available?
    .Skipping test_from_pr, no GitHub token available?
    ......F..............(skipping GitRepository test)
    ..(skipping SvnRepository test)
    ..................................................................................................................Skipping test_fetch_easyconfigs_from_pr, no GitHub token available?
    .Skipping test_read, no GitHub token available?
    .Skipping test_read_api, no GitHub token available?
    .Skipping test_walk, no GitHub token available?
    .............................................................................................
    ======================================================================
    FAIL: Test listing easyblock hierarchy.
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "/tmp/example/easybuild-framework/test/framework/options.py", line 544, in test_list_easyblocks
        self.assertTrue(re.search(pat, outtxt), "Pattern '%s' is found in output of --list-easyblocks: %s" % (pat, outtxt))
    AssertionError: Pattern 'EasyBlock\n' is found in output of --list-easyblocks:

    ----------------------------------------------------------------------
    Ran 250 tests in 2641.200s

    FAILED (failures=1)
    ERROR: Not all tests were successful.
    Log available at /tmp/example/easybuild-dy2ZTx/easybuild-tests-l0doQ2.log
