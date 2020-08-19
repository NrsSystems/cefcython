cdef extern from "include/capi/cef_browser_process_handler_capi.h":
    struct _cef_browser_process_handler_t:
        pass

    ctypedef _cef_browser_process_handler_t cef_browser_process_handler_t
