prompt --application/pages/page_00148
begin
wwv_flow_api.create_page(
 p_id=>148
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Selecci\00F3n Desembargo Masivo')
,p_step_title=>'Desembargos Masivos '
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function datos_resoluciones() {',
'    ',
'    var region = apex.region("Rslcnes_Embrgo");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim()',
'                     /*"ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "ID_IF": model.getValue(record, "ID_INSTNCIA_FLJO").trim(),*/',
'                   };',
'        });',
'        ',
'      window.localStorage.setItem(''jsonRslcnesEmbargo'', JSON.stringify(json));',
'  }',
'}',
'',
'//Generacion de oficios',
'const RegistrarDatos = () => {',
'    var json = window.localStorage.jsonRslcnesEmbargo;',
'    var $waitPopup;',
'    console.log(''Json: ''+json);',
'  console.log(''Ejecuto la funcion GenerarDocumentosEmbargoOficio'');',
'    try {',
'        //JSON.parse(json);',
unistr('        apex.message.confirm(''\00BFEst\00E1 seguro de enviar los registros para generar los actos de embargo?'', (ok) => {'),
'            if (ok) {',
'                if (apex.page.validate()) {',
'                    $waitPopup = apex.widget.waitPopup();',
'                    apex.server.process("Guardar_Datos", {',
'                        f01: json,',
'                        pageItems: "#P148_ID_CSLES_DSMBRGO,#P148_OBSERVACION,#P148_ESTADO_SLCTUD"',
'                    }).then((resp) => {',
'                        $waitPopup.remove();',
'                        if (resp.o_cdgo_rspsta === 0) {',
'                            Swal.fire(        ',
unistr('                                        ''<h2><b>\00A1El proceso se ha iniciado correctamente!</b></h2>'','),
'                                        ''<h3>Se registraron los desembargos seleccionados</h3>'',',
'                                        ''success''',
'                            ).then((result) => {',
'                                //apex.submit();',
'                                if (resp.o_url !== ''#''){',
'                                    window.location.href = '''';',
'                                }',
'',
'                            });',
'                            //window.location.href = '''';',
'                        }else{',
'                            Swal.fire({        ',
'                                icon: ''error'',',
unistr('                                title:  ''<H2 >Validaci\00F3n</H2>'','),
'                                html:   `<h4>${resp.o_cdgo_rspsta+'' - ''+resp.o_mnsje_rspsta}</h4>`',
'                            }).then((result) => {',
'                                //$(elm).val('''');',
'                            }); ',
'                        }',
'                    });',
'                }',
'            }',
'        })',
'',
'    } catch (e) {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: ["page"],',
'                message: "No se encontraron datos seleccionados",',
'                unsafe: false',
'            }]);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20220531153022'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187465026337158022)
,p_plug_name=>unistr('Registro Opci\00F3n Desembargo')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187465357767158025)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187572217734474902)
,p_plug_name=>'Resoluciones de Embargo'
,p_region_name=>'Rslcnes_Embrgo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto,',
'        trunc(a.fcha_acto) as fcha_acto,',
'        a.dscrpcion_tipo_embargo,',
'        a.idntfccion,a.vgncias,',
'        a.id_embrgos_rslcion',
'from v_mc_g_embargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.nmro_acto is not null',
'and not exists (select 1',
'                  from mc_g_desembargos_solicitud b',
'                 where b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                   and b.estado_slctud in (''S'',''A'',''F''))',
'and (a.nmro_acto = :P148_NMRO_ACTO or :P148_NMRO_ACTO is null)',
'and (:P148_FECHA_SOLICITUD_DSDE is null or trunc(a.fcha_acto) >= trunc(to_date(:P148_FECHA_SOLICITUD_DSDE,''DD/MM/YYYY'')))',
'and (:P148_FECHA_SOLICITUD_HSTA is null or trunc(a.fcha_acto) <= trunc(to_date(:P148_FECHA_SOLICITUD_HSTA,''DD/MM/YYYY'')))'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(187466841722158040)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(187466930464158041)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(187575338697474933)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(187576152718474941)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(187576277967474942)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_api.id(187576337970474943)
,p_name=>'DSCRPCION_TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TIPO_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n Tipo Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(187576455303474944)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(187576561803474945)
,p_name=>'VGNCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(187574469133474924)
,p_internal_uid=>187574469133474924
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD'
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
 p_id=>wwv_flow_api.id(187602682568637884)
,p_interactive_grid_id=>wwv_flow_api.id(187574469133474924)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(187602704170637906)
,p_report_id=>wwv_flow_api.id(187602682568637884)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187607179614637973)
,p_view_id=>wwv_flow_api.id(187602704170637906)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(187575338697474933)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187615761106297636)
,p_view_id=>wwv_flow_api.id(187602704170637906)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(187576152718474941)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187616258046297640)
,p_view_id=>wwv_flow_api.id(187602704170637906)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(187576277967474942)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187616753783297643)
,p_view_id=>wwv_flow_api.id(187602704170637906)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(187576337970474943)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187617252146297645)
,p_view_id=>wwv_flow_api.id(187602704170637906)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(187576455303474944)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187617748844297647)
,p_view_id=>wwv_flow_api.id(187602704170637906)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(187576561803474945)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187898251402118174)
,p_view_id=>wwv_flow_api.id(187602704170637906)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(187466841722158040)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187625441079487614)
,p_plug_name=>unistr('Par\00E1metros de Busqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187762823500853310)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'<p>Funcionalidad que permite seleccionar un lote de resoluciones de embargo para ser registradas en desembargos</p><br>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187465285389158024)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(187625441079487614)
,p_button_name=>'BTN_CNSLTR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187465406344158026)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(187465357767158025)
,p_button_name=>'BTN_PRCSAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar en <br> Desembargos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187467142649158043)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(187465357767158025)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:115:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-external-link'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187465114769158023)
,p_name=>'P148_NMRO_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(187625441079487614)
,p_prompt=>'Numero Acto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187466092324158032)
,p_name=>'P148_ESTADO_SLCTUD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(187465026337158022)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_aprbcion_drcta varchar2(3);',
'    v_estdo_slctud varchar2(3);',
'begin',
'    v_aprbcion_drcta := pkg_cb_proceso_persuasivo.fnc_cl_parametro_configuracion(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                                                       p_cdgo_cnfgrcion => ''ADD'');',
'    ',
'    v_estdo_slctud := ''S''; -- Solicitado',
'    ',
unistr('    -- Si el par\00E1metro de configraci\00F3n "ADD" retorna "S"'),
'    -- entonces el estado de la solicitd se registra en aprobada (A)',
'    if v_aprbcion_drcta = ''S'' then',
'        v_estdo_slctud := ''A''; -- Aprobada',
'    end if;',
'    ',
'    return v_estdo_slctud;',
'    ',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187625633813487616)
,p_name=>'P148_FECHA_SOLICITUD_DSDE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(187625441079487614)
,p_prompt=>'Fecha Solicitud Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha inicial de la solicitud de desembargo.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187625725214487617)
,p_name=>'P148_FECHA_SOLICITUD_HSTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(187625441079487614)
,p_prompt=>'Fecha Solicitud Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha final de la solicitud de desembargo.'
,p_attribute_02=>'&P148_FECHA_SOLICITUD_DSDE.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187625879481487618)
,p_name=>'P148_ID_CSLES_DSMBRGO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(187465026337158022)
,p_prompt=>'Causales de Desembargo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and slctud_fncnrio = ''S'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la causal de desembargo a consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187762764804853309)
,p_name=>'P148_OBSERVACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(187465026337158022)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>3
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(187465590051158027)
,p_name=>'Al_seleccionar_registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(187572217734474902)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187465653744158028)
,p_event_id=>wwv_flow_api.id(187465590051158027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'datos_resoluciones();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(187465808476158030)
,p_name=>'Clic_BTN_PRCSAR'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(187465406344158026)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187465911279158031)
,p_event_id=>wwv_flow_api.id(187465808476158030)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'RegistrarDatos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187467085888158042)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(187572217734474902)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Resoluciones de Embargo - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187465798692158029)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar_Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_resolucion         number;',
'  v_id_dsmbrgo_slctud  number;',
'  v_json               clob;',
'  o_cdgo_rspsta        number;',
'  o_mnsje_rspsta       varchar2(4000);',
'begin',
'  ',
'  for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json :=  v_json || apex_application.g_f01(i);',
'  end loop;',
'  ',
'  if (:P148_ID_CSLES_DSMBRGO is not null and :P148_OBSERVACION is not null) then',
'      for c_rslcnes in (select id_embrgo_rslcion ',
'                        from json_table(v_json,''$[*]''',
'                                        columns (id_embrgo_rslcion number PATH ''$.ID_ER''',
'                                        ))) loop',
'',
'      insert into mc_g_desembargos_solicitud ',
'                  (  CDGO_CLNTE',
'                    , ESTADO_SLCTUD',
'                    , FCHA_SLCTUD',
'                    , ID_CSLES_DSMBRGO',
'                    , ID_EMBRGOS_RSLCION',
'                    , ID_FNCNRIO',
'                    , OBSRVCION',
'                    , TPO_SLCTUD)',
'              values',
'                    ( :F_CDGO_CLNTE',
'                    , :P148_ESTADO_SLCTUD',
'                    , sysdate',
'                    , :P148_ID_CSLES_DSMBRGO',
'                    , c_rslcnes.id_embrgo_rslcion',
'                    , :F_ID_FNCNRIO',
'                    , :P148_OBSERVACION',
'                    , ''FN'')',
'            returning id_dsmbrgo_slctud into v_id_dsmbrgo_slctud;',
'',
'            for c_datos in (select *',
'                          from v_mc_g_solicitudes_y_oficios a',
'                         where a.id_embrgos_rslcion = c_rslcnes.id_embrgo_rslcion) loop',
'',
'                         insert into mc_g_dsmbrgs_slctd_entdds',
'                         (  ID_DSMBRGO_SLCTUD',
'                            ,ID_EMBRGOS_RSLCION',
'                            ,ID_ENTDDES',
'                            ,ID_SLCTD_OFCIO) ',
'                         values',
'                         (  v_id_dsmbrgo_slctud',
'                          , :P116_ID_EMBRGOS_RSLCION',
'                          , c_datos.ID_ENTDDES',
'                          , c_datos.ID_SLCTD_OFCIO',
'                         );',
'            end loop;',
'         end loop;',
'         commit;',
'         o_cdgo_rspsta := 0;',
'         o_mnsje_rspsta := ''OK'';',
'     else',
'       o_cdgo_rspsta := 10;',
unistr('       o_mnsje_rspsta := ''Por favor verifique la causal de desembargo o la observaci\00F3n tengan datos.'';'),
'     end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object;',
'     ',
'     exception when others then',
'       o_cdgo_rspsta := 100;',
'       o_mnsje_rspsta := ''Callback: Error al registrar los desembargos. ''||sqlerrm;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'        apex_json.close_object;',
unistr('      raise_application_error(-20001, ''No se pudo realizar la inserci\00F3n: ''||SQLERRM);'),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
