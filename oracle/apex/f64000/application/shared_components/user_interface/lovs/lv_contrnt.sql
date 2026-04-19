prompt --application/shared_components/user_interface/lovs/lv_contrnt
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(104502686325252130)
,p_lov_name=>'LV_CONTRNT'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CNSTRNT_NME d ,',
'       CNSTRNT_NME r ',
'from sg_g_manejos_error',
'order by 1'))
);
end;
/
