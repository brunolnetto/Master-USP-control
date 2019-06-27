/*
 * LC_VSI_filter.c
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

/* Block signals (auto storage) */
B_LC_VSI_filter_T LC_VSI_filter_B;

/* Continuous states */
X_LC_VSI_filter_T LC_VSI_filter_X;

/* Block states (auto storage) */
DW_LC_VSI_filter_T LC_VSI_filter_DW;

/* Real-time model */
RT_MODEL_LC_VSI_filter_T LC_VSI_filter_M_;
RT_MODEL_LC_VSI_filter_T *const LC_VSI_filter_M = &LC_VSI_filter_M_;

/*
 * This function updates continuous states using the ODE5 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE5_A[6] = {
    1.0/5.0, 3.0/10.0, 4.0/5.0, 8.0/9.0, 1.0, 1.0
  };

  static const real_T rt_ODE5_B[6][6] = {
    { 1.0/5.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

    { 3.0/40.0, 9.0/40.0, 0.0, 0.0, 0.0, 0.0 },

    { 44.0/45.0, -56.0/15.0, 32.0/9.0, 0.0, 0.0, 0.0 },

    { 19372.0/6561.0, -25360.0/2187.0, 64448.0/6561.0, -212.0/729.0, 0.0, 0.0 },

    { 9017.0/3168.0, -355.0/33.0, 46732.0/5247.0, 49.0/176.0, -5103.0/18656.0,
      0.0 },

    { 35.0/384.0, 0.0, 500.0/1113.0, 125.0/192.0, -2187.0/6784.0, 11.0/84.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE5_IntgData *id = (ODE5_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T *f3 = id->f[3];
  real_T *f4 = id->f[4];
  real_T *f5 = id->f[5];
  real_T hB[6];
  int_T i;
  int_T nXc = 2;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  LC_VSI_filter_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE5_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE5_A[0]);
  rtsiSetdX(si, f1);
  LC_VSI_filter_step0();
  LC_VSI_filter_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE5_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE5_A[1]);
  rtsiSetdX(si, f2);
  LC_VSI_filter_step0();
  LC_VSI_filter_derivatives();

  /* f(:,4) = feval(odefile, t + hA(3), y + f*hB(:,3), args(:)(*)); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE5_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, t + h*rt_ODE5_A[2]);
  rtsiSetdX(si, f3);
  LC_VSI_filter_step0();
  LC_VSI_filter_derivatives();

  /* f(:,5) = feval(odefile, t + hA(4), y + f*hB(:,4), args(:)(*)); */
  for (i = 0; i <= 3; i++) {
    hB[i] = h * rt_ODE5_B[3][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2] +
                   f3[i]*hB[3]);
  }

  rtsiSetT(si, t + h*rt_ODE5_A[3]);
  rtsiSetdX(si, f4);
  LC_VSI_filter_step0();
  LC_VSI_filter_derivatives();

  /* f(:,6) = feval(odefile, t + hA(5), y + f*hB(:,5), args(:)(*)); */
  for (i = 0; i <= 4; i++) {
    hB[i] = h * rt_ODE5_B[4][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2] +
                   f3[i]*hB[3] + f4[i]*hB[4]);
  }

  rtsiSetT(si, tnew);
  rtsiSetdX(si, f5);
  LC_VSI_filter_step0();
  LC_VSI_filter_derivatives();

  /* tnew = t + hA(6);
     ynew = y + f*hB(:,6); */
  for (i = 0; i <= 5; i++) {
    hB[i] = h * rt_ODE5_B[5][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2] +
                   f3[i]*hB[3] + f4[i]*hB[4] + f5[i]*hB[5]);
  }

  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

real_T rt_urand_Upu32_Yd_f_pw_snf(uint32_T *u)
{
  uint32_T lo;
  uint32_T hi;

  /* Uniform random number generator (random number between 0 and 1)

     #define IA      16807                      magic multiplier = 7^5
     #define IM      2147483647                 modulus = 2^31-1
     #define IQ      127773                     IM div IA
     #define IR      2836                       IM modulo IA
     #define S       4.656612875245797e-10      reciprocal of 2^31-1
     test = IA * (seed % IQ) - IR * (seed/IQ)
     seed = test < 0 ? (test + IM) : test
     return (seed*S)
   */
  lo = *u % 127773U * 16807U;
  hi = *u / 127773U * 2836U;
  if (lo < hi) {
    *u = 2147483647U - (hi - lo);
  } else {
    *u = lo - hi;
  }

  return (real_T)*u * 4.6566128752457969E-10;
}

real_T rt_nrand_Upu32_Yd_f_pw_snf(uint32_T *u)
{
  real_T y;
  real_T sr;
  real_T si;

  /* Normal (Gaussian) random number generator */
  do {
    sr = 2.0 * rt_urand_Upu32_Yd_f_pw_snf(u) - 1.0;
    si = 2.0 * rt_urand_Upu32_Yd_f_pw_snf(u) - 1.0;
    si = sr * sr + si * si;
  } while (si > 1.0);

  y = sqrt(-2.0 * log(si) / si) * sr;
  return y;
}

/* Model step function for TID0 */
void LC_VSI_filter_step0(void)         /* Sample time: [0.0s, 0.0s] */
{
  real_T rtb_ManualSwitch;
  real_T Linesignal_tmp;
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    /* set solver stop time */
    if (!(LC_VSI_filter_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&LC_VSI_filter_M->solverInfo,
                            ((LC_VSI_filter_M->Timing.clockTickH0 + 1) *
        LC_VSI_filter_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&LC_VSI_filter_M->solverInfo,
                            ((LC_VSI_filter_M->Timing.clockTick0 + 1) *
        LC_VSI_filter_M->Timing.stepSize0 + LC_VSI_filter_M->Timing.clockTickH0 *
        LC_VSI_filter_M->Timing.stepSize0 * 4294967296.0));
    }

    /* Update the flag to indicate when data transfers from
     *  Sample time: [0.0s, 0.0s] to Sample time: [0.0002s, 0.0s]  */
    (LC_VSI_filter_M->Timing.RateInteraction.TID0_2)++;
    if ((LC_VSI_filter_M->Timing.RateInteraction.TID0_2) > 19) {
      LC_VSI_filter_M->Timing.RateInteraction.TID0_2 = 0;
    }

    /* Update the flag to indicate when data transfers from
     *  Sample time: [1.0E-5s, 0.0s] to Sample time: [0.0002s, 0.0s]  */
    (LC_VSI_filter_M->Timing.RateInteraction.TID1_2)++;
    if ((LC_VSI_filter_M->Timing.RateInteraction.TID1_2) > 19) {
      LC_VSI_filter_M->Timing.RateInteraction.TID1_2 = 0;
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(LC_VSI_filter_M)) {
    LC_VSI_filter_M->Timing.t[0] = rtsiGetT(&LC_VSI_filter_M->solverInfo);
  }

  /* Clock: '<Root>/Clock' */
  LC_VSI_filter_B.Clock = LC_VSI_filter_M->Timing.t[0];

  /* RateTransition: '<Root>/TmpRTBAtTo Workspace2Inport1' incorporates:
   *  Constant: '<S4>/Constant'
   *  Constant: '<S4>/Constant1'
   */
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    if (LC_VSI_filter_M->Timing.RateInteraction.TID1_2 == 1) {
      LC_VSI_filter_B.TmpRTBAtToWorkspace2Inport1 = LC_VSI_filter_B.Clock;

      /* RateTransition: '<S4>/TmpRTBAtRelational OperatorInport1' */
      LC_VSI_filter_B.TmpRTBAtRelationalOperatorInpor =
        LC_VSI_filter_DW.TmpRTBAtRelationalOperatorInpor;
    }

    LC_VSI_filter_B.Constant = 2.0 * LC_VSI_filter_P.Vcc;
    LC_VSI_filter_B.Constant1 = LC_VSI_filter_P.Vcc;

    /* RateTransition: '<S4>/TmpRTBAtManual SwitchInport2' incorporates:
     *  Constant: '<S4>/Constant'
     *  Constant: '<S4>/Constant1'
     */
    if (LC_VSI_filter_M->Timing.RateInteraction.TID1_2 == 1) {
      LC_VSI_filter_B.TmpRTBAtManualSwitchInport2 =
        LC_VSI_filter_DW.TmpRTBAtManualSwitchInport2_Buf;
    }

    /* End of RateTransition: '<S4>/TmpRTBAtManual SwitchInport2' */
  }

  /* End of RateTransition: '<Root>/TmpRTBAtTo Workspace2Inport1' */

  /* SignalGenerator: '<S4>/Signal Generator' */
  rtb_ManualSwitch = LC_VSI_filter_P.fa * LC_VSI_filter_M->Timing.t[0];

  /* ManualSwitch: '<S4>/Manual Switch' incorporates:
   *  Product: '<S4>/Product1'
   *  RelationalOperator: '<S4>/Relational Operator'
   *  SignalGenerator: '<S4>/Signal Generator'
   *  Sum: '<S4>/Add3'
   */
  if (LC_VSI_filter_P.ManualSwitch_CurrentSetting == 1) {
    rtb_ManualSwitch = (real_T)(LC_VSI_filter_B.TmpRTBAtRelationalOperatorInpor >=
      (1.0 - (rtb_ManualSwitch - floor(rtb_ManualSwitch)) * 2.0) *
      LC_VSI_filter_P.SignalGenerator_Amplitude) * LC_VSI_filter_B.Constant -
      LC_VSI_filter_B.Constant1;
  } else {
    rtb_ManualSwitch = LC_VSI_filter_B.TmpRTBAtManualSwitchInport2;
  }

  /* End of ManualSwitch: '<S4>/Manual Switch' */

  /* Sin: '<S2>/Line signal' incorporates:
   *  Sin: '<S6>/Harmonic noise 5'
   *  Sin: '<S6>/Harmonic noise 7'
   */
  Linesignal_tmp = LC_VSI_filter_M->Timing.t[0];
  LC_VSI_filter_B.Linesignal = sin(LC_VSI_filter_P.Linesignal_Freq *
    Linesignal_tmp + LC_VSI_filter_P.Linesignal_Phase) *
    LC_VSI_filter_P.Linesignal_Amp + LC_VSI_filter_P.Linesignal_Bias;

  /* Sum: '<S6>/Sum4' incorporates:
   *  Sin: '<S6>/Harmonic noise 5'
   *  Sin: '<S6>/Harmonic noise 7'
   */
  LC_VSI_filter_B.Sum4 = (sin(LC_VSI_filter_P.Harmonicnoise5_Freq *
    Linesignal_tmp + LC_VSI_filter_P.Harmonicnoise5_Phase) *
    LC_VSI_filter_P.Harmonicnoise5_Amp + LC_VSI_filter_P.Harmonicnoise5_Bias) +
    (sin(LC_VSI_filter_P.Harmonicnoise7_Freq * Linesignal_tmp +
         LC_VSI_filter_P.Harmonicnoise7_Phase) *
     LC_VSI_filter_P.Harmonicnoise7_Amp + LC_VSI_filter_P.Harmonicnoise7_Bias);

  /* Sum: '<Root>/Sum' incorporates:
   *  Gain: '<Root>/Gain'
   *  Sum: '<S2>/Sum'
   */
  LC_VSI_filter_B.Sum = rtb_ManualSwitch - 1.0 / LC_VSI_filter_P.Vcc *
    (LC_VSI_filter_B.Linesignal + LC_VSI_filter_B.Sum4);
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    /* RateTransition: '<S3>/TmpRTBAtSum3Inport1' */
    if (LC_VSI_filter_M->Timing.RateInteraction.TID1_2 == 1) {
      LC_VSI_filter_B.TmpRTBAtSum3Inport1 =
        LC_VSI_filter_DW.TmpRTBAtSum3Inport1_Buffer0;
    }

    /* End of RateTransition: '<S3>/TmpRTBAtSum3Inport1' */
  }

  /* Integrator: '<S3>/Integrator' */
  LC_VSI_filter_B.Integrator[0] = LC_VSI_filter_X.Integrator_CSTATE[0];
  LC_VSI_filter_B.Integrator[1] = LC_VSI_filter_X.Integrator_CSTATE[1];

  /* Sum: '<S3>/Sum3' incorporates:
   *  Gain: '<S3>/Gain1'
   */
  LC_VSI_filter_B.Sum3 = (LC_VSI_filter_P.C[0] * LC_VSI_filter_B.Integrator[0] +
    LC_VSI_filter_P.C[1] * LC_VSI_filter_B.Integrator[1]) +
    LC_VSI_filter_B.TmpRTBAtSum3Inport1;

  /* ZeroOrderHold: '<S1>/Zero-Order Hold1' */
  if (rtmIsMajorTimeStep(LC_VSI_filter_M) &&
      LC_VSI_filter_M->Timing.RateInteraction.TID0_2 == 1) {
    LC_VSI_filter_B.ZeroOrderHold1 = LC_VSI_filter_B.Sum3;
  }

  /* End of ZeroOrderHold: '<S1>/Zero-Order Hold1' */

  /* RateTransition: '<S2>/TmpRTBAtTo Workspace1Inport1' incorporates:
   *  RateTransition: '<S3>/TmpRTBAtSum2Inport1'
   */
  if (rtmIsMajorTimeStep(LC_VSI_filter_M) &&
      (LC_VSI_filter_M->Timing.RateInteraction.TID1_2 == 1)) {
    LC_VSI_filter_B.TmpRTBAtToWorkspace1Inport1 = LC_VSI_filter_B.Linesignal;

    /* RateTransition: '<S2>/TmpRTBAtTo Workspace2Inport1' */
    LC_VSI_filter_B.TmpRTBAtToWorkspace2Inport1_i = LC_VSI_filter_B.Sum4;

    /* RateTransition: '<S3>/TmpRTBAtTo Workspace2Inport1' */
    LC_VSI_filter_B.TmpRTBAtToWorkspace2Inport1_is[0] =
      LC_VSI_filter_B.Integrator[0];
    LC_VSI_filter_B.TmpRTBAtToWorkspace2Inport1_is[1] =
      LC_VSI_filter_B.Integrator[1];
    LC_VSI_filter_B.TmpRTBAtSum2Inport1[0] =
      LC_VSI_filter_DW.TmpRTBAtSum2Inport1_Buffer0[0];
    LC_VSI_filter_B.TmpRTBAtSum2Inport1[1] =
      LC_VSI_filter_DW.TmpRTBAtSum2Inport1_Buffer0[1];
  }

  /* End of RateTransition: '<S2>/TmpRTBAtTo Workspace1Inport1' */

  /* Sum: '<S3>/Sum2' incorporates:
   *  Gain: '<S3>/Gain'
   *  Gain: '<S3>/Gain4'
   */
  LC_VSI_filter_B.Sum2[0] = (LC_VSI_filter_P.B[0] * LC_VSI_filter_B.Sum +
    LC_VSI_filter_B.TmpRTBAtSum2Inport1[0]) + (LC_VSI_filter_P.A[0] *
    LC_VSI_filter_B.Integrator[0] + LC_VSI_filter_P.A[2] *
    LC_VSI_filter_B.Integrator[1]);
  LC_VSI_filter_B.Sum2[1] = (LC_VSI_filter_P.B[1] * LC_VSI_filter_B.Sum +
    LC_VSI_filter_B.TmpRTBAtSum2Inport1[1]) + (LC_VSI_filter_P.A[1] *
    LC_VSI_filter_B.Integrator[0] + LC_VSI_filter_P.A[3] *
    LC_VSI_filter_B.Integrator[1]);
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    /* Matfile logging */
    rt_UpdateTXYLogVars(LC_VSI_filter_M->rtwLogInfo, (LC_VSI_filter_M->Timing.t));
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    /* signal main to stop simulation */
    {                                  /* Sample time: [0.0s, 0.0s] */
      if ((rtmGetTFinal(LC_VSI_filter_M)!=-1) &&
          !((rtmGetTFinal(LC_VSI_filter_M)-(((LC_VSI_filter_M->Timing.clockTick1
               +LC_VSI_filter_M->Timing.clockTickH1* 4294967296.0)) * 1.0E-5)) >
            (((LC_VSI_filter_M->Timing.clockTick1+
               LC_VSI_filter_M->Timing.clockTickH1* 4294967296.0)) * 1.0E-5) *
            (DBL_EPSILON))) {
        rtmSetErrorStatus(LC_VSI_filter_M, "Simulation finished");
      }
    }

    rt_ertODEUpdateContinuousStates(&LC_VSI_filter_M->solverInfo);

    /* Update absolute time */
    /* The "clockTick0" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick0"
     * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick0 and the high bits
     * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++LC_VSI_filter_M->Timing.clockTick0)) {
      ++LC_VSI_filter_M->Timing.clockTickH0;
    }

    LC_VSI_filter_M->Timing.t[0] = rtsiGetSolverStopTime
      (&LC_VSI_filter_M->solverInfo);

    /* Update absolute time */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The resolution of this integer timer is 1.0E-5, which is the step size
     * of the task. Size of "clockTick1" ensures timer will not overflow during the
     * application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    LC_VSI_filter_M->Timing.clockTick1++;
    if (!LC_VSI_filter_M->Timing.clockTick1) {
      LC_VSI_filter_M->Timing.clockTickH1++;
    }
  }                                    /* end MajorTimeStep */
}

/* Derivatives for root system: '<Root>' */
void LC_VSI_filter_derivatives(void)
{
  XDot_LC_VSI_filter_T *_rtXdot;
  _rtXdot = ((XDot_LC_VSI_filter_T *) LC_VSI_filter_M->derivs);

  /* Derivatives for Integrator: '<S3>/Integrator' */
  _rtXdot->Integrator_CSTATE[0] = LC_VSI_filter_B.Sum2[0];
  _rtXdot->Integrator_CSTATE[1] = LC_VSI_filter_B.Sum2[1];
}

/* Model step function for TID2 */
void LC_VSI_filter_step2(void)         /* Sample time: [0.0002s, 0.0s] */
{
  /* local block i/o variables */
  real_T rtb_Gain2[2];
  real_T rtb_RandomNumber3;
  real_T rtb_Add1;
  real_T rtb_Gain_l;
  real_T rtb_u;
  real_T rtb_Gain_c[8];
  real_T b;
  real_T rtb_xhat[8];
  int32_T i;
  int32_T i_0;
  real_T tmp[8];
  real_T rtb_xhat_o;

  /* ToWorkspace: '<Root>/To Workspace2' */
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    rt_UpdateLogVar((LogVar *)(LogVar*)
                    (LC_VSI_filter_DW.ToWorkspace2_PWORK.LoggedData),
                    &LC_VSI_filter_B.TmpRTBAtToWorkspace2Inport1, 0);
  }

  /* MATLAB Function: '<S1>/MATLAB Function' */
  /* MATLAB Function 'Controller/MATLAB Function': '<S5>:1' */
  /* '<S5>:1:5' */
  /* '<S5>:1:8' */
  /* '<S5>:1:9' */
  b = 0.0;
  for (i_0 = 0; i_0 < 8; i_0++) {
    rtb_xhat_o = 0.0;
    for (i = 0; i < 8; i++) {
      rtb_xhat_o += LC_VSI_filter_P.Phi_obsv[(i << 3) + i_0] *
        LC_VSI_filter_DW.xhat_1[i];
    }

    rtb_xhat_o += LC_VSI_filter_P.Gamma_obsv[i_0] * LC_VSI_filter_DW.u_1;
    b += LC_VSI_filter_P.C_obsv[i_0] * rtb_xhat_o;
    rtb_xhat[i_0] = rtb_xhat_o;
  }

  b = LC_VSI_filter_P.T_y * LC_VSI_filter_B.ZeroOrderHold1 - b;
  for (i_0 = 0; i_0 < 8; i_0++) {
    rtb_xhat[i_0] += LC_VSI_filter_P.L[i_0] * b;
  }

  /* '<S5>:1:11' */
  /* '<S5>:1:18' */
  b = -LC_VSI_filter_P.Kp[0] * rtb_xhat[0] + -LC_VSI_filter_P.Kp[1] * rtb_xhat[1];

  /* '<S5>:1:21' */
  LC_VSI_filter_DW.u_1 = b;

  /* '<S5>:1:22' */
  /* '<S5>:1:24' */
  for (i = 0; i < 8; i++) {
    LC_VSI_filter_DW.xhat_1[i] = rtb_xhat[i];
    tmp[i] = 0.0;
    for (i_0 = 0; i_0 < 8; i_0++) {
      tmp[i] += LC_VSI_filter_P.T_x[(i_0 << 3) + i] * rtb_xhat[i_0];
    }
  }

  memcpy(&rtb_xhat[0], &tmp[0], sizeof(real_T) << 3U);

  /* '<S5>:1:25' */
  rtb_u = LC_VSI_filter_P.T_u * b;

  /* End of MATLAB Function: '<S1>/MATLAB Function' */

  /* ToWorkspace: '<S1>/To Workspace2' */
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    rt_UpdateLogVar((LogVar *)(LogVar*)
                    (LC_VSI_filter_DW.ToWorkspace2_PWORK_i.LoggedData), &rtb_u,
                    0);
  }

  /* Gain: '<S1>/Gain' */
  for (i_0 = 0; i_0 < 8; i_0++) {
    rtb_Gain_c[i_0] = 0.0;
    for (i = 0; i < 8; i++) {
      rtb_Gain_c[i_0] += LC_VSI_filter_P.T_x[(i_0 << 3) + i] * rtb_xhat[i];
    }
  }

  /* End of Gain: '<S1>/Gain' */

  /* ToWorkspace: '<S1>/To Workspace3' */
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    rt_UpdateLogVar((LogVar *)(LogVar*)
                    (LC_VSI_filter_DW.ToWorkspace3_PWORK.LoggedData),
                    &rtb_Gain_c[0], 0);
  }

  /* ToWorkspace: '<S2>/To Workspace1' */
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    rt_UpdateLogVar((LogVar *)(LogVar*)
                    (LC_VSI_filter_DW.ToWorkspace1_PWORK.LoggedData),
                    &LC_VSI_filter_B.TmpRTBAtToWorkspace1Inport1, 0);
  }

  /* ToWorkspace: '<S2>/To Workspace2' */
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    rt_UpdateLogVar((LogVar *)(LogVar*)
                    (LC_VSI_filter_DW.ToWorkspace2_PWORK_b.LoggedData),
                    &LC_VSI_filter_B.TmpRTBAtToWorkspace2Inport1_i, 0);
  }

  /* ToWorkspace: '<S3>/To Workspace2' */
  if (rtmIsMajorTimeStep(LC_VSI_filter_M)) {
    rt_UpdateLogVar((LogVar *)(LogVar*)
                    (LC_VSI_filter_DW.ToWorkspace2_PWORK_l.LoggedData),
                    &LC_VSI_filter_B.TmpRTBAtToWorkspace2Inport1_is[0], 0);
  }

  /* Gain: '<S3>/Gain2' incorporates:
   *  RandomNumber: '<S3>/Random Number2'
   */
  rtb_Gain2[0] = LC_VSI_filter_P.Psi[0] * LC_VSI_filter_DW.NextOutput;
  rtb_Gain2[1] = LC_VSI_filter_P.Psi[1] * LC_VSI_filter_DW.NextOutput;

  /* RandomNumber: '<S3>/Random Number3' */
  rtb_RandomNumber3 = LC_VSI_filter_DW.NextOutput_c;

  /* Sum: '<S4>/Add1' incorporates:
   *  Constant: '<S4>/Constant2'
   *  Gain: '<S4>/Gain1'
   */
  rtb_Add1 = LC_VSI_filter_P.Gain1_Gain * rtb_u +
    LC_VSI_filter_P.Constant2_Value;

  /* Gain: '<S4>/Gain' */
  rtb_Gain_l = LC_VSI_filter_P.Gain_Gain * rtb_u;

  /* Update for RateTransition: '<S4>/TmpRTBAtRelational OperatorInport1' */
  LC_VSI_filter_DW.TmpRTBAtRelationalOperatorInpor = rtb_Add1;

  /* Update for RateTransition: '<S4>/TmpRTBAtManual SwitchInport2' */
  LC_VSI_filter_DW.TmpRTBAtManualSwitchInport2_Buf = rtb_Gain_l;

  /* Update for RateTransition: '<S3>/TmpRTBAtSum3Inport1' */
  LC_VSI_filter_DW.TmpRTBAtSum3Inport1_Buffer0 = rtb_RandomNumber3;

  /* Update for RandomNumber: '<S3>/Random Number2' */
  LC_VSI_filter_DW.NextOutput = rt_nrand_Upu32_Yd_f_pw_snf
    (&LC_VSI_filter_DW.RandSeed) * LC_VSI_filter_P.RandomNumber2_StdDev +
    LC_VSI_filter_P.RandomNumber2_Mean;

  /* Update for RandomNumber: '<S3>/Random Number3' */
  LC_VSI_filter_DW.NextOutput_c = rt_nrand_Upu32_Yd_f_pw_snf
    (&LC_VSI_filter_DW.RandSeed_g) * LC_VSI_filter_P.RandomNumber3_StdDev +
    LC_VSI_filter_P.RandomNumber3_Mean;

  /* Update for RateTransition: '<S3>/TmpRTBAtSum2Inport1' */
  LC_VSI_filter_DW.TmpRTBAtSum2Inport1_Buffer0[0] = rtb_Gain2[0];
  LC_VSI_filter_DW.TmpRTBAtSum2Inport1_Buffer0[1] = rtb_Gain2[1];
}

/* Model step wrapper function for compatibility with a static main program */
void LC_VSI_filter_step(int_T tid)
{
  switch (tid) {
   case 0 :
    LC_VSI_filter_step0();
    break;

   case 2 :
    LC_VSI_filter_step2();
    break;

   default :
    break;
  }
}

/* Model initialize function */
void LC_VSI_filter_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)LC_VSI_filter_M, 0,
                sizeof(RT_MODEL_LC_VSI_filter_T));
  (LC_VSI_filter_M)->Timing.TaskCounters.cLimit[0] = 1;
  (LC_VSI_filter_M)->Timing.TaskCounters.cLimit[1] = 1;
  (LC_VSI_filter_M)->Timing.TaskCounters.cLimit[2] = 20;

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&LC_VSI_filter_M->solverInfo,
                          &LC_VSI_filter_M->Timing.simTimeStep);
    rtsiSetTPtr(&LC_VSI_filter_M->solverInfo, &rtmGetTPtr(LC_VSI_filter_M));
    rtsiSetStepSizePtr(&LC_VSI_filter_M->solverInfo,
                       &LC_VSI_filter_M->Timing.stepSize0);
    rtsiSetdXPtr(&LC_VSI_filter_M->solverInfo, &LC_VSI_filter_M->derivs);
    rtsiSetContStatesPtr(&LC_VSI_filter_M->solverInfo, (real_T **)
                         &LC_VSI_filter_M->contStates);
    rtsiSetNumContStatesPtr(&LC_VSI_filter_M->solverInfo,
      &LC_VSI_filter_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&LC_VSI_filter_M->solverInfo,
      &LC_VSI_filter_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&LC_VSI_filter_M->solverInfo,
      &LC_VSI_filter_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&LC_VSI_filter_M->solverInfo,
      &LC_VSI_filter_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&LC_VSI_filter_M->solverInfo, (&rtmGetErrorStatus
      (LC_VSI_filter_M)));
    rtsiSetRTModelPtr(&LC_VSI_filter_M->solverInfo, LC_VSI_filter_M);
  }

  rtsiSetSimTimeStep(&LC_VSI_filter_M->solverInfo, MAJOR_TIME_STEP);
  LC_VSI_filter_M->intgData.y = LC_VSI_filter_M->odeY;
  LC_VSI_filter_M->intgData.f[0] = LC_VSI_filter_M->odeF[0];
  LC_VSI_filter_M->intgData.f[1] = LC_VSI_filter_M->odeF[1];
  LC_VSI_filter_M->intgData.f[2] = LC_VSI_filter_M->odeF[2];
  LC_VSI_filter_M->intgData.f[3] = LC_VSI_filter_M->odeF[3];
  LC_VSI_filter_M->intgData.f[4] = LC_VSI_filter_M->odeF[4];
  LC_VSI_filter_M->intgData.f[5] = LC_VSI_filter_M->odeF[5];
  LC_VSI_filter_M->contStates = ((X_LC_VSI_filter_T *) &LC_VSI_filter_X);
  rtsiSetSolverData(&LC_VSI_filter_M->solverInfo, (void *)
                    &LC_VSI_filter_M->intgData);
  rtsiSetSolverName(&LC_VSI_filter_M->solverInfo,"ode5");
  rtmSetTPtr(LC_VSI_filter_M, &LC_VSI_filter_M->Timing.tArray[0]);
  rtmSetTFinal(LC_VSI_filter_M, 1.0);
  LC_VSI_filter_M->Timing.stepSize0 = 1.0E-5;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = NULL;
    LC_VSI_filter_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(LC_VSI_filter_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(LC_VSI_filter_M->rtwLogInfo, (NULL));
    rtliSetLogT(LC_VSI_filter_M->rtwLogInfo, "tout");
    rtliSetLogX(LC_VSI_filter_M->rtwLogInfo, "");
    rtliSetLogXFinal(LC_VSI_filter_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(LC_VSI_filter_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(LC_VSI_filter_M->rtwLogInfo, 0);
    rtliSetLogMaxRows(LC_VSI_filter_M->rtwLogInfo, 1000);
    rtliSetLogDecimation(LC_VSI_filter_M->rtwLogInfo, 1);
    rtliSetLogY(LC_VSI_filter_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(LC_VSI_filter_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(LC_VSI_filter_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &LC_VSI_filter_B), 0,
                sizeof(B_LC_VSI_filter_T));

  /* states (continuous) */
  {
    (void) memset((void *)&LC_VSI_filter_X, 0,
                  sizeof(X_LC_VSI_filter_T));
  }

  /* states (dwork) */
  (void) memset((void *)&LC_VSI_filter_DW, 0,
                sizeof(DW_LC_VSI_filter_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(LC_VSI_filter_M->rtwLogInfo, 0.0,
    rtmGetTFinal(LC_VSI_filter_M), LC_VSI_filter_M->Timing.stepSize0,
    (&rtmGetErrorStatus(LC_VSI_filter_M)));

  /* Start for ToWorkspace: '<Root>/To Workspace2' */
  {
    int_T dimensions[1] = { 1 };

    LC_VSI_filter_DW.ToWorkspace2_PWORK.LoggedData = rt_CreateLogVar(
      LC_VSI_filter_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(LC_VSI_filter_M),
      LC_VSI_filter_M->Timing.stepSize0,
      (&rtmGetErrorStatus(LC_VSI_filter_M)),
      "time",
      SS_DOUBLE,
      0,
      0,
      0,
      1,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.0002,
      1);
    if (LC_VSI_filter_DW.ToWorkspace2_PWORK.LoggedData == (NULL))
      return;
  }

  /* Start for RateTransition: '<S4>/TmpRTBAtRelational OperatorInport1' */
  LC_VSI_filter_B.TmpRTBAtRelationalOperatorInpor =
    LC_VSI_filter_P.TmpRTBAtRelationalOperatorInpor;

  /* Start for RateTransition: '<S4>/TmpRTBAtManual SwitchInport2' */
  LC_VSI_filter_B.TmpRTBAtManualSwitchInport2 =
    LC_VSI_filter_P.TmpRTBAtManualSwitchInport2_Ini;

  /* Start for RateTransition: '<S3>/TmpRTBAtSum3Inport1' */
  LC_VSI_filter_B.TmpRTBAtSum3Inport1 =
    LC_VSI_filter_P.TmpRTBAtSum3Inport1_InitialCond;

  /* Start for ToWorkspace: '<S1>/To Workspace2' */
  {
    int_T dimensions[1] = { 1 };

    LC_VSI_filter_DW.ToWorkspace2_PWORK_i.LoggedData = rt_CreateLogVar(
      LC_VSI_filter_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(LC_VSI_filter_M),
      LC_VSI_filter_M->Timing.stepSize0,
      (&rtmGetErrorStatus(LC_VSI_filter_M)),
      "pwm",
      SS_DOUBLE,
      0,
      0,
      0,
      1,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.0002,
      1);
    if (LC_VSI_filter_DW.ToWorkspace2_PWORK_i.LoggedData == (NULL))
      return;
  }

  /* Start for ToWorkspace: '<S1>/To Workspace3' */
  {
    int_T dimensions[2] = { 1, 8 };

    LC_VSI_filter_DW.ToWorkspace3_PWORK.LoggedData = rt_CreateLogVar(
      LC_VSI_filter_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(LC_VSI_filter_M),
      LC_VSI_filter_M->Timing.stepSize0,
      (&rtmGetErrorStatus(LC_VSI_filter_M)),
      "xhat",
      SS_DOUBLE,
      0,
      0,
      1,
      8,
      2,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.0002,
      1);
    if (LC_VSI_filter_DW.ToWorkspace3_PWORK.LoggedData == (NULL))
      return;
  }

  /* Start for DataStoreMemory: '<S1>/Data Store Memory' */
  LC_VSI_filter_DW.u_1 = LC_VSI_filter_P.DataStoreMemory_InitialValue;

  /* Start for DataStoreMemory: '<S1>/Data Store Memory1' */
  memcpy(&LC_VSI_filter_DW.xhat_1[0], &LC_VSI_filter_P.xhat0[0], sizeof(real_T) <<
         3U);

  /* Start for ToWorkspace: '<S2>/To Workspace1' */
  {
    int_T dimensions[1] = { 1 };

    LC_VSI_filter_DW.ToWorkspace1_PWORK.LoggedData = rt_CreateLogVar(
      LC_VSI_filter_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(LC_VSI_filter_M),
      LC_VSI_filter_M->Timing.stepSize0,
      (&rtmGetErrorStatus(LC_VSI_filter_M)),
      "line_signal",
      SS_DOUBLE,
      0,
      0,
      0,
      1,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.0002,
      1);
    if (LC_VSI_filter_DW.ToWorkspace1_PWORK.LoggedData == (NULL))
      return;
  }

  /* Start for ToWorkspace: '<S2>/To Workspace2' */
  {
    int_T dimensions[1] = { 1 };

    LC_VSI_filter_DW.ToWorkspace2_PWORK_b.LoggedData = rt_CreateLogVar(
      LC_VSI_filter_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(LC_VSI_filter_M),
      LC_VSI_filter_M->Timing.stepSize0,
      (&rtmGetErrorStatus(LC_VSI_filter_M)),
      "noise",
      SS_DOUBLE,
      0,
      0,
      0,
      1,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.0002,
      1);
    if (LC_VSI_filter_DW.ToWorkspace2_PWORK_b.LoggedData == (NULL))
      return;
  }

  /* Start for ToWorkspace: '<S3>/To Workspace2' */
  {
    int_T dimensions[1] = { 2 };

    LC_VSI_filter_DW.ToWorkspace2_PWORK_l.LoggedData = rt_CreateLogVar(
      LC_VSI_filter_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(LC_VSI_filter_M),
      LC_VSI_filter_M->Timing.stepSize0,
      (&rtmGetErrorStatus(LC_VSI_filter_M)),
      "x",
      SS_DOUBLE,
      0,
      0,
      0,
      2,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.0002,
      1);
    if (LC_VSI_filter_DW.ToWorkspace2_PWORK_l.LoggedData == (NULL))
      return;
  }

  /* Start for RateTransition: '<S3>/TmpRTBAtSum2Inport1' */
  LC_VSI_filter_B.TmpRTBAtSum2Inport1[0] =
    LC_VSI_filter_P.TmpRTBAtSum2Inport1_InitialCond;
  LC_VSI_filter_B.TmpRTBAtSum2Inport1[1] =
    LC_VSI_filter_P.TmpRTBAtSum2Inport1_InitialCond;

  {
    uint32_T tseed;
    int32_T r;
    int32_T t;
    real_T tmp;

    /* InitializeConditions for RateTransition: '<S4>/TmpRTBAtRelational OperatorInport1' */
    LC_VSI_filter_DW.TmpRTBAtRelationalOperatorInpor =
      LC_VSI_filter_P.TmpRTBAtRelationalOperatorInpor;

    /* InitializeConditions for RateTransition: '<S4>/TmpRTBAtManual SwitchInport2' */
    LC_VSI_filter_DW.TmpRTBAtManualSwitchInport2_Buf =
      LC_VSI_filter_P.TmpRTBAtManualSwitchInport2_Ini;

    /* InitializeConditions for RateTransition: '<S3>/TmpRTBAtSum3Inport1' */
    LC_VSI_filter_DW.TmpRTBAtSum3Inport1_Buffer0 =
      LC_VSI_filter_P.TmpRTBAtSum3Inport1_InitialCond;

    /* InitializeConditions for Integrator: '<S3>/Integrator' */
    LC_VSI_filter_X.Integrator_CSTATE[0] = LC_VSI_filter_P.Integrator_IC;
    LC_VSI_filter_X.Integrator_CSTATE[1] = LC_VSI_filter_P.Integrator_IC;

    /* InitializeConditions for RandomNumber: '<S3>/Random Number2' */
    tmp = floor(LC_VSI_filter_P.RandomNumber2_Seed);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 4.294967296E+9);
    }

    tseed = tmp < 0.0 ? (uint32_T)-(int32_T)(uint32_T)-tmp : (uint32_T)tmp;
    r = (int32_T)(tseed >> 16U);
    t = (int32_T)(tseed & 32768U);
    tseed = ((((tseed - ((uint32_T)r << 16U)) + t) << 16U) + t) + r;
    if (tseed < 1U) {
      tseed = 1144108930U;
    } else {
      if (tseed > 2147483646U) {
        tseed = 2147483646U;
      }
    }

    LC_VSI_filter_DW.RandSeed = tseed;
    LC_VSI_filter_DW.NextOutput = rt_nrand_Upu32_Yd_f_pw_snf
      (&LC_VSI_filter_DW.RandSeed) * LC_VSI_filter_P.RandomNumber2_StdDev +
      LC_VSI_filter_P.RandomNumber2_Mean;

    /* End of InitializeConditions for RandomNumber: '<S3>/Random Number2' */

    /* InitializeConditions for RandomNumber: '<S3>/Random Number3' */
    tmp = floor(LC_VSI_filter_P.RandomNumber3_Seed);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 4.294967296E+9);
    }

    tseed = tmp < 0.0 ? (uint32_T)-(int32_T)(uint32_T)-tmp : (uint32_T)tmp;
    r = (int32_T)(tseed >> 16U);
    t = (int32_T)(tseed & 32768U);
    tseed = ((((tseed - ((uint32_T)r << 16U)) + t) << 16U) + t) + r;
    if (tseed < 1U) {
      tseed = 1144108930U;
    } else {
      if (tseed > 2147483646U) {
        tseed = 2147483646U;
      }
    }

    LC_VSI_filter_DW.RandSeed_g = tseed;
    LC_VSI_filter_DW.NextOutput_c = rt_nrand_Upu32_Yd_f_pw_snf
      (&LC_VSI_filter_DW.RandSeed_g) * LC_VSI_filter_P.RandomNumber3_StdDev +
      LC_VSI_filter_P.RandomNumber3_Mean;

    /* End of InitializeConditions for RandomNumber: '<S3>/Random Number3' */

    /* InitializeConditions for RateTransition: '<S3>/TmpRTBAtSum2Inport1' */
    LC_VSI_filter_DW.TmpRTBAtSum2Inport1_Buffer0[0] =
      LC_VSI_filter_P.TmpRTBAtSum2Inport1_InitialCond;
    LC_VSI_filter_DW.TmpRTBAtSum2Inport1_Buffer0[1] =
      LC_VSI_filter_P.TmpRTBAtSum2Inport1_InitialCond;
  }
}

/* Model terminate function */
void LC_VSI_filter_terminate(void)
{
  /* (no terminate code required) */
}
