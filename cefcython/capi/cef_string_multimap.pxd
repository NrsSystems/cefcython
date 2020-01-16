from libc.stddef cimport size_t

from cefcython.capi cimport cef_string_t

cdef extern from "include/internal/cef_string_multimap.h":
    ctypedef void *cef_string_multimap_t

    cef_string_multimap_t cef_string_multimap_alloc()
    size_t cef_string_multimap_size(cef_string_multimap_t map)
    size_t cef_string_multimap_find_count(cef_string_multimap_t map,
                                          const cef_string_t *key)
    int cef_string_multimap_enumerate(cef_string_multimap_t map,
                                      const cef_string_t *key,
                                      size_t value_index,
                                      cef_string_t *value)
    int cef_string_multimap_key(cef_string_multimap_t map,
                                size_t index,
                                cef_string_t *key)
    int cef_string_multimap_value(cef_string_multimap_t map,
                                  size_t index,
                                  cef_string_t *value)
    int cef_string_multimap_append(cef_string_multimap_t map,
                                   const cef_string_t *key,
                                   const cef_string_t *value)
    void cef_string_multimap_clear(cef_string_multimap_t map)
    void cef_string_multimap_free(cef_string_multimap_t map)
