from cefcython.capi.cef_types cimport (_cef_browser_settings_t,
                                       cef_window_info_t)
from cefcython.capi.cef_client cimport _cef_client_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_request_context cimport _cef_request_context_t
from cefcython.capi.cef_values cimport _cef_dictionary_value_t

cdef extern from "include/capi/cef_browser_capi.h":
    int cef_browser_host_create_browser(
            const cef_window_info_t *window_info,
            _cef_client_t *client,
            const cef_string_t *url,
            const _cef_browser_settings_t *settings,
            _cef_dictionary_value_t *extra_info,
            _cef_request_context_t *request_context)

    int cef_browser_host_create_browser_sync(
            const cef_window_info_t *window_info,
            _cef_client_t *client,
            cef_string_t *url,
            const _cef_browser_settings_t *settings,
            _cef_dictionary_value_t *extra_info,
            _cef_request_context_t *request_context)
