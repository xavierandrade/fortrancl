Enqueue commands to read from a buffer object to host memory.

Interface to OpenCL [clEnqueueReadBuffer](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clEnqueueReadBuffer.html).

### Interface ###

This function does not have an explicit interface, so it can be called with a `ptr` argument of any type without having to define a Fortran interface for all possible types and array sizes. This means that no type checking will be done by the compiler.

```Fortran

subroutine clEnqueueReadBuffer(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
type(cl_command_queue), intent(inout) :: command_queue
type(cl_mem),           intent(inout) :: buffer
integer,                intent(in)    :: blocking_write
integer(8),             intent(in)    :: offset
integer(8),             intent(in)    :: cb
type(any),              intent(inout) :: ptr
integer,                intent(out)   :: errcode_ret
end subroutine clEnqueueReadBuffer
```