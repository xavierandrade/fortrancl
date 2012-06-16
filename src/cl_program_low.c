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
#include "localcl.h"

#include <string_f.h>

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clcreateprogramwithsource_low, CLCREATEPROGRAMWITHSOURCE_LOW)
     (cl_context * context, STR_F_TYPE string, int * retcode_err, cl_program * program STR_ARG1){
  char * string_c;
  cl_int retcode_err_cl;

  TO_C_STR1(string, string_c);

  *program = clCreateProgramWithSource(*context, 1, (const char**) &string_c, NULL, &retcode_err_cl);
  *retcode_err = (int) retcode_err_cl;

  free(string_c);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clbuildprogram_nodevices,CLBUILDPROGRAM_NODEVICES)
     (cl_program * program, STR_F_TYPE options, int * retcode_err STR_ARG1){
  char * options_c;

  TO_C_STR1(options, options_c);

  *retcode_err = (int) clBuildProgram(*program, 0, NULL, options_c, NULL, NULL);

  free(options_c);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clgetprogrambuildinfo_str,CLGETPROGRAMBUILDINFO_STR)
     (cl_program * program, cl_device_id * device, const int * param_name, 
      STR_F_TYPE param_value, int * retcode_err STR_ARG1){
  char param_value_c[2000];

  *retcode_err = (int) clGetProgramBuildInfo(*program, *device, (cl_program_build_info) *param_name,
					     sizeof(param_value_c), param_value_c, NULL);

  TO_F_STR1(param_value_c, param_value);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clreleaseprogram_low, CLRELEASEPROGRAM_LOW)
     (cl_program * program, int * status){

  *status = (int) clReleaseProgram(*program);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clretainprogram_low, CLRETAINPROGRAM_LOW)
     (cl_program * program, int * status){

  *status = (int) clRetainProgram(*program);
}

