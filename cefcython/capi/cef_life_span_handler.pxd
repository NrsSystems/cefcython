from libc.stddef cimport size_t

cdef extern from "include/capi/cef_base_capi.h":
    cdef struct _cef_base_ref_counted_t:
        size_t size

    ctypedef _cef_base_ref_counted_t cef_base_ref_counted_t

cdef extern from "include/capi/cef_app_capi.h":
    cdef void cef_quit_message_loop()

cdef extern from "include/capi/cef_life_span_handler_capi.h":
    cdef struct _cef_browser_t:
        pass

    cdef struct _cef_life_span_handler_t:
        cef_base_ref_counted_t base

    ctypedef _cef_life_span_handler_t cef_life_span_handler_t

cdef extern void on_before_close(
        _cef_life_span_handler_t *self,
        _cef_browser_t *browser)

cdef extern void initialize_cef_life_span_handler(cef_life_span_handler_t *handler)
