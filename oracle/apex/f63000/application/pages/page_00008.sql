prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(197944602441250185)
,p_name=>'Proceso de carga'
,p_step_title=>'Proceso de carga'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>unistr('var htmldb_delete_message=''\00BFTe gustar\00EDa realizar esta acci\00F3n de borrado?'';')
,p_step_template=>wwv_flow_api.id(197896201223250006)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20230803155012'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52213962131704601)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'Funcionalidad que permite:<br><br>',
unistr('<b>1.</b> procesar un archivo realizando la carga de los datos del mismo en una tabla intermedia indicando los registros procesados, exitosos, con errores, la fecha de inicio y final del procesamiento as\00ED como tambi\00E9n el tiempo que demor\00F3 el sistema ')
||'en procesar el archivo.<br><br>',
'',
unistr('<b>2.</b> Procesar la tabla de gesti\00F3n a partir de la tabla intermedia de acuerdo con las reglas establecidas para el procesamiento de los datos, las cuales podr\00E1 observar en la regi\00F3n central en el bot\00F3n ver reglas.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91799507524001615)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103310965112308345)
,p_plug_name=>unistr('Selector de pesta\00F1as')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--pill'
,p_plug_template=>wwv_flow_api.id(197914233901250049)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103311017762308346)
,p_plug_name=>'Tabla intermedia'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P8_ID_PRCSO_CRGA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(111757751524630362)
,p_name=>'Resumen carga intermedia'
,p_parent_plug_id=>wwv_flow_api.id(103311017762308346)
,p_template=>wwv_flow_api.id(197900995312250040)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v.id_prcso_crga_trza,',
'       v.id_prcso_crga,',
'       v.orgen,',
'       v.nmbre_crga,',
'       v.nmbre_clnte,',
'       v.nmbre_impsto,',
'       v.vgncia,',
'       v.rgstros_prcsdos,',
'       v.rgstros_extsos,',
'       decode(v.rgstros_error,0,to_char(v.rgstros_error),v.rgstros_error||'' ''||'' <a href="''||v.link_url||''">''||'' Ver errores <span class="fa fa-bug" style="font-size:20px"></span></a>'') rgstros_error,',
'       v.fcha_incio,',
'       v.fcha_fin,',
'       v.duracion,',
'       v.link_url ',
'  from (select id_prcso_crga_trza,',
'               id_prcso_crga,',
'               orgen,',
'               nmbre_crga,',
'               nmbre_clnte,',
'               nmbre_impsto,',
'               vgncia,',
'               rgstros_prcsdos,',
'               rgstros_extsos,',
'               rgstros_error,',
'               fcha_incio,',
'               fcha_fin,',
'               extract(HOUR from duracion)||''h ''||extract(MINUTE from duracion)||''m ''||round(to_number(extract(SECOND from duracion)))||''s'' duracion,',
'               decode(rgstros_error,0,NULL,APEX_UTIL.PREPARE_URL(p_url =>''f?p=''||:APP_ID||'':10:''||:APP_SESSION||''::NO:10:P10_ID_PRCSO_CRGA,P10_ORGEN:''||id_prcso_crga||'',''||orgen||'':'',p_checksum_type => ''SESSION'')) link_url',
'          from v_et_g_procesos_carga_traza',
'         where orgen =''INTERMEDIA''',
'           and id_prcso_crga = :P8_ID_PRCSO_CRGA) v'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(197923521915250069)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758105574630366)
,p_query_column_id=>1
,p_column_alias=>'ID_PRCSO_CRGA_TRZA'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758274987630367)
,p_query_column_id=>2
,p_column_alias=>'ID_PRCSO_CRGA'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758293918630368)
,p_query_column_id=>3
,p_column_alias=>'ORGEN'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758380840630369)
,p_query_column_id=>4
,p_column_alias=>'NMBRE_CRGA'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758556929630370)
,p_query_column_id=>5
,p_column_alias=>'NMBRE_CLNTE'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758633637630371)
,p_query_column_id=>6
,p_column_alias=>'NMBRE_IMPSTO'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758722719630372)
,p_query_column_id=>7
,p_column_alias=>'VGNCIA'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758859029630373)
,p_query_column_id=>8
,p_column_alias=>'RGSTROS_PRCSDOS'
,p_column_display_sequence=>8
,p_column_heading=>'Registros procesados'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758879763630374)
,p_query_column_id=>9
,p_column_alias=>'RGSTROS_EXTSOS'
,p_column_display_sequence=>9
,p_column_heading=>'Registros exitosos'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111758996753630375)
,p_query_column_id=>10
,p_column_alias=>'RGSTROS_ERROR'
,p_column_display_sequence=>10
,p_column_heading=>'Registros con errores'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111759159363630376)
,p_query_column_id=>11
,p_column_alias=>'FCHA_INCIO'
,p_column_display_sequence=>11
,p_column_heading=>'Fecha inicio'
,p_use_as_row_header=>'N'
,p_column_format=>'DD/MM/YYYY'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111759265102630377)
,p_query_column_id=>12
,p_column_alias=>'FCHA_FIN'
,p_column_display_sequence=>12
,p_column_heading=>'Fecha final'
,p_use_as_row_header=>'N'
,p_column_format=>'DD/MM/YYYY'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(111759631577630381)
,p_query_column_id=>13
,p_column_alias=>'DURACION'
,p_column_display_sequence=>13
,p_column_heading=>'Duracion'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112279960454730677)
,p_query_column_id=>14
,p_column_alias=>'LINK_URL'
,p_column_display_sequence=>14
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112276612029730644)
,p_plug_name=>unistr('Gr\00E1fica resumen')
,p_parent_plug_id=>wwv_flow_api.id(103311017762308346)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rgstros_extsos,',
'       rgstros_error',
'  from v_et_g_procesos_carga_traza',
' where orgen =''INTERMEDIA''',
'   and id_prcso_crga = :P8_ID_PRCSO_CRGA'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(112276748712730645)
,p_region_id=>wwv_flow_api.id(112276612029730644)
,p_chart_type=>'donut'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ){ ',
'',
'    // Create a data label function that takes a dataContext argument. The dataContext contains information on the data item,',
'    // including id, series, group, value, data, seriesData, groupData and component. The function should return the desired data label string or number.',
'    this.donutSliceLabel = function( dataContext ){',
'        var series_name;',
'        ',
'        if ( dataContext.seriesData ) {',
'            series_name = dataContext.seriesData.name;',
'        } else {',
'            // NOTE: when defining an ''Other'' segment, there is no associated entry in dataContext.seriesData for that new segment',
'            // Ensure a default label ''Other'' is defined in this instance.',
'            series_name = ''Other'';',
'        }',
'        return series_name + " " + dataContext.value + "% ";',
'    }',
'    ',
'    // Pass the data label function to the chart dataLabel attribute.',
'    // dataLabel: A JET function that returns a custom data label. The function takes a dataContext argument, provided by the chart.',
'    // Review API guide for details: http://www.oracle.com/webfolder/technetwork/jet/jsdocs/oj.ojChart.html#dataLabel',
'    options.dataLabel = donutSliceLabel; ',
'    return options; ',
'}'))
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(112276842513730646)
,p_chart_id=>wwv_flow_api.id(112276748712730645)
,p_seq=>10
,p_name=>'Registros exitosos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros exitosos'' label,',
'       ''Registros exitosos:''||'' ''||rgstros_extsos tooltip,',
'       --round(rgstros_extsos/(rgstros_extsos+rgstros_error) * 100,5) value',
'       case when rgstros_extsos+rgstros_error = 0 then 0 else round(rgstros_extsos/(rgstros_extsos+rgstros_error) * 100,5) end value',
'  from v_et_g_procesos_carga_traza',
' where orgen =''INTERMEDIA''',
'   and id_prcso_crga = :P8_ID_PRCSO_CRGA'))
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#25B043'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(112276884819730647)
,p_chart_id=>wwv_flow_api.id(112276748712730645)
,p_seq=>20
,p_name=>'Registros con errores'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Registros con errores'' label, ',
'        ''Registros con errores:''||'' ''||rgstros_error tooltip,',
'       --  round(rgstros_error/(rgstros_extsos+rgstros_error) * 100,5) value ',
'         case when rgstros_extsos+rgstros_error = 0 then 0 else round(rgstros_error/(rgstros_extsos+rgstros_error) * 100,5) end value     ',
'  from v_et_g_procesos_carga_traza',
' where orgen =''INTERMEDIA''',
'   and id_prcso_crga = :P8_ID_PRCSO_CRGA'))
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FC1C1C'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103311100362308347)
,p_plug_name=>unistr('Tabla de gesti\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P8_ID_PRCSO_CRGA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(112278124883730659)
,p_name=>unistr('Resumen carga gesti\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(103311100362308347)
,p_template=>wwv_flow_api.id(197900995312250040)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v.id_prcso_crga_trza,',
'       v.id_prcso_crga,',
'       v.orgen,',
'       v.nmbre_crga,',
'       v.nmbre_clnte,',
'       v.nmbre_impsto,',
'       v.vgncia,',
'       v.rgstros_prcsdos,',
'       v.rgstros_extsos,',
'       decode(v.rgstros_error,0,to_char(v.rgstros_error), v.rgstros_error||'' ''||'' <a href="''||v.link_url||''">''||'' Ver errores <span class="fa fa-bug" style="font-size:20px"></span></a>'') rgstros_error,',
'       v.fcha_incio,',
'       v.fcha_fin,',
'       v.duracion,',
'       v.link_url ',
'  from (select id_prcso_crga_trza,',
'               id_prcso_crga,',
'               orgen,',
'               nmbre_crga,',
'               nmbre_clnte,',
'               nmbre_impsto,',
'               vgncia,',
'               rgstros_prcsdos,',
'               rgstros_extsos,',
'               rgstros_error,',
'               fcha_incio,',
'               fcha_fin,',
'               extract(HOUR from duracion)||''h ''||extract(MINUTE from duracion)||''m ''||round(to_number(extract(SECOND from duracion)))||''s'' duracion,',
'               decode(rgstros_error,0,NULL,APEX_UTIL.PREPARE_URL(p_url =>''f?p=''||:APP_ID||'':10:''||:APP_SESSION||''::NO:10:P10_ID_PRCSO_CRGA,P10_ORGEN:''||id_prcso_crga||'',''||orgen||'':'',p_checksum_type => ''SESSION'')) link_url',
'          from v_et_g_procesos_carga_traza',
'         where orgen =''GESTION''',
'           and id_prcso_crga = :P8_ID_PRCSO_CRGA) v'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(197923521915250069)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112278209215730660)
,p_query_column_id=>1
,p_column_alias=>'ID_PRCSO_CRGA_TRZA'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112278299855730661)
,p_query_column_id=>2
,p_column_alias=>'ID_PRCSO_CRGA'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112278455581730662)
,p_query_column_id=>3
,p_column_alias=>'ORGEN'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112278497988730663)
,p_query_column_id=>4
,p_column_alias=>'NMBRE_CRGA'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112278625861730664)
,p_query_column_id=>5
,p_column_alias=>'NMBRE_CLNTE'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112278761833730665)
,p_query_column_id=>6
,p_column_alias=>'NMBRE_IMPSTO'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112278785182730666)
,p_query_column_id=>7
,p_column_alias=>'VGNCIA'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112278884271730667)
,p_query_column_id=>8
,p_column_alias=>'RGSTROS_PRCSDOS'
,p_column_display_sequence=>8
,p_column_heading=>'Registros procesados'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112279035689730668)
,p_query_column_id=>9
,p_column_alias=>'RGSTROS_EXTSOS'
,p_column_display_sequence=>9
,p_column_heading=>'Registros exitosos'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112279151243730669)
,p_query_column_id=>10
,p_column_alias=>'RGSTROS_ERROR'
,p_column_display_sequence=>10
,p_column_heading=>'Registros con errores'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112279227550730670)
,p_query_column_id=>11
,p_column_alias=>'FCHA_INCIO'
,p_column_display_sequence=>11
,p_column_heading=>'Fecha inicio'
,p_use_as_row_header=>'N'
,p_column_format=>'DD/MM/YYYY'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112279323861730671)
,p_query_column_id=>12
,p_column_alias=>'FCHA_FIN'
,p_column_display_sequence=>12
,p_column_heading=>'Fecha final'
,p_use_as_row_header=>'N'
,p_column_format=>'DD/MM/YYYY'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112279402133730672)
,p_query_column_id=>13
,p_column_alias=>'DURACION'
,p_column_display_sequence=>13
,p_column_heading=>'Duracion'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112280401514730682)
,p_query_column_id=>14
,p_column_alias=>'LINK_URL'
,p_column_display_sequence=>14
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112279506319730673)
,p_plug_name=>unistr('Gr\00E1fica resumen')
,p_parent_plug_id=>wwv_flow_api.id(103311100362308347)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rgstros_extsos,',
'       rgstros_error',
'  from v_et_g_procesos_carga_traza',
' where orgen =''GESTION''',
'   and id_prcso_crga = :P8_ID_PRCSO_CRGA'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(112279626956730674)
,p_region_id=>wwv_flow_api.id(112279506319730673)
,p_chart_type=>'donut'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ){ ',
'',
'    // Create a data label function that takes a dataContext argument. The dataContext contains information on the data item,',
'    // including id, series, group, value, data, seriesData, groupData and component. The function should return the desired data label string or number.',
'    this.donutSliceLabel = function( dataContext ){',
'        var series_name;',
'        ',
'        if ( dataContext.seriesData ) {',
'            series_name = dataContext.seriesData.name;',
'        } else {',
'            // NOTE: when defining an ''Other'' segment, there is no associated entry in dataContext.seriesData for that new segment',
'            // Ensure a default label ''Other'' is defined in this instance.',
'            series_name = ''Other'';',
'        }',
'        return series_name + " " + dataContext.value + "% ";',
'    }',
'    ',
'    // Pass the data label function to the chart dataLabel attribute.',
'    // dataLabel: A JET function that returns a custom data label. The function takes a dataContext argument, provided by the chart.',
'    // Review API guide for details: http://www.oracle.com/webfolder/technetwork/jet/jsdocs/oj.ojChart.html#dataLabel',
'    options.dataLabel = donutSliceLabel; ',
'    return options; ',
'}'))
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(112279765050730675)
,p_chart_id=>wwv_flow_api.id(112279626956730674)
,p_seq=>10
,p_name=>'Registros exitosos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros exitosos'' label,',
'       ''Registros exitosos:''||'' ''||rgstros_extsos tooltip,',
'       case when rgstros_extsos+rgstros_error = 0 then 0 else round(rgstros_extsos/(rgstros_extsos+rgstros_error) * 100,5) end value',
'  from v_et_g_procesos_carga_traza',
' where orgen =''GESTION''',
'   and id_prcso_crga = :P8_ID_PRCSO_CRGA'))
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#25B043'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(112279862636730676)
,p_chart_id=>wwv_flow_api.id(112279626956730674)
,p_seq=>20
,p_name=>'Registros con errores'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Registros con errores'' label, ',
'        ''Registros con errores:''||'' ''||rgstros_error tooltip,',
'        case when rgstros_extsos+rgstros_error = 0 then 0 else round(rgstros_error/(rgstros_extsos+rgstros_error) * 100,5) end value   ',
'  from v_et_g_procesos_carga_traza',
' where orgen =''GESTION''',
'   and id_prcso_crga = :P8_ID_PRCSO_CRGA'))
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FC1C1C'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204081710500486366)
,p_plug_name=>'Proceso de carga'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91799658445001616)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(91799507524001615)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103311994739308356)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(103311017762308346)
,p_button_name=>'BTN_CRGAR_INTRMDIA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cargar a tabla intermedia'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_et_g_procesos_carga_traza',
' where orgen =''INTERMEDIA''',
'   and id_prcso_crga = :P8_ID_PRCSO_CRGA'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103312253137308358)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(204081710500486366)
,p_button_name=>'BTN_VER_REGLAS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_image_alt=>'Ver reglas'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_ID_CRGA:&P8_ID_CRGA.'
,p_button_condition=>'P8_ID_PRCSO_CRGA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(115727819966217101)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(204081710500486366)
,p_button_name=>'Btn_Vista_Previa'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_image_alt=>'Vista Previa'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:et_g_procesos_carga,file_blob,file_mimetype,id_prcso_crga,&P8_ID_PRCSO_CRGA.,file_name'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select 1 ',
'    from et_g_procesos_carga ',
'   where file_mimetype in ( ''text/plain'' , ''text/csv'' )',
'     and id_prcso_crga = :P8_ID_PRCSO_CRGA'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103147632916118825)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(204081710500486366)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>':P8_ID_PRCSO_CRGA is not null and (:P8_CDGO_PRCESO_ESTDO =''SE'' or :P8_CDGO_PRCESO_ESTDO is null) and 1 = 0'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103146824493118822)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(204081710500486366)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_button_condition=>':P8_CDGO_PRCESO_ESTDO =''I'' or :P8_ID_PRCSO_CRGA is null'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103148001688118826)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(204081710500486366)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>':P8_ID_PRCSO_CRGA is null and (:P8_CDGO_PRCESO_ESTDO =''I'' or :P8_CDGO_PRCESO_ESTDO is null)'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103147256836118824)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(204081710500486366)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P8_ID_PRCSO_CRGA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103312161086308357)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(103311100362308347)
,p_button_name=>'BTN_CRGAR_GSTION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cargar a tabla de gesti\00F3n')
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_et_g_procesos_carga_traza',
' where orgen =''GESTION''',
'   and id_prcso_crga = :P8_ID_PRCSO_CRGA',
'   and id_prcso_crga  not in (select 1 from et_g_procesos_intermedia where id_prcso_crga = :P8_ID_PRCSO_CRGA )'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(103152524526118867)
,p_branch_name=>'Go To Page 8'
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'DELETE,CREATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91322416703215703)
,p_name=>'P8_FILE_BLOB_TEMP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archivo:'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_read_only_when=>':P8_CDGO_PRCESO_ESTDO !=''SE'' and :P8_CDGO_PRCESO_ESTDO is not null'
,p_read_only_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(197933513921250107)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'text/*,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91325884434215737)
,p_name=>'P8_CDGO_ARCHVO_TPO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92719634628550462)
,p_name=>'P8_CDGO_CLNTE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92719759091550463)
,p_name=>'P8_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo:'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when=>':P8_CDGO_PRCESO_ESTDO !=''SE'' and :P8_CDGO_PRCESO_ESTDO is not null'
,p_read_only_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92719846031550464)
,p_name=>'P8_VGNCIA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_item_default=>'extract( year from sysdate )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Vigencia:'
,p_source=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select VGNCIA as d,',
'           VGNCIA as r',
'      from DF_S_VIGENCIAS',
'  order by 1 desc'))
,p_cHeight=>1
,p_read_only_when=>':P8_CDGO_PRCESO_ESTDO !=''SE'' and :P8_CDGO_PRCESO_ESTDO is not null'
,p_read_only_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103121198879647156)
,p_name=>'P8_FILE_NAME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103148462612118835)
,p_name=>'P8_ID_PRCSO_CRGA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRCSO_CRGA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103148797597118841)
,p_name=>'P8_ID_CRGA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de carga:'
,p_source=>'ID_CRGA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CARGA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_crga,',
'       id_crga',
'  from et_g_carga ',
'  where not id_crga in (',
'                          select id_crga ',
'                            from df_s_resolucion_carga',
'                      )',
' order by nmbre_crga'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Tipo Carga'
,p_read_only_when=>':P8_CDGO_PRCESO_ESTDO !=''I'' and :P8_CDGO_PRCESO_ESTDO is not null'
,p_read_only_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(197933513921250107)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103149190180118841)
,p_name=>'P8_FILE_BLOB'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archivo:'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_read_only_when=>':P8_CDGO_PRCESO_ESTDO !=''SE'' and :P8_CDGO_PRCESO_ESTDO is not null'
,p_read_only_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(197933513921250107)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIMETYPE'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'Y'
,p_attribute_07=>'&P8_FILE_NAME.'
,p_attribute_08=>'attachment'
,p_attribute_11=>'text/*,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheetspreadsheetml.sheets-officedocument.spreadsheetml.sheet'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103149980575118842)
,p_name=>'P8_FILE_MIMETYPE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103150461764118842)
,p_name=>'P8_CDGO_PRCSO_ESTDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_item_default=>'SE'
,p_prompt=>'Estado:'
,p_source=>'CDGO_PRCSO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO_PROCESO_CARGA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_estdo_prcso,',
'       cdgo_prcso_estdo',
'  from et_d_procesos_estado'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P8_ID_PRCSO_CRGA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103150865079118843)
,p_name=>'P8_ID_ADTRIA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_ADTRIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111757616823630361)
,p_name=>'P8_BRANCH'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113454442380042391)
,p_name=>'P8_LNEAS_ENCBZDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_prompt=>'Lineas Encabezado:'
,p_source=>'LNEAS_ENCBZDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:0;0,1;1,2;2,3;3,4;4,5;5'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P8_CDGO_PRCESO_ESTDO !=''SE'' and :P8_CDGO_PRCESO_ESTDO is not null'
,p_read_only_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115779555193602701)
,p_name=>'P8_ID_USRIO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_item_default=>':F_ID_USRIO'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171640731805537846)
,p_name=>'P8_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo:'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto, ',
'       id_impsto_sbmpsto ',
'  from df_i_impuestos_subimpuesto ',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P8_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P8_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P8_CDGO_PRCESO_ESTDO !=''SE'' and :P8_CDGO_PRCESO_ESTDO is not null'
,p_read_only_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171640831861537847)
,p_name=>'P8_ID_PRDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(204081710500486366)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo:'
,p_source=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo,',
'       id_prdo',
'  from df_i_periodos',
' where cdgo_clnte           = :F_CDGO_CLNTE',
'   and id_impsto            = :P8_ID_IMPSTO',
'   and id_impsto_sbmpsto    = :P8_ID_IMPSTO_SBMPSTO',
'   and vgncia               = :P8_VGNCIA'))
,p_lov_cascade_parent_items=>'P8_ID_IMPSTO,P8_ID_IMPSTO_SBMPSTO,P8_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P8_CDGO_PRCESO_ESTDO !=''SE'' and :P8_CDGO_PRCESO_ESTDO is not null'
,p_read_only_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(91798975724001609)
,p_validation_name=>'Validar Archivo'
,p_validation_sequence=>10
,p_validation=>'P8_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El archivo es requerido.'
,p_validation_condition=>'P8_CDGO_ARCHVO_TPO'
,p_validation_condition2=>'EX'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(103148001688118826)
,p_associated_item=>wwv_flow_api.id(103149190180118841)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(91799115205001611)
,p_validation_name=>'Validar Archivo Temp'
,p_validation_sequence=>20
,p_validation=>'P8_FILE_BLOB_TEMP'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El archivo es requerido.'
,p_validation_condition=>'P8_CDGO_ARCHVO_TPO'
,p_validation_condition2=>'EX'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(103148001688118826)
,p_associated_item=>wwv_flow_api.id(91322416703215703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(119380776358001802)
,p_validation_name=>'Validar Archivo Duplicado'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from et_g_procesos_carga',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and file_name  = regexp_replace( :P8_FILE_BLOB ,''[0-9]+\/'' , null )'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El archivo ya se encuentra procesado.'
,p_when_button_pressed=>wwv_flow_api.id(103148001688118826)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91325095031215729)
,p_name=>'Al Cambiar Carga'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_CRGA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91325795132215736)
,p_event_id=>wwv_flow_api.id(91325095031215729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select cdgo_archvo_tpo',
'     into :P8_CDGO_ARCHVO_TPO',
'     from et_g_carga  ',
'    where id_crga = :P8_ID_CRGA;',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_attribute_02=>'P8_CDGO_ARCHVO_TPO,P8_ID_CRGA'
,p_attribute_03=>'P8_CDGO_ARCHVO_TPO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91327134830215750)
,p_event_id=>wwv_flow_api.id(91325095031215729)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($(''#P8_CDGO_ARCHVO_TPO'').val() === ''EX'') {',
'    apex.item(''P8_FILE_BLOB'').hide();',
'    apex.item(''P8_FILE_BLOB_TEMP'').show();',
'}else{',
'    apex.item(''P8_FILE_BLOB_TEMP'').hide();',
'    apex.item(''P8_FILE_BLOB'').show();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91325352984215732)
,p_name=>'Al Cargar Pagina'
,p_event_sequence=>40
,p_condition_element=>'P8_ID_PRCSO_CRGA'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91325470425215733)
,p_event_id=>wwv_flow_api.id(91325352984215732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8_FILE_BLOB,P8_FILE_BLOB_TEMP'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91799352220001613)
,p_event_id=>wwv_flow_api.id(91325352984215732)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8_FILE_BLOB_TEMP'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103151219121118865)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from ET_G_PROCESOS_CARGA'
,p_attribute_02=>'ET_G_PROCESOS_CARGA'
,p_attribute_03=>'P8_ID_PRCSO_CRGA'
,p_attribute_04=>'ID_PRCSO_CRGA'
,p_process_when=>'P8_ID_PRCSO_CRGA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103151628864118866)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of ET_G_PROCESOS_CARGA'
,p_attribute_02=>'ET_G_PROCESOS_CARGA'
,p_attribute_03=>'P8_ID_PRCSO_CRGA'
,p_attribute_04=>'ID_PRCSO_CRGA'
,p_attribute_09=>'P8_ID_PRCSO_CRGA'
,p_attribute_11=>'I'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'( :P8_CDGO_ARCHVO_TPO <> ''EX'' and :request = ''CREATE'' ) '
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91322542792215704)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Procesos Carga EX'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_temp_files apex_application_temp_files%rowtype;',
'    v_count      number;',
'    filecounts   exception;',
'begin',
'',
'    select * ',
'      into v_temp_files',
'      from apex_application_temp_files',
'     where name = :P8_FILE_BLOB_TEMP;',
'     ',
'     select count(*)',
'       into v_count',
'       from et_g_procesos_carga',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'        and file_name  = v_temp_files.filename;',
'      ',
'      if ( v_count > 0 ) then',
'           raise filecounts;',
'      end if;',
'       ',
'    insert into et_g_procesos_carga ( id_crga , cdgo_clnte , id_impsto , vgncia , file_blob , file_name  , file_mimetype ',
'                                     , cdgo_prcso_estdo , id_adtria , lneas_encbzdo , id_impsto_sbmpsto , id_prdo , id_usrio ) ',
'                             values ( :P8_ID_CRGA , :F_CDGO_CLNTE , :P8_ID_IMPSTO , :P8_VGNCIA , v_temp_files.blob_content , v_temp_files.filename , v_temp_files.mime_type',
'                                    , ''SE'' , null , :P8_LNEAS_ENCBZDO , :P8_ID_IMPSTO_SBMPSTO , :P8_ID_PRDO , :F_ID_USRIO );',
'',
'exception ',
'     when filecounts then',
'          raise_application_error(-20003 , ''El archivo '' ||  v_temp_files.filename || '' ya se encuentra procesado.'');',
'     when others then ',
'          raise_application_error(-20002 , ''No fue posible cargar el archivo.'' );',
'end;',
'',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103148001688118826)
,p_process_when=>'P8_CDGO_ARCHVO_TPO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'EX'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91322731167215706)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_NL.AMIS.SCHEFFER.PROCESS.EXCEL2COLLECTION'
,p_process_name=>'Procesar Excel'
,p_attribute_01=>'P8_FILE_BLOB_TEMP'
,p_attribute_02=>'ETLEXC'
,p_attribute_04=>';'
,p_attribute_05=>'"'
,p_attribute_07=>'N'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103148001688118826)
,p_process_when=>'P8_CDGO_ARCHVO_TPO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'EX'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97295851600251601)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Proceso Carga'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    delete et_g_procesos_carga_error ',
'     where id_prcso_crga = :P8_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_carga_traza ',
'     where id_prcso_crga = :P8_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_intermedia ',
'     where id_prcso_crga = :P8_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_carga',
'     where id_prcso_crga = :P8_ID_PRCSO_CRGA;',
'     ',
'end;'))
,p_process_error_message=>unistr('No fue posible eliminar el proceso, ya que se encuentra en gesti\00F3n.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103147256836118824)
,p_process_success_message=>unistr('Proceso eliminado con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112870854517292752)
,p_process_sequence=>40
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Gestion'
,p_process_sql_clob=>'pk_etl.prc_carga_gestion(TO_NUMBER(:F_CDGO_CLNTE), TO_NUMBER(:P8_ID_IMPSTO), TO_NUMBER(:P8_ID_PRCSO_CRGA));'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103312161086308357)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112870713440292751)
,p_process_sequence=>50
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Intermedia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    -- Carga de Archivo desde Directorio',
'    --pk_etl.prc_carga_intermedia_from_dir(TO_NUMBER(:F_CDGO_CLNTE), TO_NUMBER(:P8_ID_IMPSTO), TO_NUMBER(:P8_ID_PRCSO_CRGA));',
'',
'    -- Carga de Archivo desde Base de Datos.   Table: ET_G_PROCESOS_CARGA  	Columna: file_blob ',
'    pk_etl.prc_carga_intermedia_from_db(TO_NUMBER(:F_CDGO_CLNTE), TO_NUMBER(:P8_ID_IMPSTO), TO_NUMBER(:P8_ID_PRCSO_CRGA));',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103311994739308356)
,p_process_success_message=>'Proceso completado'
);
end;
/
