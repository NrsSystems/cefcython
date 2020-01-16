cdef extern from "include/capi/cef_response_filter_capi.h":
    struct _cef_response_filter_t:
        pass

    ctypedef _cef_response_filter_t cef_response_filter_t
