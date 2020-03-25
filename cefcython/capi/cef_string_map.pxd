from cefcython.capi.cef_string cimport cef_string_t

from libc.stddef cimport size_t

cdef extern from "include/internal/cef_string_map.h":
    ctypedef void *cef_string_map_t

    cef_string_map_t cef_string_map_alloc()
    size_t cef_string_map_size(cef_string_map_t map)
    int cef_string_map_find(cef_string_map_t map,
                            const cef_string_t *key,
                            cef_string_t *value)
    int cef_string_map_key(cef_string_map_t map,
                           size_t index,
                           cef_string_t *key)
    int cef_string_map_value(cef_string_map_t map,
                             size_t index,
                             cef_string_t *value)
    int cef_string_map_append(cef_string_map_t map,
                              const cef_string_t *key,
                              const cef_string_t *value)

    void cef_string_map_clear(cef_string_map_t map)
    void cef_string_map_free(cef_string_map_t map)
