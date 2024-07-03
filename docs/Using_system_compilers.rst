EasyBuild Support for System Compilers
======================================


Motivation
----------

Beyond the default usage scenario of EasyBuild where it is used to
build and install the complete software stack for HPC cluster system,
there is another scenario in which EasyBuild is very useful: people want to
easily install a complex software package or set of packages on their laptop or
workstation. In that case, users are typically annoyed by the fact that
EasyBuild requires them to re-install yet another version of a compiler
instead of allowing them to re-use already existing compilers (either done
manually by the user or by using the compiler(s) provided by the Linux
distribution). This is the scenario supported by the EasyBlock
"SystemCompiler".


Currently Supported Compilers
-----------------------------

GCC, icc, ifort


Basic Usage
-----------

The most simple case, where a user just wants to use the compiler
provided by the Linux distribution (compiler is in $PATH), the following
EasyConfig can be used:

----- GCC-system.eb ------------------------------------------------------
easyblock = 'SystemCompiler'
name = 'GCC'
version = 'system'

homepage = ""
description = ""
toolchain = {'name': 'dummy', 'version': 'dummy'}

moduleclass = 'compiler'
--------------------------------------------------------------------------

The EasyConfig parameters "homepage", "description", and "toolchain" are
technically not necessary but are currently required by EasyBuild and
should be provided as shown in the example. The "moduleclass" parameter
is technically optional, but should also be set like shown above to ensure
correct handling of the compiler inside EasyBuild.

The values for "homepage" and "description" are corrected to the right values
automatically by the SystemCompiler EasyBlock. 

The compiler the user wants to make available to EasyBuild is specified in the
parameter "name". Currently, only the values "GCC", "icc", or "ifort" are
recognized and supported. If the "version" parameter is set to 'system',
the SystemCompiler EasyBlock automatically derives the correct version number
from the system compiler and sets internal variables accordingly.

The command "eb GCC-system.eb" analog to the EasyBuild command to build and
install a compiler does the necessary bookkeeping and module generation for
the desired system compiler. It can then be used to install the rest of the
necessary toolchain and desired packages.


Advanced Usage
--------------

Advanced users might have multiple versions of compilers already installed on
their system and want to make them all available to EasyBuild. In that case,
EasyConfigs like the following can be used:

----- GCC-4.8.3-system.eb ------------------------------------------------
easyblock = 'SystemCompiler'
name = 'GCC'
version = '4.8.3'
versionsuffix = '-system'

homepage = ""
description = ""
toolchain = {'name': 'dummy', 'version': 'dummy'}

moduleclass = 'compiler'
--------------------------------------------------------------------------

Before making this compiler version available to EasyBuyild (via "eb
GCC-4.8.3-system.eb") the user needs to ensure that the correct compiler
version is found on $PATH (either by setting $PATH correctly or by using a
self-installed module). The SystemCompiler EasyBlock does basically the same
things as described under "Basic Usage" with the only difference that after
automatically deriving the compiler version, it is checked whether it matches
the version specified in the parameter "version", and if it does not, an error
is printed and the installation is not performed.

If the different versions of compiler on the system are made available through
system modules, they should also be specified like in the following example
(where it is assumed the system compiler is provided by the system module
"GNU/4.8.3"):

----- GCC-4.8.3-system.eb ------------------------------------------------
easyblock = 'SystemCompiler'
name = 'GCC'
version = '4.8.3'
versionsuffix = '-system'

homepage = ""
description = ""
toolchain = {'name': 'dummy', 'version': 'dummy'}

dependencies = [
    ('GNU/' + version, EXTERNAL_MODULE),
]

moduleclass = 'compiler'
--------------------------------------------------------------------------
