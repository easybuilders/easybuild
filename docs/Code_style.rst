
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


Notes
~~~~~

Style guides that go a step beyond PEP8:
 * http://www.gramps-project.org/wiki/index.php?title=Programming_guidelines
 * http://code.google.com/p/volatility/wiki/StyleGuide

Automatic rewriting of Python code: http://pypi.python.org/pypi/PythonTidy/1.22

``pep8`` might be a useful tool to check PEP8 compliance: https://github.com/jcrocholl/pep8
