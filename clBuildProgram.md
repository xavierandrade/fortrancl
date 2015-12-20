Builds (compiles and links) a program executable from the program source or binary.

Interface to the OpenCL function [clBuildProgram](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clBuildProgram.html).

### Interfaces ###

The following interface does not take any device argument, so it builds the program for all the associated devices.

```Fortran

subroutine clBuildProgram(program, options, errcode_ret)
type(cl_program),   intent(inout) :: program
character(len=*),   intent(in)    :: options
integer,            intent(out)   :: errcode_ret
end subroutine clBuildProgram
```

TODO: An interface that receives an array of devices is missing.