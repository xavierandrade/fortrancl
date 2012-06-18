/*
** Copyright (C) 2012 X. Andrade <xavier@tddft.org>
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

void FC_FUNC_(clreleaseevent_low, CLRELEASEEVENT_LOW)(cl_event * event, int * status){

  *status = (int)clReleaseEvent(*event);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clretainevent_low, CLRETAINEVENT_LOW)(cl_event * event, int * status){

  *status = (int)clRetainEvent(*event);
}

/* -----------------------------------------------------------------------*/

void FC_FUNC_(clwaitforevents_low, CLWAITFOREVENTS_ARRAY_LOW)
     (const int * numevents, const cl_event * event, int * status){

  *status = (int)clWaitForEvents(*numevents, event);
}

/* -----------------------------------------------------------------------*/
