.. _including_additional_python_modules:

Including additional Python modules
===================================

EasyBuild's capabilities can be extended easily, by including additional Python modules that implement support for
building and installing software that is not supported (yet), define additional module naming schemes, or introduce
additional toolchains, (optionally) with support for additional compilers, MPI libraries, linear algebra libraries, etc.

Since EasyBuild v2.2.0, dedicated configuration options are available that make it straightforward to get EasyBuild to
pick up additional Python modules, and get them registered in the appropriate ``easybuild`` subnamespace.


* :ref:`include_easyblocks`
* :ref:`include_mns`
* :ref:`include_toolchains`


.. _include_general_remarks:
General aspects of ``--include`` options
------------------------------------------

Each of the ``--include`` options accepts a comma-separated list of paths to Python modules.

These paths can be absolute or relative paths, or so-called *glob patterns*, i.e., paths containing
wildcard characters like ``*`` or ``?``. The latter are commonly used to include several Python modules at once.

For example, to include all Python modules located in the directory ``$HOME/easybuild``, a path pattern like
``$HOME/easybuild/*.py`` can be specified to the appropriate ``--include`` options.


.. _include_easyblocks:

Including additional easyblocks (``--include-easyblocks``)
----------------------------------------------------------

Adding support for building and installing additional software packages can be done by specifying the location of
Python modules that implement easyblocks via ``--include-easyblocks``.

EasyBuild will set up a temporary directory providing the ``easybuild.easyblocks`` Python package and containing
symlinks to each of included easyblocks, which gets injected in the Python search path to make the included easyblocks
available as required.

To verify that your custom easyblocks are indeed being picked up, use ``--list-easyblocks=detailed``
(see also :ref:`list_easyblocks`).

.. note:: Any easyblocks that are included via ``--include-easyblocks`` get preference over the easyblocks that are part
          of the EasyBuild installation you are using, which is useful when testing modifications to existing
          easyblocks.

          We recommend only to override existing easyblocks when testing. Upcoming EasyBuild versions may include
          important changes to existing easyblocks, which will be missed if a customised easyblock was put in place.


.. _include_mns:
Including additional module naming schemes (``--include-module-naming-schemes``)
--------------------------------------------------------------------------------



.. _include_toolchains:
Including additional toolchains (``--include-toolchains``)
----------------------------------------------------------
