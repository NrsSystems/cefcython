cdef extern from "include/capi/cef_values_capi.h":
    struct _cef_dictionary_value_t:
        pass

    ctypedef _cef_dictionary_value_t cef_dictionary_value_t
