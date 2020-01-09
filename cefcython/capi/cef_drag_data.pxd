cdef extern from "include/capi/cef_drag_data_capi.h":
    cdef struct _cef_drag_data_t:
        pass

    ctypedef _cef_drag_data_t cef_drag_data_t
