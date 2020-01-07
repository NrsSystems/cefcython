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
        'capi.cef_app',
        ['capi/cef_app.pyx'],
        include_dirs=include_dirs,
    ),
    Extension(
        'capi.cef_client',
        ['capi/cef_client.pyx'],
        include_dirs=include_dirs,
    ),
    Extension(
        'capi.cef_life_span_handler',
        ['capi/cef_life_span_handler.pyx'],
        include_dirs=include_dirs,
    ),
    Extension(
        'example.app',
        ['example/app.pyx'],
        include_dirs=include_dirs,
        library_dirs=['/home/joseph/cef-cython-exp/cef_binary_79.0.10+ge866a07+chromium-79.0.3945.88_linux64/Release',
                      '/home/joseph/cef-cython-exp/cef_binary_79.0.10+ge866a07+chromium-79.0.3945.88_linux64/build/libcef_dll_wrapper'],
        libraries=['cef_dll_wrapper', 'cef'],
    ),
]

setup(
    ext_modules=cythonize(extensions)
)
