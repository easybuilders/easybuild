
First steps with eb
===================

Installing bzip2 v1.0.6 with system compiler::

  eb bzip2-1.0.6.eb
  module load bzip2/1.0.6

or (equivalent), install latest version (that EasyBuild knows about)::

  eb --software-name=bzip2 --toolchain-name=dummy

Install goolf compiler toolchain (be patient)::

  eb goolf-1.4.10-no-OFED.eb --robot # no-OFED indicates no IB support

Install gzip v1.6 on top of goolf toolchain, log with debug info to stdout::

  eb gzip-1.6-goolf-1.5.14-no-OFED.eb -ldr

