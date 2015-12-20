Increments the context reference count.

Interface to OpenCL [clRetainContext](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clRetainContext.html).

## Interface ##

```Fortran

subroutine clRetainContext(context, errcode_ret)
type(cl_context), intent(inout) :: context
integer,          intent(out)   :: errcode_ret
end subroutine clRetainContext
```