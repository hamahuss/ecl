#include "__cf_xobserver.h"
#ifndef RTW_HEADER_xobserver_cap_host_h_
#define RTW_HEADER_xobserver_cap_host_h_
#ifdef HOST_CAPI_BUILD
#include "rtw_capi.h"
#include "rtw_modelmap.h"
typedef struct { rtwCAPI_ModelMappingInfo mmi ; }
xobserver_host_DataMapInfo_T ;
#ifdef __cplusplus
extern "C" {
#endif
void xobserver_host_InitializeDataMapInfo ( xobserver_host_DataMapInfo_T *
dataMap , const char * path ) ;
#ifdef __cplusplus
}
#endif
#endif
#endif
