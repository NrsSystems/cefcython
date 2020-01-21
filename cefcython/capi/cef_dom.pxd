cdef extern from "include/capi/cef_dom_capi.h":
    struct _cef_domvisitor_t:
        pass

    ctypedef _cef_domvisitor_t cef_domvisitor_t
