module utils
  
  implicit none

  contains

    subroutine error_exit(msg)
      character(len=*), intent(in) :: msg

      write(*,'(a)') msg
      stop 1

    end subroutine error_exit

end module utils
