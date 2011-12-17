## Copyright (C) 2002-2006 M. Marques, A. Castro, A. Rubio, G. Bertsch
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
## 02111-1307, USA.
##
## $Id: configure.ac 8645 2011-12-01 03:53:15Z dstrubbe $

AC_PREREQ(2.59)
AC_INIT([FortranCL],[0.1],[xavier@tddft.org],[fortrancl])
AC_CONFIG_SRCDIR([cl.f90])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE

AC_CONFIG_HEADERS([config.h])

# Installation prefix by default
AC_PREFIX_DEFAULT([/usr/local])

# who am i
AC_CANONICAL_HOST

# Checks for programs.
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_RANLIB
AC_PROG_YACC

AC_PROG_CC

# Checks for header files.
AC_HEADER_DIRENT
AC_HEADER_STDC
AC_CHECK_HEADERS([signal.h errno.h])
AC_FUNC_ALLOCA

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_PID_T
AC_TYPE_SIZE_T
AC_HEADER_TIME
AC_CHECK_SIZEOF(void*)
AC_CHECK_SIZEOF(size_t)
AC_CHECK_TYPES([uint32_t, uint64_t])
AC_CHECK_SIZEOF(unsigned int)
AC_CHECK_SIZEOF(unsigned long)
AC_CHECK_SIZEOF(unsigned long long)

# Checks for library functions.
AC_PROG_GCC_TRADITIONAL
AC_FUNC_STAT
AC_CHECK_HEADER(CL/cl.h, [], [AC_MSG_ERROR([Cannot find the OpenCL header.])], [])
AC_CHECK_FUNC(clGetPlatformIDs, [], [LIBS=$LIBS" -lOpenCL"])
AC_CHECK_FUNC(clFinish, [], [AC_MSG_ERROR([Cannot find the OpenCL library.])])
AC_DEFINE(HAVE_OPENCL, 1, [defined if opencl support is enabled])

AC_PROG_FC([], Fortran 90)

if test x"$FC" = x; then
  AC_MSG_ERROR([could not find Fortran 90 compiler])
fi
AC_LANG_PUSH(Fortran)
AC_FC_SRCEXT(f90)
FCFLAGS="${acx_save_fcflags}"

dnl how Fortran mangles function names
AC_FC_WRAPPERS
acx_save_libs="${LIBS}"
LIBS="${FCEXTRALIBS} $FCLIBS"

AC_CONFIG_FILES([Makefile])

AC_OUTPUT
