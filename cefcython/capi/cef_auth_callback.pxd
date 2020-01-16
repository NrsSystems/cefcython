from cefcython.capi cimport (cef_base_ref_counted_t,
                             cef_string_t)

cdef extern from "include/capi/cef_auth_callback_capi.h":
    struct _cef_auth_callback_t:
        cef_base_ref_counted_t base

        void (* cont)(_cef_auth_callback_t *self,
                      const cef_string_t *username,
                      const cef_string_t *password)

        void (* cancel)(_cef_auth_callback_t *self)

    ctypedef _cef_auth_callback_t cef_auth_callback_t
