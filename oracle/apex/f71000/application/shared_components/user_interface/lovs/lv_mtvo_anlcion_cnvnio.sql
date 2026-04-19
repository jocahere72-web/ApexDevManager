prompt --application/shared_components/user_interface/lovs/lv_mtvo_anlcion_cnvnio
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(99263741444912819)
,p_lov_name=>'LV_MTVO_ANLCION_CNVNIO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'        id_mtvo_anlcn as r',
' from gf_d_anulacion_motivo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'    and actvo = ''S''',
' order by 1;'))
);
end;
/
