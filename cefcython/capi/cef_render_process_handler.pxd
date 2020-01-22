from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_browser cimport _cef_browser_t
from cefcython.capi.cef_frame cimport _cef_frame_t
from cefcython.capi.cef_load_handler cimport _cef_load_handler_t
from cefcython.capi.cef_process_message cimport _cef_process_message_t
from cefcython.capi.cef_types cimport cef_process_id_t
from cefcython.capi.cef_values cimport (_cef_dictionary_value_t,
                                        _cef_list_value_t)
from cefcython.capi.cef_v8 cimport (_cef_v8context_t,
                                    _cef_v8exception_t,
                                    _cef_v8stack_trace_t)

cdef extern from "include/capi/cef_render_process_handler_capi.h":
    struct _cef_render_process_handler_t:
        cef_base_ref_counted_t base

        void (* on_render_thread_created)(_cef_render_process_handler_t *self,
                                          _cef_list_value_t *extra_info)

        void (* on_web_kit_initialized)(_cef_render_process_handler_t *self)

        void (* on_browser_created)(_cef_render_process_handler_t *self,
                                    _cef_browser_t *browser,
                                    _cef_dictionary_value_t *extra_info)

        void (* on_browser_destroyed)(_cef_render_process_handler_t *self,
                                      _cef_browser_t *browser)

        _cef_load_handler_t *(* get_load_handler)(_cef_render_process_handler_t *self)

        void (* on_context_created)(_cef_render_process_handler_t *self,
                                    _cef_browser_t *browser,
                                    _cef_frame_t *frame,
                                    _cef_v8context_t *context)

        void (* on_context_released)(_cef_render_process_handler_t *self,
                                     _cef_browser_t *browser,
                                     _cef_frame_t *frame,
                                     _cef_v8context_t *context)

        void (* on_uncaught_exception)(_cef_render_process_handler_t *self,
                                       _cef_browser_t *browser,
                                       _cef_frame_t *frame,
                                       _cef_v8context_t *context,
                                       _cef_v8exception_t *exception,
                                       _cef_v8stack_trace_t *stackTrace)

        void (* on_focused_node_changed)(_cef_render_process_handler_t *self,
                                         _cef_browser_t *browser,
                                         _cef_frame_t *frame,
                                         cef_process_id_t source_process,
                                         _cef_process_message_t *message)

        int (* on_process_message_received)(_cef_render_process_handler_t *self,
                                            _cef_browser_t *browser,
                                            _cef_frame_t *frame,
                                            cef_process_id_t source_process,
                                            _cef_process_message_t *message)

    ctypedef _cef_render_process_handler_t cef_render_process_handler_t
