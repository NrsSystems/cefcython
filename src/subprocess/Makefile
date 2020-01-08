PYTHON := python
PYVERSION := $(shell $(PYTHON) -c "import sys; print(sys.version[:3])")
PYPREFIX := $(shell $(PYTHON) -c "import sys; print(sys.prefix)")

INCDIR := $(shell $(PYTHON) -c "from distutils import sysconfig; print(sysconfig.get_python_inc())")
PLATINCDIR := $(shell $(PYTHON) -c "from distutils import sysconfig; print(sysconfig.get_python_inc(plat_specific=True))")
LIBDIR1 := $(shell $(PYTHON) -c "from distutils import sysconfig; print(sysconfig.get_config_var('LIBDIR'))")
LIBDIR2 := $(shell $(PYTHON) -c "from distutils import sysconfig; print(sysconfig.get_config_var('LIBPL'))")
PYLIB := $(shell $(PYTHON) -c "from distutils import sysconfig; print(sysconfig.get_config_var('LIBRARY')[3:-2])")

CC := $(shell $(PYTHON) -c "import distutils.sysconfig; print(distutils.sysconfig.get_config_var('CC'))")
LINKCC := $(shell $(PYTHON) -c "import distutils.sysconfig; print(distutils.sysconfig.get_config_var('LINKCC'))")
LINKFORSHARED := $(shell $(PYTHON) -c "import distutils.sysconfig; print(distutils.sysconfig.get_config_var('LINKFORSHARED'))")
LIBS := $(shell $(PYTHON) -c "import distutils.sysconfig; print(distutils.sysconfig.get_config_var('LIBS'))")
SYSLIBS := $(shell $(PYTHON) -c "import distutils.sysconfig; print(distutils.sysconfig.get_config_var('SYSLIBS'))")

CEF_INCLUDE := ../../
CEF_LIBS :=  -lX11 -lcef -lcef_dll_wrapper
CEF_DIR := /home/joseph/cef-cython-exp/cef_binary_79.0.10+ge866a07+chromium-79.0.3945.88_linux64/
CEF_LIB_DIR := -L$(CEF_DIR)/Release -L$(CEF_DIR)/build/libcef_dll_wrapper 
LFLAGS := -Wl,-rpath,'$$ORIGIN/cef/'

subprocess: subprocess.o
	$(LINKCC) -o $@ $^ -L$(LIBDIR1) -L$(LIBDIR2) $(CEF_LIB_DIR) -l$(PYLIB) $(LIBS) $(SYSLIBS) $(LINKFORSHARED) $(CEF_LIBS) $(LFLAGS)

subprocess.o: subprocess.c
	$(CC) -c $^ -I$(INCDIR) -I$(PLATINCDIR) -I$(CEF_INCLUDE)

CYTHON := cython
subprocess.c: subprocess.pyx
	$(CYTHON) --embed subprocess.pyx

all: subprocess

clean:
	@rm -f *~ *.o *.so core core.* *.c subprocess
