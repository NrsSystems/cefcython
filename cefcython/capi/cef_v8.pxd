cdef extern from "include/capi/cef_v8_capi.h":
    struct _cef_v8context_t:
        pass

    ctypedef _cef_v8context_t cef_v8context_t


