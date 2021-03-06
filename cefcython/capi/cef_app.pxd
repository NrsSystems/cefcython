from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_browser_process_handler cimport _cef_browser_process_handler_t
from cefcython.capi.cef_command_line cimport _cef_command_line_t
from cefcython.capi.cef_render_process_handler cimport _cef_render_process_handler_t
from cefcython.capi.cef_resource_bundle_handler cimport _cef_resource_bundle_handler_t
from cefcython.capi.cef_scheme cimport _cef_scheme_registrar_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_types cimport _cef_settings_t

from libc.stddef cimport size_t

cdef extern from "include/internal/cef_types_linux.h":
    cdef struct _cef_main_args_t:
        int argc
        char **argv

    ctypedef _cef_main_args_t cef_main_args_t

cdef extern from "include/capi/cef_app_capi.h":
    struct _cef_app_t:
        cef_base_ref_counted_t base

        void (* on_before_command_line_processing)(
                _cef_app_t *self,
                const cef_string_t *process_type,
                _cef_command_line_t *command_line)

        void (* on_register_custom_schemes)(
                _cef_app_t *self,
                _cef_scheme_registrar_t *registrar)

        _cef_resource_bundle_handler_t *(* get_resource_bundle_handler)(
                _cef_app_t *self)

        _cef_browser_process_handler_t *(* get_browser_process_handler)(
                _cef_app_t *self)

        _cef_render_process_handler_t *(* get_render_process_handler)(
                _cef_app_t *self)

    ctypedef _cef_app_t cef_app_t

    int cef_initialize(const _cef_main_args_t *args,
                       const _cef_settings_t *settings,
                       cef_app_t *application,
                       void *windows_sandbox_info)

    void cef_run_message_loop()
    void cef_do_message_loop_work()
    void cef_shutdown()
    int cef_execute_process(
            const _cef_main_args_t *args,
            cef_app_t *application,
            void *windows_sandbox_info)
