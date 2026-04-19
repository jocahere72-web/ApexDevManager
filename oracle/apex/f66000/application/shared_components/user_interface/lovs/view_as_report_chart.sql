prompt --application/shared_components/user_interface/lovs/view_as_report_chart
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(35880966347290634)
,p_lov_name=>'VIEW_AS_REPORT_CHART'
,p_lov_query=>'.'||wwv_flow_api.id(35880966347290634)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(35881211352290634)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Agregar p\00E1gina de informe')
,p_lov_return_value=>'REPORT'
,p_lov_template=>'<span class="fa fa-table" aria-hidden="true"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span>'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(35881681165290634)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Agregar p\00E1gina de gr\00E1ficos')
,p_lov_return_value=>'CHART'
,p_lov_template=>'<span class="fa fa-pie-chart" aria-hidden="true"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span>'
);
end;
/
