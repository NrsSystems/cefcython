cdef extern from "include/capi/cef_extension_handler_capi.h":
    cdef struct _cef_get_extension_resource_callback_t:
        pass

    ctypedef _cef_get_extension_resource_callback_t cef_get_extension_resource_callback_t

    cdef struct _cef_extension_handler_t:
        pass

    ctypedef _cef_extension_handler_t cef_extension_handler_t
