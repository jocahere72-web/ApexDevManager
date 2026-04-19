prompt --application/shared_components/user_interface/lovs/lv_impuestos_x_menu_x_usuario
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(82842738512758454)
,p_lov_name=>'LV_IMPUESTOS_X_MENU_X_USUARIO'
,p_reference_id=>45296747368022513
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO',
'   and a.actvo            = ''S''',
'   and b.actvo            = ''S''',
'order by 1'))
);
end;
/
