prompt --application/shared_components/user_interface/lovs/lv_tipo_responsable
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(70591738739699933)
,p_lov_name=>'LV_TIPO_RESPONSABLE'
,p_reference_id=>49526326477084964
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo d,',
'       cdgo_rspnsble_tpo r',
'  from df_s_responsables_tipo',
'  order by 1;'))
);
end;
/
