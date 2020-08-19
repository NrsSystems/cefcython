cdef extern from "include/capi/cef_print_handler_capi.h":
    struct _cef_print_dialog_callback_t:
        pass

    ctypedef _cef_print_dialog_callback_t cef_print_dialog_callback_t

    struct _cef_print_job_callback_t:
        pass

    ctypedef _cef_print_job_callback_t cef_print_job_callback_t

    struct _cef_print_handler_t:
        pass

    ctypedef _cef_print_handler_t cef_print_handler_t
