/*
 * LC_VSI_filter_types.h
 *
 * Code generation for model "LC_VSI_filter".
 *
 * Model version              : 1.152
 * Simulink Coder version : 8.13 (R2017b) 24-Jul-2017
 * C source code generated on : Tue Mar 19 15:16:53 2019
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_LC_VSI_filter_types_h_
#define RTW_HEADER_LC_VSI_filter_types_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#ifndef DEFINED_TYPEDEF_FOR_struct_cqqzkRFoVaYOCtrgrKJtCB_
#define DEFINED_TYPEDEF_FOR_struct_cqqzkRFoVaYOCtrgrKJtCB_

typedef struct {
  real_T A_w[4];
  real_T C_w[2];
  real_T w;
  real_T phi;
  real_T A;
} struct_cqqzkRFoVaYOCtrgrKJtCB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_1vauFHZcjfbvOr3tYetm3G_
#define DEFINED_TYPEDEF_FOR_struct_1vauFHZcjfbvOr3tYetm3G_

typedef struct {
  struct_cqqzkRFoVaYOCtrgrKJtCB w_1;
  struct_cqqzkRFoVaYOCtrgrKJtCB w_5;
  struct_cqqzkRFoVaYOCtrgrKJtCB w_7;
} struct_1vauFHZcjfbvOr3tYetm3G;

#endif

/* Parameters (auto storage) */
typedef struct P_LC_VSI_filter_T_ P_LC_VSI_filter_T;

/* Forward declaration for rtModel */
typedef struct tag_RTM_LC_VSI_filter_T RT_MODEL_LC_VSI_filter_T;

#endif                                 /* RTW_HEADER_LC_VSI_filter_types_h_ */
