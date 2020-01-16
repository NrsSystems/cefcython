from libc.stdint cimport int64_t

from cefcython.capi.cef_auth_callback cimport _cef_auth_callback_t
from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_browser cimport _cef_browser_t
from cefcython.capi.cef_frame cimport _cef_frame_t
from cefcython.capi.cef_request cimport _cef_request_t
from cefcython.capi.cef_request_callback cimport _cef_request_callback_t
from cefcython.capi.cef_resource_request_handler cimport _cef_resource_request_handler_t
from cefcython.capi.cef_ssl_info cimport _cef_sslinfo_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_types cimport (cef_errorcode_t,
                                       cef_window_open_disposition_t,
                                       cef_termination_status_t)
from cefcython.capi.cef_x509_certificate cimport _cef_x509certificate_t

cdef extern from "include/capi/cef_request_handler_capi.h":
    struct _cef_select_client_certificate_callback_t:
        cef_base_ref_counted_t base

        void (* select)(_cef_select_client_certificate_callback_t *self,
                        _cef_x509certificate_t *cert)

    ctypedef _cef_select_client_certificate_callback_t cef_select_client_certificate_callback_t

    struct _cef_request_handler_t:
        cef_base_ref_counted_t base
        int (* on_before_browse)(_cef_request_handler_t *self,
                                 _cef_browser_t *browser,
                                 _cef_frame_t *frame,
                                 _cef_request_t *request,
                                 int user_gesture,
                                 int is_redirect)

        int (* on_open_urlfrom_tab)(_cef_request_handler_t *self,
                                    _cef_browser_t *browser,
                                    _cef_frame_t *frame,
                                    const cef_string_t *target_url,
                                    cef_window_open_disposition_t target_disposition,
                                    int user_gesture)

        _cef_resource_request_handler_t *(* get_resource_request_handler)(
                _cef_request_handler_t *self,
                _cef_browser_t *browser,
                _cef_frame_t *frame,
                _cef_request_t *request,
                int is_navigation,
                int is_download,
                const cef_string_t *request_initiator,
                int *disable_default_handling)

        int (* get_auth_credentials)(_cef_request_handler_t *self,
                                     _cef_browser_t *browser,
                                     const cef_string_t *origin_url,
                                     int isProxy,
                                     const cef_string_t *host,
                                     int port,
                                     const cef_string_t *realm,
                                     const cef_string_t *scheme,
                                     _cef_auth_callback_t *callback)

        int (* on_quota_request)(_cef_request_handler_t *self,
                                 _cef_browser_t *browser,
                                 const cef_string_t *origin_url,
                                 int64_t *new_size,
                                 _cef_request_callback_t *callback)

        int (* on_certificate_error)(_cef_request_handler_t *self,
                                     _cef_browser_t *browser,
                                     cef_errorcode_t cert_error,
                                     const cef_string_t *request_url,
                                     _cef_sslinfo_t *ssl_info,
                                     _cef_request_callback_t *callback)

        int (* on_select_client_certificate)(_cef_request_handler_t *self,
                                             _cef_browser_t *browser,
                                             int isProxy,
                                             const cef_string_t *host,
                                             int port,
                                             size_t certificatesCount,
                                             _cef_x509certificate_t **certificates,
                                             _cef_select_client_certificate_callback_t *callback)

        void (* on_plugin_crashed)(_cef_request_handler_t *self,
                                   _cef_browser_t *browser,
                                   const cef_string_t *plugin_path)

        void (* on_render_view_ready)(_cef_request_handler_t *self,
                                      _cef_browser_t *browser)

        void (* on_render_process_terminated)(_cef_request_handler_t *self,
                                              _cef_browser_t *browser,
                                              cef_termination_status_t status)

    ctypedef _cef_request_handler_t cef_request_handler_t
