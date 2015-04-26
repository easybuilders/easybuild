.. _partial_installations:

Partial installations
=====================

Stopping the build and install procedure after a particular step using ``--stop``
---------------------------------------------------------------------------------

Skipping existing installations (partially) using ``-k``/``-skip``
------------------------------------------------------------------

.. note::
  Unless the existing module is removed manually, using ``--skip`` requires ``--force`` to actually install
  additional extensions and regenerating the module file.

Only (re)generating module files using ``--module-only``
--------------------------------------------------------

TODO:

* ``--module-only`` (for example combined with ``--module-syntax=Lua``)
* ``--module-only`` with ``--force``: skip all steps, including sanity check: install module without actually installing
the software or making sure the software was installed before
* ``--module-only`` with 'migration' naming scheme
