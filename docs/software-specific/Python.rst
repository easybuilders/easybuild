.. _software_specific_python:

Software-specific: Python & Python packages
===========================================

blahblahblah

.. contents::
    :depth: 3
    :backlinks: none

.. _software_specific_python_problems:

Problems and attention points specific to Python (packages)
-----------------------------------------------------------

.. _software_specific_python_python:

Writing easyconfig files for Python
-----------------------------------

.. FIXME Python with "batteries included"
.. FIXME Python with full toolchain vs (base) compiler-only toolchain (+ SciPy-bundle)

.. _software_specific_python_python_pkgs:

Writing easyconfig files for (bundles of) Python packages
---------------------------------------------------------

.. FIXME versionsuffix
.. FIXME template values (%(pyver)s, %(pyshortver)s)
.. FIXME tweaking modulename (incl. False to skip import check)
.. FIXME sanity_check_paths
.. FIXME use_pip (vs setup.py)
.. FIXME PythonPackage vs PythonBundle (vs custom easyblocks like numpy, scipy, TensorFlow, ...)
.. FIXME    SciPy-bundle
.. FIXME check_ldshared
.. FIXME multi-Python installations (multi_deps)
.. FIXME fix_python_shebang_for
