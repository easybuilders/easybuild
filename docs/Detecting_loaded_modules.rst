.. _detecting_loaded_modules:

Detecting loaded modules
========================

Since EasyBuild v3.3.0, the ``--detect-loaded-modules`` configuration option is available.

By default, EasyBuild will print a clear warning in case any loaded EasyBuild-generated modules are detected
in the current environment:


This is done because manually loading modules for software that was installed through EasyBuild before issueing
an ``eb`` command may affect the performed software installations procedures, either positively (fixing problems with
installations), or negatively (breaking installations). In either case, influencing EasyBuild by manually loading
modules should be avoided, since it affects reproducability of installations.

