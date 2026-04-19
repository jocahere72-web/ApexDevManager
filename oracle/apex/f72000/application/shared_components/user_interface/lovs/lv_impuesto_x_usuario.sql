prompt --application/shared_components/user_interface/lovs/lv_impuesto_x_usuario
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(118971348598036858)
,p_lov_name=>'LV_IMPUESTO_X_USUARIO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
);
end;
/
