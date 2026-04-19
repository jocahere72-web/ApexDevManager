prompt --application/shared_components/user_interface/lovs/lv_convenio_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(85303129498509468)
,p_lov_name=>'LV_CONVENIO_ESTADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_cnvnio_estdo as r',
'  from gf_d_convenios_estado',
' order by 1'))
);
end;
/
