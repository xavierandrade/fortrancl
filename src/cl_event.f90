!! Copyright (C) 2012 X. Andrade <xavier@tddft.org>
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
 
module cl_event_m
  use cl_types_m

  implicit none 

  private

  public ::                          &
    clReleaseEvent,                  &
    clRetainEvent,                   &
    clWaitForEvents

  interface clReleaseEvent

    subroutine clReleaseEvent_low(event, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_event),         intent(inout) :: event
      integer,                intent(out)   :: errcode_ret
    end subroutine clReleaseEvent_low

  end interface clReleaseEvent

  ! -----------------------------------------------

  interface clRetainEvent

    subroutine clRetainEvent_low(event, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_event),         intent(inout) :: event
      integer,                intent(out)   :: errcode_ret
    end subroutine clRetainEvent_low

  end interface clRetainEvent

  ! -----------------------------------------------

  interface clWaitForEvents
    module procedure clWaitForEvents_single
    module procedure clWaitForEvents_array
  end interface clWaitForEvents

  interface
    subroutine clWaitForEvents_low(numevents, allevents, errcode_ret)
      use cl_types_m

      implicit none

      integer,                intent(in)    :: numevents
      type(cl_event),         intent(in)    :: allevents
      integer,                intent(out)   :: errcode_ret
    end subroutine clWaitForEvents_low
  end interface

contains

  subroutine clWaitForEvents_single(event_list, errcode_ret)
    type(cl_event),         intent(in)    :: event_list
    integer,                intent(out)   :: errcode_ret

    call clWaitForEvents_low(1, event_list, errcode_ret)

  end subroutine clWaitForEvents_single
  
  ! --------------------------------------------------------------

  subroutine clWaitForEvents_array(event_list, errcode_ret)
    type(cl_event),         intent(in)    :: event_list(:)
    integer,                intent(out)   :: errcode_ret

    type(cl_event), allocatable :: allevents(:)
    integer                     :: numevents, ievent

    numevents = ubound(event_list, dim = 1)

    allocate(allevents(1:numevents))

    do ievent = 1, numevents
      call fortrancl_set_component(allevents(1), ievent - 1, event_list(ievent))
    end do

    call clWaitForEvents_low(numevents, allevents(1), errcode_ret)

    deallocate(allevents)

  end subroutine clWaitForEvents_array

end module cl_event_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
