prompt --application/shared_components/user_interface/lovs/lv_metodos_distribucion
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(76807184626270027)
,p_lov_name=>'LV_METODOS_DISTRIBUCION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre as l',
'     , id_mtdo_dstrbcion as k',
'  from df_s_metodos_distribucion',
' where actvo = ''S'''))
);
end;
/
