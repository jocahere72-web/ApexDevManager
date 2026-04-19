prompt --application/shared_components/user_interface/lovs/lv_impuesto_subimpuesto
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(177369818921050685)
,p_lov_name=>'LV_IMPUESTO_SUBIMPUESTO'
,p_reference_id=>97088332924527483
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
);
end;
/
