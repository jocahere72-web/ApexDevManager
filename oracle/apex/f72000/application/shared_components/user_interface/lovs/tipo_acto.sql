prompt --application/shared_components/user_interface/lovs/tipo_acto
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(75258428962628056)
,p_lov_name=>'TIPO_ACTO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, id_acto_tpo r',
'from gn_d_actos_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'order by 1'))
);
end;
/
