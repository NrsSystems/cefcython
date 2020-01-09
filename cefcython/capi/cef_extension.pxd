cdef extern from "include/capi/cef_extension_capi.h":
    cdef struct _cef_extension_t:
        pass

    ctypedef _cef_extension_t cef_extension_t
