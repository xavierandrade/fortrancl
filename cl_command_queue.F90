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
 
module cl_command_queue_m
  use cl_types_m

  implicit none 

  private

  ! the functions
  public ::                          &
    clCreateCommandQueue,            &
    clReleaseCommandQueue,           &
    clEnqueueNDRangeKernel,          &
    clFinish
    !clEnqueueWriteBuffer
    !clEnqueueReadBuffer

  ! The following functions are not declared since they are
  ! polymorphic beyond the capabilities of Fortran. They can be
  ! called, but no type checking will be done by the compiler.
  
  !  interface
  !    subroutine clEnqueueWriteBuffer(command_queue, buffer, blocking_write, offset, cb, ptr, retcode_err)
  !      type(cl_command_queue), intent(inout) :: command_queue
  !      type(cl_mem),           intent(inout) :: buffer
  !      integer,                intent(in)    :: blocking_write
  !      integer(8),             intent(in)    :: offset
  !      integer(8),             intent(in)    :: cb
  !      type(any),              intent(inout) :: ptr
  !      integer,                intent(out)   :: retcode_err
  !    end subroutine clEnqueueWriteBuffer
  
  !    subroutine clEnqueueReadBuffer(command_queue, buffer, blocking_write, offset, cb, ptr, retcode_err)
  !      type(cl_command_queue), intent(inout) :: command_queue
  !      type(cl_mem),           intent(inout) :: buffer
  !      integer,                intent(in)    :: blocking_write
  !      integer(8),             intent(in)    :: offset
  !      integer(8),             intent(in)    :: cb
  !      type(any),              intent(inout) :: ptr
  !      integer,                intent(out)   :: retcode_err
  !    end subroutine clEnqueueReadBuffer
  
  !  end interface

  ! ----------------------------------------------------

  interface clReleaseCommandQueue

    subroutine clReleaseCommandQueue_low(command_queue, status)
      use cl_types_m

      implicit none

      type(cl_command_queue), intent(inout) :: command_queue
      integer,                intent(out)   :: status

    end subroutine clReleaseCommandQueue_low

  end interface clReleaseCommandQueue

  ! ----------------------------------------------------

  interface clFinish

    subroutine clFinish_low(command_queue, status)
      use cl_types_m

      implicit none
      
      type(cl_command_queue), intent(inout) :: command_queue
      integer,                intent(out)   :: status
    end subroutine clFinish_low

  end interface clFinish

  ! ----------------------------------------------------

  interface clEnqueueNDRangeKernel

    subroutine clEnqueueNDRangeKernel_low(command_queue, kernel, dim, globalsizes, localsizes, status)
      use cl_types_m

      implicit none

      type(cl_command_queue), intent(inout) :: command_queue
      type(cl_kernel),        intent(inout) :: kernel
      integer,                intent(in)    :: dim
      integer(8),             intent(in)    :: globalsizes
      integer(8),             intent(in)    :: localsizes
      integer,                intent(out)   :: status
    end subroutine clEnqueueNDRangeKernel_low

  end interface clEnqueueNDRangeKernel

  ! ---------------------------------------------------

  interface clCreateCommandQueue
    module procedure clCreateCommandQueue_full
  end interface clCreateCommandQueue

contains

  ! --------------------------------------------------------

  type(cl_command_queue) function clCreateCommandQueue_full(context, device, properties, errcode_ret) result(command_queue)
      type(cl_context),       intent(inout) :: context
      type(cl_device_id),     intent(inout) :: device
      integer,                intent(in)    :: properties
      integer,                intent(out)   :: errcode_ret

    interface
      subroutine clcreatecommandqueue_low(context, device, properties, errcode_ret, command_queue)
        use cl_types_m
        
        implicit none
        
        type(cl_context),       intent(inout) :: context
        type(cl_device_id),     intent(inout) :: device
        integer,                intent(in)    :: properties
        integer,                intent(out)   :: errcode_ret
        type(cl_command_queue), intent(inout) :: command_queue
      end subroutine clcreatecommandqueue_low
    end interface

#ifdef HAVE_OPENCL
    call clcreatecommandqueue_low(context, device, properties, errcode_ret, command_queue)
#endif

  end function clCreateCommandQueue_full

end module cl_command_queue_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
