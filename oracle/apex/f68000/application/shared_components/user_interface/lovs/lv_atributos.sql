prompt --application/shared_components/user_interface/lovs/lv_atributos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(72032961050839152)
,p_lov_name=>'LV_ATRIBUTOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_ATRBTO,',
'       ID_ATRBTO',
'  from WF_D_ATRIBUTOS',
' order by NMBRE_ATRBTO'))
);
end;
/
