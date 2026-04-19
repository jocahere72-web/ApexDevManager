prompt --application/shared_components/user_interface/lovs/tipo_recurso_cliente
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(92276227492351936)
,p_lov_name=>'TIPO_RECURSO_CLIENTE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion d, a.id_rcrso_tipo_clnte r',
'from gj_d_recursos_tipo_cliente a',
'inner join gj_d_recursos_tipo b on a.cdgo_rcrso_tpo = b.cdgo_rcrso_tpo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'order by 1'))
);
end;
/
