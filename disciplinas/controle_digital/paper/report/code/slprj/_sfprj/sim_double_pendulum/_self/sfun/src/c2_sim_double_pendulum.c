/* Include files */

#include <stddef.h>
#include "blas.h"
#include "sim_double_pendulum_sfun.h"
#include "c2_sim_double_pendulum.h"
#include "mwmathutil.h"
#define CHARTINSTANCE_CHARTNUMBER      (chartInstance->chartNumber)
#define CHARTINSTANCE_INSTANCENUMBER   (chartInstance->instanceNumber)
#include "sim_double_pendulum_sfun_debug_macros.h"
#define _SF_MEX_LISTEN_FOR_CTRL_C(S)   sf_mex_listen_for_ctrl_c_with_debugger(S, sfGlobalDebugInstanceStruct);

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization);
static void chart_debug_initialize_data_addresses(SimStruct *S);

/* Type Definitions */

/* Named Constants */
#define CALL_EVENT                     (-1)

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;
static const char * c2_debug_family_names[5] = { "nargin", "nargout", "q",
  "params", "M" };

/* Function Declarations */
static void initialize_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static void initialize_params_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static void enable_c2_sim_double_pendulum(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance);
static void disable_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static void c2_update_debugger_state_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static void set_sim_state_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance, const mxArray *c2_st);
static void finalize_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static void sf_gateway_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static void mdl_start_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static void initSimStructsc2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static void init_script_number_translation(uint32_T c2_machineNumber, uint32_T
  c2_chartNumber, uint32_T c2_instanceNumber);
static const mxArray *c2_sf_marshallOut(void *chartInstanceVoid, void *c2_inData);
static void c2_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_b_M, const char_T *c2_identifier, real_T
  c2_y[9]);
static void c2_b_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[9]);
static void c2_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static const mxArray *c2_b_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static void c2_c_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  c2_struct_mEUZu42qRj35wbZciHGI8D *c2_y);
static real_T c2_d_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId);
static void c2_e_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[3]);
static void c2_f_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[6]);
static void c2_g_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[18]);
static void c2_h_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[36]);
static void c2_i_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[6]);
static void c2_j_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[18]);
static void c2_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static const mxArray *c2_c_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static const mxArray *c2_d_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static void c2_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static real_T c2_mpower(SFc2_sim_double_pendulumInstanceStruct *chartInstance,
  real_T c2_a);
static void c2_eml_scalar_eg(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance);
static void c2_dimagree(SFc2_sim_double_pendulumInstanceStruct *chartInstance);
static const mxArray *c2_e_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static int32_T c2_k_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId);
static void c2_d_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static uint8_T c2_l_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_b_is_active_c2_sim_double_pendulum, const
  char_T *c2_identifier);
static uint8_T c2_m_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId);
static void init_dsm_address_info(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  if (sf_is_first_init_cond(chartInstance->S)) {
    initSimStructsc2_sim_double_pendulum(chartInstance);
    chart_debug_initialize_data_addresses(chartInstance->S);
  }

  chartInstance->c2_sfEvent = CALL_EVENT;
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c2_is_active_c2_sim_double_pendulum = 0U;
}

static void initialize_params_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  const mxArray *c2_m0 = NULL;
  const mxArray *c2_mxField;
  c2_struct_mEUZu42qRj35wbZciHGI8D c2_r0;
  c2_m0 = sf_mex_get_sfun_param(chartInstance->S, 0, 1);
  c2_mxField = sf_mex_getfield(c2_m0, "g", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.g, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "m0", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.m0, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "b0", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.b0, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "m1", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.m1, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "I1", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.I1, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "b1", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.b1, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "L1", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.L1, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "L1_cg", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.L1_cg, 1, 0, 0U,
                      0, 0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "m2", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.m2, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "I2", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.I2, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "b2", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.b2, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "L2", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.L2, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "L2_cg", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.L2_cg, 1, 0, 0U,
                      0, 0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "Kt", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.Kt, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "Ke", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.Ke, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "Ra", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.Ra, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "Vcc", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.Vcc, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "D", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.D, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "nbits", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.nbits, 1, 0, 0U,
                      0, 0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "q0", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), c2_r0.q0, 1, 0, 0U, 1,
                      0U, 2, 3, 1);
  c2_mxField = sf_mex_getfield(c2_m0, "qp0", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), c2_r0.qp0, 1, 0, 0U, 1,
                      0U, 2, 3, 1);
  c2_mxField = sf_mex_getfield(c2_m0, "K", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), c2_r0.K, 1, 0, 0U, 1, 0U,
                      2, 1, 6);
  c2_mxField = sf_mex_getfield(c2_m0, "L", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), c2_r0.L, 1, 0, 0U, 1, 0U,
                      2, 6, 3);
  c2_mxField = sf_mex_getfield(c2_m0, "Phi", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), c2_r0.Phi, 1, 0, 0U, 1,
                      0U, 2, 6, 6);
  c2_mxField = sf_mex_getfield(c2_m0, "Gamma", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), c2_r0.Gamma, 1, 0, 0U, 1,
                      0U, 2, 6, 1);
  c2_mxField = sf_mex_getfield(c2_m0, "C", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), c2_r0.C, 1, 0, 0U, 1, 0U,
                      2, 3, 6);
  c2_mxField = sf_mex_getfield(c2_m0, "ts", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.ts, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "x0", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), c2_r0.x0, 1, 0, 0U, 1,
                      0U, 2, 6, 1);
  c2_mxField = sf_mex_getfield(c2_m0, "u0", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), &c2_r0.u0, 1, 0, 0U, 0,
                      0U, 0);
  c2_mxField = sf_mex_getfield(c2_m0, "y0", "params", 0);
  sf_mex_import_named("params", sf_mex_dup(c2_mxField), c2_r0._y0, 1, 0, 0U, 1,
                      0U, 2, 3, 1);
  sf_mex_destroy(&c2_m0);
  chartInstance->c2_params = c2_r0;
}

static void enable_c2_sim_double_pendulum(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c2_update_debugger_state_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static const mxArray *get_sim_state_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  const mxArray *c2_st;
  const mxArray *c2_y = NULL;
  const mxArray *c2_b_y = NULL;
  uint8_T c2_hoistedGlobal;
  uint8_T c2_u;
  const mxArray *c2_c_y = NULL;
  c2_st = NULL;
  c2_st = NULL;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_createcellmatrix(2, 1), false);
  c2_b_y = NULL;
  sf_mex_assign(&c2_b_y, sf_mex_create("y", *chartInstance->c2_M, 0, 0U, 1U, 0U,
    2, 3, 3), false);
  sf_mex_setcell(c2_y, 0, c2_b_y);
  c2_hoistedGlobal = chartInstance->c2_is_active_c2_sim_double_pendulum;
  c2_u = c2_hoistedGlobal;
  c2_c_y = NULL;
  sf_mex_assign(&c2_c_y, sf_mex_create("y", &c2_u, 3, 0U, 0U, 0U, 0), false);
  sf_mex_setcell(c2_y, 1, c2_c_y);
  sf_mex_assign(&c2_st, c2_y, false);
  return c2_st;
}

static void set_sim_state_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance, const mxArray *c2_st)
{
  const mxArray *c2_u;
  real_T c2_dv0[9];
  int32_T c2_i0;
  chartInstance->c2_doneDoubleBufferReInit = true;
  c2_u = sf_mex_dup(c2_st);
  c2_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell("M", c2_u, 0)),
                      "M", c2_dv0);
  for (c2_i0 = 0; c2_i0 < 9; c2_i0++) {
    (*chartInstance->c2_M)[c2_i0] = c2_dv0[c2_i0];
  }

  chartInstance->c2_is_active_c2_sim_double_pendulum = c2_l_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell("is_active_c2_sim_double_pendulum",
       c2_u, 1)), "is_active_c2_sim_double_pendulum");
  sf_mex_destroy(&c2_u);
  c2_update_debugger_state_c2_sim_double_pendulum(chartInstance);
  sf_mex_destroy(&c2_st);
}

static void finalize_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void sf_gateway_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  int32_T c2_i1;
  int32_T c2_i2;
  real_T c2_b_q[3];
  c2_struct_mEUZu42qRj35wbZciHGI8D c2_b_params;
  uint32_T c2_debug_family_var_map[5];
  real_T c2_nargin = 2.0;
  real_T c2_nargout = 1.0;
  real_T c2_b_M[9];
  int32_T c2_i3;
  real_T c2_x;
  real_T c2_b_x;
  real_T c2_c_x;
  real_T c2_d_x;
  real_T c2_e_x;
  real_T c2_f_x;
  real_T c2_g_x;
  real_T c2_h_x;
  real_T c2_i_x;
  real_T c2_j_x;
  int32_T c2_i4;
  int32_T c2_i5;
  _SFD_SYMBOL_SCOPE_PUSH(0U, 0U);
  _sfTime_ = sf_get_time(chartInstance->S);
  _SFD_CC_CALL(CHART_ENTER_SFUNCTION_TAG, 1U, chartInstance->c2_sfEvent);
  for (c2_i1 = 0; c2_i1 < 3; c2_i1++) {
    _SFD_DATA_RANGE_CHECK((*chartInstance->c2_q)[c2_i1], 0U, 1U, 0U,
                          chartInstance->c2_sfEvent, false);
  }

  chartInstance->c2_sfEvent = CALL_EVENT;
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG, 1U, chartInstance->c2_sfEvent);
  for (c2_i2 = 0; c2_i2 < 3; c2_i2++) {
    c2_b_q[c2_i2] = (*chartInstance->c2_q)[c2_i2];
  }

  c2_b_params = chartInstance->c2_params;
  _SFD_SYMBOL_SCOPE_PUSH_EML(0U, 5U, 5U, c2_debug_family_names,
    c2_debug_family_var_map);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c2_nargin, 0U, c2_d_sf_marshallOut,
    c2_c_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c2_nargout, 1U, c2_d_sf_marshallOut,
    c2_c_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(c2_b_q, 2U, c2_c_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c2_b_params, 3U, c2_b_sf_marshallOut,
    c2_b_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(c2_b_M, 4U, c2_sf_marshallOut,
    c2_sf_marshallIn);
  CV_EML_FCN(0, 0);
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 3);
  for (c2_i3 = 0; c2_i3 < 9; c2_i3++) {
    c2_b_M[c2_i3] = 0.0;
  }

  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 6);
  c2_b_M[0] = (c2_b_params.m0 + c2_b_params.m1) + c2_b_params.m2;
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 7);
  c2_x = c2_b_q[1];
  c2_b_x = c2_x;
  c2_b_x = muDoubleScalarCos(c2_b_x);
  c2_b_M[4] = ((c2_b_params.m1 * c2_mpower(chartInstance, c2_b_params.L1_cg) +
                c2_b_params.m2 * (c2_mpower(chartInstance, c2_b_params.L1) +
    c2_mpower(chartInstance, c2_b_params.L2))) + c2_b_params.I1) + 2.0 *
    c2_b_params.m2 * c2_b_params.L1 * c2_b_params.L2_cg * c2_b_x;
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 10);
  c2_b_M[8] = c2_b_params.m2 * c2_mpower(chartInstance, c2_b_params.L2_cg) +
    c2_b_params.I2;
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 12);
  c2_c_x = c2_b_q[0] + c2_b_q[1];
  c2_d_x = c2_c_x;
  c2_d_x = muDoubleScalarCos(c2_d_x);
  c2_e_x = c2_b_q[0];
  c2_f_x = c2_e_x;
  c2_f_x = muDoubleScalarCos(c2_f_x);
  c2_b_M[3] = c2_b_params.m2 * c2_b_params.L2_cg * c2_d_x + (c2_b_params.m2 *
    c2_b_params.L1 + c2_b_params.m1 * c2_b_params.L1_cg) * c2_f_x;
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 14);
  c2_g_x = c2_b_q[0] + c2_b_q[1];
  c2_h_x = c2_g_x;
  c2_h_x = muDoubleScalarCos(c2_h_x);
  c2_b_M[6] = c2_b_params.m2 * c2_b_params.L2_cg * c2_h_x;
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 15);
  c2_i_x = c2_b_q[1];
  c2_j_x = c2_i_x;
  c2_j_x = muDoubleScalarCos(c2_j_x);
  c2_b_M[7] = (c2_b_params.m2 * c2_mpower(chartInstance, c2_b_params.L2_cg) +
               c2_b_params.I2) + c2_b_params.m2 * c2_b_params.L1 *
    c2_b_params.L2_cg * c2_j_x;
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 18);
  c2_b_M[1] = c2_b_M[3];
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 19);
  c2_b_M[2] = c2_b_M[6];
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 20);
  c2_b_M[5] = c2_b_M[7];
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, -20);
  _SFD_SYMBOL_SCOPE_POP();
  for (c2_i4 = 0; c2_i4 < 9; c2_i4++) {
    (*chartInstance->c2_M)[c2_i4] = c2_b_M[c2_i4];
  }

  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG, 1U, chartInstance->c2_sfEvent);
  _SFD_SYMBOL_SCOPE_POP();
  _SFD_CHECK_FOR_STATE_INCONSISTENCY(_sim_double_pendulumMachineNumber_,
    chartInstance->chartNumber, chartInstance->instanceNumber);
  for (c2_i5 = 0; c2_i5 < 9; c2_i5++) {
    _SFD_DATA_RANGE_CHECK((*chartInstance->c2_M)[c2_i5], 1U, 1U, 0U,
                          chartInstance->c2_sfEvent, false);
  }
}

static void mdl_start_c2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void initSimStructsc2_sim_double_pendulum
  (SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void init_script_number_translation(uint32_T c2_machineNumber, uint32_T
  c2_chartNumber, uint32_T c2_instanceNumber)
{
  (void)c2_machineNumber;
  (void)c2_chartNumber;
  (void)c2_instanceNumber;
}

static const mxArray *c2_sf_marshallOut(void *chartInstanceVoid, void *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  int32_T c2_i6;
  int32_T c2_i7;
  int32_T c2_i8;
  real_T c2_u[9];
  const mxArray *c2_y = NULL;
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  c2_i6 = 0;
  for (c2_i7 = 0; c2_i7 < 3; c2_i7++) {
    for (c2_i8 = 0; c2_i8 < 3; c2_i8++) {
      c2_u[c2_i8 + c2_i6] = (*(real_T (*)[9])c2_inData)[c2_i8 + c2_i6];
    }

    c2_i6 += 3;
  }

  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", c2_u, 0, 0U, 1U, 0U, 2, 3, 3), false);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, false);
  return c2_mxArrayOutData;
}

static void c2_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_b_M, const char_T *c2_identifier, real_T
  c2_y[9])
{
  emlrtMsgIdentifier c2_thisId;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_b_M), &c2_thisId, c2_y);
  sf_mex_destroy(&c2_b_M);
}

static void c2_b_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[9])
{
  real_T c2_dv1[9];
  int32_T c2_i9;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_dv1, 1, 0, 0U, 1, 0U, 2, 3, 3);
  for (c2_i9 = 0; c2_i9 < 9; c2_i9++) {
    c2_y[c2_i9] = c2_dv1[c2_i9];
  }

  sf_mex_destroy(&c2_u);
}

static void c2_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_b_M;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  real_T c2_y[9];
  int32_T c2_i10;
  int32_T c2_i11;
  int32_T c2_i12;
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)chartInstanceVoid;
  c2_b_M = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_b_M), &c2_thisId, c2_y);
  sf_mex_destroy(&c2_b_M);
  c2_i10 = 0;
  for (c2_i11 = 0; c2_i11 < 3; c2_i11++) {
    for (c2_i12 = 0; c2_i12 < 3; c2_i12++) {
      (*(real_T (*)[9])c2_outData)[c2_i12 + c2_i10] = c2_y[c2_i12 + c2_i10];
    }

    c2_i10 += 3;
  }

  sf_mex_destroy(&c2_mxArrayInData);
}

static const mxArray *c2_b_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData;
  c2_struct_mEUZu42qRj35wbZciHGI8D c2_u;
  const mxArray *c2_y = NULL;
  real_T c2_b_u;
  const mxArray *c2_b_y = NULL;
  real_T c2_c_u;
  const mxArray *c2_c_y = NULL;
  real_T c2_d_u;
  const mxArray *c2_d_y = NULL;
  real_T c2_e_u;
  const mxArray *c2_e_y = NULL;
  real_T c2_f_u;
  const mxArray *c2_f_y = NULL;
  real_T c2_g_u;
  const mxArray *c2_g_y = NULL;
  real_T c2_h_u;
  const mxArray *c2_h_y = NULL;
  real_T c2_i_u;
  const mxArray *c2_i_y = NULL;
  real_T c2_j_u;
  const mxArray *c2_j_y = NULL;
  real_T c2_k_u;
  const mxArray *c2_k_y = NULL;
  real_T c2_l_u;
  const mxArray *c2_l_y = NULL;
  real_T c2_m_u;
  const mxArray *c2_m_y = NULL;
  real_T c2_n_u;
  const mxArray *c2_n_y = NULL;
  real_T c2_o_u;
  const mxArray *c2_o_y = NULL;
  real_T c2_p_u;
  const mxArray *c2_p_y = NULL;
  real_T c2_q_u;
  const mxArray *c2_q_y = NULL;
  real_T c2_r_u;
  const mxArray *c2_r_y = NULL;
  real_T c2_s_u;
  const mxArray *c2_s_y = NULL;
  real_T c2_t_u;
  const mxArray *c2_t_y = NULL;
  int32_T c2_i13;
  real_T c2_u_u[3];
  const mxArray *c2_u_y = NULL;
  int32_T c2_i14;
  const mxArray *c2_v_y = NULL;
  int32_T c2_i15;
  real_T c2_v_u[6];
  const mxArray *c2_w_y = NULL;
  int32_T c2_i16;
  real_T c2_w_u[18];
  const mxArray *c2_x_y = NULL;
  int32_T c2_i17;
  real_T c2_x_u[36];
  const mxArray *c2_y_y = NULL;
  int32_T c2_i18;
  real_T c2_y_u[6];
  const mxArray *c2_ab_y = NULL;
  int32_T c2_i19;
  real_T c2_ab_u[18];
  const mxArray *c2_bb_y = NULL;
  real_T c2_bb_u;
  const mxArray *c2_cb_y = NULL;
  int32_T c2_i20;
  const mxArray *c2_db_y = NULL;
  real_T c2_cb_u;
  const mxArray *c2_eb_y = NULL;
  int32_T c2_i21;
  const mxArray *c2_fb_y = NULL;
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  c2_mxArrayOutData = NULL;
  c2_u = *(c2_struct_mEUZu42qRj35wbZciHGI8D *)c2_inData;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_createstruct("structure", 2, 1, 1), false);
  c2_b_u = c2_u.g;
  c2_b_y = NULL;
  sf_mex_assign(&c2_b_y, sf_mex_create("y", &c2_b_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_b_y, "g", "g", 0);
  c2_c_u = c2_u.m0;
  c2_c_y = NULL;
  sf_mex_assign(&c2_c_y, sf_mex_create("y", &c2_c_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_c_y, "m0", "m0", 0);
  c2_d_u = c2_u.b0;
  c2_d_y = NULL;
  sf_mex_assign(&c2_d_y, sf_mex_create("y", &c2_d_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_d_y, "b0", "b0", 0);
  c2_e_u = c2_u.m1;
  c2_e_y = NULL;
  sf_mex_assign(&c2_e_y, sf_mex_create("y", &c2_e_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_e_y, "m1", "m1", 0);
  c2_f_u = c2_u.I1;
  c2_f_y = NULL;
  sf_mex_assign(&c2_f_y, sf_mex_create("y", &c2_f_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_f_y, "I1", "I1", 0);
  c2_g_u = c2_u.b1;
  c2_g_y = NULL;
  sf_mex_assign(&c2_g_y, sf_mex_create("y", &c2_g_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_g_y, "b1", "b1", 0);
  c2_h_u = c2_u.L1;
  c2_h_y = NULL;
  sf_mex_assign(&c2_h_y, sf_mex_create("y", &c2_h_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_h_y, "L1", "L1", 0);
  c2_i_u = c2_u.L1_cg;
  c2_i_y = NULL;
  sf_mex_assign(&c2_i_y, sf_mex_create("y", &c2_i_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_i_y, "L1_cg", "L1_cg", 0);
  c2_j_u = c2_u.m2;
  c2_j_y = NULL;
  sf_mex_assign(&c2_j_y, sf_mex_create("y", &c2_j_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_j_y, "m2", "m2", 0);
  c2_k_u = c2_u.I2;
  c2_k_y = NULL;
  sf_mex_assign(&c2_k_y, sf_mex_create("y", &c2_k_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_k_y, "I2", "I2", 0);
  c2_l_u = c2_u.b2;
  c2_l_y = NULL;
  sf_mex_assign(&c2_l_y, sf_mex_create("y", &c2_l_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_l_y, "b2", "b2", 0);
  c2_m_u = c2_u.L2;
  c2_m_y = NULL;
  sf_mex_assign(&c2_m_y, sf_mex_create("y", &c2_m_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_m_y, "L2", "L2", 0);
  c2_n_u = c2_u.L2_cg;
  c2_n_y = NULL;
  sf_mex_assign(&c2_n_y, sf_mex_create("y", &c2_n_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_n_y, "L2_cg", "L2_cg", 0);
  c2_o_u = c2_u.Kt;
  c2_o_y = NULL;
  sf_mex_assign(&c2_o_y, sf_mex_create("y", &c2_o_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_o_y, "Kt", "Kt", 0);
  c2_p_u = c2_u.Ke;
  c2_p_y = NULL;
  sf_mex_assign(&c2_p_y, sf_mex_create("y", &c2_p_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_p_y, "Ke", "Ke", 0);
  c2_q_u = c2_u.Ra;
  c2_q_y = NULL;
  sf_mex_assign(&c2_q_y, sf_mex_create("y", &c2_q_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_q_y, "Ra", "Ra", 0);
  c2_r_u = c2_u.Vcc;
  c2_r_y = NULL;
  sf_mex_assign(&c2_r_y, sf_mex_create("y", &c2_r_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_r_y, "Vcc", "Vcc", 0);
  c2_s_u = c2_u.D;
  c2_s_y = NULL;
  sf_mex_assign(&c2_s_y, sf_mex_create("y", &c2_s_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_s_y, "D", "D", 0);
  c2_t_u = c2_u.nbits;
  c2_t_y = NULL;
  sf_mex_assign(&c2_t_y, sf_mex_create("y", &c2_t_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_t_y, "nbits", "nbits", 0);
  for (c2_i13 = 0; c2_i13 < 3; c2_i13++) {
    c2_u_u[c2_i13] = c2_u.q0[c2_i13];
  }

  c2_u_y = NULL;
  sf_mex_assign(&c2_u_y, sf_mex_create("y", c2_u_u, 0, 0U, 1U, 0U, 2, 3, 1),
                false);
  sf_mex_addfield(c2_y, c2_u_y, "q0", "q0", 0);
  for (c2_i14 = 0; c2_i14 < 3; c2_i14++) {
    c2_u_u[c2_i14] = c2_u.qp0[c2_i14];
  }

  c2_v_y = NULL;
  sf_mex_assign(&c2_v_y, sf_mex_create("y", c2_u_u, 0, 0U, 1U, 0U, 2, 3, 1),
                false);
  sf_mex_addfield(c2_y, c2_v_y, "qp0", "qp0", 0);
  for (c2_i15 = 0; c2_i15 < 6; c2_i15++) {
    c2_v_u[c2_i15] = c2_u.K[c2_i15];
  }

  c2_w_y = NULL;
  sf_mex_assign(&c2_w_y, sf_mex_create("y", c2_v_u, 0, 0U, 1U, 0U, 2, 1, 6),
                false);
  sf_mex_addfield(c2_y, c2_w_y, "K", "K", 0);
  for (c2_i16 = 0; c2_i16 < 18; c2_i16++) {
    c2_w_u[c2_i16] = c2_u.L[c2_i16];
  }

  c2_x_y = NULL;
  sf_mex_assign(&c2_x_y, sf_mex_create("y", c2_w_u, 0, 0U, 1U, 0U, 2, 6, 3),
                false);
  sf_mex_addfield(c2_y, c2_x_y, "L", "L", 0);
  for (c2_i17 = 0; c2_i17 < 36; c2_i17++) {
    c2_x_u[c2_i17] = c2_u.Phi[c2_i17];
  }

  c2_y_y = NULL;
  sf_mex_assign(&c2_y_y, sf_mex_create("y", c2_x_u, 0, 0U, 1U, 0U, 2, 6, 6),
                false);
  sf_mex_addfield(c2_y, c2_y_y, "Phi", "Phi", 0);
  for (c2_i18 = 0; c2_i18 < 6; c2_i18++) {
    c2_y_u[c2_i18] = c2_u.Gamma[c2_i18];
  }

  c2_ab_y = NULL;
  sf_mex_assign(&c2_ab_y, sf_mex_create("y", c2_y_u, 0, 0U, 1U, 0U, 2, 6, 1),
                false);
  sf_mex_addfield(c2_y, c2_ab_y, "Gamma", "Gamma", 0);
  for (c2_i19 = 0; c2_i19 < 18; c2_i19++) {
    c2_ab_u[c2_i19] = c2_u.C[c2_i19];
  }

  c2_bb_y = NULL;
  sf_mex_assign(&c2_bb_y, sf_mex_create("y", c2_ab_u, 0, 0U, 1U, 0U, 2, 3, 6),
                false);
  sf_mex_addfield(c2_y, c2_bb_y, "C", "C", 0);
  c2_bb_u = c2_u.ts;
  c2_cb_y = NULL;
  sf_mex_assign(&c2_cb_y, sf_mex_create("y", &c2_bb_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_cb_y, "ts", "ts", 0);
  for (c2_i20 = 0; c2_i20 < 6; c2_i20++) {
    c2_y_u[c2_i20] = c2_u.x0[c2_i20];
  }

  c2_db_y = NULL;
  sf_mex_assign(&c2_db_y, sf_mex_create("y", c2_y_u, 0, 0U, 1U, 0U, 2, 6, 1),
                false);
  sf_mex_addfield(c2_y, c2_db_y, "x0", "x0", 0);
  c2_cb_u = c2_u.u0;
  c2_eb_y = NULL;
  sf_mex_assign(&c2_eb_y, sf_mex_create("y", &c2_cb_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_addfield(c2_y, c2_eb_y, "u0", "u0", 0);
  for (c2_i21 = 0; c2_i21 < 3; c2_i21++) {
    c2_u_u[c2_i21] = c2_u._y0[c2_i21];
  }

  c2_fb_y = NULL;
  sf_mex_assign(&c2_fb_y, sf_mex_create("y", c2_u_u, 0, 0U, 1U, 0U, 2, 3, 1),
                false);
  sf_mex_addfield(c2_y, c2_fb_y, "y0", "y0", 0);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, false);
  return c2_mxArrayOutData;
}

static void c2_c_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  c2_struct_mEUZu42qRj35wbZciHGI8D *c2_y)
{
  emlrtMsgIdentifier c2_thisId;
  static const char * c2_fieldNames[30] = { "g", "m0", "b0", "m1", "I1", "b1",
    "L1", "L1_cg", "m2", "I2", "b2", "L2", "L2_cg", "Kt", "Ke", "Ra", "Vcc", "D",
    "nbits", "q0", "qp0", "K", "L", "Phi", "Gamma", "C", "ts", "x0", "u0", "y0"
  };

  c2_thisId.fParent = c2_parentId;
  sf_mex_check_struct(c2_parentId, c2_u, 30, c2_fieldNames, 0U, NULL);
  c2_thisId.fIdentifier = "g";
  c2_y->g = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u,
    "g", "g", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "m0";
  c2_y->m0 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "m0", "m0", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "b0";
  c2_y->b0 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "b0", "b0", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "m1";
  c2_y->m1 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "m1", "m1", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "I1";
  c2_y->I1 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "I1", "I1", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "b1";
  c2_y->b1 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "b1", "b1", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "L1";
  c2_y->L1 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "L1", "L1", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "L1_cg";
  c2_y->L1_cg = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "L1_cg", "L1_cg", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "m2";
  c2_y->m2 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "m2", "m2", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "I2";
  c2_y->I2 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "I2", "I2", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "b2";
  c2_y->b2 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "b2", "b2", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "L2";
  c2_y->L2 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "L2", "L2", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "L2_cg";
  c2_y->L2_cg = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "L2_cg", "L2_cg", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "Kt";
  c2_y->Kt = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "Kt", "Kt", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "Ke";
  c2_y->Ke = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "Ke", "Ke", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "Ra";
  c2_y->Ra = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "Ra", "Ra", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "Vcc";
  c2_y->Vcc = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "Vcc", "Vcc", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "D";
  c2_y->D = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u,
    "D", "D", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "nbits";
  c2_y->nbits = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "nbits", "nbits", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "q0";
  c2_e_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "q0",
    "q0", 0)), &c2_thisId, c2_y->q0);
  c2_thisId.fIdentifier = "qp0";
  c2_e_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "qp0",
    "qp0", 0)), &c2_thisId, c2_y->qp0);
  c2_thisId.fIdentifier = "K";
  c2_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "K", "K",
    0)), &c2_thisId, c2_y->K);
  c2_thisId.fIdentifier = "L";
  c2_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "L", "L",
    0)), &c2_thisId, c2_y->L);
  c2_thisId.fIdentifier = "Phi";
  c2_h_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "Phi",
    "Phi", 0)), &c2_thisId, c2_y->Phi);
  c2_thisId.fIdentifier = "Gamma";
  c2_i_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "Gamma",
    "Gamma", 0)), &c2_thisId, c2_y->Gamma);
  c2_thisId.fIdentifier = "C";
  c2_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "C", "C",
    0)), &c2_thisId, c2_y->C);
  c2_thisId.fIdentifier = "ts";
  c2_y->ts = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "ts", "ts", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "x0";
  c2_i_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "x0",
    "x0", 0)), &c2_thisId, c2_y->x0);
  c2_thisId.fIdentifier = "u0";
  c2_y->u0 = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c2_u, "u0", "u0", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "y0";
  c2_e_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "y0",
    "y0", 0)), &c2_thisId, c2_y->_y0);
  sf_mex_destroy(&c2_u);
}

static real_T c2_d_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  real_T c2_y;
  real_T c2_d0;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_d0, 1, 0, 0U, 0, 0U, 0);
  c2_y = c2_d0;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void c2_e_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[3])
{
  real_T c2_dv2[3];
  int32_T c2_i22;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_dv2, 1, 0, 0U, 1, 0U, 2, 3, 1);
  for (c2_i22 = 0; c2_i22 < 3; c2_i22++) {
    c2_y[c2_i22] = c2_dv2[c2_i22];
  }

  sf_mex_destroy(&c2_u);
}

static void c2_f_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[6])
{
  real_T c2_dv3[6];
  int32_T c2_i23;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_dv3, 1, 0, 0U, 1, 0U, 2, 1, 6);
  for (c2_i23 = 0; c2_i23 < 6; c2_i23++) {
    c2_y[c2_i23] = c2_dv3[c2_i23];
  }

  sf_mex_destroy(&c2_u);
}

static void c2_g_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[18])
{
  real_T c2_dv4[18];
  int32_T c2_i24;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_dv4, 1, 0, 0U, 1, 0U, 2, 6, 3);
  for (c2_i24 = 0; c2_i24 < 18; c2_i24++) {
    c2_y[c2_i24] = c2_dv4[c2_i24];
  }

  sf_mex_destroy(&c2_u);
}

static void c2_h_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[36])
{
  real_T c2_dv5[36];
  int32_T c2_i25;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_dv5, 1, 0, 0U, 1, 0U, 2, 6, 6);
  for (c2_i25 = 0; c2_i25 < 36; c2_i25++) {
    c2_y[c2_i25] = c2_dv5[c2_i25];
  }

  sf_mex_destroy(&c2_u);
}

static void c2_i_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[6])
{
  real_T c2_dv6[6];
  int32_T c2_i26;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_dv6, 1, 0, 0U, 1, 0U, 2, 6, 1);
  for (c2_i26 = 0; c2_i26 < 6; c2_i26++) {
    c2_y[c2_i26] = c2_dv6[c2_i26];
  }

  sf_mex_destroy(&c2_u);
}

static void c2_j_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[18])
{
  real_T c2_dv7[18];
  int32_T c2_i27;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_dv7, 1, 0, 0U, 1, 0U, 2, 3, 6);
  for (c2_i27 = 0; c2_i27 < 18; c2_i27++) {
    c2_y[c2_i27] = c2_dv7[c2_i27];
  }

  sf_mex_destroy(&c2_u);
}

static void c2_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_b_params;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  c2_struct_mEUZu42qRj35wbZciHGI8D c2_y;
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)chartInstanceVoid;
  c2_b_params = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_c_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_b_params), &c2_thisId,
                        &c2_y);
  sf_mex_destroy(&c2_b_params);
  *(c2_struct_mEUZu42qRj35wbZciHGI8D *)c2_outData = c2_y;
  sf_mex_destroy(&c2_mxArrayInData);
}

static const mxArray *c2_c_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  int32_T c2_i28;
  real_T c2_u[3];
  const mxArray *c2_y = NULL;
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  for (c2_i28 = 0; c2_i28 < 3; c2_i28++) {
    c2_u[c2_i28] = (*(real_T (*)[3])c2_inData)[c2_i28];
  }

  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", c2_u, 0, 0U, 1U, 0U, 1, 3), false);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, false);
  return c2_mxArrayOutData;
}

static const mxArray *c2_d_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  real_T c2_u;
  const mxArray *c2_y = NULL;
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  c2_u = *(real_T *)c2_inData;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", &c2_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, false);
  return c2_mxArrayOutData;
}

static void c2_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_nargout;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  real_T c2_y;
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)chartInstanceVoid;
  c2_nargout = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_y = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_nargout), &c2_thisId);
  sf_mex_destroy(&c2_nargout);
  *(real_T *)c2_outData = c2_y;
  sf_mex_destroy(&c2_mxArrayInData);
}

const mxArray *sf_c2_sim_double_pendulum_get_eml_resolved_functions_info(void)
{
  const mxArray *c2_nameCaptureInfo = NULL;
  c2_nameCaptureInfo = NULL;
  sf_mex_assign(&c2_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c2_nameCaptureInfo;
}

static real_T c2_mpower(SFc2_sim_double_pendulumInstanceStruct *chartInstance,
  real_T c2_a)
{
  real_T c2_b_a;
  real_T c2_c_a;
  real_T c2_ak;
  real_T c2_d_a;
  c2_b_a = c2_a;
  c2_c_a = c2_b_a;
  c2_eml_scalar_eg(chartInstance);
  c2_dimagree(chartInstance);
  c2_ak = c2_c_a;
  c2_d_a = c2_ak;
  c2_eml_scalar_eg(chartInstance);
  return c2_d_a * c2_d_a;
}

static void c2_eml_scalar_eg(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void c2_dimagree(SFc2_sim_double_pendulumInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static const mxArray *c2_e_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  int32_T c2_u;
  const mxArray *c2_y = NULL;
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  c2_u = *(int32_T *)c2_inData;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", &c2_u, 6, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, false);
  return c2_mxArrayOutData;
}

static int32_T c2_k_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  int32_T c2_y;
  int32_T c2_i29;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_i29, 1, 6, 0U, 0, 0U, 0);
  c2_y = c2_i29;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void c2_d_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_b_sfEvent;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  int32_T c2_y;
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)chartInstanceVoid;
  c2_b_sfEvent = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_y = c2_k_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_b_sfEvent),
    &c2_thisId);
  sf_mex_destroy(&c2_b_sfEvent);
  *(int32_T *)c2_outData = c2_y;
  sf_mex_destroy(&c2_mxArrayInData);
}

static uint8_T c2_l_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_b_is_active_c2_sim_double_pendulum, const
  char_T *c2_identifier)
{
  uint8_T c2_y;
  emlrtMsgIdentifier c2_thisId;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_y = c2_m_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c2_b_is_active_c2_sim_double_pendulum), &c2_thisId);
  sf_mex_destroy(&c2_b_is_active_c2_sim_double_pendulum);
  return c2_y;
}

static uint8_T c2_m_emlrt_marshallIn(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  uint8_T c2_y;
  uint8_T c2_u0;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_u0, 1, 3, 0U, 0, 0U, 0);
  c2_y = c2_u0;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void init_dsm_address_info(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void init_simulink_io_address(SFc2_sim_double_pendulumInstanceStruct
  *chartInstance)
{
  chartInstance->c2_q = (real_T (*)[3])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c2_M = (real_T (*)[9])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

/* SFunction Glue Code */
#ifdef utFree
#undef utFree
#endif

#ifdef utMalloc
#undef utMalloc
#endif

#ifdef __cplusplus

extern "C" void *utMalloc(size_t size);
extern "C" void utFree(void*);

#else

extern void *utMalloc(size_t size);
extern void utFree(void*);

#endif

void sf_c2_sim_double_pendulum_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3330317997U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3694502959U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2108181991U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1757861425U);
}

mxArray* sf_c2_sim_double_pendulum_get_post_codegen_info(void);
mxArray *sf_c2_sim_double_pendulum_get_autoinheritance_info(void)
{
  const char *autoinheritanceFields[] = { "checksum", "inputs", "parameters",
    "outputs", "locals", "postCodegenInfo" };

  mxArray *mxAutoinheritanceInfo = mxCreateStructMatrix(1, 1, sizeof
    (autoinheritanceFields)/sizeof(autoinheritanceFields[0]),
    autoinheritanceFields);

  {
    mxArray *mxChecksum = mxCreateString("B18ZGGsN4PmMJTmVLnmn1C");
    mxSetField(mxAutoinheritanceInfo,0,"checksum",mxChecksum);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,1,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(3);
      pr[1] = (double)(1);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"inputs",mxData);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,1,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(1);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(13));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"parameters",mxData);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,1,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(3);
      pr[1] = (double)(3);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"outputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"locals",mxCreateDoubleMatrix(0,0,mxREAL));
  }

  {
    mxArray* mxPostCodegenInfo = sf_c2_sim_double_pendulum_get_post_codegen_info
      ();
    mxSetField(mxAutoinheritanceInfo,0,"postCodegenInfo",mxPostCodegenInfo);
  }

  return(mxAutoinheritanceInfo);
}

mxArray *sf_c2_sim_double_pendulum_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c2_sim_double_pendulum_jit_fallback_info(void)
{
  const char *infoFields[] = { "fallbackType", "fallbackReason",
    "hiddenFallbackType", "hiddenFallbackReason", "incompatibleSymbol" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 5, infoFields);
  mxArray *fallbackType = mxCreateString("pre");
  mxArray *fallbackReason = mxCreateString("hasBreakpoints");
  mxArray *hiddenFallbackType = mxCreateString("none");
  mxArray *hiddenFallbackReason = mxCreateString("");
  mxArray *incompatibleSymbol = mxCreateString("");
  mxSetField(mxInfo, 0, infoFields[0], fallbackType);
  mxSetField(mxInfo, 0, infoFields[1], fallbackReason);
  mxSetField(mxInfo, 0, infoFields[2], hiddenFallbackType);
  mxSetField(mxInfo, 0, infoFields[3], hiddenFallbackReason);
  mxSetField(mxInfo, 0, infoFields[4], incompatibleSymbol);
  return mxInfo;
}

mxArray *sf_c2_sim_double_pendulum_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

mxArray* sf_c2_sim_double_pendulum_get_post_codegen_info(void)
{
  const char* fieldNames[] = { "exportedFunctionsUsedByThisChart",
    "exportedFunctionsChecksum" };

  mwSize dims[2] = { 1, 1 };

  mxArray* mxPostCodegenInfo = mxCreateStructArray(2, dims, sizeof(fieldNames)/
    sizeof(fieldNames[0]), fieldNames);

  {
    mxArray* mxExportedFunctionsChecksum = mxCreateString("");
    mwSize exp_dims[2] = { 0, 1 };

    mxArray* mxExportedFunctionsUsedByThisChart = mxCreateCellArray(2, exp_dims);
    mxSetField(mxPostCodegenInfo, 0, "exportedFunctionsUsedByThisChart",
               mxExportedFunctionsUsedByThisChart);
    mxSetField(mxPostCodegenInfo, 0, "exportedFunctionsChecksum",
               mxExportedFunctionsChecksum);
  }

  return mxPostCodegenInfo;
}

static const mxArray *sf_get_sim_state_info_c2_sim_double_pendulum(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  const char *infoEncStr[] = {
    "100 S1x2'type','srcId','name','auxInfo'{{M[1],M[5],T\"M\",},{M[8],M[0],T\"is_active_c2_sim_double_pendulum\",}}"
  };

  mxArray *mxVarInfo = sf_mex_decode_encoded_mx_struct_array(infoEncStr, 2, 10);
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c2_sim_double_pendulum_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc2_sim_double_pendulumInstanceStruct *chartInstance;
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
    chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)
      chartInfo->chartInstance;
    if (ssIsFirstInitCond(S) && fullDebuggerInitialization==1) {
      /* do this only if simulation is starting */
      {
        unsigned int chartAlreadyPresent;
        chartAlreadyPresent = sf_debug_initialize_chart
          (sfGlobalDebugInstanceStruct,
           _sim_double_pendulumMachineNumber_,
           2,
           1,
           1,
           0,
           3,
           0,
           0,
           0,
           0,
           0,
           &(chartInstance->chartNumber),
           &(chartInstance->instanceNumber),
           (void *)S);

        /* Each instance must initialize its own list of scripts */
        init_script_number_translation(_sim_double_pendulumMachineNumber_,
          chartInstance->chartNumber,chartInstance->instanceNumber);
        if (chartAlreadyPresent==0) {
          /* this is the first instance */
          sf_debug_set_chart_disable_implicit_casting
            (sfGlobalDebugInstanceStruct,_sim_double_pendulumMachineNumber_,
             chartInstance->chartNumber,1);
          sf_debug_set_chart_event_thresholds(sfGlobalDebugInstanceStruct,
            _sim_double_pendulumMachineNumber_,
            chartInstance->chartNumber,
            0,
            0,
            0);
          _SFD_SET_DATA_PROPS(0,1,1,0,"q");
          _SFD_SET_DATA_PROPS(1,2,0,1,"M");
          _SFD_SET_DATA_PROPS(2,10,0,0,"params");
          _SFD_STATE_INFO(0,0,2);
          _SFD_CH_SUBSTATE_COUNT(0);
          _SFD_CH_SUBSTATE_DECOMP(0);
        }

        _SFD_CV_INIT_CHART(0,0,0,0);

        {
          _SFD_CV_INIT_STATE(0,0,0,0,0,0,NULL,NULL);
        }

        _SFD_CV_INIT_TRANS(0,0,NULL,NULL,0,NULL);

        /* Initialization of MATLAB Function Model Coverage */
        _SFD_CV_INIT_EML(0,1,1,0,0,0,0,0,0,0,0,0);
        _SFD_CV_INIT_EML_FCN(0,0,"eML_blk_kernel",0,-1,749);

        {
          unsigned int dimVector[1];
          dimVector[0]= 3;
          _SFD_SET_DATA_COMPILED_PROPS(0,SF_DOUBLE,1,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c2_c_sf_marshallOut,(MexInFcnForType)NULL);
        }

        {
          unsigned int dimVector[2];
          dimVector[0]= 3;
          dimVector[1]= 3;
          _SFD_SET_DATA_COMPILED_PROPS(1,SF_DOUBLE,2,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c2_sf_marshallOut,(MexInFcnForType)
            c2_sf_marshallIn);
        }

        _SFD_SET_DATA_COMPILED_PROPS(2,SF_STRUCT,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c2_b_sf_marshallOut,(MexInFcnForType)c2_b_sf_marshallIn);
      }
    } else {
      sf_debug_reset_current_state_configuration(sfGlobalDebugInstanceStruct,
        _sim_double_pendulumMachineNumber_,chartInstance->chartNumber,
        chartInstance->instanceNumber);
    }
  }
}

static void chart_debug_initialize_data_addresses(SimStruct *S)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc2_sim_double_pendulumInstanceStruct *chartInstance;
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
    chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)
      chartInfo->chartInstance;
    if (ssIsFirstInitCond(S)) {
      /* do this only if simulation is starting and after we know the addresses of all data */
      {
        _SFD_SET_DATA_VALUE_PTR(0U, *chartInstance->c2_q);
        _SFD_SET_DATA_VALUE_PTR(1U, *chartInstance->c2_M);
        _SFD_SET_DATA_VALUE_PTR(2U, &chartInstance->c2_params);
      }
    }
  }
}

static const char* sf_get_instance_specialization(void)
{
  return "sEDIsStJUNIMrpVldVNNgpC";
}

static void sf_opaque_initialize_c2_sim_double_pendulum(void *chartInstanceVar)
{
  chart_debug_initialization(((SFc2_sim_double_pendulumInstanceStruct*)
    chartInstanceVar)->S,0);
  initialize_params_c2_sim_double_pendulum
    ((SFc2_sim_double_pendulumInstanceStruct*) chartInstanceVar);
  initialize_c2_sim_double_pendulum((SFc2_sim_double_pendulumInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c2_sim_double_pendulum(void *chartInstanceVar)
{
  enable_c2_sim_double_pendulum((SFc2_sim_double_pendulumInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c2_sim_double_pendulum(void *chartInstanceVar)
{
  disable_c2_sim_double_pendulum((SFc2_sim_double_pendulumInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c2_sim_double_pendulum(void *chartInstanceVar)
{
  sf_gateway_c2_sim_double_pendulum((SFc2_sim_double_pendulumInstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c2_sim_double_pendulum(SimStruct*
  S)
{
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
  ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
  return get_sim_state_c2_sim_double_pendulum
    ((SFc2_sim_double_pendulumInstanceStruct*)chartInfo->chartInstance);/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c2_sim_double_pendulum(SimStruct* S, const
  mxArray *st)
{
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
  ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
  set_sim_state_c2_sim_double_pendulum((SFc2_sim_double_pendulumInstanceStruct*)
    chartInfo->chartInstance, st);
}

static void sf_opaque_terminate_c2_sim_double_pendulum(void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc2_sim_double_pendulumInstanceStruct*) chartInstanceVar
      )->S;
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sim_double_pendulum_optimization_info();
    }

    finalize_c2_sim_double_pendulum((SFc2_sim_double_pendulumInstanceStruct*)
      chartInstanceVar);
    utFree(chartInstanceVar);
    if (crtInfo != NULL) {
      utFree(crtInfo);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc2_sim_double_pendulum((SFc2_sim_double_pendulumInstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c2_sim_double_pendulum(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  if (sf_machine_global_initializer_called()) {
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
    initialize_params_c2_sim_double_pendulum
      ((SFc2_sim_double_pendulumInstanceStruct*)(chartInfo->chartInstance));
  }
}

static void mdlSetWorkWidths_c2_sim_double_pendulum(SimStruct *S)
{
  /* Actual parameters from chart:
     params
   */
  const char_T *rtParamNames[] = { "params" };

  ssSetNumRunTimeParams(S,ssGetSFcnParamsCount(S));
  ssRegDlgParamAsRunTimeParam(S, 0, 0, rtParamNames[0],
    sf_get_param_data_type_id(S,0));
  ssMdlUpdateIsEmpty(S, 1);
  if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
    mxArray *infoStruct = load_sim_double_pendulum_optimization_info();
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable(sf_get_instance_specialization(),infoStruct,2);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetRTWCG(S,1);
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    ssSetNotMultipleInlinable(S,sf_rtw_info_uint_prop
      (sf_get_instance_specialization(),infoStruct,2,
       "gatewayCannotBeInlinedMultipleTimes"));
    sf_update_buildInfo(sf_get_instance_specialization(),infoStruct,2);
    if (chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,sf_get_instance_specialization(),
        infoStruct,2,1);
      sf_mark_chart_reusable_outputs(S,sf_get_instance_specialization(),
        infoStruct,2,1);
    }

    {
      unsigned int outPortIdx;
      for (outPortIdx=1; outPortIdx<=1; ++outPortIdx) {
        ssSetOutputPortOptimizeInIR(S, outPortIdx, 1U);
      }
    }

    {
      unsigned int inPortIdx;
      for (inPortIdx=0; inPortIdx < 1; ++inPortIdx) {
        ssSetInputPortOptimizeInIR(S, inPortIdx, 1U);
      }
    }

    sf_set_rtw_dwork_info(S,sf_get_instance_specialization(),infoStruct,2);
    ssSetHasSubFunctions(S,!(chartIsInlinable));
  } else {
  }

  ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
  ssSetChecksum0(S,(385129580U));
  ssSetChecksum1(S,(2550593751U));
  ssSetChecksum2(S,(3974104892U));
  ssSetChecksum3(S,(1169191266U));
  ssSetmdlDerivatives(S, NULL);
  ssSetExplicitFCSSCtrl(S,1);
  ssSupportsMultipleExecInstances(S,1);
}

static void mdlRTW_c2_sim_double_pendulum(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlStart_c2_sim_double_pendulum(SimStruct *S)
{
  SFc2_sim_double_pendulumInstanceStruct *chartInstance;
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)utMalloc(sizeof
    (ChartRunTimeInfo));
  chartInstance = (SFc2_sim_double_pendulumInstanceStruct *)utMalloc(sizeof
    (SFc2_sim_double_pendulumInstanceStruct));
  memset(chartInstance, 0, sizeof(SFc2_sim_double_pendulumInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c2_sim_double_pendulum;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c2_sim_double_pendulum;
  chartInstance->chartInfo.terminateChart =
    sf_opaque_terminate_c2_sim_double_pendulum;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c2_sim_double_pendulum;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c2_sim_double_pendulum;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c2_sim_double_pendulum;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c2_sim_double_pendulum;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c2_sim_double_pendulum;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c2_sim_double_pendulum;
  chartInstance->chartInfo.mdlStart = mdlStart_c2_sim_double_pendulum;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c2_sim_double_pendulum;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->chartInfo.callAtomicSubchartUserFcn = NULL;
  chartInstance->chartInfo.callAtomicSubchartAutoFcn = NULL;
  chartInstance->chartInfo.debugInstance = sfGlobalDebugInstanceStruct;
  chartInstance->S = S;
  crtInfo->isEnhancedMooreMachine = 0;
  crtInfo->checksum = SF_RUNTIME_INFO_CHECKSUM;
  crtInfo->fCheckOverflow = sf_runtime_overflow_check_is_on(S);
  crtInfo->instanceInfo = (&(chartInstance->chartInfo));
  crtInfo->isJITEnabled = false;
  crtInfo->compiledInfo = NULL;
  ssSetUserData(S,(void *)(crtInfo));  /* register the chart instance with simstruct */
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  chart_debug_initialization(S,1);
}

void c2_sim_double_pendulum_method_dispatcher(SimStruct *S, int_T method, void
  *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c2_sim_double_pendulum(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c2_sim_double_pendulum(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c2_sim_double_pendulum(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c2_sim_double_pendulum_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
