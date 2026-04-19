prompt --application/shared_components/user_interface/lovs/lv_motivos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(93844643998852561)
,p_lov_name=>'LV_MOTIVOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'       id_mtvo r',
'from gj_d_motivos',
'where actvo = ''S''',
'order by 1'))
);
end;
/
