from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_browser cimport _cef_browser_t
from cefcython.capi.cef_dom cimport _cef_domvisitor_t
from cefcython.capi.cef_process_message cimport _cef_process_message_t
from cefcython.capi.cef_request cimport _cef_request_t
from cefcython.capi.cef_string cimport cef_string_t, cef_string_userfree_t
from cefcython.capi.cef_string_visitor cimport _cef_string_visitor_t
from cefcython.capi.cef_types cimport cef_process_id_t
from cefcython.capi.cef_urlrequest cimport (_cef_urlrequest_t,
                                            _cef_urlrequest_client_t)
from cefcython.capi.cef_v8 cimport _cef_v8context_t

from libc.stdint cimport int64_t

cdef extern from "include/capi/cef_frame_capi.h":
    cdef struct _cef_frame_t:
        cef_base_ref_counted_t base

        int (* is_valid)(_cef_frame_t *self)
        void (* undo)(_cef_frame_t *self)
        void (* redo)(_cef_frame_t *self)
        void (* cut)(_cef_frame_t *self)
        void (* copy)(_cef_frame_t *self)
        void (* paste)(_cef_frame_t *self)
        void (* _del)(_cef_frame_t *self)
        void (* select_all)(_cef_frame_t *self)
        void (* view_source)(_cef_frame_t *self)
        void (* get_source)(_cef_frame_t *self, _cef_string_visitor_t *visitor)
        void (* get_text)(_cef_frame_t *self, _cef_string_visitor_t *visitor)
        void (* load_request)(_cef_frame_t *self, _cef_request_t *request)
        void (* load_url)(_cef_frame_t *self, const cef_string_t *url)
        void (* execute_java_script)(_cef_frame_t *self,
                                    const cef_string_t *code,
                                    const cef_string_t *script_url,
                                    int start_line)
        int (* is_main)(_cef_frame_t *self)
        int (* is_focused)(_cef_frame_t *self)
        cef_string_userfree_t (* get_name)(_cef_frame_t *self)
        int64_t (* get_identifier)(_cef_frame_t *self)
        _cef_frame_t *(* get_parent)(_cef_frame_t *self)
        cef_string_userfree_t (* get_url)(_cef_frame_t *self)
        _cef_browser_t *(* get_browser)(_cef_frame_t *self)
        _cef_v8context_t *(* get_v8context)(_cef_frame_t *self)
        void (* visit_dom)(_cef_frame_t *self, _cef_domvisitor_t *visitor)
        _cef_urlrequest_t *(* create_urlrequest)(_cef_frame_t *self,
                                                 _cef_request_t *request,
                                                 _cef_urlrequest_client_t *client)
        void (* send_process_message)(_cef_frame_t *self,
                                      cef_process_id_t target_process,
                                      _cef_process_message_t *message)

    ctypedef _cef_frame_t cef_frame_t
