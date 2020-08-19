from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_browser cimport _cef_browser_t
from cefcython.capi.cef_print_settings cimport _cef_print_settings_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_types cimport cef_size_t
from cefcython.capi.cef_values cimport _cef_list_value_t

cdef extern from "include/capi/cef_print_handler_capi.h":
    struct _cef_print_dialog_callback_t:
        pass

    ctypedef _cef_print_dialog_callback_t cef_print_dialog_callback_t

    struct _cef_print_job_callback_t:
        pass

    ctypedef _cef_print_job_callback_t cef_print_job_callback_t

    struct _cef_print_handler_t:
        cef_base_ref_counted_t base

        void (* on_print_start)(_cef_print_handler_t *self,
                                _cef_browser_t *browser)
        void (* on_print_settings)(_cef_print_handler_t *self,
                                   _cef_browser_t *browser,
                                   _cef_print_settings_t *settings,
                                   int get_defaults)
        int (* on_print_dialog)(_cef_print_handler_t *self,
                                _cef_browser_t *browser,
                                int has_selection,
                                _cef_print_dialog_callback_t *callback)
        int (* on_print_job)(_cef_print_handler_t *self,
                             _cef_browser_t *browser,
                             const cef_string_t *document_name,
                             const cef_string_t *pdf_file_path,
                             _cef_print_job_callback_t *callback)
        void (* on_print_reset)(_cef_print_handler_t *self,
                                _cef_browser_t *browser)
        cef_size_t (* get_pdf_paper_size)(_cef_print_handler_t *self,
                                          int device_units_per_inch)

    ctypedef _cef_print_handler_t cef_print_handler_t
