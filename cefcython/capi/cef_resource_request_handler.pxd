from libc.stdint cimport int64_t

from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_browser cimport _cef_browser_t
from cefcython.capi.cef_frame cimport _cef_frame_t
from cefcython.capi.cef_request cimport _cef_request_t
from cefcython.capi.cef_request_callback cimport _cef_request_callback_t
from cefcython.capi.cef_resource_handler cimport _cef_resource_handler_t
from cefcython.capi.cef_response cimport _cef_response_t
from cefcython.capi.cef_response_filter cimport _cef_response_filter_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_types cimport (_cef_cookie_t,
                                       cef_return_value_t,
                                       cef_urlrequest_status_t)

cdef extern from "include/capi/cef_resource_request_handler_capi.h":
    struct _cef_resource_request_handler_t:
        cef_base_ref_counted_t base

        _cef_cookie_access_filter_t *(* get_cookie_access_filter)(
                _cef_resource_request_handler_t *self,
                _cef_browser_t *browser,
                _cef_frame_t *frame,
                _cef_request_t *request)

        cef_return_value_t (* on_before_resource_load)(
                _cef_resource_request_handler_t *self,
                _cef_browser_t *browser,
                _cef_frame_t *frame,
                _cef_request_t *request,
                _cef_request_callback_t *callback)

        _cef_resource_handler_t *(* get_resource_handler)(
                _cef_resource_request_handler_t *self,
                _cef_browser_t *browser,
                _cef_frame_t *frame,
                _cef_request_t *request)

        void (* on_resource_redirect)(_cef_resource_request_handler_t *self,
                                      _cef_browser_t *browser,
                                      _cef_frame_t *frame,
                                      _cef_request_t *request,
                                      _cef_response_t *response,
                                      cef_string_t *new_url)

        int (* on_resource_response)(_cef_resource_request_handler_t *self,
                                     _cef_browser_t *browser,
                                     _cef_frame_t *frame,
                                     _cef_request_t *request,
                                     _cef_response_t *response)

        _cef_response_filter_t *(* get_resource_response_filter)(
                _cef_resource_request_handler_t *self,
                _cef_browser_t *browser,
                _cef_frame_t *frame,
                _cef_request_t *request,
                _cef_response_t *response)

        void (* on_resource_load_complete)(_cef_resource_request_handler_t *self,
                                           _cef_browser_t *browser,
                                           _cef_frame_t *frame,
                                           _cef_request_t *request,
                                           _cef_response_t *response,
                                           cef_urlrequest_status_t status,
                                           int64_t received_content_length)

        void (* on_protocol_execution)(_cef_resource_request_handler_t *self,
                                       _cef_browser_t *browser,
                                       _cef_frame_t *frame,
                                       _cef_request_t *request,
                                       int *allow_os_execution)

    ctypedef _cef_resource_request_handler_t cef_resource_request_handler_t

    struct _cef_cookie_access_filter_t:
        cef_base_ref_counted_t base

        int (* can_send_cookie)(_cef_cookie_access_filter_t *self,
                                _cef_browser_t *browser,
                                _cef_frame_t *frame,
                                _cef_request_t *request,
                                const _cef_cookie_t *cookie)

        int (* can_save_cookie)(_cef_cookie_access_filter_t *self,
                                _cef_browser_t *browser,
                                _cef_frame_t *frame,
                                _cef_request_t *request,
                                _cef_response_t *response,
                                const _cef_cookie_t *cookie)

    ctypedef _cef_cookie_access_filter_t cef_cookie_access_filter_t
