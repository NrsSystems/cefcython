from libc.stddef cimport size_t
from libc.stdint cimport uintptr_t
from libc.stdlib cimport free

from cefcython.capi cimport (cef_browser_t,
                             cef_app_t,
                             cef_client_t,
                             cef_display_handler_t,
                             cef_life_span_handler_t,
                             cef_request_handler_t,
                             cef_resource_request_handler_t)

from cefcython.capi.cef_v8 cimport (cef_v8exception_t,
                                    cef_v8handler_t,
                                    cef_v8stack_trace_t,
                                    cef_v8value_t)

DEF DEBUG_REFERENCE_COUNTING = 0

cdef dict _refcounts = {}

cdef size_t sizeof_cef_app_t = sizeof(cef_app_t)
cdef size_t sizeof_cef_base_ref_counted_t = sizeof(cef_base_ref_counted_t)
cdef size_t sizeof_cef_browser_t = sizeof(cef_browser_t)
cdef size_t sizeof_cef_client_t = sizeof(cef_client_t)
cdef size_t sizeof_cef_display_handler_t = sizeof(cef_display_handler_t)
cdef size_t sizeof_cef_life_span_handler_t = sizeof(cef_life_span_handler_t)
cdef size_t sizeof_cef_request_handler_t = sizeof(cef_request_handler_t)
cdef size_t sizeof_cef_resource_request_handler_t = sizeof(cef_resource_request_handler_t)
cdef size_t sizeof_cef_v8exception_t = sizeof(cef_v8exception_t)
cdef size_t sizeof_cef_v8handler_t = sizeof(cef_v8handler_t)
cdef size_t sizeof_cef_v8stack_trace_t = sizeof(cef_v8stack_trace_t)
cdef size_t sizeof_cef_v8value_t = sizeof(cef_v8value_t)

cdef const char *_get_base_type_str(cef_base_ref_counted_t *self) with gil:
    return ('NULL' if not self else
            'cef_app_t' if self.size == sizeof_cef_app_t else
            'cef_base_ref_counted_t' if self.size == sizeof_cef_base_ref_counted_t else
            'cef_browser_t' if self.size == sizeof_cef_browser_t else
            'cef_client_t' if self.size == sizeof_cef_client_t else
            'cef_display_handler_t' if self.size == sizeof_cef_display_handler_t else
            'cef_life_span_handler_t' if self.size == sizeof_cef_life_span_handler_t else
            'cef_request_handler_t' if self.size == sizeof_cef_request_handler_t else
            'cef_resource_request_handler_t' if self.size == sizeof_cef_resource_request_handler_t else
            'cef_v8exception_t' if self.size == sizeof_cef_v8exception_t else
            'cef_v8handler_t' if self.size == sizeof_cef_v8handler_t else
            'cef_v8stack_trace_t' if self.size == sizeof_cef_v8stack_trace_t else
            'cef_v8value_t' if self.size == sizeof_cef_v8value_t else
            'UNKNOWN')

cdef void add_ref(cef_base_ref_counted_t *self) with gil:
    global _refcounts
    cdef uintptr_t base = <uintptr_t>self

    IF DEBUG_REFERENCE_COUNTING:
        printf('[%s(0x%08lx)] add_ref\n', _get_base_type_str(self), base)

    if base not in _refcounts:
        _refcounts[base] = 1
    else:
        _refcounts[base] += 1
    cdef int refcount = _refcounts[base]

    IF DEBUG_REFERENCE_COUNTING:
        printf('[%s(0x%08lx)] added_ref: %i\n', _get_base_type_str(self), base, refcount)

cdef int release(cef_base_ref_counted_t *self) with gil:
    global _refcounts
    cdef uintptr_t base = <uintptr_t>self

    IF DEBUG_REFERENCE_COUNTING:
        printf('[%s(0x%08lx)] release\n', _get_base_type_str(self), base)

    if not base in _refcounts:
        IF DEBUG_REFERENCE_COUNTING:
            printf('[%s(0x%08lx)] released: False\n', _get_base_type_str(self), base)
        return False

    cdef int refcount
    if not _refcounts[base] - 1:
        _refcounts.pop(base)
        IF DEBUG_REFERENCE_COUNTING:
            printf('[%s(0x%08lx)] released: %i, True\n', _get_base_type_str(self), base, 0)
        free(self)
        return True
    else:
        _refcounts[base] -=1
        refcount = _refcounts[base]
        IF DEBUG_REFERENCE_COUNTING:
            printf('[%s(0x%08lx)] released: %i, False\n', _get_base_type_str(self), base, refcount)
        return False

cdef int has_one_ref(cef_base_ref_counted_t *self) with gil:
    cdef uintptr_t base = <uintptr_t>self
    cdef int ret = (_refcounts.get(base, 0) == 1)
    IF DEBUG_REFERENCE_COUNTING:
        printf('[%s(0x%08lx)] has_one_ref: %i\n', _get_base_type_str(self), base, ret)
    return ret

cdef int has_at_least_one_ref(cef_base_ref_counted_t *self) with gil:
    cdef uintptr_t base = <uintptr_t>self
    cdef int ret = (_refcounts.get(base, 0) >= 1)
    IF DEBUG_REFERENCE_COUNTING:
        printf('[%s(0x%08lx)] has_at_least_one_ref: %i\n', _get_base_type_str(self), base, ret)
    return ret

cdef void cef_base_ref_counted_init(cef_base_ref_counted_t *base):
    if base.size <= 0:
        printf("[%s(0x%08lx)] FATAL: cef_base_ref_counted_init failed, size member not set\n",
                _get_base_type_str(base), base)
        exit(1)

    IF DEBUG_REFERENCE_COUNTING:
        printf('[%s(0x%08lx)] cef_base_ref_counted_init\n', _get_base_type_str(base), base)

    base.add_ref = add_ref
    base.release = release
    base.has_one_ref = has_one_ref
    base.has_at_least_one_ref = has_at_least_one_ref

    base.add_ref(base)
