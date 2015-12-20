Creates a kernel object.

Interface to OpenCL [clCreateKernel](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clCreateKernel.html).

### Interface ###

```Fortran

type(cl_kernel) function clCreateKernel(program, kernel_name, errcode_ret)
type(cl_program), intent(inout) :: program
character(len=*), intent(in)    :: kernel_name
integer,          intent(out)   :: errcode_ret
end function clCreateKernel
```