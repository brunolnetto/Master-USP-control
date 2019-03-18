/* Include files */

#include <stddef.h>
#include "blas.h"
#include "sim_double_nlin_sfun.h"
#include "c13_sim_double_nlin.h"
#define CHARTINSTANCE_CHARTNUMBER      (chartInstance->chartNumber)
#define CHARTINSTANCE_INSTANCENUMBER   (chartInstance->instanceNumber)
#include "sim_double_nlin_sfun_debug_macros.h"
#define _SF_MEX_LISTEN_FOR_CTRL_C(S)   sf_mex_listen_for_ctrl_c(sfGlobalDebugInstanceStruct,S);

/* Type Definitions */

/* Named Constants */
#define CALL_EVENT                     (-1)

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;
static const char * c13_debug_family_names[4] = { "nargin", "nargout", "x", "y"
};

/* Function Declarations */
static void initialize_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance);
static void initialize_params_c13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance);
static void enable_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance);
static void disable_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance);
static void c13_update_debugger_state_c13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance);
static void set_sim_state_c13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance, const mxArray *c13_st);
static void finalize_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance);
static void sf_gateway_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance);
static void mdl_start_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance);
static void initSimStructsc13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance);
static void init_script_number_translation(uint32_T c13_machineNumber, uint32_T
  c13_chartNumber, uint32_T c13_instanceNumber);
static const mxArray *c13_sf_marshallOut(void *chartInstanceVoid, void
  *c13_inData);
static void c13_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_b_y, const char_T *c13_identifier, real_T
  c13_c_y[2]);
static void c13_b_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId,
  real_T c13_b_y[2]);
static void c13_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c13_mxArrayInData, const char_T *c13_varName, void *c13_outData);
static const mxArray *c13_b_sf_marshallOut(void *chartInstanceVoid, void
  *c13_inData);
static const mxArray *c13_c_sf_marshallOut(void *chartInstanceVoid, void
  *c13_inData);
static real_T c13_c_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId);
static void c13_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c13_mxArrayInData, const char_T *c13_varName, void *c13_outData);
static const mxArray *c13_d_sf_marshallOut(void *chartInstanceVoid, void
  *c13_inData);
static int32_T c13_d_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId);
static void c13_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c13_mxArrayInData, const char_T *c13_varName, void *c13_outData);
static uint8_T c13_e_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_b_is_active_c13_sim_double_nlin, const
  char_T *c13_identifier);
static uint8_T c13_f_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId);
static void init_dsm_address_info(SFc13_sim_double_nlinInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc13_sim_double_nlinInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance)
{
  chartInstance->c13_sfEvent = CALL_EVENT;
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c13_is_active_c13_sim_double_nlin = 0U;
}

static void initialize_params_c13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void enable_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c13_update_debugger_state_c13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static const mxArray *get_sim_state_c13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance)
{
  const mxArray *c13_st;
  const mxArray *c13_b_y = NULL;
  int32_T c13_i0;
  real_T c13_u[2];
  const mxArray *c13_c_y = NULL;
  uint8_T c13_hoistedGlobal;
  uint8_T c13_b_u;
  const mxArray *c13_d_y = NULL;
  c13_st = NULL;
  c13_st = NULL;
  c13_b_y = NULL;
  sf_mex_assign(&c13_b_y, sf_mex_createcellmatrix(2, 1), false);
  for (c13_i0 = 0; c13_i0 < 2; c13_i0++) {
    c13_u[c13_i0] = (*chartInstance->c13_y)[c13_i0];
  }

  c13_c_y = NULL;
  sf_mex_assign(&c13_c_y, sf_mex_create("y", c13_u, 0, 0U, 1U, 0U, 1, 2), false);
  sf_mex_setcell(c13_b_y, 0, c13_c_y);
  c13_hoistedGlobal = chartInstance->c13_is_active_c13_sim_double_nlin;
  c13_b_u = c13_hoistedGlobal;
  c13_d_y = NULL;
  sf_mex_assign(&c13_d_y, sf_mex_create("y", &c13_b_u, 3, 0U, 0U, 0U, 0), false);
  sf_mex_setcell(c13_b_y, 1, c13_d_y);
  sf_mex_assign(&c13_st, c13_b_y, false);
  return c13_st;
}

static void set_sim_state_c13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance, const mxArray *c13_st)
{
  const mxArray *c13_u;
  real_T c13_dv0[2];
  int32_T c13_i1;
  chartInstance->c13_doneDoubleBufferReInit = true;
  c13_u = sf_mex_dup(c13_st);
  c13_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c13_u, 0)), "y",
                       c13_dv0);
  for (c13_i1 = 0; c13_i1 < 2; c13_i1++) {
    (*chartInstance->c13_y)[c13_i1] = c13_dv0[c13_i1];
  }

  chartInstance->c13_is_active_c13_sim_double_nlin = c13_e_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c13_u, 1)),
     "is_active_c13_sim_double_nlin");
  sf_mex_destroy(&c13_u);
  c13_update_debugger_state_c13_sim_double_nlin(chartInstance);
  sf_mex_destroy(&c13_st);
}

static void finalize_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void sf_gateway_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance)
{
  int32_T c13_i2;
  int32_T c13_i3;
  real_T c13_b_x[4];
  uint32_T c13_debug_family_var_map[4];
  real_T c13_nargin = 1.0;
  real_T c13_nargout = 1.0;
  real_T c13_b_y[2];
  int32_T c13_i4;
  int32_T c13_i5;
  _SFD_SYMBOL_SCOPE_PUSH(0U, 0U);
  _sfTime_ = sf_get_time(chartInstance->S);
  _SFD_CC_CALL(CHART_ENTER_SFUNCTION_TAG, 1U, chartInstance->c13_sfEvent);
  for (c13_i2 = 0; c13_i2 < 4; c13_i2++) {
    _SFD_DATA_RANGE_CHECK((*chartInstance->c13_x)[c13_i2], 0U);
  }

  chartInstance->c13_sfEvent = CALL_EVENT;
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG, 1U, chartInstance->c13_sfEvent);
  for (c13_i3 = 0; c13_i3 < 4; c13_i3++) {
    c13_b_x[c13_i3] = (*chartInstance->c13_x)[c13_i3];
  }

  _SFD_SYMBOL_SCOPE_PUSH_EML(0U, 4U, 4U, c13_debug_family_names,
    c13_debug_family_var_map);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c13_nargin, 0U, c13_c_sf_marshallOut,
    c13_b_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c13_nargout, 1U, c13_c_sf_marshallOut,
    c13_b_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(c13_b_x, 2U, c13_b_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(c13_b_y, 3U, c13_sf_marshallOut,
    c13_sf_marshallIn);
  CV_EML_FCN(0, 0);
  _SFD_EML_CALL(0U, chartInstance->c13_sfEvent, 2);
  c13_b_y[0] = c13_b_x[0];
  c13_b_y[1] = c13_b_x[1];
  _SFD_EML_CALL(0U, chartInstance->c13_sfEvent, -2);
  _SFD_SYMBOL_SCOPE_POP();
  for (c13_i4 = 0; c13_i4 < 2; c13_i4++) {
    (*chartInstance->c13_y)[c13_i4] = c13_b_y[c13_i4];
  }

  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG, 1U, chartInstance->c13_sfEvent);
  _SFD_SYMBOL_SCOPE_POP();
  _SFD_CHECK_FOR_STATE_INCONSISTENCY(_sim_double_nlinMachineNumber_,
    chartInstance->chartNumber, chartInstance->instanceNumber);
  for (c13_i5 = 0; c13_i5 < 2; c13_i5++) {
    _SFD_DATA_RANGE_CHECK((*chartInstance->c13_y)[c13_i5], 1U);
  }
}

static void mdl_start_c13_sim_double_nlin(SFc13_sim_double_nlinInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void initSimStructsc13_sim_double_nlin
  (SFc13_sim_double_nlinInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void init_script_number_translation(uint32_T c13_machineNumber, uint32_T
  c13_chartNumber, uint32_T c13_instanceNumber)
{
  (void)c13_machineNumber;
  (void)c13_chartNumber;
  (void)c13_instanceNumber;
}

static const mxArray *c13_sf_marshallOut(void *chartInstanceVoid, void
  *c13_inData)
{
  const mxArray *c13_mxArrayOutData = NULL;
  int32_T c13_i6;
  real_T c13_b_inData[2];
  int32_T c13_i7;
  real_T c13_u[2];
  const mxArray *c13_b_y = NULL;
  SFc13_sim_double_nlinInstanceStruct *chartInstance;
  chartInstance = (SFc13_sim_double_nlinInstanceStruct *)chartInstanceVoid;
  c13_mxArrayOutData = NULL;
  for (c13_i6 = 0; c13_i6 < 2; c13_i6++) {
    c13_b_inData[c13_i6] = (*(real_T (*)[2])c13_inData)[c13_i6];
  }

  for (c13_i7 = 0; c13_i7 < 2; c13_i7++) {
    c13_u[c13_i7] = c13_b_inData[c13_i7];
  }

  c13_b_y = NULL;
  sf_mex_assign(&c13_b_y, sf_mex_create("y", c13_u, 0, 0U, 1U, 0U, 1, 2), false);
  sf_mex_assign(&c13_mxArrayOutData, c13_b_y, false);
  return c13_mxArrayOutData;
}

static void c13_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_b_y, const char_T *c13_identifier, real_T
  c13_c_y[2])
{
  emlrtMsgIdentifier c13_thisId;
  c13_thisId.fIdentifier = c13_identifier;
  c13_thisId.fParent = NULL;
  c13_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c13_b_y), &c13_thisId,
    c13_c_y);
  sf_mex_destroy(&c13_b_y);
}

static void c13_b_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId,
  real_T c13_b_y[2])
{
  real_T c13_dv1[2];
  int32_T c13_i8;
  (void)chartInstance;
  sf_mex_import(c13_parentId, sf_mex_dup(c13_u), c13_dv1, 1, 0, 0U, 1, 0U, 1, 2);
  for (c13_i8 = 0; c13_i8 < 2; c13_i8++) {
    c13_b_y[c13_i8] = c13_dv1[c13_i8];
  }

  sf_mex_destroy(&c13_u);
}

static void c13_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c13_mxArrayInData, const char_T *c13_varName, void *c13_outData)
{
  const mxArray *c13_b_y;
  const char_T *c13_identifier;
  emlrtMsgIdentifier c13_thisId;
  real_T c13_c_y[2];
  int32_T c13_i9;
  SFc13_sim_double_nlinInstanceStruct *chartInstance;
  chartInstance = (SFc13_sim_double_nlinInstanceStruct *)chartInstanceVoid;
  c13_b_y = sf_mex_dup(c13_mxArrayInData);
  c13_identifier = c13_varName;
  c13_thisId.fIdentifier = c13_identifier;
  c13_thisId.fParent = NULL;
  c13_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c13_b_y), &c13_thisId,
    c13_c_y);
  sf_mex_destroy(&c13_b_y);
  for (c13_i9 = 0; c13_i9 < 2; c13_i9++) {
    (*(real_T (*)[2])c13_outData)[c13_i9] = c13_c_y[c13_i9];
  }

  sf_mex_destroy(&c13_mxArrayInData);
}

static const mxArray *c13_b_sf_marshallOut(void *chartInstanceVoid, void
  *c13_inData)
{
  const mxArray *c13_mxArrayOutData = NULL;
  int32_T c13_i10;
  real_T c13_b_inData[4];
  int32_T c13_i11;
  real_T c13_u[4];
  const mxArray *c13_b_y = NULL;
  SFc13_sim_double_nlinInstanceStruct *chartInstance;
  chartInstance = (SFc13_sim_double_nlinInstanceStruct *)chartInstanceVoid;
  c13_mxArrayOutData = NULL;
  for (c13_i10 = 0; c13_i10 < 4; c13_i10++) {
    c13_b_inData[c13_i10] = (*(real_T (*)[4])c13_inData)[c13_i10];
  }

  for (c13_i11 = 0; c13_i11 < 4; c13_i11++) {
    c13_u[c13_i11] = c13_b_inData[c13_i11];
  }

  c13_b_y = NULL;
  sf_mex_assign(&c13_b_y, sf_mex_create("y", c13_u, 0, 0U, 1U, 0U, 1, 4), false);
  sf_mex_assign(&c13_mxArrayOutData, c13_b_y, false);
  return c13_mxArrayOutData;
}

static const mxArray *c13_c_sf_marshallOut(void *chartInstanceVoid, void
  *c13_inData)
{
  const mxArray *c13_mxArrayOutData = NULL;
  real_T c13_u;
  const mxArray *c13_b_y = NULL;
  SFc13_sim_double_nlinInstanceStruct *chartInstance;
  chartInstance = (SFc13_sim_double_nlinInstanceStruct *)chartInstanceVoid;
  c13_mxArrayOutData = NULL;
  c13_u = *(real_T *)c13_inData;
  c13_b_y = NULL;
  sf_mex_assign(&c13_b_y, sf_mex_create("y", &c13_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c13_mxArrayOutData, c13_b_y, false);
  return c13_mxArrayOutData;
}

static real_T c13_c_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId)
{
  real_T c13_b_y;
  real_T c13_d0;
  (void)chartInstance;
  sf_mex_import(c13_parentId, sf_mex_dup(c13_u), &c13_d0, 1, 0, 0U, 0, 0U, 0);
  c13_b_y = c13_d0;
  sf_mex_destroy(&c13_u);
  return c13_b_y;
}

static void c13_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c13_mxArrayInData, const char_T *c13_varName, void *c13_outData)
{
  const mxArray *c13_nargout;
  const char_T *c13_identifier;
  emlrtMsgIdentifier c13_thisId;
  real_T c13_b_y;
  SFc13_sim_double_nlinInstanceStruct *chartInstance;
  chartInstance = (SFc13_sim_double_nlinInstanceStruct *)chartInstanceVoid;
  c13_nargout = sf_mex_dup(c13_mxArrayInData);
  c13_identifier = c13_varName;
  c13_thisId.fIdentifier = c13_identifier;
  c13_thisId.fParent = NULL;
  c13_b_y = c13_c_emlrt_marshallIn(chartInstance, sf_mex_dup(c13_nargout),
    &c13_thisId);
  sf_mex_destroy(&c13_nargout);
  *(real_T *)c13_outData = c13_b_y;
  sf_mex_destroy(&c13_mxArrayInData);
}

const mxArray *sf_c13_sim_double_nlin_get_eml_resolved_functions_info(void)
{
  const mxArray *c13_nameCaptureInfo = NULL;
  c13_nameCaptureInfo = NULL;
  sf_mex_assign(&c13_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c13_nameCaptureInfo;
}

static const mxArray *c13_d_sf_marshallOut(void *chartInstanceVoid, void
  *c13_inData)
{
  const mxArray *c13_mxArrayOutData = NULL;
  int32_T c13_u;
  const mxArray *c13_b_y = NULL;
  SFc13_sim_double_nlinInstanceStruct *chartInstance;
  chartInstance = (SFc13_sim_double_nlinInstanceStruct *)chartInstanceVoid;
  c13_mxArrayOutData = NULL;
  c13_u = *(int32_T *)c13_inData;
  c13_b_y = NULL;
  sf_mex_assign(&c13_b_y, sf_mex_create("y", &c13_u, 6, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c13_mxArrayOutData, c13_b_y, false);
  return c13_mxArrayOutData;
}

static int32_T c13_d_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId)
{
  int32_T c13_b_y;
  int32_T c13_i12;
  (void)chartInstance;
  sf_mex_import(c13_parentId, sf_mex_dup(c13_u), &c13_i12, 1, 6, 0U, 0, 0U, 0);
  c13_b_y = c13_i12;
  sf_mex_destroy(&c13_u);
  return c13_b_y;
}

static void c13_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c13_mxArrayInData, const char_T *c13_varName, void *c13_outData)
{
  const mxArray *c13_b_sfEvent;
  const char_T *c13_identifier;
  emlrtMsgIdentifier c13_thisId;
  int32_T c13_b_y;
  SFc13_sim_double_nlinInstanceStruct *chartInstance;
  chartInstance = (SFc13_sim_double_nlinInstanceStruct *)chartInstanceVoid;
  c13_b_sfEvent = sf_mex_dup(c13_mxArrayInData);
  c13_identifier = c13_varName;
  c13_thisId.fIdentifier = c13_identifier;
  c13_thisId.fParent = NULL;
  c13_b_y = c13_d_emlrt_marshallIn(chartInstance, sf_mex_dup(c13_b_sfEvent),
    &c13_thisId);
  sf_mex_destroy(&c13_b_sfEvent);
  *(int32_T *)c13_outData = c13_b_y;
  sf_mex_destroy(&c13_mxArrayInData);
}

static uint8_T c13_e_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_b_is_active_c13_sim_double_nlin, const
  char_T *c13_identifier)
{
  uint8_T c13_b_y;
  emlrtMsgIdentifier c13_thisId;
  c13_thisId.fIdentifier = c13_identifier;
  c13_thisId.fParent = NULL;
  c13_b_y = c13_f_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c13_b_is_active_c13_sim_double_nlin), &c13_thisId);
  sf_mex_destroy(&c13_b_is_active_c13_sim_double_nlin);
  return c13_b_y;
}

static uint8_T c13_f_emlrt_marshallIn(SFc13_sim_double_nlinInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId)
{
  uint8_T c13_b_y;
  uint8_T c13_u0;
  (void)chartInstance;
  sf_mex_import(c13_parentId, sf_mex_dup(c13_u), &c13_u0, 1, 3, 0U, 0, 0U, 0);
  c13_b_y = c13_u0;
  sf_mex_destroy(&c13_u);
  return c13_b_y;
}

static void init_dsm_address_info(SFc13_sim_double_nlinInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void init_simulink_io_address(SFc13_sim_double_nlinInstanceStruct
  *chartInstance)
{
  chartInstance->c13_x = (real_T (*)[4])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c13_y = (real_T (*)[2])ssGetOutputPortSignal_wrapper
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

void sf_c13_sim_double_nlin_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(140784991U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1230251614U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3766473366U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2519255920U);
}

mxArray* sf_c13_sim_double_nlin_get_post_codegen_info(void);
mxArray *sf_c13_sim_double_nlin_get_autoinheritance_info(void)
{
  const char *autoinheritanceFields[] = { "checksum", "inputs", "parameters",
    "outputs", "locals", "postCodegenInfo" };

  mxArray *mxAutoinheritanceInfo = mxCreateStructMatrix(1, 1, sizeof
    (autoinheritanceFields)/sizeof(autoinheritanceFields[0]),
    autoinheritanceFields);

  {
    mxArray *mxChecksum = mxCreateString("8lswyBTpWpewEwkJqFEfGC");
    mxSetField(mxAutoinheritanceInfo,0,"checksum",mxChecksum);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,1,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(4);
      pr[1] = (double)(1);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"inputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"parameters",mxCreateDoubleMatrix(0,0,
                mxREAL));
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,1,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(2);
      pr[1] = (double)(1);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"outputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"locals",mxCreateDoubleMatrix(0,0,mxREAL));
  }

  {
    mxArray* mxPostCodegenInfo = sf_c13_sim_double_nlin_get_post_codegen_info();
    mxSetField(mxAutoinheritanceInfo,0,"postCodegenInfo",mxPostCodegenInfo);
  }

  return(mxAutoinheritanceInfo);
}

mxArray *sf_c13_sim_double_nlin_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c13_sim_double_nlin_jit_fallback_info(void)
{
  const char *infoFields[] = { "fallbackType", "fallbackReason",
    "incompatibleSymbol", };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 3, infoFields);
  mxArray *fallbackReason = mxCreateString("feature_off");
  mxArray *incompatibleSymbol = mxCreateString("");
  mxArray *fallbackType = mxCreateString("early");
  mxSetField(mxInfo, 0, infoFields[0], fallbackType);
  mxSetField(mxInfo, 0, infoFields[1], fallbackReason);
  mxSetField(mxInfo, 0, infoFields[2], incompatibleSymbol);
  return mxInfo;
}

mxArray *sf_c13_sim_double_nlin_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

mxArray* sf_c13_sim_double_nlin_get_post_codegen_info(void)
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

static const mxArray *sf_get_sim_state_info_c13_sim_double_nlin(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  const char *infoEncStr[] = {
    "100 S1x2'type','srcId','name','auxInfo'{{M[1],M[5],T\"y\",},{M[8],M[0],T\"is_active_c13_sim_double_nlin\",}}"
  };

  mxArray *mxVarInfo = sf_mex_decode_encoded_mx_struct_array(infoEncStr, 2, 10);
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c13_sim_double_nlin_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc13_sim_double_nlinInstanceStruct *chartInstance;
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
    chartInstance = (SFc13_sim_double_nlinInstanceStruct *)
      chartInfo->chartInstance;
    if (ssIsFirstInitCond(S) && fullDebuggerInitialization==1) {
      /* do this only if simulation is starting */
      {
        unsigned int chartAlreadyPresent;
        chartAlreadyPresent = sf_debug_initialize_chart
          (sfGlobalDebugInstanceStruct,
           _sim_double_nlinMachineNumber_,
           13,
           1,
           1,
           0,
           2,
           0,
           0,
           0,
           0,
           0,
           &(chartInstance->chartNumber),
           &(chartInstance->instanceNumber),
           (void *)S);

        /* Each instance must initialize its own list of scripts */
        init_script_number_translation(_sim_double_nlinMachineNumber_,
          chartInstance->chartNumber,chartInstance->instanceNumber);
        if (chartAlreadyPresent==0) {
          /* this is the first instance */
          sf_debug_set_chart_disable_implicit_casting
            (sfGlobalDebugInstanceStruct,_sim_double_nlinMachineNumber_,
             chartInstance->chartNumber,1);
          sf_debug_set_chart_event_thresholds(sfGlobalDebugInstanceStruct,
            _sim_double_nlinMachineNumber_,
            chartInstance->chartNumber,
            0,
            0,
            0);
          _SFD_SET_DATA_PROPS(0,1,1,0,"x");
          _SFD_SET_DATA_PROPS(1,2,0,1,"y");
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
        _SFD_CV_INIT_EML(0,1,1,0,0,0,0,0,0,0,0);
        _SFD_CV_INIT_EML_FCN(0,0,"eML_blk_kernel",0,-1,55);

        {
          unsigned int dimVector[1];
          dimVector[0]= 4;
          _SFD_SET_DATA_COMPILED_PROPS(0,SF_DOUBLE,1,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c13_b_sf_marshallOut,(MexInFcnForType)NULL);
        }

        {
          unsigned int dimVector[1];
          dimVector[0]= 2;
          _SFD_SET_DATA_COMPILED_PROPS(1,SF_DOUBLE,1,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c13_sf_marshallOut,(MexInFcnForType)
            c13_sf_marshallIn);
        }

        _SFD_SET_DATA_VALUE_PTR(0U, *chartInstance->c13_x);
        _SFD_SET_DATA_VALUE_PTR(1U, *chartInstance->c13_y);
      }
    } else {
      sf_debug_reset_current_state_configuration(sfGlobalDebugInstanceStruct,
        _sim_double_nlinMachineNumber_,chartInstance->chartNumber,
        chartInstance->instanceNumber);
    }
  }
}

static const char* sf_get_instance_specialization(void)
{
  return "0ZwVQStRM7mcVWPw4afXMC";
}

static void sf_opaque_initialize_c13_sim_double_nlin(void *chartInstanceVar)
{
  chart_debug_initialization(((SFc13_sim_double_nlinInstanceStruct*)
    chartInstanceVar)->S,0);
  initialize_params_c13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
    chartInstanceVar);
  initialize_c13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c13_sim_double_nlin(void *chartInstanceVar)
{
  enable_c13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c13_sim_double_nlin(void *chartInstanceVar)
{
  disable_c13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c13_sim_double_nlin(void *chartInstanceVar)
{
  sf_gateway_c13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c13_sim_double_nlin(SimStruct* S)
{
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
  ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
  return get_sim_state_c13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
    chartInfo->chartInstance);         /* raw sim ctx */
}

static void sf_opaque_set_sim_state_c13_sim_double_nlin(SimStruct* S, const
  mxArray *st)
{
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
  ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
  set_sim_state_c13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
    chartInfo->chartInstance, st);
}

static void sf_opaque_terminate_c13_sim_double_nlin(void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc13_sim_double_nlinInstanceStruct*) chartInstanceVar)->S;
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sim_double_nlin_optimization_info();
    }

    finalize_c13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
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
  initSimStructsc13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c13_sim_double_nlin(SimStruct *S)
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
    initialize_params_c13_sim_double_nlin((SFc13_sim_double_nlinInstanceStruct*)
      (chartInfo->chartInstance));
  }
}

static void mdlSetWorkWidths_c13_sim_double_nlin(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
    mxArray *infoStruct = load_sim_double_nlin_optimization_info();
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable(sf_get_instance_specialization(),infoStruct,
      13);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetRTWCG(S,sf_rtw_info_uint_prop(sf_get_instance_specialization(),
                infoStruct,13,"RTWCG"));
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    ssSetNotMultipleInlinable(S,sf_rtw_info_uint_prop
      (sf_get_instance_specialization(),infoStruct,13,
       "gatewayCannotBeInlinedMultipleTimes"));
    sf_update_buildInfo(sf_get_instance_specialization(),infoStruct,13);
    if (chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,sf_get_instance_specialization(),
        infoStruct,13,1);
      sf_mark_chart_reusable_outputs(S,sf_get_instance_specialization(),
        infoStruct,13,1);
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

    sf_set_rtw_dwork_info(S,sf_get_instance_specialization(),infoStruct,13);
    ssSetHasSubFunctions(S,!(chartIsInlinable));
  } else {
  }

  ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
  ssSetChecksum0(S,(2675525302U));
  ssSetChecksum1(S,(933434844U));
  ssSetChecksum2(S,(3293887364U));
  ssSetChecksum3(S,(2367894956U));
  ssSetmdlDerivatives(S, NULL);
  ssSetExplicitFCSSCtrl(S,1);
  ssSupportsMultipleExecInstances(S,1);
}

static void mdlRTW_c13_sim_double_nlin(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlStart_c13_sim_double_nlin(SimStruct *S)
{
  SFc13_sim_double_nlinInstanceStruct *chartInstance;
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)utMalloc(sizeof
    (ChartRunTimeInfo));
  chartInstance = (SFc13_sim_double_nlinInstanceStruct *)utMalloc(sizeof
    (SFc13_sim_double_nlinInstanceStruct));
  memset(chartInstance, 0, sizeof(SFc13_sim_double_nlinInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c13_sim_double_nlin;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c13_sim_double_nlin;
  chartInstance->chartInfo.terminateChart =
    sf_opaque_terminate_c13_sim_double_nlin;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c13_sim_double_nlin;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c13_sim_double_nlin;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c13_sim_double_nlin;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c13_sim_double_nlin;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c13_sim_double_nlin;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c13_sim_double_nlin;
  chartInstance->chartInfo.mdlStart = mdlStart_c13_sim_double_nlin;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c13_sim_double_nlin;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->chartInfo.callAtomicSubchartUserFcn = NULL;
  chartInstance->chartInfo.callAtomicSubchartAutoFcn = NULL;
  chartInstance->chartInfo.debugInstance = sfGlobalDebugInstanceStruct;
  chartInstance->S = S;
  crtInfo->checksum = SF_RUNTIME_INFO_CHECKSUM;
  crtInfo->instanceInfo = (&(chartInstance->chartInfo));
  crtInfo->isJITEnabled = false;
  crtInfo->compiledInfo = NULL;
  ssSetUserData(S,(void *)(crtInfo));  /* register the chart instance with simstruct */
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  sf_opaque_init_subchart_simstructs(chartInstance->chartInfo.chartInstance);
  chart_debug_initialization(S,1);
}

void c13_sim_double_nlin_method_dispatcher(SimStruct *S, int_T method, void
  *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c13_sim_double_nlin(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c13_sim_double_nlin(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c13_sim_double_nlin(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c13_sim_double_nlin_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
