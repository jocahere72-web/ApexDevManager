prompt --application/shared_components/user_interface/lovs/lv_recursos_respuesta
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(119421784352708172)
,p_lov_name=>'LV_RECURSOS_RESPUESTA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, cdgo_rspta r ',
'from gj_d_recursos_respuesta',
'where actvo           = ''S'' and',
'      indcdor_slccion = ''S''',
'order by 1 asc'))
);
end;
/
