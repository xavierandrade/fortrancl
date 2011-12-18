/*
** Copyright (C) 2010-2011 X. Andrade <xavier@tddft.org>
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
#include <CL/cl.h>

/* -----------------------------------------------------------------------*/

void FC_FUNC(clreleasecontext_low, CLRELEASECONTEXT_LOW)(cl_context * context, int * status){
  *status = (int) clReleaseContext(*context);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clcreatecontext_low, CLCREATECONTEXT_LOW)
     (const cl_platform_id * platform, const int * num_devices, const cl_device_id * devices, int * errcode_ret, cl_context * context){
  cl_int errcode_ret_cl;
  cl_context_properties context_properties[3];

  context_properties[0] = CL_CONTEXT_PLATFORM;
  context_properties[1] = (cl_context_properties) *platform;
  context_properties[2] = 0;
  
  *context = clCreateContext(context_properties, (cl_uint) *num_devices, devices, NULL, NULL, &errcode_ret_cl);
  *errcode_ret = (int) errcode_ret_cl;
  
}
