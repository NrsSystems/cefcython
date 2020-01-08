from setuptools import setup, find_packages
from setuptools.extension import Extension

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

from cefcython import __version__ as version

setup(
    name='cefcython',
    version=version,
    author='Joseph Kogut',
    author_email='joseph.kogut@gmail.com',
    description='Cython bindings for CEF',
    install_requires=['cython'],
    packages=find_packages(),
    package_data=package_data,
    ext_modules=cythonize(extensions),
    zip_safe=False,
)
