/*
** Copyright (C) 2010-2012 X. Andrade <xavier@tddft.org>
** 
** FortranCL is free software: you can redistribute it and/or modify
** it under the terms of the GNU Lesser General Public License as published by
** the Free Software Foundation, either version 3 of the License, or
** (at your option) any later version.
**
** FortranCL is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU Lesser General Public License for more details.
**
** You should have received a copy of the GNU Lesser General Public License
** along with this program.  If not, see <http://www.gnu.org/licenses/>.
**
** $Id$
*/

#include <config.h>
#include <stdlib.h>
#include <stdio.h>
#include "localcl.h"

#include <string_f.h>

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clgetdeviceids_num, CLGETDEVICEIDS_NUM)
     (const cl_platform_id * platform, const int * device_type, int * num_devices, int * status){
  cl_uint unum_devices;

  *status = (int) clGetDeviceIDs(*platform, *device_type, 0, NULL, &unum_devices);
  *num_devices = (int) unum_devices;
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clgetdeviceids_listall, CLGETDEVICEIDS_LISTALL)
     (const cl_platform_id * platform, const int * device_type, const int * num_entries, cl_device_id * devices, 
      int * num_devices, int * status){

  cl_uint unum_devices;

  *status = (int) clGetDeviceIDs(*platform, *device_type, (cl_uint) *num_entries, devices, &unum_devices);
  *num_devices = (int) unum_devices;
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clgetdeviceinfo_str, CLGETDEVICEINFO_STR)
     (const cl_device_id * device, const int * param_name, STR_F_TYPE param_value, int * status STR_ARG1){
  char info[2048];

  *status = (int) clGetDeviceInfo(*device, (cl_device_info) *param_name, sizeof(info), info, NULL);

  TO_F_STR1(info, param_value);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clgetdeviceinfo_int64, CLGETDEVICEINFO_INT64)
     (const cl_device_id * device, const int * param_name, cl_long * param_value, int * status){
  union { 
    cl_uint        val_uint;
    cl_bool        val_bool;
    cl_ulong       val_ulong;
    size_t         val_size_t;
    cl_device_type val_cl_device_type;
  } rval;
  
  *status = (int) clGetDeviceInfo(*device, (cl_device_info) *param_name, sizeof(rval), &rval, NULL);

  if(*status != CL_SUCCESS) return;
  
  switch(*param_name){
    /* return cl_uint*/
  case CL_DEVICE_ADDRESS_BITS:
  case CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE:
  case CL_DEVICE_MAX_CLOCK_FREQUENCY:
  case CL_DEVICE_MAX_COMPUTE_UNITS:
  case CL_DEVICE_MAX_CONSTANT_ARGS:
  case CL_DEVICE_MAX_READ_IMAGE_ARGS:
  case CL_DEVICE_MAX_SAMPLERS:
  case CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS:
  case CL_DEVICE_MAX_WRITE_IMAGE_ARGS:
  case CL_DEVICE_MEM_BASE_ADDR_ALIGN:
  case CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE:
#ifdef CL_VERSION_1_1
  case CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR:
  case CL_DEVICE_NATIVE_VECTOR_WIDTH_SHORT:
  case CL_DEVICE_NATIVE_VECTOR_WIDTH_INT:
  case CL_DEVICE_NATIVE_VECTOR_WIDTH_LONG:
  case CL_DEVICE_NATIVE_VECTOR_WIDTH_FLOAT:
  case CL_DEVICE_NATIVE_VECTOR_WIDTH_DOUBLE:
  case CL_DEVICE_NATIVE_VECTOR_WIDTH_HALF:
  case CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR:
  case CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT:
  case CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT:
  case CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG:
  case CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT:
  case CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE:
  case CL_DEVICE_PREFERRED_VECTOR_WIDTH_HALF:
#endif
  case CL_DEVICE_VENDOR_ID:
    *param_value = rval.val_uint;
    break;

    /* return cl_ulong */
  case CL_DEVICE_GLOBAL_MEM_CACHE_SIZE:
  case CL_DEVICE_GLOBAL_MEM_SIZE:
  case CL_DEVICE_LOCAL_MEM_SIZE:
  case CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE:
  case CL_DEVICE_MAX_MEM_ALLOC_SIZE:
    *param_value = rval.val_ulong;
    break;

    /* return size_t */
  case CL_DEVICE_IMAGE2D_MAX_HEIGHT:
  case CL_DEVICE_IMAGE2D_MAX_WIDTH:
  case CL_DEVICE_IMAGE3D_MAX_DEPTH:
  case CL_DEVICE_IMAGE3D_MAX_HEIGHT:
  case CL_DEVICE_IMAGE3D_MAX_WIDTH:
  case CL_DEVICE_MAX_PARAMETER_SIZE:
  case CL_DEVICE_MAX_WORK_GROUP_SIZE:
  case CL_DEVICE_PROFILING_TIMER_RESOLUTION:
   *param_value = rval.val_size_t;
    break;

    /* return cl_bool */
  case CL_DEVICE_AVAILABLE:
  case CL_DEVICE_COMPILER_AVAILABLE:
  case CL_DEVICE_ENDIAN_LITTLE:
  case CL_DEVICE_ERROR_CORRECTION_SUPPORT:
#ifdef CL_VERSION_1_1
  case CL_DEVICE_HOST_UNIFIED_MEMORY:
#endif
  case CL_DEVICE_IMAGE_SUPPORT:
    *param_value = rval.val_bool;
    break;

    /* return cl_device_type */
  case CL_DEVICE_TYPE:
    *param_value = rval.val_cl_device_type;
    break;

  /* other */
  default:
    fprintf(stderr, "\nFortranCL error: clGetDeviceInfo not implemented param_name (%x).\n", *param_name);
    exit(1);
    break;
  }

}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clgetdeviceinfo_int, CLGETDEVICEINFO_INT)
     (const cl_device_id * device, const int * param_name, cl_int * param_value, int * status){
  cl_long param_value64;

  FC_FUNC_(clgetdeviceinfo_int64, CLGETDEVICEINFO_INT64)(device, param_name, &param_value64, status);
  
  *param_value = (cl_int) param_value64;
}

#ifdef  CL_VERSION_1_2

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clreleasedevice_low, CLRELEASEDEVICE_LOW)
     (const cl_device_id * device, int * errcode_ret){
  
  *errcode_ret = clReleaseDevice(*device);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clretaindevice_low, CLRETAINDEVICE_LOW)
     (const cl_device_id * device, int * errcode_ret){
  
  *errcode_ret = clRetainDevice(*device);
}

/* -----------------------------------------------------------------------*/

#endif
