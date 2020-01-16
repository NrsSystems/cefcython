cdef extern from "include/capi/cef_resource_handler_capi.h":
    struct _cef_resource_skip_callback_t:
        pass

    ctypedef _cef_resource_skip_callback_t cef_resource_skip_callback_t

    struct _cef_resource_read_callback_t:
        pass

    ctypedef _cef_resource_read_callback_t cef_resource_read_callback_t

    struct _cef_resource_handler_t:
        pass

    ctypedef cef_resource_handler_t
