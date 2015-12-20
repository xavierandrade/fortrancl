Create a command-queue on a specific device.

Interface to OpenCL [clCreateCommandQueue](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clCreateCommandQueue.html).

### Interfaces ###

```Fortran

type(cl_command_queue) function clCreateCommandQueue(context, device, properties, errcode_ret)
type(cl_context),       intent(inout) :: context
type(cl_device_id),     intent(inout) :: device
integer,                intent(in)    :: properties
integer,                intent(out)   :: errcode_ret
end function clCreateCommandQueue
```