Decrements the program reference count.

Interface to OpenCL [clReleaseProgram](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clReleaseProgram.html).

### Interface ###

```Fortran

subroutine clReleaseProgram(program, errcode_ret)
type(cl_program), intent(inout) :: program
integer,          intent(out)   :: errcode_ret
end subroutine clReleaseProgram
```