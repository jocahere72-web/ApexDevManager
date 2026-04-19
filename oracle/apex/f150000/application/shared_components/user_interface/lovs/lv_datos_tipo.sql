prompt --application/shared_components/user_interface/lovs/lv_datos_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(157214602228761649)
,p_lov_name=>'LV_DATOS_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_dto_tpo d ,',
'       cdgo_dto_tpo r ',
'from ET_D_DATOS_TIPO ',
'order by 1'))
);
end;
/
