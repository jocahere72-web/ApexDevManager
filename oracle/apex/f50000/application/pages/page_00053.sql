prompt --application/pages/page_00053
begin
wwv_flow_api.create_page(
 p_id=>53
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Informe de Funcionarios'
,p_step_title=>'Informe de Funcionarios'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') !== ''true''){',
'		$(''#''+id).click();',
'	}',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191106085049'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2750759310086831)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2750866380086832)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'Funcionalidad que permite ingresar, consultar, modificar y eliminar los funcionarios.',
'<br><br>',
unistr('<b>1.</b> Para ingresar un nuevo funcionario hacer clic en el bot\00F3n Nuevo Funcionario se mostrar\00E1 una ventana con los datos requeridos para ingresar al funcionario, una vez ingresado los datos hacer clic en el bot\00F3n insertar.'),
'<br><br>',
unistr('<b>2.</b> Para modificar un funcionario, hacer clic en el icono de l\00E1piz, se mostrar\00E1 una ventana con los datos del funcionario seleccionado, una vez modificado los datos hacer clic en el bot\00F3n Aplicar Cambios.'),
'<br><br>',
unistr('<b>3.</b> Para eliminar un funcionario, hacer clic en el icono de l\00E1piz, se mostrar\00E1 una ventana con los datos del funcionario seleccionado, hacer clic en el bot\00F3n eliminar.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96907275064666597)
,p_plug_name=>'Informe de Funcionarios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_fncnrio, ',
'       a.dscrpcion_idntfccion_tpo,',
'       a.idntfccion, ',
'       a.nmbre_trcro, ',
'       a.nmbre_ofcna, ',
'       a.drccion, ',
'       a.tlfno, ',
'       a.email, ',
'       a.nmbre_crgo, ',
'       a.nmbre_prfsion,  ',
'       a.actvo  ',
'  From v_df_c_funcionarios a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'  order by nmbre_trcro '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(96907373427666597)
,p_name=>'Informe de Funcionarios'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:RP:P54_ID_FNCNRIO:#ID_FNCNRIO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>96907373427666597
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96907775324666607)
,p_db_column_name=>'ID_FNCNRIO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Fncnrio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31770203789501103)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>11
,p_column_identifier=>'R'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31770035137501101)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>21
,p_column_identifier=>'P'
,p_column_label=>unistr('Tipos de Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31770136430501102)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>31
,p_column_identifier=>'Q'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96909745736666612)
,p_db_column_name=>'DRCCION'
,p_display_order=>41
,p_column_identifier=>'F'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96910195206666613)
,p_db_column_name=>'TLFNO'
,p_display_order=>51
,p_column_identifier=>'G'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96910512122666613)
,p_db_column_name=>'EMAIL'
,p_display_order=>61
,p_column_identifier=>'H'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96627529664115528)
,p_db_column_name=>'NMBRE_OFCNA'
,p_display_order=>81
,p_column_identifier=>'M'
,p_column_label=>'Oficina'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96627672253115529)
,p_db_column_name=>'NMBRE_CRGO'
,p_display_order=>91
,p_column_identifier=>'N'
,p_column_label=>'Cargo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96627772386115530)
,p_db_column_name=>'NMBRE_PRFSION'
,p_display_order=>101
,p_column_identifier=>'O'
,p_column_label=>unistr('Profesi\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96911708553666614)
,p_db_column_name=>'ACTVO'
,p_display_order=>111
,p_column_identifier=>'K'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(95423632210074889)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96923471347686382)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'969235'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:IDNTFCCION:NMBRE_TRCRO:NMBRE_OFCNA:NMBRE_CRGO:TLFNO:ACTVO:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96627828197115531)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2750759310086831)
,p_button_name=>'Btn_Nuevo_Funcionario'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Funcionario'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:RP,54::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109628093598348422)
,p_name=>unistr('Refrescar region al cerrar la modal de gesti\00F3n de funccionarios desde el informe')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(96907275064666597)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109628103456348423)
,p_event_id=>wwv_flow_api.id(109628093598348422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(96907275064666597)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31770311190501104)
,p_name=>unistr('Refrescar region al cerrar la modal de gesti\00F3n de funccionarios desde ayudas')
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(2750759310086831)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31770416409501105)
,p_event_id=>wwv_flow_api.id(31770311190501104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(96907275064666597)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96932348627693204)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
