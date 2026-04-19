prompt --application/shared_components/user_interface/lovs/lv_aplicaciones
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(110297902279228048)
,p_lov_name=>' LV_APLICACIONES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct nmbre_aplccion,',
'       id_aplccion',
'  from v_sg_g_aplicaciones_cliente ',
' where cdgo_clnte = :F_CDGO_CLNTE',
'order by nmbre_aplccion;'))
);
end;
/
