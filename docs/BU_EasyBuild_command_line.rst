
EasyBuild command line
======================

- getting help, overview of options: ``eb --help``
- list of available easyconfig parameters: ``eb -a``
- robot build, debug log to stdout: ``eb bzip2-1.0.6.eb -ldr``
- recursive build of a complex build-tree::

   eb WRF-3.4-goalf-1.1.0-no-OFED-dmpar.eb -r

- overview of required/available modules: ``eb --dry-run or eb -D``
- list of known toolchains + their definition: ``eb --list-toolchains``
- how to generate easyconfigs::

   eb bzip2-1.0.6.eb --try-toolchain=ictce,6.2.5 -r

- searching for easyconfigs: ``eb -S`` or ``eb --search``
- use easyconfigs available in an (open) pull request: ``eb --from-pr <PR#>``
- test pull request and upload test report::

   eb --from-pr <PR#> --upload-test-report --github-user=username

