prompt --application/pages/page_00133
begin
wwv_flow_api.create_page(
 p_id=>133
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('133. Generaci\00F3n/Impresi\00F3n de Actos Persuasiivos')
,p_step_title=>unistr('133. Generaci\00F3n/Impresi\00F3n de Actos Persuasiivos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=#APP_VERSION#'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'    VARIABLES GLOBALES',
'*/',
'var v_app_id  = $v(''pFlowId''),',
'    v_page_id = $v(''pFlowStepId''),',
'    v_session = $v(''pInstance'');',
'',
'function validar_seleccion(valid) {',
'    ',
'    var region = apex.region("documentos");',
'    var view = region.widget().interactiveGrid("getCurrentView"); //region.widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var records = view.getSelectedRecords(); //view.view$.grid("getSelectedRecords");',
'',
'    //REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'    /*records = records.filter(function (record) {   ',
'        console.log(''Devuelve'',model.getValue(record, "INDCDOR_PRCSDO"));',
'        return ( [''N''].includes( model.getValue(record, "INDCDOR_PRCSDO")) )',
'    });*/',
'    ',
'    //OBTENEMOS UN JSON CON LOS ACTOS SELECCIONADOS QUE NO HAN SIDO GENERADOS',
'    var json = records.map(function (record) {',
'        ',
'        let v_json_gnrar = { "ID_PRCSOS_PRSSVO_DCMNTO": model.getValue(record, "ID_PRCSOS_PRSSVO_DCMNTO"),',
'                         "ID_PRCSOS_PRSSVO": model.getValue(record, "ID_PRCSOS_PRSSVO"),',
'                        "ID_ACTO_TPO": model.getValue(record, "ID_ACTO_TPO"),',
'                        "CDGO_SJTO_ORGEN": model.getValue(record, "CDGO_SJTO_ORGEN").trim(),',
'                        "ID_ACTO": model.getValue(record, "ID_ACTO")',
'                       }',
'        ',
'        return v_json_gnrar;',
'        ',
'        ',
'    });',
'',
'    window.localStorage.setItem(''jsonActosPersuasivos'', json.length > 0 ? JSON.stringify(json) : '''');',
'',
'    var arr_imprmir = [];',
'',
'    //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'    if (json.length > 0 ){',
'',
'        for(var i = 0; i< json.length; i++){',
'       ',
'            var id_pcso_dcmnto = json[i].ID_PRCSOS_PRSSVO_DCMNTO;',
'            arr_imprmir.push({''ID'': id_pcso_dcmnto});',
'            ',
'            console.log(''Checked ''+i, $(''.u-selector'').eq(i).hasClass(''is-selected''));',
'            ',
'            // SI no hay acto',
'            if (json[i].ID_ACTO == ''''){',
'                ',
'                apex.item("BTN_GNERAR_ACTOS").show(); //Muestre el boton de generar',
'                apex.item("BTN_IMPRMIR_ACTOS").hide();',
'                ',
'            }else{ // Si hay acto generado',
'                ',
'                apex.item("BTN_GNERAR_ACTOS").hide();',
'                apex.item("BTN_IMPRMIR_ACTOS").show();',
'                ',
'            }',
'        }',
'        ',
'        //console.log(''Acto'', json[i].ID_ACTO);',
'        //if (json[i].NMRO_ACTO == ''''){',
'            apex.item("BTN_GNERAR_ACTOS").show();',
'        /*}else{',
'            apex.item("BTN_IMPRMIR_ACTOS").show();',
'        }*/',
'        ',
'',
'    }else {',
'        arr_imprmir = [];',
'',
'        apex.item("BTN_GNERAR_ACTOS").hide();',
'        apex.item("BTN_IMPRMIR_ACTOS").hide();',
'    }',
'    ',
'    ',
'',
'    $s(''P127_JSON'', JSON.stringify(arr_imprmir));',
'',
'',
'    //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID ',
'    //region.widget().interactiveGrid("setSelectedRecords", records);',
'}',
'',
'function seleccionarTodos(e,btn,grid,data){',
'    var datos = data.filter((f) => f.INDCDOR_PRCSDO.v === ''N'').map((m) => {',
'            return { "ID_PRCSOS_PRSSVO_DCMNTO": m.ID_PRCSOS_PRSSVO_DCMNTO,',
'                     "ID_PRCSOS_PRSSVO": m.ID_PRCSOS_PRSSVO,',
'                     "ID_ACTO_TPO": m.ID_ACTO_TPO,',
'                     "CDGO_SJTO_ORGEN": m.CDGO_SJTO_ORGEN',
'                   };',
'        }); ',
'    window.localStorage.setItem(''jsonActosPersuasivos'', JSON.stringify(datos));',
'}',
'',
'',
'const generarActos = function(){',
'    ',
'    var json_actos = localStorage.getItem(''jsonActosPersuasivos'');',
'    ',
'    if (json_actos.length > 0){',
'    ',
unistr('        apex.message.confirm( "\00BFDesea generar actos de cobro persuasivo para los registros seleccionados?", async function( okPressed ) { '),
'            if( okPressed ) {',
'',
'                var popup = apex.widget.waitPopup();',
'                ',
'                await apex.server.process(',
'                                "Generar_Actos",',
'                                {    ',
'                                     f01: json_actos',
'                                },',
'                                {',
'                                    //dataType: ''text'',',
'                                    success: function( pData ){',
'',
'                                        popup.remove();',
'',
'                                        if (pData.o_cdgo_rspsta != 0){ ',
'                                            apex.message.clearErrors();',
'                                            apex.message.alert(  pData.o_mnsje_rspsta );',
'',
'                                        }else{',
'                                            apex.message.alert("Se han generado actos de cobro persuasivo de forma exitosa!", function(){',
'                                                if (okPressed){',
'                                                    apex.submit("BTN_GNERAR_ACTOS");',
'                                                }',
'                                            });',
'                                            ',
'                                            //refrescarSujetos();',
'                                        }',
'                                    }',
'                                }',
'                            );',
'                        } // Fin if',
'                    });',
'        ',
'    }else{',
'        apex.message.clearErrors();',
'        apex.message.alert(  ''No se han seleccionado registros a procesar.'' );',
'    }',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_seleccion();',
'',
'if( apex.region("documentos") )',
'    apex.region("documentos").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210722081541'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139649759572732134)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17366370585919378)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(17310371681919339)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(17409871798919399)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(278549711084319083)
,p_plug_name=>unistr('<b>Par\00E1metros</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(278550336806319090)
,p_plug_name=>'<b>Opciones</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(279219112160376667)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(278550336806319090)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><b>Ayuda</b></center>',
'<br>',
'<p style="text-align: justify;"><b>1 - Consulta de documento</b>: Utilice el rango de fechas para consultar los documentos registrados.</p>',
unistr('<p style="text-align: justify;"><b>2 - Generar documnentos</b>: Al seleccionar en la gilla un registro, si a\00FAn no posee un n\00FAmero de Acto asignado se habilitar\00E1 un bot\00F3n [Generar Actos] con el cual se realiza el proceso de generaci\00F3n de actos en el s')
||'istema.</p>',
unistr('<p style="text-align: justify;"><b>Impresi\00F3n de actos</b>: Una vez generado los actos de cobro persuasivo, podr\00E1 realizar una impresi\00F3n de estos mismos en formato ZIP mediante un click sobre el bot\00F3n [Imprimir Actos]</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(279040285344581492)
,p_plug_name=>'Actos de Cobro Persuasivo'
,p_region_name=>'documentos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_prcsos_prssvo_dcmnto,',
'       a.dscrpcion_acto_tpo,',
'       a.nmro_acto,',
'       a.fcha_acto,',
'       a.id_plntlla,',
'       a.dcmnto,',
'       a.id_acto_tpo,',
'       a.id_prcsos_prssvo,',
'       a.cdgo_sjto_orgen,',
'       a.id_acto,',
'       case ',
'        when a.nmro_acto is null then',
'           ''N''',
'       else',
'           ''S''',
'       end as indcdor_prcsdo,',
'       case',
'        when a.nmro_acto is not null then',
'          ''<center>',
'            <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver<span class="fa fa-eye"></span>',
'            </button>',
'          </center>''',
'         else',
'           null',
'         end ver_acto',
'from v_cb_g_procesos_prssvo_dcmnto a',
'where trunc(a.fcha_rgstro) between :P133_FCHA_DSDE and :P133_FCHA_HSTA'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279040459631581494)
,p_name=>'ID_PRCSOS_PRSSVO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_PRSSVO_DCMNTO'
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
 p_id=>wwv_flow_api.id(279040580897581495)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(279040719825581496)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279040822386581497)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(279040846034581498)
,p_name=>'ID_PLNTLLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PLNTLLA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(279041016280581499)
,p_name=>'DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DCMNTO'
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279041045019581500)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(279041195064581501)
,p_name=>'ID_PRCSOS_PRSSVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_PRSSVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(279041304999581502)
,p_name=>'CDGO_SJTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_SJTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(279041366431581503)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(279041476497581504)
,p_name=>'INDCDOR_PRCSDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_PRCSDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(279041692139581506)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279137536965904275)
,p_name=>'VER_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&VER_ACTO.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,ID_ACTO,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(279040356594581493)
,p_internal_uid=>279040356594581493
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
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
 p_id=>wwv_flow_api.id(279086083284158402)
,p_interactive_grid_id=>wwv_flow_api.id(279040356594581493)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(279086210940158403)
,p_report_id=>wwv_flow_api.id(279086083284158402)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279086646265158404)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(279040459631581494)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279087164132158405)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(279040580897581495)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279087707448158407)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(279040719825581496)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279088164493158409)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(279040822386581497)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279088713632158415)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(279040846034581498)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279089198680158417)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(279041016280581499)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279089653341158419)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(279041045019581500)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279090094601158422)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(279041195064581501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279090540834158424)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(279041304999581502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279091076292158426)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(279041366431581503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279091546928158428)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(279041476497581504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279177347165191920)
,p_view_id=>wwv_flow_api.id(279086210940158403)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(279137536965904275)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(139640656515732039)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(278550336806319090)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409089099919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(139641007864732059)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(278550336806319090)
,p_button_name=>'BTN_GNERAR_ACTOS'
,p_button_static_id=>'BTN_GNERAR_ACTOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409089099919398)
,p_button_image_alt=>'Generar Actos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(139641473558732059)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(278550336806319090)
,p_button_name=>'BTN_IMPRMIR_ACTOS'
,p_button_static_id=>'BTN_IMPRMIR_ACTOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409089099919398)
,p_button_image_alt=>'Imprimir Actos'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(139653970026732170)
,p_branch_name=>'Ir a la pag  127'
,p_branch_action=>'f?p=&APP_ID.:133:&SESSION.:BTN_IMPRMIR_ACTOS:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(139641473558732059)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139642497734732073)
,p_name=>'P133_FCHA_DSDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(278549711084319083)
,p_prompt=>'Fecha Desde'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139642722151732093)
,p_name=>'P133_FCHA_HSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(278549711084319083)
,p_prompt=>'Fecha Hasta'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139649245258732121)
,p_name=>'P133_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(279040285344581492)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(139651107254732154)
,p_name=>'Al cargar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(139651650074732161)
,p_event_id=>wwv_flow_api.id(139651107254732154)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {  ',
'    var region = apex.region("Actos_Persuasivos");',
'    if (region) {',
'        apex.region("Actos_Persuasivos").widget().interactiveGrid("setSelectedRecords", []);',
'    }',
'    validar_seleccion();      ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(139652028467732163)
,p_name=>unistr('Al cambiar la selecci\00F3n de filas')
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(279040285344581492)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(139652563374732167)
,p_event_id=>wwv_flow_api.id(139652028467732163)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P133_JSON'
,p_attribute_01=>'validar_seleccion(true);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(139652982716732168)
,p_name=>'Al dar click en BTN_GNERAR_ACTOS'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(139641007864732059)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(139653480683732168)
,p_event_id=>wwv_flow_api.id(139652982716732168)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'generarActos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(139650796324732153)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMPRIMIR_ACTOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                      clob;',
'    v_url                       varchar2(4000);',
'    v_cdgo_rspsta               number;',
'    v_mnsje_rspsta              varchar2(4000);',
'    v_count                     number := 0;',
'    l_zip_file                  blob;',
'    v_nmbre_zip                 varchar2(100)	:= ''ActosPersuasivos.zip'';  ',
'    v_id_lte_mdda_ctlar         number          := 0;',
'	',
'begin',
'    ',
'    ',
'    begin',
'        ',
'        for c_actos in (select a.id_prcsos_prssvo_dcmnto',
'                                , c.file_blob',
'                                , c.file_name',
'                                , b.id_acto',
'                             from json_table( :P133_JSON  ,''$[*]''',
'                                    columns ( id_prcsos_prssvo_dcmnto number path ''$.ID'')) a',
'                            join cb_g_procesos_prssvo_dcmnto b on b.id_prcsos_prssvo_dcmnto = a.id_prcsos_prssvo_dcmnto',
'                            join v_gn_g_actos                   c on c.id_acto = b.id_acto) loop',
'			',
'	    v_count         := v_count + 1;',
'                        ',
unistr('            v_mnsje_rspsta  := ''Acto N\00B0: '' || v_count;'),
'            ',
'            -- Se agrega el blob al zip',
'            begin ',
'                apex_zip.add_file ( p_zipped_blob => l_zip_file',
'                                  , p_file_name   => c_actos.file_name',
'                                  , p_content     => c_actos.file_blob );',
'                ',
'                v_mnsje_rspsta  := ''Se agrego el Acto ID: '' || c_actos.id_prcsos_prssvo_dcmnto || '' al zip'';',
'            exception ',
'                when others then ',
'                    null;',
'                    ',
'            end;-- Fin Se agrega el blob al zip',
'		',
'        end loop;-- Fin Se recorre el json con las resoluciones de desembargo y se consulta el blob para agregarlo al zip',
'		',
'         -- Se finaliza el zip y se descarga',
'        begin ',
'            apex_zip.finish( p_zipped_blob =>  l_zip_file );',
'            owa_util.mime_header(''application/zip'', FALSE); ',
'            htp.p(''Content-length: ''|| dbms_lob.getlength(l_zip_file));',
'            htp.p(''Content-Disposition: attachment; filename="'' || v_nmbre_zip || ''"'');',
'            owa_util.http_header_close;',
'            wpg_docload.download_file(l_zip_file);',
'            ',
'        exception ',
'            when others then ',
'               null;',
'        end;-- Se finaliza el zip y se descarga',
'                ',
'     exception',
'            when others then',
'                null;                                               ',
'     end; ',
'     ',
'exception',
'    when others then',
'       null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_IMPRMIR_ACTOS'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(139650367662732150)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Actos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   o_cdgo_rspsta  number;',
'   o_mnsje_rspsta varchar2(2000);',
'   v_json_actos   clob;',
'begin',
'    ',
'    for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json_actos := v_json_actos||APEX_APPLICATION.g_f01(i);',
'    end loop;',
'    ',
'    delete from muerto where v_001 = ''validaJSONPer'';',
'    insert into muerto(v_001, c_001, t_001) values(''validaJSONPer'', v_json_actos, systimestamp); commit;',
'    ',
unistr('    -- Generaci\00F3n de Actos persuasivos'),
'    pkg_cb_proceso_persuasivo.prc_gn_documento_persuasivo(p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                          p_json_dcmntos_prrsvo  => v_json_actos,',
'                                                          p_id_usrio             => :F_ID_USRIO,',
'                                                          o_cdgo_rspsta          => o_cdgo_rspsta,',
'                                                          o_mnsje_rspsta         => o_mnsje_rspsta);',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object();',
'',
'exception',
'    when others then',
'            apex_json.open_object();',
'            apex_json.write(''o_cdgo_rspsta'', 99);',
'            apex_json.write(''o_mnsje_rspsta'', ''Error al generar actos.'');',
'            apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
