prompt --application/shared_components/user_interface/lovs/lv_departamentos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103266219381132832)
,p_lov_name=>'LV_DEPARTAMENTOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
);
end;
/
