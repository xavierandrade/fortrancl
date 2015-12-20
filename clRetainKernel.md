Increments the kernel reference count.

Interface to OpenCL [clRetainKernel](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clRetainKernel.html).

### Interface ###

```Fortran

subroutine clRetainKernel(kernel, errcode_ret)
type(cl_kernel), intent(inout) :: kernel
integer,         intent(out)   :: errcode_ret
end subroutine clRetainKernel
```