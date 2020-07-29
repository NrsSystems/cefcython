cdef extern from "include/capi/cef_cookie_capi.h":
    cdef struct _cef_cookie_manager_t:
        pass

    ctypedef _cef_cookie_manager_t cef_cookie_manager_t
