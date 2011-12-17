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


 
module cl_program_m
  use cl_types_m

  implicit none 

  private

  public ::                          &
    clCreateProgramWithSource,       &
    clBuildProgram,                  &
    clReleaseProgram,                &
    clGetProgramBuildInfo

  interface clReleaseProgram

    subroutine clReleaseProgram_low(program, status)
      use cl_types_m

      implicit none

      type(cl_program), intent(inout) :: program
      integer,          intent(out)   :: status
    end subroutine clReleaseProgram_low

  end interface clReleaseProgram

  ! ----------------------------------------------------

  interface clBuildProgram

    subroutine clBuildProgram_nodevices(program, options, retcode_err)
      use cl_types_m

      implicit none

      type(cl_program),   intent(inout) :: program
      character(len=*),   intent(in)    :: options
      integer,            intent(in)    :: retcode_err
    end subroutine clBuildProgram_nodevices

  end interface clBuildProgram

  ! ----------------------------------------------------

  interface clGetProgramBuildInfo
    
    subroutine clGetProgramBuildInfo_str(program, device, param_name, param_value, retcode_err)
      use cl_types_m

      implicit none

      type(cl_program),   intent(in)    :: program
      type(cl_device_id), intent(in)    :: device
      integer,            intent(in)    :: param_name
      character(len=*),   intent(out)   :: param_value
      integer,            intent(out)   :: retcode_err
    end subroutine clGetProgramBuildInfo_str

  end interface clGetProgramBuildInfo

  ! ----------------------------------------------------

  interface clCreateProgramWithSource
    module procedure clCreateProgramWithSource_str
  end interface clCreateProgramWithSource

  ! ----------------------------------------------------

  contains

    type(cl_program) function clCreateProgramWithSource_str(context, string, retcode_err) result(program)
      type(cl_context), intent(inout) :: context
      character(len=*), intent(in)    :: string
      integer,          intent(out)   :: retcode_err

      interface 
        subroutine clCreateProgramWithSource_low(context, string, retcode_err, program)
          use cl_types_m

          implicit none

          type(cl_context), intent(inout) :: context
          character(len=*), intent(in)    :: string
          integer,          intent(out)   :: retcode_err
          type(cl_program), intent(out)   :: program
        end subroutine clCreateProgramWithSource_low
      end interface


      call clCreateProgramWithSource_low(context, string, retcode_err, program)

    end function clCreateProgramWithSource_str

end module cl_program_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
