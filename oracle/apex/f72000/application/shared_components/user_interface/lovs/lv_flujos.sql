prompt --application/shared_components/user_interface/lovs/lv_flujos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(107711099848175493)
,p_lov_name=>'LV_FLUJOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion_fljo d, id_fljo r',
'from v_wf_d_flujos',
'where cdgo_clnte = :F_CDGO_CLNTE',
'order by 1'))
);
end;
/
