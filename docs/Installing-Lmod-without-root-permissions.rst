
.. _installing_lmod:

Installing Lmod without root permissions
========================================

This short guide will show how to install Lmod (and Lua, on which it
depends) on Linux, without requiring root permissions.   
For full instructions on installing Lmod and its prerequisites check
the `Lmod documentation<https://lmod.readthedocs.io/en/latest/030_installing.html>`_.

Lua
~~~

Build and install Lua using the source tarball available in the `Lmod
SourceForge repository<https://sourceforge.net/projects/lmod/files/>`_.
This version is a lot easier to build, and already includes the required
extra Lua modules. At the time of writing this relates to the
``lua-5.1.4.9.tar.bz2`` tarball.

**Step 1**: Download and unpack Lua:

.. code:: bash

    wget https://sourceforge.net/projects/lmod/files/lua-5.1.4.9.tar.bz2
    tar xf lua-5.1.4.9.tar.bz2 && cd lua-5.1.4.9

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

**Step 1**: Download and unpack the latest available Lmod version,
8.3.1 at the time of writing, from `the Github releases page
<https://github.com/TACC/Lmod/releases>`_.

.. code:: bash

    wget https://github.com/TACC/Lmod/archive/8.3.1.tar.gz
    tar xf 8.3.1.tar.gz && cd Lmod-8.3.1

**Step 2**: Configure, build and install Lmod build, in a custom prefix:

.. code:: bash

    ./configure --prefix=$HOME && make install

**Step 3**: Update ``$LMOD_CMD`` to point to the Lmod executable
(put this in your ``.bashrc``):

.. code:: bash

    export LMOD_CMD=$HOME/lmod/lmod/libexec/lmod

Note that you can also use the specific version but the ``lmod``
directoy symlink above allows updates without changing this export:

.. code:: bash

    export LMOD_CMD=$HOME/lmod/8.3.1/libexec/lmod


Optionally, give it a spin:

.. code:: bash

    $ $LMOD_CMD --version

    Modules based on Lua: Version 8.3.1  2020-02-16 19:46 :z
        by Robert McLay mclay@tacc.utexas.edu

**Step 4**: Define ``module`` function to use ``lmod`` (optional for use
with EasyBuild):

.. code:: bash

    source $HOME/lmod/lmod/init/bash
    
