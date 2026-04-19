prompt --application/shared_components/user_interface/lovs/lv_estado_convenio
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(73447397842440014)
,p_lov_name=>'LV_ESTADO_CONVENIO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(dscrpcion) as d,',
'       cdgo_cnvnio_estdo as r',
'  from gf_d_convenios_estado',
' order by 1;'))
);
end;
/
