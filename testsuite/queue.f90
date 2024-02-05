!! Copyright (C) 2011 X. Andrade
!!
!! FortranCL is free software; you can redistribute it and/or modify
!! it under the terms of the GNU General Public License as published by
!! the Free Software Foundation; either version 2, or (at your option)
!! any later version.
!!
!! FortranCL is distributed in the hope that it will be useful,
!! but WITHOUT ANY WARRANTY; without even the implied warranty of
!! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!! GNU General Public License for more details.
!!
!! You should have received a copy of the GNU General Public License
!! along with this program; if not, write to the Free Software
!! Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
!! 02111-1307, USA.
!!
!! $Id$

program queue
  use cl
  use utils

  implicit none

  type(cl_device_id)     :: device
  type(cl_context)       :: context
  type(cl_command_queue) :: command_queue
  type(cl_kernel)        :: kernel
  type(cl_event)         :: event(1), events(1:2)
  integer    :: size, ierr
  integer(8) :: size_in_bytes, globalsize, localsize
  type(cl_mem)        :: cl_string
  integer, parameter  :: string_length = 1024

  call initialize(device, context, command_queue)

  call clFinish(command_queue, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clFinish.', ierr)

  call clFlush(command_queue, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clFlush.', ierr)

  call build_kernel('queue.cl', 'dummy', context, device, kernel)

  call clSetKernelArg(kernel, 0, 1729, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clSetKernelArg.', ierr)

  ! get the localsize for the kernel (note that the sizes are integer(8) variable)
  call clGetKernelWorkGroupInfo(kernel, device, CL_KERNEL_WORK_GROUP_SIZE, localsize, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clGetKernelWorkGroupInfo.', ierr)
  globalsize = 1024_8*localsize

  ! execute the kernel
  call clEnqueueNDRangeKernel(command_queue, kernel, (/globalsize/), (/localsize/), event(1), ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clEnqueueNDRangeKernel.', ierr)

  call clFinish(command_queue, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clFinish.', ierr)

  call clWaitForEvents(event, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clWaitForEvents.', ierr)

  call clRetainEvent(event(1), ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clRetainEvent.', ierr)
  call clReleaseEvent(event(1), ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clReleaseEvent.', ierr)

  ! execute the kernel
  call clEnqueueNDRangeKernel(command_queue, kernel, (/globalsize/), (/localsize/), events(1), ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clEnqueueNDRangeKernel.', ierr)

  call clEnqueueNDRangeKernel(command_queue, kernel, (/globalsize/), (/localsize/), events(2), ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clEnqueueNDRangeKernel.', ierr)

  call clWaitForEvents(events, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clWaitForEvents.', ierr)

  call clReleaseEvent(events(1), ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clReleaseEvent.', ierr)

  call clReleaseEvent(events(2), ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clReleaseEvent.', ierr)

  call clReleaseCommandQueue(command_queue, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clReleaseCommandQueue.', ierr)

  call clReleaseContext(context, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clReleaseContext.', ierr)

end program queue
