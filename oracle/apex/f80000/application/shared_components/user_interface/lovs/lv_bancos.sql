prompt --application/shared_components/user_interface/lovs/lv_bancos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30503244289463314)
,p_lov_name=>'LV_BANCOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'  order by cdgo_bnco'))
);
end;
/
