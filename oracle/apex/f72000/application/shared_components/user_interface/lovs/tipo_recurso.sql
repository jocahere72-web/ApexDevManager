prompt --application/shared_components/user_interface/lovs/tipo_recurso
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(74149839078674709)
,p_lov_name=>'TIPO_RECURSO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_rcrso_tpo||'' - ''||dscrpcion D, cdgo_rcrso_tpo R',
'from gj_d_recursos_tipo;'))
);
end;
/
