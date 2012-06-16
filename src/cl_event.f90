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
    clRetainEvent
  
  interface clReleaseEvent

    subroutine clReleaseEvent_low(memobj, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_event),         intent(inout) :: memobj
      integer,                intent(out)   :: errcode_ret
    end subroutine clReleaseEvent_low

  end interface

  ! -----------------------------------------------

  interface clRetainEvent

    subroutine clRetainEvent_low(memobj, errcode_ret)
      use cl_types_m
      
      implicit none
      
      type(cl_event),         intent(inout) :: memobj
      integer,                intent(out)   :: errcode_ret
    end subroutine clRetainEvent_low

  end interface clRetainEvent

end module cl_event_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
