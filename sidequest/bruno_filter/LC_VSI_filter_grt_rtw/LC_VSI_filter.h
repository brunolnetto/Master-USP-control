/*
 * LC_VSI_filter.h
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

#ifndef RTW_HEADER_LC_VSI_filter_h_
#define RTW_HEADER_LC_VSI_filter_h_
#include <stddef.h>
#include <math.h>
#include <string.h>
#include <float.h>
#ifndef LC_VSI_filter_COMMON_INCLUDES_
# define LC_VSI_filter_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "rt_logging.h"
#endif                                 /* LC_VSI_filter_COMMON_INCLUDES_ */

#include "LC_VSI_filter_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rt_nonfinite.h"
#include "rtGetInf.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetContStateDisabled
# define rtmGetContStateDisabled(rtm)  ((rtm)->contStateDisabled)
#endif

#ifndef rtmSetContStateDisabled
# define rtmSetContStateDisabled(rtm, val) ((rtm)->contStateDisabled = (val))
#endif

#ifndef rtmGetContStates
# define rtmGetContStates(rtm)         ((rtm)->contStates)
#endif

#ifndef rtmSetContStates
# define rtmSetContStates(rtm, val)    ((rtm)->contStates = (val))
#endif

#ifndef rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag
# define rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm) ((rtm)->CTOutputIncnstWithState)
#endif

#ifndef rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag
# define rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm, val) ((rtm)->CTOutputIncnstWithState = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
# define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
# define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetIntgData
# define rtmGetIntgData(rtm)           ((rtm)->intgData)
#endif

#ifndef rtmSetIntgData
# define rtmSetIntgData(rtm, val)      ((rtm)->intgData = (val))
#endif

#ifndef rtmGetOdeF
# define rtmGetOdeF(rtm)               ((rtm)->odeF)
#endif

#ifndef rtmSetOdeF
# define rtmSetOdeF(rtm, val)          ((rtm)->odeF = (val))
#endif

#ifndef rtmGetOdeY
# define rtmGetOdeY(rtm)               ((rtm)->odeY)
#endif

#ifndef rtmSetOdeY
# define rtmSetOdeY(rtm, val)          ((rtm)->odeY = (val))
#endif

#ifndef rtmGetPeriodicContStateIndices
# define rtmGetPeriodicContStateIndices(rtm) ((rtm)->periodicContStateIndices)
#endif

#ifndef rtmSetPeriodicContStateIndices
# define rtmSetPeriodicContStateIndices(rtm, val) ((rtm)->periodicContStateIndices = (val))
#endif

#ifndef rtmGetPeriodicContStateRanges
# define rtmGetPeriodicContStateRanges(rtm) ((rtm)->periodicContStateRanges)
#endif

#ifndef rtmSetPeriodicContStateRanges
# define rtmSetPeriodicContStateRanges(rtm, val) ((rtm)->periodicContStateRanges = (val))
#endif

#ifndef rtmGetRTWLogInfo
# define rtmGetRTWLogInfo(rtm)         ((rtm)->rtwLogInfo)
#endif

#ifndef rtmGetZCCacheNeedsReset
# define rtmGetZCCacheNeedsReset(rtm)  ((rtm)->zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
# define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->zCCacheNeedsReset = (val))
#endif

#ifndef rtmGetdX
# define rtmGetdX(rtm)                 ((rtm)->derivs)
#endif

#ifndef rtmSetdX
# define rtmSetdX(rtm, val)            ((rtm)->derivs = (val))
#endif

#ifndef rtmCounterLimit
# define rtmCounterLimit(rtm, idx)     ((rtm)->Timing.TaskCounters.cLimit[(idx)])
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmStepTask
# define rtmStepTask(rtm, idx)         ((rtm)->Timing.TaskCounters.TID[(idx)] == 0)
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

#ifndef rtmTaskCounter
# define rtmTaskCounter(rtm, idx)      ((rtm)->Timing.TaskCounters.TID[(idx)])
#endif

/* Block signals (auto storage) */
typedef struct {
  real_T Clock;                        /* '<Root>/Clock' */
  real_T TmpRTBAtToWorkspace2Inport1;  /* '<Root>/Clock' */
  real_T TmpRTBAtRelationalOperatorInpor;/* '<S4>/Add1' */
  real_T Constant;                     /* '<S4>/Constant' */
  real_T Constant1;                    /* '<S4>/Constant1' */
  real_T TmpRTBAtManualSwitchInport2;  /* '<S4>/Gain' */
  real_T Linesignal;                   /* '<S2>/Line signal' */
  real_T Sum4;                         /* '<S6>/Sum4' */
  real_T Sum;                          /* '<Root>/Sum' */
  real_T TmpRTBAtSum3Inport1;          /* '<S3>/Random Number3' */
  real_T Integrator[2];                /* '<S3>/Integrator' */
  real_T Sum3;                         /* '<S3>/Sum3' */
  real_T ZeroOrderHold1;               /* '<S1>/Zero-Order Hold1' */
  real_T TmpRTBAtToWorkspace1Inport1;  /* '<S2>/Line signal' */
  real_T TmpRTBAtToWorkspace2Inport1_i;/* '<S2>/Harmonic Noise' */
  real_T TmpRTBAtToWorkspace2Inport1_is[2];/* '<S3>/Integrator' */
  real_T TmpRTBAtSum2Inport1[2];       /* '<S3>/Gain2' */
  real_T Sum2[2];                      /* '<S3>/Sum2' */
} B_LC_VSI_filter_T;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  real_T TmpRTBAtRelationalOperatorInpor;/* synthesized block */
  real_T TmpRTBAtManualSwitchInport2_Buf;/* synthesized block */
  real_T TmpRTBAtSum3Inport1_Buffer0;  /* synthesized block */
  real_T u_1;                          /* '<S1>/Data Store Memory' */
  real_T xhat_1[8];                    /* '<S1>/Data Store Memory1' */
  real_T NextOutput;                   /* '<S3>/Random Number2' */
  real_T NextOutput_c;                 /* '<S3>/Random Number3' */
  real_T TmpRTBAtSum2Inport1_Buffer0[2];/* synthesized block */
  struct {
    void *LoggedData;
  } ToWorkspace2_PWORK;                /* '<Root>/To Workspace2' */

  struct {
    void *LoggedData;
  } Scope_PWORK;                       /* '<Root>/Scope' */

  struct {
    void *LoggedData;
  } ToWorkspace2_PWORK_i;              /* '<S1>/To Workspace2' */

  struct {
    void *LoggedData;
  } ToWorkspace3_PWORK;                /* '<S1>/To Workspace3' */

  struct {
    void *LoggedData;
  } ToWorkspace1_PWORK;                /* '<S2>/To Workspace1' */

  struct {
    void *LoggedData;
  } ToWorkspace2_PWORK_b;              /* '<S2>/To Workspace2' */

  struct {
    void *LoggedData;
  } ToWorkspace2_PWORK_l;              /* '<S3>/To Workspace2' */

  uint32_T RandSeed;                   /* '<S3>/Random Number2' */
  uint32_T RandSeed_g;                 /* '<S3>/Random Number3' */
} DW_LC_VSI_filter_T;

/* Continuous states (auto storage) */
typedef struct {
  real_T Integrator_CSTATE[2];         /* '<S3>/Integrator' */
} X_LC_VSI_filter_T;

/* State derivatives (auto storage) */
typedef struct {
  real_T Integrator_CSTATE[2];         /* '<S3>/Integrator' */
} XDot_LC_VSI_filter_T;

/* State disabled  */
typedef struct {
  boolean_T Integrator_CSTATE[2];      /* '<S3>/Integrator' */
} XDis_LC_VSI_filter_T;

#ifndef ODE5_INTG
#define ODE5_INTG

/* ODE5 Integration Data */
typedef struct {
  real_T *y;                           /* output */
  real_T *f[6];                        /* derivatives */
} ODE5_IntgData;

#endif

/* Parameters (auto storage) */
struct P_LC_VSI_filter_T_ {
  real_T A[4];                         /* Variable: A
                                        * Referenced by: '<S3>/Gain'
                                        */
  real_T B[2];                         /* Variable: B
                                        * Referenced by: '<S3>/Gain4'
                                        */
  real_T C[2];                         /* Variable: C
                                        * Referenced by: '<S3>/Gain1'
                                        */
  real_T C_obsv[8];                    /* Variable: C_obsv
                                        * Referenced by: '<S1>/MATLAB Function'
                                        */
  real_T C_ww[18];                     /* Variable: C_ww
                                        * Referenced by: '<S1>/MATLAB Function'
                                        */
  real_T Gamma_obsv[8];                /* Variable: Gamma_obsv
                                        * Referenced by: '<S1>/MATLAB Function'
                                        */
  real_T Kp[2];                        /* Variable: Kp
                                        * Referenced by: '<S1>/MATLAB Function'
                                        */
  real_T L[8];                         /* Variable: L
                                        * Referenced by: '<S1>/MATLAB Function'
                                        */
  real_T Phi_obsv[64];                 /* Variable: Phi_obsv
                                        * Referenced by: '<S1>/MATLAB Function'
                                        */
  real_T Psi[2];                       /* Variable: Psi
                                        * Referenced by: '<S3>/Gain2'
                                        */
  real_T T_u;                          /* Variable: T_u
                                        * Referenced by: '<S1>/MATLAB Function'
                                        */
  real_T T_x[64];                      /* Variable: T_x
                                        * Referenced by:
                                        *   '<S1>/MATLAB Function'
                                        *   '<S1>/Gain'
                                        */
  real_T T_y;                          /* Variable: T_y
                                        * Referenced by: '<S1>/MATLAB Function'
                                        */
  real_T Vcc;                          /* Variable: Vcc
                                        * Referenced by:
                                        *   '<Root>/Gain'
                                        *   '<S4>/Constant'
                                        *   '<S4>/Constant1'
                                        */
  real_T fa;                           /* Variable: fa
                                        * Referenced by: '<S4>/Signal Generator'
                                        */
  real_T xhat0[8];                     /* Variable: xhat0
                                        * Referenced by: '<S1>/Data Store Memory1'
                                        */
  real_T TmpRTBAtRelationalOperatorInpor;/* Expression: 0
                                          * Referenced by: synthesized block
                                          */
  real_T SignalGenerator_Amplitude;    /* Expression: 1
                                        * Referenced by: '<S4>/Signal Generator'
                                        */
  real_T TmpRTBAtManualSwitchInport2_Ini;/* Expression: 0
                                          * Referenced by: synthesized block
                                          */
  real_T Linesignal_Amp;               /* Expression: noises.('w_1').A
                                        * Referenced by: '<S2>/Line signal'
                                        */
  real_T Linesignal_Bias;              /* Expression: 0
                                        * Referenced by: '<S2>/Line signal'
                                        */
  real_T Linesignal_Freq;              /* Expression: noises.('w_1').w
                                        * Referenced by: '<S2>/Line signal'
                                        */
  real_T Linesignal_Phase;             /* Expression: noises.('w_1').phi
                                        * Referenced by: '<S2>/Line signal'
                                        */
  real_T Harmonicnoise5_Amp;           /* Expression: noises.('w_5').A
                                        * Referenced by: '<S6>/Harmonic noise 5'
                                        */
  real_T Harmonicnoise5_Bias;          /* Expression: 0
                                        * Referenced by: '<S6>/Harmonic noise 5'
                                        */
  real_T Harmonicnoise5_Freq;          /* Expression: noises.('w_5').w
                                        * Referenced by: '<S6>/Harmonic noise 5'
                                        */
  real_T Harmonicnoise5_Phase;         /* Expression: noises.('w_5').phi
                                        * Referenced by: '<S6>/Harmonic noise 5'
                                        */
  real_T Harmonicnoise7_Amp;           /* Expression: noises.('w_7').A
                                        * Referenced by: '<S6>/Harmonic noise 7'
                                        */
  real_T Harmonicnoise7_Bias;          /* Expression: 0
                                        * Referenced by: '<S6>/Harmonic noise 7'
                                        */
  real_T Harmonicnoise7_Freq;          /* Expression: noises.('w_7').w
                                        * Referenced by: '<S6>/Harmonic noise 7'
                                        */
  real_T Harmonicnoise7_Phase;         /* Expression: noises.('w_7').phi
                                        * Referenced by: '<S6>/Harmonic noise 7'
                                        */
  real_T TmpRTBAtSum3Inport1_InitialCond;/* Expression: 0
                                          * Referenced by: synthesized block
                                          */
  real_T Integrator_IC;                /* Expression: 0
                                        * Referenced by: '<S3>/Integrator'
                                        */
  real_T DataStoreMemory_InitialValue; /* Expression: 0
                                        * Referenced by: '<S1>/Data Store Memory'
                                        */
  real_T RandomNumber2_Mean;           /* Expression: 0
                                        * Referenced by: '<S3>/Random Number2'
                                        */
  real_T RandomNumber2_StdDev;         /* Computed Parameter: RandomNumber2_StdDev
                                        * Referenced by: '<S3>/Random Number2'
                                        */
  real_T RandomNumber2_Seed;           /* Expression: 0
                                        * Referenced by: '<S3>/Random Number2'
                                        */
  real_T RandomNumber3_Mean;           /* Expression: 0
                                        * Referenced by: '<S3>/Random Number3'
                                        */
  real_T RandomNumber3_StdDev;         /* Computed Parameter: RandomNumber3_StdDev
                                        * Referenced by: '<S3>/Random Number3'
                                        */
  real_T RandomNumber3_Seed;           /* Expression: 0
                                        * Referenced by: '<S3>/Random Number3'
                                        */
  real_T TmpRTBAtSum2Inport1_InitialCond;/* Expression: 0
                                          * Referenced by: synthesized block
                                          */
  real_T Constant2_Value;              /* Expression: 0.5
                                        * Referenced by: '<S4>/Constant2'
                                        */
  real_T Gain1_Gain;                   /* Expression: 0.5
                                        * Referenced by: '<S4>/Gain1'
                                        */
  real_T Gain_Gain;                    /* Expression: 1
                                        * Referenced by: '<S4>/Gain'
                                        */
  uint8_T ManualSwitch_CurrentSetting; /* Computed Parameter: ManualSwitch_CurrentSetting
                                        * Referenced by: '<S4>/Manual Switch'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_LC_VSI_filter_T {
  const char_T *errorStatus;
  RTWLogInfo *rtwLogInfo;
  RTWSolverInfo solverInfo;
  X_LC_VSI_filter_T *contStates;
  int_T *periodicContStateIndices;
  real_T *periodicContStateRanges;
  real_T *derivs;
  boolean_T *contStateDisabled;
  boolean_T zCCacheNeedsReset;
  boolean_T derivCacheNeedsReset;
  boolean_T CTOutputIncnstWithState;
  real_T odeY[2];
  real_T odeF[6][2];
  ODE5_IntgData intgData;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numSampTimes;
  } Sizes;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    struct {
      uint8_T TID[3];
      uint8_T cLimit[3];
    } TaskCounters;

    struct {
      uint8_T TID0_2;
      uint8_T TID1_2;
    } RateInteraction;

    time_T tFinal;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[3];
  } Timing;
};

/* Block parameters (auto storage) */
extern P_LC_VSI_filter_T LC_VSI_filter_P;

/* Block signals (auto storage) */
extern B_LC_VSI_filter_T LC_VSI_filter_B;

/* Continuous states (auto storage) */
extern X_LC_VSI_filter_T LC_VSI_filter_X;

/* Block states (auto storage) */
extern DW_LC_VSI_filter_T LC_VSI_filter_DW;

/* Model entry point functions */
extern void LC_VSI_filter_initialize(void);
extern void LC_VSI_filter_step0(void);
extern void LC_VSI_filter_step(int_T tid);
extern void LC_VSI_filter_terminate(void);

/* Real-time Model object */
extern RT_MODEL_LC_VSI_filter_T *const LC_VSI_filter_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'LC_VSI_filter'
 * '<S1>'   : 'LC_VSI_filter/Controller'
 * '<S2>'   : 'LC_VSI_filter/Disturbance'
 * '<S3>'   : 'LC_VSI_filter/LC VSI'
 * '<S4>'   : 'LC_VSI_filter/PWM_driver'
 * '<S5>'   : 'LC_VSI_filter/Controller/MATLAB Function'
 * '<S6>'   : 'LC_VSI_filter/Disturbance/Harmonic Noise'
 */
#endif                                 /* RTW_HEADER_LC_VSI_filter_h_ */
