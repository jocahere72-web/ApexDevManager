prompt --application/shared_components/user_interface/lovs/lv_subimpuestos_x_usuario
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(45576402153303469)
,p_lov_name=>'LV_SUBIMPUESTOS_X_USUARIO'
,p_reference_id=>45571255374297866
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto,',
'       id_impsto_sbmpsto',
'  from table (pkg_sg_autorizacion.fnc_sub_impuestos_x_usuario(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                              p_id_usrio   => :F_ID_USRIO))',
'order by 1'))
);
end;
/
