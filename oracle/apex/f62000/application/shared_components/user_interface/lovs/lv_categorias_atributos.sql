prompt --application/shared_components/user_interface/lovs/lv_categorias_atributos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(110396886253717452)
,p_lov_name=>'LV_CATEGORIAS_ATRIBUTOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_CTGRIA_TPO,',
'       CDGO_CTGRIA_TPO',
'  from WF_D_CATEGORIAS_TIPO',
' order by DSCRPCION_CTGRIA_TPO'))
);
end;
/
