Blocks until all previously queued OpenCL commands in a command-queue are issued to the associated device and have completed.

Interface to OpenCL [clFinish](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clFinish.html).

### Interface ###

```Fortran

subroutine clFinish(command_queue, errcode_ret)
type(cl_command_queue), intent(inout) :: command_queue
integer,                intent(out)   :: errcode_ret
end subroutine clFinish
```