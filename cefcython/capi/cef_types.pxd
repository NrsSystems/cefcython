from libc.stddef cimport size_t
from libc.stdint cimport uint32_t

from cefcython.capi.cef_string cimport cef_string_t

cdef extern from "include/internal/cef_types.h":
    ctypedef uint32_t cef_color_t

    ctypedef enum cef_state_t:
        STATE_DEFAULT = 0,
        STATE_ENABLED,
        STATE_DISABLED

    cdef struct _cef_browser_settings_t:
        size_t size
        int windowless_frame_rate
        cef_string_t standard_font_family
        cef_string_t fixed_font_family
        cef_string_t serif_font_family
        cef_string_t sans_serif_font_family
        cef_string_t cursive_font_family
        cef_string_t fantasy_font_family
        int default_font_size
        int default_fixed_font_size
        int minimum_font_size
        int minimum_logical_font_size
        cef_string_t default_encoding
        cef_string_t remote_fonts
        cef_state_t javascript
        cef_state_t javscript_close_windows
        cef_state_t javascript_access_clipboard
        cef_state_t javascript_dom_paste
        cef_state_t plugins
        cef_state_t universal_access_from_file_urls
        cef_state_t file_access_from_file_urls
        cef_state_t web_security
        cef_state_t image_loading
        cef_state_t image_shrink_standalone_to_fit
        cef_state_t text_area_resize
        cef_state_t tab_to_links
        cef_state_t local_storage
        cef_state_t databases
        cef_state_t application_cache
        cef_state_t webgl
        cef_color_t background_color
        cef_string_t accept_language_list

    ctypedef enum cef_path_key_t:
        PK_DIR_CURRENT,
        PK_DIR_EXE,
        PK_DIR_MODULE,
        PK_DIR_TEMP,
        PK_FILE_EXE,
        PK_FILE_MODULE,
        PK_LOCAL_APP_DATA,
        PK_USER_DATA,
        PK_DIR_RESOURCES

    ctypedef _cef_browser_settings_t cef_browser_settings_t

    ctypedef enum cef_log_severity_t:
        LOGSEVERITY_DEFAULT,
        LOGSEVERITY_VERBOSE,
        LOGSEVERITY_DEBUG = LOGSEVERITY_VERBOSE,
        LOGSEVERITY_INFO,
        LOGSEVERITY_WARNING,
        LOGSEVERITY_ERROR,
        LOGSEVERITY_FATAL,
        LOGEVERITY_DISABLE=99

    ctypedef enum cef_process_id_t:
        pass

    cdef struct _cef_settings_t:
        size_t size
        int no_sandbox
        cef_string_t browser_subprocess_path
        cef_string_t framework_dir_path
        cef_string_t main_bundle_path
        int multi_threaded_message_loop
        int external_message_pump
        int windowless_rendering_enabled
        int command_line_args_disabled
        cef_string_t cache_path
        cef_string_t root_cache_path
        cef_string_t user_data_path
        int persist_session_cookies
        int persist_user_preferences
        cef_string_t user_agent
        cef_string_t product_version
        cef_string_t locale
        cef_string_t log_file
        cef_log_severity_t log_severity
        cef_string_t javascript_flags
        cef_string_t resources_dir_path
        cef_string_t locales_dir_path
        int pack_loading_disabled
        int remote_debugging_port
        int uncaught_exception_stack_size
        int ignore_certificate_errors
        cef_color_t background_color
        cef_string_t accept_language_list
        cef_string_t application_client_id_for_file_scanning

    ctypedef _cef_settings_t cef_settings_t

cdef extern from "include/internal/cef_types_linux.h":
    ctypedef unsigned long cef_window_handle_t

    ctypedef struct cef_window_info_t:
        cef_string_t window_name

        unsigned int x, y
        unsigned int width, height

        cef_window_handle_t parent_window

        int windowless_rendering_enabled
        int shared_texture_enabled
        int external_begin_frame_enabled

        cef_window_handle_t window
