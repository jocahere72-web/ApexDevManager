prompt --application/shared_components/user_interface/lovs/lv_destinos_igac
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(170842453355160338)
,p_lov_name=>'LV_DESTINOS_IGAC'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dstno_igac d,',
'       cdgo_dstno_igac r',
'  from df_s_destinos_igac',
' order by cdgo_dstno_igac'))
);
end;
/
