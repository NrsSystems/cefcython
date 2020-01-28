cdef extern from "include/capi/cef_v8_capi.h":
    struct _cef_v8context_t:
        pass

    ctypedef _cef_v8context_t cef_v8context_t

    struct _cef_v8exception_t:
        pass

    ctypedef _cef_v8exception_t cef_v8exception_t

    struct _cef_v8handler_t:
        pass

    ctypedef _cef_v8handler_t cef_v8handler_t

    struct _cef_v8stack_trace_t:
        pass

    ctypedef _cef_v8stack_trace_t cef_v8stack_trace_t

    struct _cef_v8value_t:
        pass

    ctypedef _cef_v8value_t cef_v8value_t
