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

module cl_command_queue_m
  use cl_types_m

  implicit none 

  private

  ! the functions
  public ::                          &
    clCreateCommandQueue,            &
    clReleaseCommandQueue,           &
    clEnqueueNDRangeKernel,          &
    clEnqueueWriteBuffer,            &
    clEnqueueReadBuffer,             &
    clFinish

  
  ! The following functions are not declared since they are
  ! polymorphic beyond the capabilities of Fortran. They can be
  ! called, but no type checking will be done by the compiler.
  
  !  interface
  !    subroutine clEnqueueWriteBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
  !      type(cl_command_queue), intent(inout) :: command_queue
  !      type(cl_mem),           intent(inout) :: buffer
  !      integer,                intent(in)    :: blocking_write
  !      integer(8),             intent(in)    :: offset
  !      integer(8),             intent(in)    :: cb
  !      type(any),              intent(inout) :: ptr
  !      integer,                intent(out)   :: errcode_ret
  !    end subroutine clEnqueueWriteBufferImpl
  
  !    subroutine clEnqueueReadBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
  !      type(cl_command_queue), intent(inout) :: command_queue
  !      type(cl_mem),           intent(inout) :: buffer
  !      integer,                intent(in)    :: blocking_write
  !      integer(8),             intent(in)    :: offset
  !      integer(8),             intent(in)    :: cb
  !      type(any),              intent(inout) :: ptr
  !      integer,                intent(out)   :: errcode_ret
  !    end subroutine clEnqueueReadBufferImpl
  
  !  end interface

  ! ----------------------------------------------------

  interface clReleaseCommandQueue

    subroutine clReleaseCommandQueue_low(command_queue, errcode_ret)
      use cl_types_m

      implicit none

      type(cl_command_queue), intent(inout) :: command_queue
      integer,                intent(out)   :: errcode_ret

    end subroutine clReleaseCommandQueue_low

  end interface clReleaseCommandQueue

  ! ----------------------------------------------------

  interface clFinish

    subroutine clFinish_low(command_queue, errcode_ret)
      use cl_types_m

      implicit none
      
      type(cl_command_queue), intent(inout) :: command_queue
      integer,                intent(out)   :: errcode_ret
    end subroutine clFinish_low

  end interface clFinish

  ! ----------------------------------------------------

  interface clEnqueueNDRangeKernel
    module procedure clEnqueueNDRangeKernel_simple
  end interface clEnqueueNDRangeKernel

  ! ---------------------------------------------------

  interface clCreateCommandQueue
    module procedure clCreateCommandQueue_full
  end interface clCreateCommandQueue

  ! ---------------------------------------------------

  interface clEnqueueWriteBuffer
    module procedure clEnqueueWriteBuffer_integer4
    module procedure clEnqueueWriteBuffer_integer8
    module procedure clEnqueueWriteBuffer_real4
    module procedure clEnqueueWriteBuffer_real8
    module procedure clEnqueueWriteBuffer_complex4
    module procedure clEnqueueWriteBuffer_complex8
    module procedure clEnqueueWriteBuffer_character
  end interface clEnqueueWriteBuffer

  ! ---------------------------------------------------

  interface clEnqueueReadBuffer
    module procedure clEnqueueReadBuffer_integer4
    module procedure clEnqueueReadBuffer_integer8
    module procedure clEnqueueReadBuffer_real4
    module procedure clEnqueueReadBuffer_real8
    module procedure clEnqueueReadBuffer_complex4
    module procedure clEnqueueReadBuffer_complex8
    module procedure clEnqueueReadBuffer_character
  end interface clEnqueueReadBuffer

contains

  ! --------------------------------------------------------

  type(cl_command_queue) function clCreateCommandQueue_full(context, device, properties, errcode_ret) result(command_queue)
      type(cl_context),       intent(inout) :: context
      type(cl_device_id),     intent(inout) :: device
      integer,                intent(in)    :: properties
      integer,                intent(out)   :: errcode_ret

    interface
      subroutine clcreatecommandqueue_low(context, device, properties, errcode_ret, command_queue)
        use cl_types_m
        
        implicit none
        
        type(cl_context),       intent(inout) :: context
        type(cl_device_id),     intent(inout) :: device
        integer,                intent(in)    :: properties
        integer,                intent(out)   :: errcode_ret
        type(cl_command_queue), intent(inout) :: command_queue
      end subroutine clcreatecommandqueue_low
    end interface


    call clcreatecommandqueue_low(context, device, properties, errcode_ret, command_queue)

  end function clCreateCommandQueue_full

  subroutine clEnqueueNDRangeKernel_simple(command_queue, kernel, globalsizes, localsizes, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_kernel),        intent(inout) :: kernel
    integer(8),             intent(in)    :: globalsizes(:)
    integer(8),             intent(in)    :: localsizes(:)
    integer,                intent(out)   :: errcode_ret

    interface
      subroutine clEnqueueNDRangeKernel_low(command_queue, kernel, work_dim, globalsizes, localsizes, errcode_ret)
        use cl_types_m

        implicit none

        type(cl_command_queue), intent(inout) :: command_queue
        type(cl_kernel),        intent(inout) :: kernel
        integer,                intent(in)    :: work_dim
        integer(8),             intent(in)    :: globalsizes
        integer(8),             intent(in)    :: localsizes
        integer,                intent(out)   :: errcode_ret
      end subroutine clEnqueueNDRangeKernel_low
    end interface

    integer :: work_dim

    work_dim = min(ubound(globalsizes, dim = 1), ubound(localsizes, dim = 1))

    call clEnqueueNDRangeKernel_low(command_queue, kernel, work_dim, globalsizes(1), localsizes(1), errcode_ret)

  end subroutine clEnqueueNDRangeKernel_simple

  ! ---------------------------------------

  subroutine clEnqueueWriteBuffer_integer4(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(inout) :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    integer(4),             intent(in)    :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueWriteBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueWriteBuffer_integer4

  ! ---------------------------------------

  subroutine clEnqueueWriteBuffer_integer8(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(inout) :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    integer(8),             intent(in)    :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueWriteBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueWriteBuffer_integer8

  ! ---------------------------------------

  subroutine clEnqueueWriteBuffer_real4(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(inout) :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    real(4),                intent(in)    :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueWriteBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueWriteBuffer_real4

  ! ---------------------------------------

  subroutine clEnqueueWriteBuffer_real8(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(inout) :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    real(8),                intent(in)    :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueWriteBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueWriteBuffer_real8

  ! ---------------------------------------

  subroutine clEnqueueWriteBuffer_complex4(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(inout) :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    complex(4),             intent(in)    :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueWriteBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueWriteBuffer_complex4

  ! ---------------------------------------

  subroutine clEnqueueWriteBuffer_complex8(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(inout) :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    complex(8),             intent(in)    :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueWriteBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueWriteBuffer_complex8

  ! ---------------------------------------

  subroutine clEnqueueWriteBuffer_character(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(inout) :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    character,              intent(in)    :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueWriteBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueWriteBuffer_character

  ! ---------------------------------------

  subroutine clEnqueueReadBuffer_integer4(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(in)    :: buffer 
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    integer(4),             intent(out)   :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueReadBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueReadBuffer_integer4

  ! ---------------------------------------

  subroutine clEnqueueReadBuffer_integer8(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(in)    :: buffer 
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    integer(8),             intent(out)   :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueReadBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueReadBuffer_integer8

  ! ---------------------------------------

  subroutine clEnqueueReadBuffer_real4(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(in)    :: buffer 
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    real(4),                intent(out)   :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueReadBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueReadBuffer_real4

  ! ---------------------------------------

  subroutine clEnqueueReadBuffer_real8(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(in)    :: buffer 
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    real(8),                intent(out)   :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueReadBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueReadBuffer_real8

  ! ---------------------------------------

  subroutine clEnqueueReadBuffer_complex4(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(in)    :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    complex(4),             intent(out)   :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueReadBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueReadBuffer_complex4

  ! ---------------------------------------

  subroutine clEnqueueReadBuffer_complex8(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(in)    :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    complex(8),             intent(out)   :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueReadBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueReadBuffer_complex8

  ! ---------------------------------------

  subroutine clEnqueueReadBuffer_character(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)
    type(cl_command_queue), intent(inout) :: command_queue
    type(cl_mem),           intent(in)    :: buffer
    integer,                intent(in)    :: blocking_write
    integer(8),             intent(in)    :: offset
    integer(8),             intent(in)    :: cb
    character,              intent(out)   :: ptr
    integer,                intent(out)   :: errcode_ret
    
    call clEnqueueReadBufferImpl(command_queue, buffer, blocking_write, offset, cb, ptr, errcode_ret)

  end subroutine clEnqueueReadBuffer_character

  ! ---------------------------------------

end module cl_command_queue_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
