This function returns a Fortran <tt>integer</tt> with the values <tt>CL_TRUE</tt> or <tt>CL_FALSE</tt> that correspond to the Fortran <tt>logical</tt> argument.

### Interface ###

```Fortran

integer pure function cl_bool(val)
logical, intent(in) :: val
end function
```