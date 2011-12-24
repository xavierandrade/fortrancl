## Copyright (C) 2011 X. Andrade <xavier@tddft.org>
## 
## FortranCL is free software: you can redistribute it and/or modify
## it under the terms of the GNU Lesser General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## FortranCL is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Lesser General Public License for more details.
##
## You should have received a copy of the GNU Lesser General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
##
## $Id$

AC_INIT([FortranCL],[0.1alpha1],[xavier@tddft.org],[fortrancl])
AC_CONFIG_SRCDIR([src/cl.f90])
AM_INIT_AUTOMAKE

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

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
AC_HEADER_STDC

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST

# Checks for library functions.
AC_PROG_GCC_TRADITIONAL
AC_FUNC_STAT
AC_CHECK_HEADER(CL/cl.h, [], [AC_MSG_ERROR([Cannot find the OpenCL header.])], [])
AC_CHECK_FUNC(clGetPlatformIDs, [], [LIBS=$LIBS" -lOpenCL"])
AC_CHECK_FUNC(clFinish, [], [AC_MSG_ERROR([Cannot find the OpenCL library.])])

AC_PROG_FC([], Fortran 90)

if test x"$FC" = x; then
  AC_MSG_ERROR([could not find Fortran 90 compiler])
fi
AC_LANG_PUSH(Fortran)
AC_FC_SRCEXT(f90)

FCFLAGS="${acx_save_fcflags}"

ACX_FCFLAGS

dnl how Fortran mangles function names
AC_FC_WRAPPERS
acx_save_libs="${LIBS}"
LIBS="${FCEXTRALIBS} $FCLIBS"

AX_F90_MODULE_EXTENSION
AX_F90_MODULE_FLAG
F90_MODULE_FLAG=$ax_cv_f90_modflag
AC_SUBST([F90_MODULE_FLAG])

AC_SUBST(ax_cv_f90_modext)
AM_CONDITIONAL(F90_MOD_UPPERCASE, [test x$ax_f90_mod_uppercase = xyes])

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([src/Makefile])
AC_CONFIG_FILES([examples/Makefile])

AC_OUTPUT
