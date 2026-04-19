prompt --application/shared_components/user_interface/lovs/lv_sujeto_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(72869312659195913)
,p_lov_name=>'LV_SUJETO_ESTADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_sjto_estdo as d,',
'       id_sjto_estdo as r',
'  from df_i_sujetos_estado',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
