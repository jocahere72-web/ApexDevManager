prompt --application/shared_components/user_interface/lovs/lv_carga
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103183330598437890)
,p_lov_name=>'LV_CARGA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_crga,',
'       id_crga',
'  from et_g_carga ',
'  where not id_crga in (',
'                          select id_crga ',
'                            from df_s_resolucion_carga',
'                      )',
' order by nmbre_crga'))
);
end;
/
