from libc.stddef cimport size_t
from libc.stdint cimport uint32_t

from cefcython.capi.cef_string cimport cef_string_t

cdef extern from "include/internal/cef_types.h":
    ctypedef uint32_t cef_color_t

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

    ctypedef _cef_browser_settings_t cef_browser_settings_t

    ctypedef enum cef_color_model_t:
        COLOR_MODEL_UNKNOWN,
        COLOR_MODEL_GRAY,
        COLOR_MODEL_COLOR,
        COLOR_MODEL_CMYK,
        COLOR_MODEL_CMY,
        COLOR_MODEL_KCMY,
        COLOR_MODEL_CMY_K,
        COLOR_MODEL_BLACK,
        COLOR_MODEL_GRAYSCALE,
        COLOR_MODEL_RGB,
        COLOR_MODEL_RGB16,
        COLOR_MODEL_RGBA,
        COLOR_MODEL_COLORMODE_COLOR,
        COLOR_MODEL_COLORMODE_MONOCHROME,
        COLOR_MODEL_HP_COLOR_COLOR,
        COLOR_MODEL_HP_COLOR_BLACK,
        COLOR_MODEL_PRINTOUTMODE_NORMAL,
        COLOR_MODEL_PROCESSCOLORMODEL_CMYK,
        COLOR_MODEL_PROCESSCOLORMODEL_GREYSCALE,
        COLOR_MODEL_PROCESSCOLORMODEL_RGB,

    struct _cef_cookie_t:
        pass

    ctypedef _cef_cookie_t cef_cookie_t

    ctypedef enum cef_errorcode_t:
        pass

    ctypedef enum cef_duplex_mode_t:
        DUPLEX_MODE_UNKNOWN = -1,
        DUPLEX_MODE_SIMPLEX,
        DUPLEX_MODE_LONG_EDGE,
        DUPLEX_MODE_SHORT_EDGE,

    ctypedef enum cef_file_dialog_mode_t:
        pass

    ctypedef enum cef_key_event_type_t:
        pass

    struct _cef_key_event_t:
        pass

    ctypedef _cef_key_event_t cef_key_event_t

    ctypedef enum cef_log_severity_t:
        LOGSEVERITY_DEFAULT,
        LOGSEVERITY_VERBOSE,
        LOGSEVERITY_DEBUG = LOGSEVERITY_VERBOSE,
        LOGSEVERITY_INFO,
        LOGSEVERITY_WARNING,
        LOGSEVERITY_ERROR,
        LOGSEVERITY_FATAL,
        LOGSEVERITY_DISABLE=99

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

    cdef struct _cef_pdf_print_settings_t:
        pass

    ctypedef _cef_pdf_print_settings_t cef_pdf_print_settings_t

    struct _cef_popup_features_t:
        pass

    ctypedef _cef_popup_features_t cef_popup_features_t

    ctypedef enum cef_postdataelement_type_t:
        pass

    ctypedef enum cef_process_id_t:
        PID_BROWSER,
        PID_RENDERER

    struct _cef_rect_t:
        int x
        int y
        int width
        int height

    ctypedef _cef_rect_t cef_rect_t

    ctypedef enum cef_referrer_policy_t:
        pass

    struct _cef_request_context_settings_t:
        size_t size
        cef_string_t cache_path
        int persist_session_cookies
        int persist_user_preferences
        int ignore_certificate_errors
        cef_string_t accept_language_list

    ctypedef _cef_request_context_settings_t cef_request_context_settings_t

    ctypedef enum cef_resource_type_t:
        pass

    ctypedef enum cef_return_value_t:
        RV_CANCEL = 0,
        RV_CONTINUE,
        RV_CONTINUE_ASYNC

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

    struct _cef_size_t:
        int width
        int height

    ctypedef _cef_size_t cef_size_t

    ctypedef enum cef_state_t:
        STATE_DEFAULT = 0,
        STATE_ENABLED,
        STATE_DISABLED

    ctypedef enum cef_termination_status_t:
        TS_ABNORMAL_TERMINATION,
        TS_PROCESS_WAS_KILLED,
        TS_PROCESS_CRASHED,
        TS_PROCESS_OOM

    ctypedef enum cef_thread_id_t:
        TID_UI,
        TID_FILE_BACKGROUND,
        TID_FILE = TID_FILE_BACKGROUND,
        TID_FILE_USER_VISIBLE,
        TID_FILE_USER_BLOCKING,
        TID_PROCESS_LAUNCHER,
        TID_IO,
        TID_RENDERER

    ctypedef enum cef_transition_type_t:
        pass

    ctypedef enum cef_urlrequest_status_t:
        UR_UNKNOWN = 0,
        UR_SUCCESS,
        UR_IO_PENDING,
        UR_CANCELED,
        UR_FAILED

    ctypedef enum cef_v8_accesscontrol_t:
        V8_ACCESS_CONTROL_DEFAULT = 0,
        V8_ACCESS_CONTROL_ALL_CAN_READ = 1,
        V8_ACCESS_CONTROL_ALL_CAN_WRITE = 1 << 1,
        V8_ACCESS_CONTROL_PROHIBITS_OVERWRITING = 1 << 2

    ctypedef enum cef_v8_propertyattribute_t:
        V8_PROPERTY_ATTRIBUTE_NONE = 0,

        V8_PROPERTY_ATTRIBUTE_READONLY = 1 << 0,
        V8_PROPERTY_ATTRIBUTE_DONTENUM = 1 << 1,
        V8_PROPERTY_ATTRIBUTE_DONTDELETE = 1 << 2

    ctypedef enum cef_value_type_t:
        VTYPE_INVALID = 0,
        VTYPE_NULL,
        VTYPE_BOOL,
        VTYPE_INT,
        VTYPE_DOUBLE,
        VTYPE_STRING,
        VTYPE_BINARY,
        VTYPE_DICTIONARY,
        VTYPE_LIST

    ctypedef enum cef_window_open_disposition_t:
        pass

cdef extern from "include/internal/cef_types_linux.h":
    cdef struct _cef_composition_underline_t:
        pass

    ctypedef _cef_composition_underline_t cef_composition_underline_t

    ctypedef enum cef_drag_operations_mask_t:
        pass

    cdef struct _cef_mouse_event_t:
        pass

    ctypedef _cef_mouse_event_t cef_mouse_event_t

    ctypedef enum cef_paint_element_type_t:
        pass

    cdef struct _cef_point_t:
        pass

    ctypedef _cef_point_t cef_point_t

    cdef struct _cef_range_t:
        pass

    ctypedef _cef_range_t cef_range_t

    cdef struct _cef_touch_event_t:
        pass

    ctypedef _cef_touch_event_t cef_touch_event_t

    ctypedef unsigned long cef_window_handle_t

    cdef struct _cef_window_info_t:
        cef_string_t window_name

        unsigned int x, y
        unsigned int width, height

        cef_window_handle_t parent_window

        int windowless_rendering_enabled
        int shared_texture_enabled
        int external_begin_frame_enabled

        cef_window_handle_t window

    ctypedef _cef_window_info_t cef_window_info_t
