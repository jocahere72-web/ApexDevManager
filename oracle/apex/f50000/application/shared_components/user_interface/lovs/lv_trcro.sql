prompt --application/shared_components/user_interface/lovs/lv_trcro
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(31789701592576549)
,p_lov_name=>'LV_TRCRO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || idntfccion || '']'' d , ',
'       id_trcro r ',
'  from v_si_c_terceros',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
