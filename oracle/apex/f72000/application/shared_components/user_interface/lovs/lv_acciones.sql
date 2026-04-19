prompt --application/shared_components/user_interface/lovs/lv_acciones
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(109115174248672254)
,p_lov_name=>'LV_ACCIONES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, id_accion r ',
'from gj_d_acciones',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      actvo = ''S''',
'order by 1'))
);
end;
/
