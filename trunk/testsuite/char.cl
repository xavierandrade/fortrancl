/* Copyright (C) 2012 X. Andrade
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
**/

__kernel void replace(const char sea, const char rep, __global char * string)	{
  int ii = get_global_id(0);
  
  if(string[ii] == sea) string[ii] = rep;

}

/*
 Local Variables:
 mode: c
 coding: utf-8
 End:
*/
