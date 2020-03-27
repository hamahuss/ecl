#include "__cf_xobserver.h"
#ifndef RTW_HEADER_xobserver_h_
#define RTW_HEADER_xobserver_h_
#include <stddef.h>
#include <string.h>
#include "rtw_modelmap.h"
#ifndef xobserver_COMMON_INCLUDES_
#define xobserver_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "sigstream_rtw.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "xobserver_types.h"
#include "multiword_types.h"
#include "mwmathutil.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME xobserver
#define NSAMPLE_TIMES (4) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (13) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (4)   
#elif NCSTATES != 4
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T gle2tr3y42 ; } abgzmzzmeb ; typedef struct { real_T
cko1stawzg [ 4 ] ; real_T bctb3sinjw [ 5 ] ; real_T fgcd1o5wqw ; real_T
cow1crz01g ; real_T gobdsr0swg [ 5 ] ; real_T jrsyzzcl1d ; real_T dom5fp4frf
[ 2 ] ; real_T e4pza2bthg [ 7 ] ; real_T nafhdch12j ; real_T dqxikanc54 ;
real_T gwnv0eezvp ; abgzmzzmeb pao1bblb11 ; abgzmzzmeb fsf2hml1ec ; } B ;
typedef struct { real_T awvthnja1g [ 4 ] ; real_T dlqha54lfr [ 4 ] ; real_T
at0ka4kyqa [ 4 ] ; real_T pm4pvzgl3h [ 4 ] ; real_T pxt2gygyjg ; real_T
nj4tsumc2v ; real_T lmkjjdwi0g ; real_T mqhougliim [ 3 ] ; real_T nupedttpik
[ 5 ] ; struct { void * TimePtr ; void * DataPtr ; void * RSimInfoPtr ; }
oikx21ant2 ; struct { void * LoggedData [ 4 ] ; } n15g0qlasn ; struct { void
* TimePtr ; void * DataPtr ; void * RSimInfoPtr ; } eloroqiapr ; struct {
void * LoggedData [ 2 ] ; } mzxr0nwsde ; struct { void * LoggedData [ 2 ] ; }
fuwscr4rpl ; struct { void * LoggedData [ 2 ] ; } psy0ppzldd ; struct { void
* LoggedData [ 2 ] ; } cqlrontoii ; struct { void * LoggedData ; } bvjralric0
; uint32_T hivvmfmqqm [ 5 ] ; struct { int_T PrevIndex ; } j2h32kzhbr ;
struct { int_T PrevIndex ; } fpekpvjach ; } DW ; typedef struct { real_T
h5v0ftifrb ; real_T la432nb51b ; real_T d3cer03ehs ; real_T j4w1pbwq0o ; } X
; typedef struct { real_T h5v0ftifrb ; real_T la432nb51b ; real_T d3cer03ehs
; real_T j4w1pbwq0o ; } XDot ; typedef struct { boolean_T h5v0ftifrb ;
boolean_T la432nb51b ; boolean_T d3cer03ehs ; boolean_T j4w1pbwq0o ; } XDis ;
typedef struct { real_T h5v0ftifrb ; real_T la432nb51b ; real_T d3cer03ehs ;
real_T j4w1pbwq0o ; } CStateAbsTol ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
NoiseBlock_Cov ; real_T NoiseBlock_seed [ 5 ] ; real_T TDL2_vinit ; real_T
TDL3_vinit ; real_T TDL4_vinit ; real_T TDL1_vinit [ 3 ] ; real_T
FromWorkspace1_Time0 [ 671 ] ; real_T FromWorkspace1_Data0 [ 2684 ] ; real_T
FromWorkspace_Time0 [ 671 ] ; real_T FromWorkspace_Data0 [ 3355 ] ; real_T
Integrator1_IC ; real_T Integrator1_IC_ncexgjzmw2 ; real_T Internal_1_1_A [ 7
] ; real_T Internal_1_1_B ; real_T Internal_1_1_C ; real_T
Internal_1_1_InitialCondition ; real_T Internal_1_2_A [ 7 ] ; real_T
Internal_1_2_B ; real_T Internal_1_2_C ; real_T Internal_1_2_InitialCondition
; real_T Internal_1_3_A [ 7 ] ; real_T Internal_1_3_B ; real_T Internal_1_3_C
; real_T Internal_1_3_InitialCondition ; real_T Internal_1_4_A [ 7 ] ; real_T
Internal_1_4_B ; real_T Internal_1_4_C ; real_T Internal_1_4_InitialCondition
; real_T WhiteNoise_Mean ; real_T WhiteNoise_StdDev ; real_T Internal_1_5_D ;
real_T Internal_1_5_InitialCondition ; real_T Internal_1_6_InitialCondition ;
real_T Internal_1_7_InitialCondition ; real_T Internal_1_8_InitialCondition ;
real_T Internal_1_9_InitialCondition ; real_T Constant_Value ; real_T
Constant1_Value ; real_T Constant2_Value ; real_T Integrator_IC ; real_T
Constant_Value_j2acmgfiiu ; real_T Constant1_Value_hqnvu24bt3 ; real_T
Constant2_Value_npyz3ateru ; real_T Integrator_IC_fn2t5hk1b2 ; real_T
StandardRegressors_Gain [ 70 ] ; real_T Wavenet_P1_Size [ 2 ] ; real_T
Wavenet_P1 ; real_T Wavenet_P2_Size [ 2 ] ; real_T Wavenet_P2 ; real_T
Wavenet_P3_Size [ 2 ] ; real_T Wavenet_P3 ; real_T Wavenet_P4_Size [ 2 ] ;
real_T Wavenet_P4 [ 7 ] ; real_T Wavenet_P5_Size [ 2 ] ; real_T Wavenet_P5 [
49 ] ; real_T Wavenet_P6_Size [ 2 ] ; real_T Wavenet_P6 [ 49 ] ; real_T
Wavenet_P7_Size [ 2 ] ; real_T Wavenet_P7 ; real_T Wavenet_P8_Size [ 2 ] ;
real_T Wavenet_P8 [ 7 ] ; real_T Wavenet_P9_Size [ 2 ] ; real_T
Wavenet_P10_Size [ 2 ] ; real_T Wavenet_P10 ; real_T Wavenet_P11_Size [ 2 ] ;
real_T Wavenet_P12_Size [ 2 ] ; real_T Wavenet_P12 ; real_T Wavenet_P13_Size
[ 2 ] ; real_T Wavenet_P14_Size [ 2 ] ; real_T Wavenet_P14 [ 7 ] ; } ; extern
const char * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ;
extern DW rtDW ; extern P rtP ; extern const rtwCAPI_ModelMappingStaticInfo *
xobserver_GetCAPIStaticMap ( void ) ; extern SimStruct * const rtS ; extern
const int_T gblNumToFiles ; extern const int_T gblNumFrFiles ; extern const
int_T gblNumFrWksBlocks ; extern rtInportTUtable * gblInportTUtables ; extern
const char * gblInportFileName ; extern const int_T gblNumRootInportBlks ;
extern const int_T gblNumModelInputs ; extern const int_T
gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ; extern
const int_T gblInportComplex [ ] ; extern const int_T gblInportInterpoFlag [
] ; extern const int_T gblInportContinuous [ ] ; extern const int_T
gblParameterTuningTid ; extern DataMapInfo * rt_dataMapInfoPtr ; extern
rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid )
; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T
tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( void
) ;
#endif
