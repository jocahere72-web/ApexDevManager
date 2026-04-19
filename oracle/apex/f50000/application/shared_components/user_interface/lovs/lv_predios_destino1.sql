prompt --application/shared_components/user_interface/lovs/lv_predios_destino1
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(170077788704217626)
,p_lov_name=>'LV_PREDIOS_DESTINO1'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'        id_prdio_dstno r',
'   from df_i_predios_destino ',
'   where cdgo_clnte = :F_CDGO_CLNTE',
'   order by dscrpcion'))
);
end;
/
