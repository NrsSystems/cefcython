from libc.stddef cimport size_t
from libc.stdint cimport uintptr_t

from cefcython.capi cimport (cef_browser_t,
                             cef_app_t,
                             cef_client_t)

DEF DEBUG_REFERENCE_COUNTING = 0

cdef dict _refcounts = {}

cdef size_t sizeof_cef_app_t = sizeof(cef_app_t)
cdef size_t sizeof_cef_base_ref_counted_t = sizeof(cef_base_ref_counted_t)
cdef size_t sizeof_cef_browser_t = sizeof(cef_browser_t)
cdef size_t sizeof_cef_client_t = sizeof(cef_client_t)
#cdef size_t sizeof_cef_v8handler_t = sizeof(cef_v8_handler_t)
#cdef size_t sizeof_cef_v8value_t = sizeof(cef_v8value_t)

cdef const char *_get_base_type_str(cef_base_ref_counted_t *self) with gil:
    if not self:
        return "UNKNOWN"
    elif self.size == sizeof_cef_app_t:
        return 'cef_app_t'
    elif self.size == sizeof_cef_base_ref_counted_t:
        return 'cef_base_ref_counted_t'
    elif self.size == sizeof_cef_browser_t:
        return 'cef_browser_t'
    elif self.size == sizeof_cef_client_t:
        return 'cef_client_t'

cdef void add_ref(cef_base_ref_counted_t *self) with gil:
    global _refcounts
    cdef uintptr_t base = <uintptr_t>self
    printf('[%s(0x%08lx)] add_ref\n', _get_base_type_str(self), base)
    if base not in _refcounts:
        _refcounts[base] = 1
    else:
        _refcounts[base] += 1
    cdef int refcount = _refcounts[base]
    printf('[%s(0x%08lx)] added_ref: %i\n', _get_base_type_str(self), base, refcount)

cdef int release(cef_base_ref_counted_t *self) with gil:
    global _refcounts
    cdef uintptr_t base = <uintptr_t>self
    printf('[%s(0x%08lx)] release\n', _get_base_type_str(self), base)
    if not base in _refcounts:
        printf('[%s(0x%08lx)] released: False\n', _get_base_type_str(self), base)
        return False

    cdef int refcount
    if not _refcounts[base] - 1:
        _refcounts.pop(base)
        printf('[%s(0x%08lx)] released: %i, True\n', _get_base_type_str(self), base, 0)
        return True
    else:
        _refcounts[base] -=1
        refcount = _refcounts[base]
        printf('[%s(0x%08lx)] released: %i, False\n', _get_base_type_str(self), base, refcount)
        return False

cdef int has_one_ref(cef_base_ref_counted_t *self) with gil:
    cdef uintptr_t base = <uintptr_t>self
    cdef int ret = (_refcounts.get(base, 0) == 1)
    printf('[%s(0x%08lx)] has_one_ref: %i\n', _get_base_type_str(self), base, ret)
    return ret

cdef int has_at_least_one_ref(cef_base_ref_counted_t *self) with gil:
    cdef uintptr_t base = <uintptr_t>self
    cdef int ret = (_refcounts.get(base, 0) >= 1)
    printf('[%s(0x%08lx)] has_at_least_one_ref: %i\n', _get_base_type_str(self), base, ret)
    return ret

cdef void cef_base_ref_counted_init(cef_base_ref_counted_t *base):
    if base.size <= 0:
        printf("FATAL: initiailize_cef_base failed, size member not set\n")
        exit(1)

    printf('[%s(0x%08lx)] init_cef_base\n', _get_base_type_str(base), base)
    base.add_ref = add_ref
    base.release = release
    base.has_one_ref = has_one_ref
    base.has_at_least_one_ref = has_at_least_one_ref
