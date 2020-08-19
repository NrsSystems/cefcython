from cefcython.capi.cef_base cimport cef_base_ref_counted_t

cdef extern from "include/capi/cef_request_callback_capi.h":
    struct _cef_request_callback_t:
        cef_base_ref_counted_t base
        void (* cont)(_cef_request_callback_t *self, int allow)
        void (* cancel)(_cef_request_callback_t *self)

    ctypedef _cef_request_callback_t cef_request_callback_t
