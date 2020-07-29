cdef extern from "include/capi/cef_callback_capi.h":
    cdef struct _cef_callback_t:
        pass

    ctypedef _cef_callback_t cef_callback_t

    cdef struct _cef_completion_callback_t:
        pass

    ctypedef _cef_completion_callback_t cef_completion_callback_t
