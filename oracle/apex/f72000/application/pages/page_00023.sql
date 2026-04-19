prompt --application/pages/page_00023
begin
wwv_flow_api.create_page(
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>'Tipo de Recursos x Cliente'
,p_step_title=>'Tipo de Recursos por Cliente'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'    if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'        $(''#''+id).click();',
'    }',
'}',
'',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(73037951423586621)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100789435833997968)
,p_plug_name=>'Tipo de Recursos Cliente'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_rcrso_tipo_clnte, ',
'        a.cdgo_rcrso_tpo,',
'        b.dscrpcion dscrpcion_recurso_tipo,',
'        a.cdgo_clnte,',
'        case a.undad_drcion',
'            when ''MN'' then ''Minutos''',
'            when ''HR'' then ''Horas''',
unistr('            when ''DI'' then ''D\00EDas'''),
'            when ''SM'' then ''Semanas''',
'            when ''MS'' then ''Meses''',
'        end undad_drcion,',
'        a.drcion,',
'        case a.dia_tpo',
unistr('            when ''H'' then ''H\00E1bil'''),
'            when ''C'' then ''Calendario''',
'        end dia_tpo,',
'        case a.a_i_r',
unistr('            when ''S'' then ''S\00ED'''),
'            when ''N'' then ''No''',
'        end a_i_r,',
'        case a.actvo',
unistr('            when ''S'' then ''S\00ED'''),
'            when ''N'' then ''No''',
'        end actvo',
'from    gj_d_recursos_tipo_cliente a',
'inner join gj_d_recursos_tipo b on a.cdgo_rcrso_tpo = b.cdgo_rcrso_tpo',
'where   a.cdgo_clnte = :F_CDGO_CLNTE ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(100789875376997969)
,p_name=>'Report 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:24:&APP_SESSION.::::P24_ID_RCRSO_TIPO_CLNTE:#ID_RCRSO_TIPO_CLNTE#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'JCUAO'
,p_internal_uid=>100789875376997969
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100789955129997970)
,p_db_column_name=>'ID_RCRSO_TIPO_CLNTE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Rcrso Tipo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100790360875997970)
,p_db_column_name=>'CDGO_RCRSO_TPO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('C\00F3digo Tipo de Recurso')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(32907030426309801)
,p_db_column_name=>'DSCRPCION_RECURSO_TIPO'
,p_display_order=>12
,p_column_identifier=>'M'
,p_column_label=>'Tipo de Recurso'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100790701448997971)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>22
,p_column_identifier=>'C'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100791174778997971)
,p_db_column_name=>'UNDAD_DRCION'
,p_display_order=>32
,p_column_identifier=>'D'
,p_column_label=>unistr('Unidad de Duraci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100791544961997971)
,p_db_column_name=>'DRCION'
,p_display_order=>42
,p_column_identifier=>'E'
,p_column_label=>unistr('Duraci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100791982864997972)
,p_db_column_name=>'DIA_TPO'
,p_display_order=>52
,p_column_identifier=>'F'
,p_column_label=>unistr('Tipo de D\00EDa')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100793569919997973)
,p_db_column_name=>'A_I_R'
,p_display_order=>62
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFIndicador AIR?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_help_text=>unistr('Indica si maneja Admisi\00F3n, Inadmisi\00F3n y Rechazo')
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100794331779997974)
,p_db_column_name=>'ACTVO'
,p_display_order=>72
,p_column_identifier=>'L'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(100797045793998613)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1007971'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_RCRSO_TPO:DSCRPCION_RECURSO_TIPO:UNDAD_DRCION:DRCION:DIA_TPO:A_I_R:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(842869171012217574)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite gestionar los tipos de recursos por cliente.',
'    <br/>',
'    <br/>',
unistr('<p><b>Indicador AIR: </b>Indica si el tipo de recurso maneja Admisi\00F3n, Inadmisi\00F3n y Rechazo</p>'),
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100795608648997975)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(100789435833997968)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:24'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100794730821997974)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(100789435833997968)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100795210935997974)
,p_event_id=>wwv_flow_api.id(100794730821997974)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(100789435833997968)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100796024749997975)
,p_name=>'Create Button - Dialog Closed'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100795608648997975)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100796552541997975)
,p_event_id=>wwv_flow_api.id(100796024749997975)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(100789435833997968)
,p_stop_execution_on_error=>'Y'
);
end;
/
