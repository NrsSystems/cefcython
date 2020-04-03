from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_string cimport cef_string_t, cef_string_userfree_t
from cefcython.capi.cef_string_list cimport cef_string_list_t
from cefcython.capi.cef_string_map cimport cef_string_map_t

cdef extern from "include/capi/cef_command_line_capi.h":
    cdef struct _cef_command_line_t:
        cef_base_ref_counted_t base

        int (* is_valid)(_cef_command_line_t *self)
        int (* is_read_only)(_cef_command_line_t *self)
        _cef_command_line_t *(* copy)(_cef_command_line_t *self)
        void (* init_from_argv)(_cef_command_line_t *self,
                                int argc,
                                const char **argv)
        void (* init_from_string)(_cef_command_line_t *self,
                                  const cef_string_t *command_line)
        void (* reset)(_cef_command_line_t *self)
        void (* get_argv)(_cef_command_line_t *self, cef_string_list_t argv)
        cef_string_userfree_t (* get_command_line_string)(
                _cef_command_line_t *self)
        cef_string_userfree_t (* get_program)(_cef_command_line_t *self)
        void (* set_program)(_cef_command_line_t *self,
                             const cef_string_t *program)
        int (* has_switches)(_cef_command_line_t *self)
        int (* has_switch)(_cef_command_line_t *self, const cef_string_t *name)
        cef_string_userfree_t (* get_switch_value)(_cef_command_line_t *self,
                                                   const cef_string_t *name)
        void (* get_switches)(_cef_command_line_t *self,
                              cef_string_map_t switches)
        void (* append_switch)(_cef_command_line_t *self, const cef_string_t *name)
        void (* append_switch_with_value)(_cef_command_line_t *self,
                                          const cef_string_t *name,
                                          const cef_string_t *value)
        int (* has_arguments)(_cef_command_line_t *self)
        void (* get_arguments)(_cef_command_line_t *self,
                               cef_string_list_t arguments)
        void (* append_argument)(_cef_command_line_t *self,
                                 const cef_string_t *argument)
        void (* prepend_wrapper)(_cef_command_line_t *self,
                                 const cef_string_t *wrapper)

    ctypedef _cef_command_line_t cef_command_line_t

    cef_command_line_t *cef_command_line_create()
    cef_command_line_t *cef_command_line_get_global()
