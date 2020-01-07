cdef extern from "include/capi/cef_request_context_capi.h":
    cdef struct _cef_request_context_t:
        pass

    ctypedef _cef_request_context_t cef_request_context_t
