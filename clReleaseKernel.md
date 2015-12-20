Decrements the kernel reference count.

Interface to OpenCL [clReleaseKernel](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clReleaseKernel.html).

### Interface ###

```Fortran

subroutine clReleaseKernel(kernel, errcode_ret)
type(cl_kernel), intent(inout) :: kernel
integer,         intent(out)   :: errcode_ret
end subroutine clReleaseKernel
```