prompt --application/shared_components/user_interface/lovs/lv_indicadores_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(76280037220089826)
,p_lov_name=>'LV_INDICADORES_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_indcdor_tpo',
'        , cdgo_indcdor_tpo',
'     from df_s_indicadores_tipo',
' order by nmbre_indcdor_tpo'))
);
end;
/
