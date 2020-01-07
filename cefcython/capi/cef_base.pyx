from libc.stddef cimport size_t

DEF DEBUG_REFERENCE_COUNTING = 0

cdef void DEBUG_CALLBACK(char *msg):
    printf(msg)

cdef void add_ref(cef_base_ref_counted_t *self):
    DEBUG_CALLBACK("cef_base_ref_counted_t.add_ref\n")
    if DEBUG_REFERENCE_COUNTING:
        printf("+")

cdef int release(cef_base_ref_counted_t *self):
    DEBUG_CALLBACK("cef_base_ref_counted_t.release\n")
    if DEBUG_REFERENCE_COUNTING:
        printf("-")
    return 1

cdef int has_one_ref(cef_base_ref_counted_t *self):
    DEBUG_CALLBACK("cef_bae_ref_counted_t.has_one_ref\n")
    if DEBUG_REFERENCE_COUNTING:
        printf("=")
    return 1

cdef void initialize_cef_base_ref_counted(cef_base_ref_counted_t *base):
    cdef size_t size = base.size
    if size <= 0:
        printf("FATAL: initiailize_cef_base failed, size member not set\n")
        exit(1)

    base.add_ref = add_ref
    base.release = release
    base.has_one_ref = has_one_ref
