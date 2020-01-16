cdef extern from "include/capi/cef_x509_certificate_capi.h":
    struct _cef_x509cert_principal_t:
        pass

    ctypedef _cef_x509cert_principal_t cef_x509cert_principal_t

    struct _cef_x509certificate_t:
        pass

    ctypedef _cef_x509certificate_t cef_x509certificate_t
