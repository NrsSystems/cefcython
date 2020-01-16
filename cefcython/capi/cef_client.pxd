from libc.stddef cimport size_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_types cimport cef_process_id_t
from cefcython.capi.cef_request_handler cimport _cef_request_handler_t

cdef extern from "include/capi/cef_client_capi.h":
    cdef struct _cef_client_t:
        cef_base_ref_counted_t base

        _cef_context_menu_handler_t *(* get_context_menu_handler)(
                _cef_client_t *self)

        _cef_display_handler_t *(* get_display_handler)(_cef_client_t *self)
        _cef_dialog_handler_t *(* get_dialog_handler)(_cef_client_t *self)
        _cef_download_handler_t *(* get_download_handler)(_cef_client_t *self)
        _cef_drag_handler_t *(* get_drag_handler)(_cef_client_t *self)
        _cef_focus_handler_t *(* get_focus_handler)(_cef_client_t *self)
        _cef_jsdialog_handler_t *(* get_jsdialog_handler)(_cef_client_t *self)
        _cef_keyboard_handler_t *(* get_keyboard_handler)(_cef_client_t *self)
        _cef_life_span_handler_t *(* get_life_span_handler)(_cef_client_t *self)
        _cef_load_handler_t *(* get_load_handler)(_cef_client_t *self)
        _cef_render_handler_t *(* get_render_handler)(_cef_client_t *self)
        _cef_request_handler_t *(* get_request_handler)(_cef_client_t *self)

        int (* on_process_message_received)(_cef_client_t *self,
                                            _cef_browser_t *browser,
                                            _cef_frame_t *frame,
                                            cef_process_id_t source_process,
                                            _cef_process_message_t *message)

    ctypedef _cef_client_t cef_client_t

    cdef struct _cef_browser_t:
        pass

    cdef struct _cef_frame_t:
        pass

    cdef struct _cef_process_message_t:
        pass

    cdef struct _cef_download_handler_t:
        pass

    cdef struct _cef_context_menu_handler_t:
        pass

    cdef struct _cef_dialog_handler_t:
        pass

    cdef struct _cef_display_handler_t:
        pass

    cdef struct _cef_drag_handler_t:
        pass

    cdef struct _cef_focus_handler_t:
        pass

    cdef struct _cef_jsdialog_handler_t:
        pass

    cdef struct _cef_keyboard_handler_t:
        pass

    cdef struct _cef_life_span_handler_t:
        pass

    cdef struct _cef_load_handler_t:
        pass

    cdef struct _cef_render_handler_t:
        pass
cdef _cef_context_menu_handler_t *get_context_menu_handler(
        _cef_client_t *self)

cdef _cef_dialog_handler_t *get_dialog_handler(_cef_client_t *self)

cdef _cef_display_handler_t *get_display_handler(_cef_client_t *self)

cdef _cef_download_handler_t *get_download_handler(_cef_client_t *self)

cdef _cef_drag_handler_t *get_drag_handler(_cef_client_t *self)

cdef _cef_focus_handler_t *get_focus_handler(_cef_client_t *self)

cdef _cef_jsdialog_handler_t *get_jsdialog_handler(_cef_client_t *self)

cdef _cef_keyboard_handler_t *get_keyboard_handler(_cef_client_t *self)

cdef _cef_life_span_handler_t *get_life_span_handler(_cef_client_t *self)

cdef _cef_load_handler_t *get_load_handler(_cef_client_t *self)

cdef _cef_render_handler_t *get_render_handler(_cef_client_t *self)

cdef _cef_request_handler_t *get_request_handler(_cef_client_t *self)

cdef int on_process_message_received(
            _cef_client_t *self,
            _cef_browser_t *browser,
            _cef_frame_t *frame,
            cef_process_id_t source_process,
            _cef_process_message_t *message)
