Obtain the list of platforms available.

Interface to OpenCL [clGetPlatformIDs](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clGetPlatformIDs.html).

### Interfaces ###

This interface returns the number of platforms available:

```Fortran

subroutine clGetPlatformIDs(num_platforms, errcode_ret)
integer,              intent(out)  :: num_platforms
integer,              intent(out)  :: errcode_ret
end subroutine clGetPlatformIDs
```

This interface returns a list of platforms. The `platforms` argument can be a one-dimensional array or a scalar.

```Fortran

subroutine clGetPlatformIDs(platforms, num_platforms, errcode_ret)
type(cl_platform_id), intent(out)  :: platforms(:)
integer,              intent(out)  :: num_platforms
integer,              intent(out)  :: errcode_ret
end subroutine clGetPlatformIDs
```