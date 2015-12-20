Decrement the context reference count.

Interface to OpenCL [clReleaseContext](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clReleaseContext.html).

## Interface ##

```Fortran

subroutine clReleaseContext(context, errcode_ret)
type(cl_context), intent(inout) :: context
integer,          intent(out)   :: errcode_ret
end subroutine clReleaseContext
```