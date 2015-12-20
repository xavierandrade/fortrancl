Obtain the list of devices available on a platform.

Interface to OpenCL [clGetDeviceIDs](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clGetDeviceIDs.html).

### Interfaces ###

The following interface returns the number of devices:

```Fortran

subroutine clGetDeviceIDs(platform, device_type, num_devices, errcode_ret)
type(cl_platform_id), intent(in)   :: platform
integer,              intent(in)   :: device_type
integer,              intent(out)  :: num_devices
integer,              intent(out)  :: errcode_ret
end subroutine clGetDeviceIDs
```

This interface returns a list of devices. The `devices` argument can be a scalar or a one-dimensional array.

```Fortran

subroutine clGetDeviceIDs(platform, device_type, devices, num_devices, errcode_ret)
type(cl_platform_id), intent(in)   :: platform
integer,              intent(in)   :: device_type
type(cl_device_id),   intent(out)  :: devices(:)
integer,              intent(out)  :: num_devices
integer,              intent(out)  :: errcode_ret
end subroutine clGetDeviceIDs
```