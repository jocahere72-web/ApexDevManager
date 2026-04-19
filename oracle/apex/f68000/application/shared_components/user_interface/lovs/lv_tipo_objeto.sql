prompt --application/shared_components/user_interface/lovs/lv_tipo_objeto
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(72040909987839182)
,p_lov_name=>'LV_TIPO_OBJETO'
,p_lov_query=>'.'||wwv_flow_api.id(72040909987839182)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(72041380037839182)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Text'
,p_lov_return_value=>'TEXT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(72041790328839182)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Text area'
,p_lov_return_value=>'TEXT_AREA'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(72042199326839183)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Fecha'
,p_lov_return_value=>'FECHA'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(72042566605839189)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Select List'
,p_lov_return_value=>'SELECT_LIST'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(72042950430839189)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Check box'
,p_lov_return_value=>'CHECK_BOX'
);
end;
/
