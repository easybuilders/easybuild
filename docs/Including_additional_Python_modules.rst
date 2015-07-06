.. _including_additional_python_modules:

Including additional Python modules (``--include-*``)
=====================================================

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

Format
~~~~~~

The ``--include-*`` options accept a comma-separated list of paths to Python modules.

These paths can be absolute or relative paths, or so-called *glob patterns*, i.e., paths containing
wildcard characters like ``*`` or ``?``. The latter can be used to include several Python modules at once.

For example, to include all Python modules located in the directory ``$HOME/myeb``, a path pattern like
``$HOME/myeb/*.py`` can be specified to the appropriate ``--include-*`` option.

.. note:: Shell expansion can get in the way of specifying paths to ``eb`` that contains wildcards. To avoid problems,
          simply escape the wildcard characters using a backslash.

          For example::

            $ export EASYBUILD_INCLUDE_EASYBLOCKS=$HOME/myeb\*.py

          or::

            $ eb --include-easyblocks=$HOME/myeb/\*.py ...

Configuration types
~~~~~~~~~~~~~~~~~~~

Each of the ``--include-*`` options can be specified via the ``eb`` command line, using an environment variable
(``$EASYBUILD_INCLUDE_*``) or by defining the corresponding ``include_*`` parameters in an EasyBuild configuration
file, just like all other configuration options (see :ref:`configuration_consistency`).


How it works
~~~~~~~~~~~~

For each of the ``--include-*`` options, EasyBuild will set up a temporary directory providing the corresponding
Python package. In this directory, symlinks will be put in place to each of the included Python modules.
The parent path is then injected in the Python search path to make the included Python modules available as required.


Order of preference
~~~~~~~~~~~~~~~~~~~

Python modules that are included via ``--include-*`` get preference over other Python modules available in the
Python search path (e.g., the one that are part of the EasyBuild installation you are using). This may be useful when
testing modifications to particular components of EasyBuild, for example easyblocks.

.. note:: We recommend to only override existing components when testing. Upcoming EasyBuild versions may include
          important updates like bug fixes, which may be missed if customised implementations of components were
          put in place.


.. _include_easyblocks:

Including additional easyblocks (``--include-easyblocks``)
----------------------------------------------------------

Adding support for building and installing additional software packages can be done by specifying the location of
Python modules that implement easyblocks via ``--include-easyblocks``.

Generic easyblocks are expected to be located in a directory named ``generic``.

To verify that the easyblocks you included are indeed being picked up, ``--list-easyblocks=detailed`` can be used
(see also :ref:`list_easyblocks`).

Example
~~~~~~~

The example below shows how all self-implemented easyblocks (both software-specific and generic) located in the
``$HOME/myeasyblocks`` directory can be included:

.. code::

    $ export EASYBUILD_INCLUDE_EASYBLOCKS=$HOME/myeasyblocks/\*.py,$HOME/myeasyblocks/generic/\*.py
    $ eb --list-easyblocks=detailed
    ...
    |-- EB_mytest (easybuild.easyblocks.mytest @ /tmp/example/eb-Bk3zxb/included-easyblocks/easybuild/easyblocks/mytest.py)
    ...
    |-- foo (easybuild.easyblocks.generic.foo @ /tmp/example/eb-Bk3zxb/included-easyblocks/easybuild/easyblocks/generic/foo.py)
    ...


.. _include_mns:

Including additional module naming schemes (``--include-module-naming-schemes``)
--------------------------------------------------------------------------------

To make EasyBuild aware of one or more custom module naming schemes, the path to the corresponding Python modules can
be specified via ``--include-module-naming-schemes``.

To verify that EasyBuild is aware of the additional module naming schemes, the ``--avail-module-naming-schemes`` option
can be used.


Example
~~~~~~~

The example below shows how all custom module naming schemes located in the ``$HOME/myebmns`` can be included:

.. code::

    $ eb --include-module-naming-schemes=$HOME/myebmns/\*.py --avail-module-naming-schemes
    List of supported module naming schemes:
        ...
        MyCustomMNS
        MyOtherCustomMNS
        ...


.. _include_toolchains:

Including additional toolchains (``--include-toolchains``)
----------------------------------------------------------

Plugging in Python modules that add support for additional toolchains, optionally including additional toolchain
components (compilers, MPI libraries, BLAS/LAPACK/FFT libraries, ...) can be done via ``--include-toolchains``.

EasyBuild will determine whether the Python module is a *toolchain definition* or implements support for an *additional
toolchain component* based on the name of the directory in which it is located. Implementations of toolchain components
are expeced to be located in a directory named according to the type of component (``compiler``, ``mpi``, ``linalg``
or ``fft``).

To verify that EasyBuild is aware of the included toolchains, ``--list-toolchains`` can be used.


Example
~~~~~~~

The example below shows how the support for additional toolchains and the required additional compiler/MPI toolchain
components implemented by the Python modules located in the directory ``$HOME/myebtcs`` can be included:

.. code::

    $ export EASYBUILD_INCLUDE_TOOLCHAINS='$HOME/myebtcs/*.py,$HOME/myebtcs/compiler/*.py,$HOME/myebtcs/mpi/*.py'
    $ eb --list-toolchains
    List of known toolchains (toolchainname: module[,module...]):
        ...
        mytoolchain: MyCompiler, MyMPI
        ...
