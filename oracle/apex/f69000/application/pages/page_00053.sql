prompt --application/pages/page_00053
begin
wwv_flow_api.create_page(
 p_id=>53
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Gesti\00F3n Resoluciones Masivas Igac')
,p_step_title=>unistr('Gesti\00F3n Resoluciones Masivas Igac')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''BTN_APLCAR_MSVO'').hide();',
'',
'function validar_sel() {',
'',
'    var region = apex.region("resolucion");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        /*//REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'        records = records.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_PRCSDO").v === ''N''*/',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_IMPSTO": apex.item("P53_ID_IMPSTO").getValue(),',
'                    "ID_IMPSTO_SBMPSTO": apex.item("P53_ID_IMPSTO_SBMPSTO").getValue(),',
'                     "RESOLUCION": model.getValue(record, "RESOLUCION").trim(),',
'                     "RADICACION": model.getValue(record, "REDACCION").trim(),',
'                     "VIGENCIA_IGAC": model.getValue(record, "VIGENCIA_IGAC").trim()',
'                   };',
'        });',
'               ',
'        if(json.length >= 1){',
'                apex.item(''BTN_APLCAR_MSVO'').show();',
'            }',
'            else',
'                {',
'                                    apex.item(''BTN_APLCAR_MSVO'').hide();',
'',
'                    ',
'                }',
'        ',
'        window.localStorage.setItem(''jsonResolucion'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'       ',
'    }',
'    /*apex.item("BTN_RSPNSBLE").hide();',
'    apex.item("BTN_INCIAR_PRCSO").hide();',
'    apex.item("BTN_ELMNAR_SJTO").hide();*/',
'    ',
'}',
'',
' const iniciarAplicacionMasiva = function(){',
'    ',
'    var json_resoluciones = localStorage.getItem(''jsonResolucion'');',
'    ',
'    if (json_resoluciones.length > 0){',
'    ',
unistr('        apex.message.confirm( "\00BFDesea aplicar las resoluciones a la selecci\00F3n ?", async function( okPressed ) { '),
'            if( okPressed ) {',
'',
'                var popup = apex.widget.waitPopup();',
'                //debugger;',
'                await apex.server.process(',
'                                "Iniciar_aplicacion_masiva",',
'                                {    ',
'                                     f01: json_resoluciones',
'                                },',
'                                {',
'                                    //dataType: ''text'',',
'                                    success: function( pData ){',
'                                        popup.remove();',
'                                            if (pData.o_cdgo_rspsta === 0){',
'                                            Swal.fire(',
unistr('                                                      ''<h2><b>\00A1El proceso se ha iniciado correctamente!</b></h2>'','),
'                                                      ''<h3>'' + pData.o_mnsje_rspsta + ''</h3>'',',
'                                                      ''success''',
'                                                    ).then((result) => {',
'                                                        apex.navigation.dialog.close(true);',
'                                                    });',
'',
'                                            }else{',
'                                                Swal.fire(',
unistr('                                                          ''<h2><b>\00A1No puede seguir el proceso!</b></h2>'','),
'                                                          ''<h3>'' + pData.o_mnsje_rspsta + ''</h3>'',',
'                                                          ''error''',
'                                                        ).then((result) => {',
'                                                            apex.navigation.dialog.close(true);',
'                                                        });',
'                                            }',
'                                        }',
'                                   }',
'                                ',
'                            );',
'                        } // Fin if',
'                    });',
'        ',
'    }else{',
'        apex.message.clearErrors();',
'        apex.message.alert(  ''No se han seleccionado candidatos a procesar.'' );',
'    }',
'}'))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220211141951'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3920821997049103)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'    <h5>',
'        <b>',
'            <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'            </i>',
'    </b>',
'</h5>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(151692069033606848)
,p_plug_name=>'Resoluciones'
,p_region_name=>'resolucion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with resoluciones as (',
'select j.rslcion             as Resolucion,',
'       j.rdccion             as Redaccion,',
'       j.nmro_prdial_antrior as Nro_Predial_Anterior,',
'       j.rfrncia_igac        as Referencia_Igac,',
'       j.dstno_ecnmco        as Destino_Economico,',
'       j.avluo_ctstral       as Avaluo_Catastral,',
'       j.cncla_inscrbe       as Cancela_Inscribe,',
'       j.vgncia_igac         as Vigencia_Igac',
'  from (select rslcion,',
'               rdccion,',
'               nmro_prdial_antrior,',
'               rfrncia_igac,',
'               dstno_ecnmco,',
'               avluo_ctstral,',
'               cncla_inscrbe,',
'               vgncia_igac',
'          from si_g_resolucion_igac_t1',
'         where aplcda = ''N''',
'           and nmro_orden = ''001''',
'           and cncla_inscrbe = ''C''',
'         group by rslcion,',
'                  rdccion,',
'                  nmro_prdial_antrior,',
'                  rfrncia_igac,',
'                  dstno_ecnmco,',
'                  avluo_ctstral,',
'                  cncla_inscrbe,',
'                  vgncia_igac) k',
'  full join (select rslcion,',
'                    rdccion,',
'                    nmro_prdial_antrior,',
'                    rfrncia_igac,',
'                    dstno_ecnmco,',
'                    avluo_ctstral,',
'                    cncla_inscrbe,',
'                    vgncia_igac',
'               from si_g_resolucion_igac_t1 a',
'              where a.aplcda = ''N''',
'                and a.nmro_orden = ''001''',
'                and a.cncla_inscrbe = ''I''',
'                and a.aplcda = ''N''',
'                and not exists (select 1',
'                       from si_g_resolucion_igac_t1 t',
'                      where t.rfrncia_igac = a.rfrncia_igac',
'                        and t.id_rslcion_aplcda is null',
'                        and t.vgncia_igac = a.vgncia_igac',
'                        and t.rslcion like ''%''||:P53_VGNCIA_ACTL',
'                        and t.rslcion < a.rslcion)',
'              group by rslcion,',
'                       rdccion,',
'                       nmro_prdial_antrior,',
'                       rfrncia_igac,',
'                       dstno_ecnmco,',
'                       avluo_ctstral,',
'                       cncla_inscrbe,',
'                       vgncia_igac) j',
'    on k.rslcion = j.rslcion',
'   and k.rdccion = j.rdccion',
' where k.dstno_ecnmco = j.dstno_ecnmco',
'   and k.avluo_ctstral = j.avluo_ctstral',
'   and k.rslcion between :P53_RSLCION_INCIO and :P53_RSLCION_FIN',
'   and (j.rslcion like ''%''||:P53_VGNCIA_ACTL)',
'order by to_number(j.rslcion))',
'',
'select * from resoluciones'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3921541737049110)
,p_name=>'NRO_PREDIAL_ANTERIOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_PREDIAL_ANTERIOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Referencia Anterior'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>15
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
 p_id=>wwv_flow_api.id(3921686390049111)
,p_name=>'REFERENCIA_IGAC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REFERENCIA_IGAC'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Referencia Igac'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(3921735959049112)
,p_name=>'DESTINO_ECONOMICO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESTINO_ECONOMICO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Destino Economico'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(3921898758049113)
,p_name=>'AVALUO_CATASTRAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AVALUO_CATASTRAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Avaluo Catastral'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3921922612049114)
,p_name=>'CANCELA_INSCRIBE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCELA_INSCRIBE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cancela Inscribe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(3922041785049115)
,p_name=>'VIGENCIA_IGAC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VIGENCIA_IGAC'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia Igac'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(3922347875049118)
,p_name=>'RESOLUCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESOLUCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Resolucion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>13
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
 p_id=>wwv_flow_api.id(4539142161663203)
,p_name=>'REDACCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REDACCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Radicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>15
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
 p_id=>wwv_flow_api.id(151758626081961419)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(151758746909961420)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(151692124258606849)
,p_internal_uid=>151692124258606849
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
 p_id=>wwv_flow_api.id(151762453504962197)
,p_interactive_grid_id=>wwv_flow_api.id(151692124258606849)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(151762547593962197)
,p_report_id=>wwv_flow_api.id(151762453504962197)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3999926594016422)
,p_view_id=>wwv_flow_api.id(151762547593962197)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(3921541737049110)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4000412313016424)
,p_view_id=>wwv_flow_api.id(151762547593962197)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(3921686390049111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4000980582016426)
,p_view_id=>wwv_flow_api.id(151762547593962197)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(3921735959049112)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4001418028016430)
,p_view_id=>wwv_flow_api.id(151762547593962197)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(3921898758049113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4001944901016433)
,p_view_id=>wwv_flow_api.id(151762547593962197)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(3921922612049114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4002418829016435)
,p_view_id=>wwv_flow_api.id(151762547593962197)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(3922041785049115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4041397521547225)
,p_view_id=>wwv_flow_api.id(151762547593962197)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(3922347875049118)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4782407975869523)
,p_view_id=>wwv_flow_api.id(151762547593962197)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4539142161663203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151783111812972938)
,p_view_id=>wwv_flow_api.id(151762547593962197)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(151758626081961419)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(223768554266547365)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(365000934923067148)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <i>',
'        <b> ',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>  ',
'        </b>',
'    </i>',
'</h5>',
'<i>',
unistr('    Funcionalidad que permite consultar las resoluciones IGAC registradas y que podr\00E1n ser aplicadas masivamente.'),
unistr('    Adem\00E1s, una vez aplicadas el sistema enviar\00E1 un correo al iniciar el proceso y al finalizarlo exitosamente.'),
'    <br><br>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3920621412049101)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3920821997049103)
,p_button_name=>'BTN_APLCAR_MSVO'
,p_button_static_id=>'BTN_APLCAR_MSVO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Masivo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(151654284216539440)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(223768554266547365)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3922596329049120)
,p_name=>'P53_VGNCIA_ACTL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(223768554266547365)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(151654606812539454)
,p_name=>'P53_RSLCION_INCIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(223768554266547365)
,p_prompt=>unistr('Resoluci\00F3n Inicial')
,p_placeholder=>unistr('Digite N\00B0 Resoluci\00F3n Inicial')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>13
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(151654995814539466)
,p_name=>'P53_RSLCION_FIN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(223768554266547365)
,p_prompt=>unistr('Resoluci\00F3n Fin')
,p_placeholder=>unistr('Digite N\00B0 Resoluci\00F3n Final')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(151655719102539469)
,p_name=>'P53_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(223768554266547365)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(151656103082539469)
,p_name=>'P53_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(223768554266547365)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3922170801049116)
,p_computation_sequence=>10
,p_computation_item=>'P53_ID_IMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id_impsto',
'FROM df_c_impuestos',
'where cdgo_impsto=''IPU'' and cdgo_clnte=:F_CDGO_CLNTE;',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3922249387049117)
,p_computation_sequence=>20
,p_computation_item=>'P53_ID_IMPSTO_SBMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id_impsto_sbmpsto',
'FROM DF_I_IMPUESTOS_SUBIMPUESTO',
'where cdgo_impsto_sbmpsto=''IPU'' and cdgo_clnte= :F_CDGO_CLNTE; '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3922698993049121)
,p_computation_sequence=>30
,p_computation_item=>'P53_VGNCIA_ACTL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY_COLON'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select (pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte=>:F_CDGO_CLNTE,',
'                                      p_cdgo_dfncion_clnte_ctgria=>''GFN'' ,',
'                                      p_cdgo_dfncion_clnte=>''VAC''))as vlor',
'                                      FROM DUAL;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(151758953963961422)
,p_name=>'SeleccionarRegistros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(151692069033606848)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(151759077081961423)
,p_event_id=>wwv_flow_api.id(151758953963961422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3920946994049104)
,p_name=>'DA_APLICAR_MASIVO'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3920621412049101)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3921002007049105)
,p_event_id=>wwv_flow_api.id(3920946994049104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'iniciarAplicacionMasiva();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(151758806446961421)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(151692069033606848)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Resoluciones - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3921166283049106)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar_aplicacion_masiva'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'        v_json_resoluciones   clob;',
'        o_cdgo_rspsta  number;',
'        o_mnsje_rspsta varchar2(4000);',
'        val number;',
'        v_correo varchar2(1000);',
'begin',
'    ',
unistr('    -- Recorremos el json guardado ella colecci\00F3n'),
'    for i IN 1..APEX_APPLICATION.G_F01.count loop ',
'        v_json_resoluciones := v_json_resoluciones||APEX_APPLICATION.G_F01(i);',
'    end loop;',
'    ',
'    -- Borramos la tabla uxiliar para evitar errores al momento de recuperar los datos en el paquete',
'    delete from aux_gn_prc_ap_rslcion_msva;commit;',
'    ',
'    --Insertamos los datos en la tabla auxiliar para recuperarlos en el procedimiento del paquete',
'    insert into aux_gn_prc_ap_rslcion_msva  (json_rslcion_igac) values (v_json_resoluciones);',
'    commit;',
'    ',
'    -- Buscamos el email del usuario para realizar la notificacion por correo',
'    select email into v_correo from v_sg_g_usuarios where id_usrio = :F_ID_USRIO;',
'    ',
'    -- Validamos que el usuario tenga un email parametrizado',
'    if (v_correo is not null) then',
'        o_cdgo_rspsta := 0;',
unistr('        o_mnsje_rspsta := ''Se notificar\00E1 al correo electr\00F3nico: ''||v_correo;'),
'        ',
'        -- Procedimiento para el envio del correo electronico',
'        begin',
'            val := APEX_UTIL.FIND_SECURITY_GROUP_ID (p_workspace=>''INFORTRIBUTOS'');',
'            apex_util.set_security_group_id(p_security_group_id => val);',
'',
'            apex_mail.send(',
'                                    p_to        => v_correo,',
'                                    p_from      => v_correo,  ',
unistr('                                    p_subj      => ''Inicio de Aplicaci\00F3n Masiva de Resoluciones Igac'','),
'                                    p_body      => '''',',
'                                    p_body_html => ''Estimado Cliente, <br>Ud ha iniciado el proceso de Aplicacion Masiva de Resoluciones Igac. ',
unistr('                                                    El proceso podr\00EDa tardar algunos minutos; cuando el proceso termine ser\00E1 notificado por este medio.'');'),
'            APEX_MAIL.PUSH_QUEUE;',
'        end;',
'  ',
'        -- Procedimiento para realizar la ejecucion del job',
'        BEGIN',
'            DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GN_PRC_AP_RSLCION_MSVA"'', attribute => ''job_action'', value => ''PKG_SI_NOVEDADES_PREDIO.PRC_AP_RSLCION_MSVA'');',
'',
'            DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GN_PRC_AP_RSLCION_MSVA"'', attribute => ''number_of_arguments'', value => ''2'');',
'',
'            DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_PRC_AP_RSLCION_MSVA'', argument_position => 1, argument_value => :F_ID_USRIO);',
'            DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_PRC_AP_RSLCION_MSVA'', argument_position => 2, argument_value => :F_CDGO_CLNTE);',
'        END; ',
'',
'        BEGIN',
'            DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_GN_PRC_AP_RSLCION_MSVA"'');',
'        END;',
'    else',
'        o_cdgo_rspsta := 10;',
unistr('        o_mnsje_rspsta := ''El usuario no tiene asociado un correo electr\00F3nico'';'),
'    end if;',
'',
'    -- Se escriben las respuestas del callback',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.write(''v_correo'', v_correo);',
'    apex_json.close_object();',
'',
'exception',
'    when others then',
'            apex_json.open_object();',
'            apex_json.write(''o_cdgo_rspsta'', 99);',
'            apex_json.write(''o_mnsje_rspsta'', ''Error: ''||sqlerrm);',
'            apex_json.close_object();',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
