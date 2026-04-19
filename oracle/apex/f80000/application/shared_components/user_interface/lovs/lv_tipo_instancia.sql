prompt --application/shared_components/user_interface/lovs/lv_tipo_instancia
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30525157254463323)
,p_lov_name=>'LV_TIPO_INSTANCIA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_instncia_tpo,',
'       cdgo_instncia_tpo',
'  from gj_d_instancias_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and actvo = ''S'';'))
);
end;
/
