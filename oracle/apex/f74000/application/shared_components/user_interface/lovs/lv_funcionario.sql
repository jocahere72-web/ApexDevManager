prompt --application/shared_components/user_interface/lovs/lv_funcionario
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(37765401359970759)
,p_lov_name=>'LV_FUNCIONARIO'
,p_reference_id=>96857284132589171
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_trcro as d,',
'       a.id_fncnrio  as r',
'from df_c_funcionarios a ',
'join v_si_c_terceros   b  on a.id_trcro = b.id_trcro',
'join df_c_oficinas     c  on a.id_ofcna = c.id_ofcna',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'--and c.nmbre_ofcna = ''FISCALIZACION''',
'order by b.nmbre_trcro;'))
);
end;
/
