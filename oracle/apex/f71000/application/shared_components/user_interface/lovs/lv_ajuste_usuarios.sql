prompt --application/shared_components/user_interface/lovs/lv_ajuste_usuarios
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(37993704101787216)
,p_lov_name=>'LV_AJUSTE_USUARIOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  DISTINCT a.nmbre_trcro as d,b.id_usrio as r from v_sg_g_usuarios a',
'join v_gf_g_ajustes     b on a.id_usrio = b.id_usrio ',
'order by 1'))
);
end;
/
