prompt --application/shared_components/user_interface/lovs/lv_saldos_fvor_mvmnts_tpo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(119731677492445340)
,p_lov_name=>'LV_SALDOS_FVOR_MVMNTS_TPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,',
'       a.id_sldos_fvor_mvmnto_tpo',
'from gf_d_saldos_fvor_mvmnts_tpo a',
'where a.id_sldos_fvor_mvmnto_tpo in (2,3)',
'order by a.id_sldos_fvor_mvmnto_tpo;'))
);
end;
/
