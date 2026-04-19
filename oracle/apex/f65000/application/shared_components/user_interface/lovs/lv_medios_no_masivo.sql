prompt --application/shared_components/user_interface/lovs/lv_medios_no_masivo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(41181451391295061)
,p_lov_name=>'LV_MEDIOS_NO_MASIVO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select CDGO_MDIO||'' - ''||DSCRPCION d, ID_MDIO r',
'From nt_d_medio',
'where indcdor_msvo = ''S''',
'order by 2'))
);
end;
/
