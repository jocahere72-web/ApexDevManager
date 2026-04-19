prompt --application/shared_components/user_interface/lovs/lv_impuesto_subimpuesto
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30510715311463317)
,p_lov_name=>'LV_IMPUESTO_SUBIMPUESTO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(NMBRE_IMPSTO_SBMPSTO)  as d,',
'       ID_IMPSTO_SBMPSTO as r',
'  from DF_I_IMPUESTOS_SUBIMPUESTO',
'',
' order by 1'))
);
end;
/
