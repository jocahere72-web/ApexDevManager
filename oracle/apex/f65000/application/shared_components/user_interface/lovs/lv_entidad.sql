prompt --application/shared_components/user_interface/lovs/lv_entidad
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(31392956882416662)
,p_lov_name=>'LV_ENTIDAD'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.cdgo_entdad||'' - ''||e.dscrpcion as display_value, e.cdgo_entdad as return_value ',
'from nt_d_entidad e ',
'left join nt_d_entidad_cliente ec on e.cdgo_entdad = ec.cdgo_entdad and ',
'                                     ec.cdgo_clnte = :f_cdgo_clnte',
'Where ec.cdgo_clnte is Null;'))
);
end;
/
