prompt --application/shared_components/user_interface/lovs/lv_tpo_sjto
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103269843921132841)
,p_lov_name=>'LV_TPO_SJTO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_sjto_tpo as d, ',
'       cdgo_sjto_tpo as r ',
'  from df_s_sujetos_tipo',
'order by 1'))
);
end;
/
