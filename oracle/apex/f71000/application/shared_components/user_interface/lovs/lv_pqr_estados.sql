prompt --application/shared_components/user_interface/lovs/lv_pqr_estados
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7082297256565227)
,p_lov_name=>'LV_PQR_ESTADOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'      cdgo_rspsta as r       ',
'  from pq_d_respuestas;'))
);
end;
/
