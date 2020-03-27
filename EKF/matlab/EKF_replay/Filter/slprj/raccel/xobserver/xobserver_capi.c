#include "__cf_xobserver.h"
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "xobserver_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "xobserver.h"
#include "xobserver_capi.h"
#include "xobserver_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"xobserver/From Workspace" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , {
1 , 0 , TARGET_STRING ( "xobserver/From Workspace1" ) , TARGET_STRING ( "" )
, 0 , 0 , 1 , 0 , 1 } , { 2 , 0 , TARGET_STRING ( "xobserver/Idmodel/Sum1" )
, TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 2 } , { 3 , 0 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/Wavenet" ) , TARGET_STRING ( "" ) , 0 , 0 , 2
, 0 , 2 } , { 4 , 0 , TARGET_STRING ( "xobserver/Idmodel/NoiseBlock/Output" )
, TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 5 , 0 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/UX2Reg/Standard Regressors" ) , TARGET_STRING
( "" ) , 0 , 0 , 3 , 0 , 2 } , { 6 , 1 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem/MATLAB Function" ) , TARGET_STRING ( "" ) , 0
, 0 , 2 , 0 , 1 } , { 7 , 2 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem/MATLAB Function1" ) , TARGET_STRING ( "" ) ,
0 , 0 , 2 , 0 , 1 } , { 8 , 0 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem/Integrator1" ) , TARGET_STRING ( "" ) , 0 , 0
, 2 , 0 , 1 } , { 9 , 3 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem1/MATLAB Function" ) , TARGET_STRING ( "" ) ,
0 , 0 , 2 , 0 , 1 } , { 10 , 4 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem1/MATLAB Function1" ) , TARGET_STRING ( "" ) ,
0 , 0 , 2 , 0 , 1 } , { 11 , 0 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem1/Integrator1" ) , TARGET_STRING ( "" ) , 0 ,
0 , 2 , 0 , 1 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ;
static const rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 12 ,
TARGET_STRING ( "xobserver/From Workspace" ) , TARGET_STRING ( "Time0" ) , 0
, 4 , 0 } , { 13 , TARGET_STRING ( "xobserver/From Workspace" ) ,
TARGET_STRING ( "Data0" ) , 0 , 5 , 0 } , { 14 , TARGET_STRING (
"xobserver/From Workspace1" ) , TARGET_STRING ( "Time0" ) , 0 , 4 , 0 } , {
15 , TARGET_STRING ( "xobserver/From Workspace1" ) , TARGET_STRING ( "Data0"
) , 0 , 6 , 0 } , { 16 , TARGET_STRING ( "xobserver/Idmodel/NoiseBlock" ) ,
TARGET_STRING ( "Cov" ) , 0 , 2 , 0 } , { 17 , TARGET_STRING (
"xobserver/Idmodel/NoiseBlock" ) , TARGET_STRING ( "seed" ) , 0 , 7 , 0 } , {
18 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_1" ) , TARGET_STRING ( "A"
) , 0 , 3 , 0 } , { 19 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_1" ) ,
TARGET_STRING ( "B" ) , 0 , 2 , 0 } , { 20 , TARGET_STRING (
"xobserver/Idmodel/Internal_1_1" ) , TARGET_STRING ( "C" ) , 0 , 2 , 0 } , {
21 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_1" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 2 , 0 } , { 22 , TARGET_STRING (
"xobserver/Idmodel/Internal_1_2" ) , TARGET_STRING ( "A" ) , 0 , 3 , 0 } , {
23 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_2" ) , TARGET_STRING ( "B"
) , 0 , 2 , 0 } , { 24 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_2" ) ,
TARGET_STRING ( "C" ) , 0 , 2 , 0 } , { 25 , TARGET_STRING (
"xobserver/Idmodel/Internal_1_2" ) , TARGET_STRING ( "InitialCondition" ) , 0
, 2 , 0 } , { 26 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_3" ) ,
TARGET_STRING ( "A" ) , 0 , 3 , 0 } , { 27 , TARGET_STRING (
"xobserver/Idmodel/Internal_1_3" ) , TARGET_STRING ( "B" ) , 0 , 2 , 0 } , {
28 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_3" ) , TARGET_STRING ( "C"
) , 0 , 2 , 0 } , { 29 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_3" ) ,
TARGET_STRING ( "InitialCondition" ) , 0 , 2 , 0 } , { 30 , TARGET_STRING (
"xobserver/Idmodel/Internal_1_4" ) , TARGET_STRING ( "A" ) , 0 , 3 , 0 } , {
31 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_4" ) , TARGET_STRING ( "B"
) , 0 , 2 , 0 } , { 32 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_4" ) ,
TARGET_STRING ( "C" ) , 0 , 2 , 0 } , { 33 , TARGET_STRING (
"xobserver/Idmodel/Internal_1_4" ) , TARGET_STRING ( "InitialCondition" ) , 0
, 2 , 0 } , { 34 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_5" ) ,
TARGET_STRING ( "D" ) , 0 , 2 , 0 } , { 35 , TARGET_STRING (
"xobserver/Idmodel/Internal_1_5" ) , TARGET_STRING ( "InitialCondition" ) , 0
, 2 , 0 } , { 36 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_6" ) ,
TARGET_STRING ( "InitialCondition" ) , 0 , 2 , 0 } , { 37 , TARGET_STRING (
"xobserver/Idmodel/Internal_1_7" ) , TARGET_STRING ( "InitialCondition" ) , 0
, 2 , 0 } , { 38 , TARGET_STRING ( "xobserver/Idmodel/Internal_1_8" ) ,
TARGET_STRING ( "InitialCondition" ) , 0 , 2 , 0 } , { 39 , TARGET_STRING (
"xobserver/Idmodel/Internal_1_9" ) , TARGET_STRING ( "InitialCondition" ) , 0
, 2 , 0 } , { 40 , TARGET_STRING ( "xobserver/Nonlinear ARX Model/Wavenet" )
, TARGET_STRING ( "P1" ) , 0 , 2 , 0 } , { 41 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/Wavenet" ) , TARGET_STRING ( "P2" ) , 0 , 2 ,
0 } , { 42 , TARGET_STRING ( "xobserver/Nonlinear ARX Model/Wavenet" ) ,
TARGET_STRING ( "P3" ) , 0 , 2 , 0 } , { 43 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/Wavenet" ) , TARGET_STRING ( "P4" ) , 0 , 8 ,
0 } , { 44 , TARGET_STRING ( "xobserver/Nonlinear ARX Model/Wavenet" ) ,
TARGET_STRING ( "P5" ) , 0 , 9 , 0 } , { 45 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/Wavenet" ) , TARGET_STRING ( "P6" ) , 0 , 9 ,
0 } , { 46 , TARGET_STRING ( "xobserver/Nonlinear ARX Model/Wavenet" ) ,
TARGET_STRING ( "P7" ) , 0 , 2 , 0 } , { 47 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/Wavenet" ) , TARGET_STRING ( "P8" ) , 0 , 3 ,
0 } , { 48 , TARGET_STRING ( "xobserver/Nonlinear ARX Model/Wavenet" ) ,
TARGET_STRING ( "P10" ) , 0 , 2 , 0 } , { 49 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/Wavenet" ) , TARGET_STRING ( "P12" ) , 0 , 2 ,
0 } , { 50 , TARGET_STRING ( "xobserver/Nonlinear ARX Model/Wavenet" ) ,
TARGET_STRING ( "P14" ) , 0 , 8 , 0 } , { 51 , TARGET_STRING (
"xobserver/Idmodel/NoiseBlock/White Noise" ) , TARGET_STRING ( "Mean" ) , 0 ,
2 , 0 } , { 52 , TARGET_STRING ( "xobserver/Idmodel/NoiseBlock/White Noise" )
, TARGET_STRING ( "StdDev" ) , 0 , 2 , 0 } , { 53 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/TDLu/TDL2" ) , TARGET_STRING ( "vinit" ) , 0 ,
2 , 0 } , { 54 , TARGET_STRING ( "xobserver/Nonlinear ARX Model/TDLu/TDL3" )
, TARGET_STRING ( "vinit" ) , 0 , 2 , 0 } , { 55 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/TDLu/TDL4" ) , TARGET_STRING ( "vinit" ) , 0 ,
2 , 0 } , { 56 , TARGET_STRING ( "xobserver/Nonlinear ARX Model/TDLy/TDL1" )
, TARGET_STRING ( "vinit" ) , 0 , 10 , 0 } , { 57 , TARGET_STRING (
"xobserver/Nonlinear ARX Model/UX2Reg/Standard Regressors" ) , TARGET_STRING
( "Gain" ) , 0 , 11 , 0 } , { 58 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem/Constant" ) , TARGET_STRING ( "Value" ) , 0 ,
2 , 0 } , { 59 , TARGET_STRING ( "xobserver/Subsystem2/Subsystem/Constant1" )
, TARGET_STRING ( "Value" ) , 0 , 2 , 0 } , { 60 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem/Constant2" ) , TARGET_STRING ( "Value" ) , 0
, 2 , 0 } , { 61 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem/Integrator" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 2 , 0 } , { 62 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem/Integrator1" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 2 , 0 } , { 63 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem1/Constant" ) , TARGET_STRING ( "Value" ) , 0
, 2 , 0 } , { 64 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem1/Constant1" ) , TARGET_STRING ( "Value" ) , 0
, 2 , 0 } , { 65 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem1/Constant2" ) , TARGET_STRING ( "Value" ) , 0
, 2 , 0 } , { 66 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem1/Integrator" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 2 , 0 } , { 67 , TARGET_STRING (
"xobserver/Subsystem2/Subsystem1/Integrator1" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 2 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 }
} ; static const rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 , (
NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . bctb3sinjw [ 0 ] , & rtB .
cko1stawzg [ 0 ] , & rtB . jrsyzzcl1d , & rtB . nafhdch12j , & rtB .
gobdsr0swg [ 0 ] , & rtB . e4pza2bthg [ 0 ] , & rtB . fsf2hml1ec . gle2tr3y42
, & rtB . gwnv0eezvp , & rtB . fgcd1o5wqw , & rtB . pao1bblb11 . gle2tr3y42 ,
& rtB . dqxikanc54 , & rtB . cow1crz01g , & rtP . FromWorkspace_Time0 [ 0 ] ,
& rtP . FromWorkspace_Data0 [ 0 ] , & rtP . FromWorkspace1_Time0 [ 0 ] , &
rtP . FromWorkspace1_Data0 [ 0 ] , & rtP . NoiseBlock_Cov , & rtP .
NoiseBlock_seed [ 0 ] , & rtP . Internal_1_1_A [ 0 ] , & rtP . Internal_1_1_B
, & rtP . Internal_1_1_C , & rtP . Internal_1_1_InitialCondition , & rtP .
Internal_1_2_A [ 0 ] , & rtP . Internal_1_2_B , & rtP . Internal_1_2_C , &
rtP . Internal_1_2_InitialCondition , & rtP . Internal_1_3_A [ 0 ] , & rtP .
Internal_1_3_B , & rtP . Internal_1_3_C , & rtP .
Internal_1_3_InitialCondition , & rtP . Internal_1_4_A [ 0 ] , & rtP .
Internal_1_4_B , & rtP . Internal_1_4_C , & rtP .
Internal_1_4_InitialCondition , & rtP . Internal_1_5_D , & rtP .
Internal_1_5_InitialCondition , & rtP . Internal_1_6_InitialCondition , & rtP
. Internal_1_7_InitialCondition , & rtP . Internal_1_8_InitialCondition , &
rtP . Internal_1_9_InitialCondition , & rtP . Wavenet_P1 , & rtP . Wavenet_P2
, & rtP . Wavenet_P3 , & rtP . Wavenet_P4 [ 0 ] , & rtP . Wavenet_P5 [ 0 ] ,
& rtP . Wavenet_P6 [ 0 ] , & rtP . Wavenet_P7 , & rtP . Wavenet_P8 [ 0 ] , &
rtP . Wavenet_P10 , & rtP . Wavenet_P12 , & rtP . Wavenet_P14 [ 0 ] , & rtP .
WhiteNoise_Mean , & rtP . WhiteNoise_StdDev , & rtP . TDL2_vinit , & rtP .
TDL3_vinit , & rtP . TDL4_vinit , & rtP . TDL1_vinit [ 0 ] , & rtP .
StandardRegressors_Gain [ 0 ] , & rtP . Constant_Value , & rtP .
Constant1_Value , & rtP . Constant2_Value , & rtP . Integrator_IC , & rtP .
Integrator1_IC , & rtP . Constant_Value_j2acmgfiiu , & rtP .
Constant1_Value_hqnvu24bt3 , & rtP . Constant2_Value_npyz3ateru , & rtP .
Integrator_IC_fn2t5hk1b2 , & rtP . Integrator1_IC_ncexgjzmw2 , } ; static
int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_VECTOR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } , {
rtwCAPI_SCALAR , 4 , 2 , 0 } , { rtwCAPI_VECTOR , 6 , 2 , 0 } , {
rtwCAPI_VECTOR , 8 , 2 , 0 } , { rtwCAPI_VECTOR , 10 , 2 , 0 } , {
rtwCAPI_VECTOR , 12 , 2 , 0 } , { rtwCAPI_VECTOR , 14 , 2 , 0 } , {
rtwCAPI_VECTOR , 16 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 18 , 2 , 0 } , {
rtwCAPI_VECTOR , 20 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 22 , 2 , 0 } } ;
static const uint_T rtDimensionArray [ ] = { 5 , 1 , 4 , 1 , 1 , 1 , 7 , 1 ,
671 , 1 , 3355 , 1 , 2684 , 1 , 1 , 5 , 1 , 7 , 7 , 7 , 3 , 1 , 7 , 10 } ;
static const real_T rtcapiStoredFloats [ ] = { 0.01 , 0.0 , 0.1 } ; static
const rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static const rtwCAPI_SampleTimeMap
rtSampleTimeMap [ ] = { { ( const void * ) & rtcapiStoredFloats [ 0 ] , (
const void * ) & rtcapiStoredFloats [ 1 ] , 1 , 0 } , { ( const void * ) &
rtcapiStoredFloats [ 1 ] , ( const void * ) & rtcapiStoredFloats [ 1 ] , 0 ,
0 } , { ( const void * ) & rtcapiStoredFloats [ 2 ] , ( const void * ) &
rtcapiStoredFloats [ 1 ] , 2 , 0 } } ; static rtwCAPI_ModelMappingStaticInfo
mmiStatic = { { rtBlockSignals , 12 , ( NULL ) , 0 , ( NULL ) , 0 } , {
rtBlockParameters , 56 , rtModelParameters , 0 } , { ( NULL ) , 0 } , {
rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap
, rtDimensionArray } , "float" , { 3603830051U , 1752567022U , 3141829140U ,
1405094121U } , ( NULL ) , 0 , 0 } ; const rtwCAPI_ModelMappingStaticInfo *
xobserver_GetCAPIStaticMap ( void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void xobserver_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void xobserver_host_InitializeDataMapInfo ( xobserver_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
