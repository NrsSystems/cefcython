from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_string cimport cef_string_t, cef_string_userfree_t
from cefcython.capi.cef_types cimport (cef_color_model_t,
                                       cef_duplex_mode_t,
                                       cef_range_t,
                                       cef_rect_t,
                                       cef_size_t)

from libc.stddef cimport size_t

cdef extern from "include/capi/cef_print_settings_capi.h":
    struct _cef_print_settings_t:
        cef_base_ref_counted_t base

        int (* is_valid)(_cef_print_settings_t *self)
        int (* is_read_only)(_cef_print_settings_t *self)
        void (* set_orientation)(_cef_print_settings_t *self,
                                 int landscape)
        void (* set_printer_printable_area)(_cef_print_settings_t *self,
                                            const cef_size_t *physical_size_device_units,
                                            const cef_rect_t *printable_area_device_units,
                                            int landscape_needs_flip)
        void (* set_device_name)(_cef_print_settings_t *self,
                                 const cef_string_t *name)
        cef_string_userfree_t (* get_device_name)(_cef_print_settings_t *self)
        void (* set_dpi)(_cef_print_settings_t *self, int dpi)
        int (* get_dpi)(_cef_print_settings_t *self)
        void (* set_page_ranges)(_cef_print_settings_t *self,
                                size_t rangesCount,
                                cef_range_t *ranges)
        size_t (* get_page_ranges_count)(_cef_print_settings_t *self)
        void (* get_page_ranges)(_cef_print_settings_t *self,
                                 size_t *rangesCount,
                                 cef_range_t *ranges)
        void (* set_selection_only)(_cef_print_settings_t *self,
                                    int selection_only)
        int (* is_selection_only)(_cef_print_settings_t *self)
        void (* set_collate)(_cef_print_settings_t *self,
                             int collate)
        int (* will_collate)(_cef_print_settings_t *self)
        void (* set_color_model)(_cef_print_settings_t *self,
                                 cef_color_model_t model)
        cef_color_model_t (* get_color_model)(_cef_print_settings_t *self)
        void (* set_copies)(_cef_print_settings_t *self,
                            int copies)
        int (* get_copies)(_cef_print_settings_t *self)
        void (* set_duplex_mode)(_cef_print_settings_t *self,
                                 cef_duplex_mode_t mode)
        cef_duplex_mode_t (* get_duplex_mode)(_cef_print_settings_t *self)

    ctypedef _cef_print_settings_t cef_print_settings_t

    cef_print_settings_t *cef_print_settings_create()
