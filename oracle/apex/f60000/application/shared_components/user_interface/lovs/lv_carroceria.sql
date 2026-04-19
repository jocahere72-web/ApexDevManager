prompt --application/shared_components/user_interface/lovs/lv_carroceria
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103265886158132831)
,p_lov_name=>'LV_CARROCERIA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CRROCRIA as d,',
'       CDGO_VHCLO_CRRCRIA as r',
'  from DF_S_VEHICULOS_CARROCERIA',
' order by 1'))
);
end;
/
