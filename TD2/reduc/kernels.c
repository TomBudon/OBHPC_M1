//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

//
#include "types.h"

//Baseline - naive implementation
f64 reduc_base(f64 *restrict a, u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += a[i];

  return d;
}

f64 reduc_unroll4(f64 *restrict a, u64 n)
{
  #define UNROLL4 4

  double d = 0.0;

  u64 mod = n % UNROLL4;
  
  for (u64 i = 0; i < n-mod; i += UNROLL4) {
    d += a[i    ];
    d += a[i + 1];
    d += a[i + 2];
    d += a[i + 3];
  }

  for (u64 i = n-mod; i < n; i++) {
    d += a[i];
  }

  return d;
}

f64 reduc_unroll8(f64 *restrict a, u64 n)
{
  #define UNROLL8 8

  double d = 0.0;

  u64 mod = n % UNROLL8;
  
  for (u64 i = 0; i < n-mod; i += UNROLL8) {
    d += a[i    ];
    d += a[i + 1];
    d += a[i + 2];
    d += a[i + 3];
    d += a[i + 4];
    d += a[i + 5];
    d += a[i + 6];
    d += a[i + 7];
  }

  for (u64 i = n-mod; i < n; i++) {
    d += a[i];
  }

  return d;
}

f64 reduc_unroll16(f64 *restrict a, u64 n)
{
  #define UNROLL16 16

  double d = 0.0;

  u64 mod = n % UNROLL16;
  
  for (u64 i = 0; i < n-mod; i += UNROLL16) {
    d += a[i    ];
    d += a[i + 1];
    d += a[i + 2];
    d += a[i + 3];
    d += a[i + 4];
    d += a[i + 5];
    d += a[i + 6];
    d += a[i + 7];
    d += a[i + 8];
    d += a[i + 9];
    d += a[i + 10];
    d += a[i + 11];
    d += a[i + 12];
    d += a[i + 13];
    d += a[i + 14];
    d += a[i + 15];
  }

  for (u64 i = n-mod; i < n; i++) {
    d += a[i];
  }

  return d;
}

