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

program char
  use cl
  use utils

  implicit none

  type(cl_device_id)     :: device
  type(cl_context)       :: context
  type(cl_command_queue) :: command_queue
  type(cl_kernel)        :: kernel
  integer    :: size, ierr
  integer(8) :: size_in_bytes, globalsize, localsize
  type(cl_mem)        :: cl_string
  integer, parameter  :: string_length = 1024
  character(len=string_length) :: string1, string2

  call initialize(device, context, command_queue)

  call build_kernel('char.cl', 'replace', context, device, kernel)

  !=====================
  ! RUN THE KERNEL
  !=====================
  size_in_bytes = int(string_length, 8)

  cl_string = clCreateBuffer(context, CL_MEM_READ_ONLY, size_in_bytes, ierr)

  string1 = 'Pepper clemens sent the messenger nevertheless the reverend left the herd'
  print*, trim(string1)

  call clEnqueueWriteBuffer(command_queue, cl_string, cl_bool(.true.), 0_8, size_in_bytes, string1(1:1), ierr)

  call clSetKernelArg(kernel, 0, 'e', ierr)
  call clSetKernelArg(kernel, 1, 'a', ierr)
  call clSetKernelArg(kernel, 2, cl_string, ierr)

  call clGetKernelWorkGroupInfo(kernel, device, CL_KERNEL_WORK_GROUP_SIZE, localsize, ierr)

  globalsize = int(string_length, 8)

  ! execute the kernel
  call clEnqueueNDRangeKernel(command_queue, kernel, (/globalsize/), (/localsize/), ierr)
  call clFinish(command_queue, ierr)

  call clEnqueueReadBuffer(command_queue, cl_string, cl_bool(.true.), 0_8, size_in_bytes, string2(1:1), ierr)

  print*, trim(string2)

  if(string2 /= 'Pappar clamans sant tha massangar navarthalass tha ravarand laft tha hard') then
    call error_exit('Wrong result')
  end if

  !=====================
  ! RELEASE EVERYTHING
  !=====================

  call clReleaseKernel(kernel, ierr)
  call clReleaseCommandQueue(command_queue, ierr)
  call clReleaseContext(context, ierr)
  
end program char
