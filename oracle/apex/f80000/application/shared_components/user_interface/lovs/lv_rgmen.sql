prompt --application/shared_components/user_interface/lovs/lv_rgmen
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30519500199463320)
,p_lov_name=>' LV_RGMEN'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rgmen_tpo d ,',
'       cdgo_rgmen_tpo r ',
'from DF_C_REGIMENES_TIPO',
'order by 1'))
);
end;
/
