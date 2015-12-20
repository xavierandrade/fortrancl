Get specific information about the OpenCL platform.

Interface to OpenCL [clGetPlatformInfo](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clGetPlatformInfo.html).

### Interface ###

```Fortran

subroutine clGetPlatformInfo(platform, param_name, param_value, errcode_ret)
type(cl_platform_id), intent(in)   :: platform
integer,              intent(in)   :: param_name
character(len=*),     intent(out)  :: param_value
integer,              intent(out)  :: errcode_ret
end subroutine clGetPlatformInfo
```