import os
import sys

from libc.string cimport strlen, memset
from libc.stdlib cimport malloc, free
from libc.stdio cimport printf

from cefcython.capi.cef_app cimport *
from cefcython.capi.cef_browser cimport *
from cefcython.capi.cef_client cimport *
from cefcython.capi.cef_life_span_handler cimport *
from cefcython.capi.cef_string cimport *
from cefcython.capi.cef_types cimport *

from cefcython.util.string cimport to_cstring_array
from cefcython.util.x11 cimport *

cdef int x11_error_handler(Display *display, XErrorEvent *event):
    printf("X11 error: type=%d, serial=%lu, code=%d\n",
            event.type, event.serial, <int>event.error_code)
    return 0

cdef int x11_io_error_handler(Display *display):
    return 0

def main():
    cdef int pid = os.getpid()
    cdef cef_main_args_t main_args
    main_args.argc = len(sys.argv)
    main_args.argv = to_cstring_array(sys.argv)

    cdef cef_app_t app
    memset(&app, 0, sizeof(cef_app_t))
    initialize_cef_app(&app)

    cdef int code = cef_execute_process(&main_args, &app, NULL)
    if code >= 0:
        exit(code)

    cdef cef_settings_t settings
    memset(&settings, 0, sizeof(cef_settings_t))

    settings.size = sizeof(cef_settings_t)
    settings.log_severity = LOGSEVERITY_WARNING
    settings.no_sandbox = 1

    cef_initialize(&main_args, &settings, NULL, NULL)

    cdef cef_window_info_t window_info
    memset(&window_info, 0, sizeof(cef_window_info_t))

    XSetErrorHandler(x11_error_handler)
    XSetIOErrorHandler(x11_io_error_handler)

    cdef char *url = "https://google.com/ncr"
    cdef cef_string_t cef_url
    cef_string_utf8_to_utf16(url, strlen(url), &cef_url)

    cdef cef_browser_settings_t browser_settings
    memset(&browser_settings, 0, sizeof(cef_browser_settings_t))
    browser_settings.size = sizeof(cef_browser_settings_t)

    cdef cef_client_t client
    memset(&client, 0, sizeof(cef_client_t))
    initialize_cef_client(&client)

    cef_browser_host_create_browser(&window_info, &client, &cef_url,
                                    &browser_settings, NULL, NULL)

    cef_run_message_loop()
    cef_shutdown()

    free(main_args.argv)

if __name__ == '__main__':
    main()
