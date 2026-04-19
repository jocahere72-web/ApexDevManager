prompt --application/shared_components/user_interface/lovs/lv_exenciones_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(80773162668013622)
,p_lov_name=>'LV_EXENCIONES_ESTADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_exncion_estdo as r',
'  from gf_d_exenciones_estado',
' order by 1'))
);
end;
/
