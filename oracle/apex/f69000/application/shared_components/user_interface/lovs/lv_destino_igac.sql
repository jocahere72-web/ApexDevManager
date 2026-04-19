prompt --application/shared_components/user_interface/lovs/lv_destino_igac
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(36633940993434815)
,p_lov_name=>'LV_DESTINO_IGAC'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_dstno_igac || '' - '' || nmbre_dstno_igac as l',
'     , cdgo_dstno_igac as v',
'  from df_s_destinos_igac'))
);
end;
/
