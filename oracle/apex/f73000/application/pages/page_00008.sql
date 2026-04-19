prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'Documentos'
,p_step_title=>'Documentos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'async function consultar() {',
'    var json = [];',
'    $(''[id*="INP"]'').each(function () {',
'        var id = $(this).attr(''id'');',
'        var valor = $v(id);',
'        if (valor) {',
'            json.push({ ''key'': id, ''value'': valor });',
'        }',
'    });',
'',
'    $s(''P8_JSON_O'', JSON.stringify(json));',
'',
'    await apex.server.process(''Synch_Column'', {',
'        pageItems: ''#P8_JSON_O,#P8_ID_DCMNTO_TPO''',
'    }).then((resp) => { ',
'        if (resp.type === ''OK'') {',
'            apex.region(''region_datas'').refresh();',
'        }',
'    });',
'};',
'',
'async function synchronize() {',
'    await apex.server.process(''Synch_Column'', {',
'        pageItems: ''#P8_JSON_O,#P8_ID_DCMNTO_TPO''',
'    });',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#region_datas'').hover(async function(){    ',
'    await apex.server.process(''Synch_Column'', {',
'        pageItems: ''#P8_JSON_O,#P8_ID_DCMNTO_TPO''',
'    });',
'})'))
,p_step_template=>wwv_flow_api.id(76345756650582452)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'122333'
,p_last_upd_yyyymmddhh24miss=>'20191219183746'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6020088137699415)
,p_plug_name=>'Datas'
,p_region_name=>'region_datas'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_plug_source=>' return pkg_gd_gestion_documental.fnc_co_metadatas(p_id_dcmnto_tpo => :P8_ID_DCMNTO_TPO , p_cdgo_clnte => :F_CDGO_CLNTE , p_json => :P8_JSON_O);'
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
 p_id=>wwv_flow_api.id(6020970079699424)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9,11:P9_ID_DCMNTO:#1.Consecutivo#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'MCARO'
,p_internal_uid=>6020970079699424
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13176739536399966)
,p_db_column_name=>'1.Consecutivo'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Consecutivo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13177403276399967)
,p_db_column_name=>unistr('1.N\00FAmero de documento')
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero De Documento')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13178109840399967)
,p_db_column_name=>'1.Nombre de Documento'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Nombre De Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49305625628436806)
,p_db_column_name=>'Fecha de registro'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Fecha De Registro'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6153585378776895)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'61536'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>unistr('1.Consecutivo:1.N\00FAmero de documento:1.Nombre de Documento:Fecha de registro')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6161700802811305)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6162141488811309)
,p_plug_name=>'Meta-datas'
,p_region_name=>'metadatos'
,p_parent_plug_id=>wwv_flow_api.id(6161700802811305)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'htp.p(pkg_gd_gestion_documental.fnc_gn_region_metadatos( p_id_dcmnto_tpo => :P8_ID_DCMNTO_TPO, p_cdgo_clnte => :F_CDGO_CLNTE));'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from gd_d_documentos_tipo_mtdta where id_dcmnto_tpo = :P8_ID_DCMNTO_TPO;'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7577328788079328)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
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
'Esta Funcionalidad permite:<br><br>',
'<b>1.</b> Consultar los documentos por Tipo y sus Metadatos asociados.<br><br>',
unistr('<b>2.</b> Consultar un documento espec\00EDfico, hacer clic en el \00EDcono de l\00E1piz de los documentos presentados en la regi\00F3n central, el usuario ser\00E1 direccionado a la p\00E1gina de gesti\00F3n del documento seleccionado.<br><br>	'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7577415077079329)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>' <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7577680308079331)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7577415077079329)
,p_button_name=>'NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9,11::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28573649834727801)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6162141488811309)
,p_button_name=>'BTN_LMPIAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'Restablecer'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7574991457079304)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6162141488811309)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6161829560811306)
,p_name=>'P8_ID_DCMNTO_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6161700802811305)
,p_prompt=>'Tipo de Documento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_dcmnto_tpo || ''-'' || nmbre',
'     , id_dcmnto_tpo ',
'  from gd_d_documentos_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(76429586900582500)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de documento a consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7576032499079315)
,p_name=>'P8_JSON_O'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6161700802811305)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6161933742811307)
,p_name=>'al cambiar el tipo de documento'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_DCMNTO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7575498325079309)
,p_event_id=>wwv_flow_api.id(6161933742811307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$s(''P8_JSON_O'', ''[]'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6162087035811308)
,p_event_id=>wwv_flow_api.id(6161933742811307)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7575088631079305)
,p_name=>unistr('al hacer clic en el bot\00F3n consultar ')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7574991457079304)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7575180408079306)
,p_event_id=>wwv_flow_api.id(7575088631079305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'consultar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28573703370727802)
,p_name=>unistr('al hacer clic en el bot\00F3n limpiar')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(28573649834727801)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28573831324727803)
,p_event_id=>wwv_flow_api.id(28573703370727802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var inputs = $(''#metadatos input, #metadatos select, #metadatos textarea'')',
'',
'$.each(inputs, function(){',
'    $s($(this).attr(''id''), '''');',
'});    ',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6161583347811303)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sincronizar columnas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_flow_id   number;',
'    v_region_id number;',
'    v_query     clob;',
'    v_result    varchar2(4000);',
'    v_id        number;',
'',
'begin',
'    lock table apex_190100.wwv_flow_worksheet_columns  in exclusive mode;',
'    v_query := pkg_gd_gestion_documental.fnc_co_metadatas(p_id_dcmnto_tpo => :P8_ID_DCMNTO_TPO , p_cdgo_clnte => :F_CDGO_CLNTE, p_json => :P8_JSON_O);',
'    --wwv_flow_api.set_security_group_id(apex_util.find_security_group_id(''INFORTRIBUTOS''));',
'',
'    select application_id',
'         , region_id',
'      into v_flow_id',
'         , v_region_id',
'      from apex_application_page_ir',
'     where page_id = :APP_PAGE_ID ',
'       and application_id = :APP_ID       ',
'       and region_name = ''Datas'';',
'',
'    apex_190100.wwv_flow_worksheet_standard.synch_report_columns( p_flow_id                     => v_flow_id',
'                                                                , p_region_id                   => v_region_id',
'                                                                , p_query                       => v_query',
'                                                                , p_add_new_cols_to_default_rpt => ''Y'');',
'       ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6163862787811326)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'al cargar los datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_flow_id   number;',
'    v_region_id number;',
'    v_query     clob;',
'    v_result    varchar2(4000);',
'    v_id        number;',
'',
'begin',
'    lock table apex_190100.wwv_flow_worksheet_columns  in exclusive mode;',
'    v_query := pkg_gd_gestion_documental.fnc_co_metadatas(p_id_dcmnto_tpo => :P8_ID_DCMNTO_TPO , p_cdgo_clnte => :F_CDGO_CLNTE, p_json => :P8_JSON_O);',
'    --wwv_flow_api.set_security_group_id(apex_util.find_security_group_id(''INFORTRIBUTOS''));',
'',
'    select application_id',
'         , region_id',
'      into v_flow_id',
'         , v_region_id',
'      from apex_application_page_ir',
'     where page_id = :APP_PAGE_ID ',
'       and application_id = :APP_ID       ',
'       and region_name = ''Datas'';',
'',
'    apex_190100.wwv_flow_worksheet_standard.synch_report_columns( p_flow_id                     => v_flow_id',
'                                                                , p_region_id                   => v_region_id',
'                                                                , p_query                       => v_query',
'                                                                , p_add_new_cols_to_default_rpt => ''Y'');',
'       ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7576237156079317)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Synch_Column'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_flow_id   number;',
'    v_region_id number;',
'    v_query     clob;',
'    v_result    varchar2(4000);',
'    v_id        number;',
'',
'begin',
'    lock table apex_190100.wwv_flow_worksheet_columns  in exclusive mode;',
'    v_query := pkg_gd_gestion_documental.fnc_co_metadatas(p_id_dcmnto_tpo => :P8_ID_DCMNTO_TPO , p_cdgo_clnte => :F_CDGO_CLNTE, p_json => :P8_JSON_O);',
'    --wwv_flow_api.set_security_group_id(apex_util.find_security_group_id(''INFORTRIBUTOS''));',
'',
'    select application_id',
'         , region_id',
'      into v_flow_id',
'         , v_region_id',
'      from apex_application_page_ir',
'     where page_id = :APP_PAGE_ID ',
'       and application_id = :APP_ID       ',
'       and region_name = ''Datas'';',
'',
'    apex_190100.wwv_flow_worksheet_standard.synch_report_columns( p_flow_id                     => v_flow_id',
'                                                                , p_region_id                   => v_region_id',
'                                                                , p_query                       => v_query',
'                                                                , p_add_new_cols_to_default_rpt => ''Y'');',
'       ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.close_object;   ',
'exception',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'' , sqlerrm);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
