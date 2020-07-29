cdef extern from "include/capi/cef_scheme_capi.h":
    cdef struct _cef_scheme_handler_factory_t:
        pass

    cdef struct _cef_scheme_registrar_t:
        pass

    ctypedef _cef_scheme_registrar_t cef_scheme_registrar_t

    cdef struct _cef_scheme_handler_factory_t:
        pass

    ctypedef _cef_scheme_handler_factory_t cef_scheme_handler_factory_t
