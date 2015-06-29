.. _submitting_jobs:

Submitting jobs using ``--job``
===============================

Topics:

* :ref:`submitting_jobs_quick_intro`
* :ref:`submitting_jobs_configuration`
* :ref:`submitting_jobs_usage`
* :ref:`submitting_jobs_examples`


.. _submitting_jobs_quick_intro:

Quick introduction to ``--job``
-------------------------------

Using the ``--job`` command line option, you can instruct EasyBuild to submit jobs for the installations that should
be performed, rather than performing the installations locally on the system you are on.

If dependency resolution is enabled using ``--robot`` (see also :ref:`use_robot`), EasyBuild will submit separate
jobs and set dependencies between them to ensure they are run in the order dictated by the software dependency graph(s).

See :ref:`submitting_jobs_usage` for more details.


.. _submitting_jobs_configuration:

Configuring ``--job``
---------------------


.. _submitting_jobs_cfg_required:

Required configuration settings for ``--job``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. _submitting_jobs_cfg_job_backend:

Selecting the job backend (``--job-backend``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The job backend must be selected via the ``--job-backend`` EasyBuild configuration option.

Since EasyBuild 2.2.0, two backends are supported:

* ``PbsPython`` *(default)*

  * ``pbs_python`` version 4.1.0 (or more recent) required (see https://oss.trac.surfsara.nl/pbs_python)
  * **note**: requires TORQUE resource manager (see http://www.adaptivecomputing.com/products/open-source/torque/)

* ``GC3Pie`` *(recommended)*

  * ``GC3Pie`` version 2.3.0 (or more recent) required (https://gc3pie.readthedocs.org)
  * works with different resource managers and job schedulers, including TORQUE, SLURM, etc.
  * **note**: requires that a GC3Pie configuration file is provided, see :ref:`submitting_jobs_cfg_job_backend_config`

For historical reasons, ``PbsPython`` is still the default job backend in EasyBuild version 2.x.


.. _submitting_jobs_cfg_optional:

Optional configuration settings for ``--job``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section covers the configuration settings that are related to ``--job``. Most of these are optional, depending
on which job backend is being used, and the job backend configuration (if any).


.. _submitting_jobs_cfg_job_backend_config:

Configuring the job backend (``--job-backend-config``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To configure the job backend, the path to a configuration file must be specified via the ``--job-backend-config``
EasyBuild configuration option.

* for ``PbsPython`` backend: *(irrelevant, no configuration file required)*
* for ``GC3Pie`` backend: see https://gc3pie.readthedocs.org/en/latest/users/configuration.html

  * example configuration files are available at :ref:`submitting_jobs_examples_gc3pie_cfg`



.. _submitting_jobs_cfg_job_cores:

Number of requested cores per job (``--job-cores``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``--job-cores`` can be used to indicate the number of cores that should be requested for each job that is submitted.

The mechanism for determining the number of cores to request in case ``--job-cores`` was *not* specified depends on
which job backend is being used:

* when the ``PbsPython`` job backend is used, the (most common) number of available cores per workernode in the
  target resource is determined; this usually results in jobs requesting full workernodes (at least in terms of cores)
* when the ``GC3Pie`` job backend is used, the requested number of cores is left unspecified, which results in falling
  back to the default mechanism used by GC3Pie to pick a number of cores; most likely, this results in single-core
  jobs to be submitted (unless ``--job-cores`` is used)


.. _submitting_jobs_cfg_job_max_walltime:

Maximum walltime of jobs (``--job-max-walltime``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

An integer value specifying the maximum walltime for jobs (in hours) can be specified via ``--job-max-walltime``
(default: 24).

For easyconfigs for which a reference required walltime is available via the ``build_stats`` parameter in a matching
easyconfig file from the easyconfig repository (see :ref:`easyconfigs_repo`), EasyBuild will set the walltime of the
corresponding job to twice that value (unless the resulting value is higher than the maximum walltime for jobs).

If no such reference walltime is available, the maximum walltime is used.


.. _submitting_jobs_cfg_job_output_dir:

Job output directory (``--job-output-dir``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The directory where job log files should be placed can be specified via ``--job-output-dir``
(default: current directory).


.. _submitting_jobs_cfg_job_polling_interval:

Job polling interval (``--job-polling-interval``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The frequency with which the status of submitted jobs should be checked can be specified via ``--job-polling-interval``,
using a floating-point value representing the number of seconds between two checks (default: 30 seconds).

.. note:: This setting is currently only relevant to GC3Pie; see also :ref:`submitting_jobs_usage_gc3pie`.


.. _submitting_jobs_cfg_job_target_resource:

Target resource for job backend (``--job-target-resource``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The target resource that should be used by the job backend can be specified using ``--job-target-resource``.

* for ``PbsPython`` backend: hostname of TORQUE PBS server to submit jobs to (default: ``$PBS_DEFAULT``)
* for ``GC3Pie`` backend: name of resource to submit jobs to (default: none, which implies weighted round-robin
                          submission across all available resources)


.. _submitting_jobs_usage:

Usage of ``--job``
------------------

To make EasyBuild submit jobs to the job backend rather than performing the installations directly, the ``--job``
command line option can be used.

This following assumes that the required configuration settings w.r.t. the job backend to use are in place, see
:ref:`submitting_jobs_configuration`.


.. _submitting_jobs_usage_pbs_python:

Submitting jobs to a ``PbsPython`` backend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When using the ``PbsPython`` backend, EasyBuild will submit separate jobs for each installation to be performed to
TORQUE, and then exit reporting a list of submitted jobs.

To ensure that the installations are performed in the order dictated by the software dependency graph, dependencies
between installations are specified via *job dependencies*, more specifically using the ``afterany``
dependency relation (see http://docs.adaptivecomputing.com/mwm/Content/topics/jobAdministration/jobdependencies.html
for more information).

See also :ref:`submitting_jobs_examples_pbs_python_backend`.

.. note:: Submitted jobs will be put on hold until all jobs have been submitted. This is required to ensure that the
          dependencies between jobs can be specified correctly; if a job would run to completion before other jobs that
          depend on it were submitted, the submission process would fail.


.. _submitting_jobs_usage_gc3pie:

Submitting jobs to a ``GC3Pie`` backend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When using the ``GC3Pie`` backend, EasyBuild will create separate tasks for each installation to be performed and
supply them to GC3Pie, which will then take over and pass the installations through as jobs to the available
resource(s) (see also :ref:`submitting_jobs_cfg_job_backend_config`).

To ensure that the installations are performed in the order dictated by the software dependency graph, dependencies
between installations are specified to GC3Pie as inter-task dependencies. GC3Pie will then gradually feed the
installations to its available resources as their dependencies have been satisfied.

Any log messages produced by GC3Pie are included in the EasyBuild log file, and are tagged with ``gc3pie``.

See also :ref:`submitting_jobs_examples_gc3pie_backend`.

.. note:: The ``eb`` process will not exit until the full set of tasks that GC3Pie was provided with has been processed.
          An overall progress report will be printed regularly (see also :ref:`submitting_jobs_cfg_job_polling_interval`).
          As such, it is advised to run the ``eb`` process in a screen/tmux session when using the GC3Pie backend for
          ``--job``.


.. _submitting_jobs_examples:

Examples
--------

.. _submitting_jobs_examples_gc3pie_cfg:

Example configurations for GC3Pie job backend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When using GC3Pie as a job backend, a configuration file must be provided via ``--job-backend-config``.
This section includes a couple of examples of GC3Pie configuration files (see also
https://gc3pie.readthedocs.org/en/latest/users/configuration.html).

Example GC3Pie configuraton for local system
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: ini

  [resource/localhost]
  enabled = yes
  type = shellcmd
  frontend = localhost
  transport = local
  max_cores_per_job = 1
  max_memory_per_core = 10GiB
  max_walltime = 100 hours
  # this doubles as "maximum concurrent jobs"
  max_cores = 4
  architecture = x86_64
  auth = none
  override = no
  resourcedir = /tmp/gc3pie


Example GC3Pie configuration for PBS/TORQUE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. FIXME

.. code:: ini

  # this is only needed if connecting through SSH to the cluster
  # frontend; otherwise you can remove this [auth/*] section, and just
  # use 'auth=none' in the resource definition
  [auth/myuser]
  #type = ssh
  #username = me
  
  [resource/pbs]
  enabled = yes
  type = pbs

  # use settings below when running GC3Pie on the cluster front-end node
  frontend = localhost
  transport = local
  auth = none
  # use settings below when connecting through SSH to the cluster
  #frontend=hostname.fqdn
  #transport=ssh
  #auth=myuser

  max_walltime = 2 days
  # maximum number of submitted jobs = max_cores / max_cores_per_job
  max_cores_per_job = 16
  max_cores = 1024
  max_memory_per_core = 2 GiB
  architecture = x86_64

  # to add non-std options or use PBS/TORQUE tools located outside of
  # the default PATH, use the following:
  #qsub = /usr/local/bin/qsub -q my-special-queue


Example GC3Pie configuration for SLURM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. FIXME

.. code:: ini

  # this is only needed if connecting through SSH to the cluster
  # frontend; otherwise you can remove this [auth/*] section, and just
  # use 'auth=none' in the resource definition
  [auth/myuser]
  #type = ssh
  #username = me
  
  [resource/slurm]
  enabled = yes
  type = slurm

  # use settings below when running GC3Pie on the cluster front-end node
  frontend = localhost
  transport = local
  auth = none
  # use settings below when connecting through SSH to the cluster
  #frontend=hostname.fqdn
  #transport=ssh
  #auth=myuser

  max_walltime = 2 days
  # maximum number of submitted jobs = max_cores / max_cores_per_job
  max_cores_per_job = 16
  max_cores = 1024
  max_memory_per_core = 2 GiB
  architecture = x86_64

  # to add non-std options or use SLURM tools located outside of
  # the default PATH, use the following:
  #sbatch = /usr/bin/sbatch --mail-type=ALL


.. _submitting_jobs_examples_gc3pie_backend:

Example: submitting installations to SLURM via GC3Pie
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. FIXME GC3Pie hangs?

.. code::

  $ eb GCC-4.6.0.eb OpenMPI-1.8.4-GCC-4.9.2.eb -df --job
  == temporary log file in case of crash /tmp/hoste/eb-jimvmK/easybuild-tQGWUY.log
  == GC3Pie job overview: 2 total, 2 new
  == GC3Pie job overview: 2 total, 2 new
  == GC3Pie job overview: 2 total, 2 new
  == GC3Pie job overview: 2 total, 2 new
  == GC3Pie job overview: 2 total, 2 new

.. _submitting_jobs_examples_pbs_python_backend:

Example: submitting installations to TORQUE via pbs_python
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. FIXME no list of submitted jobs printed?

.. code::

  $ export EASYBUILD_JOB_BACKEND=PbsPython

  $ eb OpenMPI-1.8.4-GCC-4.9.2.eb -f --robot --job
  == temporary log file in case of crash /tmp/eb-sq24MP/easybuild-BmTY9v.log
  == resolving dependencies ...
  == Submitted parallel build jobs, exiting now: 4 jobs required for build.
  == temporary log file(s) /tmp/eb-sq24MP/easybuild-BmTY9v.log* have been removed.
  == temporary directory /tmp/eb-sq24MP has been removed.

  $ qstat -a

  example.pbs.server:
                                                                                    Req'd       Req'd       Elap
  Job ID                  Username    Queue    Jobname          SessID  NDS   TSK   Memory      Time    S   Time
  ----------------------- ----------- -------- ---------------- ------ ----- ------ --------- --------- - ---------
  1602195.example.pbs.se  example    long     GCC-4.9.2           --      1     16       --   24:00:00 Q       -- 
  1602196.example.pbs.se  example    long     numactl-2.0.10-G    --      1     16       --   24:00:00 H       -- 
  1602197.example.pbs.se  example    long     hwloc-1.10.0-GCC    --      1     16       --   24:00:00 H       -- 
  1602198.example.pbs.se  example    long     OpenMPI-1.8.4-GC    --      1     16       --   24:00:00 H       -- 
