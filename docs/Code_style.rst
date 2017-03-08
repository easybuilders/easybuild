
.. _code_style:

Code style
==========

The code style we follow in the EasyBuild code repository is mainly dictated by the Python standard `PEP8`_.

Highlighted PEP8 code style rules:

* use **4 spaces** for indentation, **do not use tabs**
    for example, use ``:set tabstop 4`` and ``:set expandtab`` in Vim
* indent items in a list at an extra 4 spaces
    nested lists can be indented at the same indentation as the first item in the list if it is on the first line, closing brackets must match visual indentation
* use `optional underscores`, not camelCase, for variable, function and method names (i.e. ``poll.get_unique_voters()``,
  **not** ``poll.getUniqueVoters``)
* use ``InitialCaps`` for class names
* in docstrings, don't use "action words"

The only (major) exception to PEP8 is our preference for longer line lengths: line lengths **must be limited to 120 characters**, and should by preference be `shorter than 100 characters` (as opposed to the 80-character limit in PEP8).

.. _PEP8: http://www.python.org/dev/peps/pep-0008

.. _code_style_easyconfigs:

Easyconfigs style guide
-----------------------

We maintain a strict 'code' style for easyconfig files too, which has proved
to be invaluable in making easyconfig files easy to grasp at a glance.

Major attention points include:

* :ref:`code_style_easyconfigs_max_line_length`
* :ref:`code_style_easyconfigs_whitespace`
* :ref:`code_style_easyconfigs_indentation`
* :ref:`code_style_easyconfigs_lists`
* :ref:`code_style_easyconfigs_order_grouping`
* :ref:`code_style_easyconfigs_hardcoding`
* :ref:`code_style_easyconfigs_templates_constants`
* :ref:`code_style_easyconfigs_string_quotes`
* :ref:`code_style_easyconfigs_file_names`

.. note:: You can check whether easyconfigs adhere to the easyconfig style rules using ``eb --check-style``.


.. _code_style_easyconfigs_max_line_length:

Maximum line length
~~~~~~~~~~~~~~~~~~~

**Each line must contain no more than 120 characters.**

If a parameter value is too long line wrapping should be used
or the value should be constructed differently.

For example, for a long ``description`` value, line wrapping can be used:

.. code:: python

  description = """A long description with multiple lines,
   that wraps around to the next line, and then continues on
   to the line after that"""

Usually, a single leading space is used on continuation lines for descriptions
that are wrapped across multiple lines.

For a long value of ``configopts``, string concatenation using '``+=```' can be used.
Do make sure to include a space either and the end of all but the last partial
value, or at the beginning of each partial value except the first one:

.. code:: python

  configopts = "--first-option --second-option --third-option "
  configopts += "--yet-another-option"

For a parameter value that is a long list, either line wrapping can be used
or each list element can be put on a separate line, see :ref:`code_style_easyconfigs_lists`.


.. _code_style_easyconfigs_whitespace:

Whitespace
~~~~~~~~~~

Whitespace (i.e., spaces, tabs) is an integral part of Python syntax,
and hence very important.

In easyconfigs specifically, all **parameter definitions must be left-aligned**,
i.e., no whitespace to the left of the names of the parameters being defined
is allowed. Not honoring this rule will result in ``SyntaxError``'s.

On top of that, a couple of additional whitespace style rules must be taken into account:

* **no tab characters used for indentation**

  * each tab must be replaced with *exactly 4 spaces*
  * see also :ref:`code_style_easyconfigs_indentation`

* **no whitespace on blank lines**
* **no multiple blank lines in a row**
* **no trailing whitespace**, i.e., no extra spaces/tabs at the end of lines
* **a single space must be included before and after an assignment operator** '``=``'
* **a single space must be included (only) after commas** ``,`` **and colons** ``:`` (*not* before)
* **no spaces directly after** ``(``, ``[`` **or** ``{`, **nor before** ``)``, ``]`` **or** ``}`` characters

In addition, a single blank line must be used to separate groups of parameter definitions
(see :ref:`code_style_easyconfigs_order_grouping`) and to aid with readability.


.. _code_style_easyconfigs_indentation:

Indentation
~~~~~~~~~~~

**Indentation must be used for list or dictionary parameter values that
are spread across multiple lines.**

Each indentation level corresponds to exactly 4 spaces; *do not use
tab characters for indentation* (see :ref:`code_style_easyconfigs_whitespace`).

For long lists, you can either put each list element on a new line and
indent with (exactly) 4 spaces,
or simply break the list across multiple lines while aligning the first list element on
each line.

Which formatting style you should for lists use depends on the length of the individual
list elements and the length of the entire list:

* short elements suggest simply breaking the list across multiple lines;
* long elements suggest one list element per line;
* long lists suggest avoiding a single element per line, to avoid consuming a lot of vertical space

In addition, a single list element per line allows for including comments for particular list elements.

With the above in mind it is difficult to prescribe strict rules for picking a formatting style for lists,
so you will need to pick one yourself (taking into account :ref:`code_style_easyconfigs_max_line_length`).

For dictionary values, it is custom to put each key-value pair on a separate line,
and to indent each line using exactly 4 spaces.

For example:

.. code:: python

  sources = [SOURCE_TAR_GZ]

  # example of list value spread across multiple lines with one element per line
  patches = [
      'fix-compilation.patch',  # patch to fix compilation problem
      'backport-bugfix.patch',  # patch to backport bug fix to this version
  ]

  # example of list value spread across multiple lines by breaking the list
  sanity_check_paths = {
      'files': ['bin/example1', 'bin/example2', 'bin/example3', 'bin/example4',
                'lib/libexample1.a', 'lib/libexample2.a'],
      'dirs': ['example_directory'],
  }

.. _code_style_easyconfigs_lists:

Formatting of lists
~~~~~~~~~~~~~~~~~~~


.. _code_style_easyconfigs_order_grouping:

Order & grouping of easyconfig parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. _code_style_easyconfigs_hardcoding:

Avoiding hardcoding of parameter values in multiple places
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. _code_style_easyconfigs_templates_constants:

Use of templates & constants
~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. _code_style_easyconfigs_string_quotes:

Single or double quotes for string values
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: This is only a recommendation, it is not strictly applied in easyconfig files.

For string values, the following rules of thumb should be taken into account
with respect to the use of single or double quotes:

* use single quotes (``'...'``) for strings representing a single character or 'word' (i.e., a string with no spaces)
* use double quotes (``"..."``) for strings that include one or more spaces
* use triple-quoting (``"""..."""``) for multi-line strings

These guidelines can be ignored if there is a technical reason for doing so,
for example if double quotes *must* be used to ensure bash expansion of environment variables
(see ``buildopts`` in the example below).

For example:

.. code:: python

  name = 'example'
  version = '1.0'

  homepage = 'http://example.com'
  description = """A long description with multiple lines,
   that wraps around to the next line"""

  toolchain = {'name': 'foss', 'version': '2017a'}

  sources = ['example-v%(version)s.tar.gz']

  configopts = "--enable-stuff --with-more-stuff --disable-other-stuff"

  buildopts = 'CC="$CC" CFLAGS="$CFLAGS"'

  moduleclass = 'tools'


.. _code_style_easyconfigs_file_names:

Easyconfig file names
~~~~~~~~~~~~~~~~~~~~~


Links
-----

Style guides that go a step beyond PEP8:
 * http://www.gramps-project.org/wiki/index.php?title=Programming_guidelines
 * http://code.google.com/p/volatility/wiki/StyleGuide

Automatic rewriting of Python code: http://pypi.python.org/pypi/PythonTidy/1.22

``pep8`` might be a useful tool to check PEP8 compliance: https://github.com/jcrocholl/pep8
