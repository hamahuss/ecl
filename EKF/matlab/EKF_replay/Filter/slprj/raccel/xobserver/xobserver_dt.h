#include "__cf_xobserver.h"
#include "ext_types.h"
static uint_T rtDataTypeSizes [ ] = { sizeof ( real_T ) , sizeof ( real32_T )
, sizeof ( int8_T ) , sizeof ( uint8_T ) , sizeof ( int16_T ) , sizeof (
uint16_T ) , sizeof ( int32_T ) , sizeof ( uint32_T ) , sizeof ( boolean_T )
, sizeof ( fcn_call_T ) , sizeof ( int_T ) , sizeof ( pointer_T ) , sizeof (
action_T ) , 2 * sizeof ( uint32_T ) } ; static const char_T *
rtDataTypeNames [ ] = { "real_T" , "real32_T" , "int8_T" , "uint8_T" ,
"int16_T" , "uint16_T" , "int32_T" , "uint32_T" , "boolean_T" , "fcn_call_T"
, "int_T" , "pointer_T" , "action_T" , "timer_uint32_pair_T" } ; static
DataTypeTransition rtBTransitions [ ] = { { ( char_T * ) ( & rtB . cko1stawzg
[ 0 ] ) , 0 , 0 , 29 } , { ( char_T * ) ( & rtB . pao1bblb11 . gle2tr3y42 ) ,
0 , 0 , 1 } , { ( char_T * ) ( & rtB . fsf2hml1ec . gle2tr3y42 ) , 0 , 0 , 1
} , { ( char_T * ) ( & rtDW . awvthnja1g [ 0 ] ) , 0 , 0 , 27 } , { ( char_T
* ) ( & rtDW . oikx21ant2 . TimePtr ) , 11 , 0 , 15 } , { ( char_T * ) ( &
rtDW . hivvmfmqqm [ 0 ] ) , 7 , 0 , 5 } , { ( char_T * ) ( & rtDW .
j2h32kzhbr . PrevIndex ) , 10 , 0 , 2 } } ; static DataTypeTransitionTable
rtBTransTable = { 7U , rtBTransitions } ; static DataTypeTransition
rtPTransitions [ ] = { { ( char_T * ) ( & rtP . NoiseBlock_Cov ) , 0 , 0 ,
7674 } } ; static DataTypeTransitionTable rtPTransTable = { 1U ,
rtPTransitions } ;
