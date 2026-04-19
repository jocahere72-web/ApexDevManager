prompt --application/shared_components/user_interface/lovs/lv_tasa_diaria_formula
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(99034517800743843)
,p_lov_name=>'LV_TASA_DIARIA_FORMULA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_tsa_dria_frmla as r',
'  from df_s_tasa_diaria_formula',
' order by 1'))
);
end;
/
