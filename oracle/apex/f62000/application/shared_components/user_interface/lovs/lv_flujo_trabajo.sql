prompt --application/shared_components/user_interface/lovs/lv_flujo_trabajo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(102655522517182207)
,p_lov_name=>'LV_FLUJO_TRABAJO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_fljo as d,',
'       id_fljo as r',
'  from v_wf_d_flujos',
'where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
