prompt --application/shared_components/user_interface/lovs/lv_expediente_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(74660618410975084)
,p_lov_name=>'LV_EXPEDIENTE_ESTADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre as l',
'     , cdgo_expdnte_estdo as v',
'  from fi_d_expediente_estado'))
);
end;
/
