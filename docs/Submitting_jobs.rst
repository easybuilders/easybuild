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


.. _submitting_jobs_configuration:

Configuring ``--job``
---------------------

Selecting the job backend (``--job-backend``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The job backend to be used can be specified using the ``--job-backend`` EasyBuild configuration option.

Since EasyBuild 3.8.0, three backends are supported:

* ``GC3Pie`` *(default)* (supported since EasyBuild 2.2.0)

  * ``GC3Pie`` version 2.5.0 (or more recent) required (https://gc3pie.readthedocs.org)
  * works with different resource managers and job schedulers, including TORQUE/PBS, Slurm, etc.
  * **note**: requires that a GC3Pie configuration file is provided, see :ref:`submitting_jobs_cfg_job_backend_config`

* ``PbsPython``

  * ``pbs_python`` version 4.1.0 (or more recent) required (see https://oss.trac.surfsara.nl/pbs_python)
  * **note**: requires TORQUE resource manager (see http://www.adaptivecomputing.com/products/open-source/torque/)

* ``Slurm`` (supported since EasyBuild 3.8.0)

  * requires Slurm version 17.0 (or more recent), see https://slurm.schedmd.com/


.. _submitting_jobs_cfg_job_backend_config:

Configuring the job backend (``--job-backend-config``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To configure the job backend, the path to a configuration file must be specified via ``--job-backend-config``.

* for ``PbsPython`` backend: *(irrelevant, no configuration file required)*
* for ``GC3Pie`` backend: see https://gc3pie.readthedocs.org/en/latest/users/configuration.html

  * example configuration files are available at :ref:`submitting_jobs_examples_gc3pie_cfg`

* for ``Slurm`` backend: *(irrelevant, no configuration file required)*



.. _submitting_jobs_cfg_job_cores:

Number of requested cores per job (``--job-cores``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The number of cores that should be requested for each job that is submitted can be specified using ``--job-cores``
(default: *not specified*).

The mechanism for determining the number of cores to request in case ``--job-cores`` was *not* specified depends on
which job backend is being used:

* if the ``PbsPython`` job backend is used, the (most common) number of available cores per workernode in the
  target resource is determined; this usually results in jobs requesting full workernodes (at least in terms of cores)
  by default
* if the ``GC3Pie`` or ``Slurm`` job backend is used, the requested number of cores is left unspecified,
  which results in falling back to the default mechanism used by GC3Pie/Slurm to pick a number of cores;
  most likely, this results in single-core jobs to be submitted by default


.. _submitting_jobs_job_dependency_type:

Job dependency type (``-job-deps-type``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The type of dependency that is set by EasyBuild when submitting a job that depends on one or more other jobs
can be specified via the ``--job-deps-type`` configuration setting:

* with ``--job-deps-type=abort_on_error``, job dependencies will be set such that a job that depends on other jobs
  will be *aborted* if one of those jobs completes with an error

  * for both ``PbsPython`` and ``Slurm``, this is equivalent with setting job dependencies using ``afterok``

* with ``--job-deps-type=always_run``, job dependencies will be set such that a job that depends on other jobs are
  *always run*, regardless of whether or not those jobs completed successfully

  * for both ``PbsPython`` and ``Slurm``, this is equivalent with setting job dependencies using ``afterany``

The default value for ``-job-deps-type`` depends on the job backend being used
(see :ref:`submitting_jobs_cfg_job_backend_config`):

* for the ``GC3Pie`` and ``Slurm`` backends, ``--job-deps-type=abort_on_error`` is the default;
* for the ``PbsPython`` backend, ``--job-deps-type=always_run`` is the default (because of historical reasons,
  and for the sake of backward compatibility)


.. _submitting_jobs_cfg_job_max_walltime:

Maximum walltime of jobs (``--job-max-walltime``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An integer value specifying the maximum walltime for jobs (in hours) can be specified via ``--job-max-walltime``
(default: 24).

For easyconfigs for which a reference required walltime is available via the ``build_stats`` parameter in a matching
easyconfig file from the easyconfig repository (see :ref:`easyconfigs_repo`), EasyBuild will set the walltime of the
corresponding job to twice that value (unless the resulting value is higher than the maximum walltime for jobs).

If no such reference walltime is available, the maximum walltime is used.


.. _submitting_jobs_cfg_job_output_dir:

Job output directory (``--job-output-dir``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The directory where job log files should be placed can be specified via ``--job-output-dir``
(default: current directory).


.. _submitting_jobs_cfg_job_polling_interval:

Job polling interval (``--job-polling-interval``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The frequency with which the status of submitted jobs should be checked can be specified via ``--job-polling-interval``,
using a floating-point value representing the number of seconds between two checks (default: 30 seconds).

.. note:: This setting is currently only relevant to GC3Pie; see also :ref:`submitting_jobs_usage_gc3pie`.


.. _submitting_jobs_cfg_job_target_resource:

Target resource for job backend (``--job-target-resource``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The target resource that should be used by the job backend can be specified using ``--job-target-resource``.

* for ``PbsPython`` backend: hostname of TORQUE PBS server to submit jobs to (default: ``$PBS_DEFAULT``)
* for ``GC3Pie`` backend: name of resource to submit jobs to (default: none, which implies weighted round-robin
  submission across all available resources)
* for ``Slurm`` backend: *(not used)*


.. _submitting_jobs_usage:

Usage of ``--job``
------------------

To make EasyBuild submit jobs to the job backend rather than performing the installations directly, the ``--job``
command line option can be used.

This following assumes that the required configuration settings w.r.t. the job backend to use are in place, see
:ref:`submitting_jobs_configuration`.


.. _submitting_jobs_usage_pbs_python:

Submitting jobs to a ``PbsPython`` or ``Slurm`` backend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When using the ``PbsPython`` or ``Slurm`` backend, EasyBuild will submit separate jobs for each installation
to be performed, and then exit reporting a list of submitted jobs.

To ensure that the installations are performed in the order dictated by the software dependency graph, dependencies
between installations are specified via *job dependencies* (see also :ref:`submitting_jobs_job_dependency_type`).

See also :ref:`submitting_jobs_examples_pbs_python_backend`.

.. note:: Submitted jobs will be put on hold until all jobs have been submitted. This is required to ensure that the
          dependencies between jobs can be specified correctly; if a job would run to completion before other jobs that
          depend on it were submitted, the submission process may fail.


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
  max_memory_per_core = 10GiB
  max_walltime = 100 hours
  # max # jobs ~= max_cores / max_cores_per_job
  max_cores_per_job = 1
  max_cores = 4
  architecture = x86_64
  auth = none
  override = no
  resourcedir = /tmp/gc3pie


Example GC3Pie configuration for TORQUE/PBS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: ini

  [resource/pbs]
  enabled = yes
  type = pbs

  # use settings below when running GC3Pie on the cluster front-end node
  frontend = localhost
  transport = local
  auth = none

  max_walltime = 2 days
  # max # jobs ~= max_cores / max_cores_per_job
  max_cores_per_job = 16
  max_cores = 1024
  max_memory_per_core = 2 GiB
  architecture = x86_64

  # to add non-std options or use TORQUE/PBS tools located outside of
  # the default PATH, use the following:
  #qsub = /usr/local/bin/qsub -q my-special-queue


Example GC3Pie configuration for SLURM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: ini

  [resource/slurm]
  enabled = yes
  type = slurm
  
  # use settings below when running GC3Pie on the cluster front-end node
  frontend = localhost
  transport = local
  auth = none
  
  max_walltime = 2 days
  # max # jobs ~= max_cores / max_cores_per_job
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

When submitting jobs to the ``GC3Pie`` job backend, the ``eb`` process will not exit until all tasks have been
completed. A job overview will be printed every N seconds (see :ref:`submitting_jobs_cfg_job_polling_interval`).

Jobs are only submitted to the resource manager (SLURM, in this case) when all task dependencies have been resolved.

.. code::

  $ export EASYBUILD_JOB_BACKEND=GC3Pie
  $ export EASYBUILD_JOB_BACKEND_CONFIG=$PWD/gc3pie.cfg
  $ eb GCC-4.6.0.eb OpenMPI-1.8.4-GCC-4.9.2.eb --robot --job --job-cores=16 --job-max-walltime=10
  == temporary log file in case of crash /tmp/eb-ivAiwD/easybuild-PCgmCB.log
  == resolving dependencies ...
  == GC3Pie job overview: 2 submitted (total: 9)
  == GC3Pie job overview: 2 running (total: 9)
  == GC3Pie job overview: 2 running (total: 9)
  ...
  == GC3Pie job overview: 4 terminated, 4 ok, 1 submitted (total: 9)
  == GC3Pie job overview: 4 terminated, 4 ok, 1 running (total: 9)
  ...
  == GC3Pie job overview: 8 terminated, 8 ok, 1 running (total: 9)
  == GC3Pie job overview: 9 terminated, 9 ok (total: 9)
  == GC3Pie job overview: 9 terminated, 9 ok (total: 9)
  == Done processing jobs
  == GC3Pie job overview: 9 terminated, 9 ok (total: 9)
  == Submitted parallel build jobs, exiting now
  == temporary log file(s) /tmp/eb-ivAiwD/easybuild-PCgmCB.log* have been removed.
  == temporary directory /tmp/eb-ivAiwD has been removed.
  
Checking which jobs have been submitted to SLURM at regular intervals reveals that indeed only tasks for which all
dependencies have been processed are actually submitted as jobs::

  $ squeue -u $USER
  JOBID       USER       ACCOUNT           NAME     REASON   START_TIME     END_TIME  TIME_LEFT NODES CPUS   PRIORITY
  6161545     easybuild  example      GCC-4.9.2       None 2015-07-01T1 2015-07-01T2    9:58:55     1 16       1242
  6161546     easybuild  example      GCC-4.6.0       None 2015-07-01T1 2015-07-01T2    9:58:55     1 16       1242

  $ squeue -u $USER
  JOBID       USER       ACCOUNT           NAME     REASON   START_TIME     END_TIME  TIME_LEFT NODES CPUS   PRIORITY
  6174527     easybuild  example Automake-1.15-  Resources          N/A          N/A   10:00:00     1 16       1120

  $ squeue -u $USER
  JOBID       USER       ACCOUNT           NAME     REASON   START_TIME     END_TIME  TIME_LEFT NODES CPUS   PRIORITY
  6174533     easybuild  example OpenMPI-1.8.4-       None 2015-07-03T0 2015-07-03T1    9:55:59     1 16       1119


.. _submitting_jobs_examples_pbs_python_backend:

Example: submitting installations to TORQUE via pbs_python
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using the ``PbsPython`` job backend, ``eb`` submits jobs directly to TORQUE for processing, and exits as soon as all
jobs have been submitted::

  $ eb GCC-4.6.0.eb OpenMPI-1.8.4-GCC-4.9.2.eb --robot --job
  == temporary log file in case of crash /tmp/eb-OMNQAV/easybuild-9fTuJA.log
  == resolving dependencies ...
  == List of submitted jobs (9): GCC-4.6.0 (GCC/4.6.0): 508023.example.pbs; GCC-4.9.2 (GCC/4.9.2): 508024.example.pbs;
  libtool-2.4.2-GCC-4.9.2 (libtool/2.4.2-GCC-4.9.2): 508025.example.pbs; M4-1.4.17-GCC-4.9.2 (M4/1.4.17-GCC-4.9.2): 50
  8026.example.pbs; Autoconf-2.69-GCC-4.9.2 (Autoconf/2.69-GCC-4.9.2): 508027.example.pbs; Automake-1.15-GCC-4.9.2 (Au
  tomake/1.15-GCC-4.9.2): 508028.example.pbs; numactl-2.0.10-GCC-4.9.2 (numactl/2.0.10-GCC-4.9.2): 508029.example.pbs;
  hwloc-1.10.0-GCC-4.9.2 (hwloc/1.10.0-GCC-4.9.2): 508030.example.pbs; OpenMPI-1.8.4-GCC-4.9.2 (OpenMPI/1.8.4-GCC-4.9.
  2): 508031.example.pbs
  == Submitted parallel build jobs, exiting now
  == temporary log file(s) /tmp/eb-OMNQAV/easybuild-9fTuJA.log* have been removed.
  == temporary directory /tmp/eb-OMNQAV has been removed.

  $ qstat -a

  example.pbs:
                                                                                Req'd    Req'd       Elap
  Job ID              Username    Queue    Jobname          SessID  NDS   TSK   Memory   Time    S   Time
  ------------------- ----------- -------- ---------------- ------ ----- ------ ------ --------- - ---------
  508023.example.pbs  easybuild   batch    GCC-4.6.0           --      1     16    --   24:00:00 R  00:02:16 
  508024.example.pbs  easybuild   batch    GCC-4.9.2           --      1     16    --   24:00:00 Q       -- 
  508025.example.pbs  easybuild   batch    libtool-2.4.2-GC    --      1     16    --   24:00:00 H       -- 
  508026.example.pbs  easybuild   batch    M4-1.4.17-GCC-4.    --      1     16    --   24:00:00 H       -- 
  508027.example.pbs  easybuild   batch    Autoconf-2.69-GC    --      1     16    --   24:00:00 H       -- 
  508028.example.pbs  easybuild   batch    Automake-1.15-GC    --      1     16    --   24:00:00 H       -- 
  508029.example.pbs  easybuild   batch    numactl-2.0.10-G    --      1     16    --   24:00:00 H       -- 
  508030.example.pbs  easybuild   batch    hwloc-1.10.0-GCC    --      1     16    --   24:00:00 H       -- 
  508031.example.pbs  easybuild   batch    OpenMPI-1.8.4-GC    --      1     16    --   24:00:00 H       -- 


Holds are put in place to ensure that the jobs run in the order dictated by the dependency graph(s).
These holds are released by the TORQUE server as soon as they jobs on which they depend have completed::


  $ qstat -a

  example.pbs:
                                                                                Req'd    Req'd       Elap
  Job ID              Username    Queue    Jobname          SessID  NDS   TSK   Memory   Time    S   Time
  ------------------- ----------- -------- ---------------- ------ ----- ------ ------ --------- - ---------
  508025.example.pbs  easybuild   batch    libtool-2.4.2-GC    --      1     16    --   24:00:00 Q       -- 
  508026.example.pbs  easybuild   batch    M4-1.4.17-GCC-4.    --      1     16    --   24:00:00 Q       -- 
  508027.example.pbs  easybuild   batch    Autoconf-2.69-GC    --      1     16    --   24:00:00 H       -- 
  508028.example.pbs  easybuild   batch    Automake-1.15-GC    --      1     16    --   24:00:00 H       -- 
  508029.example.pbs  easybuild   batch    numactl-2.0.10-G    --      1     16    --   24:00:00 H       -- 
  508030.example.pbs  easybuild   batch    hwloc-1.10.0-GCC    --      1     16    --   24:00:00 H       -- 
  508031.example.pbs  easybuild   batch    OpenMPI-1.8.4-GC    --      1     16    --   24:00:00 H       -- 

  ...

  $ qstat -a

  example.pbs:
                                                                                Req'd    Req'd       Elap
  Job ID              Username    Queue    Jobname          SessID  NDS   TSK   Memory   Time    S   Time
  ------------------- ----------- -------- ---------------- ------ ----- ------ ------ --------- - ---------
  508031.example.pbs  easybuild   batch    OpenMPI-1.8.4-GC    --      1     16    --   24:00:00 R  00:03:46
