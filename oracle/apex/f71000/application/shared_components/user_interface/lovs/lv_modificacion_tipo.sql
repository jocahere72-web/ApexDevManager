prompt --application/shared_components/user_interface/lovs/lv_modificacion_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(105443396561407120)
,p_lov_name=>'LV_MODIFICACION_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.dscrpcion as d',
'       ,t.cdgo_cnvnio_mdfccion_tpo as r',
'  from gf_d_convenios_mdfccn_tpo t',
'order by 1;'))
);
end;
/
