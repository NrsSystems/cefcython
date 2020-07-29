from cefcython.capi.cef_callback cimport _cef_completion_callback_t
from cefcython.capi.cef_cookie cimport _cef_cookie_manager_t
from cefcython.capi.cef_extension cimport _cef_extension_t
from cefcython.capi.cef_extension_handler cimport _cef_extension_handler_t
from cefcython.capi.cef_request_context_handler cimport _cef_request_context_handler_t
from cefcython.capi.cef_scheme cimport _cef_scheme_handler_factory_t
from cefcython.capi.cef_string cimport cef_string_t, cef_string_userfree_t
from cefcython.capi.cef_string_list cimport cef_string_list_t
from cefcython.capi.cef_types cimport _cef_request_context_settings_t
from cefcython.capi.cef_values cimport _cef_dictionary_value_t, _cef_value_t

cdef extern from "include/capi/cef_request_context_capi.h":
    struct _cef_resolve_callback_t:
        pass

    ctypedef _cef_resolve_callback_t cef_resolve_callback_t

    struct _cef_request_context_t:
        int (* is_same)(_cef_request_context_t *self,
                        _cef_request_context_t *other)
        int (* is_sharing_with)(_cef_request_context_t *self,
                                _cef_request_context_t *other)
        int (* is_global)(_cef_request_context_t *self)

        _cef_request_context_handler_t *(* get_handler)(
                _cef_request_context_t *self)
        cef_string_userfree_t (* get_cache_path)(_cef_request_context_t *self)
        _cef_cookie_manager_t *(* get_cookie_manager)(
                _cef_request_context_t *self,
                _cef_completion_callback_t *callback)
        int (* register_scheme_handler_factory)(_cef_request_context_t *self,
                                                const cef_string_t *scheme_name,
                                                const cef_string_t *domain_name,
                                                _cef_scheme_handler_factory_t *factory)
        int (* clear_scheme_handler_factories)(_cef_request_context_t *self)
        void (* purge_plugin_list_cache)(_cef_request_context_t *self,
                                         int reload_pages)
        int (* has_preference)(_cef_request_context_t *self,
                               const cef_string_t *name)
        _cef_value_t *(* get_preference)(_cef_request_context_t *self,
                                         const cef_string_t *name)
        _cef_dictionary_value_t *(* get_all_preferences)(_cef_request_context_t *self,
                                                         int include_defaults)
        int (* can_set_preference)(_cef_request_context_t *self,
                                   const cef_string_t *name)
        int (* set_preference)(_cef_request_context_t *self,
                               const cef_string_t *name,
                               _cef_value_t *value,
                               cef_string_t *error)
        void (* clear_certificate_exceptions)(_cef_request_context_t *self,
                                              _cef_completion_callback_t *callback)
        void (* clear_http_auth_credentials)(_cef_request_context_t *self,
                                             _cef_completion_callback_t *callback)
        void (* close_call_connections)(_cef_request_context_t *self,
                                        _cef_completion_callback_t *callback)
        void (* resolve_host)(_cef_request_context_t *self,
                              const cef_string_t *origin,
                              _cef_resolve_callback_t *callback)
        void (* load_extension)(_cef_request_context_t *self,
                                const cef_string_t *root_directory,
                                _cef_dictionary_value_t *manifest,
                                _cef_extension_handler_t *handler)
        int (* did_load_extension)(_cef_request_context_t *self,
                                   const cef_string_t *extension_id)
        int (* has_extension)(_cef_request_context_t *self,
                              const cef_string_t *extension_id)
        int (* get_extensions)(_cef_request_context_t *self,
                               cef_string_list_t extension_ids)
        _cef_extension_t *(* get_extension)(_cef_request_context_t *self,
                                            const cef_string_t *extension_id)

    ctypedef _cef_request_context_t cef_request_context_t

    cef_request_context_t *cef_request_context_get_global_context()
    cef_request_context_t *cef_request_context_create_context(
            const _cef_request_context_settings_t *settings,
            _cef_request_context_handler_t *handler)
    cef_request_context_t *cef_create_context_shared(
            cef_request_context_t *other,
            _cef_request_context_handler_t *handler)
