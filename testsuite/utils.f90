module utils
  
  use cl

  implicit none

  private 

  public ::       &
    error_exit,   &
    initialize,   &
    build_kernel

  contains

    subroutine error_exit(msg, ierr)
      character(len=*),  intent(in) :: msg
      integer, optional, intent(in) :: ierr

      write(*,'(a)') msg
      if(present(ierr)) write(*,'(a,i6)') 'Error code = ', ierr
      stop 1

    end subroutine error_exit

    ! -----------------------------------------------

    subroutine initialize(device, context, command_queue)
      type(cl_device_id),     intent(out)   :: device
      type(cl_context),       intent(out)   :: context
      type(cl_command_queue), intent(out)   :: command_queue
      
      integer :: num, ierr
      character(len = 100)  :: info
      type(cl_platform_id)   :: platform

      ! get the platform ID
      call clGetPlatformIDs(platform, num, ierr)
      if(ierr /= CL_SUCCESS) call error_exit('Cannot get CL platform.')
      
      ! get the device ID
      call clGetDeviceIDs(platform, CL_DEVICE_TYPE_ALL, device, num, ierr)
      if(ierr /= CL_SUCCESS) call error_exit('Cannot get CL device.')
      
      ! get the device name and print it
      call clGetDeviceInfo(device, CL_DEVICE_NAME, info, ierr)
      print*, "CL device: ", info

      ! create the context and the command queue
      context = clCreateContext(platform, device, ierr)
      command_queue = clCreateCommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, ierr)
      
    end subroutine initialize

    ! -----------------------------------------------

    subroutine build_kernel(filename, kernelname, context, device, kernel)
      character(len=*),   intent(in)    :: filename
      character(len=*),   intent(in)    :: kernelname
      type(cl_context),   intent(inout) :: context
      type(cl_device_id), intent(in)    :: device
      type(cl_kernel),    intent(out)   :: kernel

      integer, parameter :: iunit = 10
      integer, parameter :: source_length = 1000
      character(len = source_length) :: source
      integer :: irec, ierr
      type(cl_program) :: prog
      
      ! read the source file
      open(unit = iunit, file = trim(filename), access='direct', status = 'old', action = 'read', iostat = ierr, recl = 1)
      if (ierr /= 0) then
        call error_exit('Cannot open file '//trim(filename))
      end if
      
      source = ''
      irec = 1
      do
        read(unit = iunit, rec = irec, iostat = ierr) source(irec:irec)
        if (ierr /= 0) exit
        if(irec == source_length) call error_exit('Error: CL source file is too big')
        irec = irec + 1
      end do
      close(unit = iunit)
      
  ! create the program
      prog = clCreateProgramWithSource(context, source, ierr)
      if(ierr /= CL_SUCCESS) call error_exit('Error: cannot create program from source.')
      
      ! build
      call clBuildProgram(prog, '-cl-mad-enable', ierr)
      
      ! get the compilation log
      call clGetProgramBuildInfo(prog, device, CL_PROGRAM_BUILD_LOG, source, irec)
      if(len(trim(source)) > 0) print*, trim(source)
      
      if(ierr /= CL_SUCCESS) call error_exit('Error: program build failed.')
      
      ! finally get the kernel and release the program
      kernel = clCreateKernel(prog, trim(kernelname), ierr)
      call clReleaseProgram(prog, ierr)

    end subroutine build_kernel

end module utils
