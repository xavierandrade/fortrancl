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



module cl_kernel_m
  use cl_types_m

  implicit none 

  private

  public ::                          &
    clCreateKernel,                  &
    clReleaseKernel,                 &
    clRetainKernel,                  &
    clGetKernelWorkGroupInfo,        &
    clSetKernelArgLocal,             &
    clSetKernelArg

  interface clReleaseKernel

    subroutine clReleaseKernel_low(kernel, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(out)   :: errcode_ret
    end subroutine clReleaseKernel_low

  end interface

  ! --------------------------------------------------

  interface clRetainKernel

    subroutine clRetainKernel_low(kernel, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(out)   :: errcode_ret
    end subroutine clRetainKernel_low

  end interface

  ! --------------------------------------------------

  interface clSetKernelArg

    subroutine clsetkernelarg_buf(kernel, arg_index, arg_value, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(in)    :: arg_index
      type(cl_mem),    intent(in)    :: arg_value
      integer,         intent(out)   :: errcode_ret
    end subroutine clsetkernelarg_buf

    ! ----------------------------------------------------

    subroutine clsetkernelarg_char(kernel, arg_index, arg_value, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(in)    :: arg_index
      character,       intent(in)    :: arg_value
      integer,         intent(out)   :: errcode_ret
    end subroutine clsetkernelarg_char

    ! ----------------------------------------------------

    subroutine clsetkernelarg_int(kernel, arg_index, arg_value, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(in)    :: arg_index
      integer(4),      intent(in)    :: arg_value
      integer,         intent(out)   :: errcode_ret
    end subroutine clsetkernelarg_int

    ! ----------------------------------------------------

    subroutine clsetkernelarg_long(kernel, arg_index, arg_value, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(in)    :: arg_index
      integer(8),      intent(in)    :: arg_value
      integer,         intent(out)   :: errcode_ret
    end subroutine clsetkernelarg_long

    ! ----------------------------------------------------

    subroutine clsetkernelarg_float(kernel, arg_index, arg_value, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(in)    :: arg_index
      real(4),         intent(in)    :: arg_value
      integer,         intent(out)   :: errcode_ret
    end subroutine clsetkernelarg_float

    ! ----------------------------------------------------

    subroutine clsetkernelarg_double(kernel, arg_index, arg_value, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(in)    :: arg_index
      real(8),         intent(in)    :: arg_value
      integer,         intent(out)   :: errcode_ret
    end subroutine clsetkernelarg_double

    ! ---------------------------------------------------

    subroutine clsetkernelarg_float2(kernel, arg_index, arg_value, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(in)    :: arg_index
      complex(4),      intent(in)    :: arg_value
      integer,         intent(out)   :: errcode_ret
    end subroutine clsetkernelarg_float2

    ! ----------------------------------------------------

    subroutine clsetkernelarg_double2(kernel, arg_index, arg_value, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(in)    :: arg_index
      complex(8),      intent(in)    :: arg_value
      integer,         intent(out)   :: errcode_ret
    end subroutine clsetkernelarg_double2

  end interface clSetKernelArg

  ! ----------------------------------------------------

  interface clSetKernelArgLocal

    subroutine clSetKernelArgLocal_low(kernel, arg_index, arg_size, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_kernel), intent(inout) :: kernel
      integer,         intent(in)    :: arg_index
      integer(8),      intent(in)    :: arg_size
      integer,         intent(out)   :: errcode_ret
    end subroutine clSetKernelArgLocal_low

  end interface

  ! ----------------------------------------------------

  interface clGetKernelWorkGroupInfo

    subroutine clgetkernelworkgroupinfo_int64(kernel, device, param_name, param_value, errcode_ret)
      use cl_types_m
      
      implicit none

      type(cl_kernel),    intent(in)    :: kernel
      type(cl_device_id), intent(in)    :: device
      integer,            intent(in)    :: param_name
      integer(8),         intent(out)   :: param_value
      integer,            intent(out)   :: errcode_ret
    end subroutine clgetkernelworkgroupinfo_int64

  end interface clGetKernelWorkGroupInfo

  ! ----------------------------------------------------

  interface clCreateKernel
    module procedure clCreateKernel_full
  end interface clCreateKernel

contains

  type(cl_kernel) function clCreateKernel_full(program, kernel_name, errcode_ret) result(kernel)
    type(cl_program), intent(inout) :: program
    character(len=*), intent(in)    :: kernel_name
    integer,          intent(out)   :: errcode_ret

    interface
      subroutine clcreatekernel_low(program, kernel_name, errcode_ret, kernel)
        use cl_types_m

        implicit none

        type(cl_program), intent(inout) :: program
        character(len=*), intent(in)    :: kernel_name
        integer,          intent(out)   :: errcode_ret
        type(cl_kernel),  intent(out)   :: kernel
      end subroutine clcreatekernel_low
    end interface


    call clcreatekernel_low(program, kernel_name, errcode_ret, kernel)


  end function clCreateKernel_full

end module cl_kernel_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
