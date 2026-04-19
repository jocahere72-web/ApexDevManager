prompt --application/shared_components/user_interface/lovs/lv_entidades
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30508906523463316)
,p_lov_name=>'LV_ENTIDADES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_entdad || '' - '' || idntfccion  as d,',
'       id_entdad as r',
'  from df_i_entidades',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
