prompt --application/shared_components/user_interface/lovs/lv_indicadores_economicos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(201846018433254392)
,p_lov_name=>'LV_INDICADORES_ECONOMICOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.nmbre_indcdor_tpo,',
'       i.id_indcdor_ecnmco',
'  from df_s_indicadores_economico i, df_s_indicadores_tipo t',
' where i.cdgo_indcdor_tpo = t.cdgo_indcdor_tpo',
'   and (',
'        to_date(to_char(systimestamp,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'        between',
'       to_date(to_char(fcha_dsde,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'       and',
'       to_date(to_char(fcha_hsta,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'       )',
' order by t.nmbre_indcdor_tpo'))
);
end;
/
