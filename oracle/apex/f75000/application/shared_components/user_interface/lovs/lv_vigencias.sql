prompt --application/shared_components/user_interface/lovs/lv_vigencias
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(82985243259908691)
,p_lov_name=>'LV_VIGENCIAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
);
end;
/
