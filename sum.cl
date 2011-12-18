__kernel void sum(const int size, const __global float * vec1, __global float * vec2){
  int ii = get_global_id(0);

  if(ii < size) vec2[ii] += vec1[ii];

}
