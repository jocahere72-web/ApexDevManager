prompt --application/shared_components/user_interface/lovs/lv_periodo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30516514611463319)
,p_lov_name=>'LV_PERIODO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'         id_prdo r ',
'  from df_i_periodos',
' order by 1'))
);
end;
/
