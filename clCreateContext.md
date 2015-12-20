Creates an OpenCL context.

Interface to OpenCL [clCreateContext](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clCreateContext.html).

### Interfaces ###

```Fortran

type(cl_context) function clCreateContext(platform, devices, errcode_ret)
type(cl_platform_id), intent(in)   :: platform
type(cl_device_id),   intent(in)   :: devices(:)
integer,              intent(out)  :: errcode_ret
end function clCreateContext
```

The `devices` argument can be a scalar or an array. The number of components is given by the array size.