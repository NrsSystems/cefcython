from libc.stddef cimport wchar_t

cdef extern from "include/internal/cef_string_types.h":
    ctypedef wchar_t char16

    cdef struct _cef_string_wide_t:
        wchar_t *str
        size_t length
        void (* dtor)(wchar_t *str)

    ctypedef _cef_string_wide_t cef_string_wide_t

    cdef struct _cef_string_utf8_t:
        char *str
        size_t length
        void (* dtor)(char *str)

    ctypedef _cef_string_utf8_t cef_string_utf8_t

    cdef struct _cef_string_utf16_t:
        char16 *str
        size_t length
        void (* dtor)(char16 *str)

    ctypedef _cef_string_utf16_t cef_string_utf16_t

    ctypedef cef_string_wide_t *cef_string_userfree_wide_t
    ctypedef cef_string_utf8_t *cef_string_userfree_utf8_t
    ctypedef cef_string_utf16_t *cef_string_userfree_utf16_t
