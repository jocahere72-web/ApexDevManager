prompt --application/shared_components/user_interface/lovs/lv_formularios
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103260882175139260)
,p_lov_name=>'LV_FORMULARIOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  cdgo_frmlrio||'' - ''||dscrpcion d,id_frmlrio r ',
'from    gi_d_formularios',
'where   cdgo_clnte  =   :F_CDGO_CLNTE',
'order by 1;'))
);
end;
/
