Enqueues a command to execute a kernel on a device.

Interface to [clEnqueueNDRangeKernel](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clEnqueueNDRangeKernel.html).

### Interface ###

The dimensions of the kernel execution (the `work_dim` argument of the OpenCL function) is obtained from the dimensions of the `global_work_size` and `local_work_size` arrays (they must have the same dimension).

```Fortran

subroutine clEnqueueNDRangeKernel(command_queue, kernel, globalsizes, localsizes, errcode_ret)
type(cl_command_queue), intent(inout) :: command_queue
type(cl_kernel),        intent(inout) :: kernel
integer(8),             intent(in)    :: globalsizes(:)
integer(8),             intent(in)    :: localsizes(:)
integer,                intent(out)   :: errcode_ret
end subroutine clEnqueueNDRangeKernel

subroutine clEnqueueNDRangeKernel(command_queue, kernel, globalsizes, localsizes, event, errcode_ret)
type(cl_command_queue), intent(inout) :: command_queue
type(cl_kernel),        intent(inout) :: kernel
integer(8),             intent(in)    :: globalsizes(:)
integer(8),             intent(in)    :: localsizes(:)
type(cl_event),         intent(out)   :: event
integer,                intent(out)   :: errcode_ret
end subroutine clEnqueueNDRangeKernel
```

TODO: An interface that specifies an event list is missing.