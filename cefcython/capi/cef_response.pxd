cdef extern from "include/capi/cef_response_capi.h":
    struct _cef_response_t:
        pass

    ctypedef _cef_response_t cef_response_t

    cef_response_t *cef_response_create()
