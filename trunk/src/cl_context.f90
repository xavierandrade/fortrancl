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


 
module cl_context_m
  use cl_types_m

  implicit none 

  private

  public ::                          &
    clCreateContext,                 &
    clReleaseContext,                &
    clRetainContext

  interface clReleaseContext
    subroutine clReleaseContext_low(context, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_context), intent(inout) :: context
      integer,          intent(out)   :: errcode_ret
    end subroutine clReleaseContext_low
  end interface

  ! ---------------------------------------

  interface clRetainContext
    subroutine clRetainContext_low(context, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_context), intent(inout) :: context
      integer,          intent(out)   :: errcode_ret
    end subroutine clRetainContext_low
  end interface

  ! ---------------------------------------

  interface clCreateContext
    module procedure clCreateContext_nocallback
    module procedure clCreateContext_single
  end interface clCreateContext

contains

  type(cl_context) function clCreateContext_nocallback(platform, devices, errcode_ret) result(context)
    type(cl_platform_id), intent(in)   :: platform
    type(cl_device_id),   intent(in)   :: devices(:)
    integer,              intent(out)  :: errcode_ret

    interface
      subroutine clcreatecontext_low(platform, num_devices, devices, errcode_ret, context)
        use cl_types_m

        implicit none

        type(cl_platform_id), intent(in)   :: platform
        integer,              intent(in)   :: num_devices
        type(cl_device_id),   intent(in)   :: devices
        integer,              intent(out)  :: errcode_ret
        type(cl_context),     intent(out)  :: context
      end subroutine clcreatecontext_low
    end interface

    integer :: idev, num_devices
    type(cl_device_id), allocatable :: devs(:)
    
    num_devices = ubound(devices, dim = 1)

    allocate(devs(1:num_devices))

    do idev = 1, num_devices
      call fortrancl_set_component(devs(1), idev - 1, devices(idev))
    end do
    
    call clcreatecontext_low(platform, num_devices, devs(1), errcode_ret, context)


    deallocate(devs)
    
  end function clCreateContext_nocallback
  
  ! -----------------------------------

  type(cl_context) function clCreateContext_single(platform, devices, errcode_ret) result(context)
    type(cl_platform_id), intent(in)   :: platform
    type(cl_device_id),   intent(in)   :: devices
    integer,              intent(out)  :: errcode_ret

    type(cl_device_id) :: devs(1:1)

    devs(1:1) = devices
    context = clCreateContext_nocallback(platform, devs, errcode_ret)

  end function clCreateContext_single
end module cl_context_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
