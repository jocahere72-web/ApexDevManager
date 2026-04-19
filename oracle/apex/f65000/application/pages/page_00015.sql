prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Adicionar Actos'
,p_page_mode=>'MODAL'
,p_step_title=>'Adicionar Actos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v_json;',
'function obtenerActos(){',
'    var region = apex.region("actos");',
'    var actos  = [];',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                actos.push({"ID_NTFCCION_DTLLE":model.getValue(records[i], "ID_NTFCCION_DTLLE").trim()});',
'            }',
'           v_json = JSON.stringify(actos);',
'            //$s("P15_ID_NTFCCION_DTLLE_JSON",JSON.stringify(actos));',
'            console.log(JSON.stringify(actos));',
'        }',
'        else{',
'           $s("P15_ID_NTFCCION_DTLLE_JSON",null);',
'            v_json = '''';',
'        }',
'    }   ',
'}',
'',
'function seleccionarTodos(e, btn, grid, datos ){',
'    v_json = JSON.stringify(datos.map((m) => {',
'        return {"ID_NTFCCION_DTLLE": m["ID_NTFCCION_DTLLE"]} ',
'    })); ',
'     console.log(v_json);',
'}',
'',
'async function registrarDetalleLote() {',
'  let $await;',
'  if (v_json) {',
'        try {',
'          $await = apex.widget.waitPopup();',
'          await apex.server.process(''adicionarDetalleLote'', {',
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
'       }',
'   ',
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
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#btn{',
'  border-radius: 5px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251222212937'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80763448310174740)
,p_plug_name=>'Actos'
,p_region_name=>'actos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_acto,',
'        a.nmro_acto,',
'        a.nmro_acto_dsplay,',
'        a.cdgo_acto_orgen,',
'        a.dscrpcion_acto_orgen,',
'        a.id_orgen,',
'        a.id_undad_prdctra,',
'        a.id_acto_tpo,',
'        a.dscrpcion_acto_tpo,',
'        a.anio,',
'        a.fcha,',
'        a.id_ntfccion,',
'        b.id_ntfccion_dtlle,',
'        b.nmbre_trcro,',
'        (select nvl(sum(car.vlor_sldo_cptal + car.vlor_intres), 0)',
'         from   gn_g_actos_vigencia av',
'         join   v_gf_g_cartera_x_vigencia car ',
'           on   av.id_sjto_impsto = car.id_sjto_impsto',
'          and   av.vgncia         = car.vgncia',
'          and   av.id_prdo        = car.id_prdo',
'         where  av.id_acto = a.id_acto -- Cruce con la tabla principal',
'           and  car.cdgo_mvnt_fncro_estdo in (''CN'', ''NO'') -- Filtro de estado',
'        ) as sldo_actal',
'from    v_nt_g_notfccnes_gn_g_actos a',
'inner join( select a.id_ntfccion_dtlle,a.id_acto, a.nmro_acto,a.id_mdio, a.cdgo_mdio, a.nmbre_trcro',
'            from v_nt_g_notificaciones_detalle a',
'            inner join nt_d_medio b on a.id_mdio = b.id_mdio and b.indcdor_msvo = ''S''',
'            where a.id_entdad_clnte_mdio is null and',
'                  a.id_fncnrio_prcsmnto  is null ',
'            --and  trunc(a.fcha_fin_trmno) = ''11/JUL/2025''',
'                and  trunc(a.fcha_fin_trmno) >= trunc(sysdate)',
'          ) b on a.id_acto = b.id_acto',
'where   a.cdgo_clnte    = :F_CDGO_CLNTE ',
'and     a.cdgo_estdo    = ''NGN'' ',
'and',
'        a.id_acto_tpo = nvl(:P15_ID_ACTO_TPO, a.id_acto_tpo) and',
'        a.id_acto not in (select id_acto ',
'                          from nt_d_lote_detalle',
'                          group by id_acto) and',
'        (:P15_ID_LTE is not null and b.id_mdio = (select b.id_mdio ',
'                                                  from nt_g_lote a',
'                                                  join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio ',
'                                                  where id_lte = :P15_ID_LTE) or(:P15_ID_LTE is null));'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P15_ID_LTE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42893769005704929)
,p_name=>'ID_NTFCCION_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NTFCCION_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(80763683335174742)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(80763779044174743)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Acto'
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
 p_id=>wwv_flow_api.id(80763911867174744)
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
 p_id=>wwv_flow_api.id(80764018728174745)
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
 p_id=>wwv_flow_api.id(80764079287174746)
,p_name=>'DSCRPCION_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(80764136162174747)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(80764283747174748)
,p_name=>'ID_UNDAD_PRDCTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_UNDAD_PRDCTRA'
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
 p_id=>wwv_flow_api.id(80764496123174750)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(80764568765174751)
,p_name=>'ANIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ANIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(80764688206174752)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(80764733716174753)
,p_name=>'ID_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NTFCCION'
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
 p_id=>wwv_flow_api.id(80905310367162511)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(81342065709214306)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(89961789349975927)
,p_name=>'SLDO_ACTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SLDO_ACTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Cartera'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(115653004359865715)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Funcionario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(80763568963174741)
,p_internal_uid=>80763568963174741
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
 p_id=>wwv_flow_api.id(80895829370161271)
,p_interactive_grid_id=>wwv_flow_api.id(80763568963174741)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>100
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(80895979338161271)
,p_report_id=>wwv_flow_api.id(80895829370161271)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43318065598901761)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(42893769005704929)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80896504636161272)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(80763683335174742)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80896945165161273)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(80763779044174743)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80897523793161274)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(80763911867174744)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80898010120161275)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(80764018728174745)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80898483583161277)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(80764079287174746)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80899013714161278)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(80764136162174747)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80899456066161279)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(80764283747174748)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80900441226161282)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(80764496123174750)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80900958126161283)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(80764568765174751)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80901521006161284)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(80764688206174752)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80901980773161285)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(80764733716174753)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81440393947785150)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(81342065709214306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115895014636703473)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(115653004359865715)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(125392853932815236)
,p_view_id=>wwv_flow_api.id(80895979338161271)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(89961789349975927)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40849462203993538)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(80763448310174740)
,p_button_name=>'BTN_ADICIONAR_ACTO'
,p_button_static_id=>'btn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Adicionar Actos'
,p_button_position=>'ABOVE_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P13_ID_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-address-book-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40073302259213326)
,p_name=>'P15_ID_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80763448310174740)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40842817209949228)
,p_name=>'P15_ID_NTFCCION_DTLLE_JSON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(80763448310174740)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52872640559352202)
,p_name=>'P15_ID_ACTO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80763448310174740)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(40847886580976093)
,p_validation_name=>'Valida que seleccione actos al adicionar actos'
,p_validation_sequence=>10
,p_validation=>'P15_ID_NTFCCION_DTLLE_JSON'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar actos.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40699401830487808)
,p_name=>unistr('Al Cambiar Selecci\00F3n en Actos')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(80763448310174740)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40699543770487809)
,p_event_id=>wwv_flow_api.id(40699401830487808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerActos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30547337758179201)
,p_name=>'Registrar detalle '
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(40849462203993538)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30547411904179202)
,p_event_id=>wwv_flow_api.id(30547337758179201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'registrarDetalleLote();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40074831319213341)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Elimina acto en detalle'
,p_process_sql_clob=>'DELETE NT_D_LOTE_DETALLE WHERE ID_LTE = :P15_ID_LOTE AND ID_ACTO = :P15_ID_ACTO;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40848068389984034)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Adicionar Detalle a Notificaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_tpo varchar2(20);',
'    v_mnsje varchar2(3000);',
'begin',
'',
'   pkg_nt_notificacion.prc_rg_detalle_lotes(',
'        p_id_lote                  => :P15_ID_LTE,',
'        p_id_ntfccion_dtlle_json   => :P15_ID_NTFCCION_DTLLE_JSON,',
'        o_mnsje_tpo                => v_mnsje_tpo,',
'        o_mnsje                    => v_mnsje       ',
'    );',
'    if(v_mnsje_tpo = ''ERROR'') then',
'        RAISE_APPLICATION_ERROR (-20000,v_mnsje); ',
'    end if;',
'end;',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(40849462203993538)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52872741864352203)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta C\00F3digo Acto Tipo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select max(id_acto_tpo)',
'    into :P15_ID_ACTO_TPO',
'    from nt_g_lote where id_lte = :P15_ID_LTE;',
'exception',
'    when no_data_found then',
'        :P15_ID_ACTO_TPO:= null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P15_ID_LTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30546181561149017)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'adicionarDetalleLote'
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
'   pkg_nt_notificacion.prc_rg_detalle_lotes(',
'        p_id_lote                  => :P15_ID_LTE,',
'        p_id_ntfccion_dtlle_json   => v_json,',
'        o_mnsje_tpo                => v_mnsje_tpo,',
'        o_mnsje                    => v_mnsje       ',
'    );',
'',
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
'        apex_json.write(''mensaje'', ''Acto(s) registrados exitosamente'');',
'        apex_json.write(''tipo'', 0);',
'        --htp.p(''{"mensaje":"Actos enviados a notificar", "tipo":"0"}'');',
'    end if;',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
