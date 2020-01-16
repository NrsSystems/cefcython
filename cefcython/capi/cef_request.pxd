from libc.stdint cimport uint64_t

from cefcython.capi.cef_base cimport cef_base_ref_counted_t

from cefcython.capi.cef_types cimport (cef_postdataelement_type_t,
                                       cef_referrer_policy_t,
                                       cef_resource_type_t,
                                       cef_transition_type_t)

from cefcython.capi.cef_string_multimap cimport cef_string_multimap_t

from cefcython.capi.cef_string cimport (cef_string_t,
                                        cef_string_userfree_t)

cdef extern from "include/capi/cef_request_capi.h":
    struct _cef_request_t:
        cef_base_ref_counted_t base
        int (* is_read_only)(_cef_request_t *self)
        cef_string_userfree_t (* get_url)(_cef_request_t *self)
        void (* set_url)(_cef_request_t *self, const cef_string_t *url)
        cef_string_userfree_t (* get_method)(_cef_request_t *self)
        void (* set_method)(_cef_request_t *self, const cef_string_t *method)
        void (* set_referrer)(_cef_request_t *self,
                              const cef_string_t *referrer_url,
                              cef_referrer_policy_t policy)
        cef_string_userfree_t (* get_referrer_url)(_cef_request_t *self)
        cef_referrer_policy_t (* get_referrer_policy)(_cef_request_t *self)
        _cef_post_data_t (* get_post_data)(_cef_request_t *self)
        void (* set_post_data)(_cef_request_t *self, _cef_post_data_t *postData)
        void (* get_header_map)(_cef_request_t *self, cef_string_multimap_t headerMap)
        void (* set_header_map)(_cef_request_t *self, cef_string_multimap_t headerMap)
        cef_string_userfree_t (* get_header_by_name)(_cef_request_t *self,
                                                     const cef_string_t *name)
        void (* set_header_by_name)(_cef_request_t *self,
                                    const cef_string_t *name,
                                    const cef_string_t *value,
                                    int overwrite)
        void (* set)(_cef_request_t *self,
                     const cef_string_t *url,
                     const cef_string_t *method,
                     _cef_post_data_t *postData,
                     cef_string_multimap_t headerMap)
        int (* get_flags)(_cef_request_t *self)
        void (* set_flags)(_cef_request_t *self, int flags)
        cef_string_userfree_t (* get_first_party_for_cookies)(_cef_request_t *self)
        void (* set_first_part_for_cookies)(_cef_request_t *self,
                                            const cef_string_t *url)
        cef_resource_type_t (* get_resource_type)(_cef_request_t *self)
        cef_transition_type_t (* get_transition_type)(_cef_request_t *self)
        uint64_t (* get_identifier)(_cef_request_t *self)

    ctypedef _cef_request_t cef_request_t

    cef_request_t *cef_request_create()

    struct _cef_post_data_t:
        cef_base_ref_counted_t base
        int (* is_read_only)(_cef_post_data_t *self)
        int (* has_excluded_elements)(_cef_post_data_t *self)
        size_t (* get_element_count)(_cef_post_data_t *self)
        void (* get_elements)(_cef_post_data_t *self,
                              size_t *elementsCount,
                              _cef_post_data_element_t **elements)
        int (* remove_element)(_cef_post_data_t *self, _cef_post_data_element_t *element)
        int (* add_element)(_cef_post_data_t *self, _cef_post_data_element_t *element)
        void (* remove_elements)(_cef_post_data_t *self)

    ctypedef _cef_post_data_t cef_post_data_t

    struct _cef_post_data_element_t:
        cef_base_ref_counted_t base
        int (* is_read_only)(_cef_post_data_element_t *self)
        void (* set_to_empty)(_cef_post_data_element_t *self)
        void (* set_to_file)(_cef_post_data_element_t *self,
                             const cef_string_t *fileName)
        void (* set_to_bytes)(_cef_post_data_element_t *self,
                              size_t size,
                              const void *bytes)
        cef_postdataelement_type_t (* get_type)(_cef_post_data_element_t *self)
        cef_string_userfree_t (* get_file)(_cef_post_data_element_t *self)
        size_t (* get_bytes_count)(_cef_post_data_element_t *self)
        size_t (* get_bytes)(_cef_post_data_element_t *self,
                             size_t size,
                             void *bytes)
    ctypedef _cef_post_data_element_t cef_post_data_element_t

    cef_post_data_element_t *cef_post_data_element_create()
