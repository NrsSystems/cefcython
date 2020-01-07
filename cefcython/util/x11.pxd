cdef extern from '<X11/Xlib.h>':
    struct _XDisplay:
        pass

    ctypedef _XDisplay Display
    ctypedef unsigned long XID
    ctypedef struct XErrorEvent:
        int type
        Display *display
        XID resourceid
        unsigned long serial
        unsigned long error_code
        unsigned long request_code
        unsigned long minor_code

    ctypedef int (* XErrorHandler)(Display *, XErrorEvent *)
    XErrorHandler XSetErrorHandler(XErrorHandler)
    ctypedef int (* XIOErrorHandler)(Display *)
    XIOErrorHandler XSetIOErrorHandler(XIOErrorHandler)
    
