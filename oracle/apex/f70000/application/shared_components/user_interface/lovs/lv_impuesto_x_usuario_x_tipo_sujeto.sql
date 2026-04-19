prompt --application/shared_components/user_interface/lovs/lv_impuesto_x_usuario_x_tipo_sujeto
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(39677077214266803)
,p_lov_name=>'LV_IMPUESTO_X_USUARIO_X_TIPO_SUJETO'
,p_reference_id=>45322424948105624
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'  and b.cdgo_sjto_tpo = ''E''',
'order by 1'))
);
end;
/
