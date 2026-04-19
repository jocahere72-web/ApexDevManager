prompt --application/shared_components/user_interface/lovs/lv_entidad
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(184441006378060266)
,p_lov_name=>'LV_ENTIDAD'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_entdad d,',
'           id_entdad r',
'from ge_p_entidad',
'order by 1'))
);
end;
/
