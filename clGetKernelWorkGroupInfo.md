Returns information about the kernel object that may be specific to a device.

Interface to [clGetKernelWorkGroupInfo](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clGetKernelWorkGroupInfo.html).

### Interfaces ###

```Fortran

subroutine clGetKernelWorkGroupInfo(kernel, device, param_name, param_value, errcode_ret)
type(cl_kernel),    intent(in)    :: kernel
type(cl_device_id), intent(in)    :: device
integer,            intent(in)    :: param_name
integer(8),         intent(out)   :: param_value
integer,            intent(out)   :: errcode_ret
end subroutine clGetKernelWorkGroupInfo
```