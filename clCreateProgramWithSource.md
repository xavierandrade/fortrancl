Creates a program object for a context, and loads the source code into the program object.

Interface to OpenCL [clCreateProgramWithSource](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clCreateProgramWithSource.html).

### Interfaces ###

This interface receives a single string (with the `string` argument) with the program source code.

```Fortran

type(cl_program) function clCreateProgramWithSource(context, string, errcode_ret)
type(cl_context), intent(inout) :: context
character(len=*), intent(in)    :: string
integer,          intent(out)   :: errcode_ret
end function clCreateProgramWithSource
```