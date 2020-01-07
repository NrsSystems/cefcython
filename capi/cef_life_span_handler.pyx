cdef void on_before_close(
        _cef_life_span_handler_t *self,
        _cef_browser_t *browser):
    cef_quit_message_loop()

cdef void initialize_cef_life_span_handler(cef_life_span_handler_t *handler):
    handler.base.size = sizeof(cef_life_span_handler_t)
    #handler.on_before_close = on_before_close

