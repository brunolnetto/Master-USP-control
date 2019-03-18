#ifndef __c2_sim_double_lin_h__
#define __c2_sim_double_lin_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef typedef_SFc2_sim_double_linInstanceStruct
#define typedef_SFc2_sim_double_linInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c2_sfEvent;
  boolean_T c2_isStable;
  boolean_T c2_doneDoubleBufferReInit;
  uint8_T c2_is_active_c2_sim_double_lin;
  real_T c2_Phi[16];
  real_T c2_C[8];
  real_T c2_L[8];
  real_T c2_Gamma[4];
  real_T c2_Kp[4];
  real_T c2_Ki;
  real_T *c2_v_address;
  int32_T c2_v_index;
  real_T (*c2_xhat_address)[4];
  int32_T c2_xhat_index;
  real_T *c2_r;
  real_T *c2_u;
  real_T (*c2_xhat_)[4];
  real_T (*c2_y)[2];
  real_T (*c2_x)[4];
} SFc2_sim_double_linInstanceStruct;

#endif                                 /*typedef_SFc2_sim_double_linInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c2_sim_double_lin_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c2_sim_double_lin_get_check_sum(mxArray *plhs[]);
extern void c2_sim_double_lin_method_dispatcher(SimStruct *S, int_T method, void
  *data);

#endif
