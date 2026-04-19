prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Homologacion de Causales'
,p_step_title=>'Causales Entidad'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'    if($(''#''+id).attr(''aria-expanded'') != ''true''){',
'        $(''#''+id).click();',
'    }',
'}',
'',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_step_template=>wwv_flow_api.id(30309424961578275)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20200107151626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50584769640314201)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75171084344381642)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>',
'    <p>',
unistr('        Funcionalidad que permite la homologaci\00F3n de las causales de las entidades, con las causales del sistema.'),
'    </p>',
'    <br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75480702068439328)
,p_plug_name=>'Causales Entidad'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_csal_entdad, ',
'       a.cdgo_entdad,',
'       b.dscrpcion dscrpcion_entdad,',
'       a.cdgo_csal_entdad,',
'       a.dscrpcion,',
'       a.cdgo_csal',
'from nt_d_causales_entidad  a',
'inner join nt_d_entidad     b on a.cdgo_entdad = b.cdgo_entdad',
'where a.cdgo_entdad = nvl(:P8_ID_ENTDAD,a.cdgo_entdad);'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(75481100035439328)
,p_name=>'Informe 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>'No se ha encontrado causales para la entidad seleccionada.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP:P9_ID_CSAL_ENTDAD:#ID_CSAL_ENTDAD#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Editar">'
,p_owner=>'JCUAO'
,p_internal_uid=>75481100035439328
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38265584950312519)
,p_db_column_name=>'ID_CSAL_ENTDAD'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Csal Entdad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38265916209312522)
,p_db_column_name=>'CDGO_ENTDAD'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Entidad'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38266345057312522)
,p_db_column_name=>'CDGO_CSAL_ENTDAD'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo Causal Entidad')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38266759744312523)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38267164729312523)
,p_db_column_name=>'CDGO_CSAL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>unistr('C\00F3digo Causal')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(81341572805214301)
,p_db_column_name=>'DSCRPCION_ENTDAD'
,p_display_order=>15
,p_column_identifier=>'F'
,p_column_label=>'Entidad'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P8_ID_ENTDAD'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(75486793970440827)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'382675'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_CSAL_ENTDAD:CDGO_ENTDAD:CDGO_CSAL_ENTDAD:DSCRPCION:CDGO_CSAL:DSCRPCION_ENTDAD'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75977504244296636)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38267982012312525)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(50584769640314201)
,p_button_name=>'BTN_NUEVO'
,p_button_static_id=>'btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38268630744312526)
,p_name=>'P8_ID_ENTDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(75977504244296636)
,p_prompt=>'Entidad'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion as display_value, b.cdgo_entdad as return_value ',
'from nt_d_entidad_cliente a ',
'join nt_d_entidad     b on a.cdgo_entdad = b.cdgo_entdad',
'where a.cdgo_clnte =:F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38270465213312529)
,p_name=>unistr('Editar Informe: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(75480702068439328)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38270907878312530)
,p_event_id=>wwv_flow_api.id(38270465213312529)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(75480702068439328)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38271345894312530)
,p_name=>unistr('Crear Bot\00F3n: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(38267982012312525)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38271816798312530)
,p_event_id=>wwv_flow_api.id(38271345894312530)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(75480702068439328)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38269061016312528)
,p_name=>'Al Cambiar'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_ENTDAD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38269535977312529)
,p_event_id=>wwv_flow_api.id(38269061016312528)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38270015450312529)
,p_event_id=>wwv_flow_api.id(38269061016312528)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8_ID_ENTDAD'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
