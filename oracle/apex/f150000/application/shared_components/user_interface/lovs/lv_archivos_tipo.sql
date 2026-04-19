prompt --application/shared_components/user_interface/lovs/lv_archivos_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(157215151734784260)
,p_lov_name=>'LV_ARCHIVOS_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_ARCHVO_TPO d ,',
'       CDGO_ARCHVO_TPO r ',
'from ET_D_ARCHIVOS_TIPO',
'order by 1'))
);
end;
/
