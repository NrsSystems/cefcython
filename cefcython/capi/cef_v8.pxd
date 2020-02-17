from cefcython.capi.cef_base cimport _cef_base_ref_counted_t, cef_base_ref_counted_t
from cefcython.capi.cef_browser cimport _cef_browser_t
from cefcython.capi.cef_frame cimport _cef_frame_t
from cefcython.capi.cef_string cimport cef_string_t, cef_string_userfree_t
from cefcython.capi.cef_string_list cimport cef_string_list_t
from cefcython.capi.cef_task cimport _cef_task_runner_t
from cefcython.capi.cef_time cimport  cef_time_t
from cefcython.capi.cef_types cimport (cef_v8_accesscontrol_t,
                                       cef_v8_propertyattribute_t)

from libc.stdint cimport int32_t, uint32_t

cdef extern from "include/capi/cef_v8_capi.h":
    struct _cef_v8exception_t
    struct _cef_v8handler_t
    struct _cef_v8stack_frame_t
    struct _cef_v8value_t

    struct _cef_v8accessor_t:
        pass

    ctypedef _cef_v8accessor_t cef_v8accessor_t

    struct _cef_v8array_buffer_release_callback_t:
        cef_base_ref_counted_t base

        void (* release_buffer)(_cef_v8array_buffer_release_callback_t *self,
                                void *buffer)

    ctypedef _cef_v8array_buffer_release_callback_t cef_v8array_buffer_release_callback_t

    struct _cef_v8context_t:
        cef_base_ref_counted_t base

        _cef_task_runner_t *(* get_task_runner)(_cef_v8context_t *self)
        int (* is_valid)(_cef_v8context_t *self)
        _cef_browser_t *(* get_browser)(_cef_v8context_t *self)
        _cef_frame_t *(* get_frame)(_cef_v8context_t *self)
        _cef_v8value_t *(* get_global)(_cef_v8context_t *self)
        int (* enter)(_cef_v8context_t *self)
        int (* exit)(_cef_v8context_t *self)
        int (* is_same)(_cef_v8context_t *self)
        int (* eval)(_cef_v8context_t *self,
                     const cef_string_t *code,
                     const cef_string_t *script_url,
                     int start_line,
                     _cef_v8value_t *const *retval,
                     _cef_v8exception_t **exception)

    ctypedef _cef_v8context_t cef_v8context_t

    cef_v8context_t *cef_v8context_get_current_context()
    cef_v8context_t *cef_v8context_get_entered_context()
    int cef_v8context_in_context()

    struct _cef_v8exception_t:
        pass

    ctypedef _cef_v8exception_t cef_v8exception_t

    struct _cef_v8handler_t:
        cef_base_ref_counted_t base

        int (* execute)(_cef_v8handler_t *self,
                        const cef_string_t *name,
                        _cef_v8value_t *object,
                        size_t argumentsCount,
                        _cef_v8value_t *const *arguments,
                        _cef_v8value_t **retval,
                        cef_string_t *exception)

    ctypedef _cef_v8handler_t cef_v8handler_t

    struct _cef_v8interceptor_t:
        pass

    ctypedef _cef_v8interceptor_t cef_v8interceptor_t

    struct _cef_v8stack_trace_t:
        pass

    ctypedef _cef_v8stack_trace_t cef_v8stack_trace_t

    struct _cef_v8value_t:
        cef_base_ref_counted_t base

        int (* is_valid)(_cef_v8value_t *self)
        int (* is_undefined)(_cef_v8value_t *self)
        int (* is_null)(_cef_v8value_t *self)
        int (* is_bool)(_cef_v8value_t *self)
        int (* is_int)(_cef_v8value_t *self)
        int (* is_uint)(_cef_v8value_t *self)
        int (* is_double)(_cef_v8value_t *self)
        int (* is_date)(_cef_v8value_t *self)
        int (* is_string)(_cef_v8value_t *self)
        int (* is_object)(_cef_v8value_t *self)
        int (* is_array)(_cef_v8value_t *self)
        int (* is_array_buffer)(_cef_v8value_t *self)
        int (* is_function)(_cef_v8value_t *self)
        int (* is_same)(_cef_v8value_t *self, _cef_v8value_t *that)

        int (* get_bool_value)(_cef_v8value_t *self)
        int32_t (* get_int_value)(_cef_v8value_t *self)
        uint32_t (* get_uint_value)(_cef_v8value_t *self)
        double (* get_double_value)(_cef_v8value_t *self)
        cef_time_t (* get_date_value)(_cef_v8value_t *self)
        cef_string_userfree_t *(* get_string_value)(_cef_v8value_t *self)
        int (* is_user_created)(_cef_v8value_t *self)
        int (* has_exception)(_cef_v8value_t *self)
        _cef_v8exception_t (* get_exception)(_cef_v8value_t *self)
        int (* clear_exception)(_cef_v8value_t *self)
        int (* will_rethrow_exceptions)(_cef_v8value_t *self)
        int (* set_rethrow_exceptions)(_cef_v8value_t *self, int rethrow)
        int (* has_value_bykey)(_cef_v8value_t *self, const cef_string_t *key)
        int (* has_value_byindex)(_cef_v8value_t *self, int index)
        int (* delete_value_bykey)(_cef_v8value_t *self,
                                   const cef_string_t *key)
        int (* delete_value_byindex)(_cef_v8value_t *self, int index)
        _cef_v8value_t *(* get_value_bykey)(_cef_v8value_t *self,
                                            const cef_string_t *key)
        _cef_v8value_t *(* get_value_byindex)(_cef_v8value_t *self, int index)
        int (* set_value_bykey)(_cef_v8value_t *self,
                                const cef_string_t *key,
                                _cef_v8value_t *value,
                                cef_v8_propertyattribute_t attribute)
        int (* set_value_byindex)(_cef_v8value_t *self,
                                  int index,
                                  _cef_v8value_t *value)
        int (* set_value_byaccessor)(_cef_v8value_t *self,
                                     const cef_string_t *key,
                                     cef_v8_accesscontrol_t settings,
                                     cef_v8_propertyattribute_t attribute)
        int (* get_keys)(_cef_v8value_t *self, cef_string_list_t keys)
        int (* set_user_data)(_cef_v8value_t *self,
                              _cef_base_ref_counted_t *user_data)
        _cef_base_ref_counted_t *(* get_user_data)(_cef_v8value_t *self)
        int (* get_externally_allocated_memory)(_cef_v8value_t *self)
        int (* adjust_externally_allocated_memory)(_cef_v8value_t *self,
                                                   int change_in_bytes)
        int (* get_array_length)(_cef_v8value_t *self)
        _cef_v8array_buffer_release_callback_t *(
                * get_array_buffer_release_callback)(_cef_v8value_t *self)
        int (* neuter_array_buffer)(_cef_v8value_t *self)
        cef_string_userfree_t (* get_function_name)(_cef_v8value_t *self)
        _cef_v8handler_t *(* get_function_handler)(_cef_v8value_t *self)
        _cef_v8value_t *(* execute_function)(_cef_v8value_t *self,
                                             _cef_v8value_t *object,
                                             size_t argumentsCount,
                                             _cef_v8value_t **arguments)
        _cef_v8value_t *(* execute_function_with_context)(_cef_v8value_t *self,
                                                          _cef_v8context_t *context,
                                                          _cef_v8value_t *object,
                                                          size_t argumentsCount,
                                                          _cef_v8value_t **arguments)

    ctypedef _cef_v8value_t cef_v8value_t

    cef_v8value_t *cef_v8value_create_undefined()
    cef_v8value_t *cef_v8value_create_null()
    cef_v8value_t *cef_v8value_create_bool(int value)
    cef_v8value_t *cef_v8value_create_int(int32_t value)
    cef_v8value_t *cef_v8value_create_uint(uint32_t value)
    cef_v8value_t *cef_v8value_create_double(double value)
    cef_v8value_t *cef_v8value_create_date(const cef_time_t *date)
    cef_v8value_t *cef_v8value_create_string(const cef_string_t *value)
    cef_v8value_t *cef_v8value_create_object(cef_v8accessor_t *accessor,
                                             cef_v8interceptor_t *interceptor)
    cef_v8value_t *cef_v8value_create_array(int length)
    cef_v8value_t *cef_v8value_create_array_buffer(
            void *buffer,
            size_t length,
            cef_v8array_buffer_release_callback_t *release_callback)
    cef_v8value_t *cef_v8value_create_function(const cef_string_t *name,
                                               cef_v8handler_t *handler)
