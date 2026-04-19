prompt --application/shared_components/user_interface/lovs/lv_tipo_accion
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(110260515948363577)
,p_lov_name=>'LV_TIPO_ACCION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_accion_tpo,',
'       cdgo_accion_tpo',
'  from wf_d_acciones_tipo',
' order by dscrpcion_accion_tpo'))
);
end;
/
