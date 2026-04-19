prompt --application/pages/page_00124
begin
wwv_flow_api.create_page(
 p_id=>124
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Generar_Documentos_Desembargos'
,p_page_mode=>'MODAL'
,p_step_title=>'Generar Documentos de Desembargo'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*function validar_sel() {',
'',
'    var region = apex.region("entidades");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'                              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_ENTDDES": model.getValue(record, "ID_ENTDDES").trim(),',
'                     "OFCIO_X_PRPTRIO": model.getValue(record, "OFCIO_X_PRPTRIO").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P67_JSON_ENTDDES'', json.length > 0 ? JSON.stringify(json) : '''');',
'               ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("BTN_INCIAR_MC").show();',
'        }else {',
'            apex.item("BTN_INCIAR_MC").hide();',
'        }',
'        ',
'        //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID ',
'        //apex.region("entidades").widget().interactiveGrid("setSelectedRecords", records);',
'        return;',
'    }',
'    ',
'    //console.log(json);',
'    ',
'    apex.item("BTN_INCIAR_MC").hide();',
'   ',
'}',
'*/',
'',
'var json = window.localStorage.jsonResolucionesDesembargo;',
'let $waitPopup;',
'',
'const fnGenerarDocumentosDesembargo = () => {',
'try {',
'    JSON.parse(json);',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de generar el/los documentos de el/los desembargo(s)?'', (ok) => {'),
unistr('        console.log(''Llamado a la funci\00F3n fnGenerarDocumentosEmbargo()'');'),
'        if (ok) {',
'            if (apex.page.validate()) {',
'                $waitPopup = apex.widget.waitPopup();',
'                apex.server.process("GenerarDocumentosDesembargos", {',
'                    f01: json,',
'                    pageItems: "#P124_TPO_PLNTLLA,#P124_ID_PLNTLLA_RSLCION,#P124_ID_PLNTLLA_OFICIO,#P124_JSON_ENTDDES,#P124_GNRA_OFCIO"',
'                }).then((resp) => {',
'                    //$waitPopup.remove();',
'                    if (resp.o_cdgo_rspsta == 0) {',
'                        console.log(''Codigo Respuesta: ''+resp.o_cdgo_rspsta);',
'                          if ( $v(''P124_PRMTRO_GDD'') == ''A''){',
'                               console.log(''Llamara a la otra funcion! - Parametro: ''+$v(''P124_PRMTRO_GDD''));',
'                              ',
'                                //$waitPopup = apex.widget.waitPopup();',
'                                return fnGenerarActosDesembargo();',
'                                 $waitPopup.remove();',
'                                 apex.message.showPageSuccess(''Proceso realizado de forma exitosa! ''+resp.o_mnsje_rspsta);',
'                                 window.location.href = resp.o_url;',
'                            }else{',
'                                if (resp.o_url !== ''#''){',
'                                    window.location.href = resp.o_url;',
'                                }',
'                            }',
'                        ',
'                        $waitPopup.remove();',
'                        /*apex.message.showPageSuccess(resp.msg);',
'                        window.location.href = resp.url;*/',
'                    }',
'                });',
'            }',
'        }',
'    })',
'',
'} catch (e) {',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'        {',
'            type: "error",',
'            location: ["page"],',
'            message: "No se encontraron datos seleccionados",',
'            unsafe: false',
'        }]);',
'} finally {',
'    if ($waitPopup)',
'        $waitPopup.remove();',
'}',
'}',
'',
'',
'const fnGenerarActosDesembargo = () => {',
'    var json = window.localStorage.jsonResolucionesDesembargo;',
'    let $waitPopup;',
'    ',
'    try {',
'',
unistr('        //apex.message.confirm(''\00BFEst\00E1 seguro de enviar los registros para generar los actos de embargo?'', (ok) => {'),
'            //if (ok) {',
'                if (apex.page.validate()) {',
'                    $waitPopup = apex.widget.waitPopup();',
'                    apex.server.process("GenerarActosDesembargo", {',
'                        f01: json,',
'                        pageItems: ""',
'                    }).then((resp) => {',
'                        //$waitPopup.remove();',
'                        console.log(''respuesta funcion 2'', resp);',
'                        ',
'                        if (resp.o_cdgo_rspsta == 0) {',
'                            console.log(''Codigo Respuesta: '', resp.o_cdgo_rspsta);',
'                            window.location.href = resp.o_url;',
'                            //window.location.href = '''';',
'                            //$waitPopup.remove();',
'                        }else{',
'                            Swal.fire({        ',
'                                icon: ''error'',',
unistr('                                title:  ''<H2 >Validaci\00F3n</H2>'','),
'                                html:   `<h4>${resp.o_cdgo_rspsta+''-''+resp.o_mnsje_rspsta}</h4>`',
'                            }).then((result) => {',
'                                //$(elm).val('''');',
'                            }); ',
'                        }',
'                    });',
'                }',
'            //}',
'        //})',
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
'}',
'',
'const fnGenerarDocumentosDesembargoJob = () => {',
unistr('    console.log(''Ejecuto la funci\00F3n fnGenerarDocumentosDesembargoJob'' );'),
'    console.log(json);',
'    //var json = window.localStorage.jsonResolucionesDesembargo;',
'    //let $waitPopup;',
'    try {',
'        JSON.parse(json);',
unistr('        apex.message.confirm(''\00BFEst\00E1 seguro de generar el/los documentos de el/los embargo(s)?'', (ok) => {'),
'            if (ok) {',
'                if (apex.page.validate()) {',
'                    $waitPopup = apex.widget.waitPopup();',
'                    apex.server.process("GenerarDocumentosActosDesembargo", {',
'                        f01: json,',
'                        pageItems: "#P124_TPO_PLNTLLA,#P124_ID_PLNTLLA_RSLCION,#P124_ID_PLNTLLA_OFICIO,#P124_GNRA_OFCIOS"',
'                    }).then((resp) => {',
'                        //$waitPopup.remove();',
'                        if (resp.o_cdgo_rspsta === 0) {',
'                            $waitPopup.remove();',
'                            Swal.fire(',
unistr('                                      ''<h2><b>\00A1El proceso se ha iniciado correctamente!</b></h2>'','),
'                                      ''<h3>'' + ''Se ha enviado un correo electronico a '' + resp.correo + ''</h3>'',',
'                                      ''success''',
'                                    ).then((result) => {',
'                                        apex.navigation.dialog.close(true);',
'                                        window.location.href = resp.o_url;',
'                                    });',
'                        }else{',
'                            Swal.fire({        ',
'                                icon: ''error'',',
unistr('                                title:  ''<H2 >Validaci\00F3n</H2>'','),
'                                html:   `<h4>${resp.o_cdgo_rspsta+''-''+resp.o_mnsje_rspsta}</h4>`',
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
'                message: "No se encontraron datos seleccionados. "+e,',
'                unsafe: false',
'            }]);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'',
'}',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//validar_sel();',
'',
'//apex.region("entidades").widget().interactiveGrid("setSelectedRecords", []);'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20220622193252'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(250302929437531293)
,p_plug_name=>'Entidades x Tipo de Embargo'
,p_region_name=>'entidades'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(252786863481205248)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(252786999616205249)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(252787139298205250)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Entidad'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(252787167063205251)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(252787359538205253)
,p_name=>'DSCRPCION_TPO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TPO_EMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Medida Cautelar'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(252787544066205254)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(252787629452205255)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(252787928236205258)
,p_name=>'OFCIO_X_PRPTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OFCIO_X_PRPTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(261955387816495661)
,p_name=>'ID_TPOS_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_MDDA_CTLAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(252786822218205247)
,p_internal_uid=>252786822218205247
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(252814219475272605)
,p_interactive_grid_id=>wwv_flow_api.id(252786822218205247)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(252814283254272605)
,p_report_id=>wwv_flow_api.id(252814219475272605)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(252814848019272606)
,p_view_id=>wwv_flow_api.id(252814283254272605)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(252786863481205248)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(252815302227272609)
,p_view_id=>wwv_flow_api.id(252814283254272605)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(252786999616205249)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(252815815727272611)
,p_view_id=>wwv_flow_api.id(252814283254272605)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(252787139298205250)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(252816336780272612)
,p_view_id=>wwv_flow_api.id(252814283254272605)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(252787167063205251)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(252817288819272615)
,p_view_id=>wwv_flow_api.id(252814283254272605)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(252787359538205253)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(252817796808272616)
,p_view_id=>wwv_flow_api.id(252814283254272605)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(252787544066205254)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(252821655593413721)
,p_view_id=>wwv_flow_api.id(252814283254272605)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(252787928236205258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(262122303378429901)
,p_view_id=>wwv_flow_api.id(252814283254272605)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(261955387816495661)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(277594281755964184)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55380718108822505)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(277594281755964184)
,p_button_name=>'BTN_INCIAR_MC'
,p_button_static_id=>'BTN_INCIAR_MC'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Actos de Desembargo'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55386846950822785)
,p_branch_name=>unistr('Ir a P\00E1gina 118')
,p_branch_action=>'f?p=&APP_ID.:118:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55380718108822505)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55381160014822585)
,p_name=>'P124_JSON_CRTRA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55381488565822711)
,p_name=>'P124_ID_TIPO_EMBARGO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55381710617822712)
,p_name=>'P124_JSON_ENTDDES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55382186890822712)
,p_name=>'P124_TPO_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_prompt=>'Tipo de Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Puntual;P,Masiva;M'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55382569623822712)
,p_name=>'P124_ID_PLNTLLA_RSLCION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_prompt=>unistr('Plantilla Resoluci\00F3n de Desembargo')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_plntlla',
'from gn_d_plantillas a',
'inner join mc_d_tipos_mdda_ctlr_dcmnto b on b.id_plntlla = a.id_plntlla',
'inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar',
'and c.id_tpos_mdda_ctlar = :P124_ID_TIPO_EMBARGO',
'where a.tpo_plntlla = :P124_TPO_PLNTLLA',
'and a.actvo = ''S''',
'--and a.id_prcso = :P124_ID_PRCSO_DSMBRGO',
'and b.tpo_dcmnto = ''R''',
'and b.clse_dcmnto = ''P''',
'and b.id_csles_dsmbrgo = :P124_CSAL_DSMBRGO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P124_TPO_PLNTLLA'
,p_ajax_items_to_submit=>'P124_ID_PLNTLLA_RSLCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55382990561822713)
,p_name=>'P124_ID_PLNTLLA_OFICIO'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_prompt=>'Plantilla Oficio de Desembargo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_plntlla',
'from gn_d_plantillas a',
'inner join mc_d_tipos_mdda_ctlr_dcmnto b on b.id_plntlla = a.id_plntlla',
'inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar',
'and c.id_tpos_mdda_ctlar = :P124_ID_TIPO_EMBARGO',
'where a.tpo_plntlla = :P124_TPO_PLNTLLA',
'and a.actvo = ''S''',
'--and a.id_prcso = :P124_ID_PRCSO_DSMBRGO',
'and b.tpo_dcmnto = ''O''',
'and b.clse_dcmnto = ''P''',
'and b.id_csles_dsmbrgo = :P124_CSAL_DSMBRGO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P124_TPO_PLNTLLA'
,p_ajax_items_to_submit=>'P124_ID_PLNTLLA_RSLCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66611819124137102)
,p_name=>'P124_CSAL_DSMBRGO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153749934895710226)
,p_name=>'P124_ID_PRCSO_DSMBRGO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186989126201480505)
,p_name=>'P124_PRMTRO_GDD'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186989377450480507)
,p_name=>'P124_GNRA_OFCIO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187464987192158021)
,p_name=>'P124_GNRA_DCMNTO_JOB'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(277594281755964184)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153750009482710227)
,p_computation_sequence=>10
,p_computation_item=>'P124_ID_PRCSO_DSMBRGO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vlor',
'from cb_d_process_prssvo_cnfgrcn',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and cdgo_cnfgrcion = ''IPD'''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55385095635822730)
,p_name=>'Al seleccionar Entidad'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(250302929437531293)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55385421697822777)
,p_event_id=>wwv_flow_api.id(55385095635822730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55385814531822779)
,p_name=>'al hacer click en el boton iniciar '
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(55380718108822505)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55386333259822784)
,p_event_id=>wwv_flow_api.id(55385814531822779)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P124_GNRA_DCMNTO_JOB'') == ''N'') {',
'    fnGenerarDocumentosDesembargo();',
'}else{',
'   fnGenerarDocumentosDesembargoJob(); ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55383897021822730)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del JSON'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55383461643822729)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Embargos'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(55380718108822505)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Proceso Iniciado Correctamente!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55384272489822730)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(55380718108822505)
,p_process_success_message=>'Proceso Iniciado Correctamente!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55380047732822472)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(250302929437531293)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Entidades x Tipo de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186989011954480504)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar_parametros_configuracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_prmtros_cnfgrcion clob;',
'begin',
'    select a.VLOR',
'    into :P124_PRMTRO_GDD',
'    from cb_d_process_prssvo_cnfgrcn a',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.CDGO_CNFGRCION = ''GDD'';',
'    ',
'    select a.VLOR',
'    into :P124_GNRA_OFCIO',
'    from cb_d_process_prssvo_cnfgrcn a',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.CDGO_CNFGRCION = ''DGO'';',
'    ',
'    select a.VLOR',
'    into :P124_GNRA_DCMNTO_JOB',
'    from cb_d_process_prssvo_cnfgrcn a',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.CDGO_CNFGRCION = ''DDJ'';',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55384650661822730)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarDocumentosDesembargos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_url                      varchar2(4000);',
'    v_id_prcso_jrdco_lte_ip    number;',
'    o_cdgo_rspsta              number;',
'    o_mnsje_rspsta             varchar2(4000);',
'begin',
'     for i in 1..apex_application.g_f01.count ',
'     loop',
'         v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'                                                           ',
'   PKG_CB_MEDIDAS_CAUTELARES.prc_rg_dcmntos_dsmbargo (p_cdgo_clnte     => v(''F_CDGO_CLNTE''),',
'                                                       p_tpo_plntlla    => v(''P124_TPO_PLNTLLA''),',
'                                                       p_id_usuario     => v(''F_ID_USRIO''),',
'                                                       p_id_plntlla_rd  => v(''P124_ID_PLNTLLA_RSLCION''),',
'                                                       p_id_plntlla_od  => v(''P124_ID_PLNTLLA_OFICIO''),',
'                                                       p_json_rslciones => v_json,',
'                                                       p_json_entidades => null, --v(''P124_JSON_ENTDDES'')',
'                                                       p_gnra_ofcio     => v(''P124_GNRA_OFCIO''),',
'                                                       o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                                       o_mnsje_rspsta   => o_mnsje_rspsta',
'                                                      );',
'    ',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':118:''|| v(''APP_SESSION'')||''::NO:::'', p_checksum_type => ''SESSION'');',
'    ',
'    o_cdgo_rspsta := 0;',
'    o_mnsje_rspsta := ''Respuesta del callback'';',
'    v_url := ''#'';',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        v_url := ''#'';',
'    end if;',
'    ',
'    /*htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_prcso_jrdco_lte_ip is null ',
'                                 then ''Documentos de Desembargo(s) Generados(s) Correctamente!!''',
'                                 else ''Algunos registros no fueron procesados'' ',
'                            end||''"}'');*/',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);    ',
'    --apex_json.write(''o_gnrcion_dcmntos'', nvl(v_gnrcion_dcmntos_embrgo,''M'')); ',
'    apex_json.write(''o_url'',  v_url );',
'    apex_json.close_object;',
'exception',
'    when others then',
'    ',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 99);',
unistr('        apex_json.write(''o_mnsje_rspsta'', ''Callback: Error al intentar procesar informaci\00F3n de las plantillas de Embargo. ''||sqlerrm);    '),
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186989265729480506)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarActosDesembargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_url                      varchar2(4000);',
'    v_id_lte_mdda_ctlar_ip    number;',
'    o_cdgo_rspsta             number;',
'    o_mnsje_rspsta            varchar2(1000);',
'begin',
'     for i in 1..apex_application.g_f01.count ',
'     loop',
'         v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'                                                   ',
'    PKG_CB_MEDIDAS_CAUTELARES.prc_rg_gnrcion_actos_desembargo(p_cdgo_clnte     => v(''F_CDGO_CLNTE''),',
'                                                               p_id_usuario     => v(''F_ID_USRIO''),                                        ',
'                                                               p_json_rslciones => v_json,',
'                                                               o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                                               o_mnsje_rspsta   => o_mnsje_rspsta);',
'    ',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':118:''|| v(''APP_SESSION'')||''::NO:::'', p_checksum_type => ''SESSION'');',
'    ',
'    o_cdgo_rspsta := 0;',
'    o_mnsje_rspsta := ''Respuesta del callback'';',
'',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        v_url := ''#'';',
'    end if;',
'    /*htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_lte_mdda_ctlar_ip is null ',
'                                 then ''Actos generados Correctamente!!''',
'                                 else ''Algunos registros no fueron procesados'' ',
'                            end||''"}'');*/',
'                            ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'',  o_mnsje_rspsta);',
'    apex_json.write(''o_url'', v_url);    ',
'    apex_json.close_object;',
'exception',
'    when others then',
'    ',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 99);',
unistr('        apex_json.write(''o_mnsje_rspsta'',  ''Callback: Error al procesar generaci\00F3n de documentos de desembago.'');'),
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187464849399158020)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarDocumentosActosDesembargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                    clob;',
'    v_json_prmtros            clob;',
'    v_json_items              clob;',
'    v_id_json                 number;',
'    v_url                     varchar2(4000);',
'    v_id_lte_mdda_ctlar_ip    number;',
'    v_correo                  varchar2(4000);',
'    o_cdgo_rspsta             number;',
'    o_mnsje_rspsta            varchar2(2000);',
'    v_mnsje                   varchar2(4000);',
'begin',
'     ',
'     v_json := empty_clob();',
'     v_json_prmtros := empty_clob();',
'     v_json_items := empty_clob();',
'     ',
'     --Rescatamos los conceptos seleccionados del localstorage',
'     for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'     ',
'     begin ',
'       select json_object(key ''tpo_plntlla'' value v(''P124_TPO_PLNTLLA''),',
'                          key ''id_plntlla_rslcion'' value v(''P124_ID_PLNTLLA_RSLCION''),',
'                          key ''id_plntlla_oficio'' value v(''P124_ID_PLNTLLA_OFICIO''),',
'                          key ''gnra_ofcios'' value v(''P124_GNRA_OFCIOS'')',
'                         )',
'          into v_json_items',
'        from dual;',
'     end;',
'      ',
'     insert into MC_G_DSMBRGS_RSLCION_JSON ',
'                 (CDGO_CLNTE,',
'                  JSON_RSLCION,',
'                  JSON_ITEM) ',
'          values (:F_CDGO_CLNTE,',
'                  v_json,',
'                  v_json_items)',
'    returning id_dsmbrgs_rslcion_json into v_id_json;',
'          commit;',
'     ',
'     select email into v_correo',
'     from v_sg_g_usuarios where id_usrio = :F_ID_USRIO;',
'     ',
'     --Enviamos el Email Informando el inicio del proceso--',
'     begin',
'       select json_object(key ''p_id_usuario'' value :F_ID_USRIO)',
'          into v_json_prmtros',
'        from dual;',
'',
'        pkg_ma_envios.prc_co_envio_programado( p_cdgo_clnte		=> :F_CDGO_CLNTE,',
'                                               p_idntfcdor		=> ''Inicio.Resol.Dsembargo'',',
'                                               p_json_prmtros	=> v_json_prmtros);',
'     end;',
'     ',
'    --Llamamos al procedimiento qu genera los jobs',
'    PKG_CB_MEDIDAS_CAUTELARES.prc_rg_gnrcion_dcmntos_desembargo_job(p_cdgo_clnte     => v(''F_CDGO_CLNTE''),',
'                                                                    p_id_usuario     => v(''F_ID_USRIO''),',
'                                                                    p_id_json        => v_id_json,',
'                                                                    o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                                                    o_mnsje_rspsta   => o_mnsje_rspsta);',
'    ',
'    --o_cdgo_rspsta := 0;',
'    --o_mnsje_rspsta := ''OK'';',
'    ',
'    if o_cdgo_rspsta = 0 then',
'      v_url := apex_util.prepare_url( p_url => ''f?p=80000:118:''|| v(''APP_SESSION'')||''::NO:::'', p_checksum_type => ''SESSION'');',
'    end if;',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        v_url := ''#'';',
'    end if;',
'    ',
'    /*htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_lte_mdda_ctlar_ip is null ',
'                                 then ''Actos generados Correctamente.''',
'                                 else ''Algunos registros no fueron procesados.'' ',
'                            end||''"}'');*/',
'                            ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.write(''o_url'', v_url);',
'    apex_json.write(''correo'', v_correo);',
'    apex_json.close_object;',
'    ',
'exception',
'    when others then',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        v_mnsje := ''Callback: Error al intentar procesar embargos. ''||sqlerrm;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 100);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
