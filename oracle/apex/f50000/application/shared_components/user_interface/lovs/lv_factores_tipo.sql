prompt --application/shared_components/user_interface/lovs/lv_factores_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(77861562247036370)
,p_lov_name=>'LV_FACTORES_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as l',
'      , cdgo_fctor_tpo as k',
'   from df_s_factores_tipo'))
);
end;
/
