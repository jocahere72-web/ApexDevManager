prompt --application/shared_components/user_interface/lovs/lv_estado_proceso_carga
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(157572618932393654)
,p_lov_name=>'LV_ESTADO_PROCESO_CARGA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_estdo_prcso,',
'       cdgo_prcso_estdo',
'  from et_d_procesos_estado'))
);
end;
/
