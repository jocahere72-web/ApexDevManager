prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Cambio de Destino- Novedad Predial'
,p_step_title=>'Registro Cambio de Destino'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.t-Form-label{',
'  font-weight: 700;',
'}*/'))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101164953'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112488351316181801)
,p_plug_name=>'Registro Cambio de Destino'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113579211410574601)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
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
'</h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P6_ID_NVDAD_PRDIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113780263005457301)
,p_plug_name=>unistr('Vigencias de Aplicaci\00F3n')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia',
'     , prdo',
'     , indcdor_exste_prdo',
'  from table ( pkg_si_novedades_predio.fnc_ca_vigencias_fecha( p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                             , p_id_impsto         => :P6_ID_IMPSTO',
'                                                             , p_id_impsto_sbmpsto => :P6_ID_IMPSTO_SBMPSTO',
'                                                             , p_fecha             => :P6_FCHA_INCIO_APLCCION ))'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P6_FCHA_INCIO_APLCCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(113780322943457302)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('La fecha inicio de aplicaci\00F3n [&P6_FCHA_INCIO_APLCCION.] aplica para vigencia futura.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>113780322943457302
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113780432521457303)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113780582762457304)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113780879589457307)
,p_db_column_name=>'INDCDOR_EXSTE_PRDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Indcdor Exste Prdo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(113786699791468541)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1137867'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'VGNCIA:PRDO:'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(113943356311981924)
,p_report_id=>wwv_flow_api.id(113786699791468541)
,p_name=>'Periodos que no existen en el sistema'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'INDCDOR_EXSTE_PRDO'
,p_operator=>'='
,p_expr=>'N'
,p_condition_sql=>' (case when ("INDCDOR_EXSTE_PRDO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''N''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FF7755'
,p_row_font_color=>'#FFFFFF'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212246645950767661)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212637877822545298)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite: <br/><br/>',
'  <b>1.</b> El registro de novedad de cambio de destino.<br/><br/>',
'  <b>2.</b> Visualizar las vigencias por reliquidar.<br/><br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113579300849574602)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(113579211410574601)
,p_button_name=>'Btn_Registrar_Novedad'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Novedad'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112496780963227501)
,p_name=>'P6_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112496803033227502)
,p_name=>'P6_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112496939141227503)
,p_name=>'P6_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112497089541227504)
,p_name=>'P6_ID_ACTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113393753875672801)
,p_name=>'P6_ID_ENTDAD_NVDAD'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_prompt=>'Originada por'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select dscrpcion as v',
'         , id_entdad_nvdad as k',
'      from df_i_entidades_novedad',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_impsto  = :P6_ID_IMPSTO',
'  order by v'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Entidad que autoriza la novedad.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'400'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113393882388672802)
,p_name=>'P6_NMRO_DCMTO_SPRTE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_prompt=>unistr('N\00FAmero de Acto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de Acto Soporte.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113393925699672803)
,p_name=>'P6_FCHA_DCMNTO_SPRTE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_prompt=>'Fecha Acto'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha de Acto Soporte.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113394058365672804)
,p_name=>'P6_FCHA_INCIO_APLCCION'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_item_default=>'''01/01/'' || to_char( sysdate , ''YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha Inicio de Aplicaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Simula las vigencias de aplicaci\00F3n de la novedad.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113394110870672805)
,p_name=>'P6_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>110
,p_cMaxlength=>200
,p_cHeight=>1
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Observaci\00F3n de la novedad.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113394232069672806)
,p_name=>'P6_CDGO_ESTRTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_prompt=>'Nuevo Estrato'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion_estrto as v',
'       , cdgo_estrto as k ',
'    from df_s_estratos  ',
'   where cdgo_estrto not in ( ''00'' , ''99'' )',
'order by cdgo_estrto'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Estrato del predio'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115040050889149503)
,p_name=>'P6_ID_NVDAD_PRDIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123042244657565901)
,p_name=>'P6_ID_PRDIO_DSTNO'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_prompt=>'Nuevo Destino'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmtcnco || '' - '' || dscrpcion as v',
'       , id_prdio_dstno as k',
'    from df_i_predios_destino',
'   where cdgo_clnte  = :F_CDGO_CLNTE',
'     and id_impsto   = :P6_ID_IMPSTO',
'     and nmtcnco <> ''99''',
'order by v'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Destino del predio'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123042379140565902)
,p_name=>'P6_INDCDOR_USA_ESTRTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(112488351316181801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(123043856421565917)
,p_validation_name=>'Validar Estrato'
,p_validation_sequence=>10
,p_validation=>'P6_CDGO_ESTRTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El campo nuevo estrato es requerido.'
,p_validation_condition=>'P6_INDCDOR_USA_ESTRTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(113579300849574602)
,p_associated_item=>wwv_flow_api.id(113394232069672806)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113780640097457305)
,p_name=>'Al Cambiar Fecha Inicio Aplicacion'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_FCHA_INCIO_APLCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113780768682457306)
,p_event_id=>wwv_flow_api.id(113780640097457305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(113780263005457301)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(123042455340565903)
,p_name=>'Al Cambiar Destino PLSQL'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_ID_PRDIO_DSTNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(123042553477565904)
,p_event_id=>wwv_flow_api.id(123042455340565903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select indcdor_usa_estrto',
'      into :P6_INDCDOR_USA_ESTRTO',
'      from df_i_predios_destino',
'     where id_prdio_dstno = :P6_ID_PRDIO_DSTNO;',
'exception',
'     when no_data_found then',
'          :P6_INDCDOR_USA_ESTRTO := ''N'';',
'end;'))
,p_attribute_02=>'P6_INDCDOR_USA_ESTRTO,P6_ID_PRDIO_DSTNO'
,p_attribute_03=>'P6_INDCDOR_USA_ESTRTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(123042749582565906)
,p_name=>'Ocultar Estrato'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(123042869229565907)
,p_event_id=>wwv_flow_api.id(123042749582565906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_CDGO_ESTRTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(123043313526565912)
,p_name=>'Al Cambiar Indicador Estrato'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_INDCDOR_USA_ESTRTO'
,p_condition_element=>'P6_INDCDOR_USA_ESTRTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(123043411072565913)
,p_event_id=>wwv_flow_api.id(123043313526565912)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_CDGO_ESTRTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(123043559448565914)
,p_event_id=>wwv_flow_api.id(123043313526565912)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_CDGO_ESTRTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(123043774833565916)
,p_event_id=>wwv_flow_api.id(123043313526565912)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_CDGO_ESTRTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115158627758980201)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Novedad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select a.id_nvdad_prdio',
'          , a.id_entdad_nvdad',
'          , a.nmro_dcmto_sprte',
'          , a.fcha_dcmnto_sprte',
'          , a.fcha_incio_aplccion',
'          , b.cdgo_estrto_nvo',
'          , a.obsrvcion',
'       into :P6_ID_NVDAD_PRDIO',
'          , :P6_ID_ENTDAD_NVDAD',
'          , :P6_NMRO_DCMTO_SPRTE',
'          , :P6_FCHA_DCMNTO_SPRTE',
'          , :P6_FCHA_INCIO_APLCCION',
'          , :P6_CDGO_ESTRTO',
'          , :P6_OBSRVCION',
'       from si_g_novedades_predio a',
'       join si_g_novedades_predio_dtlle b',
'         on a.id_nvdad_prdio   = b.id_nvdad_prdio',
'      where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'exception',
'     when no_data_found then',
'          :P6_ID_NVDAD_PRDIO := null;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115039951455149502)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Novedad de Predial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	o_cdgo_rspsta  number;',
'	o_mnsje_rspsta varchar2(4000);',
'begin',
'   ',
'	apex_json.initialize_clob_output;  ',
'    apex_json.open_array;',
'	apex_json.open_object;',
'	apex_json.write( ''id_sjto_impsto''  , :P6_ID_SJTO_IMPSTO );',
'	apex_json.write( ''cdgo_estrto_nvo'' , :P6_CDGO_ESTRTO );  ',
'    apex_json.write( ''id_prdio_dstno'' , :P6_ID_PRDIO_DSTNO );  ',
'	apex_json.close_all;',
'	',
'	pkg_si_novedades_predio.prc_rg_novedad_predial( p_id_usrio              => :F_ID_USRIO',
'                                                  , p_cdgo_clnte            => :F_CDGO_CLNTE',
'                                                  , p_id_impsto	            => :P6_ID_IMPSTO',
'                                                  , p_id_impsto_sbmpsto	    => :P6_ID_IMPSTO_SBMPSTO',
'                                                  , p_id_entdad_nvdad	    => :P6_ID_ENTDAD_NVDAD',
'                                                  , p_id_acto_tpo           => :P6_ID_ACTO_TPO',
'                                                  , p_nmro_dcmto_sprte      => :P6_NMRO_DCMTO_SPRTE',
'                                                  , p_fcha_dcmnto_sprte     => :P6_FCHA_DCMNTO_SPRTE',
'                                                  , p_fcha_incio_aplccion   => :P6_FCHA_INCIO_APLCCION',
'                                                  , p_obsrvcion			    => :P6_OBSRVCION',
'                                                  , p_id_instncia_fljo	 	=> :F_ID_INSTNCIA_FLJO',
'                                                  , p_json                  => apex_json.get_clob_output',
'                                                  , o_cdgo_rspsta           => o_cdgo_rspsta',
'                                                  , o_mnsje_rspsta          => o_mnsje_rspsta',
'                                                  , o_id_nvdad_prdio        => :P6_ID_NVDAD_PRDIO );',
'    ',
'    apex_json.free_output; ',
'	',
'	if( o_cdgo_rspsta != 0 ) then',
'		raise_application_error( -20001 , o_mnsje_rspsta );',
'	end if;',
'end;  '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(113579300849574602)
,p_process_success_message=>unistr('Novedad de predial registrada con \00E9xito.')
);
end;
/
