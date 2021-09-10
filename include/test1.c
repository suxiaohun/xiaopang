#include <stdlib.h>
#include <math.h>

int ffi_pow(int a, int n) {
  return pow(a, n);
}

int ffi_factorial(int max) {
  int i=max, result=1;
  while (i >= 2) { result *= i--; }
  return result;
}
