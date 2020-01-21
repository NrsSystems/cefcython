from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_browser cimport _cef_browser_t
from cefcython.capi.cef_frame cimport _cef_frame_t
from cefcython.capi.cef_string cimport cef_string_t
from cefcython.capi.cef_types cimport (cef_errorcode_t,
                                       cef_transition_type_t)

cdef extern from "include/capi/cef_load_handler_capi.h":
    struct _cef_load_handler_t:
        cef_base_ref_counted_t base

        void (* on_loading_state_change)(_cef_load_handler_t *self,
                                         _cef_browser_t *browser,
                                         int isLoading,
                                         int canGoBack,
                                         int canGoForward)

        void (* on_load_start)(_cef_load_handler_t *self,
                               _cef_browser_t *browser,
                               _cef_frame_t *frame,
                               cef_transition_type_t transition_type)

        void (* on_load_end)(_cef_load_handler_t *self,
                             _cef_browser_t *browser,
                             _cef_frame_t *frame,
                             int httpStatusCode)

        void (* on_load_error)(_cef_load_handler_t *self,
                               _cef_browser_t *browser,
                               _cef_frame_t *frame,
                               cef_errorcode_t errorCode,
                               const cef_string_t *errorText,
                               const cef_string_t *failedUrl)

    ctypedef _cef_load_handler_t cef_load_handler_t

