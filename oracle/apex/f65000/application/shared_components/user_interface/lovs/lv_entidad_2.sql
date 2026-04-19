prompt --application/shared_components/user_interface/lovs/lv_entidad_2
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(41217896212605370)
,p_lov_name=>'LV_ENTIDAD_2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.cdgo_entdad||'' - ''||e.dscrpcion as display_value, e.cdgo_entdad as return_value ',
'from nt_d_entidad e',
'order by 1'))
);
end;
/
