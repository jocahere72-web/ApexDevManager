prompt --application/shared_components/user_interface/lovs/lv_tpo_acto_nvddes_prdial
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(112463697198017380)
,p_lov_name=>'LV_TPO_ACTO_NVDDES_PRDIAL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select dscrpcion as d',
'         , id_acto_tpo as r',
'      from gn_d_actos_tipo',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and cdgo_acto_tpo in ( select cdna',
'                                from table ( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna => ( pkg_gn_generalidades.fnc_cl_defniciones_cliente ( p_cdgo_clnte 			     => :F_CDGO_CLNTE',
'                                                                                                                                                   , p_cdgo_dfncion_clnte_ctgria => ''NDP''',
'                                                                                                                                                   , p_cdgo_dfncion_clnte		 => ''NPA'' ))',
'                                                                                     , p_crcter_dlmtdor => '','' )))',
'  order by 1'))
);
end;
/
