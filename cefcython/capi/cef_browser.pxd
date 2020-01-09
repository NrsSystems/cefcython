from libc.stdint cimport uint32_t, int64_t

from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_client cimport _cef_client_t
from cefcython.capi.cef_drag_data cimport _cef_drag_data_t
from cefcython.capi.cef_extension cimport _cef_extension_t
from cefcython.capi.cef_frame cimport _cef_frame_t
from cefcython.capi.cef_navigation_entry cimport _cef_navigation_entry_t
from cefcython.capi.cef_request_context cimport _cef_request_context_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_string_list cimport cef_string_list_t
from cefcython.capi.cef_types cimport (_cef_browser_settings_t,
                                       _cef_key_event_t,
                                       _cef_mouse_event_t,
                                       _cef_pdf_print_settings_t,
                                       _cef_touch_event_t,
                                       _cef_window_info_t,
                                       cef_composition_underline_t,
                                       cef_drag_operations_mask_t,
                                       cef_file_dialog_mode_t,
                                       cef_paint_element_type_t,
                                       cef_point_t,
                                       cef_range_t,
                                       cef_size_t,
                                       cef_state_t,
                                       cef_window_handle_t,
                                       cef_window_info_t)
from cefcython.capi.cef_values cimport _cef_dictionary_value_t

cdef extern from "include/capi/cef_browser_capi.h":
    cdef struct _cef_browser_t:
        cef_base_ref_counted_t base

        _cef_browser_host_t *(* get_host)(_cef_browser_t *self)

        int (* can_go_back)(_cef_browser_t *self)
        void (* go_back)(_cef_browser_t *self)
        int (* can_go_forward)(_cef_browser_t *self)
        void (* go_forward)(_cef_browser_t *self)
        int (* is_loading)(_cef_browser_t *self)
        void (* reload)(_cef_browser_t *self)
        void (* reload_ignore_cache)(_cef_browser_t *self)
        void (* stop_load)(_cef_browser_t *self)
        int (* get_identifier)(_cef_browser_t *self)
        void (* is_same)(_cef_browser_t *self, _cef_browser_t *that)
        int (* is_popup)(_cef_browser_t *self)
        int (* has_document)(_cef_browser_t *self)
        _cef_frame_t *(* get_main_frame)(_cef_browser_t *self)
        _cef_frame_t *(* get_focused_frame)(_cef_browser_t *self)
        _cef_frame_t *(* get_frame_byident)(_cef_browser_t *self,
                                            int64_t identifier)
        _cef_frame_t *(* get_frame)(_cef_browser_t *self,
                                   const cef_string_t *name)
        size_t (* get_frame_count)(_cef_browser_t *self)
        void (* get_frame_identifiers)(_cef_browser_t *self,
                                       size_t *identifiersCount,
                                       int64_t *identifiers)
        void (* get_frame_names)(_cef_browser_t *self,
                                 cef_string_list_t names)

    ctypedef _cef_browser_t cef_browser_t

    cdef struct _cef_browser_host_t:
        cef_base_ref_counted_t base

        _cef_browser_t *(* get_browser)(_cef_browser_host_t *self)

        void (* close_browser)(_cef_browser_host_t *self, int force_close)
        int (* try_close_browser)(_cef_browser_host_t *self)
        void (* set_focus)(_cef_browser_host_t *self)
        cef_window_handle_t (* get_window_handle)(_cef_browser_host_t *self)
        cef_window_handle_t (* get_opener_window_handle)(_cef_browser_host_t self)
        int (* has_view)(_cef_browser_host_t *self)
        _cef_client_t *(* get_client)(_cef_browser_host_t *self)
        double (* get_zoom_level)(_cef_browser_host_t *self)
        void (* set_zoom_level)(_cef_browser_host_t *self, double zoomLevel)
        void (* run_file_dialog)(_cef_browser_host_t *self,
                                 cef_file_dialog_mode_t mode,
                                 const cef_string_t *title,
                                 const cef_string_t *default_file_path,
                                 cef_string_list_t accept_filters,
                                 int selected_accept_filter,
                                 _cef_run_file_dialog_callback_t *callback)
        void (* start_download)(_cef_browser_host_t *self,
                                const cef_string_t *url)
        void (* download_image)(_cef_browser_host_t *self,
                                const cef_string_t *image_url,
                                int is_favicon,
                                uint32_t max_image_size,
                                int bypass_cache,
                                _cef_download_image_callback_t *callback)
        void (* print_)(_cef_browser_host_t *self)
        void (* print_to_pdf)(_cef_browser_host_t *self,
                              const cef_string_t *path,
                              const _cef_pdf_print_settings_t *settings,
                              _cef_pdf_print_callback_t *callback)
        void (* find)(_cef_browser_host_t *self,
                      int identifier,
                      const cef_string_t searchText,
                      int forward,
                      int matchCase,
                      int findNext)
        void (* stop_finding)(_cef_browser_host_t *self,
                              int clearSelection)
        void (* show_dev_tools)(_cef_browser_host_t *self,
                                const _cef_window_info_t *windowInfo,
                                _cef_client_t *client,
                                const _cef_browser_settings_t *settings,
                                const cef_point_t *inspect_element_at)
        void (* close_dev_tools)(_cef_browser_host_t *self)
        int (* has_dev_tools)(_cef_browser_host_t *self)
        void (* get_navigation_entries)(_cef_browser_host_t *self,
                                        _cef_navigation_entry_visitor_t *visitor,
                                        int current_only)
        void (* set_mouse_cursor_change_disabled)(_cef_browser_host_t *self,
                                                  int disabled)
        int (* is_mouse_cursor_change_disabled)(_cef_browser_host_t *self)
        void (* replace_misspelling)(_cef_browser_host_t *self,
                                     const cef_string_t *word)
        void (* add_word_to_dictionary)(_cef_browser_host_t *self,
                                        const cef_string_t *word)
        int (* is_window_rendering_disabled)(_cef_browser_host_t *self)
        void (* was_resized)(_cef_browser_host_t *self)
        void (* was_hidden)(_cef_browser_host_t *self, int hidden)
        void (* notify_screen_info_changed)(_cef_browser_host_t *self)
        void (* invalidate)(_cef_browser_host_t *self,
                            cef_paint_element_type_t type)
        void (* send_external_frame_begin)(_cef_browser_host_t *self)
        void (* send_key_event)(_cef_browser_host_t *self,
                                const _cef_key_event_t *event)
        void (* send_mouse_click_event)(_cef_browser_host_t *self,
                                        const _cef_mouse_event_t *event)
        void (* send_mouse_move_event)(_cef_browser_host_t *self,
                                       const _cef_mouse_event_t *event,
                                       int mouseLeave)
        void (* send_mouse_wheel_event)(_cef_browser_host_t *self,
                                        const _cef_mouse_event_t *event,
                                        int deltaX,
                                        int deltaY)
        void (* send_touch_event)(_cef_browser_host_t *self,
                                  const _cef_touch_event_t *event)
        void (* send_focus_event)(_cef_browser_host_t *self,
                                  int setFocus)
        void (* send_capture_lost_event)(_cef_browser_host_t *self)
        void (* notify_move_or_resize_started)(_cef_browser_host_t *self)
        int (* get_windowless_frame_rate)(_cef_browser_host_t *self)
        void (* set_windowless_frame_rate)(_cef_browser_host_t *self,
                                           int frame_rate)
        void (* ime_set_composition)(_cef_browser_host_t *self,
                                     const cef_string_t *text,
                                     size_t underlinesCount,
                                     cef_composition_underline_t *underlines,
                                     const cef_range_t *replacement_range,
                                     const cef_range_t *selection_range)
        void (* ime_commit_text)(_cef_browser_host_t *self,
                                 const cef_string_t *text,
                                 const cef_range_t *replacement_range,
                                 int relative_cursor_pos)
        void (* ime_finish_composing_text)(_cef_browser_host_t *self,
                                           int keep_selection)
        void (* ime_cancel_composition)(_cef_browser_host_t *self)
        void (* drag_target_drag_enter)(_cef_browser_host_t *self,
                                        _cef_drag_data_t *drag_data,
                                        const _cef_mouse_event_t *event,
                                        cef_drag_operations_mask_t allowed_ops)
        void (* drag_target_drag_over)(_cef_browser_host_t *self,
                                       const _cef_mouse_event_t *event,
                                       cef_drag_operations_mask_t allowed_ops)
        void (* drag_target_drag_leave)(_cef_browser_host_t *self)
        void (* drag_target_drag_drop)(_cef_browser_host_t *self,
                                       const _cef_mouse_event_t *event)
        void (* drag_source_ended_at)(_cef_browser_host_t *self,
                                      int x,
                                      int y,
                                      cef_drag_operations_mask_t op)
        void (* drag_source_system_drag_ended)(_cef_browser_host_t *self)
        _cef_navigation_entry_t *(* get_visible_navigation_entry)(_cef_browser_host_t *self)
        void (* set_accessibility_state)(_cef_browser_host_t *self,
                                         cef_state_t accessibility_state)
        void (* set_auto_resize_enabled)(_cef_browser_host_t *self,
                                         int enabled,
                                         const cef_size_t *min_size,
                                         const cef_size_t *max_size)
        _cef_extension_t *(* get_extension)(_cef_browser_host_t *self)
        int (* is_background_host)(_cef_browser_host_t *self)
        void (* set_audio_muted)(_cef_browser_host_t *self, int mute)
        int (* is_audio_muted)(_cef_browser_host_t *self)

    ctypedef _cef_browser_host_t cef_browser_host_t

    int cef_browser_host_create_browser(
            const cef_window_info_t *window_info,
            _cef_client_t *client,
            const cef_string_t *url,
            const _cef_browser_settings_t *settings,
            _cef_dictionary_value_t *extra_info,
            _cef_request_context_t *request_context)

    cef_browser_t *cef_browser_host_create_browser_sync(
            const cef_window_info_t *window_info,
            _cef_client_t *client,
            cef_string_t *url,
            const _cef_browser_settings_t *settings,
            _cef_dictionary_value_t *extra_info,
            _cef_request_context_t *request_context)

    cdef struct _cef_run_file_dialog_callback_t:
        pass

    ctypedef _cef_run_file_dialog_callback_t cef_run_file_dialog_callback_t

    cdef struct _cef_download_image_callback_t:
        pass

    ctypedef _cef_download_image_callback_t cef_download_image_callback_t

    cdef struct _cef_pdf_print_callback_t:
        pass

    ctypedef _cef_pdf_print_callback_t cef_pdf_print_callback_t

    cdef struct _cef_navigation_entry_visitor_t:
        pass

    ctypedef _cef_navigation_entry_visitor_t cef_navigation_entry_visitor_t

    cdef struct _cef_touch_event_t:
        pass

    ctypedef _cef_touch_event_t cef_touch_event_t
