prompt --application/pages/page_20250_003
begin
wwv_flow_api.create_page(
 p_id=>2025033
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Certificado de Responsabilidades'
,p_step_title=>'Certificado de Responsabilidades'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#APP_IMAGES#xlsx.min.js',
'#APP_IMAGES#FileSaver.min.js'))
,p_javascript_code_onload=>'$(''#BTN_GNRAR_CRTFCDO'').hide();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.BTN-CONSULTAR{',
'    margin-top: 7px;',
'}',
'',
'.t-MediaList--cols.t-MediaList--4cols .t-MediaList-item {',
'    width: 24%;',
'}',
'',
'.t-MediaList--cols .t-MediaList-item {',
'    border-radius: 19px;',
'    border-color: inherit;',
'    position: relative;',
'    border-style: solid;',
'    border-width: 0.5px 0.5px 0.5px 0;',
'    -webkit-box-shadow: 4px 3px 33px -16px rgba(89, 89, 89, 0.58);',
'    -moz-box-shadow: 4px 3px 33px -16px rgba(89,89,89,1);',
'    box-shadow: 0px 0px 30px -16px rgba(89, 89, 89, 0.35);',
'    margin: 5px;',
'    border-color: #efefef;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251017150357'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12977767498513201)
,p_plug_name=>unistr('B\00FAsqueda Sujeto Tributo')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12978287599513206)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12980388499513227)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(12978287599513206)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'',
'<h4 style="text-align: center;">Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></h4>',
'',
'<p style="text-align: justify;">',
unistr('    En esta opci\00F3n se pueden generar certificados de responsabilidad a cada sujeto impuesto.'),
'</p>',
'',
'<p style="text-align: justify;">',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad, dir\00EDjase al Manual de Usuario.'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12978687644513210)
,p_plug_name=>'Sujeto Tributo'
,p_region_name=>'sujeto'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct idntfccion_sjto, nmbre_rzon_scial',
'  from (select s.idntfccion_sjto, trim(p.nmbre_rzon_scial) nmbre_rzon_scial',
'          from v_si_i_sujetos_impuesto s',
'          join si_i_personas p',
'            on p.id_sjto_impsto = s.id_sjto_impsto',
'         where s.idntfccion_sjto like ''%'' || :P2025033_IDNTFCCION || ''%''',
'           and s.cdgo_clnte = :F_CDGO_CLNTE',
'        union',
'        select r.idntfccion,',
'               trim(replace(replace(r.prmer_nmbre || '' '' || r.sgndo_nmbre || '' '' ||',
'               r.prmer_aplldo || '' '' || r.sgndo_aplldo,''  '','' ''),'' .'',''''))',
'          from si_i_sujetos_responsable r',
'          join si_i_sujetos_impuesto i',
'            on i.id_sjto_impsto = r.id_sjto_impsto',
'         where r.idntfccion like ''%'' || :P2025033_IDNTFCCION || ''%'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2025033_IDNTFCCION'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12979016821513214)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12979803401513222)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89960734155975917)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(12978763254513211)
,p_internal_uid=>12978763254513211
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>true
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(12999319380273139)
,p_interactive_grid_id=>wwv_flow_api.id(12978763254513211)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(12999456234273140)
,p_report_id=>wwv_flow_api.id(12999319380273139)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13000908682273149)
,p_view_id=>wwv_flow_api.id(12999456234273140)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(12979016821513214)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110898652606521168)
,p_view_id=>wwv_flow_api.id(12999456234273140)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(89960734155975917)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12978532664513209)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(12978287599513206)
,p_button_name=>'BTN_GNRAR_CRTFCDO'
,p_button_static_id=>'BTN_GNRAR_CRTFCDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Certificado'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-clipboard-edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12978321323513207)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(12978287599513206)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12978179591513205)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(12977767498513201)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_css_classes=>'BTN-CONSULTAR'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>6
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12980460589513228)
,p_branch_name=>'Go To Page 2025034'
,p_branch_action=>'f?p=&APP_ID.:2025034:&SESSION.::&DEBUG.:RP:P2025034_IDNTFCCION_SJTO,P2025033_IDNTFCCION:&P2025033_IDNTFCCION_SJTO.,&P2025033_IDNTFCCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(12978532664513209)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12977849213513202)
,p_name=>'P2025033_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(12977767498513201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12977979418513203)
,p_name=>'P2025033_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(12977767498513201)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12980289154513226)
,p_name=>'P2025033_IDNTFCCION_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(12978687644513210)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12980071452513224)
,p_name=>'Al seleccionar registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(12978687644513210)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12980185476513225)
,p_event_id=>wwv_flow_api.id(12980071452513224)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function datoSujeto() {',
unistr('    console.log(''Entrando a la funci\00F3n: datoSujeto'');'),
'',
'    var view = apex.region("sujeto").widget().interactiveGrid("getCurrentView");',
'    var model = view.model;',
'    var records = view.getSelectedRecords();',
'',
'    if (records.length === 0) {',
'        console.log("No hay sujeto seleccionado.");',
'        return;',
'    }',
'',
'    // Tomar el primer IDNTFCCION_SJTO de los registros seleccionados',
'    var idCntrto = model.getValue(records[0], ''IDNTFCCION_SJTO'');',
'',
'    console.log(''datoSujeto seleccionado:'', idCntrto);',
'',
'    // Guardar en localStorage',
'    window.localStorage.setItem(''idCntrto'', idCntrto);',
'',
'    // Guardar en un item APEX',
'    apex.item("P2025033_IDNTFCCION_SJTO").setValue(idCntrto);',
'',
'    console.log("IDNTFCCION_SJTO guardado:", idCntrto);',
'    ',
'    // Resfrescamos el Item',
'    apex.item("P2025033_IDNTFCCION_SJTO").refresh();',
'    ',
'    // Verificar en consola',
unistr('    console.log("IDNTFCCION_SJTO guardado en el \00EDtem:", apex.item("P2025033_IDNTFCCION_SJTO").getValue());'),
'',
'    $(''#BTN_GNRAR_CRTFCDO'').show();',
'',
'}',
'',
'datoSujeto();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12979934920513223)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(12978687644513210)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Sujeto Tributo - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
