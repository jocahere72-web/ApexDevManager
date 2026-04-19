prompt --application/shared_components/user_interface/lovs/lv_tipo_formatos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(35992561545866237)
,p_lov_name=>'LV_TIPO_FORMATOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion D ,cdgo_frmto_tpo R',
'  from df_s_formatos_tipo',
' order by 1'))
);
end;
/
