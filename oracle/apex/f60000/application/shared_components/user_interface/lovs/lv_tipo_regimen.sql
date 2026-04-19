prompt --application/shared_components/user_interface/lovs/lv_tipo_regimen
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103269756839132841)
,p_lov_name=>'LV_TIPO_REGIMEN'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rgmen_tpo,',
'       cdgo_rgmen_tpo',
'  from df_c_regimenes_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and (',
'        to_date(to_char(systimestamp,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'        between',
'       to_date(to_char(fcha_dsde,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'       and',
'       to_date(to_char(fcha_hsta,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'       )',
' order by nmbre_rgmen_tpo'))
);
end;
/
