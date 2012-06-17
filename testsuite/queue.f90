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
  integer    :: size, ierr
  integer(8) :: size_in_bytes, globalsize, localsize
  type(cl_mem)        :: cl_string
  integer, parameter  :: string_length = 1024
  type(cl_event) :: event

  call initialize(device, context, command_queue)

  call clFinish(command_queue, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clFinish.')

  call clFlush(command_queue, ierr)
  if(ierr /= CL_SUCCESS) call error_exit('Error in clFlush.')

  call clReleaseCommandQueue(command_queue, ierr)
  call clReleaseContext(context, ierr)
  
end program queue
