prompt --application/shared_components/user_interface/lovs/lv_formatos_tipo_archivo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5107735532969315)
,p_lov_name=>'LV_FORMATOS_TIPO_ARCHIVO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_frmto_tpo as r',
'  from df_s_formatos_tipo',
' order by 1'))
);
end;
/
