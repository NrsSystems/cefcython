from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_string cimport cef_string_t, cef_string_userfree_t
from cefcython.capi.cef_string_list cimport cef_string_list_t
from cefcython.capi.cef_types cimport cef_value_type_t

from libc.stddef cimport size_t

cdef extern from "include/capi/cef_values_capi.h":
    struct _cef_binary_value_t
    struct _cef_dictionary_value_t
    struct _cef_list_value_t

    struct _cef_value_t:
        cef_base_ref_counted_t base

        int (* is_valid)(_cef_value_t *self)
        int (* is_owned)(_cef_value_t *self)
        int (* is_read_only)(_cef_value_t *self)
        int (* is_same)(_cef_value_t *self)
        int (* is_equal)(_cef_value_t *self)
        _cef_value_t *(* copy)(_cef_value_t *self)
        cef_value_type_t (* get_type)(_cef_value_t *self)
        int (* get_bool)(_cef_value_t *self)
        int (* get_int)(_cef_value_t *self)
        double (* get_double)(_cef_value_t *self)
        cef_string_userfree_t (* get_string)(_cef_value_t *self)
        _cef_binary_value_t *(* get_binary)(_cef_value_t *self)
        _cef_dictionary_value_t *(* get_dictionary)(_cef_value_t *self)
        _cef_list_value_t *(* get_list)(_cef_value_t *self)
        int (* set_null)(_cef_value_t *self)
        int (* set_bool)(_cef_value_t *self, int value)
        int (* set_int)(_cef_value_t *self, int value)
        int (* set_double)(_cef_value_t *self, double value)
        int (* set_string)(_cef_value_t *self, const cef_string_t *value)
        int (* set_binary)(_cef_value_t *self, _cef_binary_value_t *value)
        int (* set_dictionary)(_cef_value_t *self, _cef_dictionary_value_t *value)
        int (* set_list)(_cef_value_t *self, _cef_list_value_t *value)

    ctypedef _cef_value_t cef_value_t

    cef_value_t *cef_value_create()

    struct _cef_binary_value_t:
        cef_base_ref_counted_t base

    ctypedef _cef_binary_value_t cef_binary_value_t

    cef_binary_value_t *cef_binary_value_create(_cef_binary_value_t *self,
                                                void *buffer,
                                                size_t buffer_size,
                                                size_t data_offset)

    struct _cef_dictionary_value_t:
        cef_base_ref_counted_t base
        cef_string_t key

        int (* is_valid)(_cef_dictionary_value_t *self)
        int (* is_owned)(_cef_dictionary_value_t *self)
        int (* is_read_only)(_cef_dictionary_value_t *self)
        int (* is_same)(_cef_dictionary_value_t *self, _cef_dictionary_value_t *that)
        int (* is_equal)(_cef_dictionary_value_t *self, _cef_dictionary_value_t *that)
        _cef_dictionary_value_t *(* copy)(_cef_dictionary_value_t *self, int exclude_empty_children)
        size_t (* get_size)(_cef_dictionary_value_t *self)
        int (* clear)(_cef_dictionary_value_t *self)
        int (* has_key)(_cef_dictionary_value_t *self)
        int (* get_keys)(_cef_dictionary_value_t *self, cef_string_list_t keys)
        int (* remove)(_cef_dictionary_value_t *self)
        cef_value_type_t (* get_type)(_cef_dictionary_value_t *self, const cef_string_t *key)
        _cef_value_t *(* get_value)(_cef_dictionary_value_t *self, const cef_string_t *key)
        int (* get_bool)(_cef_dictionary_value_t *self, const cef_string_t *key)
        int (* get_int)(_cef_dictionary_value_t *self, const cef_string_t *key)
        double (* get_double)(_cef_dictionary_value_t *self, const cef_string_t *key)
        cef_string_userfree_t (* get_string)(_cef_dictionary_value_t *self, const cef_string_t *key)
        _cef_binary_value_t *(* get_binary)(_cef_binary_value_t *self, const cef_string_t *key)
        _cef_dictionary_value_t *(* get_dictionary)(_cef_dictionary_value_t *self, const cef_string_t *key)
        _cef_list_value_t *(* get_list)(_cef_dictionary_value_t *self, const cef_string_t *key)
        int (* set_value)(_cef_dictionary_value_t *self, const cef_string_t *key, _cef_value_t *value)
        int (* set_null)(_cef_dictionary_value_t *self, const cef_string_t *key)
        int (* set_bool)(_cef_dictionary_value_t *self, const cef_string_t *key, int value)
        int (* set_int)(_cef_dictionary_value_t *self, const cef_string_t *key, int value)
        int (* set_double)(_cef_dictionary_value_t *self, const cef_string_t *key, double value)
        int (* set_string)(_cef_dictionary_value_t *self, const cef_string_t *key, const cef_string_t *value)
        int (* set_binary)(_cef_dictionary_value_t *self, const cef_string_t *key, _cef_binary_value_t *value)
        int (* set_dictionary)(_cef_dictionary_value_t *self, const cef_string_t *key, _cef_dictionary_value_t *value)
        int (* set_list)(_cef_dictionary_value_t *self, const cef_string_t *key, _cef_list_value_t *value)


    ctypedef _cef_dictionary_value_t cef_dictionary_value_t

    cef_dictionary_value_t *cef_dictionary_value_create()

    struct _cef_list_value_t:
        cef_base_ref_counted_t base

        int (* is_valid)(_cef_list_value_t *self)
        int (* is_owned)(_cef_list_value_t *self)
        int (* is_read_only)(_cef_list_value_t *self)
        int (* is_same)(_cef_list_value_t *self, _cef_list_value_t *that)
        int (* is_equal)(_cef_list_value_t *self, _cef_list_value_t *that)
        _cef_list_value_t *(* copy)(_cef_list_value_t *self)
        int (* set_size)(_cef_list_value_t *self, size_t size)
        size_t (* get_size)(_cef_list_value_t *self)
        int (* clear)(_cef_list_value_t *self)
        int (* remove)(_cef_list_value_t *self, size_t index)
        cef_value_type_t (* get_type)(_cef_list_value_t *self, size_t index)
        _cef_value_t *(* get_value)(_cef_list_value_t *self, size_t index)
        int (* get_bool)(_cef_list_value_t *self, size_t index)
        int (* get_int)(_cef_list_value_t *self, size_t index)
        double (* get_double)(_cef_list_value_t *self, size_t index)
        cef_string_userfree_t (* get_string)(_cef_list_value_t *self, size_t index)
        _cef_binary_value_t *(* get_binary)(_cef_list_value_t *self, size_t index)
        _cef_dictionary_value_t *(* get_dictionary)(_cef_list_value_t *self, size_t index)
        _cef_list_value_t *(* get_list)(_cef_list_value_t *self, size_t index)
        int (* set_value)(_cef_list_value_t *self, size_t index, _cef_value_t *value)
        int (* set_null)(_cef_list_value_t *self, size_t index)
        int (* set_bool)(_cef_list_value_t *self, size_t index, int value)
        int (* set_int)(_cef_list_value_t *self, size_t index, int value)
        int (* set_double)(_cef_list_value_t *self,
                           size_t index,
                           double value)
        int (* set_string)(_cef_list_value_t *self,
                           size_t index,
                           const cef_string_t *value)
        int (* set_binary)(_cef_list_value_t *self,
                           size_t index,
                           _cef_binary_value_t *value)
        int (* set_dictionary)(_cef_list_value_t *self,
                               size_t index,
                               _cef_dictionary_value_t *value)
        int (* set_list)(_cef_list_value_t *self,
                         size_t index,
                         _cef_list_value_t *value)

    ctypedef _cef_list_value_t cef_list_value_t

    cef_list_value_t *cef_list_value_create()
