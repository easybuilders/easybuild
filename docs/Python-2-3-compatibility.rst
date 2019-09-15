.. _py2_py3_compatibility:

Compatibility with Python 2 and Python 3
========================================

Starting with EasyBuild v4.0, the EasyBuild framework and easyblocks are compatible with both Python versions 2 and 3.
More specifically, the following Python versions are currently supported:

* Python 2.6.x
* Python 2.7.x
* Python 3.5.x
* Python 3.6.x
* Python 3.7.x

.. _py2_py3_compatibility_EB_VERBOSE:

Determining which Python version EasyBuild is using via ``$EB_VERBOSE``
-----------------------------------------------------------------------

To determine which Python version is being used to run EasyBuild, you can define the ``$EB_VERBOSE`` environment variable.

For example::

  $ export EB_VERBOSE=1
  $ eb --version
  >> Considering 'python2'...
  >> No 'python2' found in $PATH, skipping...
  >> Considering 'python3'...
  >> 'python3' version: 3.6.9, which matches Python 3 version requirement (>= 3.5)
  >> Selected Python command: python3 (/usr/local/bin/python3)
  >> python3 -m easybuild.main --version
  This is EasyBuild 4.0.0 (framework: 4.0.0, easyblocks: 4.0.0) on host example.


.. _py2_py3_compatibility_EB_PYTHON:

Controlling which ``python`` command EasyBuild will use via ``$EB_PYTHON``
--------------------------------------------------------------------------

The ``eb`` command will consider different ``python`` commands, and check the Python version corresponding with
the command before selecting one. The commands considered are (in order):

* ``python2``
* ``python3``
* ``python``

Before considering these commands, ``eb`` will first consider the command name specified via the ``$EB_PYTHON``
environment variable (if defined), so you can always control which Python version is being used if desired.

For example::

  $ export EB_PYTHON=python3.7
  $ export EB_VERBOSE=1
  $ eb --version
  >> Considering 'python3.7'...
  >> 'python3.7' version: 3.7.2, which matches Python 3 version requirement (>= 3.5)
  >> Selected Python command: python3.7 (/usr/local/bin/python3.7)
  >> python3.7 -m easybuild.main --version
  This is EasyBuild 4.0.0 (framework: 4.0.0, easyblocks: 4.0.0) on host example.


.. _py2_py3_compatibility_py2vs3_package

The ``easybuild.tools.py2vs3`` package
--------------------------------------

To facilitate this, the ``easybuild.tools.py2vs3`` package was introduced in EasyBuild v4.0.
When importing a function from this package, you will automatically get a version of the function that
is compatible with the Python version being used to run EasyBuild.

Through this approach we can hide subtle differences between Python 2 and 3, while avoiding code duplication
and Python version checks throughout the codebase, as well as avoid requiring packages like ``six`` or ``future``
(which facilitate maintaining compatibility with Python 2 and 3, but are also a bit of a burden).

The ``easybuild.tools.py2vs3`` package provides two major classes of items (listed below in alphabetical order):

* functions from the Python standard library which should be imported from different locations in Python 2 and 3
* wrappers for functionality in the Python standard library which behaves differently in Python 2 and 3

.. _py2vs3_ascii_letters:

``ascii_letters``
-----------------

* Python 2: corresponds with ``string.letters``
* Python 3: corresponds with ``string.ascii_letters``

.. _py2vs3_ascii_lowercase:

``ascii_lowercase``
-------------------

* Python 2: corresponds with ``string.lowercase``
* Python 3: corresponds with ``string.ascii_lowercase``

.. _py2vs3_build_opener:

``build_opener``
----------------

* Python 2: corresponds with ``urllib2.build_opener`` function
* Python 3: corresponds with ``urllib.request.build_opener`` function

.. _py2vs3_configparser:

``configparser``
----------------

* Python 2: corresponds with ``ConfigParser.configparser`` module
* Python 3: corresponds with ``configparser`` module

.. _py2vs3_create_base_metaclass:

``create_base_metaclass``
-------------------------

Function to create a metaclass that can be used as a base class, implemented in a way that is compatible with both Python 2 and 3.

.. _py2vs3_extract_method_name:

``extract_method_name``
------------------------

Function to method name from lambda function, implemented in a way that is compatible with both Python 2 and 3.

.. _py2vs3_HTTPError:

``HTTPError``
-------------

* Python 2: corresponds with ``urllib2.HTTPError``
* Python 3: corresponds with ``urllib.request.HTTPError``

.. _py2vs3_HTTPSHandler:

``HTTPSHandler``
----------------

* Python 2: corresponds with ``urllib2.HTTPSHandler``
* Python 3: corresponds with ``urllib.request.HTTPSHandler``

.. _py2vs3_json_loads:

``json_loads``
--------------

* Python 2: wraps ``json.loads`` function
* Python 3: wraps ``json.loads`` function, taking into account that for Python versions older than 3.6
            a value of type ``string`` (rather than ``bytes``) is required as argument

.. _py2vs3_mk_wrapper_baseclass:

``mk_wrapper_baseclass``
------------------------

Function to create a wrapper base class using the specified metaclass, implemented in a way that is compatible with both Python 2 and 3.

.. _py2vs3_OrderedDict:

``OrderedDict``
---------------

* Python 2.6: corresponds with ``easybuild.tools.ordereddict.OrderedDict``
* Python 2.7: corresponds with ``collections.OrderedDict``
* Python 3: corresponds with ``collections.OrderedDict``

.. _py2vs3_reload:

``reload``
----------

* Python 2: corresponds with ``reload`` built-in function
* Python 3: corresponds with ``importlib.reload`` function

.. _py2vs3_raise_with_traceback:

``raise_with_traceback``
------------------------

Function to raise an error with specified message and traceback, implemented in a way that is compatible with both Python 2 and 3.

.. _py2vs3_Request:

``Request``
-----------

* Python 2: corresponds with ``urllib2.Request``
* Python 3: corresponds with ``urllib.request.Request``

.. _py2vs3_subprocess_popen_text:

``subprocess_popen_text``
-------------------------

* Python 2: wrapper for ``subprocess.Popen``
* Python 3: wrapper for ``subprocess.Popen`` while forcing text mode (using ``universal_newlines=True``)

.. _py2vs3_std_urllib:

``std_urllib``
--------------

* Python 2: corresponds with ``urllib`` package
* Python 3: corresponds with ``urllib.request`` package

.. _py2vs3_string_type:

``string_type``
---------------

* Python 2: corresponds with ``basestring`` built-in string type
* Python 3: corresponds with ``str`` built-in string type

.. _py2vs3_StringIO:

``StringIO``
------------

* Python 2: corresponds with ``StringIO.StringIO`` class
* Python 3: corresponds with ``io.StringIO`` class

.. _py2vs3_urlencode:

``urlencode``
-------------

* Python 2: corresponds with ``urllib.urlencode`` function
* Python 2: corresponds with ``urllib.parse.urlencode`` function

.. _py2vs3_URLError:

``URLError``
------------

* Python 2: corresponds with ``urllib2.URLError``
* Python 3: corresponds with ``urllib.request.URLError``

.. _py2vs3_urlopen:

``urlopen``
-----------

* Python 2: corresponds with ``urllib2.urlopen``
* Python 3: corresponds with ``urllib.request.urlopen``
