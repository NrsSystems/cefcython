from libc.stddef cimport size_t

from cefcython.capi.cef_string_types cimport (_cef_string_utf16_t,
                                              cef_string_utf8_t,
                                              cef_string_utf16_t,
                                              cef_string_userfree_utf16_t,
                                              char16)

cdef extern from "include/internal/cef_string.h":
    ctypedef _cef_string_utf16_t cef_string_t
    ctypedef cef_string_userfree_utf16_t cef_string_userfree_t

    int cef_string_utf8_to_utf16(const char *src,
                                 size_t src_len,
                                 cef_string_utf16_t *output)

    int cef_string_utf16_to_utf8(const char16 *src,
                                 size_t src_len,
                                 cef_string_utf8_t *output)
