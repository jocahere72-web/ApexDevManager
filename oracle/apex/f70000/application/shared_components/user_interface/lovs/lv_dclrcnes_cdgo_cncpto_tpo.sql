prompt --application/shared_components/user_interface/lovs/lv_dclrcnes_cdgo_cncpto_tpo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(48391686254108342)
,p_lov_name=>'LV_DCLRCNES_CDGO_CNCPTO_TPO'
,p_lov_query=>'.'||wwv_flow_api.id(48391686254108342)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(48391901344108363)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Descuento Capital'
,p_lov_return_value=>'DC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(48392395701108374)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Inter\00E9s')
,p_lov_return_value=>'I'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(48392773392108375)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Descuento Inter\00E9s')
,p_lov_return_value=>'DI'
);
end;
/
