prompt --application/shared_components/user_interface/lovs/lv_predios_destino
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(105709009473748016)
,p_lov_name=>'LV_PREDIOS_DESTINO'
,p_reference_id=>170059178262214330
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'        id_prdio_dstno r',
'   from df_i_predios_destino',
'   order by id_prdio_dstno'))
);
end;
/
