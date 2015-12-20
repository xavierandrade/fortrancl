Decrements the command\_queue reference count.

Interface to OpenCL [clReleaseCommandQueue](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clReleaseCommandQueue.html).

## Interface ##

```Fortran

subroutine clReleaseCommandQueue(command_queue, errcode_ret)
type(cl_command_queue), intent(inout) :: command_queue
integer,                intent(out)   :: errcode_ret
end subroutine clReleaseCommandQueue
```