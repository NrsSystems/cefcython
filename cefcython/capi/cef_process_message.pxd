cdef extern from "include/capi/cef_process_message_capi.h":
    struct _cef_process_message_t:
        pass

    ctypedef _cef_process_message_t cef_process_message_t
