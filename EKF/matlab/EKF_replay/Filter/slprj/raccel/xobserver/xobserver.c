#include "__cf_xobserver.h"
#include "rt_logging_mmi.h"
#include "xobserver_capi.h"
#include <math.h>
#include "xobserver.h"
#include "xobserver_private.h"
#include "xobserver_dt.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; extern boolean_T
gblExtModeStartPktReceived ; void raccelForceExtModeShutdown ( ) { if ( !
gblExtModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 3 , & stopRequested ) ; }
rtExtModeShutdown ( 3 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 2 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 4 ; const char_T
* gbl_raccel_Version = "8.14 (R2018a) 06-Feb-2018" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; const char * gblSlvrJacPatternFileName =
"slprj\\raccel\\xobserver\\xobserver_Jpattern.mat" ; const int_T
gblNumRootInportBlks = 0 ; const int_T gblNumModelInputs = 0 ; extern
rtInportTUtable * gblInportTUtables ; extern const char * gblInportFileName ;
const int_T gblInportDataTypeIdx [ ] = { - 1 } ; const int_T gblInportDims [
] = { - 1 } ; const int_T gblInportComplex [ ] = { - 1 } ; const int_T
gblInportInterpoFlag [ ] = { - 1 } ; const int_T gblInportContinuous [ ] = {
- 1 } ;
#include "simstruc.h"
#include "fixedpoint.h"
B rtB ; X rtX ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS =
& model_S ; void lnvsqv0kp2 ( real_T hytwhxv0q5 , real_T ifxoh0pz0u , real_T
ecqtwtg12h , abgzmzzmeb * localB ) { localB -> gle2tr3y42 = ifxoh0pz0u *
muDoubleScalarPower ( muDoubleScalarAbs ( ecqtwtg12h ) , 0.66666666666666663
) * muDoubleScalarSign ( ecqtwtg12h ) + hytwhxv0q5 ; } real_T
rt_urand_Upu32_Yd_f_pw_snf ( uint32_T * u ) { uint32_T lo ; uint32_T hi ; lo
= * u % 127773U * 16807U ; hi = * u / 127773U * 2836U ; if ( lo < hi ) { * u
= 2147483647U - ( hi - lo ) ; } else { * u = lo - hi ; } return ( real_T ) *
u * 4.6566128752457969E-10 ; } real_T rt_nrand_Upu32_Yd_f_pw_snf ( uint32_T *
u ) { real_T y ; real_T sr ; real_T si ; do { sr = 2.0 *
rt_urand_Upu32_Yd_f_pw_snf ( u ) - 1.0 ; si = 2.0 *
rt_urand_Upu32_Yd_f_pw_snf ( u ) - 1.0 ; si = sr * sr + si * si ; } while (
si > 1.0 ) ; y = muDoubleScalarSqrt ( - 2.0 * muDoubleScalarLog ( si ) / si )
* sr ; return y ; } void MdlInitialize ( void ) { int32_T iU ; uint32_T tseed
; int32_T r ; int32_T t ; real_T tmp ; rtX . h5v0ftifrb = rtP .
Integrator1_IC ; rtX . la432nb51b = rtP . Integrator1_IC_ncexgjzmw2 ; rtDW .
awvthnja1g [ 0 ] = rtP . Internal_1_1_InitialCondition ; rtDW . awvthnja1g [
1 ] = rtP . Internal_1_1_InitialCondition ; rtDW . awvthnja1g [ 2 ] = rtP .
Internal_1_1_InitialCondition ; rtDW . awvthnja1g [ 3 ] = rtP .
Internal_1_1_InitialCondition ; rtDW . dlqha54lfr [ 0 ] = rtP .
Internal_1_2_InitialCondition ; rtDW . dlqha54lfr [ 1 ] = rtP .
Internal_1_2_InitialCondition ; rtDW . dlqha54lfr [ 2 ] = rtP .
Internal_1_2_InitialCondition ; rtDW . dlqha54lfr [ 3 ] = rtP .
Internal_1_2_InitialCondition ; rtDW . at0ka4kyqa [ 0 ] = rtP .
Internal_1_3_InitialCondition ; rtDW . at0ka4kyqa [ 1 ] = rtP .
Internal_1_3_InitialCondition ; rtDW . at0ka4kyqa [ 2 ] = rtP .
Internal_1_3_InitialCondition ; rtDW . at0ka4kyqa [ 3 ] = rtP .
Internal_1_3_InitialCondition ; rtDW . pm4pvzgl3h [ 0 ] = rtP .
Internal_1_4_InitialCondition ; rtDW . pm4pvzgl3h [ 1 ] = rtP .
Internal_1_4_InitialCondition ; rtDW . pm4pvzgl3h [ 2 ] = rtP .
Internal_1_4_InitialCondition ; rtDW . pm4pvzgl3h [ 3 ] = rtP .
Internal_1_4_InitialCondition ; for ( iU = 0 ; iU < 5 ; iU ++ ) { tmp =
muDoubleScalarFloor ( rtP . NoiseBlock_seed [ iU ] ) ; if (
muDoubleScalarIsNaN ( tmp ) || muDoubleScalarIsInf ( tmp ) ) { tmp = 0.0 ; }
else { tmp = muDoubleScalarRem ( tmp , 4.294967296E+9 ) ; } tseed = tmp < 0.0
? ( uint32_T ) - ( int32_T ) ( uint32_T ) - tmp : ( uint32_T ) tmp ; r = (
int32_T ) ( tseed >> 16U ) ; t = ( int32_T ) ( tseed & 32768U ) ; tseed = ( (
( ( tseed - ( ( uint32_T ) r << 16U ) ) + t ) << 16U ) + t ) + r ; if ( tseed
< 1U ) { tseed = 1144108930U ; } else { if ( tseed > 2147483646U ) { tseed =
2147483646U ; } } rtDW . nupedttpik [ iU ] = rt_nrand_Upu32_Yd_f_pw_snf ( &
tseed ) * rtP . WhiteNoise_StdDev + rtP . WhiteNoise_Mean ; rtDW . hivvmfmqqm
[ iU ] = tseed ; } rtX . d3cer03ehs = rtP . Integrator_IC ; rtX . j4w1pbwq0o
= rtP . Integrator_IC_fn2t5hk1b2 ; rtDW . pxt2gygyjg = rtP . TDL2_vinit ;
rtDW . nj4tsumc2v = rtP . TDL3_vinit ; rtDW . lmkjjdwi0g = rtP . TDL4_vinit ;
rtDW . mqhougliim [ 0 ] = rtP . TDL1_vinit [ 0 ] ; rtDW . mqhougliim [ 1 ] =
rtP . TDL1_vinit [ 1 ] ; rtDW . mqhougliim [ 2 ] = rtP . TDL1_vinit [ 2 ] ; {
SimStruct * rts = ssGetSFunction ( rtS , 0 ) ; sfcnInitializeConditions ( rts
) ; if ( ssGetErrorStatus ( rts ) != ( NULL ) ) return ; } } void MdlStart (
void ) { { void * * slioCatalogueAddr = rt_slioCatalogueAddr ( ) ; void * r2
= ( NULL ) ; void * * pOSigstreamManagerAddr = ( NULL ) ; const int
maxErrorBufferSize = 16384 ; char errMsgCreatingOSigstreamManager [ 16384 ] ;
bool errorCreatingOSigstreamManager = false ; const char *
errorAddingR2SharedResource = ( NULL ) ; * slioCatalogueAddr =
rtwGetNewSlioCatalogue ( rt_GetMatSigLogSelectorFileName ( ) ) ;
errorAddingR2SharedResource = rtwAddR2SharedResource (
rtwGetPointerFromUniquePtr ( rt_slioCatalogue ( ) ) , 1 ) ; if (
errorAddingR2SharedResource != ( NULL ) ) { rtwTerminateSlioCatalogue (
slioCatalogueAddr ) ; * slioCatalogueAddr = ( NULL ) ; ssSetErrorStatus ( rtS
, errorAddingR2SharedResource ) ; return ; } r2 = rtwGetR2SharedResource (
rtwGetPointerFromUniquePtr ( rt_slioCatalogue ( ) ) ) ;
pOSigstreamManagerAddr = rt_GetOSigstreamManagerAddr ( ) ;
errorCreatingOSigstreamManager = rtwOSigstreamManagerCreateInstance (
rt_GetMatSigLogSelectorFileName ( ) , r2 , pOSigstreamManagerAddr ,
errMsgCreatingOSigstreamManager , maxErrorBufferSize ) ; if (
errorCreatingOSigstreamManager ) { * pOSigstreamManagerAddr = ( NULL ) ;
ssSetErrorStatus ( rtS , errMsgCreatingOSigstreamManager ) ; return ; } } {
bool externalInputIsInDatasetFormat = false ; void * pISigstreamManager =
rt_GetISigstreamManager ( ) ; rtwISigstreamManagerGetInputIsInDatasetFormat (
pISigstreamManager , & externalInputIsInDatasetFormat ) ; if (
externalInputIsInDatasetFormat ) { } } { FWksInfo * fromwksInfo ; if ( (
fromwksInfo = ( FWksInfo * ) calloc ( 1 , sizeof ( FWksInfo ) ) ) == ( NULL )
) { ssSetErrorStatus ( rtS ,
"from workspace STRING(Name) memory allocation error" ) ; } else {
fromwksInfo -> origWorkspaceVarName = "control1" ; fromwksInfo ->
origDataTypeId = 0 ; fromwksInfo -> origIsComplex = 0 ; fromwksInfo ->
origWidth = 4 ; fromwksInfo -> origElSize = sizeof ( real_T ) ; fromwksInfo
-> data = ( void * ) rtP . FromWorkspace1_Data0 ; fromwksInfo -> nDataPoints
= 671 ; fromwksInfo -> time = ( double * ) rtP . FromWorkspace1_Time0 ; rtDW
. oikx21ant2 . TimePtr = fromwksInfo -> time ; rtDW . oikx21ant2 . DataPtr =
fromwksInfo -> data ; rtDW . oikx21ant2 . RSimInfoPtr = fromwksInfo ; } rtDW
. j2h32kzhbr . PrevIndex = 0 ; } { FWksInfo * fromwksInfo ; if ( (
fromwksInfo = ( FWksInfo * ) calloc ( 1 , sizeof ( FWksInfo ) ) ) == ( NULL )
) { ssSetErrorStatus ( rtS ,
"from workspace STRING(Name) memory allocation error" ) ; } else {
fromwksInfo -> origWorkspaceVarName = "sig1" ; fromwksInfo -> origDataTypeId
= 0 ; fromwksInfo -> origIsComplex = 0 ; fromwksInfo -> origWidth = 5 ;
fromwksInfo -> origElSize = sizeof ( real_T ) ; fromwksInfo -> data = ( void
* ) rtP . FromWorkspace_Data0 ; fromwksInfo -> nDataPoints = 671 ;
fromwksInfo -> time = ( double * ) rtP . FromWorkspace_Time0 ; rtDW .
eloroqiapr . TimePtr = fromwksInfo -> time ; rtDW . eloroqiapr . DataPtr =
fromwksInfo -> data ; rtDW . eloroqiapr . RSimInfoPtr = fromwksInfo ; } rtDW
. fpekpvjach . PrevIndex = 0 ; } { int_T dimensions [ 1 ] = { 2 } ; rtDW .
bvjralric0 . LoggedData = rt_CreateLogVar ( ssGetRTWLogInfo ( rtS ) ,
ssGetTStart ( rtS ) , ssGetTFinal ( rtS ) , 0.0 , ( & ssGetErrorStatus ( rtS
) ) , "xyhat" , SS_DOUBLE , 0 , 0 , 0 , 2 , 1 , dimensions , NO_LOGVALDIMS ,
( NULL ) , ( NULL ) , 0 , 1 , 0.01 , 1 ) ; if ( rtDW . bvjralric0 .
LoggedData == ( NULL ) ) return ; } { SimStruct * rts = ssGetSFunction ( rtS
, 0 ) ; sfcnStart ( rts ) ; if ( ssGetErrorStatus ( rts ) != ( NULL ) )
return ; } MdlInitialize ( ) ; } void MdlOutputs ( int_T tid ) { real_T
jeflv5zzwn ; real_T f5kb4cqner ; real_T hkob20abjh ; real_T iurpa3qwcc ;
real_T prgyhdyeto ; real_T n221qplocy ; real_T klcx53nhln ; real_T llz3ajodw5
; real_T dvbruw2wm3 ; real_T mpaxcrgzgl ; real_T gfrizjqp25 ; real_T
cllik3fa15 ; real_T lnvbb54uui ; int32_T iU ; real_T y ; real_T knmqp3psoz [
10 ] ; int32_T i ; { real_T * pDataValues = ( real_T * ) rtDW . oikx21ant2 .
DataPtr ; real_T * pTimeValues = ( real_T * ) rtDW . oikx21ant2 . TimePtr ;
int_T currTimeIndex = rtDW . j2h32kzhbr . PrevIndex ; real_T t =
ssGetTaskTime ( rtS , 0 ) ; int numPoints , lastPoint ; FWksInfo *
fromwksInfo = ( FWksInfo * ) rtDW . oikx21ant2 . RSimInfoPtr ; numPoints =
fromwksInfo -> nDataPoints ; lastPoint = numPoints - 1 ; if ( t <=
pTimeValues [ 0 ] ) { currTimeIndex = 0 ; } else if ( t >= pTimeValues [
lastPoint ] ) { currTimeIndex = lastPoint - 1 ; } else { if ( t < pTimeValues
[ currTimeIndex ] ) { while ( t < pTimeValues [ currTimeIndex ] ) {
currTimeIndex -- ; } } else { while ( t >= pTimeValues [ currTimeIndex + 1 ]
) { currTimeIndex ++ ; } } } rtDW . j2h32kzhbr . PrevIndex = currTimeIndex ;
{ real_T t1 = pTimeValues [ currTimeIndex ] ; real_T t2 = pTimeValues [
currTimeIndex + 1 ] ; if ( t1 == t2 ) { if ( t < t1 ) { { int_T elIdx ; for (
elIdx = 0 ; elIdx < 4 ; ++ elIdx ) { ( & rtB . cko1stawzg [ 0 ] ) [ elIdx ] =
pDataValues [ currTimeIndex ] ; pDataValues += numPoints ; } } } else { {
int_T elIdx ; for ( elIdx = 0 ; elIdx < 4 ; ++ elIdx ) { ( & rtB . cko1stawzg
[ 0 ] ) [ elIdx ] = pDataValues [ currTimeIndex + 1 ] ; pDataValues +=
numPoints ; } } } } else { real_T f1 = ( t2 - t ) / ( t2 - t1 ) ; real_T f2 =
1.0 - f1 ; real_T d1 ; real_T d2 ; int_T TimeIndex = currTimeIndex ; { int_T
elIdx ; for ( elIdx = 0 ; elIdx < 4 ; ++ elIdx ) { d1 = pDataValues [
TimeIndex ] ; d2 = pDataValues [ TimeIndex + 1 ] ; ( & rtB . cko1stawzg [ 0 ]
) [ elIdx ] = ( real_T ) rtInterpolate ( d1 , d2 , f1 , f2 ) ; pDataValues +=
numPoints ; } } } } } if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { { real_T *
pDataValues = ( real_T * ) rtDW . eloroqiapr . DataPtr ; real_T * pTimeValues
= ( real_T * ) rtDW . eloroqiapr . TimePtr ; int_T currTimeIndex = rtDW .
fpekpvjach . PrevIndex ; real_T t = ssGetTaskTime ( rtS , 1 ) ; int numPoints
, lastPoint ; FWksInfo * fromwksInfo = ( FWksInfo * ) rtDW . eloroqiapr .
RSimInfoPtr ; numPoints = fromwksInfo -> nDataPoints ; lastPoint = numPoints
- 1 ; if ( t <= pTimeValues [ 0 ] ) { currTimeIndex = 0 ; } else if ( t >=
pTimeValues [ lastPoint ] ) { currTimeIndex = lastPoint - 1 ; } else { if ( t
< pTimeValues [ currTimeIndex ] ) { while ( t < pTimeValues [ currTimeIndex ]
) { currTimeIndex -- ; } } else { while ( t >= pTimeValues [ currTimeIndex +
1 ] ) { currTimeIndex ++ ; } } } rtDW . fpekpvjach . PrevIndex =
currTimeIndex ; { real_T t1 = pTimeValues [ currTimeIndex ] ; real_T t2 =
pTimeValues [ currTimeIndex + 1 ] ; if ( t1 == t2 ) { if ( t < t1 ) { { int_T
elIdx ; for ( elIdx = 0 ; elIdx < 5 ; ++ elIdx ) { ( & rtB . bctb3sinjw [ 0 ]
) [ elIdx ] = pDataValues [ currTimeIndex ] ; pDataValues += numPoints ; } }
} else { { int_T elIdx ; for ( elIdx = 0 ; elIdx < 5 ; ++ elIdx ) { ( & rtB .
bctb3sinjw [ 0 ] ) [ elIdx ] = pDataValues [ currTimeIndex + 1 ] ;
pDataValues += numPoints ; } } } } else { real_T f1 = ( t2 - t ) / ( t2 - t1
) ; real_T f2 = 1.0 - f1 ; real_T d1 ; real_T d2 ; int_T TimeIndex =
currTimeIndex ; { int_T elIdx ; for ( elIdx = 0 ; elIdx < 5 ; ++ elIdx ) { d1
= pDataValues [ TimeIndex ] ; d2 = pDataValues [ TimeIndex + 1 ] ; ( & rtB .
bctb3sinjw [ 0 ] ) [ elIdx ] = ( real_T ) rtInterpolate ( d1 , d2 , f1 , f2 )
; pDataValues += numPoints ; } } } } } } rtB . fgcd1o5wqw = rtX . h5v0ftifrb
; if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { } rtB . cow1crz01g = rtX .
la432nb51b ; if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { } if ( ssIsSampleHit (
rtS , 2 , 0 ) ) { { jeflv5zzwn = rtP . Internal_1_1_C * rtDW . awvthnja1g [ 0
] ; } { f5kb4cqner = rtP . Internal_1_2_C * rtDW . dlqha54lfr [ 0 ] ; } {
hkob20abjh = rtP . Internal_1_3_C * rtDW . at0ka4kyqa [ 0 ] ; } { iurpa3qwcc
= ( rtP . Internal_1_4_C ) * rtDW . pm4pvzgl3h [ 0 ] ; } y =
muDoubleScalarSqrt ( rtP . NoiseBlock_Cov ) / 0.31622776601683794 ; for ( iU
= 0 ; iU < 5 ; iU ++ ) { rtB . gobdsr0swg [ iU ] = y * rtDW . nupedttpik [ iU
] ; } { prgyhdyeto = rtP . Internal_1_5_D * rtB . gobdsr0swg [ 0 ] ; } {
n221qplocy = 0.0 ; } { klcx53nhln = 0.0 ; } { llz3ajodw5 = 0.0 ; } {
dvbruw2wm3 = 0.0 ; } rtB . jrsyzzcl1d = ( ( ( ( ( ( ( jeflv5zzwn + f5kb4cqner
) + hkob20abjh ) + iurpa3qwcc ) + prgyhdyeto ) + n221qplocy ) + klcx53nhln )
+ llz3ajodw5 ) + dvbruw2wm3 ; } if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { rtB .
dom5fp4frf [ 0 ] = rtB . fgcd1o5wqw ; rtB . dom5fp4frf [ 1 ] = rtB .
cow1crz01g ; if ( ssGetLogOutput ( rtS ) ) { { double locTime = ssGetTaskTime
( rtS , 1 ) ; ; if ( rtwTimeInLoggingInterval ( rtliGetLoggingInterval (
ssGetRootSS ( rtS ) -> mdlInfo -> rtwLogInfo ) , locTime ) ) {
rt_UpdateLogVar ( ( LogVar * ) ( LogVar * ) ( rtDW . bvjralric0 . LoggedData
) , & rtB . dom5fp4frf [ 0 ] , 0 ) ; } } } } mpaxcrgzgl = rtX . d3cer03ehs ;
gfrizjqp25 = rtB . bctb3sinjw [ 0 ] - rtB . fgcd1o5wqw ; lnvsqv0kp2 (
mpaxcrgzgl , rtP . Constant_Value , gfrizjqp25 , & rtB . fsf2hml1ec ) ; rtB .
gwnv0eezvp = ( muDoubleScalarCos ( rtB . bctb3sinjw [ 2 ] ) *
muDoubleScalarSin ( rtB . bctb3sinjw [ 3 ] ) * muDoubleScalarCos ( rtB .
bctb3sinjw [ 4 ] ) + muDoubleScalarSin ( rtB . bctb3sinjw [ 2 ] ) *
muDoubleScalarSin ( rtB . bctb3sinjw [ 4 ] ) ) * rtB . cko1stawzg [ 0 ] + (
rtP . Constant1_Value * muDoubleScalarPower ( muDoubleScalarAbs ( gfrizjqp25
) , 0.66666666666666663 ) * muDoubleScalarSign ( gfrizjqp25 ) + rtP .
Constant2_Value * muDoubleScalarSign ( gfrizjqp25 ) ) ; cllik3fa15 = rtX .
j4w1pbwq0o ; lnvbb54uui = rtB . bctb3sinjw [ 1 ] - rtB . cow1crz01g ;
lnvsqv0kp2 ( cllik3fa15 , rtP . Constant_Value_j2acmgfiiu , lnvbb54uui , &
rtB . pao1bblb11 ) ; rtB . dqxikanc54 = ( muDoubleScalarCos ( rtB .
bctb3sinjw [ 2 ] ) * muDoubleScalarSin ( rtB . bctb3sinjw [ 3 ] ) *
muDoubleScalarSin ( rtB . bctb3sinjw [ 4 ] ) - muDoubleScalarSin ( rtB .
bctb3sinjw [ 2 ] ) * muDoubleScalarCos ( rtB . bctb3sinjw [ 4 ] ) ) * rtB .
cko1stawzg [ 0 ] + ( rtP . Constant1_Value_hqnvu24bt3 * muDoubleScalarPower (
muDoubleScalarAbs ( lnvbb54uui ) , 0.66666666666666663 ) * muDoubleScalarSign
( lnvbb54uui ) + rtP . Constant2_Value_npyz3ateru * muDoubleScalarSign (
lnvbb54uui ) ) ; if ( ssIsSampleHit ( rtS , 2 , 0 ) ) { knmqp3psoz [ 6 ] =
0.0 ; knmqp3psoz [ 7 ] = 0.0 ; knmqp3psoz [ 8 ] = 0.0 ; knmqp3psoz [ 9 ] =
0.0 ; knmqp3psoz [ 3 ] = rtDW . pxt2gygyjg ; knmqp3psoz [ 4 ] = rtDW .
nj4tsumc2v ; knmqp3psoz [ 5 ] = rtDW . lmkjjdwi0g ; knmqp3psoz [ 0 ] = rtDW .
mqhougliim [ 0 ] ; knmqp3psoz [ 1 ] = rtDW . mqhougliim [ 1 ] ; knmqp3psoz [
2 ] = rtDW . mqhougliim [ 2 ] ; for ( iU = 0 ; iU < 7 ; iU ++ ) { rtB .
e4pza2bthg [ iU ] = 0.0 ; for ( i = 0 ; i < 10 ; i ++ ) { rtB . e4pza2bthg [
iU ] += rtP . StandardRegressors_Gain [ 7 * i + iU ] * knmqp3psoz [ i ] ; } }
{ SimStruct * rts = ssGetSFunction ( rtS , 0 ) ; sfcnOutputs ( rts , 0 ) ; }
} UNUSED_PARAMETER ( tid ) ; } void MdlUpdate ( int_T tid ) { int32_T iU ; if
( ssIsSampleHit ( rtS , 2 , 0 ) ) { { real_T xnew [ 4 ] ; xnew [ 0 ] = ( rtP
. Internal_1_1_A [ 0 ] ) * rtDW . awvthnja1g [ 0 ] + ( rtP . Internal_1_1_A [
1 ] ) * rtDW . awvthnja1g [ 1 ] + ( rtP . Internal_1_1_A [ 2 ] ) * rtDW .
awvthnja1g [ 2 ] + ( rtP . Internal_1_1_A [ 3 ] ) * rtDW . awvthnja1g [ 3 ] ;
xnew [ 0 ] += rtP . Internal_1_1_B * rtB . cko1stawzg [ 0 ] ; xnew [ 1 ] = (
rtP . Internal_1_1_A [ 4 ] ) * rtDW . awvthnja1g [ 0 ] ; xnew [ 2 ] = ( rtP .
Internal_1_1_A [ 5 ] ) * rtDW . awvthnja1g [ 1 ] ; xnew [ 3 ] = ( rtP .
Internal_1_1_A [ 6 ] ) * rtDW . awvthnja1g [ 2 ] ; ( void ) memcpy ( & rtDW .
awvthnja1g [ 0 ] , xnew , sizeof ( real_T ) * 4 ) ; } { real_T xnew [ 4 ] ;
xnew [ 0 ] = ( rtP . Internal_1_2_A [ 0 ] ) * rtDW . dlqha54lfr [ 0 ] + ( rtP
. Internal_1_2_A [ 1 ] ) * rtDW . dlqha54lfr [ 1 ] + ( rtP . Internal_1_2_A [
2 ] ) * rtDW . dlqha54lfr [ 2 ] + ( rtP . Internal_1_2_A [ 3 ] ) * rtDW .
dlqha54lfr [ 3 ] ; xnew [ 0 ] += rtP . Internal_1_2_B * rtB . cko1stawzg [ 1
] ; xnew [ 1 ] = ( rtP . Internal_1_2_A [ 4 ] ) * rtDW . dlqha54lfr [ 0 ] ;
xnew [ 2 ] = ( rtP . Internal_1_2_A [ 5 ] ) * rtDW . dlqha54lfr [ 1 ] ; xnew
[ 3 ] = ( rtP . Internal_1_2_A [ 6 ] ) * rtDW . dlqha54lfr [ 2 ] ; ( void )
memcpy ( & rtDW . dlqha54lfr [ 0 ] , xnew , sizeof ( real_T ) * 4 ) ; } {
real_T xnew [ 4 ] ; xnew [ 0 ] = ( rtP . Internal_1_3_A [ 0 ] ) * rtDW .
at0ka4kyqa [ 0 ] + ( rtP . Internal_1_3_A [ 1 ] ) * rtDW . at0ka4kyqa [ 1 ] +
( rtP . Internal_1_3_A [ 2 ] ) * rtDW . at0ka4kyqa [ 2 ] + ( rtP .
Internal_1_3_A [ 3 ] ) * rtDW . at0ka4kyqa [ 3 ] ; xnew [ 0 ] += rtP .
Internal_1_3_B * rtB . cko1stawzg [ 2 ] ; xnew [ 1 ] = ( rtP . Internal_1_3_A
[ 4 ] ) * rtDW . at0ka4kyqa [ 0 ] ; xnew [ 2 ] = ( rtP . Internal_1_3_A [ 5 ]
) * rtDW . at0ka4kyqa [ 1 ] ; xnew [ 3 ] = ( rtP . Internal_1_3_A [ 6 ] ) *
rtDW . at0ka4kyqa [ 2 ] ; ( void ) memcpy ( & rtDW . at0ka4kyqa [ 0 ] , xnew
, sizeof ( real_T ) * 4 ) ; } { real_T xnew [ 4 ] ; xnew [ 0 ] = ( rtP .
Internal_1_4_A [ 0 ] ) * rtDW . pm4pvzgl3h [ 0 ] + ( rtP . Internal_1_4_A [ 1
] ) * rtDW . pm4pvzgl3h [ 1 ] + ( rtP . Internal_1_4_A [ 2 ] ) * rtDW .
pm4pvzgl3h [ 2 ] + ( rtP . Internal_1_4_A [ 3 ] ) * rtDW . pm4pvzgl3h [ 3 ] ;
xnew [ 0 ] += rtP . Internal_1_4_B * rtB . cko1stawzg [ 3 ] ; xnew [ 1 ] = (
rtP . Internal_1_4_A [ 4 ] ) * rtDW . pm4pvzgl3h [ 0 ] ; xnew [ 2 ] = ( rtP .
Internal_1_4_A [ 5 ] ) * rtDW . pm4pvzgl3h [ 1 ] ; xnew [ 3 ] = ( rtP .
Internal_1_4_A [ 6 ] ) * rtDW . pm4pvzgl3h [ 2 ] ; ( void ) memcpy ( & rtDW .
pm4pvzgl3h [ 0 ] , xnew , sizeof ( real_T ) * 4 ) ; } for ( iU = 0 ; iU < 5 ;
iU ++ ) { rtDW . nupedttpik [ iU ] = rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW .
hivvmfmqqm [ iU ] ) * rtP . WhiteNoise_StdDev + rtP . WhiteNoise_Mean ; }
rtDW . pxt2gygyjg = 0.0 ; rtDW . nj4tsumc2v = 0.0 ; rtDW . lmkjjdwi0g = 0.0 ;
rtDW . mqhougliim [ 2 ] = rtDW . mqhougliim [ 1 ] ; rtDW . mqhougliim [ 1 ] =
rtDW . mqhougliim [ 0 ] ; rtDW . mqhougliim [ 0 ] = rtB . nafhdch12j ; }
UNUSED_PARAMETER ( tid ) ; } void MdlUpdateTID3 ( int_T tid ) {
UNUSED_PARAMETER ( tid ) ; } void MdlDerivatives ( void ) { XDot * _rtXdot ;
_rtXdot = ( ( XDot * ) ssGetdX ( rtS ) ) ; _rtXdot -> h5v0ftifrb = rtB .
fsf2hml1ec . gle2tr3y42 ; _rtXdot -> la432nb51b = rtB . pao1bblb11 .
gle2tr3y42 ; _rtXdot -> d3cer03ehs = rtB . gwnv0eezvp ; _rtXdot -> j4w1pbwq0o
= rtB . dqxikanc54 ; } void MdlProjection ( void ) { } void MdlTerminate (
void ) { rt_FREE ( rtDW . oikx21ant2 . RSimInfoPtr ) ; rt_FREE ( rtDW .
eloroqiapr . RSimInfoPtr ) ; { SimStruct * rts = ssGetSFunction ( rtS , 0 ) ;
sfcnTerminate ( rts ) ; } if ( rt_slioCatalogue ( ) != ( NULL ) ) { void * *
slioCatalogueAddr = rt_slioCatalogueAddr ( ) ; rtwSaveDatasetsToMatFile (
rtwGetPointerFromUniquePtr ( rt_slioCatalogue ( ) ) ,
rt_GetMatSigstreamLoggingFileName ( ) ) ; rtwTerminateSlioCatalogue (
slioCatalogueAddr ) ; * slioCatalogueAddr = NULL ; } } void
MdlInitializeSizes ( void ) { ssSetNumContStates ( rtS , 4 ) ;
ssSetNumPeriodicContStates ( rtS , 0 ) ; ssSetNumY ( rtS , 0 ) ; ssSetNumU (
rtS , 0 ) ; ssSetDirectFeedThrough ( rtS , 0 ) ; ssSetNumSampleTimes ( rtS ,
3 ) ; ssSetNumBlocks ( rtS , 49 ) ; ssSetNumBlockIO ( rtS , 13 ) ;
ssSetNumBlockParams ( rtS , 7674 ) ; } void MdlInitializeSampleTimes ( void )
{ ssSetSampleTime ( rtS , 0 , 0.0 ) ; ssSetSampleTime ( rtS , 1 , 0.01 ) ;
ssSetSampleTime ( rtS , 2 , 0.1 ) ; ssSetOffsetTime ( rtS , 0 , 0.0 ) ;
ssSetOffsetTime ( rtS , 1 , 0.0 ) ; ssSetOffsetTime ( rtS , 2 , 0.0 ) ; }
void raccel_set_checksum ( ) { ssSetChecksumVal ( rtS , 0 , 3603830051U ) ;
ssSetChecksumVal ( rtS , 1 , 1752567022U ) ; ssSetChecksumVal ( rtS , 2 ,
3141829140U ) ; ssSetChecksumVal ( rtS , 3 , 1405094121U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( void ) { static struct _ssMdlInfo mdlInfo
; ( void ) memset ( ( char * ) rtS , 0 , sizeof ( SimStruct ) ) ; ( void )
memset ( ( char * ) & mdlInfo , 0 , sizeof ( struct _ssMdlInfo ) ) ;
ssSetMdlInfoPtr ( rtS , & mdlInfo ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof
( B ) ) ; } ssSetDefaultParam ( rtS , ( real_T * ) & rtP ) ; { real_T * x = (
real_T * ) & rtX ; ssSetContStates ( rtS , x ) ; ( void ) memset ( ( void * )
x , 0 , sizeof ( X ) ) ; } { void * dwork = ( void * ) & rtDW ;
ssSetRootDWork ( rtS , dwork ) ; ( void ) memset ( dwork , 0 , sizeof ( DW )
) ; } { static DataTypeTransInfo dtInfo ; ( void ) memset ( ( char_T * ) &
dtInfo , 0 , sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS , & dtInfo ) ;
dtInfo . numDataTypes = 14 ; dtInfo . dataTypeSizes = & rtDataTypeSizes [ 0 ]
; dtInfo . dataTypeNames = & rtDataTypeNames [ 0 ] ; dtInfo . BTransTable = &
rtBTransTable ; dtInfo . PTransTable = & rtPTransTable ; }
xobserver_InitializeDataMapInfo ( ) ; ssSetIsRapidAcceleratorActive ( rtS ,
true ) ; ssSetRootSS ( rtS , rtS ) ; ssSetVersion ( rtS ,
SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS , "xobserver" ) ; ssSetPath
( rtS , "xobserver" ) ; ssSetTStart ( rtS , 0.0 ) ; ssSetTFinal ( rtS , 33.0
) ; { static RTWLogInfo rt_DataLoggingInfo ; rt_DataLoggingInfo .
loggingInterval = NULL ; ssSetRTWLogInfo ( rtS , & rt_DataLoggingInfo ) ; } {
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogXSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; rtliSetLogT (
ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX ( ssGetRTWLogInfo ( rtS ) ,
"" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS
) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
struct _ssStatesInfo2 statesInfo2 ; ssSetStatesInfo2 ( rtS , & statesInfo2 )
; } { static ssPeriodicStatesInfo periodicStatesInfo ;
ssSetPeriodicStatesInfo ( rtS , & periodicStatesInfo ) ; } { static
ssSolverInfo slvrInfo ; static boolean_T contStatesDisabled [ 4 ] ; static
real_T absTol [ 4 ] = { 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 } ; static uint8_T
absTolControl [ 4 ] = { 0U , 0U , 0U , 0U } ; static ssNonContDerivSigInfo
nonContDerivSigInfo [ 1 ] = { { 5 * sizeof ( real_T ) , ( char * ) ( & rtB .
bctb3sinjw [ 0 ] ) , ( NULL ) } } ; ssSetSolverRelTol ( rtS , 0.001 ) ;
ssSetStepSize ( rtS , 0.0 ) ; ssSetMinStepSize ( rtS , 0.0 ) ;
ssSetMaxNumMinSteps ( rtS , - 1 ) ; ssSetMinStepViolatedError ( rtS , 0 ) ;
ssSetMaxStepSize ( rtS , 0.01 ) ; ssSetSolverMaxOrder ( rtS , - 1 ) ;
ssSetSolverRefineFactor ( rtS , 1 ) ; ssSetOutputTimes ( rtS , ( NULL ) ) ;
ssSetNumOutputTimes ( rtS , 0 ) ; ssSetOutputTimesOnly ( rtS , 0 ) ;
ssSetOutputTimesIndex ( rtS , 0 ) ; ssSetZCCacheNeedsReset ( rtS , 0 ) ;
ssSetDerivCacheNeedsReset ( rtS , 0 ) ; ssSetNumNonContDerivSigInfos ( rtS ,
1 ) ; ssSetNonContDerivSigInfos ( rtS , nonContDerivSigInfo ) ;
ssSetSolverInfo ( rtS , & slvrInfo ) ; ssSetSolverName ( rtS , "ode113" ) ;
ssSetVariableStepSolver ( rtS , 1 ) ; ssSetSolverConsistencyChecking ( rtS ,
0 ) ; ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ;
ssSetSolverRobustResetMethod ( rtS , 0 ) ; ssSetAbsTolVector ( rtS , absTol )
; ssSetAbsTolControlVector ( rtS , absTolControl ) ;
ssSetSolverAbsTol_Obsolete ( rtS , absTol ) ;
ssSetSolverAbsTolControl_Obsolete ( rtS , absTolControl ) ;
ssSetSolverStateProjection ( rtS , 0 ) ; ssSetSolverMassMatrixType ( rtS , (
ssMatrixType ) 0 ) ; ssSetSolverMassMatrixNzMax ( rtS , 0 ) ;
ssSetModelOutputs ( rtS , MdlOutputs ) ; ssSetModelLogData ( rtS ,
rt_UpdateTXYLogVars ) ; ssSetModelLogDataIfInInterval ( rtS ,
rt_UpdateTXXFYLogVars ) ; ssSetModelUpdate ( rtS , MdlUpdate ) ;
ssSetModelDerivatives ( rtS , MdlDerivatives ) ;
ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ;
ssSetSolverShapePreserveControl ( rtS , 2 ) ; ssSetTNextTid ( rtS , INT_MIN )
; ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 0 ) ; ssSetContStateDisabled ( rtS ,
contStatesDisabled ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ; }
ssSetChecksumVal ( rtS , 0 , 3603830051U ) ; ssSetChecksumVal ( rtS , 1 ,
1752567022U ) ; ssSetChecksumVal ( rtS , 2 , 3141829140U ) ; ssSetChecksumVal
( rtS , 3 , 1405094121U ) ; { static const sysRanDType rtAlwaysEnabled =
SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo rt_ExtModeInfo ; static const
sysRanDType * systemRan [ 5 ] ; gblRTWExtModeInfo = & rt_ExtModeInfo ;
ssSetRTWExtModeInfo ( rtS , & rt_ExtModeInfo ) ;
rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo , systemRan ) ;
systemRan [ 0 ] = & rtAlwaysEnabled ; systemRan [ 1 ] = & rtAlwaysEnabled ;
systemRan [ 2 ] = & rtAlwaysEnabled ; systemRan [ 3 ] = & rtAlwaysEnabled ;
systemRan [ 4 ] = & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr (
ssGetRTWExtModeInfo ( rtS ) , & ssGetModelMappingInfo ( rtS ) ) ;
rteiSetChecksumsPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) )
; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; }
ssSetNumSFunctions ( rtS , 1 ) ; { static SimStruct childSFunctions [ 1 ] ;
static SimStruct * childSFunctionPtrs [ 1 ] ; ( void ) memset ( ( void * ) &
childSFunctions [ 0 ] , 0 , sizeof ( childSFunctions ) ) ; ssSetSFunctions (
rtS , & childSFunctionPtrs [ 0 ] ) ; ssSetSFunction ( rtS , 0 , &
childSFunctions [ 0 ] ) ; { SimStruct * rts = ssGetSFunction ( rtS , 0 ) ;
static time_T sfcnPeriod [ 1 ] ; static time_T sfcnOffset [ 1 ] ; static
int_T sfcnTsMap [ 1 ] ; ( void ) memset ( ( void * ) sfcnPeriod , 0 , sizeof
( time_T ) * 1 ) ; ( void ) memset ( ( void * ) sfcnOffset , 0 , sizeof (
time_T ) * 1 ) ; ssSetSampleTimePtr ( rts , & sfcnPeriod [ 0 ] ) ;
ssSetOffsetTimePtr ( rts , & sfcnOffset [ 0 ] ) ; ssSetSampleTimeTaskIDPtr (
rts , sfcnTsMap ) ; { static struct _ssBlkInfo2 _blkInfo2 ; struct
_ssBlkInfo2 * blkInfo2 = & _blkInfo2 ; ssSetBlkInfo2Ptr ( rts , blkInfo2 ) ;
} { static struct _ssPortInfo2 _portInfo2 ; struct _ssPortInfo2 * portInfo2 =
& _portInfo2 ; _ssSetBlkInfo2PortInfo2Ptr ( rts , portInfo2 ) ; }
ssSetMdlInfoPtr ( rts , ssGetMdlInfoPtr ( rtS ) ) ; { static struct
_ssSFcnModelMethods2 methods2 ; ssSetModelMethods2 ( rts , & methods2 ) ; } {
static struct _ssSFcnModelMethods3 methods3 ; ssSetModelMethods3 ( rts , &
methods3 ) ; } { static struct _ssSFcnModelMethods4 methods4 ;
ssSetModelMethods4 ( rts , & methods4 ) ; } { static struct _ssStatesInfo2
statesInfo2 ; static ssPeriodicStatesInfo periodicStatesInfo ;
ssSetStatesInfo2 ( rts , & statesInfo2 ) ; ssSetPeriodicStatesInfo ( rts , &
periodicStatesInfo ) ; } { static struct _ssPortInputs inputPortInfo [ 1 ] ;
_ssSetNumInputPorts ( rts , 1 ) ; ssSetPortInfoForInputs ( rts , &
inputPortInfo [ 0 ] ) ; { static struct _ssInPortUnit inputPortUnits [ 1 ] ;
_ssSetPortInfo2ForInputUnits ( rts , & inputPortUnits [ 0 ] ) ; }
ssSetInputPortUnit ( rts , 0 , 0 ) ; { static struct _ssInPortCoSimAttribute
inputPortCoSimAttribute [ 1 ] ; _ssSetPortInfo2ForInputCoSimAttribute ( rts ,
& inputPortCoSimAttribute [ 0 ] ) ; } ssSetInputPortIsContinuousQuantity (
rts , 0 , 0 ) ; { ssSetInputPortRequiredContiguous ( rts , 0 , 1 ) ;
ssSetInputPortSignal ( rts , 0 , rtB . e4pza2bthg ) ;
_ssSetInputPortNumDimensions ( rts , 0 , 1 ) ; ssSetInputPortWidth ( rts , 0
, 7 ) ; } } { static struct _ssPortOutputs outputPortInfo [ 1 ] ;
ssSetPortInfoForOutputs ( rts , & outputPortInfo [ 0 ] ) ;
_ssSetNumOutputPorts ( rts , 1 ) ; { static struct _ssOutPortUnit
outputPortUnits [ 1 ] ; _ssSetPortInfo2ForOutputUnits ( rts , &
outputPortUnits [ 0 ] ) ; } ssSetOutputPortUnit ( rts , 0 , 0 ) ; { static
struct _ssOutPortCoSimAttribute outputPortCoSimAttribute [ 1 ] ;
_ssSetPortInfo2ForOutputCoSimAttribute ( rts , & outputPortCoSimAttribute [ 0
] ) ; } ssSetOutputPortIsContinuousQuantity ( rts , 0 , 0 ) ; {
_ssSetOutputPortNumDimensions ( rts , 0 , 1 ) ; ssSetOutputPortWidth ( rts ,
0 , 1 ) ; ssSetOutputPortSignal ( rts , 0 , ( ( real_T * ) & rtB . nafhdch12j
) ) ; } } ssSetModelName ( rts , "Wavenet" ) ; ssSetPath ( rts ,
"xobserver/Nonlinear ARX Model/Wavenet" ) ; if ( ssGetRTModel ( rtS ) == (
NULL ) ) { ssSetParentSS ( rts , rtS ) ; ssSetRootSS ( rts , ssGetRootSS (
rtS ) ) ; } else { ssSetRTModel ( rts , ssGetRTModel ( rtS ) ) ;
ssSetParentSS ( rts , ( NULL ) ) ; ssSetRootSS ( rts , rts ) ; } ssSetVersion
( rts , SIMSTRUCT_VERSION_LEVEL2 ) ; { static mxArray * sfcnParams [ 14 ] ;
ssSetSFcnParamsCount ( rts , 14 ) ; ssSetSFcnParamsPtr ( rts , & sfcnParams [
0 ] ) ; ssSetSFcnParam ( rts , 0 , ( mxArray * ) rtP . Wavenet_P1_Size ) ;
ssSetSFcnParam ( rts , 1 , ( mxArray * ) rtP . Wavenet_P2_Size ) ;
ssSetSFcnParam ( rts , 2 , ( mxArray * ) rtP . Wavenet_P3_Size ) ;
ssSetSFcnParam ( rts , 3 , ( mxArray * ) rtP . Wavenet_P4_Size ) ;
ssSetSFcnParam ( rts , 4 , ( mxArray * ) rtP . Wavenet_P5_Size ) ;
ssSetSFcnParam ( rts , 5 , ( mxArray * ) rtP . Wavenet_P6_Size ) ;
ssSetSFcnParam ( rts , 6 , ( mxArray * ) rtP . Wavenet_P7_Size ) ;
ssSetSFcnParam ( rts , 7 , ( mxArray * ) rtP . Wavenet_P8_Size ) ;
ssSetSFcnParam ( rts , 8 , ( mxArray * ) rtP . Wavenet_P9_Size ) ;
ssSetSFcnParam ( rts , 9 , ( mxArray * ) rtP . Wavenet_P10_Size ) ;
ssSetSFcnParam ( rts , 10 , ( mxArray * ) rtP . Wavenet_P11_Size ) ;
ssSetSFcnParam ( rts , 11 , ( mxArray * ) rtP . Wavenet_P12_Size ) ;
ssSetSFcnParam ( rts , 12 , ( mxArray * ) rtP . Wavenet_P13_Size ) ;
ssSetSFcnParam ( rts , 13 , ( mxArray * ) rtP . Wavenet_P14_Size ) ; }
sfunwavenet ( rts ) ; sfcnInitializeSizes ( rts ) ; sfcnInitializeSampleTimes
( rts ) ; ssSetSampleTime ( rts , 0 , 0.1 ) ; ssSetOffsetTime ( rts , 0 , 0.0
) ; sfcnTsMap [ 0 ] = 2 ; ssSetNumNonsampledZCs ( rts , 0 ) ;
_ssSetInputPortConnected ( rts , 0 , 1 ) ; _ssSetOutputPortConnected ( rts ,
0 , 1 ) ; _ssSetOutputPortBeingMerged ( rts , 0 , 0 ) ;
ssSetInputPortBufferDstPort ( rts , 0 , - 1 ) ; } } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = 3 ; void MdlOutputsParameterSampleTime (
int_T tid ) { UNUSED_PARAMETER ( tid ) ; }
