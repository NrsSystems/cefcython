from cefcython.capi.cef_string cimport cef_string_t

from libc.stddef cimport size_t

cdef extern from "include/internal/cef_string_list.h":
    ctypedef void *cef_string_list_t
    cef_string_list_t cef_string_list_alloc()
    size_t cef_string_list_size(cef_string_list_t self)
    int cef_string_list_value(cef_string_list_t self,
                              size_t index,
                              cef_string_t* value)
    void cef_string_list_append(cef_string_list_t self, const cef_string_t* value)
    void cef_string_list_clear(cef_string_list_t self)
    void cef_string_list_free(cef_string_list_t self)
    cef_string_list_t cef_string_list_copy(cef_string_list_t self)
