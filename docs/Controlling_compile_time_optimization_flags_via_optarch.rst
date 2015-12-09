Controlling compile time optimization flags via optarch
=======================================================

By default EasyBuild optimizes builds for the cpu in the compilation host. EasyBuild tells the compiler to generate instructions for the highest instruction set available on the compilation host processor. This means for GCC toolchains easybuild uses the flag ``-march=native`` https://gcc.gnu.org/onlinedocs/gcc-4.9.0/gcc/i386-and-x86-64-Options.html and for intel compilers it uses flag ``-xHost`` https://software.intel.com/en-us/node/522846

Compile time optimization is usually what you want in a HPC cluster but it has some implications if your cluster is heterogeneous (has different cpu generations) and you want to execute your applications in a machine with a different cpu generation that the cpu in the compilation host. If you compile your application optimized for a Haswell cpu it won't run in a Nehalem cpu.

One approach to workaround this problem in heterogeneous HPC clusters is to build as many copies of the software stack as cpu generations you have in your cluster and configure your system so each compute node uses the right software stack matching its cpu type. Here you have some technical details about this approach using automounter/autofs < here link to my pdf >

Another approach is using the EasyBuild flag ``--optarch`` to override the default "march" and "xHost" values in EasyBuild. As example you could do this for a GCC toolchain:

``$> eb --optarch=march=core2 SAMtools-1.2-goolf-1.7.20.eb -r``

Or this for intel toolchains:

``$> eb --optarch=xSSSE3 SAMtools-1.2-intel-2015b-HTSlib-1.2.1.eb -r``

This option gives you flexibility allowing to define the specific optimization flags you want but requires that you take care of specifying different flags for different compilers and choose the right optimization flag depending on your specific hardware.

The most generic approach is doing ``eb --optarch=GENERIC``. When easybuild finds the special key "optarch=GENERIC" it will use the right compiler flags so the compilation is as much generic as possible. The generated binary should run in any x86_64 cpu. Be aware that only GCC and Intel toolchains/compilers are supported when using "optarch=GENERIC" and this feature requires EasyBuild version => 2.5.

This means, if you do "eb --optarch=GENERIC" with GCC you will get this:

``$> gcc -march=x86-64 -mtune=generic``

And if you use "eb --optarch=GENERIC" with an Intel toolchain you will get this:

``$> icc -xSSE2``

.. note:: Be aware that that using --optarch option doesn't mean the build will be generic in any case. EasyBuild will setup the required environment variables and compiler flags to generate a generic x86_64 binary but some MakeFiles or build systems could have hardcoded values and that's something that EasyBuild cannot fix. As example, OpenBLAS build system will autodetect the cpu type in the compilation host and will optimize the binary for that cpu by default. If you want a generic OpenBLAS build you will need to tweak the OpenBLAS easyconfig to define the desired TARGET to use. For this you will need to use this buildops in the OpenBLAS easyconfig:  `` buildopts = 'TARGET=PRESCOTT BINARY=64 ' + threading + ' CC="$CC" FC="$F77"' ``. See these links for more details: https://github.com/xianyi/OpenBLAS/blob/develop/TargetList.txt https://github.com/xianyi/OpenBLAS/issues/685

