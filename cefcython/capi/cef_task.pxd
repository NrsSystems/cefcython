from cefcython.capi.cef_base cimport cef_base_ref_counted_t
from cefcython.capi.cef_types cimport cef_thread_id_t

from libc.stdint cimport int64_t

cdef extern from "include/capi/cef_task_capi.h":
    struct _cef_task_t:
        cef_base_ref_counted_t base

        void (* execute)(_cef_task_t *self)

    ctypedef _cef_task_t cef_task_t

    struct _cef_task_runner_t:
        cef_base_ref_counted_t base

        int (* is_same)(_cef_task_runner_t *self,
                        _cef_task_runner_t *that)
        int (* belongs_to_current_thread)(_cef_task_runner_t *self)
        int (* belongs_to_thread)(_cef_task_runner_t *self, cef_thread_id_t threadId)
        int (* post_task)(_cef_task_runner_t *self, _cef_task_t *task)
        int (* post_delayed_task)(_cef_task_runner_t *self,
                                  _cef_task_t *task,
                                  int64_t delay_ms)

    ctypedef _cef_task_runner_t cef_task_runner_t

    cef_task_runner_t *cef_task_runner_get_for_current_thread()
    cef_task_runner_t *cef_task_runner_get_for_thread(cef_thread_id_t threadId)
    int cef_currently_on(cef_thread_id_t threadId)
    int cef_post_task(cef_thread_id_t threadId, cef_task_t *task)
    int cef_post_delayed_task(cef_thread_id_t threadId,
                              cef_task_t *task,
                              int64_t delay_ms)
