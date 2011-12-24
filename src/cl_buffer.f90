!! Copyright (C) 2010-2011 X. Andrade <xavier@tddft.org>
!! 
!! FortranCL is free software: you can redistribute it and/or modify
!! it under the terms of the GNU Lesser General Public License as published by
!! the Free Software Foundation, either version 3 of the License, or
!! (at your option) any later version.
!!
!! FortranCL is distributed in the hope that it will be useful,
!! but WITHOUT ANY WARRANTY; without even the implied warranty of
!! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!! GNU Lesser General Public License for more details.
!!
!! You should have received a copy of the GNU Lesser General Public License
!! along with this program.  If not, see <http://www.gnu.org/licenses/>.
!!
!! $Id$
 
module cl_buffer_m
  use cl_types_m

  implicit none 

  private

  public ::                          &
    clCreateBuffer,                  &
    clReleaseMemObject

  interface clReleaseMemObject

    subroutine clReleaseMemObject_low(memobj, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_mem),           intent(inout) :: memobj
      integer,                intent(out)   :: errcode_ret
    end subroutine clReleaseMemObject_low

  end interface

  interface clCreateBuffer
    module procedure clCreateBuffer_noptr
  end interface clCreateBuffer
  
contains 
  
  type(cl_mem) function clCreateBuffer_noptr(context, flags, size, errcode_ret) result(buffer)
    type(cl_context), intent(in)    :: context
    integer,          intent(in)    :: flags
    integer(8),       intent(in)    :: size
    integer,          intent(out)   :: errcode_ret
    
    interface
      
      subroutine clCreateBuffer_low(context, flags, size, errcode_ret, buffer)
        use cl_types_m
        
        implicit none
        
        type(cl_context),        intent(in)    :: context
        integer,                 intent(in)    :: flags
        integer(8),              intent(in)    :: size
        integer,                 intent(out)   :: errcode_ret
        type(cl_mem),            intent(out)   :: buffer
      end subroutine clCreateBuffer_low
      
    end interface
    
    call clCreateBuffer_low(context, flags, size, errcode_ret, buffer)
    
  end function clCreateBuffer_noptr

end module cl_buffer_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
