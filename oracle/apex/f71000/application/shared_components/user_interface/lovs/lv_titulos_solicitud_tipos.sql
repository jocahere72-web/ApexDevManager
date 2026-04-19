prompt --application/shared_components/user_interface/lovs/lv_titulos_solicitud_tipos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(13827868193471521)
,p_lov_name=>'LV_TITULOS_SOLICITUD_TIPOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d',
'       , cdgo_ttlo_jdcial_slctud_tpo r',
'  from gf_d_ttlos_jdcial_slctud_tp',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
);
end;
/
