prompt --application/shared_components/user_interface/lovs/flujo_tarea
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(76289744223016945)
,p_lov_name=>'FLUJO_TAREA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trea,',
'       id_fljo_trea ',
'  from v_wf_d_flujos_tarea ',
' where cdgo_clnte = :F_CDGO_CLNTE and ',
'       cdgo_fljo  = ''GTR'';'))
);
end;
/
