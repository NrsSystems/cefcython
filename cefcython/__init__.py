__version__ = '80.1.4'

import os

PACKAGE_DIR = os.path.abspath(os.path.dirname(__file__))

def get_module_dir():
    return os.path.join(PACKAGE_DIR, 'cef')

def get_include_dirs():
    return [os.path.join(PACKAGE_DIR, 'build')]

def get_lib_dirs():
    return [get_module_dir()]

def get_libs():
    return ['cef', 'X11']

def get_cflags():
    return ' -I'.join([''] + get_include_dirs())

def get_ldflags():
    return ' -L'.join([''] + get_lib_dirs()) + ' -l'.join([''] + get_libs())

def get_lflags():
    return ' -Wl,-rpath,{}'.format(os.path.join(PACKAGE_DIR, 'cef'))
