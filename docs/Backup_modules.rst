.. _backup_modules:

Backing up of existing modules (``--backup-modules``)
-----------------------------------------------------

While regenerating existing module files, you may want to preserve the existing module files
to compare and assess that the changes in the newly generated module file match expectations.

Backing up of existing modules can be enabled with ``--backup-modules``.

Backups are stored in the same directory as where the module file was located,
and the files are given an additional extention of the form ``.bak_<year><month><day><hour><min><sec>``.

* With module files in Tcl syntax, the backup module file is hidden by adding a leading dot to the filename; 
  this is done to avoid that it is displayed as a normal module in ``module avail``.
* With module files in Lua syntax, the backup module file is not made hidden since the additional
  ``.bak_*`` extension prevents Lmod from picking it up as a valid module file (only files ending in ``.lua``
  are considered to be module files)

The location of the backed up module file will be printed, as well as a "unified diff" comparison
(very similar to what ``diff -u`` produces) between the backed up module file and the newly generated module file
(or a message mentioning that no differences were found).


.. _backup_modules_disable:

Disabling backup of modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~

When ``--skip`` or ``--module-only`` is used, backing up of existing modules is enabled automatically.

This can be disabled with ``--disable-backup-modules``.


.. _backup_modules_example:

Example
~~~~~~~

Suppose existing modules in both Tcl & Lua syntax are present for bzip2 1.0.6.
Both are missing an update statement for $PATH because the ``/bin`` subdirectory was missing in the installation,
for the purpose of this example::

    $ ls -la $EASYBUILD_PREFIX/modules/all/bzip2
    total 16
    drwxr-xr-x  2 example  example   136 Aug 24 10:20 .
    drwxr-xr-x  3 example  example   102 Aug 24 10:18 ..
    -rw-r--r--  1 example  example  1256 Aug 24 10:19 1.0.6
    -rw-r--r--  1 example  example  1303 Aug 24 10:18 1.0.6.lua


Using ``--force`` and ``--backup-modules``, we can reinstall the ``bzip2/1.0.6`` modules
and get a clear view on what has changed.

To reinstall the ``bzip2/1.0.6`` module in Lua syntax while retaining a backup of the existing module::

    $ eb bzip2-1.0.6.eb --module-syntax=Lua --force --backup-modules
    ...
    == creating build dir, resetting environment...
    == backup of existing module file stored at /example/modules/all/bzip2/1.0.6.lua.bak_20170824102603
    ...
    == creating module...
    == comparing module file with backup /example/modules/all/bzip2/1.0.6.lua.bak_20170824102603; diff is:
    --- /example/modules/all/bzip2/1.0.6.lua.bak_20170824102603
    +++ /example/modules/all/bzip2/1.0.6.lua
    @@ -25,9 +25,10 @@
     prepend_path("LD_LIBRARY_PATH", pathJoin(root, "lib"))
     prepend_path("LIBRARY_PATH", pathJoin(root, "lib"))
     prepend_path("MANPATH", pathJoin(root, "man"))
    +prepend_path("PATH", pathJoin(root, "bin"))
     setenv("EBROOTBZIP2", root)
     setenv("EBVERSIONBZIP2", "1.0.6")
     setenv("EBDEVELBZIP2", pathJoin(root, "easybuild/bzip2-1.0.6-easybuild-devel"))

    ...
    
Equivalently, we can reinstall the module in Tcl syntax using::

    $ eb bzip2-1.0.6.eb --module-syntax=Tcl --force --backup-modules

Afterwards, both the newly generated modules and the backups are in place::

    $ ls -la $EASYBUILD_PREFIX/modules/all/bzip2
    total 32
    drwxr-xr-x  2 example  example   204 Aug 24 10:26 .
    drwxr-xr-x  3 example  example   102 Jul 11 10:18 ..
    -rw-r--r--  1 example  example  1227 Aug 24 10:24 .1.0.6.bak_20170824102412
    -rw-r--r--  1 example  example  1256 Jul 11 01:24 1.0.6
    -rw-r--r--  1 example  example  1303 Jul 11 01:26 1.0.6.lua
    -rw-r--r--  1 example  example  1259 Aug 24 10:26 1.0.6.lua.bak_20170824102603

Cleaning up the backup module files can be done with the following command (for example)::

    $ find $EASYBUILD_PREFIX/modules/all/bzip2 -name '*.bak*' | xargs rm -v
    /example/modules/all/bzip2/.1.0.6.bak_20170824102412
    /example/modules/all/bzip2/1.0.6.lua.bak_20170824102603
