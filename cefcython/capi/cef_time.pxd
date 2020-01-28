from libc.time cimport time_t

cdef extern from "include/internal/cef_time.h":
    struct _cef_time_t:
        int year

        int month
        int day_of_week
        int day_of_month
        int hour
        int minute
        int second

        int millisecond

    ctypedef _cef_time_t cef_time_t

    int cef_time_to_timet(const cef_time_t *cef_time, time_t *time)
    int cef_time_from_timet(time_t time, cef_time_t *cef_time)

    int cef_time_to_doublet(const cef_time_t *cef_time, double *time)
    int cef_time_from_doublet(double time, cef_time_t *cef_time)

    int cef_time_now(cef_time_t *cef_time)
    int cef_time_delta(const cef_time_t *cef_time1,
                       const cef_time_t *cef_time2,
                       long long *delta)
