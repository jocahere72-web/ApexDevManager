prompt --application/pages/page_00039
begin
wwv_flow_api.create_page(
 p_id=>39
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Seleccion de Flujo MC'
,p_page_mode=>'MODAL'
,p_step_title=>'Iniciar Medida Cautelar'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel() {',
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
'        ',
'        console.log(json);',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        //$s(''P39_JSON_ENTDDES'', json.length > 0 ? JSON.stringify(json) : '''');',
'        window.localStorage.setItem(''jsonEntidades'', json.length > 0 ? JSON.stringify(json) : '''');',
'               ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("BTN_INCIAR_MC").show();',
'        }else {',
'            apex.item("BTN_INCIAR_MC").hide();',
'        }',
'        ',
'        /*//SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID ',
'        apex.region("entidades").widget().interactiveGrid("setSelectedRecords", records);*/',
'        return;',
'    }',
'    ',
'    //console.log(json);',
'    ',
'    apex.item("BTN_INCIAR_MC").hide();',
'    ',
'',
'}',
'',
'function IniciarMedida() {',
'    var json = window.localStorage.jsonCautelar;',
'    var json_enti = window.localStorage.jsonEntidades;',
'    console.log(''Json - ''+json);',
'    console.log(''Json Entidades - ''+json_enti)',
'    ',
'    var region = apex.region("entidades");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'            ',
'        //alert("records.length: " + records.length);',
'        if (records.length == 0 ) {',
'            Swal.fire({        ',
unistr('                        icon: ''Informaci\00F3n'','),
'                        title:  ''<H2 >Advertencia</H2>'',',
'                        html:   ''<h4>Seleccine las Entidades.</h4>''',
'                    }); ',
'        }   ',
'    }',
'',
'    if (records.length > 0 ) {',
'        let $waitPopup;    ',
'        try {',
'            JSON.parse(json);',
'            JSON.parse(json_enti);',
'            console.log(''Json Parse - ''+json);',
'            console.log(''json_enti Parse - ''+json_enti);',
unistr('            apex.message.confirm(''\00BFEst\00E1 seguro de iniciar la(s) Medida(s) cautelar(es)?'', (ok) => {'),
'                if (ok) {',
'                    if (apex.page.validate()) {',
'                        $waitPopup = apex.widget.waitPopup();',
'                        apex.server.process("IniciarMedidaCautelar", {',
'                            //console.log(''Json f01 - ''+json);',
'                            f01: json,',
'                            f02: json_enti,',
'                            pageItems: "#P39_FLUJO,#P39_ID_PLNTLLA,#P39_JSON_ENTDDES,#P39_ID_EMBRGOS_SMU_LTE"',
'                        }).then((resp) => {',
'                            $waitPopup.remove();',
'                            if (resp.o_cdgo_rspsta === 0) {',
'                                //apex.message.showPageSuccess(''Se ha iniciado proceso de incio de Medida Cautelar de forma exitosa!'');',
'',
'                                Swal.fire({',
unistr('                                    title: ''Informaci\00F3n'','),
'                                    html: `<h6>Se ha iniciado proceso de incio de Medida Cautelar de forma exitosa!</h6>`,',
'                                    icon: ''info'',',
'                                    allowEscapeKey: false,',
'                                    allowOutsideClick: false,',
'                                    allowEnterKey: false',
'                                })/*.then((result) => {',
'                                    if (resp.o_url !== ''''){',
'                                        window.location.href = resp.o_url;',
'                                    }',
'                                })*/;',
'',
'                                /*if (resp.o_url !== ''''){',
'                                    window.location.href = resp.o_url;',
'                                };*/',
'                            }else{',
'                                //apex.message.clearErrors();',
'                                //apex.message.alert(  resp.msg );',
'                                Swal.fire({        ',
'                                    icon: ''error'',',
unistr('                                    title:  ''<H2 >Validaci\00F3n</H2>'','),
'                                    html:   `<h4>${resp.o_cdgo_rspsta+''-''+resp.o_mnsje_rspsta}</h4>`',
'                                })/*.then((result) => {',
'                                    if (resp.o_url !== ''''){',
'                                        window.location.href = resp.o_url;',
'                                    }',
'                                })*/; ',
'                            }',
'                        });',
'                    }',
'                }',
'            })',
'',
'        } catch (e) {',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type: "error",',
'                    location: ["page"],',
'                    message: "No se encontraron datos seleccionados",',
'                    unsafe: false',
'                }]);',
'        } finally {',
'            if ($waitPopup)',
'                $waitPopup.remove();',
'        }',
'        ',
'    } // Fin IF',
'}',
'',
'',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel();',
'',
'apex.region("entidades").widget().interactiveGrid("setSelectedRecords", []);'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20220627121730'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5250381881262109)
,p_plug_name=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5249612811262102)
,p_plug_name=>unistr('Condiciones de regla de validaci\00F3n de procesamiento')
,p_parent_plug_id=>wwv_flow_api.id(5250381881262109)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rgla_ngcio_clnte_fncion,',
'        id_rgla_ngcio_clnte,',
'        a.id_fncion,',
'        b.dscrpcion,',
'        indcdor_cmple_vldccion',
' from gn_d_rglas_ngcio_clnte_fnc a',
' join gn_d_funciones b on b.id_fncion = a.id_fncion',
'where id_rgla_ngcio_clnte = :P39_ID_RGLA_NGCIO_CLNTE',
'  and actvo = ''S'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5249891853262104)
,p_name=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5249986985262105)
,p_name=>'ID_RGLA_NGCIO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5250007929262106)
,p_name=>'ID_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5250104544262107)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(5250206235262108)
,p_name=>'INDCDOR_CMPLE_VLDCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_CMPLE_VLDCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Respuesta Esperada'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Si;S,No;N'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(5249798870262103)
,p_internal_uid=>5249798870262103
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(5363608151987847)
,p_interactive_grid_id=>wwv_flow_api.id(5249798870262103)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(5363760113987847)
,p_report_id=>wwv_flow_api.id(5363608151987847)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5364247820987849)
,p_view_id=>wwv_flow_api.id(5363760113987847)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(5249891853262104)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5364730251987853)
,p_view_id=>wwv_flow_api.id(5363760113987847)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(5249986985262105)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5365256929987854)
,p_view_id=>wwv_flow_api.id(5363760113987847)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(5250007929262106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5365759772987856)
,p_view_id=>wwv_flow_api.id(5363760113987847)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(5250104544262107)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5366208456987857)
,p_view_id=>wwv_flow_api.id(5363760113987847)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(5250206235262108)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91489878623759449)
,p_plug_name=>'Entidades por Tipo de Embargo'
,p_region_name=>'entidades'
,p_parent_plug_id=>wwv_flow_api.id(5250381881262109)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_entddes,a.cdgo_clnte,a.dscrpcion,a.drccion,a.id_tpos_mdda_ctlar,a.dscrpcion_tpo_embrgo,a.ofcio_x_prptrio',
'from v_mc_d_entidades a',
'where a.id_tpos_mdda_ctlar = :P39_ID_TIPO_EMBARGO',
'and a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93973812667433404)
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
 p_id=>wwv_flow_api.id(93973948802433405)
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
 p_id=>wwv_flow_api.id(93974088484433406)
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
 p_id=>wwv_flow_api.id(93974116249433407)
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
 p_id=>wwv_flow_api.id(93974308724433409)
,p_name=>'DSCRPCION_TPO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TPO_EMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Embargo'
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93974493252433410)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93974578638433411)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93974877422433414)
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
 p_id=>wwv_flow_api.id(103142337002723817)
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
 p_id=>wwv_flow_api.id(93973771404433403)
,p_internal_uid=>93973771404433403
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
 p_id=>wwv_flow_api.id(94001168661500761)
,p_interactive_grid_id=>wwv_flow_api.id(93973771404433403)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(94001232440500761)
,p_report_id=>wwv_flow_api.id(94001168661500761)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94001797205500762)
,p_view_id=>wwv_flow_api.id(94001232440500761)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(93973812667433404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94002251413500765)
,p_view_id=>wwv_flow_api.id(94001232440500761)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(93973948802433405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94002764913500767)
,p_view_id=>wwv_flow_api.id(94001232440500761)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(93974088484433406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94003285966500768)
,p_view_id=>wwv_flow_api.id(94001232440500761)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(93974116249433407)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94004238005500771)
,p_view_id=>wwv_flow_api.id(94001232440500761)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(93974308724433409)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94004745994500772)
,p_view_id=>wwv_flow_api.id(94001232440500761)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(93974493252433410)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94008604779641877)
,p_view_id=>wwv_flow_api.id(94001232440500761)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(93974877422433414)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(103309252564658057)
,p_view_id=>wwv_flow_api.id(94001232440500761)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(103142337002723817)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118781230942192340)
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
 p_id=>wwv_flow_api.id(74673416116145640)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(118781230942192340)
,p_button_name=>'BTN_INCIAR_MC'
,p_button_static_id=>'BTN_INCIAR_MC'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Iniciar Medida Cautelar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5249571679262101)
,p_name=>'P39_ID_RGLA_NGCIO_CLNTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(118781230942192340)
,p_prompt=>unistr('Regla de Validaci\00F3n de Procesamiento')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrp_rgla_ngcio_clnte,id_rgla_ngcio_clnte ',
'from v_gn_d_reglas_negocio_cliente',
'where cdgo_clnte = :f_cdgo_clnte',
'and id_prcso = ''26'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Regla de negocio con la cual se validara si es posible o no iniciar un proceso de medida cautelar para cada candidato.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74673822236145641)
,p_name=>'P39_FLUJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(118781230942192340)
,p_prompt=>'Flujo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_fljo,',
'       id_fljo',
'  from v_wf_d_flujos ',
' where id_prcso = 11',
' and cdgo_clnte = :f_cdgo_clnte'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Flujo de trabajo que tendr\00E1 asociado cada proceso de medida cautelar.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74674295278145643)
,p_name=>'P39_JSON'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(118781230942192340)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74674616406145643)
,p_name=>'P39_ID_EMBRGOS_SMU_LTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(118781230942192340)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93973504497433401)
,p_name=>'P39_ID_TIPO_EMBARGO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(118781230942192340)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93974792744433413)
,p_name=>'P39_JSON_ENTDDES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(118781230942192340)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103142147154723815)
,p_name=>'P39_TPO_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(118781230942192340)
,p_prompt=>'Tipo de Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Puntual;P,Masiva;M'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de plantilla masiva o puntual.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103142282959723816)
,p_name=>'P39_ID_PLNTLLA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(118781230942192340)
,p_prompt=>unistr('Plantilla Solicitudes de Investigaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_plntlla',
'from gn_d_plantillas a',
'inner join mc_d_tipos_mdda_ctlr_dcmnto b on b.id_plntlla = a.id_plntlla',
'inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar',
'and c.id_tpos_mdda_ctlar = :P39_ID_TIPO_EMBARGO',
'where a.tpo_plntlla = :P39_TPO_PLNTLLA',
'and a.actvo = ''S''',
'and a.id_prcso = 26',
'and b.tpo_dcmnto = ''O''',
'and b.clse_dcmnto = ''P'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P39_TPO_PLNTLLA'
,p_ajax_items_to_submit=>'P39_ID_PLNTLLA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Plantilla para el/los oficio(s) de investigaci\00F3n de acuerdo al tipo de plantilla escogida con anterioridad.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(93973657029433402)
,p_computation_sequence=>10
,p_computation_item=>'P39_ID_TIPO_EMBARGO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_tpos_mdda_ctlar',
'from mc_g_embargos_simu_lote a',
'where a.id_embrgos_smu_lte = :P39_ID_EMBRGOS_SMU_LTE'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(93974988511433415)
,p_name=>'Al seleccionar Entidad'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(91489878623759449)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(93975076472433416)
,p_event_id=>wwv_flow_api.id(93974988511433415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116932141382382728)
,p_name=>'al hacer click en el boton iniciar '
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74673416116145640)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116932263030382729)
,p_event_id=>wwv_flow_api.id(116932141382382728)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'IniciarMedida();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5250443947262110)
,p_name=>unistr('Cambio de Selecci\00F3n')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_ID_RGLA_NGCIO_CLNTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5250523156262111)
,p_event_id=>wwv_flow_api.id(5250443947262110)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74675497397145653)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del JSON'
,p_process_sql_clob=>':P39_JSON := V(''P34_JSON'');'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74675076170145652)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar Medida Cautelar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    ',
'    pkg_cb_medidas_cautelares.prc_rg_investigacion_bienes( p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                           p_id_usuario   => :F_ID_USRIO,',
'                                                           p_cdgo_fljo    => :P39_FLUJO,',
'                                                           p_id_plntlla   => :P39_ID_PLNTLLA,',
'                                                           p_json_sujetos => :P39_JSON,',
'                                                           p_json_entidades => :P39_JSON_ENTDDES);                                                     ',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Proceso Iniciado Correctamente!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74675858030145653)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(74673416116145640)
,p_process_success_message=>'Proceso Iniciado Correctamente!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93974642861433412)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(91489878623759449)
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
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116932048347382727)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarMedidaCautelar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_json_enti                clob;',
'    v_url                      varchar2(4000) := '''';',
'    v_id_lte_mdda_ctlar_ip     number;',
'    o_cdgo_rspsta              number;',
'    o_mnsje_rspsta             varchar2(2000);',
'    v_rgstros_no_prcsdos       number;',
'begin',
'      ',
'     v_json := empty_clob();',
'     v_json_enti := empty_clob();',
'    ',
'     for i in 1..apex_application.g_f01.count ',
'     loop',
'         v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'     ',
'     for i in 1..apex_application.g_f02.count ',
'     loop',
'         v_json_enti :=  v_json_enti || apex_application.g_f02(i);',
'     end loop;',
'                                                     ',
'    pkg_cb_medidas_cautelares.prc_rg_investigacion_bienes( p_cdgo_clnte   => v(''F_CDGO_CLNTE''),',
'                                                           p_id_usuario   => v(''F_ID_USRIO''),',
'                                                           p_cdgo_fljo    => v(''P39_FLUJO''),',
'                                                           p_id_plntlla   => v(''P39_ID_PLNTLLA''),',
'                                                           p_json_sujetos => v_json,',
'                                                           p_json_entidades => v_json_enti,--v(''P39_JSON_ENTDDES''),',
'                                                           p_id_rgla_ngcio_clnte => v(''P39_ID_RGLA_NGCIO_CLNTE''),',
'                                                           o_id_lte_mdda_ctlar_ip => v_id_lte_mdda_ctlar_ip,',
'                                                           o_cdgo_rspsta => o_cdgo_rspsta,',
'                                                           o_mnsje_rspsta => o_mnsje_rspsta);',
'    ',
'    --v_url := null;',
'    ',
'    ',
'    insert into muerto (n_001, v_001, c_001, t_001) values ',
'                       (5020, ''prc_rg_investigacion_bienes'',''o_cdgo_rspsta: ''||o_cdgo_rspsta||'' - o_mnsje_rspsta: ''||o_mnsje_rspsta,systimestamp);commit;',
'    ',
'    /*v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':34:''|| v(''APP_SESSION'')||''::NO::P34_ID_EMBRGOS_SMU_LTE,P34_ID_LTE_MDDA_CTLAR_IP:''',
'                                       || v(''P39_ID_EMBRGOS_SMU_LTE'')||'','' || v_id_lte_mdda_ctlar_ip, p_checksum_type => ''SESSION'');*/',
'    ',
'    /*insert into muerto (n_001, v_001, c_001, t_001) values (5020, ''Items Url'',''P39_ID_EMBRGOS_SMU_LTE: ''||v(''P39_ID_EMBRGOS_SMU_LTE'')||'' - P34_ID_LTE_MDDA_CTLAR_IP: ''||v_id_lte_mdda_ctlar_ip,systimestamp);commit;*/',
'    ',
'    ',
'    /*if o_cdgo_rspsta <> 0 then',
'        v_url := ''#'';',
'    end if;*/',
'    --o_cdgo_rspsta := 0;',
'    --o_mnsje_rspsta := ''OK'';',
'                           ',
'    select count(1) into v_rgstros_no_prcsdos',
'    from mc_g_lotes_mdda_ctlar_dtlle a',
'    join mc_g_lotes_mdda_ctlar b on a.id_lte_mdda_ctlar = b.id_lte_mdda_ctlar',
'    where a.id_lte_mdda_ctlar = v_id_lte_mdda_ctlar_ip',
'    and b.tpo_lte = ''NPI'';',
'    ',
'    if (o_cdgo_rspsta = 0) then',
'      v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':34:''|| v(''APP_SESSION'')||''::NO::P34_ID_EMBRGOS_SMU_LTE,P34_ID_LTE_MDDA_CTLAR_IP:''',
'                                       || v(''P39_ID_EMBRGOS_SMU_LTE'')||'','' || v_id_lte_mdda_ctlar_ip, p_checksum_type => ''SESSION'');',
'    elsif (o_cdgo_rspsta <> 0) then',
'      v_url := apex_util.prepare_url( p_url => ''f?p=80000:34:''|| v(''APP_SESSION'')||''::NO:::'', p_checksum_type => ''SESSION'');',
'    end if;',
'    ',
'    if v_rgstros_no_prcsdos > 0 then',
'        o_cdgo_rspsta := 10;',
unistr('        o_mnsje_rspsta := ''Callback: ''||v_rgstros_no_prcsdos||'' registros de los selccionados no pudieron ser procesados. Consulte informaci\00F3n del lote #''||v_id_lte_mdda_ctlar_ip;'),
'    end if;',
'                            ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.write(''o_url'', v_url);',
'    apex_json.close_object;',
'exception',
'    when others then',
'    ',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 99);',
'        apex_json.write(''o_mnsje_rspsta'', ''Callback: Error al intentar procesar inicio de la Medida Cautelar.'');',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
