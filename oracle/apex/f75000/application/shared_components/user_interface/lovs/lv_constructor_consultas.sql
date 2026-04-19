prompt --application/shared_components/user_interface/lovs/lv_constructor_consultas
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(170909467763816319)
,p_lov_name=>'LV_CONSTRUCTOR_CONSULTAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_cnslta d, a.id_cnslta_mstro r ',
'from  cs_g_consultas_maestro a',
'inner join cs_d_procesos_sql b on a.id_prcso_sql = b.id_prcso_sql',
'where b.cdgo_clnte = :F_CDGO_CLNTE and',
'     b.cdgo_prcso_sql =''MYA'' AND',
'     a.id_cnslta_mstro_gnral is not null ',
'order by 1;'))
);
end;
/
