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

program sum
  use cl
  use utils

  implicit none

  type(cl_device_id)     :: device
  type(cl_context)       :: context
  type(cl_command_queue) :: command_queue
  type(cl_kernel)        :: kernel
  integer    :: size, ierr
  integer(8) :: size_in_bytes, globalsize, localsize
  real, allocatable  :: vec1(:), vec2(:)
  type(cl_mem)       :: cl_vec1, cl_vec2

  call initialize(device, context, command_queue)

  call build_kernel('sum.cl', 'sum', context, device, kernel)

  !=====================
  ! RUN THE KERNEL
  !=====================
  
  size = 50000
  size_in_bytes = int(size, 8)*4_8
  allocate(vec1(1:size))
  allocate(vec2(1:size))
  
  vec1 = 1.0
  vec2 = 2.0

  ! allocate device memory
  cl_vec1 = clCreateBuffer(context, CL_MEM_READ_ONLY, size_in_bytes, ierr)
  cl_vec2 = clCreateBuffer(context, CL_MEM_READ_WRITE, size_in_bytes, ierr)

  ! copy data to device memory
  call clEnqueueWriteBuffer(command_queue, cl_vec1, cl_bool(.true.), 0_8, size_in_bytes, vec1(1), ierr)
  call clEnqueueWriteBuffer(command_queue, cl_vec2, cl_bool(.true.), 0_8, size_in_bytes, vec2(1), ierr)

  ! set the kernel arguments
  call clSetKernelArg(kernel, 0, size, ierr)
  call clSetKernelArg(kernel, 1, cl_vec1, ierr)
  call clSetKernelArg(kernel, 2, cl_vec2, ierr)

  ! get the localsize for the kernel (note that the sizes are integer(8) variable)
  call clGetKernelWorkGroupInfo(kernel, device, CL_KERNEL_WORK_GROUP_SIZE, localsize, ierr)
  globalsize = int(size, 8)
  if(mod(globalsize, localsize) /= 0) globalsize = globalsize + localsize - mod(globalsize, localsize) 

  ! execute the kernel
  call clEnqueueNDRangeKernel(command_queue, kernel, (/globalsize/), (/localsize/), ierr)
  call clFinish(command_queue, ierr)

  ! read the resulting vector from device memory
  call clEnqueueReadBuffer(command_queue, cl_vec2, cl_bool(.true.), 0_8, size_in_bytes, vec2(1), ierr)

  if(any(abs(vec2 - 3.0) > epsilon(3.0))) call error_exit('Wrong result')

  !=====================
  ! RELEASE EVERYTHING
  !=====================

  call clReleaseKernel(kernel, ierr)
  call clReleaseCommandQueue(command_queue, ierr)
  call clReleaseContext(context, ierr)

end program sum
