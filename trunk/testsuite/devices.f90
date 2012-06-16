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

program devs
  use cl

  implicit none

  type(cl_platform_id), allocatable :: platforms(:)
  type(cl_device_id),   allocatable :: devices(:)
  integer :: num_platforms, num_devices, ierr, iplat, idev
  integer(8) :: val
  character(len=200) :: info

  ! get the number of platforms
  call clGetPlatformIDs(num_platforms, ierr)

  allocate(platforms(1:num_platforms))

  write(*, '(a,i1)')   'Number of CL platforms      : ', num_platforms
  write(*, '(a)')      ''

  
  ! get an array of platforms
  call clGetPlatformIDs(platforms, num_platforms, ierr)

  ! iterate over platforms
  do iplat = 1, num_platforms

    ! print some info
    write(*, '(a,i1)') 'Platform number             : ', iplat

    call clGetPlatformInfo(platforms(iplat), CL_PLATFORM_VENDOR, info, ierr)
    write(*, '(2a)')   'Vendor                      : ', trim(info)

    call clGetPlatformInfo(platforms(iplat), CL_PLATFORM_NAME, info, ierr)
    write(*, '(2a)')   'Name                        : ', trim(info)

    call clGetPlatformInfo(platforms(iplat), CL_PLATFORM_VERSION, info, ierr)
    write(*, '(2a)')   'Version                     : ', trim(info)

    ! get the device ID
    call clGetDeviceIDs(platforms(iplat), CL_DEVICE_TYPE_ALL, num_devices, ierr)
  
    write(*, '(a,i1)') 'Number of devices           : ', num_devices
    write(*, '(a)')      ''

    allocate(devices(1:num_devices))

    ! get the device ID
    call clGetDeviceIDs(platforms(iplat), CL_DEVICE_TYPE_ALL, devices, num_devices, ierr)
    
    do idev = 1, num_devices
      write(*, '(a,i1)') '    Device number           : ', idev

      call clGetDeviceInfo(devices(idev), CL_DEVICE_TYPE, val, ierr)
      select case(val)
      case(CL_DEVICE_TYPE_CPU)
        info = 'CPU'
      case(CL_DEVICE_TYPE_GPU)
        info = 'GPU'
      case(CL_DEVICE_TYPE_ACCELERATOR)
        info = 'Accelerator'
      end select

      write(*, '(2a)')   '    Device type             : ', trim(info)

      call clGetDeviceInfo(devices(idev), CL_DEVICE_VENDOR, info, ierr)
      write(*, '(2a)')   '    Device vendor           : ', trim(info)

      call clGetDeviceInfo(devices(idev), CL_DEVICE_NAME, info, ierr)
      write(*, '(2a)')   '    Device name             : ', trim(info)

      call clGetDeviceInfo(devices(idev), CL_DEVICE_GLOBAL_MEM_SIZE, val, ierr)
      write(*, '(a,i4)') '    Device memory           : ', val/1024**2

      write(*, '(a)')      ''
    end do

    deallocate(devices)
    write(*, '(a)')      ''

  end do


  deallocate(platforms)

end program devs
