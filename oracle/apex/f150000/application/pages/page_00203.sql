prompt --application/pages/page_00203
begin
wwv_flow_api.create_page(
 p_id=>203
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Adjuntos - Liquidaci\00F3n de Rentas')
,p_step_title=>unistr('Adjuntos - Liquidaci\00F3n de Rentas')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20200825181134'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15096348096917368)
,p_plug_name=>'Adjuntos'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4794665765814946)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15096731959917372)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(15096348096917368)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10577827387165777)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(15096731959917372)
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow:t-Form--xlarge'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.seq_id',
'        , a.id_sbmpto_adjnto_tpo',
'        , a.dscrpcion_adjnto_tpo',
'        , b.c002       file_name',
'        , b.c001       obsrvcion',
'        , case',
'			when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'			else  ''Pendiente''',
'		end Estado',
unistr('        , decode (a.indcdor_oblgtrio, ''S'', ''S\00ED'', ''N'', ''No'') dscrpcion_indcdor_oblgtrio'),
'        , case',
'			when dbms_lob.getlength(blob001) > 0 then 1',
'			else null',
'		end eliminar',
'        , (select listagg ((frmto)||''(''||(tmno_mxmo)||''MB)   '') ',
'           from v_gi_d_sbmpsts_adjnto_tp_frmt ',
'           where id_sbmpto_adjnto_tpo =  a.id_sbmpto_adjnto_tpo) archivo',
'     from gi_d_subimpuestos_adjnto_tp   a',
'     left join apex_collections			b on b.collection_name = ''ADJUNTOS_RENTA''',
'      and a.id_sbmpto_adjnto_tpo        = b.n001',
'    where id_impsto_sbmpsto             = :P200_ID_IMPSTO_SBMPSTO'))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_api.id(10577960206165778)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>10577960206165778
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5449686763595485)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84590034673122401)
,p_db_column_name=>'ID_SBMPTO_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Id Sbmpto Adjnto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5450023986595511)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5450736525595512)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84590122782122402)
,p_db_column_name=>'DSCRPCION_ADJNTO_TPO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84590258678122403)
,p_db_column_name=>'ESTADO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84590303391122404)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5450344458595511)
,p_db_column_name=>'ELIMINAR'
,p_display_order=>90
,p_column_identifier=>'C'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:203:&SESSION.:ELIMINAR_ADJUNTO:&DEBUG.:RP:P203_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-trash" style="color: red;" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86575608430659628)
,p_db_column_name=>'ARCHIVO'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>unistr('Tipo (tama\00F1o)')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(10592224630475099)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54511'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'DSCRPCION_ADJNTO_TPO:FILE_NAME:OBSRVCION:ESTADO:DSCRPCION_INDCDOR_OBLGTRIO:ELIMINAR::ARCHIVO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5448157788595473)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(15096731959917372)
,p_button_name=>'BTN_AGREGAR_ADJUNTO'
,p_button_static_id=>'BTN_AGREGAR_ADJUNTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Adjunto'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5446624631595472)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(15096348096917368)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perder todos los cambios que no se han guardado'',''CANCEL'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5447010039595472)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(15096348096917368)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5447421068595472)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(15096348096917368)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5454490613595522)
,p_branch_name=>'Ir a Resumen'
,p_branch_action=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5447010039595472)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(78952805138533308)
,p_branch_name=>unistr('Ir a la p\00E1gina de inicio')
,p_branch_action=>'P200_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(5446624631595472)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5454069954595522)
,p_branch_name=>unistr('Ir a Proyecci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5447421068595472)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5448517423595473)
,p_name=>'P203_FILE_BLOB'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(15096731959917372)
,p_prompt=>'Adjunto'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5448964853595473)
,p_name=>'P203_OBSRVCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(15096731959917372)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5451518721595519)
,p_name=>'P203_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10577827387165777)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84590485189122405)
,p_name=>'P203_ID_SBMPSTO_ADJNTO_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15096731959917372)
,p_prompt=>'Tipo de Adjunto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select dscrpcion_adjnto_tpo',
'            , id_sbmpto_adjnto_tpo',
'    from gi_d_subimpuestos_adjnto_tp    a     ',
'    where   a.id_impsto_sbmpsto             = :P200_ID_IMPSTO_SBMPSTO',
'            and a.id_sbmpto_adjnto_tpo not in (select b.n001',
'                                               from apex_collections b',
'                                               where b.collection_name = ''ADJUNTOS_RENTA'') '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un tipo de adjunto -- '
,p_cHeight=>1
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86574346672659615)
,p_name=>'P203_ARCHVO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(15096731959917372)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86574434429659616)
,p_name=>'P203_ARCHVO_TMNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(15096731959917372)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86574653535659618)
,p_name=>'P203_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(15096731959917372)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5452044117595519)
,p_validation_name=>unistr('Validar que observaci\00F3n no sea nulo')
,p_validation_sequence=>10
,p_validation=>'P203_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar una observaci\00F3n para agregar un adjunto')
,p_when_button_pressed=>wwv_flow_api.id(5448157788595473)
,p_associated_item=>wwv_flow_api.id(5448964853595473)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5452418512595520)
,p_validation_name=>'Adjunto no Nulo'
,p_validation_sequence=>30
,p_validation=>'P203_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un adjunto'
,p_when_button_pressed=>wwv_flow_api.id(5448157788595473)
,p_associated_item=>wwv_flow_api.id(5448517423595473)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(84590679861122407)
,p_validation_name=>'Validar que ingrese adjuntos obligatorios'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select *',
'     from gi_d_subimpuestos_adjnto_tp   a',
'     join apex_collections			    b on b.collection_name = ''ADJUNTOS_RENTA''',
'      and a.id_sbmpto_adjnto_tpo        = b.n001 ',
'      and a.indcdor_oblgtrio            = ''S''',
'      and dbms_lob.getlength(blob001)   > 0'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Para continuar debe ingresar adjuntos obligatorios'
,p_when_button_pressed=>wwv_flow_api.id(5447010039595472)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86573801916659610)
,p_name=>'Setear tipo de archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P203_FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86573994936659611)
,p_event_id=>wwv_flow_api.id(86573801916659610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function Restringir_Archivo_Tipo($this) { ',
'',
'    var file = $this.triggeringElement.files[0];',
'',
'        if (file !== undefined ) {',
'             vTipo = new String( file.type );',
'             vTamano = new String( file.size );',
'             apex.item(''P203_ARCHVO_TPO'').setValue(vTipo);',
'             apex.item(''P203_ARCHVO_TMNO'').setValue(vTamano);',
'        }',
' }',
'',
'',
'Restringir_Archivo_Tipo(this);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86574265179659614)
,p_event_id=>wwv_flow_api.id(86573801916659610)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_archvo_tpo         varchar2(100);',
'    v_archivo_tamano     number;',
'    v_tamano            number;',
'begin ',
'    select b.extncion, b.tmno_mxmo ',
'    into v_archvo_tpo, v_archivo_tamano',
'    from gi_d_subimpuestos_adjnto_tp a',
'         join v_gi_d_sbmpsts_adjnto_tp_frmt    b on a.id_sbmpto_adjnto_tpo = b.id_sbmpto_adjnto_tpo',
'    where   a.id_impsto_sbmpsto             = :P200_ID_IMPSTO_SBMPSTO',
'        and a.id_sbmpto_adjnto_tpo          = :P203_ID_SBMPSTO_ADJNTO_TPO',
'        and b.extncion                      = :P203_ARCHVO_TPO',
'        and a.actvo = ''S'';',
'   ',
'        v_tamano :=  to_number(:P203_ARCHVO_TMNO/1024/1024);',
'     ',
'        if v_archivo_tamano < v_tamano then ',
'           apex_util.set_session_state(''P203_RSPSTA'', ''MAYOR'');',
'        else',
'             apex_util.set_session_state(''P203_RSPSTA'', ''ENCONTRO'');',
'        end if;',
'        ',
' exception',
'     when others then ',
'         apex_util.set_session_state(''P203_RSPSTA'', ''NO_ENCONTRO'' );',
'        ',
'end;'))
,p_attribute_02=>'P203_ARCHVO_TPO,P203_ARCHVO_TMNO,P203_ID_SBMPSTO_ADJNTO_TPO'
,p_attribute_03=>'P203_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86574537076659617)
,p_event_id=>wwv_flow_api.id(86573801916659610)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P203_RSPSTA'') == ''ENCONTRO'' ){',
'    // tipo de archivo valido',
'   apex.item(''BTN_AGREGAR_ADJUNTO'').enable();',
' ',
'}',
'',
'else if  ($v(''P203_RSPSTA'') == ''MAYOR''){',
unistr('    // Archivo con tama\00F1o superior al permitido'),
'    apex.item(''BTN_AGREGAR_ADJUNTO'').disable();',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >RENTAS VARIAS</H2>'',',
unistr('        html: ''<H4>El Tama\00F1o del archivo supera lo permitido</H4>''        '),
'    });',
' }',
'',
'else if  ($v(''P203_RSPSTA'') == ''NO_ENCONTRO'' ){',
'    // No existe el tipo de archivo',
'    apex.item(''BTN_AGREGAR_ADJUNTO'').disable();',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >RENTAS VARIAS</H2>'',',
'        html: ''<H4>El Tipo de archivo no es permitido</H4>''        ',
'    });',
'   ',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5453523948595521)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''ADJUNTOS_RENTA'',',
'        p_seq => :P203_SEQ_ID);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST = ''ELIMINAR_ADJUNTO'' and :P203_SEQ_ID is not null'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'Adjunto Eliminado Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(84590584415122406)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear Colecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (not apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_RENTA'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ADJUNTOS_RENTA'');',
'        end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5452764080595520)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob blob;',
'     v_seq  varchar2(4000);',
'     r_temp_files apex_application_temp_files%rowtype;',
'begin',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P203_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_RENTA'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ADJUNTOS_RENTA'');',
'        end if;',
'        ',
'        apex_collection.add_member( p_collection_name   => ''ADJUNTOS_RENTA''',
'                                  , p_n001              => :P203_ID_SBMPSTO_ADJNTO_TPO ',
'                                  , p_c001              => :P203_OBSRVCION',
'                                  , p_c002              => r_temp_files.filename',
'                                  , p_c003              => r_temp_files.mime_type',
'                                  , p_blob001           => r_temp_files.blob_content );',
'             ',
'    end if;',
'end;'))
,p_process_error_message=>'Error al registrar el adjunto #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5448157788595473)
,p_process_success_message=>'Adjunto agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5453129063595521)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar los items luego de agregar un adjunto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P203_FILE_BLOB,P203_SEQ_ID,P203_OBSRVCION,P203_ID_SBMPSTO_ADJNTO_TPO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5448157788595473)
);
end;
/
