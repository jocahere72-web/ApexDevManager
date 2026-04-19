prompt --application/shared_components/user_interface/lovs/lv_definicion_cliente_ctgria
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(177368848565050681)
,p_lov_name=>'LV_DEFINICION_CLIENTE_CTGRIA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_dfncion_clnte_ctgria d',
'             ,id_dfncion_clnte_ctgria r ',
'from df_c_definiciones_clnte_ctgria',
'where cdgo_clnte = :F_CDGO_CLNTE',
'order by 1;'))
);
end;
/
