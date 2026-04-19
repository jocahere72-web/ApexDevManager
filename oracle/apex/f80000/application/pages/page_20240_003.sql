prompt --application/pages/page_20240_003
begin
wwv_flow_api.create_page(
 p_id=>2024005
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Proceso Selecci\00F3n Lote Persuasivo')
,p_step_title=>unistr('Proceso Selecci\00F3n Lote Persuasivo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("cartera");',
'    if (region) {',
'        ',
'       var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'   ',
'       /*var json = records.map(function(record){',
'           return { "cdgo_clnte"        : model.getValue(record , "CDGO_CLNTE"),',
'                    "id_impsto"         : model.getValue(record , "ID_IMPSTO"),',
'                    "id_impsto_sbmpsto" : model.getValue(record , "ID_IMPSTO_SBMPSTO"),',
'                    "cdgo_mvmnto_orgn"  : model.getValue(record , "CDGO_MVMNTO_ORGN"),',
'                    "id_orgen"          : model.getValue(record , "ID_ORGEN"),',
'                    "id_mvmnto_fncro"   : model.getValue(record , "ID_MVMNTO_FNCRO"),',
'                    "id_sjto_impsto"    : model.getValue(record , "ID_SJTO_IMPSTO"),',
'                    "vgncia"            : model.getValue(record, "VGNCIA"),',
'                    "prdo"              : model.getValue(record, "ID_PRDO"),',
'                    "id_cncpto"         : model.getValue(record, "ID_CNCPTO"),',
'                    "vlor_sldo_cptal"   : model.getValue(record, "VLOR_SLDO_CPTAL"),',
'                    "vlor_intres"       : model.getValue(record, "VLOR_INTRES"),',
'                    "id_sjto"           : model.getValue(record, "ID_SJTO")',
'                  };',
'       });*/',
'        var json = records.map(function(record) {',
'            return { ',
'                    "cdgo_clnte"        : model.getValue(record , "CDGO_CLNTE"),',
'                    "id_impsto"         : model.getValue(record , "ID_IMPSTO"),',
'                    "id_impsto_sbmpsto" : model.getValue(record , "ID_IMPSTO_SBMPSTO"),',
'                    "cdgo_mvmnto_orgn"  : model.getValue(record , "CDGO_MVMNTO_ORGN"),',
'                    "id_orgen"          : model.getValue(record , "ID_ORGEN"),',
'                    "id_mvmnto_fncro"   : model.getValue(record , "ID_MVMNTO_FNCRO"),',
'                    "id_sjto_impsto"    : model.getValue(record , "ID_SJTO_IMPSTO"),',
'                    "vgncia"            : model.getValue(record, "VGNCIA"),',
'                    "prdo"              : model.getValue(record, "ID_PRDO"),',
'                    "id_cncpto"         : model.getValue(record, "ID_CNCPTO"),',
'                    "vlor_sldo_cptal"   : model.getValue(record, "VLOR_SLDO_CPTAL").replace(/[.,\s]/g, ''''),',
'                    "vlor_intres"       : model.getValue(record, "VLOR_INTRES").replace(/[.,\s]/g, ''''),',
'                    "id_sjto"           : model.getValue(record, "ID_SJTO")',
'                    };',
'            });',
'',
'        ',
'       console.log(''Json: '',JSON.stringify(json));',
'       $(''#P2024005_JSON'').val(json.length > 0 ? JSON.stringify(json) : '''');',
'       if (json.length > 0) {',
'          ',
'          apex.item( "BTN_INSRTAR" ).show();',
'          apex.item( "BTN_AGRGAR_SJTO" ).show();',
'       }else{',
'           ',
'         apex.item( "BTN_AGRGAR_SJTO" ).hide();  ',
'         apex.item( "BTN_INSRTAR" ).hide();  ',
'       } ',
'       return;',
'   }   ',
'   ',
'    apex.item( "BTN_INSRTAR" ).hide();',
'    apex.item( "BTN_AGRGAR_SJTO" ).hide();',
'   ',
'}',
'',
'async function setear_orgen_sujeto(){',
'    await apex.server.process(',
'            "SET_ITEM_SESSION",',
'            {    ',
'                 pageItems: ''#P5_CDGO_ORGEN_SJTO, #P5_ID_PRCSO_CRGA, #P5_ID_CRGA''',
'            },',
'            {',
'                //dataType: ''text'',',
'                success: function( pData ){',
'                    console.log(''P5_CDGO_ORGEN_SJTO'', pData.P5_CDGO_ORGEN_SJTO);',
'                    console.log(''P5_ID_PRCSO_CRGA'', pData.P5_ID_PRCSO_CRGA);',
'                }',
'            }',
'        );',
'}',
' '))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CHENRIQUEZ'
,p_last_upd_yyyymmddhh24miss=>'20260122170636'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34237488272145248)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34240368694145277)
,p_plug_name=>'Propietarios'
,p_region_name=>'propietarios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_rzon_scial,',
'       a.dscrpcion_idntfccion_tpo ,',
'       a.idntfccion_rspnsble,',
'       a.id_sjto',
'  from v_si_i_sujetos_responsable a',
'  join si_c_sujetos b ',
'    on a.id_sjto    = b.id_sjto',
'  join si_i_sujetos_impuesto c ',
'    on c.id_sjto = a.id_sjto',
'   and c.id_sjto_impsto = a.id_sjto_impsto',
'   and c.id_impsto = :P2024005_ID_IMPSTO',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_sjto    = nvl(:P2024005_ID_SJTO,a.id_sjto)',
' group by a.nmbre_rzon_scial,',
'       a.dscrpcion_idntfccion_tpo ,',
'       a.idntfccion_rspnsble,',
'       a.id_sjto;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2024005_ID_SJTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34241701228145290)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(34241856675145291)
,p_name=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(36089465092717252)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre \00F3 Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104155880741785657)
,p_name=>'ID_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(34241538689145288)
,p_internal_uid=>34241538689145288
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(34624734428625070)
,p_interactive_grid_id=>wwv_flow_api.id(34241538689145288)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(34624817618625070)
,p_report_id=>wwv_flow_api.id(34624734428625070)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34625676642625077)
,p_view_id=>wwv_flow_api.id(34624817618625070)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(34241701228145290)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34626251518625078)
,p_view_id=>wwv_flow_api.id(34624817618625070)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(34241856675145291)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(36106800421128538)
,p_view_id=>wwv_flow_api.id(34624817618625070)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(36089465092717252)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>197
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104243654190718572)
,p_view_id=>wwv_flow_api.id(34624817618625070)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(104155880741785657)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34631922916651569)
,p_plug_name=>'Cartera'
,p_region_name=>'cartera'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    a.cdgo_clnte,',
'    a.id_impsto,',
'    a.id_impsto_sbmpsto,',
'    a.cdgo_mvmnto_orgn,',
'    a.id_orgen,',
'    a.id_mvmnto_fncro,',
'    a.id_sjto_impsto,',
'    a.vgncia,',
'    a.id_prdo,',
'    a.prdo,',
'    a.id_cncpto,',
'    a.cdgo_cncpto,',
'    a.dscrpcion_cncpto,',
'    a.vlor_sldo_cptal,',
'    NVL(a.vlor_intres, 0) AS vlor_intres,',
'    b.id_sjto',
'FROM v_gf_g_cartera_x_concepto a',
'JOIN v_si_i_sujetos_impuesto b ON b.id_sjto_impsto = a.id_sjto_impsto',
'WHERE a.cdgo_clnte = :F_CDGO_CLNTE',
unistr('  -- Manejo de par\00E1metros opcionales'),
'  AND (a.id_impsto = :P2024005_ID_IMPSTO OR :P2024005_ID_IMPSTO IS NULL)',
'  AND (a.id_impsto_sbmpsto = :P2024005_ID_IMPSTO_SBMPSTO OR :P2024005_ID_IMPSTO_SBMPSTO IS NULL)',
'  AND (b.idntfccion_sjto = :P2024005_IDNTFCCION OR :P2024005_IDNTFCCION IS NULL)',
'  ',
unistr('  -- Filtros de estado y direcci\00F3n'),
'  AND b.id_sjto_estdo = 1',
'  AND COALESCE(b.drccion, b.drccion_ntfccion) IS NOT NULL',
'  AND a.cdgo_mvnt_fncro_estdo = ''NO''',
'  AND (a.vlor_sldo_cptal + NVL(a.vlor_intres, 0)) > 0',
'  ',
unistr('  -- Validaci\00F3n de procesos jur\00EDdicos y embargos'),
'  AND NOT EXISTS (',
'      SELECT 1 ',
'      FROM cb_g_procesos_jrdco_mvmnto m ',
'      WHERE m.id_sjto_impsto = a.id_sjto_impsto ',
'        AND m.vgncia = a.vgncia ',
'        AND m.id_prdo = a.id_prdo ',
'        AND m.id_cncpto = a.id_cncpto',
'  )',
'  AND NOT EXISTS (',
'      SELECT 1 ',
'      FROM mc_g_embargos_cartera_detalle cd ',
'      WHERE cd.id_sjto_impsto = a.id_sjto_impsto ',
'        AND cd.vgncia = a.vgncia ',
'        AND cd.id_prdo = a.id_prdo ',
'        AND cd.id_cncpto = a.id_cncpto',
'  )',
'',
'/*select * from (select a.cdgo_clnte,',
'                      a.id_impsto,',
'                      a.id_impsto_sbmpsto,',
'                      a.cdgo_mvmnto_orgn,',
'                      a.id_orgen,',
'                      a.id_mvmnto_fncro,',
'                      a.id_sjto_impsto,',
'                      a.vgncia,',
'                      a.id_prdo,',
'                      a.prdo,',
'                      a.id_cncpto,',
'                      a.cdgo_cncpto,',
'                      a.dscrpcion_cncpto,',
'                      a.vlor_sldo_cptal,',
'                      nvl(a.vlor_intres, 0) vlor_intres,',
'                      B.ID_SJTO',
'                 from v_gf_g_cartera_x_concepto a',
'                 join v_si_i_sujetos_impuesto b',
'                   on b.id_sjto_impsto = a.id_sjto_impsto',
'                  and b.id_sjto_estdo = 1',
'                where a.cdgo_clnte = :F_CDGO_CLNTE',
'                  and (a.id_impsto = :P2024005_ID_IMPSTO or :P2024005_ID_IMPSTO is null)',
'                  and (a.id_impsto_sbmpsto = :P2024005_ID_IMPSTO_SBMPSTO or',
'                      :P2024005_ID_IMPSTO_SBMPSTO is null)',
'                  and (b.idntfccion_sjto = :P2024005_IDNTFCCION or',
'                      :P2024005_IDNTFCCION is null)',
'                  and (b.drccion is not null or b.drccion_ntfccion is not null)',
'                  and (a.vlor_sldo_cptal + a.vlor_intres) > 0',
'                  and a.cdgo_mvnt_fncro_estdo = ''NO''',
'                  and not exists (select 1',
'                         from cb_g_procesos_jrdco_mvmnto m',
'                        where m.id_sjto_impsto = a.id_sjto_impsto',
'                          and m.vgncia = a.vgncia',
'                          and m.id_prdo = a.id_prdo',
'                          and m.id_cncpto = a.id_cncpto)',
'                  and not exists (select 1',
'                         from mc_g_embargos_cartera_detalle cd',
'                        where cd.id_sjto_impsto = a.id_sjto_impsto',
'                          and cd.vgncia = a.vgncia',
'                          and cd.id_prdo = a.id_prdo',
'                          and cd.id_cncpto = a.id_cncpto)',
'                order by a.id_sjto_impsto, a.vgncia desc, a.prdo, a.id_cncpto);*/'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2024005_IDNTFCCION'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4040486592203301)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(4040517124203302)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(4040662689203303)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(4040754187203304)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(4040883561203305)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(4040913134203306)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(4041014872203307)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(4041170419203308)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(4041280846203309)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
 p_id=>wwv_flow_api.id(4073091045155103)
,p_name=>'ID_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
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
 p_id=>wwv_flow_api.id(34632673706651577)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(34632772154651578)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Interes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(34633005977651580)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34633109853651581)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37555011230016449)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(42916399328578451)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42916557735578452)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42916635519578453)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(34632022362651570)
,p_internal_uid=>34632022362651570
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
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(34732676853927164)
,p_interactive_grid_id=>wwv_flow_api.id(34632022362651570)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(34732816645927164)
,p_report_id=>wwv_flow_api.id(34732676853927164)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4046408775203647)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(4040486592203301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4046902287203651)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(4040517124203302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4047439011203653)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(4040662689203303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4047919731203654)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(4040754187203304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4048490904203656)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(4040883561203305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4048926555203657)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(4040913134203306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4049418332203659)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(4041014872203307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4049957557203660)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(4041170419203308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4050455714203661)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(4041280846203309)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4081475128361346)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(4073091045155103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34736318764927173)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(34632673706651577)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34736820689927174)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(34632772154651578)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34738548244929113)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(34633005977651580)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37583595257099754)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(37555011230016449)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(52586145312073460)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(42916399328578451)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(52586592849073464)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(42916557735578452)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(52587098490073466)
,p_view_id=>wwv_flow_api.id(34732816645927164)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(42916635519578453)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34633503859651585)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(34634249686651592)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('<p>Esta funcionalidad permite gestionar los procesos de selecci\00F3n de poblaci\00F3n del proceso jur\00EDdico.</p>'),
'<p> </p>',
'<p> </p>',
unistr('<p><b>Nota:</b> Solo se enviar\00E1n los conceptos seleccionados </p>'),
unistr('<b><i>1.</i></b> Permite consultar una identificaci\00F3n espec\00EDfica para seleccionar la cartera que se va a incluir en un lote por medio del bot\00F3n "Consultar".<br><br>'),
unistr('<b><i>2.</i></b> Permite consultar por medio de par\00E1metros una identificaci\00F3n para seleccionar la cartera que se va a incluir en un lote por medio del bot\00F3n "Consulta por Par\00E1metros".<br><br>'),
unistr('<b><i>3.</i></b> Permite realizar una selecci\00F3n masiva escogiendo una regla ya preestablecida para incluirla en un lote por medio del bot\00F3n "Selecci\00F3n Masiva por Regla".<br><br>'),
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40003812854823851)
,p_plug_name=>'Lote seleccionado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<b>Lote seleccionado</b> &P2024005_OBSRVCION.'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86827041612532196)
,p_plug_name=>'Datos del Lote: &P2024005_LTE.'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89160259218366947)
,p_plug_name=>'Tabulador'
,p_region_name=>'tab_conainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3965998982308758)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(34633503859651585)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:&P2024005_BRANCH.:&SESSION.::&DEBUG.:RP:P8_ID_PRCSO_SMU_LOTE,P8_ID_PRCSO_TPO:&P2024005_ID_PRCSO_SMU_LOTE.,&P2024005_ID_PRCSO_TPO.'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3966375270308759)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(34633503859651585)
,p_button_name=>'BTN_INSRTAR'
,p_button_static_id=>'BTN_INSRTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>'P2024005_ID_PRCSO_SMU_LOTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3966783169308760)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(34633503859651585)
,p_button_name=>'BTN_AGRGAR_SJTO'
,p_button_static_id=>'BTN_AGRGAR_SJTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Sujeto'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   if :P2024005_ID_PRCSO_SMU_LOTE is not null then',
'        return true;',
'   else',
'        return false;',
'   end if;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3967106441308760)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(34633503859651585)
,p_button_name=>'BTN_AGRGAR_SJTO_INXSTNTE'
,p_button_static_id=>'BTN_AGRGAR_SJTO_INXSTNTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Sujeto(s)<br>Inexistente(s)'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3968226636308768)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(34237488272145248)
,p_button_name=>'BTN_CONSLTR_PRMTROS'
,p_button_static_id=>'BTN_CONSLTR_PRMTROS'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Consultar por Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=71000:146:&SESSION.::&DEBUG.:RP,5:P146_NMRO_APP,P146_NMRO_PGNA,P146_NMBRE_ITEM,P146_VLDAR_CRTRA:&APP_ID.,&APP_PAGE_ID.,P2024005_ID_SJTO,1'
,p_icon_css_classes=>'fa-table-search'
,p_grid_column_attributes=>'style="top:15px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3968668412308768)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(34237488272145248)
,p_button_name=>'BTN_CONSLTR'
,p_button_static_id=>'BTN_CONSLTR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:15px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3967519397308762)
,p_name=>'P2024005_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(34633503859651585)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3969086345308768)
,p_name=>'P2024005_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el impuesto por el cual desea consultar de forma puntual.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3969954111308771)
,p_name=>'P2024005_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P2024005_ID_IMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P2024005_ID_IMPSTO'
,p_ajax_items_to_submit=>'P2024005_ID_IMPSTO,P2024005_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione el sub-impuesto por el cual desea consultar de forma puntual. La informaci\00F3n mostrada depende del impuesto que se escoja.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3970876204308772)
,p_name=>'P2024005_CDGO_ORGEN_SJTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_item_default=>'EX'
,p_prompt=>'Origen del Sujeto:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:EXISTENTES EN EL SISTEMA;EX,NO EXISTEN EN EL SISTEMA;NE'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P2024005_ID_PRCSO_TPO'
,p_display_when2=>'1'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3971284965308772)
,p_name=>'P2024005_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3971686259308773)
,p_name=>'P2024005_ID_SJTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3972013595308773)
,p_name=>'P2024005_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3972426480308773)
,p_name=>'P2024005_ID_PRCSO_SMU_LOTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3972871117308773)
,p_name=>'P2024005_JSON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3973241874308774)
,p_name=>'P2024005_ID_PRCSO_TPO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3973649485308774)
,p_name=>'P2024005_ID_PRCSO_CRGA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_prompt=>'Archivo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.file_name || ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'       , a.id_prcso_crga as r',
'    from v_et_g_procesos_carga a',
'   where id_crga in (select c.id_crga ',
'                       from et_g_carga c ',
'                      where c.id_crga = :P2024005_ID_CRGA',
'                   group by c.id_crga',
'                          )',
'     and ( indcdor_prcsdo = ''N'' or :P128_ID_PRCSO_CRGA is not null)',
'     and a.cdgo_clnte = :F_CDGO_CLNTE',
'order by a.id_prcso_crga;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Archivo'
,p_tag_css_classes=>'prcso_crga'
,p_colspan=>8
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Archivo Sujetos Inexistentes cargado por el modulo de etl.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3974551134308774)
,p_name=>'P2024005_ID_CRGA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_crga clob;',
'begin',
'',
'v_id_crga := pkg_cb_proceso_persuasivo.fnc_cl_parametro_configuracion(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                                      p_cdgo_cnfgrcion => ''IPC'');',
'',
'return(v_id_crga);',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3978000765308787)
,p_name=>'P2024005_OBSRVCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40003812854823851)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_obsrvcion varchar2(100);',
'begin',
'',
'    select obsrvcion',
'      into v_obsrvcion',
'      from cb_g_procesos_simu_lote',
'     where cdgo_clnte = :F_CDGO_CLNTE ',
'       and id_prcsos_smu_lte = :P2024005_ID_PRCSO_SMU_LOTE;',
'    ',
'    return v_obsrvcion;',
'exception when no_data_found then',
'    return '''';',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3978719997308788)
,p_name=>'P2024005_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(86827041612532196)
,p_prompt=>unistr('Lote de selecci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P2024005_ID_PRCSO_SMU_LOTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Es el lote de selecci\00F3n realizado por un funcionario.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3979682050308788)
,p_name=>'P2024005_OBSRVCION_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(86827041612532196)
,p_prompt=>unistr('Observaci\00F3n de Lote')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>1
,p_read_only_when=>'P2024005_ID_PRCSO_SMU_LOTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Muestra la observaci\00F3n del lote que fue ingresada cuando se genero un lote nuevo de selecci\00F3n de candidatos.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4041561606203312)
,p_name=>'P2024005_ID_SJTO_IMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(34237488272145248)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3989046577308806)
,p_computation_sequence=>10
,p_computation_item=>'P2024005_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Lote: ''||a.id_prcsos_smu_lte||'' *Fecha: ''||to_char(a.fcha_lte,''dd/mm/yyyy'')||'' *Funcionario: ''||b.nmbre_trcro  as dscrpcion_Lte',
'from cb_g_procesos_simu_lote a, v_sg_g_usuarios b',
'   where a.id_fncnrio = b.id_fncnrio',
'   and a.cdgo_clnte = :F_CDGO_CLNTE ',
'   and a.id_prcsos_smu_lte = :p2024005_id_prcso_smu_lote',
'order by id_prcsos_smu_lte;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3989422192308806)
,p_computation_sequence=>20
,p_computation_item=>'P2024005_OBSRVCION_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obsrvcion',
'from cb_g_procesos_simu_lote',
'where id_prcsos_smu_lte = :p2024005_id_prcso_smu_lote;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3817491171902706)
,p_computation_sequence=>30
,p_computation_item=>'P2024005_ID_CRGA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_cb_proceso_persuasivo.fnc_cl_parametro_configuracion(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                                        p_cdgo_cnfgrcion => ''IPC'')',
'from dual',
''))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3989838103308807)
,p_validation_name=>'validar cartera seleccionada'
,p_validation_sequence=>10
,p_validation=>'P2024005_JSON'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No se ha seleccionado una cartera'
,p_when_button_pressed=>wwv_flow_api.id(3966375270308759)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3992172488308810)
,p_name=>'antes de enviar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3992628172308813)
,p_event_id=>wwv_flow_api.id(3992172488308810)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3993083078308814)
,p_name=>'al hacer clic en la grid conceptos'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(34631922916651569)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3993506118308814)
,p_event_id=>wwv_flow_api.id(3993083078308814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3994092245308814)
,p_event_id=>wwv_flow_api.id(3993083078308814)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P2024005_JSON'', :P2024005_JSON);',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3994463683308815)
,p_name=>'al cargar la pagina'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3994970640308815)
,p_event_id=>wwv_flow_api.id(3994463683308815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {  ',
'    var region = apex.region("cartera");',
'    if (region) {',
'        apex.region("cartera").widget().interactiveGrid("setSelectedRecords", []);',
'    }',
'    recorrer_grid();      ',
'});',
'',
'',
'    '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3995478981308815)
,p_event_id=>wwv_flow_api.id(3994463683308815)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#BTN_AGRGAR_SJTO_INXSTNTE'').hide();',
'apex.item("P2024005_ID_PRCSO_CRGA").hide();',
'',
'if ($v(''P2024005_ID_PRCSO_TPO'') !== ''1''){',
'    $(''P2024005_CDGO_ORGEN_SJTO'').hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3995810890308815)
,p_name=>'Al cambiar item P2024005_CDGO_ORGEN_SJTO'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024005_CDGO_ORGEN_SJTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3996366824308816)
,p_event_id=>wwv_flow_api.id(3995810890308815)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setear_orgen_sujeto();',
'',
'if ($v(''P2024005_CDGO_ORGEN_SJTO'') == ''EX''){',
'    ',
'    $(''#P2024005_IDNTFCCION, #BTN_CONSLTR_PRMTROS, #BTN_CONSLTR, #P2024005_IDNTFCCION_LABEL'').show();',
'    //Ocultar lo de Darwin',
'    //$(''#BTN_AGRGAR_SJTO'').show();',
'    apex.item("P2024005_ID_PRCSO_CRGA").hide();',
'    $(''#tab_conainer, #cartera, #propietarios'').show();',
'    ',
'}else{',
'    $(''#P2024005_IDNTFCCION, #BTN_CONSLTR_PRMTROS, #BTN_CONSLTR, #P2024005_IDNTFCCION_LABEL'').hide();',
'    $(''#tab_conainer, #cartera, #propietarios'').hide();',
'    ',
'    ',
'    //Mostrar lo de Darwin',
'    //',
'    if (Number($v(''P2024005_ID_PRCSO_TPO'')) === 1){',
'        ',
'        console.log(''Entrando'');',
'        ',
'        apex.item("P2024005_ID_PRCSO_CRGA").show();',
'        $(''#BTN_AGRGAR_SJTO'').hide();',
'    }else{',
'        apex.item("P2024005_ID_PRCSO_CRGA").hide();',
'        $(''#BTN_AGRGAR_SJTO'').show();',
'    }',
'    ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3996700033308816)
,p_name=>'Al cambiar item P2024005_ID_PRCSO_CRGA'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024005_ID_PRCSO_CRGA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3997233213308816)
,p_event_id=>wwv_flow_api.id(3996700033308816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setear_orgen_sujeto();',
'if (apex.item("P2024005_ID_PRCSO_CRGA").getValue()) {',
'    apex.item(''BTN_AGRGAR_SJTO_INXSTNTE'').show();',
'}else{',
'    apex.item(''BTN_AGRGAR_SJTO_INXSTNTE'').hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3997601467308816)
,p_name=>'New'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3967106441308760)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3998194571308817)
,p_event_id=>wwv_flow_api.id(3997601467308816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit(''BTN_AGRGAR_SJTO_INXSTNTE'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4041630594203313)
,p_name=>'al dar clic'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3968668412308768)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4041796468203314)
,p_event_id=>wwv_flow_api.id(4041630594203313)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function buscarSujeto() {',
'    console.log(''Entrado: '');',
'    var impsto = apex.item("P2024005_ID_IMPSTO").getValue();',
'    var sub_impsto = apex.item("P2024005_ID_IMPSTO_SBMPSTO").getValue();',
'    var sujeto = apex.item("P2024005_IDNTFCCION").getValue();',
'    ',
'    if(impsto === "" || sub_impsto === "" || sujeto === ""){',
'        if (impsto === ""){',
'        apex.message.alert(''Por favor seleccione el Tributo'');}',
'         if (sub_impsto === ""){',
'        apex.message.alert(''Por favor seleccione el Sub - Tributo'');}',
'         if (sujeto === ""){',
'        apex.message.alert(''Por ingresar el Sujeto a buscar'');}',
'    }else{',
'    try {',
'        console.log(''Lamado al callback: '');',
'        apex.server.process(',
'            "buscar",',
'            {',
'                pageItems: "#P2024005_IDNTFCCION" ',
'            }, ',
'            {',
'                success: function (data) {',
'                    if (data.o_cdgo_rspsta !== 0) {',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([{',
'                            type: "error",',
'                            location: "page",',
'                            message: data.o_mnsje_rspsta, ',
'                            unsafe: false',
'                        }]);',
'                    } else {      ',
'                        console.log(''id_sjto_impsto: '',data.P2024005_ID_SJTO_IMPSTO);',
'                        apex.item(''P2024005_ID_SJTO_IMPSTO'').setValue(data.P2024005_ID_SJTO_IMPSTO);',
'                        apex.submit(); ',
'                    }',
'                },',
'                error: function (xhr, status, error) {',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([{',
'                        type: "error",',
'                        location: "page",',
unistr('                        message: `Error en la comunicaci\00F3n: ${error}`,'),
'                        unsafe: false',
'                    }]);',
'                }',
'            }',
'        );',
'    } catch (e) {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
'            message: `Error al ejecutar buscarSujeto: ${e.message}`,',
'            unsafe: false',
'        }]);',
'    }',
'    }',
'    console.log(''Saliendo: '');',
'}',
'',
'buscarSujeto();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4072853719155101)
,p_name=>'al cambiar'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024005_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4072975397155102)
,p_event_id=>wwv_flow_api.id(4072853719155101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_id_sjto number;',
'begin',
'   select id_sjto',
'      into v_id_sjto',
'      from si_c_sujetos',
'     where idntfccion = :P2024005_IDNTFCCION;',
'     ',
'     APEX_UTIL.SET_SESSION_STATE(p_name  => ''P2024005_ID_SJTO'',',
'                                p_value => v_id_sjto);',
' exception when others then',
'     :P2024005_ID_SJTO := null;',
' end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3990500598308808)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto number;    ',
'begin',
'    ',
'  begin ',
'   select id_sjto',
'      into :P2024005_ID_SJTO',
'      from si_c_sujetos',
'     where idntfccion    = :P2024005_IDNTFCCION;',
'  exception when others then',
'     :P2024005_ID_SJTO := null;',
'  end;           ',
'    ',
'exception when no_data_found then ',
'          :P2024005_ID_SJTO := null;',
'          :P2024005_RSPSTA := ''No Existe el Sujeto'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3968668412308768)
,p_process_success_message=>'&P2024005_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3990963287308808)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Lote de selecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_lte_nvo number;',
' v_obsrvcion varchar2(4000);',
' v_dscrpcion_tpo_cbro  varchar2(20);',
' v_id_rgla_ngcio_clnte number;',
' o_cdgo_rspsta number;',
' o_mnsje_rspsta varchar2(2000);',
'begin',
'     ',
'    if :P2024005_ID_PRCSO_TPO = 1 then',
'            v_dscrpcion_tpo_cbro := ''Persuasivo'';',
'        --    v_id_rgla_ngcio_clnte := to_number(pkg_cb_proceso_persuasivo.fnc_cl_parametro_configuracion(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_cnfgrcion => ''RNP'')); --24;',
'    end if;',
'    ',
unistr('    v_obsrvcion := nvl(:P2024005_OBSRVCION_LTE, ''Lote de Cobro ''||v_dscrpcion_tpo_cbro||'' generado por: ''||:F_NMBRE_USRIO||'' el d\00EDa ''||to_char(sysdate,''dd-mm-yyyy hh24:mi-ss''));'),
'           ',
'    pkg_cb_proceso_persuasivo.prc_rg_slccion_cndtos_pntal(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                          p_lte_simu => :P2024005_ID_PRCSO_SMU_LOTE,',
'                                                          p_id_impsto => :P2024005_ID_IMPSTO,',
'                                                          p_id_impsto_sbmpsto => :P2024005_ID_IMPSTO_SBMPSTO,',
'                                                          p_sjto_id => :P2024005_ID_SJTO,',
'                                                          p_id_usrio => :F_ID_USRIO,',
'                                                          p_json_movimientos => :P2024005_JSON,',
'                                                          p_obsrvcion_lte => v_obsrvcion,',
'                                                          p_id_prcso_tpo => :P2024005_ID_PRCSO_TPO,',
'                                                          p_cdgo_orgen_sjto => nvl(:P2024005_CDGO_ORGEN_SJTO,''EX''),',
'                                                          p_id_prcso_crga => :p_id_prcso_crga,',
'                                                          p_lte_nvo => v_lte_nvo,',
'                                                          o_cdgo_rspsta => o_cdgo_rspsta,',
'                                                          o_mnsje_rspsta => o_mnsje_rspsta);',
'',
'   /* pkg_cb_proceso_juridico.prc_rg_slcion_proceso_juridico (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                            p_lte_simu            => :P2024005_ID_PRCSO_SMU_LOTE,',
'                                                            p_sjto_id             => :P2024005_ID_SJTO,',
'                                                            p_id_impsto           => :P2024005_ID_IMPSTO,',
'                                                            p_id_usuario          => :F_ID_USRIO,',
'                                                            p_json_movimientos    => :P2024005_JSON,',
'                                                            p_obsrvcion_lte       => v_obsrvcion,',
'                                                            p_id_prcso_tpo        => :P2024005_ID_PRCSO_TPO,',
'                                                            p_cdgo_orgen_sjto     => nvl(:P2024005_CDGO_ORGEN_SJTO,''EX''),',
'                                                            p_id_rgla_ngcio_clnte => v_id_rgla_ngcio_clnte,',
'                                                            p_lte_nvo             => v_lte_nvo,',
'                                                            o_cdgo_rspsta         => o_cdgo_rspsta,',
'                                                            o_mnsje_rspsta        => o_mnsje_rspsta);*/',
'                                                             ',
'    if o_cdgo_rspsta <> 0 then',
'        raise_application_error( -20001 , o_cdgo_rspsta||''-''||o_mnsje_rspsta );',
'    end if;',
'    ',
'    :P2024005_ID_PRCSO_SMU_LOTE := v_lte_nvo;',
'    :P2024005_ID_SJTO           := null;',
'    :P2024005_ID_IMPSTO         := null;',
'    :P2024005_ID_IMPSTO_SBMPSTO := null;',
'    :P2024005_IDNTFCCION        := null;  ',
'        ',
'end;'))
,p_process_error_message=>'No se pudo realizar el proceso.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_INSRTAR,BTN_AGRGAR_SJTO'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Registro exitoso.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3991347832308808)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar lote - Sujetos inexistentes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta         number;',
'  v_mnsje_rspsta        varchar2(4000);',
'  v_lte_nvo             number;',
'  v_id_rgla_ngcio_clnte number;',
'  o_cdgo_rspsta         number;',
'  o_mnsje_rspsta        varchar2(2000);',
'  ',
'begin',
'',
'    v_id_rgla_ngcio_clnte := 4;',
'    if :P2024005_ID_PRCSO_TPO = 1 then',
'            v_id_rgla_ngcio_clnte := 24;',
'    end if;',
'    ',
'    ',
'    --Registro Sujetos Inexistentes',
'    pkg_cb_proceso_juridico.prc_rg_slcion_proceso_juridico (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                            p_lte_simu            => :P2024005_ID_PRCSO_SMU_LOTE,',
'                                                            p_sjto_id             => null,',
'                                                            p_id_impsto           => :P2024005_ID_IMPSTO,',
'                                                            p_id_usuario          => :F_ID_USRIO,',
'                                                            p_json_movimientos    => null,',
'                                                            p_obsrvcion_lte       => :P2024005_OBSRVCION_LTE,',
'                                                            p_id_prcso_tpo        => :P2024005_ID_PRCSO_TPO,',
'                                                            p_cdgo_orgen_sjto     => :P2024005_CDGO_ORGEN_SJTO,',
'                                                            p_id_prcso_crga       => :P2024005_ID_PRCSO_CRGA,',
'                                                            p_id_rgla_ngcio_clnte => v_id_rgla_ngcio_clnte,  ',
'                                                            p_lte_nvo             => v_lte_nvo,',
'                                                            o_cdgo_rspsta         => o_cdgo_rspsta,',
'                                                            o_mnsje_rspsta        => o_mnsje_rspsta);  ',
'                                                            ',
'    :P2024005_ID_PRCSO_SMU_LOTE := v_lte_nvo;',
'    :P2024005_ID_SJTO           := null;',
'    :P2024005_ID_IMPSTO         := null;',
'    :P2024005_ID_IMPSTO_SBMPSTO := null;',
'    :P2024005_IDNTFCCION        := null;                                                            ',
'    ',
'    if( v_cdgo_rspsta <> 0 ) then',
'       raise_application_error( -20001 , v_mnsje_rspsta );',
'    end if;                       ',
'end;'))
,p_process_error_message=>'No se pudo realizar el proceso.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_AGRGAR_SJTO_INXSTNTE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Proceso Realizado Exitosamente.'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3991739164308809)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_ITEM_SESSION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_UTIL.SET_SESSION_STATE (',
'        p_name     => ''P2024005_CDGO_ORGEN_SJTO'',',
'        p_value    => :P2024005_CDGO_ORGEN_SJTO);',
'        ',
'     APEX_UTIL.SET_SESSION_STATE (',
'        p_name     => ''P2024005_ID_PRCSO_CRGA'',',
'        p_value    => :P2024005_ID_PRCSO_CRGA);',
'        ',
'     APEX_UTIL.SET_SESSION_STATE (',
'        p_name     => ''P2024005_ID_CRGA'',',
'        p_value    => :P2024005_ID_CRGA);         ',
'        ',
'    apex_json.open_object();',
'    apex_json.write(''P2024005_CDGO_ORGEN_SJTO'', :P2024005_CDGO_ORGEN_SJTO);',
'    apex_json.write(''P2024005_ID_PRCSO_CRGA''  , :P2024005_ID_PRCSO_CRGA); ',
'    apex_json.write(''P2024005_ID_CRGA''        , :P2024005_ID_CRGA);       ',
'    apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4041893363203315)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'buscar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta    number := 0;',
'  v_mnsje_rspsta   varchar2(4000);',
'  v_id_sjto_impsto number;',
'begin',
'  v_mnsje_rspsta := ''Sujeto impuesto encontrado'';',
'  begin',
'    select id_sjto_impsto, id_sjto',
'      into v_id_sjto_impsto, :P2024005_ID_SJTO',
'      from v_si_i_sujetos_impuesto',
'     where idntfccion_sjto = :P2024005_IDNTFCCION',
'       and id_impsto = :P2024005_ID_IMPSTO;',
'  exception',
'    when others then',
'      v_cdgo_rspsta  := 10;',
'      v_mnsje_rspsta := '''' || v_cdgo_rspsta ||',
'                        '', error al consultar el sujeto impuesto'';',
'  end;',
'',
'  insert into muerto',
'    (n_001, v_001, t_001)',
'  values',
'    (300, ''id_sjto_impsto: '' || v_id_sjto_impsto, systimestamp);',
'  commit;',
'',
'  begin',
'    APEX_UTIL.SET_SESSION_STATE(p_name  => ''P2024005_ID_SJTO_IMPSTO'',',
'                                p_value => v_id_sjto_impsto);',
'  exception',
'    when others then',
'      v_cdgo_rspsta  := 20;',
'      v_mnsje_rspsta := ''error al setear el sujeto impuesto'';',
'  end;',
'',
'  apex_json.open_object();',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'  apex_json.write(''P2024005_ID_SJTO_IMPSTO'', :P2024005_ID_SJTO_IMPSTO);',
'  apex_json.close_object();',
'',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
