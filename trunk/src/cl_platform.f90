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


 
module cl_platform_m
  use cl_types_m

  implicit none 

  private

  public ::                          &
    clGetPlatformIDs,                &
    clGetPlatformInfo

  interface clGetPlatformIDs

    subroutine clgetplatformids_num(num_platforms, errcode_ret)
      use cl_types_m

      implicit none
      integer,              intent(out)  :: num_platforms
      integer,              intent(out)  :: errcode_ret
    end subroutine clgetplatformids_num

    module procedure clgetplatformids_list
    module procedure clgetplatformids_single
  end interface clGetPlatformIDs

  ! ---------------------------------------------------

  interface clGetPlatformInfo

    subroutine clGetPlatformInfo_str(platform, param_name, param_value, errcode_ret)
      use cl_types_m

      implicit none
      type(cl_platform_id), intent(in)   :: platform
      integer,              intent(in)   :: param_name
      character(len=*),     intent(out)  :: param_value
      integer,              intent(out)  :: errcode_ret
    end subroutine clGetPlatformInfo_str

  end interface clGetPlatformInfo

  ! ---------------------------------------------------

contains

  subroutine clgetplatformids_list(platforms, num_platforms, errcode_ret)
    type(cl_platform_id), intent(out)  :: platforms(:)
    integer,              intent(out)  :: num_platforms
    integer,              intent(out)  :: errcode_ret


    integer                           :: iplatform, num_entries
    type(cl_platform_id), allocatable :: plat_c(:)

    interface
      subroutine clgetplatformids_listall(num_entries, platforms, num_platforms, errcode_ret)
        use cl_types_m

        implicit none

        integer,              intent(in)   :: num_entries
        type(cl_platform_id), intent(out)  :: platforms
        integer,              intent(out)  :: num_platforms
        integer,              intent(out)  :: errcode_ret
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

    num_entries = ubound(platforms, dim = 1)

    allocate(plat_c(1:num_entries))

    call clgetplatformids_listall(num_entries, plat_c(1), num_platforms, errcode_ret)

    do iplatform = 1, num_platforms
      call clgetplatformids_getplat(plat_c(1), iplatform - 1, platforms(iplatform))
    end do

    deallocate(plat_c)

  end subroutine clgetplatformids_list

  subroutine clgetplatformids_single(platform, num_platforms, errcode_ret)
    type(cl_platform_id), intent(out)  :: platform
    integer,              intent(out)  :: num_platforms
    integer,              intent(out)  :: errcode_ret

    type(cl_platform_id) :: plats(1:1)

    call clgetplatformids_list(plats, num_platforms, errcode_ret)
    platform = plats(1)
  end subroutine clgetplatformids_single

end module cl_platform_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
