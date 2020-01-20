from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_browser cimport _cef_browser_t
from cefcython.capi.cef_client cimport _cef_client_t
from cefcython.capi.cef_frame cimport _cef_frame_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_types cimport (_cef_browser_settings_t,
                                       _cef_window_info_t,
                                       cef_popup_features_t,
                                       cef_window_open_disposition_t)
from cefcython.capi.cef_values cimport _cef_dictionary_value_t

from libc.stddef cimport size_t

cdef extern from "include/capi/cef_life_span_handler_capi.h":
    cdef struct _cef_life_span_handler_t:
        cef_base_ref_counted_t base

        int (* on_before_popup)(_cef_life_span_handler_t *self,
                                _cef_browser_t *browser,
                                _cef_frame_t *frame,
                                const cef_string_t *target_url,
                                const cef_string_t *target_frame_name,
                                cef_window_open_disposition_t target_disposition,
                                int user_gesture,
                                const cef_popup_features_t *popupFeatures,
                                _cef_window_info_t *windowInfo,
                                _cef_client_t **client,
                                _cef_browser_settings_t *settings,
                                _cef_dictionary_value_t **extra_info,
                                int *no_javascript_access)

        void (* on_after_created)(_cef_life_span_handler_t *self,
                                  _cef_browser_t *browser)

        int (* do_close)(_cef_life_span_handler_t *self,
                         _cef_browser_t *browser)

        void (* on_before_close)(_cef_life_span_handler_t *self,
                                 _cef_browser_t *browser)

    ctypedef _cef_life_span_handler_t cef_life_span_handler_t
