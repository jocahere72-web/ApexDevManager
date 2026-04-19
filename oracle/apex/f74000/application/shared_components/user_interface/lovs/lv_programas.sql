prompt --application/shared_components/user_interface/lovs/lv_programas
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(37756528428923004)
,p_lov_name=>'LV_PROGRAMAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.nmbre_prgrma as d,',
'        p.id_prgrma as r',
'from fi_d_programas p;'))
);
end;
/
