cdef extern from "include/capi/cef_values_capi.h":
    struct _cef_dictionary_value_t:
        pass

    ctypedef _cef_dictionary_value_t cef_dictionary_value_t

    struct _cef_list_value_t:
        pass

    ctypedef _cef_list_value_t cef_list_value_t
