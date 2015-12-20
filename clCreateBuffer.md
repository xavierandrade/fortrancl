Creates a buffer object.

Interface to OpenCL [clCreateBuffer](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clCreateBuffer.html) function.

### Interfaces ###

The following is an interface that does not pass a host pointer:

```Fortran

type(cl_mem) function clCreateBuffer(context, flags, size, errcode_ret)
type(cl_context),        intent(in)    :: context
integer,                 intent(in)    :: flags
integer(8),              intent(in)    :: size
integer,                 intent(out)   :: errcode_ret
end function clCreateBuffer
```

TODO: An interface that includes a host pointer.