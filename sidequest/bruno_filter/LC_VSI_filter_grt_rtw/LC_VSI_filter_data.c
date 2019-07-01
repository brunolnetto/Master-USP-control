/*
 * LC_VSI_filter_data.c
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

#include "LC_VSI_filter.h"
#include "LC_VSI_filter_private.h"

/* Block parameters (auto storage) */
P_LC_VSI_filter_T LC_VSI_filter_P = {
  /* Variable: A
   * Referenced by: '<S3>/Gain'
   */
  { -105.26315789473685, 40000.0, -52.631578947368425, 0.0 },

  /* Variable: B
   * Referenced by: '<S3>/Gain4'
   */
  { 7368.4210526315792, 0.0 },

  /* Variable: C
   * Referenced by: '<S3>/Gain1'
   */
  { 1.0, 0.0 },

  /* Variable: C_obsv
   * Referenced by: '<S1>/MATLAB Function'
   */
  { 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

  /* Variable: C_ww
   * Referenced by: '<S1>/MATLAB Function'
   */
  { 0.007874015748031496, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.003937007874015748,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.001968503937007874, 0.0, 0.0, 0.0 },

  /* Variable: Gamma_obsv
   * Referenced by: '<S1>/MATLAB Function'
   */
  { 1.4378991007296889, 5.8126819244568875, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

  /* Variable: Kp
   * Referenced by: '<S1>/MATLAB Function'
   */
  { 0.52790454848034229, 0.023234851121591397 },

  /* Variable: L
   * Referenced by: '<S1>/MATLAB Function'
   */
  { 0.613653950423276, -0.0094310008673896828, 2.4114838555278828E-18,
    -2.1748345759293715E-15, 3.866545188643417E-17, 7.98278285570164E-14,
    1.1507375580804032E-13, -1.2576283795718824E-10 },

  /* Variable: Phi_obsv
   * Referenced by: '<S1>/MATLAB Function'
   */
  { 0.93793942767202654, 7.8057379753897393, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    -0.010270707862354919, 0.95848084339673656, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.011311152366181208, 0.045747317872957438, 0.99715890026061382,
    -28.397536663792845, 0.0, 0.0, 0.0, 0.0, 1.1436829468239351E-6,
    3.0643457884020096E-6, 0.00019981055745153995, 0.99715890026061393, 0.0, 0.0,
    0.0, 0.0, 0.0055258517207544032, 0.022612926412022897, 0.0, 0.0,
    0.92977648588825146, -693.89843419212787, 0.0, 0.0, 5.6532316030057225E-7,
    1.5217131459091451E-6, 0.0, 0.0, 0.00019529614077753117, 0.92977648588825135,
    0.0, 0.0, 0.002698949655755214, 0.011177282514292225, 0.0, 0.0, 0.0, 0.0,
    0.86392341719283516, -1329.030318366473, 2.7943206285730557E-7,
    7.5566065384554018E-7, 0.0, 0.0, 0.0, 0.0, 0.00019084314760975632,
    0.86392341719283527 },

  /* Variable: Psi
   * Referenced by: '<S3>/Gain2'
   */
  { 0.0, 0.0 },

  /* Variable: T_u
   * Referenced by: '<S1>/MATLAB Function'
   */
  1.0,

  /* Variable: T_x
   * Referenced by:
   *   '<S1>/MATLAB Function'
   *   '<S1>/Gain'
   */
  { 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.007874015748031496, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.007874015748031496, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5 },

  /* Variable: T_y
   * Referenced by: '<S1>/MATLAB Function'
   */
  0.005,

  /* Variable: Vcc
   * Referenced by:
   *   '<Root>/Gain'
   *   '<S4>/Constant'
   *   '<S4>/Constant1'
   */
  140.0,

  /* Variable: fa
   * Referenced by: '<S4>/Signal Generator'
   */
  5000.0,

  /* Variable: xhat0
   * Referenced by: '<S1>/Data Store Memory1'
   */
  { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

  /* Expression: 0
   * Referenced by: synthesized block
   */
  0.0,

  /* Expression: 1
   * Referenced by: '<S4>/Signal Generator'
   */
  1.0,

  /* Expression: 0
   * Referenced by: synthesized block
   */
  0.0,

  /* Expression: noises.('w_1').A
   * Referenced by: '<S2>/Line signal'
   */
  127.0,

  /* Expression: 0
   * Referenced by: '<S2>/Line signal'
   */
  0.0,

  /* Expression: noises.('w_1').w
   * Referenced by: '<S2>/Line signal'
   */
  376.99111843077515,

  /* Expression: noises.('w_1').phi
   * Referenced by: '<S2>/Line signal'
   */
  0.61766638958845466,

  /* Expression: noises.('w_5').A
   * Referenced by: '<S6>/Harmonic noise 5'
   */
  2.0,

  /* Expression: 0
   * Referenced by: '<S6>/Harmonic noise 5'
   */
  0.0,

  /* Expression: noises.('w_5').w
   * Referenced by: '<S6>/Harmonic noise 5'
   */
  1884.9555921538758,

  /* Expression: noises.('w_5').phi
   * Referenced by: '<S6>/Harmonic noise 5'
   */
  0.85944230564621227,

  /* Expression: noises.('w_7').A
   * Referenced by: '<S6>/Harmonic noise 7'
   */
  2.0,

  /* Expression: 0
   * Referenced by: '<S6>/Harmonic noise 7'
   */
  0.0,

  /* Expression: noises.('w_7').w
   * Referenced by: '<S6>/Harmonic noise 7'
   */
  2638.9378290154259,

  /* Expression: noises.('w_7').phi
   * Referenced by: '<S6>/Harmonic noise 7'
   */
  0.80548942452968564,

  /* Expression: 0
   * Referenced by: synthesized block
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S3>/Integrator'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S1>/Data Store Memory'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S3>/Random Number2'
   */
  0.0,

  /* Computed Parameter: RandomNumber2_StdDev
   * Referenced by: '<S3>/Random Number2'
   */
  1.0,

  /* Expression: 0
   * Referenced by: '<S3>/Random Number2'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S3>/Random Number3'
   */
  0.0,

  /* Computed Parameter: RandomNumber3_StdDev
   * Referenced by: '<S3>/Random Number3'
   */
  1.0,

  /* Expression: 0
   * Referenced by: '<S3>/Random Number3'
   */
  0.0,

  /* Expression: 0
   * Referenced by: synthesized block
   */
  0.0,

  /* Expression: 0.5
   * Referenced by: '<S4>/Constant2'
   */
  0.5,

  /* Expression: 0.5
   * Referenced by: '<S4>/Gain1'
   */
  0.5,

  /* Expression: 1
   * Referenced by: '<S4>/Gain'
   */
  1.0,

  /* Computed Parameter: ManualSwitch_CurrentSetting
   * Referenced by: '<S4>/Manual Switch'
   */
  0U
};
