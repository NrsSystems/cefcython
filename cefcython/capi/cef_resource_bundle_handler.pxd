cdef extern from "include/capi/cef_resource_bundle_handler_capi.h":
    struct _cef_resource_bundle_handler_t:
        pass

    ctypedef _cef_resource_bundle_handler_t cef_resource_bundle_handler_t
