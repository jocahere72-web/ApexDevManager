prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Proceso de selecci\00F3n')
,p_step_title=>unistr('Proceso de selecci\00F3n')
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
'       var json = records.map(function(record){',
'           return { "cdgo_clnte"        : model.getValue(record , "CDGO_CLNTE").trim(),',
'                    "id_impsto"         : model.getValue(record , "ID_IMPSTO").trim(),',
'                    "id_impsto_sbmpsto" : model.getValue(record , "ID_IMPSTO_SBMPSTO").trim(),',
'                    "cdgo_mvmnto_orgn"  : model.getValue(record , "CDGO_MVMNTO_ORGN").trim(),',
'                    "id_orgen"          : model.getValue(record , "ID_ORGEN").trim(),',
'                    "id_mvmnto_fncro"   : model.getValue(record , "ID_MVMNTO_FNCRO").trim(),',
'                    "id_sjto_impsto"    : model.getValue(record , "ID_SJTO_IMPSTO").trim(),',
'                    "vgncia"            : model.getValue(record, "VGNCIA").trim(),',
'                    "prdo"              : model.getValue(record, "ID_PRDO"),',
'                    "id_cncpto"         : model.getValue(record, "ID_CNCPTO"),',
'                    "vlor_sldo_cptal"   : model.getValue(record, "VLOR_SLDO_CPTAL").trim().split(''.'').join(''''),',
'                    "vlor_intres"       : model.getValue(record, "VLOR_INTRES").trim().split(''.'').join('''')',
'                  };',
'       });',
'        ',
'        //console.log(json);',
'       $(''#P5_JSON'').val(json.length > 0 ? JSON.stringify(json) : '''');',
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
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20240917210024'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30272130103836502)
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
 p_id=>wwv_flow_api.id(30275010525836531)
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
'   and c.id_impsto = :P5_ID_IMPSTO',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_sjto    = nvl(:P5_ID_SJTO,a.id_sjto)',
' group by a.nmbre_rzon_scial,',
'       a.dscrpcion_idntfccion_tpo ,',
'       a.idntfccion_rspnsble,',
'       a.id_sjto;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P5_ID_SJTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30276343059836544)
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
 p_id=>wwv_flow_api.id(30276498506836545)
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
 p_id=>wwv_flow_api.id(32124106924408506)
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
 p_id=>wwv_flow_api.id(100190522573476911)
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
 p_id=>wwv_flow_api.id(30276180520836542)
,p_internal_uid=>30276180520836542
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
 p_id=>wwv_flow_api.id(30659376260316324)
,p_interactive_grid_id=>wwv_flow_api.id(30276180520836542)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(30659459450316324)
,p_report_id=>wwv_flow_api.id(30659376260316324)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30660318474316331)
,p_view_id=>wwv_flow_api.id(30659459450316324)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(30276343059836544)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30660893350316332)
,p_view_id=>wwv_flow_api.id(30659459450316324)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(30276498506836545)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32141442252819792)
,p_view_id=>wwv_flow_api.id(30659459450316324)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(32124106924408506)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>197
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100278296022409826)
,p_view_id=>wwv_flow_api.id(30659459450316324)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(100190522573476911)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30666564748342823)
,p_plug_name=>'Cartera'
,p_region_name=>'cartera'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select a.cdgo_clnte,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.cdgo_mvmnto_orgn,',
'       a.id_orgen,',
'       a.id_mvmnto_fncro,',
'       a.id_sjto_impsto,',
'       a.vgncia ,',
'       a.id_prdo,',
'	   a.prdo,',
'	   a.id_cncpto,',
'	   a.cdgo_cncpto,',
'	   a.dscrpcion_cncpto ,',
'	   a.vlor_sldo_cptal,',
'	   nvl(a.vlor_intres,0) vlor_intres,',
'	   rownum as num',
'  from v_gf_g_cartera_x_concepto a',
'  join si_i_sujetos_impuesto b',
'    on b.id_sjto_impsto    = a.id_sjto_impsto     ',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and b.id_sjto           = :P5_ID_SJTO',
'   and a.id_impsto         = nvl(:P5_ID_IMPSTO, a.id_impsto)',
'   and a.id_impsto_sbmpsto = nvl(:P5_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'   and a.vlor_sldo_cptal   > 0',
'   --and a.dscrpcion_mvnt_fncro_estdo = ''Normal''',
'   and trunc(a.fcha_vncmnto) <= trunc(sysdate)',
'   and a.cdgo_mvnt_fncro_estdo = ''NO''',
'   and a.indcdor_mvmnto_blqdo = ''N''',
'   and not exists(select 1 ',
'                    from cb_g_procesos_smu_mvmnto c ',
'                   where c.cdgo_clnte = a.cdgo_clnte',
'                     and c.id_impsto = a.id_impsto',
'                     and c.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'                     and c.id_sjto_impsto = a.id_sjto_impsto ',
'                     and c.vgncia = a.vgncia',
'                     and c.id_prdo = a.id_prdo',
'                     and c.id_cncpto = a.id_cncpto',
'                     and c.cdgo_mvmnto_orgn = a.cdgo_mvmnto_orgn',
'                     and c.id_orgen = a.id_orgen',
'                     and c.id_mvmnto_fncro = a.id_mvmnto_fncro)',
'    and a.vgncia not in (select vgncia',
'                     from MC_G_EMBARGOS_SMU_MVMNTO',
'                     where id_sjto_impsto = b.id_sjto_impsto)*/',
'select a.cdgo_clnte,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.cdgo_mvmnto_orgn,',
'       a.id_orgen,',
'       a.id_mvmnto_fncro,',
'       a.id_sjto_impsto,',
'       a.vgncia,',
'       a.id_prdo,',
'       a.prdo,',
'       a.id_cncpto,',
'       a.cdgo_cncpto,',
'       a.dscrpcion_cncpto,',
'       a.vlor_sldo_cptal,',
'       nvl(a.vlor_intres, 0) vlor_intres,',
'       rownum as num',
'  from v_gf_g_cartera_x_concepto a',
'  join si_i_sujetos_impuesto b',
'    on b.id_sjto_impsto = a.id_sjto_impsto',
'   and b.id_sjto_estdo = 1',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_sjto = :P5_ID_SJTO',
'   and a.id_impsto = nvl(:P5_ID_IMPSTO, a.id_impsto)',
'   and a.id_impsto_sbmpsto = nvl(:P5_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'   and a.vlor_sldo_cptal > 0',
'   and a.cdgo_mvnt_fncro_estdo = ''NO''',
'    and not exists (select 1',
'          from cb_g_procesos_jrdco_mvmnto c',
'         where c.id_sjto_impsto = a.id_sjto_impsto',
'           and c.vgncia = a.vgncia',
'           and c.id_prdo = a.id_prdo',
'           and c.id_cncpto = a.id_cncpto)',
'  AND (',
'        (a.id_impsto = 230011 AND pkg_cb_proceso_juridico.fnc_vl_determinacion_vigencia_prdo(',
'          p_id_sjto_impsto => a.id_sjto_impsto,',
'          p_vgncia         => a.vgncia,',
'          p_id_prdo        => a.id_prdo,',
'          p_id_cncpto      => a.id_cncpto',
'        ) = ''S'')',
'      OR',
'      (a.id_impsto = 230012 AND ''S'' = ''S'')',
'  )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P5_ID_SJTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30666776140342825)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(30666835534342826)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(30666968788342827)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(30667049169342828)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(30667197163342829)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(30667294712342830)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(30667315538342831)
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
 p_id=>wwv_flow_api.id(30667413986342832)
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
 p_id=>wwv_flow_api.id(30667530507342833)
,p_name=>'NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30667647809342834)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30667751685342835)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33589653061707703)
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
 p_id=>wwv_flow_api.id(38951041160269705)
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
 p_id=>wwv_flow_api.id(38951199567269706)
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
 p_id=>wwv_flow_api.id(38951277351269707)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38951340133269708)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38951408780269709)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38951546162269710)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(30666664194342824)
,p_internal_uid=>30666664194342824
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
 p_id=>wwv_flow_api.id(30767318685618418)
,p_interactive_grid_id=>wwv_flow_api.id(30666664194342824)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(30767458477618418)
,p_report_id=>wwv_flow_api.id(30767318685618418)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30767928193618419)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(30666776140342825)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30768454649618420)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(30666835534342826)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30768925016618422)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(30666968788342827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30769474854618423)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(30667049169342828)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30769971248618424)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(30667197163342829)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30770438809618425)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(30667294712342830)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30770960596618427)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(30667315538342831)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30771462521618428)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(30667413986342832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30771957511618429)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(30667530507342833)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30773190076620367)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(30667647809342834)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33618237088791008)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(33589653061707703)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48620787143764714)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(38951041160269705)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48621234680764718)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(38951199567269706)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48621740321764720)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(38951277351269707)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48622205981764722)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(38951340133269708)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48622707412764723)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(38951408780269709)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48623218613764725)
,p_view_id=>wwv_flow_api.id(30767458477618418)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(38951546162269710)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30668145691342839)
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
 p_id=>wwv_flow_api.id(30668891518342846)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36038454686515105)
,p_plug_name=>'Lote seleccionado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<b>Lote seleccionado</b> &P5_OBSRVCION.'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82861683444223450)
,p_plug_name=>'Datos del Lote: &P5_LTE.'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85194901050058201)
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
 p_id=>wwv_flow_api.id(30668563330342843)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(30668145691342839)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:&P5_BRANCH.:&SESSION.::&DEBUG.:RP:P8_ID_PRCSO_SMU_LOTE,P8_ID_PRCSO_TPO:&P5_ID_PRCSO_SMU_LOTE.,&P5_ID_PRCSO_TPO.'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30668728425342845)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(30668145691342839)
,p_button_name=>'BTN_INSRTAR'
,p_button_static_id=>'BTN_INSRTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>'P5_ID_PRCSO_SMU_LOTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(36038220567515103)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(30668145691342839)
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
'   if :P5_ID_PRCSO_SMU_LOTE is not null then',
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
 p_id=>wwv_flow_api.id(138908162723587102)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(30668145691342839)
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
 p_id=>wwv_flow_api.id(30272678683836507)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(30272130103836502)
,p_button_name=>'BTN_CONSLTR_PRMTROS'
,p_button_static_id=>'BTN_CONSLTR_PRMTROS'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Consultar por Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=71000:146:&SESSION.::&DEBUG.:RP,5:P146_NMRO_APP,P146_NMRO_PGNA,P146_NMBRE_ITEM,P146_VLDAR_CRTRA:&APP_ID.,&APP_PAGE_ID.,P5_ID_SJTO,1'
,p_icon_css_classes=>'fa-table-search'
,p_grid_column_attributes=>'style="top:15px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30272502716836506)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(30272130103836502)
,p_button_name=>'BTN_CONSLTR'
,p_button_static_id=>'BTN_CONSLTR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:15px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22604669519594211)
,p_name=>'P5_ID_PRCSO_TPO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30272265139836503)
,p_name=>'P5_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
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
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el impuesto por el cual desea consultar de forma puntual.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30272365567836504)
,p_name=>'P5_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P5_ID_IMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P5_ID_IMPSTO'
,p_ajax_items_to_submit=>'P5_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione el sub-impuesto por el cual desea consultar de forma puntual. La informaci\00F3n mostrada depende del impuesto que se escoja.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30272417100836505)
,p_name=>'P5_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
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
 p_id=>wwv_flow_api.id(30272705953836508)
,p_name=>'P5_ID_SJTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30668043251342838)
,p_name=>'P5_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30668642182342844)
,p_name=>'P5_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(30668145691342839)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30669080363342848)
,p_name=>'P5_JSON'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31142325565292446)
,p_name=>'P5_ID_PRCSO_SMU_LOTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36038597081515106)
,p_name=>'P5_OBSRVCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(36038454686515105)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_obsrvcion varchar2(100);',
'begin',
'',
'    select obsrvcion',
'      into v_obsrvcion',
'      from cb_g_procesos_simu_lote',
'     where cdgo_clnte = :F_CDGO_CLNTE ',
'       and id_prcsos_smu_lte = :P5_ID_PRCSO_SMU_LOTE;',
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
 p_id=>wwv_flow_api.id(84981240237475101)
,p_name=>'P5_OBSRVCION_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(82861683444223450)
,p_prompt=>unistr('Observaci\00F3n de Lote')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>1
,p_read_only_when=>'P5_ID_PRCSO_SMU_LOTE'
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
 p_id=>wwv_flow_api.id(84981338689475102)
,p_name=>'P5_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(82861683444223450)
,p_prompt=>unistr('Lote de selecci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P5_ID_PRCSO_SMU_LOTE'
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
 p_id=>wwv_flow_api.id(102518831675246141)
,p_name=>'P5_CDGO_ORGEN_SJTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
,p_item_default=>'EX'
,p_prompt=>'Origen del Sujeto:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:EXISTENTES EN EL SISTEMA;EX,NO EXISTEN EN EL SISTEMA;NE'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P5_ID_PRCSO_TPO'
,p_display_when2=>'1'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138990888565971376)
,p_name=>'P5_ID_PRCSO_CRGA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
,p_prompt=>'Archivo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.file_name || ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'       , a.id_prcso_crga as r',
'    from v_et_g_procesos_carga a',
'   where id_crga in (select c.id_crga ',
'                       from et_g_carga c ',
'                      where c.id_crga = :P5_ID_CRGA',
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
 p_id=>wwv_flow_api.id(139338818064762724)
,p_name=>'P5_ID_CRGA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(30272130103836502)
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
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(84981450680475103)
,p_computation_sequence=>10
,p_computation_item=>'P5_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Lote: ''||a.id_prcsos_smu_lte||'' *Fecha: ''||to_char(a.fcha_lte,''dd/mm/yyyy'')||'' *Funcionario: ''||b.nmbre_trcro  as dscrpcion_Lte',
'from cb_g_procesos_simu_lote a, v_sg_g_usuarios b',
'   where a.id_fncnrio = b.id_fncnrio',
'   and a.cdgo_clnte = :F_CDGO_CLNTE ',
'   and a.id_prcsos_smu_lte = :p5_id_prcso_smu_lote',
'order by id_prcsos_smu_lte;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(84981590256475104)
,p_computation_sequence=>20
,p_computation_item=>'P5_OBSRVCION_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obsrvcion',
'from cb_g_procesos_simu_lote',
'where id_prcsos_smu_lte = :p5_id_prcso_smu_lote;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(30669179462342849)
,p_validation_name=>'validar cartera seleccionada'
,p_validation_sequence=>10
,p_validation=>'P5_JSON'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No se ha seleccionado una cartera'
,p_when_button_pressed=>wwv_flow_api.id(30668728425342845)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30669285733342850)
,p_name=>'antes de enviar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30889942813260301)
,p_event_id=>wwv_flow_api.id(30669285733342850)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33589776153707704)
,p_name=>'al hacer clic en la grid conceptos'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(30666564748342823)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33589857291707705)
,p_event_id=>wwv_flow_api.id(33589776153707704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33589989984707706)
,p_event_id=>wwv_flow_api.id(33589776153707704)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P5_JSON'', :P5_JSON);',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34930369230376403)
,p_name=>'al cargar la pagina'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34930442456376404)
,p_event_id=>wwv_flow_api.id(34930369230376403)
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
 p_id=>wwv_flow_api.id(138908251684587103)
,p_event_id=>wwv_flow_api.id(34930369230376403)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#BTN_AGRGAR_SJTO_INXSTNTE'').hide();',
'apex.item("P5_ID_PRCSO_CRGA").hide();',
'',
'if ($v(''P5_ID_PRCSO_TPO'') !== ''1''){',
'    $(''P5_CDGO_ORGEN_SJTO'').hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(102518970156246142)
,p_name=>'Al cambiar item P5_CDGO_ORGEN_SJTO'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_CDGO_ORGEN_SJTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138908062050587101)
,p_event_id=>wwv_flow_api.id(102518970156246142)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setear_orgen_sujeto();',
'',
'if ($v(''P5_CDGO_ORGEN_SJTO'') == ''EX''){',
'    ',
'    $(''#P5_IDNTFCCION, #BTN_CONSLTR_PRMTROS, #BTN_CONSLTR, #P5_IDNTFCCION_LABEL'').show();',
'    //Ocultar lo de Darwin',
'    //$(''#BTN_AGRGAR_SJTO'').show();',
'    apex.item("P5_ID_PRCSO_CRGA").hide();',
'    $(''#tab_conainer, #cartera, #propietarios'').show();',
'    ',
'}else{',
'    $(''#P5_IDNTFCCION, #BTN_CONSLTR_PRMTROS, #BTN_CONSLTR, #P5_IDNTFCCION_LABEL'').hide();',
'    $(''#tab_conainer, #cartera, #propietarios'').hide();',
'    ',
'    ',
'    //Mostrar lo de Darwin',
'    //',
'    if (Number($v(''P5_ID_PRCSO_TPO'')) === 1){',
'        ',
'        console.log(''Entrando'');',
'        ',
'        apex.item("P5_ID_PRCSO_CRGA").show();',
'        $(''#BTN_AGRGAR_SJTO'').hide();',
'    }else{',
'        apex.item("P5_ID_PRCSO_CRGA").hide();',
'        $(''#BTN_AGRGAR_SJTO'').show();',
'    }',
'    ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(137166098338738935)
,p_name=>'Al cambiar item P5_ID_PRCSO_CRGA'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_ID_PRCSO_CRGA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(137166123368738936)
,p_event_id=>wwv_flow_api.id(137166098338738935)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setear_orgen_sujeto();',
'if (apex.item("P5_ID_PRCSO_CRGA").getValue()) {',
'    apex.item(''BTN_AGRGAR_SJTO_INXSTNTE'').show();',
'}else{',
'    apex.item(''BTN_AGRGAR_SJTO_INXSTNTE'').hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138909494015587115)
,p_name=>'New'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(138908162723587102)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138909530629587116)
,p_event_id=>wwv_flow_api.id(138909494015587115)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit(''BTN_AGRGAR_SJTO_INXSTNTE'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30667993938342837)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto number;    ',
'begin',
'    ',
'    select id_sjto',
'      into :P5_ID_SJTO',
'      from si_c_sujetos',
'     where cdgo_clnte    = :F_CDGO_CLNTE ',
'       and idntfccion    = :P5_IDNTFCCION;',
'       ',
'    :P5_RSPSTA := '''';  ',
'    ',
'exception when no_data_found then ',
'          :P5_ID_SJTO := null;',
'          :P5_RSPSTA := ''No Existe el Sujeto'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(30272502716836506)
,p_process_success_message=>'&P5_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30890488357260306)
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
'',
unistr('    v_dscrpcion_tpo_cbro := ''Jur\00EDdico'';'),
'    v_id_rgla_ngcio_clnte := to_number(pkg_cb_proceso_persuasivo.fnc_cl_parametro_configuracion(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_cnfgrcion => ''RNJ'')); --4',
'    if :P5_ID_PRCSO_TPO = 1 then',
'            v_dscrpcion_tpo_cbro := ''Persuasivo'';',
'            v_id_rgla_ngcio_clnte := to_number(pkg_cb_proceso_persuasivo.fnc_cl_parametro_configuracion(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_cnfgrcion => ''RNP'')); --24;',
'    end if;',
'    ',
unistr('    v_obsrvcion := nvl(:P5_OBSRVCION_LTE, ''Lote de Cobro ''||v_dscrpcion_tpo_cbro||'' generado por: ''||:F_NMBRE_USRIO||'' el d\00EDa ''||to_char(sysdate,''dd-mm-yyyy hh24:mi-ss''));'),
'    ',
'    /*select json_object(',
'        ''P5_ID_PRCSO_SMU_LOTE'' value :P5_ID_PRCSO_SMU_LOTE,',
'        ''P5_ID_SJTO'' value :P5_ID_SJTO,',
'        ''P5_JSON'' value :P5_JSON,',
'        ''v_obsrvcion'' value v_obsrvcion,',
'        ''P5_ID_PRCSO_TPO'' value :P5_ID_PRCSO_TPO,',
'        ''P5_CDGO_ORGEN_SJTO'' value ',
'    )',
'    from dual;*/',
'    ',
'    pkg_cb_proceso_juridico.prc_rg_slcion_proceso_juridico (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                            p_lte_simu            => :P5_ID_PRCSO_SMU_LOTE,',
'                                                            p_sjto_id             => :P5_ID_SJTO,',
'                                                            p_id_usuario          => :F_ID_USRIO,',
'                                                            p_json_movimientos    => :P5_JSON,',
'                                                            p_obsrvcion_lte       => v_obsrvcion,',
'                                                            p_id_prcso_tpo        => :P5_ID_PRCSO_TPO,',
'                                                            p_cdgo_orgen_sjto     => nvl(:P5_CDGO_ORGEN_SJTO,''EX''),',
'                                                            p_id_rgla_ngcio_clnte => v_id_rgla_ngcio_clnte,',
'                                                            p_lte_nvo             => v_lte_nvo,',
'                                                            o_cdgo_rspsta         => o_cdgo_rspsta,',
'                                                            o_mnsje_rspsta        => o_mnsje_rspsta);',
'                                                             ',
'    if o_cdgo_rspsta <> 0 then',
'        raise_application_error( -20001 , o_cdgo_rspsta||''-''||o_mnsje_rspsta );',
'    end if;',
'    ',
'    :P5_ID_PRCSO_SMU_LOTE := v_lte_nvo;',
'    :P5_ID_SJTO           := null;',
'    :P5_ID_IMPSTO         := null;',
'    :P5_ID_IMPSTO_SBMPSTO := null;',
'    :P5_IDNTFCCION        := null;',
'    ',
'    /*if :p5_obsrvcion is null then',
'        select a.obsrvcion',
'          into :p5_obsrvcion',
'          from cb_g_procesos_simu_lote a',
'         where a.id_prcsos_smu_lte = v_lte_nvo',
'          and a.cdgo_clnte = :F_CDGO_CLNTE;',
'    end if;      */    ',
'    ',
'end;'))
,p_process_error_message=>'No se pudo realizar el proceso.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_INSRTAR,BTN_AGRGAR_SJTO'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Registro exitoso.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(137166371333738938)
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
'    if :P5_ID_PRCSO_TPO = 1 then',
'            v_id_rgla_ngcio_clnte := 24;',
'    end if;',
'    ',
'    ',
'    --Registro Sujetos Inexistentes',
'    pkg_cb_proceso_juridico.prc_rg_slcion_proceso_juridico (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                            p_lte_simu            => :P5_ID_PRCSO_SMU_LOTE,',
'                                                            p_sjto_id             => null,',
'                                                            p_id_usuario          => :F_ID_USRIO,',
'                                                            p_json_movimientos    => null,',
'                                                            p_obsrvcion_lte       => :P5_OBSRVCION_LTE,',
'                                                            p_id_prcso_tpo        => :P5_ID_PRCSO_TPO,',
'                                                            p_cdgo_orgen_sjto     => :P5_CDGO_ORGEN_SJTO,',
'                                                            p_id_prcso_crga       => :P5_ID_PRCSO_CRGA,',
'                                                            p_id_rgla_ngcio_clnte => v_id_rgla_ngcio_clnte,  ',
'                                                            p_lte_nvo             => v_lte_nvo,',
'                                                            o_cdgo_rspsta         => o_cdgo_rspsta,',
'                                                            o_mnsje_rspsta        => o_mnsje_rspsta);  ',
'                                                            ',
'    :P5_ID_PRCSO_SMU_LOTE := v_lte_nvo;',
'    :P5_ID_SJTO           := null;',
'    :P5_ID_IMPSTO         := null;',
'    :P5_ID_IMPSTO_SBMPSTO := null;',
'    :P5_IDNTFCCION        := null;                                                            ',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30272809749836509)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Despu\00E9s de cargar la pagina')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'',
'begin',
'    ',
'    select a.idntfccion_sjto,',
'           a.id_sjto',
'      into :P5_IDNTFCCION,',
'           :P5_ID_SJTO',
'      from v_si_c_sujetos a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto         = :P5_ID_SJTO;',
'       --and a.idntfccion_sjto = nvl(:P5_IDNTFCCION, a.idntfccion_sjto) ',
'       --and (:P5_ID_SJTO is not null or  :P5_IDNTFCCION is not null);',
'       ',
'exception when no_data_found then ',
'         -- null;        ',
'          apex_util.set_session_state(''P5_IDNTFCCION'',  '''');',
'          apex_util.set_session_state(''P5_ID_SJTO'',  '''');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138908878778587109)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_ITEM_SESSION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_UTIL.SET_SESSION_STATE (',
'        p_name     => ''P5_CDGO_ORGEN_SJTO'',',
'        p_value    => :P5_CDGO_ORGEN_SJTO);',
'        ',
'     APEX_UTIL.SET_SESSION_STATE (',
'        p_name     => ''P5_ID_PRCSO_CRGA'',',
'        p_value    => :P5_ID_PRCSO_CRGA);',
'        ',
'     APEX_UTIL.SET_SESSION_STATE (',
'        p_name     => ''P5_ID_CRGA'',',
'        p_value    => :P5_ID_CRGA);         ',
'        ',
'    apex_json.open_object();',
'    apex_json.write(''P5_CDGO_ORGEN_SJTO'', :P5_CDGO_ORGEN_SJTO);',
'    apex_json.write(''P5_ID_PRCSO_CRGA''  , :P5_ID_PRCSO_CRGA); ',
'    apex_json.write(''P5_ID_CRGA''        , :P5_ID_CRGA);       ',
'    apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
