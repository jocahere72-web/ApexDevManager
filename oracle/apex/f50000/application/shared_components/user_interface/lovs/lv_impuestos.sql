prompt --application/shared_components/user_interface/lovs/lv_impuestos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(97006044069688544)
,p_lov_name=>'LV_IMPUESTOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
);
end;
/
