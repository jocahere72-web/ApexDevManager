prompt --application/shared_components/user_interface/lovs/lv_parametros
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5525775350474750)
,p_lov_name=>'LV_PARAMETROS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre d, id_envio_prmtro r ',
'from ma_d_envios_parametro',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      actvo = ''S''',
'order by 1'))
);
end;
/
