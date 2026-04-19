prompt --application/shared_components/user_interface/lovs/lv_prescripciones_vldcion
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(78861582922911881)
,p_lov_name=>'LV_PRESCRIPCIONES_VLDCION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion',
'           ,a.id_vldcion',
'from        gf_d_prescripciones_vldcion     a'))
);
end;
/
