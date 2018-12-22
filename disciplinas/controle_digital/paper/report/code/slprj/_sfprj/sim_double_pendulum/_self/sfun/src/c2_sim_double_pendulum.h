#ifndef __c2_sim_double_pendulum_h__
#define __c2_sim_double_pendulum_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef struct_struct_mEUZu42qRj35wbZciHGI8D_tag
#define struct_struct_mEUZu42qRj35wbZciHGI8D_tag

struct struct_mEUZu42qRj35wbZciHGI8D_tag
{
  real_T g;
  real_T m0;
  real_T b0;
  real_T m1;
  real_T I1;
  real_T b1;
  real_T L1;
  real_T L1_cg;
  real_T m2;
  real_T I2;
  real_T b2;
  real_T L2;
  real_T L2_cg;
  real_T Kt;
  real_T Ke;
  real_T Ra;
  real_T Vcc;
  real_T D;
  real_T nbits;
  real_T q0[3];
  real_T qp0[3];
  real_T K[6];
  real_T L[18];
  real_T Phi[36];
  real_T Gamma[6];
  real_T C[18];
  real_T ts;
  real_T x0[6];
  real_T u0;
  real_T _y0[3];
};

#endif                                 /*struct_struct_mEUZu42qRj35wbZciHGI8D_tag*/

#ifndef typedef_c2_struct_mEUZu42qRj35wbZciHGI8D
#define typedef_c2_struct_mEUZu42qRj35wbZciHGI8D

typedef struct struct_mEUZu42qRj35wbZciHGI8D_tag
  c2_struct_mEUZu42qRj35wbZciHGI8D;

#endif                                 /*typedef_c2_struct_mEUZu42qRj35wbZciHGI8D*/

#ifndef typedef_SFc2_sim_double_pendulumInstanceStruct
#define typedef_SFc2_sim_double_pendulumInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c2_sfEvent;
  boolean_T c2_isStable;
  boolean_T c2_doneDoubleBufferReInit;
  uint8_T c2_is_active_c2_sim_double_pendulum;
  c2_struct_mEUZu42qRj35wbZciHGI8D c2_params;
  real_T (*c2_q)[3];
  real_T (*c2_M)[9];
} SFc2_sim_double_pendulumInstanceStruct;

#endif                                 /*typedef_SFc2_sim_double_pendulumInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c2_sim_double_pendulum_get_eml_resolved_functions_info
  (void);

/* Function Definitions */
extern void sf_c2_sim_double_pendulum_get_check_sum(mxArray *plhs[]);
extern void c2_sim_double_pendulum_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
