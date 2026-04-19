prompt --application/shared_components/user_interface/lovs/lv_subprograma
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(37757016383930134)
,p_lov_name=>'LV_SUBPROGRAMA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  s.nmbre_sbprgrma as d,',
'        s.id_sbprgrma as r',
'from fi_d_subprogramas s where id_prgrma = :P64_ID_PRGMRA;'))
);
end;
/
