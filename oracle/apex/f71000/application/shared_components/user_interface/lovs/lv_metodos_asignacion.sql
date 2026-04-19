prompt --application/shared_components/user_interface/lovs/lv_metodos_asignacion
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(177370494893050685)
,p_lov_name=>'LV_METODOS_ASIGNACION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       cdgo_mtdo_asgncion',
'  from df_s_metodos_asignacion'))
);
end;
/
