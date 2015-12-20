Decrement the event reference count.

Interface to OpenCL [clReleaseEvent](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clReleaseEvent.html).

## Interface ##

```Fortran

subroutine clReleaseEvent(event, errcode_ret)
type(cl_event),   intent(inout) :: event
integer,          intent(out)   :: errcode_ret
end subroutine clReleaseEvent
```