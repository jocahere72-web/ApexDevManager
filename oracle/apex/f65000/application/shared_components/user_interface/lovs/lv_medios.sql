prompt --application/shared_components/user_interface/lovs/lv_medios
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(37021067314006038)
,p_lov_name=>'LV_MEDIOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select CDGO_MDIO||'' - ''||DSCRPCION d, ID_MDIO r',
'From nt_d_medio',
'order by 2'))
);
end;
/
