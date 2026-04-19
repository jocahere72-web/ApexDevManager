prompt --application/shared_components/user_interface/lovs/lv_revocatoria_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(110297091647081958)
,p_lov_name=>'LV_REVOCATORIA_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion || '' ['' || cdgo_rvctria_tpo  || '']'' as d,',
'       cdgo_rvctria_tpo as r',
'  from gf_d_revocatoria_tipo',
' order by 1'))
);
end;
/
