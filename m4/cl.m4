## Copyright (C) 2012 X. Andrade
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU Lesser General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Lesser General Public License for more details.
##
## You should have received a copy of the GNU Lesser General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
## 02111-1307, USA.
##
## $Id: fcflags.m4 5257 2009-04-17 12:56:44Z marques $
##
################################################
# Get default FFLAGS
# ----------------------------------
# this function can certainly be improved on
AC_DEFUN([ACX_CL],
[
AC_CHECK_HEADER(CL/cl.h, [], [AC_MSG_ERROR([Cannot find the OpenCL header.])], [])
AC_CHECK_FUNC(clGetPlatformIDs, [], [LIBS=$LIBS" -lOpenCL"])
AC_CHECK_FUNC(clFinish, [], [AC_MSG_ERROR([Cannot find the OpenCL library.])])
])
