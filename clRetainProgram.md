Increments the program reference count.

Interface to OpenCL [clRetainProgram](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clRetainProgram.html).

### Interface ###

```Fortran

subroutine clRetainProgram(program, errcode_ret)
type(cl_program), intent(inout) :: program
integer,          intent(out)   :: errcode_ret
end subroutine clRetainProgram
```