from cefcython.capi.cef_types cimport cef_path_key_t
from cefcython.capi.cef_string cimport cef_string_t

cdef extern from "include/capi/cef_path_util_capi.h":
    cdef int cef_get_path(cef_path_key_t key, cef_string_t *path)
