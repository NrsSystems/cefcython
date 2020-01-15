from libc.stddef cimport size_t

cdef extern from "include/internal/cef_string_types.h":
    cdef struct _cef_string_utf16_t:
        pass

    ctypedef _cef_string_utf16_t cef_string_utf16_t
    ctypedef cef_string_utf16_t *cef_string_userfree_utf16_t

cdef extern from "include/internal/cef_string.h":
    ctypedef _cef_string_utf16_t cef_string_t
    ctypedef cef_string_userfree_utf16_t cef_string_userfree_t

    int cef_string_utf8_to_utf16(const char *src,
                                 size_t src_len,
                                 cef_string_utf16_t *output)
