Decrements the memory object reference count.

Interface to OpenCL [clReleaseMemObject](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clReleaseMemObject.html).

### Interface ###

```Fortran

subroutine clReleaseMemObject(memobj, errcode_ret)
type(cl_mem),           intent(inout) :: memobj
integer,                intent(out)   :: errcode_ret
end subroutine clReleaseMemObject
```