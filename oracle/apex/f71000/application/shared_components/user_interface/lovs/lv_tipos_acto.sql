prompt --application/shared_components/user_interface/lovs/lv_tipos_acto
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(34698605321329966)
,p_lov_name=>'LV_TIPOS_ACTO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION as d,',
'       id_acto_tpo  as r',
'      from GN_D_ACTOS_TIPO',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'      order by 1'))
);
end;
/
