# Modules #

All the FortranCL interface is contained in the `cl` Fortran 90 module.

# Datatypes #

The following are Fortran datatypes that directly map to OpenCL C types.

  * `cl_command_queue`
  * `cl_context`
  * `cl_device_id`
  * `cl_event`
  * `cl_kernel`
  * `cl_mem`
  * `cl_platform_id`
  * `cl_program`
  * `cl_sampler`

The OpenCL [enumerated types](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/enums.html) are mapped to Fortran integers.

# CL interface procedures #

These are the functions or subroutines from FortranCL that correspond to OpenCL functions.

The last argument of all procedures is the `integer` errcode\_ret. If the output value is `CL_SUCCESS`, the call was successful, otherwise the value indicate the error.

  * [clBuildProgram](clBuildProgram.md)
  * [clCreateBuffer](clCreateBuffer.md)
  * [clCreateCommandQueue](clCreateCommandQueue.md)
  * [clCreateContext](clCreateContext.md)
  * [clCreateKernel](clCreateKernel.md)
  * [clCreateProgramWithSource](clCreateProgramWithSource.md)
  * [clEnqueueNDRangeKernel](clEnqueueNDRangeKernel.md)
  * [clEnqueueReadBuffer](clEnqueueReadBuffer.md)
  * [clEnqueueWriteBuffer](clEnqueueWriteBuffer.md)
  * [clFinish](clFinish.md)
  * [clFlush](clFlush.md)
  * [clGetDeviceIDs](clGetDeviceIDs.md)
  * [clGetDeviceInfo](clGetDeviceInfo.md)
  * [clGetPlatformIDs](clGetPlatformIDs.md)
  * [clGetPlatformInfo](clGetPlatformInfo.md)
  * [clGetProgramBuildInfo](clGetProgramBuildInfo.md)
  * [clGetKernelWorkGroupInfo](clGetKernelWorkGroupInfo.md)
  * [clReleaseCommandQueue](clReleaseCommandQueue.md)
  * [clReleaseContext](clReleaseContext.md)
  * [clReleaseEvent](clReleaseEvent.md)
  * [clReleaseKernel](clReleaseKernel.md)
  * [clReleaseMemObject](clReleaseMemObject.md)
  * [clReleaseProgram](clReleaseProgram.md)
  * [clRetainCommandQueue](clRetainCommandQueue.md)
  * [clRetainContext](clRetainContext.md)
  * [clRetainEvent](clRetainEvent.md)
  * [clRetainKernel](clRetainKernel.md)
  * [clRetainMemObject](clRetainMemObject.md)
  * [clRetainProgram](clRetainProgram.md)
  * [clSetKernelArg](clSetKernelArg.md)
  * [clSetKernelArgLocal](clSetKernelArgLocal.md)
  * [clWaitForEvents](clWaitForEvents.md)

# Additional functions #
  * [cl\_bool](cl_bool.md): Returns a CL boolean value, CL\_TRUE or CL\_FALSE, from a Fortran logical.