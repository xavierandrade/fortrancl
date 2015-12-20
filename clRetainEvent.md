Increments the event reference count.

Interface to OpenCL [clRetainEvent](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clRetainEvent.html).

## Interface ##

```Fortran

subroutine clRetainEvent(event, errcode_ret)
type(cl_event),   intent(inout) :: event
integer,          intent(out)   :: errcode_ret
end subroutine clRetainEvent
```