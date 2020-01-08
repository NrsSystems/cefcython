from distutils.core import setup
from distutils.extension import Extension

from Cython.Build import cythonize

import os
ROOT_DIR = os.path.abspath(os.path.dirname(__file__))

include_dirs=[
    ROOT_DIR,
]

extensions = [
    Extension(
        'cefcython.capi.*',
        ['cefcython/capi/*.pyx'],
        include_dirs=include_dirs,
    ),
    Extension(
        'cefcython.util.*',
        ['cefcython/util/*.pyx'],
        include_dirs=include_dirs,
    ),
]

package_data={
    'cefcython.capi': ['*.pxd'],
    'cefcython.util': ['*.pxd'],
}

setup(
    package_data=package_data,
    ext_modules=cythonize(extensions),
)
