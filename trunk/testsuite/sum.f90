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

  implicit none

  type(cl_platform_id)   :: platform
  type(cl_device_id)     :: device
  type(cl_context)       :: context
  type(cl_command_queue) :: command_queue
  type(cl_program)       :: prog
  type(cl_kernel)        :: kernel

  integer    :: num, ierr, irec, size
  integer(8) :: size_in_bytes, globalsize, localsize
  character(len = 100)  :: info
  integer, parameter :: iunit = 10
  integer, parameter :: source_length = 1000
  character(len = source_length) :: source
  real, allocatable  :: vec1(:), vec2(:)
  type(cl_mem)       :: cl_vec1, cl_vec2

  !=====================
  ! INITIALIZATION
  !=====================

  ! get the platform ID
  call clGetPlatformIDs(platform, num, ierr)
  if(ierr /= CL_SUCCESS) stop "Cannot get CL platform."

  ! get the device ID
  call clGetDeviceIDs(platform, CL_DEVICE_TYPE_ALL, device, num, ierr)
  if(ierr /= CL_SUCCESS) stop "Cannot get CL device."

  ! get the device name and print it
  call clGetDeviceInfo(device, CL_DEVICE_NAME, info, ierr)
  print*, "CL device: ", info

  ! create the context and the command queue
  context = clCreateContext(platform, device, ierr)
  command_queue = clCreateCommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, ierr)

  !=====================
  ! BUILD THE KERNEL
  !=====================

  ! read the source file
  open(unit = iunit, file = 'sum.cl', access='direct', status = 'old', action = 'read', iostat = ierr, recl = 1)
  if (ierr /= 0) stop 'Cannot open file sum.cl'

  source = ''
  irec = 1
  do
    read(unit = iunit, rec = irec, iostat = ierr) source(irec:irec)
    if (ierr /= 0) exit
    if(irec == source_length) stop 'Error: CL source file is too big'
    irec = irec + 1
  end do
  close(unit = iunit)

  ! create the program
  prog = clCreateProgramWithSource(context, source, ierr)
  if(ierr /= CL_SUCCESS) stop 'Error: cannot create program from source.'

  ! build
  call clBuildProgram(prog, '-cl-mad-enable', ierr)

  ! get the compilation log
  call clGetProgramBuildInfo(prog, device, CL_PROGRAM_BUILD_LOG, source, irec)
  if(len(trim(source)) > 0) print*, trim(source)

  if(ierr /= CL_SUCCESS) stop 'Error: program build failed.'

  ! finally get the kernel and release the program
  kernel = clCreateKernel(prog, 'sum', ierr)
  call clReleaseProgram(prog, ierr)

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

  !=====================
  ! RELEASE EVERYTHING
  !=====================

  call clReleaseKernel(kernel, ierr)
  call clReleaseCommandQueue(command_queue, ierr)
  call clReleaseContext(context, ierr)

end program sum
