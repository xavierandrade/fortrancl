Used to set the argument value for a specific argument of a kernel of type `__local`. The arg\_size argument is the size in bytes of the local memory area you want to allocate.

Fortan interface to [clSetKernelArg](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clSetKernelArg.html).

### Interface ###

This function is used to set a `__local` arguments. For other types see [clSetKernelArg](clSetKernelArg.md).

```FortranCL

subroutine clSetKernelArgLocal(kernel, arg_index, arg_size, errcode_ret)
type(cl_kernel), intent(inout) :: kernel
integer,         intent(in)    :: arg_index
integer(8),      intent(in)    :: arg_size
integer,         intent(out)   :: errcode_ret
end subroutine clSetKernelArgLocal
```