cdef extern from "include/capi/cef_navigation_entry_capi.h":
    cdef struct _cef_navigation_entry_t:
        pass

    ctypedef _cef_navigation_entry_t cef_navigation_entry_t
