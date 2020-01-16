from cefcython.capi cimport cef_base_ref_counted_t

cdef extern from "include/capi/cef_ssl_info_capi.h":
    struct _cef_sslinfo_t:
        pass

    ctypedef _cef_sslinfo_t cef_sslinfo_t
