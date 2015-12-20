Increments the command\_queue reference count.

Interface to OpenCL [clRetainCommandQueue](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clRetainCommandQueue.html).

## Interface ##

```Fortran

subroutine clRetainCommandQueue(command_queue, errcode_ret)
type(cl_command_queue), intent(inout) :: command_queue
integer,                intent(out)   :: errcode_ret
end subroutine clRetainCommandQueue
```