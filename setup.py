from distutils.core import Command
from distutils.command.build import build
from setuptools import setup, find_packages
from setuptools.extension import Extension

from Cython.Build import cythonize

import os
import subprocess

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

class BuildSubprocessCommand(Command):
    def initialize_options(self):
        self.build_lib = None
        self.build_temp = None
        self.force = None

    def finalize_options(self):
        self.set_undefined_options('build',
                                   ('build_lib', 'build_lib'),
                                   ('build_temp', 'build_temp'),
                                   ('force', 'force'))

    def copy_src(self):
        self.copy_tree('src', os.path.join(self.build_temp, 'src'))

    def build(self):
        subprocess_dir = os.path.join(self.build_temp, os.path.join('src', 'subprocess'))
        cmd = ['make', '-C', subprocess_dir, 'CEF_INCLUDE={}'.format(ROOT_DIR)]
        if self.force:
            cmd += ['clean', 'all']
        subprocess.check_call(cmd)
        self.copy_file(os.path.join(subprocess_dir, 'subprocess'),
                       os.path.join(self.build_lib, os.path.join('cefcython', 'subprocess')))

    def run(self):
        self.copy_src()
        self.build()

class BuildCommand(build):
    def run(self):
        build.run(self)
        self.run_command('build_subprocess')

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
    cmdclass={
        'build': BuildCommand,
        'build_subprocess': BuildSubprocessCommand,
    }
)
