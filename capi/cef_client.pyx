cdef _cef_context_menu_handler_t *get_context_menu_handler(
        _cef_client_t *self):
    return NULL

cdef _cef_dialog_handler_t *get_dialog_handler(_cef_client_t *self):
    return NULL

cdef _cef_display_handler_t *get_display_handler(_cef_client_t *self):
    return NULL

cdef _cef_download_handler_t *get_download_handler(_cef_client_t *self):
    return NULL

cdef _cef_drag_handler_t *get_drag_handler(_cef_client_t *self):
    return NULL

cdef _cef_focus_handler_t *get_focus_handler(_cef_client_t *self):
    return NULL

cdef _cef_jsdialog_handler_t *get_jsdialog_handler(_cef_client_t *self):
    return NULL

cdef _cef_keyboard_handler_t *get_keyboard_handler(_cef_client_t *self):
    return NULL

cdef _cef_life_span_handler_t *get_life_span_handler(_cef_client_t *self):
    return NULL

cdef _cef_load_handler_t *get_load_handler(_cef_client_t *self):
    return NULL

cdef _cef_render_handler_t *get_render_handler(_cef_client_t *self):
    return NULL

cdef _cef_request_handler_t *get_request_handler(_cef_client_t *self):
    return NULL

cdef int on_process_message_received(
            _cef_client_t *self,
            _cef_browser_t *browser,
            _cef_frame_t *frame,
            cef_process_id_t source_process,
            _cef_process_message_t *message):
    return 0

cdef void initialize_cef_client(cef_client_t *client):
    client.base.size = sizeof(cef_client_t)
    client.get_context_menu_handler = get_context_menu_handler
    client.get_dialog_handler = get_dialog_handler
    client.get_display_handler = get_display_handler
    client.get_download_handler = get_download_handler
    client.get_drag_handler = get_drag_handler
    client.get_focus_handler = get_focus_handler
    client.get_jsdialog_handler = get_jsdialog_handler
    client.get_keyboard_handler = get_keyboard_handler
    client.get_life_span_handler = get_life_span_handler
    client.get_render_handler = get_render_handler
    client.get_request_handler = get_request_handler
    client.on_process_message_received = on_process_message_received

