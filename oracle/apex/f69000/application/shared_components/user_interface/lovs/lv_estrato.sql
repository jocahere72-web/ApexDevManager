prompt --application/shared_components/user_interface/lovs/lv_estrato
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(105706191955748001)
,p_lov_name=>'LV_ESTRATO'
,p_reference_id=>172389176370562101
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_estrto d,',
'        cdgo_estrto r',
'   from df_s_estratos',
'   order by r;'))
);
end;
/
