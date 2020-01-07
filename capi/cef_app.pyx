cdef void on_before_command_line_processing(
        _cef_app_t *self,
        const cef_string_t *process_type,
        _cef_command_line_t *command_line):
    pass

cdef void on_register_custom_schemes(
        _cef_app_t *self,
        _cef_scheme_registrar_t *registrar):
    pass

cdef _cef_resource_bundle_handler_t *get_resource_bundle_handler(
        _cef_app_t *self):
    return NULL

cdef _cef_browser_process_handler_t *get_browser_process_handler(
        _cef_app_t *self):
    return NULL

cdef _cef_render_process_handler_t *get_render_process_handler(
        _cef_app_t *self):
    return NULL

cdef void initialize_cef_app(cef_app_t *app):
    app.base.size = sizeof(cef_app_t)
    app.on_before_command_line_processing = on_before_command_line_processing
    app.on_register_custom_schemes = on_register_custom_schemes
    app.get_resource_bundle_handler = get_resource_bundle_handler
    app.get_browser_process_handler = get_browser_process_handler
    app.get_render_process_handler = get_render_process_handler

