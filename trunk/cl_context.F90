!! Copyright (C) 2010-2011 X. Andrade <xavier@tddft.org>
!! 
!! This program is free software: you can redistribute it and/or modify
!! it under the terms of the GNU Lesser General Public License as published by
!! the Free Software Foundation, either version 3 of the License, or
!! (at your option) any later version.
!!
!! This program is distributed in the hope that it will be useful,
!! but WITHOUT ANY WARRANTY; without even the implied warranty of
!! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!! GNU Lesser General Public License for more details.
!!
!! You should have received a copy of the GNU Lesser General Public License
!! along with this program.  If not, see <http://www.gnu.org/licenses/>.
!!
!! $Id$

#include "config_F90.h"
 
module cl_context_m
  use cl_types_m

  implicit none 

  private

  public ::                          &
    clCreateContext,                 &
    clReleaseContext

  interface clReleaseContext
    subroutine clReleaseContext_low(context, status)
      use cl_types_m

      implicit none

      type(cl_context), intent(inout) :: context
      integer,          intent(out)   :: status
    end subroutine clReleaseContext_low
  end interface

  interface clCreateContext
    module procedure clCreateContext_nocallback
  end interface clCreateContext

contains

  type(cl_context) function clCreateContext_nocallback(platform, num_devices, devices, errcode_ret) result(context)
    type(cl_platform_id), intent(in)   :: platform
    integer,              intent(in)   :: num_devices
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

      subroutine clgetdeviceids_setdev(alldevices, idevice, device)
        use cl_types_m

        implicit none

        type(cl_device_id),   intent(out)   :: alldevices
        integer,              intent(in)   :: idevice
        type(cl_device_id),   intent(in)  :: device
      end subroutine clgetdeviceids_setdev
    end interface

    integer :: idev
    type(cl_device_id), allocatable :: devs(:)
    
    allocate(devs(1:num_devices))

    do idev = 1, num_devices
#ifdef HAVE_OPENCL
      call clgetdeviceids_setdev(devs(1), idev - 1, devices(idev))
#endif
    end do
    
#ifdef HAVE_OPENCL
    call clcreatecontext_low(platform, num_devices, devs(1), errcode_ret, context)
#endif

    deallocate(devs)
    
  end function clCreateContext_nocallback

end module cl_context_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
