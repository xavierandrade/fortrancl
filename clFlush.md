Issues all previously queued OpenCL commands in a command-queue to the device associated with the command-queue.

Interface to OpenCL [clFlush](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clFlush.html).

### Interface ###

```Fortran

subroutine clFlush(command_queue, errcode_ret)
type(cl_command_queue), intent(inout) :: command_queue
integer,                intent(out)   :: errcode_ret
end subroutine clFlush
```