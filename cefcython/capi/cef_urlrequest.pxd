cdef extern from "include/capi/cef_urlrequest_capi.h":
    struct _cef_urlrequest_t:
        pass

    ctypedef _cef_urlrequest_t cef_urlrequest_t

    struct _cef_urlrequest_client_t:
        pass

    ctypedef _cef_urlrequest_client_t cef_urlrequest_client_t
