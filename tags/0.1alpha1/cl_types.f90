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

module cl_types_m
  implicit none 
  
  type :: cl_platform_id
    private 
    integer, pointer :: p 
  end type cl_platform_id
  
  type :: cl_device_id
    private 
    integer, pointer :: p 
  end type cl_device_id

  type :: cl_context
    private 
    integer, pointer :: p 
  end type cl_context

  type :: cl_command_queue
    private 
    integer, pointer :: p 
  end type cl_command_queue

  type :: cl_mem
    private 
    integer, pointer :: p 
  end type cl_mem

  type :: cl_program
    private 
    integer, pointer :: p 
  end type cl_program

  type :: cl_kernel
    private 
    integer, pointer :: p 
  end type cl_kernel

  type :: cl_event
    private 
    integer, pointer :: p 
  end type cl_event

  type :: cl_sampler
    private 
    integer, pointer :: p 
  end type cl_sampler

end module cl_types_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
