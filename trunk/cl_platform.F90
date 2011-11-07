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
 
module cl_platform_m
  use cl_types_m

  implicit none 

  private

  public ::                          &
    clGetPlatformIDs,                &
    clGetPlatformInfo

  interface clGetPlatformIDs

    subroutine clgetplatformids_num(num_platforms, status)
      use cl_types_m

      implicit none
      integer,              intent(out)  :: num_platforms
      integer,              intent(out)  :: status
    end subroutine clgetplatformids_num

    module procedure clgetplatformids_list

  end interface clGetPlatformIDs

  ! ---------------------------------------------------

  interface clGetPlatformInfo

    subroutine clGetPlatformInfo_str(platform, param_name, param_value, status)
      use cl_types_m

      implicit none
      type(cl_platform_id), intent(in)   :: platform
      integer,              intent(in)   :: param_name
      character(len=*),     intent(out)  :: param_value
      integer,              intent(out)  :: status
    end subroutine clGetPlatformInfo_str

  end interface clGetPlatformInfo

  ! ---------------------------------------------------

contains

  subroutine clgetplatformids_list(num_entries, platforms, num_platforms, status)
    integer,              intent(out)  :: num_entries
    type(cl_platform_id), intent(out)  :: platforms(:)
    integer,              intent(out)  :: num_platforms
    integer,              intent(out)  :: status

#ifdef HAVE_OPENCL
    integer                         :: iplatform
    type(cl_platform_id), allocatable :: plat(:)

    interface
      subroutine clgetplatformids_listall(num_entries, platforms, num_platforms, status)
        use cl_types_m

        implicit none

        integer,              intent(out)  :: num_entries
        type(cl_platform_id), intent(out)  :: platforms
        integer,              intent(out)  :: num_platforms
        integer,              intent(out)  :: status
      end subroutine clgetplatformids_listall

      subroutine clgetplatformids_getplat(allplatforms, iplatform, platform)
        use cl_types_m

        implicit none

        type(cl_platform_id), intent(in)   :: allplatforms
        integer,              intent(in)   :: iplatform
        type(cl_platform_id), intent(out)  :: platform
      end subroutine clgetplatformids_getplat
    end interface

    ! since our cl_platform_id type might be longer than the C
    ! cl_platform_id type we need to get all the values in an array
    ! and the copy them explicitly to the return array

    allocate(plat(1:num_entries))

    call clgetplatformids_listall(num_entries, plat(1), num_platforms, status)

    do iplatform = 1, num_platforms
      call clgetplatformids_getplat(plat(1), iplatform - 1, platforms(iplatform))
    end do

    deallocate(plat)
#endif
  end subroutine clgetplatformids_list

  ! ----------------------------------------------------------

end module cl_platform_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
