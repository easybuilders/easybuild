EasyBuild - building software with ease
=======================================
 
EasyBuild is a software build and installation framework written in Python
that allows you to install software in a structured, repeatable and robust way.

EasyBuild is split up into three different repositories:

* http://github.com/hpcugent/easybuild-framework: the EasyBuild framework, which includes the easybuild.framework and easybuild.tools Python packages that provide general support for building and installing software
* http://github.com/hpcugent/easybuild-easyblocks: a collection of easyblocks, in the form of the easybuild.easyblocks Python package, that implement support for building and installing (collections of) software applications; this depends on the framework being available, of course
* http://github.com/hpcugent/easybuild-easyconfigs: a collection of example easyconfig files that specify which software to build, and using which build options; these easyconfigs will be well tested with the latest compatible versions of the easybuild-framework and easybuild-easyblocks packages

More information is available on the EasyBuild wiki, see https://github.com/hpcugent/easybuild/wiki.
