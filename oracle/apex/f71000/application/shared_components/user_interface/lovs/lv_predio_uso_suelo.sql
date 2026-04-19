prompt --application/shared_components/user_interface/lovs/lv_predio_uso_suelo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(177371613137050686)
,p_lov_name=>'LV_PREDIO_USO_SUELO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'       id_prdio_uso_slo r',
'  from df_c_predios_uso_suelo',
' order by 1;'))
);
end;
/
