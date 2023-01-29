# -*- coding: utf-8 -*-
#
# EasyBuild-docs documentation build configuration file
#
# This file is execfile()d with the current directory set to its containing dir.
#
# The contents of this file are pickled, so don't put values in the namespace
# that aren't pickleable (module imports are okay, they're removed automatically).
#
# All configuration values have a default value; values that are commented out
# serve to show the default value.

import os

# If your extensions are in another directory, add it here. If the directory
# is relative to the documentation root, use os.path.abspath to make it
# absolute, like shown here.
# sys.path.append(os.path.abspath('some/directory'))

# General configuration
# ---------------------

# Add any Sphinx extension module names here, as strings. They can be extensions
# coming with Sphinx (named 'sphinx.ext.*') or your custom ones.
extensions = [
    'sphinx.ext.autodoc',
    'sphinx_reredirects',
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['.templates']

# The suffix of source filenames.
source_suffix = '.rst'

# The master toctree document.
master_doc = 'index'

# General substitutions.
project = 'EasyBuild'
copyright = '2012-2023, Ghent University, CC-BY-SA'

# The default replacements for |version| and |release|, also used in various
# other places throughout the built documents.
#
# The short X.Y version.
version = '4.7.0'  # this is meant to reference the version of EasyBuild
# The full version, including alpha/beta/rc tags.
release = '20230123.0'  # this is meant to reference the version of the documentation itself

# There are two options for replacing |today|: either, you set today to some
# non-false value, then it is used:
# today = ''
# Else, today_fmt is used as the format for a strftime call.
today_fmt = '%a, %d %b %Y %H:%M:%S'  # e.g., Mon, 03 Nov 2014 22:14:42

# List of documents that shouldn't be included in the build.
# unused_docs = []

# List of directories, relative to source directories, that shouldn't be searched
# for source files.
# exclude_dirs = []

# The reST default role (used for this markup: `text`) to use for all documents.
# default_role = None

# If true, '()' will be appended to :func: etc. cross-reference text.
# add_function_parentheses = True

# If true, the current module name will be prepended to all description
# unit titles (such as .. function::).
# add_module_names = True

# If true, sectionauthor and moduleauthor directives will be shown in the
# output. They are ignored by default.
# show_authors = False

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# don't use (Python) highlighting by default
highlight_language = 'none'

# Options for HTML output
# -----------------------

# The style sheet to use for HTML and HTML Help pages. A file of that name
# must exist either in Sphinx' static/ path, or in one of the custom paths
# given in html_static_path.
# html_style = 'default.css'
on_rtd = os.environ.get('READTHEDOCS', None) == 'True'
if on_rtd:
    html_theme = 'nature'
else:
    html_theme = 'default'

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = "EasyBuild documentation has moved to https://docs.easybuild.io"

html_baseurl = 'https://docs.easybuild.io'

# A shorter title for the navigation bar.  Default is the same as html_title.
# html_short_title = None

# The name of an image file (within the static path) to place at the top of
# the sidebar.
# html_logo = None

html_logo = 'easybuild_logo_alpha.png'

# The name of an image file (within the static path) to use as favicon of the
# docs.  This file should be a Windows icon file (.ico) being 16x16 or 32x32
# pixels large.
# html_favicon = None

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['.static']

# If not '', a 'Last updated on:' timestamp is inserted at every page bottom,
# using the given strftime format.
html_last_updated_fmt = '%a %d %b %Y'

# If true, SmartyPants will be used to convert quotes and dashes to
# typographically correct entities.
# html_use_smartypants = True

# Custom sidebar templates, maps document names to template names.
# html_sidebars = {}

html_sidebars = {
    '**': ['searchbox.html', 'globaltoc.html', 'sourcelink.html'],
    'using/windows': ['searchbox.html', 'windowssidebar.html'],
}

# Additional templates that should be rendered to pages, maps page names to
# template names.
# html_additional_pages = {}

# If false, no module index is generated.
# html_use_modindex = True
html_use_modindex = False

# If false, no index is generated.
# html_use_index = True
html_use_index = False

# If true, the index is split into individual pages for each letter.
# html_split_index = False

# If true, the reST sources are included in the HTML build as _sources/<name>.
# html_copy_source = True

# If true, an OpenSearch description file will be output, and all pages will
# contain a <link> tag referring to it.  The value of this option must be the
# base URL from which the finished HTML is served.
# html_use_opensearch = ''

# If nonempty, this is the file name suffix for HTML files (e.g. ".xhtml").
# html_file_suffix = ''

# Output file base name for HTML help builder.
htmlhelp_basename = 'easyBuild_docs'


# Options for LaTeX output
# ------------------------

# The paper size ('letter' or 'a4').
# latex_paper_size = 'letter'
latex_paper_size = 'a4'

# The font size ('10pt', '11pt' or '12pt').
# latex_font_size = '10pt'

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, document class [howto/manual]).
latex_documents = [
    ('index', 'easybuild.tex', 'EasyBuild Documentation',
     'Ghent University', 'manual'),
]

# The name of an image file (relative to this directory) to place at the top of
# the title page.
# latex_logo = None

# For "manual" documents, if this is true, then toplevel headings are parts,
# not chapters.
# latex_use_parts = False

# Additional stuff for the LaTeX preamble.
# latex_preamble = ''

# Documents to append as an appendix to all manuals.
# latex_appendices = []

# If false, no module index is generated.
# latex_use_modindex = True

# automatically redirect all pages to new location;
# see https://documatt.gitlab.io/sphinx-reredirects/usage.html
redirects = {
    "api/*": "https://docs.easybuild.io/api/easybuild/",
    "Archived-easyconfigs": "https://docs.easybuild.io/archived-easyconfigs",
    "Backup_modules": "https://docs.easybuild.io/backup-modules",
    "Changelog": "https://docs.easybuild.io/changelog-docs",
    "Code_style": "https://docs.easybuild.io/code-style",
    "Common-toolchains": "https://docs.easybuild.io/common-toolchains",
    "Concepts_and_Terminology": "https://docs.easybuild.io/terminology",
    "Configuration": "https://docs.easybuild.io/configuration",
    "Configuration_Legacy": "https://docs.easybuild.io/legacy/configuration",
    "Containers": "https://docs.easybuild.io/containers",
    "Contributing": "https://docs.easybuild.io/contributing",
    "Controlling_compiler_optimization_flags": "https://docs.easybuild.io/controlling-compiler-optimization-flags",
    "Cray-support": "https://docs.easybuild.io/cray-support",
    "demos/bootstrapping": "https://docs.easybuild.io/installation",
    "demos/configuring": "https://docs.easybuild.io/demos/configuring",
    "demos/index": "https://docs.easybuild.io/demos",
    "demos/review_pr": "https://docs.easybuild.iodemos/review-pr",
    "Deprecated-easyconfigs": "https://docs.easybuild.io/deprecated-easyconfigs",
    "Deprecated-functionality": "https://docs.easybuild.io/deprecated-functionality",
    "Detecting_loaded_modules": "https://docs.easybuild.io/detecting-loaded-modules",
    "EasyBuild4-overview-of-changes": "https://docs.easybuild.io/easybuild-v4/overview-of-changes",
    "EasyBuild4-overview-relocated-functions-constants": "https://docs.easybuild.io/easybuild-v4/overview-relocated-functions-constants",
    "Easyconfig-files-local-variables": "https://docs.easybuild.io/easyconfig-files-local-variables",
    "Easyconfigs_index": "https://docs.easybuild.io/easyconfigs-search-index",
    "Easystack-files": "https://docs.easybuild.io/easystack-files",
    "eb_a": "https://docs.easybuild.io/using-easybuild/#all-available-easyconfig-parameters",
    "eb_a_e_EB_WRF": "https://docs.easybuild.io/using-easybuild/#eb_a_e_EB_WRF",
    "eb_help": "https://docs.easybuild.io/version-specific/eb-help",
    "eb_list_easyblocks": "https://docs.easybuild.io/version-specific/easyblocks",
    "eb_list_toolchains": "https://docs.easybuild.io/version-specific/toolchains",
    "Experimental_features": "https://docs.easybuild.io/experimental-features",
    "Extended_dry_run": "https://docs.easybuild.io/extended-dry-run",
    "Extended_dry_run_examples": "https://docs.easybuild.io/extended-dry-run/#extended_dry_run_examples",
    "Hooks": "https://docs.easybuild.io/hooks",
    "Implementing-easyblocks": "https://docs.easybuild.io/implementing-easyblocks",
    "Including_additional_Python_modules": "https://docs.easybuild.io/including-additional-python-modules",
    "Installation": "https://docs.easybuild.io/installation",
    "Installation_Alternative": "https://docs.easybuild.io/installation-alternative",
    "Installing-environment-modules-without-root-permissions": "https://docs.easybuild.io/installing-environment-modules-without-root-permissions",
    "Installing_extensions_in_parallel": "https://docs.easybuild.io/installing-extensions-in-parallel",
    "Installing-Lmod-without-root-permissions": "https://docs.easybuild.io/installing-lmod-without-root-permissions",
    "Integration_with_GitHub": "https://docs.easybuild.io/integration-with-github",
    "Introduction": "https://docs.easybuild.io/what-is-easybuild",
    "Locks": "https://docs.easybuild.io/locks",
    "Logfiles": "https://docs.easybuild.io/log-files",
    "Maintainers": "https://docs.easybuild.io/maintainers",
    "Manipulating_dependencies": "https://docs.easybuild.io/manipulating-dependencies",
    "Packaging_support": "https://docs.easybuild.io/packaging-support",
    "Partial_installations": "https://docs.easybuild.io/partial-installations",
    "Progress_bars": "https://docs.easybuild.io/progress-bars",
    "Python-2-3-compatibility": "https://docs.easybuild.io/python-2-3-compatibility",
    "Release_notes": "https://docs.easybuild.io/release-notes",
    "Removed-functionality": "https://docs.easybuild.io/removed-functionality",
    "RPATH-support": "https://docs.easybuild.io/rpath-support",
    "Submitting_jobs": "https://docs.easybuild.io/submitting-jobs",
    "System_toolchain": "https://docs.easybuild.io/system-toolchain",
    "Tracing_progress": "https://docs.easybuild.io/tracing-progress",
    "Typical_workflow_example_with_WRF": "https://docs.easybuild.io/typical-workflow-example-with-wrf/",
    "Unit-tests": "https://docs.easybuild.io/unit-tests",
    "Useful_links": "https://docs.easybuild.io",
    "Useful-scripts": "https://docs.easybuild.io/useful-scripts",
    "Using_external_modules": "https://docs.easybuild.io/using-external-modules",
    "Using_the_EasyBuild_command_line": "https://docs.easybuild.io/using-easybuild",
    "version-specific/config_file_constants": "https://docs.easybuild.io/version-specific/config-file-constants",
    "version-specific/easyblocks": "https://docs.easybuild.io/version-specific/easyblocks",
    "version-specific/easyconfig_constants": "https://docs.easybuild.io/version-specific/easyconfig-constants",
    "version-specific/easyconfig_license_constants": "https://docs.easybuild.io/version-specific/easyconfig-license-constants",
    "version-specific/easyconfig_parameters": "https://docs.easybuild.io/version-specific/easyconfig-parameters",
    "version-specific/easyconfig_templates": "https://docs.easybuild.io/version-specific/easyconfig-templates",
    "version-specific/generic_easyblocks": "https://docs.easybuild.io/version-specific/generic-easyblocks",
    "version-specific/help": "https://docs.easybuild.io/version-specific/eb-help",
    "version-specific/Supported_software": "https://docs.easybuild.io/version-specific/supported-software",
    "version-specific/toolchain_opts": "https://docs.easybuild.io/version-specific/toolchain-opts",
    "version-specific/toolchains": "https://docs.easybuild.io/version-specific/toolchains",
    "Wrapping_dependencies": "https://docs.easybuild.io/wrapping-dependencies",
    "Writing_easyconfig_files": "https://docs.easybuild.io/writing-easyconfig-files",
    "Writing_yeb_easyconfig_files": "https://docs.easybuild.io/writing-yeb-easyconfig-files",
}
