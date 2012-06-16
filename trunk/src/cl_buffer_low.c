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
#include "localcl.h"

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clcreatebuffer_low, CLCREATEBUFFER_LOW)
     (cl_context * context, const int * flags, const cl_long * size, int * errcode_ret, cl_mem * buffer){
  
  cl_int errcode_ret_cl;

  *buffer = clCreateBuffer(*context, (cl_mem_flags) *flags, (size_t) *size, NULL, &errcode_ret_cl);
  *errcode_ret = (int) errcode_ret_cl;
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clreleasememobject_low, CLRELEASEMEMOBJECT_LOW)(cl_mem * memobj, int * status){

  *status = (int)clReleaseMemObject(*memobj);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clretainmemobject_low, CLRETAINMEMOBJECT_LOW)(cl_mem * memobj, int * status){

  *status = (int)clRetainMemObject(*memobj);
}

/* -----------------------------------------------------------------------*/
