prompt --application/shared_components/user_interface/lovs/lv_subimpuesto_adjunto_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(84660955306007784)
,p_lov_name=>'LV_SUBIMPUESTO_ADJUNTO_TIPO'
,p_reference_id=>84647677146850578
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_adjnto_tpo as d,',
'       id_sbmpto_adjnto_tpo as r',
'  from gi_d_subimpuestoS_adjnto_tp',
' order by 1'))
);
end;
/
