from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_command_line cimport _cef_command_line_t
from cefcython.capi.cef_print_handler cimport _cef_print_handler_t
from cefcython.capi.cef_values cimport _cef_list_value_t

from libc.stdint cimport int64_t

cdef extern from "include/capi/cef_browser_process_handler_capi.h":
    struct _cef_browser_process_handler_t:
        cef_base_ref_counted_t base

        void (* on_context_initialized)(_cef_browser_process_handler_t *self)
        void (* on_before_child_process_launch)(_cef_browser_process_handler_t *self,
                                                _cef_command_line_t *command_line)
        void (* on_render_process_thread_created)(_cef_browser_process_handler_t *self,
                                                  _cef_list_value_t *extra_info)
        _cef_print_handler_t *(* get_print_handler)(_cef_browser_process_handler_t *self)
        void (* on_schedule_message_pump_work)(_cef_browser_process_handler_t *self,
                                               int64_t delay_ms)

    ctypedef _cef_browser_process_handler_t cef_browser_process_handler_t
