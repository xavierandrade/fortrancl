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

void FC_FUNC_(clcreatekernel_low, CLCREATEKERNEL_LOW)
     (cl_program * program, STR_F_TYPE kernel_name_f, int * errcode_ret, cl_kernel * kernel STR_ARG1){
  char * kernel_name;
  cl_int errcode_ret_cl;

  TO_C_STR1(kernel_name_f, kernel_name);

  *kernel = clCreateKernel(*program, kernel_name, &errcode_ret_cl);
  *errcode_ret = (int) errcode_ret_cl;

  free(kernel_name);
}


/* -----------------------------------------------------------------------*/

void FC_FUNC_(clreleasekernel_low, CLRELEASEKERNEL_LOW)(cl_kernel * kernel, int * status){
  *status = (int) clReleaseKernel(*kernel);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clsetkernelarg_buf, CLSETKERNELARG_BUF)
     (cl_kernel * kernel, const int * arg_index, cl_mem * arg_value, int * status){

  *status = (int) clSetKernelArg(*kernel, (cl_uint) *arg_index, (size_t) sizeof(cl_mem), arg_value);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clsetkernelarg_int, CLSETKERNELARG_INT)
     (cl_kernel * kernel, const int * arg_index, const int * arg_value, int * status){

  *status = (int) clSetKernelArg(*kernel, (cl_uint) *arg_index, (size_t) sizeof(int), arg_value);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clsetkernelarg_float, CLSETKERNELARG_FLOAT)
     (cl_kernel * kernel, const int * arg_index, const float * arg_value, int * status){

  *status = (int) clSetKernelArg(*kernel, (cl_uint) *arg_index, (size_t) sizeof(float), arg_value);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clsetkernelarg_double, CLSETKERNELARG_DOUBLE)
     (cl_kernel * kernel, const int * arg_index, const double * arg_value, int * status){

  *status = (int) clSetKernelArg(*kernel, (cl_uint) *arg_index, (size_t) sizeof(double), arg_value);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clsetkernelarglocal_low, CLSETKERNELARGLOCAL_LOW)
     (cl_kernel * kernel, const int * arg_index, const cl_long * arg_size, int * status){
  
  *status = (int) clSetKernelArg(*kernel, *arg_index, (size_t) *arg_size, NULL);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clgetkernelworkgroupinfo_int64, CLGETKERNELWORKGROUPINFO_int64)
     (cl_kernel * kernel, cl_device_id * device, int * param_name, cl_long * param_value, int * retcode_err){

  union {
    size_t val_size_t;
    cl_ulong val_ulong;
  } rval;

  *retcode_err = (int) clGetKernelWorkGroupInfo(*kernel, *device, (cl_kernel_work_group_info) *param_name, 
					       sizeof(rval), &rval, NULL);
  if(*retcode_err != CL_SUCCESS) return;

  switch(*param_name){
  case CL_KERNEL_WORK_GROUP_SIZE:
#ifdef CL_VERSION_1_1
  case CL_KERNEL_PREFERRED_WORK_GROUP_SIZE_MULTIPLE:
#endif
    *param_value = rval.val_size_t;
    break;
  case CL_KERNEL_LOCAL_MEM_SIZE:
#ifdef CL_VERSION_1_1
  case CL_KERNEL_PRIVATE_MEM_SIZE:
#endif
    *param_value = rval.val_ulong;
    break;
  default:
    fprintf(stderr, "\nFortranCL error: clGetKernelWorkGroupInfo not implemented param_name.\n");
    exit(1);
    break;
  }

}

/* -----------------------------------------------------------------------*/

