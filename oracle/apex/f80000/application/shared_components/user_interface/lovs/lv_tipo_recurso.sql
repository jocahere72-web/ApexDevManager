prompt --application/shared_components/user_interface/lovs/lv_tipo_recurso
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30525426316463323)
,p_lov_name=>'LV_TIPO_RECURSO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       cdgo_rcrso_tpo',
'  from gj_d_recursos_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
);
end;
/
