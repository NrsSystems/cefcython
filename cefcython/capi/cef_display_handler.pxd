from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_browser cimport _cef_browser_t
from cefcython.capi.cef_frame cimport _cef_frame_t
from cefcython.capi.cef_types cimport cef_log_severity_t, cef_size_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_string_list cimport cef_string_list_t

cdef extern from "include/capi/cef_display_handler_capi.h":
    struct _cef_display_handler_t:
        cef_base_ref_counted_t base

        void (* on_address_change)(_cef_display_handler_t *self,
                                   _cef_browser_t *browser,
                                   _cef_frame_t *frame,
                                   const cef_string_t *url)

        void (* on_title_change)(_cef_display_handler_t *self,
                                 _cef_browser_t *browser,
                                 const cef_string_t *title)

        void (* on_favicon_urlchange)(_cef_display_handler_t *self,
                                      _cef_browser_t *browser,
                                      cef_string_list_t icon_urls)

        void (* on_fullscreen_mode_change)(_cef_display_handler_t *self,
                                           _cef_browser_t *browser,
                                           int fullscreen)

        void (* on_tooltip)(_cef_display_handler_t *self,
                            _cef_browser_t *browser,
                            cef_string_t *text)

        void (* on_status_message)(_cef_display_handler_t *self,
                                   _cef_browser_t *browser,
                                   const cef_string_t *value)

        void (* on_console_message)(_cef_display_handler_t *self,
                                    _cef_browser_t *browser,
                                    cef_log_severity_t level,
                                    const cef_string_t *message,
                                    const cef_string_t *source,
                                    int line)

        int (* on_auto_resize)(_cef_display_handler_t *self,
                               _cef_browser_t *browser,
                               const cef_size_t *new_size)

        void (* on_loading_progress_change)(_cef_display_handler_t *self,
                                            _cef_browser_t *browser,
                                            double progress)

    ctypedef _cef_display_handler_t cef_display_handler_t
