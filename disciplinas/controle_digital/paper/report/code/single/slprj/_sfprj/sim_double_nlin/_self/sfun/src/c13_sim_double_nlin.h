#ifndef __c13_sim_double_nlin_h__
#define __c13_sim_double_nlin_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef typedef_SFc13_sim_double_nlinInstanceStruct
#define typedef_SFc13_sim_double_nlinInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c13_sfEvent;
  boolean_T c13_isStable;
  boolean_T c13_doneDoubleBufferReInit;
  uint8_T c13_is_active_c13_sim_double_nlin;
  real_T (*c13_x)[4];
  real_T (*c13_y)[2];
} SFc13_sim_double_nlinInstanceStruct;

#endif                                 /*typedef_SFc13_sim_double_nlinInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c13_sim_double_nlin_get_eml_resolved_functions_info
  (void);

/* Function Definitions */
extern void sf_c13_sim_double_nlin_get_check_sum(mxArray *plhs[]);
extern void c13_sim_double_nlin_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
