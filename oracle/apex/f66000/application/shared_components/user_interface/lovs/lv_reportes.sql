prompt --application/shared_components/user_interface/lovs/lv_reportes
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(35998761187985287)
,p_lov_name=>'LV_REPORTES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_rprte as d',
'       , id_rprte as r ',
'    from gn_d_reportes',
'   where actvo = ''S''',
'     and indcdor_gnrco = ''N''',
'order by d'))
);
end;
/
