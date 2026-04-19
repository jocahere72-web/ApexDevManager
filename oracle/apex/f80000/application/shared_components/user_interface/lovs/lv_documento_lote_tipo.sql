prompt --application/shared_components/user_interface/lovs/lv_documento_lote_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30508611654463316)
,p_lov_name=>'LV_DOCUMENTO_LOTE_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_dcmnto_lte_tpo as r',
'  from re_d_documento_lote_tipo',
' order by 1'))
);
end;
/
