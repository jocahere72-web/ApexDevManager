prompt --application/shared_components/user_interface/lovs/lv_nombre_pag_log
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(104511179432345305)
,p_lov_name=>'LV_NOMBRE_PAG_LOG'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct PAGE_NAME d ,',
'       PAGE_NAME r ',
'from V_SG_G_LOG_ERROR',
'order by 1'))
);
end;
/
