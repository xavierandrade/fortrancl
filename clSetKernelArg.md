Used to set the argument value for a specific argument of a kernel.

Interface to OpenCL [clSetKernelArg](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clSetKernelArg.html).

### Interfaces ###

This is the interface to pass memory object:

```Fortran

subroutine clSetKernelArg(kernel, arg_index, arg_value, errcode_ret)
type(cl_kernel), intent(inout) :: kernel
integer,         intent(in)    :: arg_index
type(cl_mem),    intent(in)    :: arg_value
integer,         intent(out)   :: errcode_ret
end subroutine clSetKernelArg
```

This is the interface for passing scalar values:

```Fortran

subroutine clsetkernelarg(kernel, arg_index, arg_value, errcode_ret)
type(cl_kernel), intent(inout) :: kernel
integer,         intent(in)    :: arg_index
type(scalar),    intent(in)    :: arg_value
integer,         intent(out)   :: errcode_ret
end subroutine clsetkernelarg
```

This table contains the supported scalar arguments and the equivalent OpenCL language types (names in _italics_ will be supported in the next release). Other types are not supported.

| **Fortran type** | **Kernel type** |
|:-----------------|:----------------|
| _character_      | char            |
| integer(4)       | int             |
| _integer(8)_     | long            |
| real(4)          | float           |
| real(8)          | double          |
| _complex(4)_     | float2          |
| _complex(8)_     | double2         |

For setting a `__local` type argument, use [clSetKernelArgLocal](clSetKernelArgLocal.md).