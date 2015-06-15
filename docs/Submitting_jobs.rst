.. _submitting_jobs:

Submitting jobs using ``--job``
===============================

Topics:

* :ref:`submitting_jobs_quick_intro`
* :ref:`submitting_jobs_configuration`
* :ref:`submitting_jobs_usage`


.. _submitting_jobs_quick_intro:

Quick introduction to ``--job``
-------------------------------

Using the ``--job`` command line option, you can instruct EasyBuild to submit jobs for the installations that should
be performed, rather than performing the installations locally on the system you are on.

If dependency resolution is enabled using ``--robot`` (see also :ref:`use_robot`), EasyBuild will submit separate
jobs and set dependencies between them to ensure they are run in the order dictated by the dependency graph(s).

See :ref:`submitting_jobs_usage` for more details.


.. _submitting_jobs_configuration:

Configuring ``--job``
---------------------


Required settings for ``--job``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. _submitting_jobs_cfg_job_backend:

Selecting the job backend (``--job-backend``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The job backend must be selected using the ``--job-backend`` EasyBuild configuration option.

Since EasyBuild 2.2.0, two backends are supported:

.. FIXME version requirements
* ``pbs_python`` *(default)*
    * https://oss.trac.surfsara.nl/pbs_python
    * **note**: requires PBS/Torque resource manager
* ``GC3Pie`` *(recommended)*
    * https://gc3pie.readthedocs.org
    * works with different resource managers and job schedulers, e.g. PBS, SLURM, etc.

For historical reasons, ``pbs_python`` is still the default job backend in EasyBuild v2.x.


.. _submitting_jobs_cfg_job_backend_config:

Configuring the job backend (``--job-backend-config``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To configure the job backend, the path to a configuration file must be specified via the ``--job-backend-config``
EasyBuild configuration option.

* ``pbs_python``: *(irrelevant, no configuration file required)*
* ``GC3Pie``: see https://gc3pie.readthedocs.org/en/latest/users/configuration.html


Other configuration options relevant to ``--job``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. _submitting_jobs_cfg_max_job_walltime:

Maximum walltime of jobs (``--job-max-walltime``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

An integer value specifying the maximum walltime for jobs (in hours) can be specified via ``--job-max-walltime``
(default: 24).

.. FIXME check this?
For builds for which a reference required walltime is available via the ``build_stats`` parameter in an available
easyconfig file for the same software pacakage, EasyBuild will set the walltime of the job to the double of that.

If no reference walltime is available, the maximum walltime will be used.


.. _submitting_jobs_cfg_job_output_dir:

Job output directory (``--job-output-dir``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The directory where job log files should be placed can be specified via ``--job-output-dir``
(default: current directory).


.. _submitting_jobs_cfg_job_polling_interval:

Job polling interval (``--job-polling-interval``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The frequency with which the status of submitted jobs should be checked can be specified via ``--job-polling-interval``,
using a floating-point value representing the number of seconds between two checks (default: 30s).

.. note:: This setting is currently only relevant to GC3Pie.


.. _submitting_jobs_cfg_job_target_resource:

Target resource for job backend (``--job-target-resource``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The target resource that should be used by the job backend can be specified using ``--job-target-resource``.

* ``pbs_python``: hostname of Torque PBS server to submit jobs to (default: ``$PBS_DEFAULT``)
* ``GC3Pie``: name of resource to submit jobs to (default: round-robin across available resources)


.. _submitting_jobs_usage:

Usage of ``--job``
------------------
