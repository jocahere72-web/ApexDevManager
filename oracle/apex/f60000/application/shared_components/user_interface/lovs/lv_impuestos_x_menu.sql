prompt --application/shared_components/user_interface/lovs/lv_impuestos_x_menu
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(45492881932916898)
,p_lov_name=>'LV_IMPUESTOS_X_MENU'
,p_reference_id=>45295930315960964
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto a',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and a.actvo            = ''S'''))
);
end;
/
