prompt --application/shared_components/user_interface/lovs/lv_identificaciones_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(70586543772699932)
,p_lov_name=>'LV_IDENTIFICACIONES_TIPO'
,p_reference_id=>177367519527050681
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
);
end;
/
