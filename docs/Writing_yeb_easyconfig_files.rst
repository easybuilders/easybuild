.. _easyconfig_yeb_format:

Writing easyconfig files in YAML syntax (``.yeb`` format) **[IN DEVELOPMENT]**
==============================================================================

.. note::
    Because support for easyconfig files in YAML syntax (a.k.a. ``.yeb`` files) is still *in development*,
    using them currently requires enabling the use of experimental features (``--experimental``),
    see also :ref:`experimental_features` .

    An up-to-date overview of current progress on support for ``.yeb`` easyconfigs is available at
    https://github.com/hpcugent/easybuild-framework/issues/1407.

Useful links:

* YAML syntax specification: http://www.yaml.org/spec/1.2/spec.html

.. contents::
    :depth: 3
    :backlinks: none

.. _easyconfig_yeb_format_syntax:

Syntax
------

.. _easyconfig_yeb_format_syntax_YAML_header:

YAML header (optional)
~~~~~~~~~~~~~~~~~~~~~~

Easyconfig files in YAML syntax can start with a standard YAML header.

It consists of two lines:

* a line with a '``%YAML``' *directive* which also indicates the YAML version being used
  (the latest YAML version is 1.2, and dates from 2009);
* followed by a *document marker* line '``---``' (which is used to separate directives from content)

For example::

    %YAML 1.2
    ---

This header is optional, but we recommend including it; one advantage is that editor will use proper syntax
highlighting for YAML when the ``%YAML`` directory is included.

.. _easyconfig_yeb_format_syntax_comments:

Comments
~~~~~~~~

Comments can be included anywhere, and are prefixed with a hash character ``#``::

    # this is a comment

.. _internal_variables_yaml:

Internal variables
~~~~~~~~~~~~~~~~~~

Variables can be defined using standard YAML anchors (using a '&'). These are later referenced using an asterisk (*).
Example::
    _internal_variables:
        - &name foo_name
        - &version 1.2.3

    example_key: [*name, *version]  # will return [foo_name, 1.2.3]

To concat strings and variables, or multiple variables together, use the !join operator
(See `Concatenating strings and/or variables`_)

.. _string_concatenation:

Concatenating strings and/or variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As string concatenation is not supported in YAML, we defined a !join operator. It takes a list of values to concatenate
as argument. This list can contain both hard strings and variables.
Example::

    !join [foo, bar]  # returns 'foobar'
    vars:
        - &f foo
        - &b bar
    !join [*f, bar]  # returns 'foobar'
    !join [*f, *b]  # returns 'foobar'


.. _easyconfig_yeb_format_syntax_easyconfig_parameters:

Easyconfig parameter values
~~~~~~~~~~~~~~~~~~~~~~~~~~~

To define an easyconfig parameter, simply use ``<key>: <value>`` (i.e., use a colon ``:`` as a separator).

In YAML terminology, an easyconfig file is expressed as a *mapping*, with easyconfig parameters as keys.

Three types of values (*nodes*) are supported: *scalars* (strings, integers), *sequences* (lists) and *mappings*
(dictionaries).

Scalar values
#############

Using scalar values is straight-forward, no special syntax is required.

For string values, no quotes must be used (in general).
However, quotes are sometimes required to escape characters that have special meaning in YAML (like '``:``').
It's worth noting that there's a subtle difference between using single and double quotes, see
`Flow Scalar Styles <http://www.yaml.org/spec/1.2/spec.html#id2786942>`_.

Examples::

    name: gzip
    version: 1.6

    # single quotes are required for string values representing URLs, to escape the ':'
    homepage: 'http://www.gnu.org/software/gzip/'

    parallel: 1

Multiline strings can be expressed using indentation::

    description:
        gzip is a popular data compression program
        as a replacement for compress

Sequences
#########

Sequence values (a.k.a. lists) can be expressed in different ways, depending on their size.

If there are a limited number of (short) entries the value can be expressed on a single line,
using square brackets '``[``' '``]``' and with comma '``,``' as separator.

Example::

    # quotes are required to escape the ':'
    source_urls: ['http://ftpmirror.gnu.org/gzip/', 'ftp://ftp.gnu.org/gnu/gzip/']

Alternatively indentation can be used for scope, with each entry on its own line,
indicated with a dash and a space ``- ``.

Example::

    # no quotes required here, since there's no ambiguity w.r.t. ':'
    source_urls:
        - http://ftpmirror.gnu.org/gzip/
        - http://ftp.gnu.org/gnu/gzip/
        - ftp://ftp.gnu.org/gnu/gzip/

Mappings
########

Mapping values (a.k.a. dictionaries) are expressed using a colon '``:``' and space as key-value separator,
a comma '``,``' to key-value pairs, and curly braces '``{``' '``}``' to mark the start/end.

For example::

    toolchain: {name: intel, version: 2015b}

Nesting
#######

Different types of values can be nested.

For example, sequence values can be used in a mapping::

    sanity_check_paths: {
        files: [bin/gunzip, bin/gzip, bin/uncompress],
        dirs: [],
    }


.. _easyconfig_yeb_format_syntax_template_values_constants:

Templates values and constants
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Template values can be specified as a part of string values, using ``%(template_name)``.

Template constants are injected by the easyconfig ``.yeb`` parser as *node anchors*,
and can be referred to with an *alias node*, i.e. using an asterisk ``*``.

For example::

    source_urls: [*GNU_SOURCE]
    sources: ['%(name)s-%(version)s.tar.gz']  # equivalent with [*SOURCE_TAR_GZ]

See also :ref:`easyconfig_param_templates`.

.. _easyconfig_yeb_format_syntax_dependencies:

Dependencies
~~~~~~~~~~~~

*(WORK IN PROGRESS)*

.. _easyconfig_yeb_format_examples:

Examples
--------

gzip v1.6 with ``GCC/4.9.2`` toolchain
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    %YAML 1.2
    ---
    easyblock: ConfigureMake

    name: gzip
    version: 1.6

    homepage: 'http://www.gnu.org/software/gzip/'
    description:
        gzip is a popular data compression program
        as a replacement for compress

    toolchain: {name: GCC, version: 4.9.2}

    # http://ftp.gnu.org/gnu/gzip/gzip-1.6.tar.gz
    source_urls: [*GNU_SOURCE]
    sources: [%(name)s-%(version)s.tar.gz]

    # make sure the gzip, gunzip and compress binaries are available after installation
    sanity_check_paths: {
        files: [bin/gunzip, bin/gzip, bin/uncompress],
        dirs: [],
    }

    moduleclass: tools
