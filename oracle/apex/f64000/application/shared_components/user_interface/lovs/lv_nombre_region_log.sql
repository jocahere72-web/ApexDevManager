prompt --application/shared_components/user_interface/lovs/lv_nombre_region_log
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(104511445200353294)
,p_lov_name=>'LV_NOMBRE_REGION_LOG'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select REGION_NAME d ,',
'       REGION_NAME r ',
'from V_SG_G_LOG_ERROR',
'order by 1'))
);
end;
/
