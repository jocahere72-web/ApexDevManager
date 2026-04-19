prompt --application/shared_components/user_interface/lovs/lv_modificacion_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(107563133646143626)
,p_lov_name=>'LV_MODIFICACION_ESTADO'
,p_lov_query=>'select d.dscrpcion,d.cdgo_cnvnio_mdfccion_estdo from gf_d_convenios_mdfccn_estdo d;'
);
end;
/
