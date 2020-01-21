from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_string cimport cef_string_t

cdef extern from "include/capi/cef_string_visitor_capi.h":
    struct _cef_string_visitor_t:
        cef_base_ref_counted_t base

        void (* visit)(_cef_string_visitor_t *self,
                       const cef_string_t *string)

    ctypedef _cef_string_visitor_t cef_string_visitor_t
