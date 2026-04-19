prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>unistr('Selecci\00F3n de Actos')
,p_step_title=>unistr('Selecci\00F3n de Actos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v_json;',
'function obtenerActos(){',
'    var region = apex.region("actos");',
'    var responsables  = [];',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                responsables.push({"ID_ACTO":model.getValue(records[i], "ID_ACTO").trim()});',
'                //console.log(model.getValue(records[i], "ID_ACTO").trim());',
'            }',
'           v_json = JSON.stringify(responsables);',
'           $s("P12_JSON_ACTOS",JSON.stringify(responsables));',
'            console.log(JSON.stringify(responsables));',
'        }',
'        else{',
'           v_json = null;',
'           $s("P12_JSON_ACTOS",null);   ',
'        }',
'    }//alert(responsables.length); ',
'}',
'async function notificarActos() {',
'  let $await;',
'  if (v_json) {',
'    var count = JSON.parse(v_json).length;  ',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de enviar a notificar '' + count+'' acto(s)?'', async function (d) {'),
'      if (d) {',
'        try {',
'          $await = apex.widget.waitPopup();',
'          await apex.server.process(''NotificarActos'', {',
'            f01: v_json',
'          }).then((resp) => {',
'            if (resp.tipo ==''ERROR'') {',
'              apex.message.clearErrors();',
'              apex.message.showErrors([',
'                {',
'                  type: "error",',
'                  location: ["page"],',
'                  message: resp.mensaje,',
'                  unsafe: false',
'                }]);',
'            } else {',
'              apex.message.showPageSuccess(resp.mensaje);',
'              apex.region("actos").refresh();',
'            }',
'          }) ',
'        } catch (e) {',
'          console.log(e);',
'        } finally {',
'          $await.remove();',
'        }',
'      }',
'    })',
'',
'  } else {',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'      {',
'        type: "error",',
'        location: ["page"],',
unistr('        message: "Ning\00FAn acto seleccionado, por favor verifique!",'),
'        unsafe: false',
'      }]);',
'  }',
'}',
'',
'function seleccionarTodos(e, btn, grid, datos ){',
'    v_json = JSON.stringify(datos.map((m) => {',
'        return {"ID_ACTO": m["ID_ACTO"]} ',
'    })); ',
'    // console.log(v_json);',
'}'))
,p_javascript_code_onload=>'apex.region("actos").widget().interactiveGrid("setSelectedRecords", []);'
,p_step_template=>wwv_flow_api.id(30309424961578275)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250611105058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38480488694566801)
,p_plug_name=>'Actos a Notificar'
,p_region_name=>'actos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto,',
'       nmro_acto,',
'       nmro_acto_dsplay,',
'       cdgo_acto_orgen,',
'       dscrpcion_acto_orgen,',
'       id_orgen,',
'       id_undad_prdctra,',
'       id_acto_tpo,',
'       initcap(dscrpcion_acto_tpo) dscrpcion_acto_tpo,',
'       anio,',
'       fcha,',
'       case indcdor_ntfcdo ',
'            when ''N'' then ''#ffbe00'' ',
'            else ''#1fe06a''      ',
'        end clor_cdgo_estdo,',
'        case indcdor_ntfcdo ',
'            when ''N'' then ''fa-exclamation-circle-o'' ',
'            else ''fa-paper-plane-o''',
'        end icno_cdgo_estdo,',
'        case indcdor_ntfcdo',
unistr('            when ''N'' then ''Verificaci\00F3n'''),
'            else ''Pendiente''',
'        end dscrpcion_cdgo_estdo',
'  from v_nt_g_notfccnes_gn_g_actos a',
'  join nt_d_notificaciones_cnfgrcn b on a.cdgo_clnte = b.cdgo_clnte',
' where a.cdgo_clnte    = :F_CDGO_CLNTE ',
'       --and  id_usrio = :F_ID_USRIO ',
'       and  decode(b.indcdor_prfil_ntfcdor, ''S'', (select id_usrio from sg_g_perfiles_usuario where id_prfil =  b.id_prfil_ntfca and id_usrio = :F_ID_USRIO),''N'',a.id_usrio) = :F_ID_USRIO',
'       and  trunc(fcha_incio_ntfccion) <= trunc(sysdate)',
'       and',
'       (cdgo_estdo = ''NPR'' or cdgo_estdo is null) and',
'       (nvl(indcdor_ntfcdo,''N'') = ''N'') and',
'       cdgo_acto_orgen = nvl(:P12_CDGO_ACTO_ORGEN, cdgo_acto_orgen) and',
'       id_acto_tpo = nvl(:P12_ID_ACTO_TPO, id_acto_tpo) and',
'       (((:P12_FCHA_INCIAL is not null and :P12_FCHA_FNAL is not null) and (trunc(fcha) between trunc(to_date(:P12_FCHA_INCIAL,''dd/MM/yyyy'')) and trunc(to_date(:P12_FCHA_FNAL,''dd/MM/yyyy'')))) or ',
'       ((:P12_FCHA_INCIAL is null and :P12_FCHA_FNAL is not null) and trunc(fcha,''dd/MM/yyyy'') = to_date(:P12_FCHA_FNAL,''dd/MM/yyyy'')) or',
'       (:P12_FCHA_INCIAL is null and :P12_FCHA_FNAL is null))     and',
'       ((:P12_VLDAR_CRTA = ''S'' and (select c.vlor_sldo_ttal',
'                         from v_gn_g_actos_cartera c',
'                        where c.cdgo_clnte = :F_CDGO_CLNTE ',
'                          and c.id_acto = a.id_acto',
'                          and c.cdgo_mvnt_fncro_estdo = ''NO'') > 0) or :P12_VLDAR_CRTA =''N'')',
'     /*  and ((:P12_VLDAR_CRTA = ''S'' and (select c.vlor_sldo_ttal',
'                         from v_gn_g_actos_cartera c',
'                        where c.cdgo_clnte = :F_CDGO_CLNTE ',
'                          and c.id_acto = a.id_acto',
'                          and c.cdgo_mvnt_fncro_estdo = ''NO'') > 0) or :P12_VLDAR_CRTA = ''N'')*/'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P12_FCHA_INCIAL is not null or',
':P12_FCHA_FNAL  is not null or  ',
':P12_CDGO_ACTO_ORGEN  is not null or  ',
':P12_ID_ACTO_TPO  is not null)'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37713994857984132)
,p_name=>'NTFCCION_ESTDO'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37714095231984133)
,p_name=>'CLOR_CDGO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLOR_CDGO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(37714172487984134)
,p_name=>'ICNO_CDGO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICNO_CDGO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(37714290364984135)
,p_name=>'DSCRPCION_CDGO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CDGO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(38480697524566803)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(38480766298566804)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero del Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(38480835502566805)
,p_name=>'NMRO_ACTO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38480933309566806)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38481015596566807)
,p_name=>'DSCRPCION_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen del Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(38481200980566809)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38481334051566810)
,p_name=>'ID_UNDAD_PRDCTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_UNDAD_PRDCTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38481597393566812)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(38481728835566814)
,p_name=>'ANIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ANIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38481832056566815)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de Generaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>true
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(38482468982566821)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(81341916764214305)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(38480569410566802)
,p_internal_uid=>38480569410566802
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
,p_no_data_found_message=>'<h4>No hay actos disponibles para notificar <span aria-hidden="true" class="fa fa-send-o fa-2x"></span></h4>'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.initialSelection = false; ',
'    return selectAll(config, {',
'        name: ''Seleccionar Todos'',',
'        action: seleccionarTodos,',
'        hot:false',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(38492409884639552)
,p_interactive_grid_id=>wwv_flow_api.id(38480569410566802)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>1000
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(38492548511639552)
,p_report_id=>wwv_flow_api.id(38492409884639552)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38493072581639555)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(38480697524566803)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38493514454639557)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(38480766298566804)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>309
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38494044837639558)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(38480835502566805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38494470013639559)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(38480933309566806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38494989796639561)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(38481015596566807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>241
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38495921472639563)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(38481200980566809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38496487800639564)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(38481334051566810)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38497401968639566)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(38481597393566812)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>747
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38498470412639569)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(38481728835566814)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38498982161639570)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(38481832056566815)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>350
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39193000787033234)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(37713994857984132)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39202317546121473)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(37714095231984133)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39202818394121474)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(37714172487984134)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39203360386121475)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(37714290364984135)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81404025668611840)
,p_view_id=>wwv_flow_api.id(38492548511639552)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(81341916764214305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38484684514566843)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81059908538021124)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(219112546932814115)
,p_plug_name=>'ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite:',
'1. Seleccionar los actos realizados por Usted. <br>',
unistr('2. Filtrar los Actos a seleccionar por diferentes criterios de b\00FAsqueda<br>'),
'   *Si va a consultar por rango de fechas debe seleccionar una fecha inicial y una fecha final.<br>',
unistr('   *Si va a consultar una fecha espec\00EDfica debe seleccionar una fecha final. <br>'),
unistr('3. Iniciar el proceso de notificaci\00F3n al dar clic sobre el bot\00F3n "Notificar Actos".'),
'<br/>',
'<br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41132970514795605)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(81059908538021124)
,p_button_name=>'BTN_NOTIFICAR_ACTOS'
,p_button_static_id=>'btn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enviar a Notificar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40698911780487803)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(38484684514566843)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(37714690988984139)
,p_branch_name=>unistr('Ir a P\00E1gina 12')
,p_branch_action=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::P12_FCHA_INCIAL,P12_FCHA_FNAL,P12_CDGO_ACTO_ORGEN,P12_ID_ACTO_TPO,P12_VLDAR_CRTA:&P12_FCHA_INCIAL.,&P12_FCHA_FNAL.,&P12_CDGO_ACTO_ORGEN.,&P12_ID_ACTO_TPO.,&P12_VLDAR_CRTA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38483102355566828)
,p_name=>'P12_JSON_ACTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(81059908538021124)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38484741938566844)
,p_name=>'P12_FCHA_INCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(38484684514566843)
,p_prompt=>'Fecha Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38484803022566845)
,p_name=>'P12_FCHA_FNAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(38484684514566843)
,p_prompt=>'Fecha Final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38484977450566846)
,p_name=>'P12_CDGO_ACTO_ORGEN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(38484684514566843)
,p_prompt=>'Origen del Acto'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_acto_orgen||'' - ''||dscrpcion d, cdgo_acto_orgen r',
'from gn_d_actos_origen',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38485081474566847)
,p_name=>'P12_ID_ACTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(38484684514566843)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ACTO_TIPOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_acto_tpo||'' - ''||dscrpcion d , id_acto_tpo r ',
'from gn_d_actos_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      indcdor_ntfccion = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129807057428160909)
,p_name=>'P12_VLDAR_CRTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(38484684514566843)
,p_prompt=>'Validar Cartera'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391508947578312)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(28544561936110403)
,p_validation_name=>'Valida Fecha Inicial Mayor a Fecha Final'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(:P12_FCHA_INCIAL > :P12_FCHA_FNAL)then',
'    return ''Por favor, ingrese una fecha inicial menor a la fecha final'';',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_api.id(40698911780487803)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35321334684786707)
,p_name=>'Al Cambiar Medio de Notificacion'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_ID_ENTDAD_CLNTE_MDIO'
,p_condition_element=>'P12_ID_ENTDAD_CLNTE_MDIO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35323328337786727)
,p_event_id=>wwv_flow_api.id(35321334684786707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_JSON_PARMTROS'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38483863026566835)
,p_name=>'Al Cambiar Seleccion en Actos'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(38480488694566801)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38483971690566836)
,p_event_id=>wwv_flow_api.id(38483863026566835)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerActos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116023641686567902)
,p_name=>unistr('clic en el bot\00F3n notificar actos')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(41132970514795605)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116023777805567903)
,p_event_id=>wwv_flow_api.id(116023641686567902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'notificarActos();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116023881112567904)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NotificarActos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_tpo    varchar2(15);',
'    v_mnsje        varchar(32000);',
'    v_json         clob; ',
'begin',
'    --owa_util.mime_header(''application/json'', false);',
'    for i in 1..apex_application.g_f01.count ',
'    loop',
'        v_json := v_json ||  apex_application.g_f01(i);',
'    end loop;',
'    ',
'    pkg_nt_notificacion.prc_rg_notificaciones_actos(',
'        p_cdgo_clnte            => :F_CDGO_CLNTE,',
'        p_json_actos            => v_json,',
'        p_id_usrio              => :F_ID_USRIO,',
'        p_id_fncnrio            => :F_ID_FNCNRIO,',
'        o_mnsje_tpo             => v_mnsje_tpo,',
'        o_mnsje                 => v_mnsje',
'    );',
'    apex_json.open_object;',
'    if(v_mnsje_tpo = ''ERROR'') then',
'        rollback;',
'       ',
'        apex_json.write(''mensaje'', v_mnsje);',
'        apex_json.write(''tipo'', v_mnsje_tpo);',
'       ',
'        --htp.p(apex_escape.html(''{"mensaje":"''||v_mnsje||''", "tipo":"''||v_mnsje_tpo||''"}''));',
'    else',
'        commit;',
'        apex_json.write(''mensaje'', ''Acto(s) enviado(s) a notificar exitosamente'');',
'        apex_json.write(''tipo'', 0);',
'        --htp.p(''{"mensaje":"Actos enviados a notificar", "tipo":"0"}'');',
'    end if;',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
