prompt --application/shared_components/user_interface/lovs/lv_lotes_en_proceso
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(44128734054336209)
,p_lov_name=>'LV_LOTES_EN_PROCESO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_lte||'' - ''||dscrpcion d, id_lte r ',
'from nt_g_lote',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      cdgo_estdo_lte = ''EPR'''))
);
end;
/
