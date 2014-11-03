

Understanding EasyBuild logs
=============================

EasyBuild thoroughly keeps track of the executed build and install procedures.
This page details some of the specifics, to help you making sense of them.


Basic information
-----------------

During an invocation of the ``eb`` command, a temporary log file is provided.
This log can be consulted in case any problems occur during the process.
Right before completing successfully, EasyBuild will clean up this temporary log file.

A separate log file is created for each build and install procedure that is performed.
After each successful installation, this application log file is copied to the install
directory for future reference.

By default, the application log file is copied to a subdirectory of the installation
prefix named ``easybuild``, and has a filename like
``easybuild-HPL-2.0-20141103.104412.log`` for example, which corresponds to the filename
template ``easybuild-%(name)s-%(version)s-%(date)s.%(time)s.log``.
This aspect can be tweaked via the ``--logfile-format`` configuration option.

Example::

  $ eb HPL-2.0-goolf-1.4.10.eb
  == temporary log file in case of crash /tmp/easybuild-rHHgBu/easybuild-XD0Ae_.log
  [...]
  == building and installing HPL/2.0-goolf-1.4.10...
  [...]
  == COMPLETED: Installation ended successfully
  == Results of the build can be found in the log file /home/example/.local/easybuild/software/HPL/2.0-goolf-1.4.10/easybuild/easybuild-HPL-2.0-20141103.104412.log
  == Build succeeded for 1 out of 1
  == temporary log file /tmp/easybuild-rHHgBu/easybuild-XD0Ae_.log has been removed.
  == temporary directory /tmp/easybuild-rHHgBu has been removed.


.. note:: Enabling debug mode using the ``--debug`` or ``-d`` command line option
ensures that all details of the executed build and installation procedure are included
in the log file, but will also result is significantly bigger and more verbose logs.

.. tip:: Always include a reference to a log file (even if partial) when reporting
a potential bug in EasyBuild. A particularly useful way of doing so is by creating
a Gist (https://gist.github.com/), and sharing the corresponding URL. This is much
better than sending a lengthy log file via email, since it can be easily shared across
different communication channels (mailing list, IRC, IM, etc.).


Navigating log files
--------------------

Extracting the information you're interested in from an EasyBuild log file
may be a daunting task, especially for debug logs. The information and guidelines
in this section should make navigating logs less scary.

Log message format
~~~~~~~~~~~~~~~~~~


Each log message as emitted by EasyBuild follows a well-defined format.
Example::

  == 2014-11-03 13:34:31,906 main.EB_HPL INFO This is EasyBuild 1.15.2 (framework: 1.15.2, easyblocks: 1.15.2) on host example.

Each log line consists of the following parts:

 * a prefix label ``== ``, which is useful to discriminate between EasyBuild log messages and the output of executed shell commands;
 * date and time information (e.g., ``2014-11-03 13:34:31,906``);
 * the Python module/class/function that is responsible for the log message (e.g., ``main.EB_HPL``);
 * the log level (e.g., ``INFO``);
 * and a string with the actual log message at the end

Useful handles in log files
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Next to looking for a particular search pattern (e.g., ``[Ee]rror``),
there are a couple of handles that can be used to jump around in log files:

Step markers
^^^^^^^^^^^^

For each step performed in the build and installation process, corresponding log messages is emitted. For example::

  == 2014-11-03 13:34:48,816 main.EB_HPL INFO configuring...
  == 2014-11-03 13:34:48,817 main.EB_HPL INFO Starting configure step
  [...]
  == 2014-11-03 13:34:48,823 main.EB_HPL INFO Running method configure_step part of step configure


This allows you to navigate a log file step by step, for example using the ``_step`` search pattern.


Executed shell commands
^^^^^^^^^^^^^^^^^^^^^^^

For each executed shell command, log messages are included with the full command line,
the location where the command was executed and the command's output and exit code.
For example::

  == 2014-11-03 13:34:48,823 main.run DEBUG run_cmd: running cmd /bin/bash make_generic (in /tmp/user/easybuild_build/HPL/2.0/goolf-1.4.10/hpl-2.0/setup)
  == 2014-11-03 13:34:48,823 main.run DEBUG run_cmd: Command output will be logged to /tmp/easybuild-W85p4r/easybuild-run_cmd-XoJwMY.log
  == 2014-11-03 13:34:48,849 main.run INFO cmd "/bin/bash make_generic" exited with exitcode 0 and output:

If you are primarily interested in the different commands as they were executed by EasyBuild,
you can use ``INFO cmd`` (or ``run_cmd``, in debug logs) as a search pattern.

.. note:: Next to the configure/build/install commands, EasyBuild also runs
  a couple of other commands to obtain system information, or to query the modules tool.
  Typically, a single invocation of ``eb`` involves executing a dozen or so different shell commands, minimally.


