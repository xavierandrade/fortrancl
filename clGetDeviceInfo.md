Get information about an OpenCL device.

Interface to OpenCL [clGetDeviceInfo](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clGetDeviceInfo.html).

### Interfaces ###

Depending on the `param_name`, the `param_value` argument takes different types.

These are the interfaces for the different types:

```Fortran

subroutine clGetDeviceInfo(device, param_name, param_value, errcode_ret)
type(cl_device_id), intent(in)   :: device
integer,            intent(in)   :: param_name
character(len=*),   intent(out)  :: param_value
integer,            intent(out)  :: errcode_ret
end subroutine clGetDeviceInfo

subroutine clGetDeviceInfo(device, param_name, param_value, errcode_ret)
type(cl_device_id), intent(in)   :: device
integer,            intent(in)   :: param_name
integer,            intent(out)  :: param_value
integer,            intent(out)  :: errcode_ret
end subroutine clGetDeviceInfo

subroutine clGetDeviceInfo(device, param_name, param_value, errcode_ret)
type(cl_device_id), intent(in)   :: device
integer,            intent(in)   :: param_name
integer(8),         intent(out)  :: param_value
integer,            intent(out)  :: errcode_ret
end subroutine clGetDeviceInfo

subroutine clGetDeviceInfo(device, param_name, param_value, errcode_ret)
type(cl_device_id), intent(in)   :: device
integer,            intent(in)   :: param_name
logical,            intent(out)  :: param_value
integer,            intent(out)  :: errcode_ret
end subroutine clGetDeviceInfo
```

Note that for numerical values you can use both the `integer` and `integer(8)` interfaces. However, in some cases an `integer` value might be overflowed.