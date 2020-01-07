import sys

from libc.string cimport strlen
from libc.stdlib cimport malloc, free

from capi.cef_app cimport *
from capi.cef_browser cimport *
from capi.cef_client cimport *
from capi.cef_life_span_handler cimport *
from capi.cef_string cimport *

def main():
    cdef cef_main_args_t main_args
    #main_args.argc = sys.argc
    #main_args.argv = sys.argv

    cdef cef_app_t app
    initialize_cef_app(&app)

    code = cef_execute_process(&main_args, &app, NULL)
    if code >= 0:
        exit(code)

    cdef cef_settings_t settings
    settings.size = sizeof(cef_settings_t)
    settings.log_severity = LOGSEVERITY_WARNING
    settings.no_sandbox = 1

    cef_initialize(&main_args, &settings, NULL, NULL)

    cdef cef_window_info_t window_info
    window_info.parent_window = <unsigned long>NULL

    cdef char *url = "https://google.com/ncr"
    cdef cef_string_t cef_url
    cef_string_utf8_to_utf16(url, strlen(url), &cef_url)

    cdef cef_browser_settings_t browser_settings
    browser_settings.size = sizeof(cef_browser_settings_t)

    cdef cef_client_t client
    initialize_cef_client(&client)

    cef_browser_host_create_browser(&window_info, &client, &cef_url,
                                    &browser_settings, NULL, NULL)

    cef_run_message_loop()
    cef_shutdown()
