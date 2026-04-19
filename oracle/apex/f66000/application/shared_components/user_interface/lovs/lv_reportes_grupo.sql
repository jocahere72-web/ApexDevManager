prompt --application/shared_components/user_interface/lovs/lv_reportes_grupo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(35991096886804946)
,p_lov_name=>'LV_REPORTES_GRUPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion D, ',
'       cdgo_rprte_grpo R ',
'  from gn_d_reportes_grupo',
' order by 1'))
);
end;
/
