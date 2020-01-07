from cpython.mem cimport PyMem_RawMalloc, PyMem_RawFree

cdef extern from "Python.h":
    char *PyUnicode_AsUTF8(object unicode)

cdef char **to_cstring_array(str_list):
    cdef char **ret = <char **>PyMem_RawMalloc(len(str_list) * sizeof(char *))
    if not ret:
        raise MemoryError()

    for i in range(len(str_list)):
        ret[i] = PyUnicode_AsUTF8(str_list[i])
    return ret

