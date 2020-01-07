from libc.stdio cimport printf

cdef extern from "include/capi/cef_base_capi.h":
    cdef struct _cef_base_ref_counted_t:
        size_t size

        void (* add_ref)(_cef_base_ref_counted_t *self)
        int (* release)(_cef_base_ref_counted_t *self)
        int (* has_one_ref)(_cef_base_ref_counted_t *self)
        int (* has_at_least_one_ref)(_cef_base_ref_counted_t *self)

    ctypedef _cef_base_ref_counted_t cef_base_ref_counted_t

cdef void initialize_cef_base_ref_counted(cef_base_ref_counted_t *base)

