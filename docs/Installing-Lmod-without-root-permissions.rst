
.. _installing_lmod:

Installing Lmod without root permissions
========================================

This short guide will show how to install Lmod (and Lua, on which it
depends) on Linux, without requiring root permissions.
Installing lua using the steps below does require rsync, make and gcc

Lua
~~~

Build and install Lua using the source tarball available in the Lmod
SourceForge repository (`http://sourceforge.net/projects/lmod/files/`_).
This version is a lot easier to build, and already includes the required
extra Lua modules. At the time of writing this relates to the
``lua-5.1.4.8.tar.gz`` tarball.

**Step 1**: Download and unpack `lua-5.1.4.8.tar.gz`_.

**Step 2**: Configure the Lua build, provide a custom installation
prefix (e.g. ``$HOME/lua``) and specify to statically link libraries
(i.e. ``libreadline`` and ``ncurses``), to avoid problems when modules
that provide these libraries are being loaded. Then build and install
via ``make``:

.. code:: bash

    ./configure --with-static=yes --prefix=$HOME/lua && make && make install

**Step 3**: Make sure the ``lua`` binary is available in your ``$PATH``
(only required when building Lmod, see below):

.. code:: bash

    export PATH=$HOME/lua/bin:$PATH

Optionally, check whether the ``lua`` binary indeed doesn’t link to any
unexpected ``readline`` or ``ncurses`` libraries:

.. code:: bash

    $ ldd $HOME/lua/bin/lua
            linux-vdso.so.1 (0x00007fffad7ff000)
            libm.so.6 => /lib64/libm.so.6 (0x00007ff9914db000)
            libdl.so.2 => /lib64/libdl.so.2 (0x00007ff9912d7000)
            libc.so.6 => /lib64/libc.so.6 (0x00007ff990f2a000)
            /lib64/ld-linux-x86-64.so.2 (0x00007ff9917d9000)

Lmod
~~~~

Dependencies: building Lmod using the steps below requires tcl, tcl-dev(el) make and bzip2

**Step 1**: Download and unpack the latest available Lmod version,
`Lmod-8.4.tar.bz2`_ at the time of writing.

.. code:: bash

    tar xfvj Lmod-8.4.tar.bz2 && cd Lmod-8.4

**Step 2**: Configure, build and install Lmod build, in a custom prefix:

.. code:: bash

    ./configure --prefix=$HOME && make install

**Step 3**: Update ``$PATH`` so ``lmod`` is available (put this in your
``.bashrc``):

.. code:: bash

    export PATH=$HOME/lmod/8.4/libexec:$PATH

Optionally, give it a spin:

.. code:: bash

    $ lmod --version

    Modules based on Lua: Version 8.4  2020-07-31 12:25 -05:00
        by Robert McLay mclay@tacc.utexas.edu

**Step 4**: Define ``module`` function to use ``lmod`` (optional for use
with EasyBuild):

.. code:: bash

    source $HOME/lmod/8.4/init/bash
    export LMOD_CMD=$HOME/lmod/8.4/libexec/lmod

.. _`http://sourceforge.net/projects/lmod/files/`: http://sourceforge.net/projects/lmod/files/
.. _lua-5.1.4.8.tar.gz: https://sourceforge.net/projects/lmod/files/lua-5.1.4.8.tar.gz/download
.. _Lmod-8.4.tar.bz2: https://sourceforge.net/projects/lmod/files/Lmod-8.4.tar.bz2/download

