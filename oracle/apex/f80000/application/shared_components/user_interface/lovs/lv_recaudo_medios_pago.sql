prompt --application/shared_components/user_interface/lovs/lv_recaudo_medios_pago
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30517717162463320)
,p_lov_name=>'LV_RECAUDO_MEDIOS_PAGO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_rcdo_mdio_pgo || '' - '' || dscrpcion as d',
'     , cdgo_rcdo_mdio_pgo as r',
' from re_d_recaudo_medios_pago'))
);
end;
/
