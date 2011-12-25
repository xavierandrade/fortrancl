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

module cl_constants_m
  
  implicit none

  private

  public ::                   &
    cl_bool

  ! these values replicate the values from OpenCL include CL/cl.h

  !  Error Codes
  integer, parameter, public ::  CL_SUCCESS                       = 0
  integer, parameter, public ::  CL_DEVICE_NOT_FOUND              = -1
  integer, parameter, public ::  CL_DEVICE_NOT_AVAILABLE          = -2
  integer, parameter, public ::  CL_COMPILER_NOT_AVAILABLE        = -3
  integer, parameter, public ::  CL_MEM_OBJECT_ALLOCATION_FAILURE = -4
  integer, parameter, public ::  CL_OUT_OF_RESOURCES              = -5
  integer, parameter, public ::  CL_OUT_OF_HOST_MEMORY            = -6
  integer, parameter, public ::  CL_PROFILING_INFO_NOT_AVAILABLE  = -7
  integer, parameter, public ::  CL_MEM_COPY_OVERLAP              = -8
  integer, parameter, public ::  CL_IMAGE_FORMAT_MISMATCH         = -9
  integer, parameter, public ::  CL_IMAGE_FORMAT_NOT_SUPPORTED    = -10
  integer, parameter, public ::  CL_BUILD_PROGRAM_FAILURE         = -11
  integer, parameter, public ::  CL_MAP_FAILURE                   = -12
  integer, parameter, public ::  CL_INVALID_VALUE                 = -30
  integer, parameter, public ::  CL_INVALID_DEVICE_TYPE           = -31
  integer, parameter, public ::  CL_INVALID_PLATFORM              = -32
  integer, parameter, public ::  CL_INVALID_DEVICE                = -33
  integer, parameter, public ::  CL_INVALID_CONTEXT               = -34
  integer, parameter, public ::  CL_INVALID_QUEUE_PROPERTIES      = -35
  integer, parameter, public ::  CL_INVALID_COMMAND_QUEUE         = -36
  integer, parameter, public ::  CL_INVALID_HOST_PTR              = -37
  integer, parameter, public ::  CL_INVALID_MEM_OBJECT            = -38
  integer, parameter, public ::  CL_INVALID_IMAGE_FORMAT_DESC     = -39
  integer, parameter, public ::  CL_INVALID_IMAGE_SIZE            = -40
  integer, parameter, public ::  CL_INVALID_SAMPLER               = -41
  integer, parameter, public ::  CL_INVALID_BINARY                = -42
  integer, parameter, public ::  CL_INVALID_BUILD_OPTIONS         = -43
  integer, parameter, public ::  CL_INVALID_PROGRAM               = -44
  integer, parameter, public ::  CL_INVALID_PROGRAM_EXECUTABLE    = -45
  integer, parameter, public ::  CL_INVALID_KERNEL_NAME           = -46
  integer, parameter, public ::  CL_INVALID_KERNEL_DEFINITION     = -47
  integer, parameter, public ::  CL_INVALID_KERNEL                = -48
  integer, parameter, public ::  CL_INVALID_ARG_INDEX             = -49
  integer, parameter, public ::  CL_INVALID_ARG_VALUE             = -50
  integer, parameter, public ::  CL_INVALID_ARG_SIZE              = -51
  integer, parameter, public ::  CL_INVALID_KERNEL_ARGS           = -52
  integer, parameter, public ::  CL_INVALID_WORK_DIMENSION        = -53
  integer, parameter, public ::  CL_INVALID_WORK_GROUP_SIZE       = -54
  integer, parameter, public ::  CL_INVALID_WORK_ITEM_SIZE        = -55
  integer, parameter, public ::  CL_INVALID_GLOBAL_OFFSET         = -56
  integer, parameter, public ::  CL_INVALID_EVENT_WAIT_LIST       = -57
  integer, parameter, public ::  CL_INVALID_EVENT                 = -58
  integer, parameter, public ::  CL_INVALID_OPERATION             = -59
  integer, parameter, public ::  CL_INVALID_GL_OBJECT             = -60
  integer, parameter, public ::  CL_INVALID_BUFFER_SIZE           = -61
  integer, parameter, public ::  CL_INVALID_MIP_LEVEL             = -62
  integer, parameter, public ::  CL_INVALID_GLOBAL_WORK_SIZE      = -63
  ! /* Additional Error Codes (from cl_ext.h)  */
  integer, parameter, public ::  CL_PLATFORM_NOT_FOUND_KHR        = -1001

  ! /* cl_device_info */
  integer, parameter, public ::  CL_DEVICE_TYPE                              = 4096 ! 0x1000
  integer, parameter, public ::  CL_DEVICE_VENDOR_ID                         = 4097 ! 0x1001
  integer, parameter, public ::  CL_DEVICE_MAX_COMPUTE_UNITS                 = 4098 ! 0x1002
  integer, parameter, public ::  CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS          = 4099 ! 0x1003
  integer, parameter, public ::  CL_DEVICE_MAX_WORK_GROUP_SIZE               = 4100 ! 0x1004
  integer, parameter, public ::  CL_DEVICE_MAX_WORK_ITEM_SIZES               = 4101 ! 0x1005
  integer, parameter, public ::  CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR       = 4102 ! 0x1006
  integer, parameter, public ::  CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT      = 4103 ! 0x1007
  integer, parameter, public ::  CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT        = 4104 ! 0x1008
  integer, parameter, public ::  CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG       = 4105 ! 0x1009
  integer, parameter, public ::  CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT      = 4106 ! 0x100A
  integer, parameter, public ::  CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE     = 4107 ! 0x100B
  integer, parameter, public ::  CL_DEVICE_MAX_CLOCK_FREQUENCY               = 4108 ! 0x100C
  integer, parameter, public ::  CL_DEVICE_ADDRESS_BITS                      = 4109 ! 0x100D
  integer, parameter, public ::  CL_DEVICE_MAX_READ_IMAGE_ARGS               = 4110 ! 0x100E
  integer, parameter, public ::  CL_DEVICE_MAX_WRITE_IMAGE_ARGS              = 4111 ! 0x100F
  integer, parameter, public ::  CL_DEVICE_MAX_MEM_ALLOC_SIZE                = 4112 ! 0x1010
  integer, parameter, public ::  CL_DEVICE_IMAGE2D_MAX_WIDTH                 = 4113 ! 0x1011
  integer, parameter, public ::  CL_DEVICE_IMAGE2D_MAX_HEIGHT                = 4114 ! 0x1012
  integer, parameter, public ::  CL_DEVICE_IMAGE3D_MAX_WIDTH                 = 4115 ! 0x1013
  integer, parameter, public ::  CL_DEVICE_IMAGE3D_MAX_HEIGHT                = 4116 ! 0x1014
  integer, parameter, public ::  CL_DEVICE_IMAGE3D_MAX_DEPTH                 = 4117 ! 0x1015
  integer, parameter, public ::  CL_DEVICE_IMAGE_SUPPORT                     = 4118 ! 0x1016
  integer, parameter, public ::  CL_DEVICE_MAX_PARAMETER_SIZE                = 4119 ! 0x1017
  integer, parameter, public ::  CL_DEVICE_MAX_SAMPLERS                      = 4120 ! 0x1018
  integer, parameter, public ::  CL_DEVICE_MEM_BASE_ADDR_ALIGN               = 4121 ! 0x1019
  integer, parameter, public ::  CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE          = 4122 ! 0x101A
  integer, parameter, public ::  CL_DEVICE_SINGLE_FP_CONFIG                  = 4123 ! 0x101B
  integer, parameter, public ::  CL_DEVICE_GLOBAL_MEM_CACHE_TYPE             = 4124 ! 0x101C
  integer, parameter, public ::  CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE         = 4125 ! 0x101D
  integer, parameter, public ::  CL_DEVICE_GLOBAL_MEM_CACHE_SIZE             = 4126 ! 0x101E
  integer, parameter, public ::  CL_DEVICE_GLOBAL_MEM_SIZE                   = 4127 ! 0x101F
  integer, parameter, public ::  CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE          = 4128 ! 0x1020
  integer, parameter, public ::  CL_DEVICE_MAX_CONSTANT_ARGS                 = 4129 ! 0x1021
  integer, parameter, public ::  CL_DEVICE_LOCAL_MEM_TYPE                    = 4130 ! 0x1022
  integer, parameter, public ::  CL_DEVICE_LOCAL_MEM_SIZE                    = 4131 ! 0x1023
  integer, parameter, public ::  CL_DEVICE_ERROR_CORRECTION_SUPPORT          = 4132 ! 0x1024
  integer, parameter, public ::  CL_DEVICE_PROFILING_TIMER_RESOLUTION        = 4133 ! 0x1025
  integer, parameter, public ::  CL_DEVICE_ENDIAN_LITTLE                     = 4134 ! 0x1026
  integer, parameter, public ::  CL_DEVICE_AVAILABLE                         = 4135 ! 0x1027
  integer, parameter, public ::  CL_DEVICE_COMPILER_AVAILABLE                = 4136 ! 0x1028
  integer, parameter, public ::  CL_DEVICE_EXECUTION_CAPABILITIES            = 4137 ! 0x1029
  integer, parameter, public ::  CL_DEVICE_QUEUE_PROPERTIES                  = 4138 ! 0x102A
  integer, parameter, public ::  CL_DEVICE_NAME                              = 4139 ! 0x102B
  integer, parameter, public ::  CL_DEVICE_VENDOR                            = 4140 ! 0x102C
  integer, parameter, public ::  CL_DRIVER_VERSION                           = 4141 ! 0x102D
  integer, parameter, public ::  CL_DEVICE_PROFILE                           = 4142 ! 0x102E
  integer, parameter, public ::  CL_DEVICE_VERSION                           = 4143 ! 0x102F
  integer, parameter, public ::  CL_DEVICE_EXTENSIONS                        = 4144 ! 0x1030
  integer, parameter, public ::  CL_DEVICE_PLATFORM                          = 4145 ! 0x1031
  !/* 0x1032 reserved for CL_DEVICE_DOUBLE_FP_CONFIG */
  !/* 0x1033 reserved for CL_DEVICE_HALF_FP_CONFIG */
  integer, parameter, public ::  CL_DEVICE_PREFERRED_VECTOR_WIDTH_HALF       = 4148 ! 0x1034
  integer, parameter, public ::  CL_DEVICE_HOST_UNIFIED_MEMORY               = 4149 ! 0x1035
  integer, parameter, public ::  CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR          = 4150 ! 0x1036
  integer, parameter, public ::  CL_DEVICE_NATIVE_VECTOR_WIDTH_SHORT         = 4151 ! 0x1037
  integer, parameter, public ::  CL_DEVICE_NATIVE_VECTOR_WIDTH_INT           = 4152 ! 0x1038
  integer, parameter, public ::  CL_DEVICE_NATIVE_VECTOR_WIDTH_LONG          = 4153 ! 0x1039
  integer, parameter, public ::  CL_DEVICE_NATIVE_VECTOR_WIDTH_FLOAT         = 4154 ! 0x103A
  integer, parameter, public ::  CL_DEVICE_NATIVE_VECTOR_WIDTH_DOUBLE        = 4155 ! 0x103B
  integer, parameter, public ::  CL_DEVICE_NATIVE_VECTOR_WIDTH_HALF          = 4156 ! 0x103C
  integer, parameter, public ::  CL_DEVICE_OPENCL_C_VERSION                  = 4157 ! 0x103D

  !/* cl_device_type - bitfield */
  integer, parameter, public :: CL_DEVICE_TYPE_DEFAULT     =  1 ! (1 << 0)
  integer, parameter, public :: CL_DEVICE_TYPE_CPU         =  2 ! (1 << 1)
  integer, parameter, public :: CL_DEVICE_TYPE_GPU         =  4 ! (1 << 2)
  integer, parameter, public :: CL_DEVICE_TYPE_ACCELERATOR =  8 ! (1 << 3)
  integer, parameter, public :: CL_DEVICE_TYPE_ALL         = -1 ! 0xFFFFFFFF

  !/* cl_platform_info */
  integer, parameter, public :: CL_PLATFORM_PROFILE    = 2304 ! 0x0900
  integer, parameter, public :: CL_PLATFORM_VERSION    = 2305 ! 0x0901
  integer, parameter, public :: CL_PLATFORM_NAME       = 2306 ! 0x0902
  integer, parameter, public :: CL_PLATFORM_VENDOR     = 2307 ! 0x0903
  integer, parameter, public :: CL_PLATFORM_EXTENSIONS = 2308 ! 0x0904

  !/* cl_mem_flags - bitfield */
  integer, parameter, public :: CL_MEM_READ_WRITE     = 1    ! (1 << 0)
  integer, parameter, public :: CL_MEM_WRITE_ONLY     = 2    ! (1 << 1)
  integer, parameter, public :: CL_MEM_READ_ONLY      = 4    ! (1 << 2)
  integer, parameter, public :: CL_MEM_USE_HOST_PTR   = 8    ! (1 << 3)
  integer, parameter, public :: CL_MEM_ALLOC_HOST_PTR = 16   ! (1 << 4)
  integer, parameter, public :: CL_MEM_COPY_HOST_PTR  = 32   ! (1 << 5)
  
  !/* cl_command_queue_properties - bitfield */
  integer, parameter, public :: CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE = 1 ! (1 << 0)
  integer, parameter, public :: CL_QUEUE_PROFILING_ENABLE              = 2 ! (1 << 1)

  !/* cl_bool */
  integer, parameter, public :: CL_FALSE = 0
  integer, parameter, public :: CL_TRUE  = 1

  !/* cl_kernel_work_group_info */
  integer, parameter, public :: CL_KERNEL_WORK_GROUP_SIZE                    = 4528 ! 0x11B0
  integer, parameter, public :: CL_KERNEL_COMPILE_WORK_GROUP_SIZE            = 4529 ! 0x11B1
  integer, parameter, public :: CL_KERNEL_LOCAL_MEM_SIZE                     = 4530 ! 0x11B2
  integer, parameter, public :: CL_KERNEL_PREFERRED_WORK_GROUP_SIZE_MULTIPLE = 4531 ! 0x11B3
  integer, parameter, public :: CL_KERNEL_PRIVATE_MEM_SIZE                   = 4532 ! 0x11B4

  !/* cl_program_build_info */
  integer, parameter, public :: CL_PROGRAM_BUILD_STATUS  = 4481 ! 0x1181
  integer, parameter, public :: CL_PROGRAM_BUILD_OPTIONS = 4482 ! 0x1182
  integer, parameter, public :: CL_PROGRAM_BUILD_LOG     = 4483 ! 0x1183

contains
  
  integer pure function cl_bool(fortran_logical)
    logical, intent(in) :: fortran_logical
    
    if(fortran_logical .eqv. .true.) then
      cl_bool = CL_TRUE
    else
      cl_bool = CL_FALSE
    end if
    
  end function cl_bool
  
end module cl_constants_m

!! Local Variables:
!! mode: f90
!! coding: utf-8
!! End:
