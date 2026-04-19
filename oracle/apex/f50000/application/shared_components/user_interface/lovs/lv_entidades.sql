prompt --application/shared_components/user_interface/lovs/lv_entidades
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(76484135142920970)
,p_lov_name=>'LV_ENTIDADES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rzon_scial',
'        , id_entdad ',
'     from df_s_entidades ',
' order by nmbre_rzon_scial;'))
);
end;
/
