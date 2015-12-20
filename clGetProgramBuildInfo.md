Returns build information for each device in the program object.

Interface to OpenCL [clGetProgramBuildInfo](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clGetProgramBuildInfo.html).

### Interfaces ###

```Fortran

subroutine clGetProgramBuildInfo(program, device, param_name, param_value, errcode_ret)
type(cl_program),   intent(in)    :: program
type(cl_device_id), intent(in)    :: device
integer,            intent(in)    :: param_name
character(len=*),   intent(out)   :: param_value
integer,            intent(out)   :: errcode_ret
end subroutine clGetProgramBuildInfo
```

TODO: An interface that returns an integer (for CL\_PROGRAM\_BUILD\_STATUS) is missing.