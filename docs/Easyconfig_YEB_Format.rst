.. _easyconfig_yeb_format:

Writing easyconfig files with the .yeb format (in development)
===============================================================

The new easyconfig files are written in YAML_. At the moment, only very basic .yeb easyconfig files can be parsed.

.. _YAML: http://www.yaml.org/spec/1.2/spec.html

Easyconfig files in YAML
-------------------------

Take a look at the following example:
::
    %YAML 1.2
    ---
    easyblock: ConfigureMake

    name: bzip2
    version: 1.0.6

    homepage: 'http://www.bzip.org/'
    description:
        bzip2 is a freely available, patent free, high-quality data compressor. It typically
        compresses files to within 10% to 15% of the best available techniques (the PPM family of statistical
        compressors), whilst being around twice as fast at compression and six times faster at decompression.

    toolchain: {name: GCC, version: 4.9.2}
    toolchainopts: {pic: True}

    sources:
        - \*SOURCE_TAR_GZ
    source_urls:
        - http://www.bzip.org/%(version)s

    moduleclass: tools

YAML header
-----------
The file starts with a standard YAML header. The first line declares the YAML version (the newest version is 1.2 and
dates from 2009).
The header is optional, but we recommend including it.
::
    %YAML 1.2
    ---

YAML Syntax
-----------
Easyconfig parameters are represented using ``key: value``. Note that quotes aren't needed here, as opposed to the .eb
format, except when the value contains special characters. You can still use dictionaries with curly brackets ``{}``.
Lists use standard YAML syntax:
::
    key:
        - value1
        - value2
        - ...

Easyconfig constants
--------------------
Easyconfig constants are still useable like before, but they now need to be marked with an asterisk,
like in this example,``*SOURCE_TAR_GZ``.
