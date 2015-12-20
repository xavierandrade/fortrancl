Increments the memory object reference count.

Interface to OpenCL [clRetainMemObject](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clRetainMemObject.html).

### Interface ###

```Fortran

subroutine clRetainMemObject(memobj, errcode_ret)
type(cl_mem),           intent(inout) :: memobj
integer,                intent(out)   :: errcode_ret
end subroutine clRetainMemObject
```