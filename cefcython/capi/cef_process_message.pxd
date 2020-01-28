from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_string cimport cef_string_t, cef_string_userfree_t
from cefcython.capi.cef_values cimport _cef_list_value_t

cdef extern from "include/capi/cef_process_message_capi.h":
    struct _cef_process_message_t:
        cef_base_ref_counted_t base

        int (* is_valid)(_cef_process_message_t *self)
        int (* is_read_only)(_cef_process_message_t *self)
        _cef_process_message_t *(* copy)(_cef_process_message_t *self)
        cef_string_userfree_t (* get_name)(_cef_process_message_t *self)
        _cef_list_value_t *(* get_argument_list)(_cef_process_message_t *self)

    ctypedef _cef_process_message_t cef_process_message_t

    cef_process_message_t *cef_process_message_create(const cef_string_t *name)
