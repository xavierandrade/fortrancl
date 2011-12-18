## Process this file with automake to produce Makefile.in

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

if F90_MOD_UPPERCASE
  LIBFUNCMOD = CL.@ax_cv_f90_modext@
else
  LIBFUNCMOD = cl.@ax_cv_f90_modext@
endif

nodist_include_HEADERS = $(LIBFUNCMOD)

lib_LIBRARIES = libfortrancl.a

libfortrancl_a_SOURCES =       \
	cl_types.f90           \
	cl_buffer.f90          \
	cl_command_queue.f90   \
	cl_constants.f90       \
	cl_context.f90         \
	cl_device.f90          \
	cl_kernel.f90          \
	cl_platform.f90        \
	cl_program.f90         \
	cl.f90

libfortrancl_a_SOURCES +=            \
	cl_buffer_low.c              \
	cl_command_queue_low.c       \
	cl_context_low.c             \
	cl_device_low.c              \
	cl_kernel_low.c              \
	cl_platform_low.c            \
	cl_program_low.c

noinst_HEADERS =               \
	string_f.h

noinst_PROGRAMS = example

example_SOURCES = example.f90
example_LDADD = libfortrancl.a
dist_noinst_DATA = sum.cl

cl_types.o     : cl_types.f90 
cl_constants.o : cl_constants.f90
cl_platform.o  : cl_platform.f90 cl_types.o 
cl_program.o   : cl_program.f90 cl_types.o 
cl_kernel.o    : cl_kernel.f90 cl_types.o 
cl_device.o    : cl_device.f90 cl_types.o 
cl_context.o   : cl_context.f90 cl_types.o 
cl_command_queue.o : cl_command_queue.f90 cl_types.o 
cl_buffer.o    : cl_buffer.f90  cl_types.o 
cl.o : cl.f90 cl_constants.o cl_types.o cl_device.o cl_kernel.o cl_program.o cl_platform.o cl_context.o cl_command_queue.o cl_buffer.o

CLEANFILES = *~ *.bak *.mod *.MOD *.il *.d *.pc* ifc*
