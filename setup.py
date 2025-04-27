from distutils.extension import Extension

import numpy
from Cython.Build import cythonize
from setuptools import setup

setup(
    ext_modules=cythonize(
        [
            Extension(
                "choldate._choldate",
                ["choldate/_choldate.pyx"],
                include_dirs=[numpy.get_include()],
            )
        ]
    ),
)
