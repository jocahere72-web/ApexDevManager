prompt --application/shared_components/user_interface/lovs/recurso_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(74260470993327460)
,p_lov_name=>'RECURSO_ESTADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_rcrso_estdo||'' - ''||dscrpcion D, cdgo_rcrso_estdo R',
'from gt_d_recursos_estados',
'where cdgo_clnte    = :F_CDGO_CLNTE and',
'      actvo         = ''S'''))
);
end;
/
