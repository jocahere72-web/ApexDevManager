prompt --application/pages/page_00105
begin
wwv_flow_api.create_page(
 p_id=>105
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Cartera - Solicitud de Acuerdo de Pago'
,p_step_title=>'Cartera - Solicitud de Acuerdo de Pago'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}',
'function apenascargue(){',
'      var vgncia_prdo = [];',
'    // trae el valor del json',
'    if($v(''P105_VGNCIA_PRDO'')){',
'        try{',
'            // convierte en tipo json',
'            vgncia_prdo = JSON.parse($v(''P105_VGNCIA_PRDO''));                    ',
'        }catch(e){',
'            vgncia_prdo = [];',
'        }',
'    }   ',
unistr('    //si el json est\00E1 lleno '),
'    if (vgncia_prdo.length > 0){      ',
'        // construye la vista',
'        var view = apex.region(''deudas'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        vgncia_prdo = vgncia_prdo.map(m => Number(m.ID_ORGEN));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;',
'        console.log(vgncia_prdo, records);',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return vgncia_prdo.indexOf(Number(model.getValue(f, ''ID_ORGEN''))) > -1',
'        });',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);',
'    } ',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buttonCollapse(''t_Button_rightControlButton'');',
'apenascargue();',
'',
'if($v(''P105_ID_CNVNIO'')){',
'    if ($v(''P105_INDCDOR_RQRE_CTA_INCIAL'')=== ''S''){',
'        apex.item(''cuotaInicial'').show();     ',
'    }else{',
'        apex.item(''cuotaInicial'').hide();',
'    }        ',
'} ',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200731082019'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189453007867563480)
,p_plug_name=>'Cartera'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(72235324874226079)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(129307929261102806)
,p_plug_name=>'Tipo Acuerdo'
,p_region_name=>'tipoAcuerdo'
,p_parent_plug_id=>wwv_flow_api.id(189453007867563480)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--xlarge:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189453107684563480)
,p_plug_name=>'<b>CARTERA</b>'
,p_region_name=>'deudas'
,p_parent_plug_id=>wwv_flow_api.id(189453007867563480)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select sum(nvl(a.vlor_sldo_cptal,0)) vlor_sldo_cptal',
'		, sum(nvl(a.vlor_intres,0)) vlor_intres',
'		, sum(nvl(a.vlor_sldo_cptal,0)) + sum(nvl(a.vlor_intres,0)) vlor_ttal',
'		, a.vgncia',
'		, a.prdo',
'		, a.id_orgen ',
'		, a.cdgo_mvmnto_orgn ',
'		, a.vgncia || a.prdo || a.cdgo_mvmnto_orgn || a.id_orgen as id',
'	 from v_gf_g_cartera_x_vigencia			a',
'	 left join gf_g_convenios_cartera 		b on a.vgncia = b.vgncia',
'	  and a.id_prdo							= b.id_prdo',
'	  and a.id_orgen						= b.id_orgen',
'	where a.id_sjto_impsto					= :P104_ID_SJTO_IMPSTO',
'	  and a.id_impsto						= :P104_ID_IMPSTO',
'	  and a.id_impsto_sbmpsto				= :P104_ID_IMPSTO_SBMPSTO',
'	  and a.cdgo_mvnt_fncro_estdo			= ''NO''',
'	  and a.vlor_sldo_cptal					> 0',
' group by a.vgncia',
'		, a.prdo',
'		, a.id_orgen',
'		, a.id_orgen',
'		, a.cdgo_mvmnto_orgn;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75165779104611703)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(120435960747398402)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(120956758850910102)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(188348027108612590)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(188348189731612591)
,p_name=>'Selector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189330926777789315)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189331034217789316)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189331197391789317)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(189331283059789318)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(189330812417789314)
,p_internal_uid=>189330812417789314
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
 p_id=>wwv_flow_api.id(189919533940279941)
,p_interactive_grid_id=>wwv_flow_api.id(189330812417789314)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(189919679660279942)
,p_report_id=>wwv_flow_api.id(189919533940279941)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75175218594731950)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(75165779104611703)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120441907360398825)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(120435960747398402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120962770987910309)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(120956758850910102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189920110270279944)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(189330926777789315)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189920707944279947)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(189331034217789316)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189921199062279949)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(189331197391789317)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189921629678279950)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(189331283059789318)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190269016089828876)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(188348027108612590)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(115421000032)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(188348027108612590)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(197344000038)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(189331197391789317)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(316882000038)
,p_view_id=>wwv_flow_api.id(189919679660279942)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(189331283059789318)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(198517307882650698)
,p_plug_name=>'<b>DATOS CUOTA INICIAL</b>'
,p_region_name=>'cuotaInicial'
,p_parent_plug_id=>wwv_flow_api.id(189453007867563480)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:t-Form--large:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P105_INDCDOR_RQRE_CTA_INCIAL'
,p_plug_display_when_cond2=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86148773228571217)
,p_plug_name=>'Documentos de Cuota Inicial'
,p_parent_plug_id=>wwv_flow_api.id(198517307882650698)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , n001 id_dcmnto',
'        , b.nmro_dcmnto',
'        , b.fcha_dcmnto',
'        , b.fcha_vncmnto',
'        , b.vlor_ttal_dcmnto',
'        , b.dscrpcion_indcdor_pgo_aplcdo',
'        , c.vlor        vlor_rcdo',
'        , to_char(c.fcha_rcdo, ''DD/MM/YYYY'')fcha_rcdo',
'        , case when d.nmro_pryccion is not null then',
unistr('                   ''S\00ED'''),
'                else',
'                    ''No''',
'          end as indcdor_tne_pryccion',
'        , d.nmro_pryccion',
'        , to_char(d.fcha_pryccion, ''DD/MM/YYYY HH:MI:SS PM'')fcha_pryccion',
'   from apex_collections       a',
'   join v_re_g_documentos      b on a.n001 = b.id_dcmnto',
'   join v_re_g_recaudos        c on b.id_dcmnto = c.id_orgen',
'   left join gf_g_proyecciones d on c.id_orgen = d.id_dcmnto_cta_incial',
'  where collection_name        = ''DOCUMENTO_CTA_INICIAL''',
'    and a.n002                 = :F_ID_INSTNCIA_FLJO',
' ',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select seq_id',
'   from apex_collections       a',
'   join v_re_g_documentos      b on a.n001 = b.id_dcmnto',
'    and a.n002                 = :F_ID_INSTNCIA_FLJO',
'  where collection_name        = ''DOCUMENTO_CTA_INICIAL'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70818930282843710)
,p_name=>'VLOR_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_RCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor  <br>Recaudado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(70819074302843711)
,p_name=>'FCHA_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha  <br>de Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(70819161917843712)
,p_name=>'INDCDOR_TNE_PRYCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_TNE_PRYCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFTiene  <br>Proyecci\00F3n?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(70819226109843713)
,p_name=>'NMRO_PRYCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRYCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Proyecci\00F3n')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(70819495505843715)
,p_name=>'FCHA_PRYCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRYCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha de  <br>Proyecci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>22
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
 p_id=>wwv_flow_api.id(86148888602571219)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(86149074334571220)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de  <br>Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(86149136932571221)
,p_name=>'VLOR_TTAL_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor del Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'center'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(86149223467571222)
,p_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFDocuemento <br> Pagado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(86149329958571223)
,p_name=>'NMRO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Docuemento')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(86149405858571224)
,p_name=>'FCHA_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DCMNTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha  <br>Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(86149806679571228)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(86149981039571229)
,p_name=>'Eliminar Documento'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=&APP_ID.:105:&SESSION.:ELIMINAR_DOCUMENTO:&DEBUG.:RP:P105_SEQ_ID,P105_NMRO_DCMNTO:&SEQ_ID.,&NMRO_DCMNTO.'
,p_link_text=>'<span aria-hidden="true" class="fa fa-trash" style="color: red;" ></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(86148883977571218)
,p_internal_uid=>86148883977571218
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_api.id(86740591732779649)
,p_interactive_grid_id=>wwv_flow_api.id(86148883977571218)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(86740713000779650)
,p_report_id=>wwv_flow_api.id(86740591732779649)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72609831866676763)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(70818930282843710)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72610314805676768)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(70819074302843711)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72610843593676770)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(70819161917843712)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72611331722676771)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(70819226109843713)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93.783
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72611828432676773)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(70819495505843715)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155.783
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86741191785779664)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(86148888602571219)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86741712429779675)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(86149074334571220)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86742236466779677)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(86149136932571221)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86742772564779679)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(86149223467571222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86743185056779681)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(86149329958571223)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86744447053782157)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(86149405858571224)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>152.25
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86758942079867344)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(86149806679571228)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86764177762878934)
,p_view_id=>wwv_flow_api.id(86740713000779650)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(86149981039571229)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>49.95
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190676106703877974)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'    <p align="justify">Funcionalidad de Solicitud de Acuerdo de Pago.<br> ',
'        <b> <center> Paso 2 Datos de Acuerdo de Pago</center> </b> <br>',
unistr('        <b>1.</b> Se debe ingresar el n\00FAmero del documento de la cuota inicial y validarlo haciendo clic en el bot\00F3n que esta a su derecha.<br><br>'),
unistr('        Si el documeto de cuota inicial ingresado se gener\00F3 desde una proyecci\00F3n de acuerdo de pago, al validar se carga la informaci\00F3n de la proyecci\00F3n.<br><br>'),
'        ',
unistr('        <b>2.</b> Debe seleccionar o confirmar la fecha de la primera cuota, el n\00FAmero de cuotas del acuerdo (respetando el n\00FAmero m\00E1ximo de cuotas) y seleccionar la periodicidad.<br> <br> '),
'        <b>Nota:</b> Se debe tener en cuenta la fecha limite de cuotas para diligenciar la fecha para presentar la solicitud y la fecha en la cual va a pagar la cuota inicial.</br> <br>',
unistr('        <b>3.</b> Selecionar la cartera que har\00E1 parte del acuerdo de pago.<br>   '),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72473823599776209)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(198517307882650698)
,p_button_name=>'BTN_VALIDAR_DOCUMENTO'
,p_button_static_id=>'BTN_VALIDAR_DOCUMENTO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Agregar Documento'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de agregar este documento?'',''BTN_VALIDAR_DOCUMENTO'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus-square'
,p_grid_column_attributes=>'style="margin-top:4px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>5
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72465193120776118)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(189453007867563480)
,p_button_name=>'CANCEL'
,p_button_static_id=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCEL'')'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72465589287776133)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(189453007867563480)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72465911950776134)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(189453007867563480)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72496864200776309)
,p_branch_name=>'Go To Page 106 - Plan de Pago'
,p_branch_action=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:RP:P106_BRANCH:105&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72465589287776133)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70820890326843729)
,p_branch_name=>'Ir Inicio - 301'
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,104,105,106,107,108,109::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72465193120776118)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72496085880776309)
,p_branch_name=>unistr('Ir a P\00E1gina de Inicio 301')
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,104,105,106,107,108::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72465193120776118)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72496431908776309)
,p_branch_name=>unistr('Ir a P\00E1gina 104- Informaci\00F3n B\00E1sica')
,p_branch_action=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72465911950776134)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72466347015776134)
,p_name=>'P105_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(189453007867563480)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72466706869776135)
,p_name=>'P105_BRANCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(189453007867563480)
,p_item_default=>'47'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72467405628776138)
,p_name=>'P105_ID_CNVNIO_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(129307929261102806)
,p_prompt=>'Tipo de Acuerdo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_select clob;    ',
'begin',
'    v_select := pkg_gf_convenios.fnc_cl_select_tipo_convenio (:F_CDGO_CLNTE, :P104_CDGO_SJTO_TPO, :P104_ID_SJTO_IMPSTO );',
'    return v_select;',
'end;',
''))
,p_lov_display_null=>'YES'
,p_colspan=>10
,p_grid_column=>1
,p_read_only_when=>':P105_ID_CNVNIO is not null '
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de acuerdo de pago con el que se realiza la solicitud.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72472774437776209)
,p_name=>'P105_NMRO_VGNCIA_SLCCNDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(189453107684563480)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72473149267776209)
,p_name=>'P105_VGNCIA_PRDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(189453107684563480)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72474210326776210)
,p_name=>'P105_NMRO_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_prompt=>unistr('N\00B0 Documento')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Dig\00EDte el n\00FAmero de acuerdo de pago')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72475101288776211)
,p_name=>'P105_ID_CNVNIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72475579884776211)
,p_name=>'P105_ID_PRYCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72475969680776211)
,p_name=>'P105_ID_DCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72476324305776211)
,p_name=>'P105_VLOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Valor de la Cuota Inicial'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72477279984776216)
,p_name=>'P105_FCHA_RCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Fecha de Recaudo de la Cuota Inicial.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72478169280776217)
,p_name=>'P105_INDCDOR_TNE_PRYCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Indica si existe proyecci\00F3n de acuerdo de pago.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72479089981776220)
,p_name=>'P105_NMRO_PRYCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('N\00FAmero de Proyecci\00F3n del acuerdo de pago.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72479942960776220)
,p_name=>'P105_FCHA_PRYCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Fecha de registro de la proyecci\00F3n.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72480809159776221)
,p_name=>'P105_VLOR_CTA_INCIAL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72481253350776221)
,p_name=>'P105_INDCDOR_RQRE_CTA_INCIAL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(198517307882650698)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72485747875776263)
,p_name=>'P105_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(86148773228571217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75045188886310003)
,p_name=>'P105_RNGO_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(189453107684563480)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72487036795776265)
,p_computation_sequence=>10
,p_computation_item=>'P105_INDCDOR_RQRE_CTA_INCIAL'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_exge_cta_incial',
'  from gf_d_convenios_tipo',
' where id_cnvnio_tpo = :P105_ID_CNVNIO_TPO'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72486657613776264)
,p_computation_sequence=>20
,p_computation_item=>'P105_VGNCIA_PRDO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg( json_object(key ''VGNCIA'' is a.vgncia,',
'                                  key ''PRDO'' is a.prdo,',
'                                  key ''ID_ORGEN'' is a.id_orgen,',
'                                  key ''CDGO_MVMNTO_ORGEN'' is a.cdgo_mvmnto_orgen)) json',
'  from (select vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'          from v_gf_g_proyecciones_cartera',
'         where id_pryccion= :P105_ID_PRYCCION',
'        group by vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'        )a;'))
,p_compute_when=>':P104_ID_CNVNIO is null and :P105_INDCDOR_TNE_PRYCCION = ''S'''
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72486269024776264)
,p_computation_sequence=>30
,p_computation_item=>'P105_VGNCIA_PRDO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg( json_object(key ''VGNCIA'' is a.vgncia,',
'                                  key ''PRDO'' is a.prdo,',
'                                  key ''ID_ORGEN'' is a.id_orgen,',
'                                  key ''CDGO_MVMNTO_ORGEN'' is a.cdgo_mvmnto_orgen)) json',
'  from (select vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'          from v_gf_g_convenios_cartera',
'         where id_cnvnio = :P104_ID_CNVNIO',
'        group by vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'        )a;'))
,p_compute_when=>'P105_VGNCIA_PRDO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72487436900776265)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P105_ID_INSTNCIA_FLJO'
,p_compute_when=>'P105_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(75045288913310004)
,p_computation_sequence=>20
,p_computation_item=>'P105_RNGO_VGNCIA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select rngo_vgncia',
'     from gf_d_convenios_tipo',
'    where id_cnvnio_tpo        = :P105_ID_CNVNIO_TPO'))
,p_compute_when=>'P105_ID_CNVNIO_TPO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72489702894776282)
,p_validation_name=>'Documento Nulo'
,p_validation_sequence=>10
,p_validation=>'P105_NMRO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Ingrese un N\00B0 Documento')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio_tpo ',
'   from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P105_ID_CNVNIO_TPO ',
'    and indcdor_exge_cta_incial = ''S''',
'    and (select count (n001) ',
'           from apex_collections ',
'           where collection_name        = ''DOCUMENTO_CTA_INICIAL''',
'             and n002                 = :F_ID_INSTNCIA_FLJO) = 0'))
,p_validation_condition_type=>'EXISTS'
,p_when_button_pressed=>wwv_flow_api.id(72465589287776133)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72488922794776281)
,p_validation_name=>unistr('\00BFDocumento Existe?')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_dcmnto number;',
'    ',
'begin  ',
'    :P105_VLOR      := null;',
'    :P105_FCHA_RCDO := null;',
'    :P105_ID_DCMNTO := null;',
'',
'    begin ',
'        select id_dcmnto ',
'          into :P105_ID_DCMNTO',
'          from re_g_documentos',
'         where cdgo_clnte =          :F_CDGO_CLNTE',
'           and id_impsto =           :P104_ID_IMPSTO',
'           and id_impsto_sbmpsto =   :P104_ID_IMPSTO_SBMPSTO',
'           and id_sjto_impsto =      :P104_ID_SJTO_IMPSTO',
'           and nmro_dcmnto =         :P105_NMRO_DCMNTO;',
'           return true;',
'    exception ',
'        when no_data_found then ',
'            :P105_ID_DCMNTO    := null;',
'            :P105_VLOR         := null;',
'            :P105_FCHA_RCDO    := null;',
'            return false;',
'    end;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El Documento ingresado no existe o no pertenece al Sujeto '
,p_always_execute=>'Y'
,p_validation_condition=>'P105_NMRO_DCMNTO,BTN_VALIDAR_DOCUMENTO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(72474210326776210)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72489346970776282)
,p_validation_name=>unistr('\00BFDocumento Pagado?')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_dcmnto number;',
'    v_id_rcdo    number;',
'    ',
'begin',
'    :P105_VLOR := '''';',
'    :P105_FCHA_RCDO := '''';',
'    if :P105_INDCDOR_RQRE_CTA_INCIAL = ''S'' then ',
'        begin ',
'            select id_dcmnto ',
'              into v_id_dcmnto',
'              from re_g_documentos',
'             where cdgo_clnte = :F_CDGO_CLNTE',
'               and nmro_dcmnto = :P105_NMRO_DCMNTO;',
'        exception ',
'            when no_data_found then ',
'                    v_id_rcdo       := null;',
'                    :P105_VLOR       := null;',
'                    :P105_FCHA_RCDO  := null;',
'                return false;',
'        end;',
'',
'        if v_id_dcmnto > 0 then ',
'',
'            begin ',
'                select id_rcdo,',
'                       vlor vlor_cta_incial, ',
'                       to_char(vlor,:F_FRMTO_MNDA), ',
'                       to_char(fcha_rcdo,''DD/MM/YYYY'')',
'                  into v_id_rcdo,',
'                       :P105_VLOR_CTA_INCIAL, ',
'                       :P105_VLOR, ',
'                       :P105_FCHA_RCDO',
'                  from v_re_g_recaudos  ',
'                 where nmro_dcmnto = :P105_NMRO_DCMNTO',
'                   and rownum = 1',
'                   and cdgo_rcdo_estdo = ''AP'';',
'',
'                 begin ',
'                       select ''S'', ',
'                              a.nmro_pryccion, ',
'                              a.fcha_pryccion, ',
'                              a.id_cnvnio_tpo',
'                        into :P105_INDCDOR_TNE_PRYCCION, ',
'                             :P105_NMRO_PRYCCION, ',
'                             :P105_FCHA_PRYCCION, ',
'                             :P105_ID_CNVNIO_TPO',
'                         from v_gf_g_proyecciones    a ',
'                        where a.id_pryccion          = (select max(id_pryccion) ',
'                                                          from v_gf_g_proyecciones ',
'                                                         where nmro_dcmnto = :P105_NMRO_DCMNTO)',
'                          and a.id_cnvnio_tpo       in (select id_cnvnio_tpo',
'                                                          from gf_d_convenios_tipo m',
'                                                         where a.id_cnvnio_tpo = m.id_cnvnio_tpo',
'                                                           and m.actvo = ''S''',
'                                                           and trunc(fcha_lmte_elbrcion) >= sysdate',
'                                                       );           ',
'                   exception ',
'                        when no_data_found then ',
'                            :P105_INDCDOR_TNE_PRYCCION := ''N'';',
'                            :P105_NMRO_PRYCCION := null;',
'                            :P105_FCHA_PRYCCION := null;',
'                   end;',
'',
'            exception ',
'                when no_data_found then ',
'                     v_id_rcdo       := null;',
'                    :P105_VLOR       := null;',
'                    :P105_FCHA_RCDO  := null;',
'                    :P105_FCHA_PRYCCION := null;',
'                    return false;',
'            end;',
'',
'             if v_id_rcdo > 0 then ',
'                 return true;',
'             else',
'                 return false;',
'             end if;',
'        else',
'            return false;',
'        end if;   ',
' else',
'     return true;',
' end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El Documento ingresado No ha sido pagado'
,p_always_execute=>'Y'
,p_validation_condition=>'BTN_VALIDAR_DOCUMENTO,P105_NMRO_DCMNTO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(72474210326776210)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72488542538776278)
,p_validation_name=>unistr('Selecci\00F3n una o mas Vigencias-Periodo')
,p_validation_sequence=>50
,p_validation=>'P105_VGNCIA_PRDO'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>unistr('Debe seleccionar una o m\00E1s Vigencias para poder continuar')
,p_when_button_pressed=>wwv_flow_api.id(72465589287776133)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72490144200776282)
,p_validation_name=>'Datos de Documento de Cuota Inicial No Nulos'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'   from apex_collections       a',
'  where collection_name        = ''DOCUMENTO_CTA_INICIAL''',
'    and a.n002                 = :F_ID_INSTNCIA_FLJO'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Debe ingresar y validar un documento de cuota inicial'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_cnvnio_tpo ',
'   from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P105_ID_CNVNIO_TPO ',
'    and indcdor_exge_cta_incial = ''S'''))
,p_validation_condition_type=>'EXISTS'
,p_when_button_pressed=>wwv_flow_api.id(72465589287776133)
,p_associated_item=>wwv_flow_api.id(72474210326776210)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72490597136776282)
,p_validation_name=>'Solicitudes Anteriores'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_count             number;',
'    v_id_cnvnio         number;',
'    ',
'begin',
'    v_count         := 0;',
'    ',
'    for c_vgncia_prdio in (select  vgncia',
'                                ,   prdo',
'                                ,   id_orgen',
'                                ,   cdgo_mvmnto_orgn ',
'                              from  json_table(:P105_VGNCIA_PRDO, ''$[*]'' ',
'                                                    columns (vgncia path ''$.VGNCIA''',
'                                                         ,   prdo   path ''$.PRDO''',
'                                                         ,   cdgo_mvmnto_orgn path ''$.CDGO_MVMNTO_ORGN''',
'                                                         ,   id_orgen    path ''$.ID_ORGEN''))',
'                          group by vgncia',
'                                ,   prdo',
'                                ,   id_orgen',
'                                ,   cdgo_mvmnto_orgn ',
'                          ) loop',
'                            ',
'        begin ',
'            select  a.id_cnvnio',
'               into v_id_cnvnio',
'               from v_gf_g_convenios a',
'               join v_gf_g_convenios_cartera    b on a.id_cnvnio = b.id_cnvnio',
'              where a.id_sjto_impsto            = :P104_ID_SJTO_IMPSTO',
'                and a.cdgo_cnvnio_estdo         in (''SLC'', ''APB'', ''APL'')',
'                and a.id_cnvnio                 != :P104_ID_CNVNIO',
'                and b.vgncia                    = c_vgncia_prdio.vgncia',
'                and b.prdo                      = c_vgncia_prdio.prdo',
'                and b.id_orgen                  = c_vgncia_prdio.id_orgen',
'                and b.cdgo_mvmnto_orgen         = c_vgncia_prdio.cdgo_mvmnto_orgn',
'           order by id_cnvnio',
'                  , vgncia',
'                  , id_prdo; ',
'                ',
'                v_count := v_count + 1;',
'                ',
'        exception',
'            when no_data_found then',
'               null; ',
'            when others then',
'               null;',
'        end;',
'    end loop;',
'    ',
'    if v_count > 0 then ',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'No puede seguir con el proceso de la solicitud de acuerdo de pago debido a que en estos momentos tiene una solidtud en curso'
,p_always_execute=>'Y'
,p_validation_condition=>'P105_VGNCIA_PRDO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(72465589287776133)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72488213332776278)
,p_validation_name=>'Valida Activo'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from gf_d_convenios_tipo',
'  where id_cnvnio_tpo = :P105_ID_CNVNIO_TPO',
'    and actvo = ''S'''))
,p_validation_type=>'EXISTS'
,p_error_message=>'Tipo de Acuerdo de Pago Inactivo'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(72465589287776133)
,p_associated_item=>wwv_flow_api.id(72467405628776138)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72487898608776271)
,p_validation_name=>'Documento No Repetido en la Coleccion'
,p_validation_sequence=>140
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select n001 id_dcmnto',
'   from apex_collections    a',
'   join re_g_documentos     b on a.n001 = b.id_dcmnto',
'  where collection_name = ''DOCUMENTO_CTA_INICIAL''',
'    and b.cdgo_clnte    = :F_CDGO_CLNTE',
'    and b.nmro_dcmnto   = :P105_NMRO_DCMNTO',
'    and a.n002          = :F_ID_INSTNCIA_FLJO'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El Documento Ingresado ya se encuentra registrado'
,p_when_button_pressed=>wwv_flow_api.id(72473823599776209)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72493244292776295)
,p_name=>'Al seleccionar las vigencias'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(189453107684563480)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72493753023776306)
,p_event_id=>wwv_flow_api.id(72493244292776295)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.data.selectedRecords.length > 0) {',
'',
'    var model = this.data.model;',
'    var records = this.data.selectedRecords; ',
'    var ids="";',
'    ',
'    var json = records.map(function (record){',
'        ids += model.getValue( record, ''ID'' ) + '':'';',
'        return {''VGNCIA'':  parseFloat(model.getValue(record, ''VGNCIA'')),',
'                ''PRDO'':  parseFloat(model.getValue(record, ''PRDO'')),',
'                ''CDGO_MVMNTO_ORGN'':  model.getValue(record, ''CDGO_MVMNTO_ORGN''),',
'                ''ID_ORGEN'':  model.getValue(record, ''ID_ORGEN'')',
'               };',
'    });         ',
'    //$s(''P105_VGNCIA_PRDO'', JSON.stringify(json));',
'    $s(''P105_VGNCIA_PRDO'', ids);',
'    ',
'}else{',
'    $s(''P105_VGNCIA_PRDO'', null);',
'}',
'',
'',
'if($v(''P105_RNGO_VGNCIA'') == ''T'' ){',
'      apex.region("deudas").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");    ',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72494197936776308)
,p_name=>unistr('Actualizar Pag\00EDna')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P105_ID_CNVNIO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72494600129776308)
,p_event_id=>wwv_flow_api.id(72494197936776308)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72495034621776308)
,p_name=>'Al Ingresar Documento'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P105_NMRO_DCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72495598330776308)
,p_event_id=>wwv_flow_api.id(72495034621776308)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P105_NMRO_DCMNTO'')){',
'    apex.item(''BTN_VALIDAR_DOCUMENTO'').show();',
'}else{',
'    apex.item(''BTN_VALIDAR_DOCUMENTO'').hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72492837969776294)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n del Documento de Cuota Inicial y Proyecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.id_orgen,',
'            to_char(a.vlor,:F_FRMTO_MNDA)vlor_rcdo,',
'            to_char(a.fcha_rcdo,''DD/MM/YYYY'')fcha_rcdo,',
'            case when b.nmro_pryccion is not null then',
'                   ''S''',
'                else',
'                    ''N''',
'            end as indcdor_tne_pryccion,',
'            b.id_pryccion,',
'            b.nmro_pryccion,',
'            trunc(b.fcha_pryccion),',
'            --b.id_cnvnio_tpo,',
'            a.vlor',
'       into :P105_ID_DCMNTO,',
'            :P105_VLOR,',
'            :P105_FCHA_RCDO,',
'            :P105_INDCDOR_TNE_PRYCCION,',
'            :P105_ID_PRYCCION,',
'            :P105_NMRO_PRYCCION,',
'            :P105_FCHA_PRYCCION,',
'            --:P105_ID_CNVNIO_TPO,',
'            :P105_VLOR_CTA_INCIAL',
'       from v_re_g_recaudos        a',
'       left join gf_g_proyecciones b on a.id_orgen = b.id_dcmnto_cta_incial',
'      where a.nmro_dcmnto = :P105_NMRO_DCMNTO ',
'        and rownum = 1',
'        and a.cdgo_rcdo_estdo = ''AP'';',
''))
,p_process_error_message=>'No se puede agregar el Documento, porque no se ecuentra pagado, o  no corresponde al Sujeto'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72473823599776209)
,p_process_when=>'P105_NMRO_DCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72491294742776287)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Guardar Documento en Colecci\00F3n de Documentos de Cuotas Iniciales')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_collection.add_member( p_collection_name => ''DOCUMENTO_CTA_INICIAL'',',
'                                p_n001            => :P105_ID_DCMNTO,',
'                                p_n002            => :F_ID_INSTNCIA_FLJO); ',
'    :P105_NMRO_DCMNTO:= '''';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72473823599776209)
,p_process_success_message=>'Se registro el Documento Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72492451779776289)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n de datos del convenio')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_cnvnio,',
'            a.id_cnvnio_tpo,',
'            a.id_dcmnto_cta_incial,',
'            b.nmro_dcmnto,',
'            b.vlor,',
'            to_char(vlor, :F_FRMTO_MNDA),',
'            to_char(fcha_rcdo,''DD/MM/YYYY''),',
'            c.id_pryccion,',
'            c.nmro_pryccion,',
'            trunc(c.fcha_pryccion),',
'            a.id_sjto_impsto,',
'            a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            a.cdgo_sjto_tpo,',
'            case when c.nmro_pryccion is not null then',
'                    ''S''',
'                 else',
'                    ''N''',
'            end as indcdor_tne_pryccion,',
'            id_slctud',
'      into :P105_ID_CNVNIO,',
'           :P105_ID_CNVNIO_TPO,',
'           :P105_ID_DCMNTO,',
'           :P105_NMRO_DCMNTO,',
'           :P105_VLOR_CTA_INCIAL,',
'           :P105_VLOR,',
'           :P105_FCHA_RCDO,',
'           :P105_ID_PRYCCION,',
'           :P105_NMRO_PRYCCION,',
'           :P105_FCHA_PRYCCION,       ',
'           :P104_ID_SJTO_IMPSTO,',
'           :P104_ID_IMPSTO,',
'           :P104_ID_IMPSTO_SBMPSTO,',
'           :P104_CDGO_SJTO_TPO,',
'           :P105_INDCDOR_TNE_PRYCCION,',
'           :P104_ID_SLCTUD',
'      from v_gf_g_convenios        a',
'      left join v_re_g_recaudos    b on a.id_dcmnto_cta_incial = b.id_orgen and cdgo_rcdo_estdo = ''AP''',
'      left join gf_g_proyecciones  c on a.id_dcmnto_cta_incial = c.id_dcmnto_cta_incial',
'     where a.id_instncia_fljo_hjo  = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_gf_g_convenios   a',
'  left join v_re_g_recaudos    b on a.id_dcmnto_cta_incial = b.id_orgen and cdgo_rcdo_estdo = ''AP''',
' where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;'))
,p_process_when_type=>'EXISTS'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72490839798776283)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Collecci\00F3n de  Documentos de Cuota Inicial')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'begin',
'     if not apex_collection.collection_exists(''DOCUMENTO_CTA_INICIAL'') then',
'        apex_Collection.Create_Collection( p_collection_name => ''DOCUMENTO_CTA_INICIAL'');',
'    ',
'    end if;   ',
'    for c_dcmnto_cta_inicial in (select id_dcmnto ',
'                         from gf_g_cnvnios_cta_incl_vgnc a',
'                        where id_cnvnio = :P105_ID_CNVNIO',
'                         and a.id_dcmnto not in (select m.n001 from apex_collections m where m.collection_name = ''DOCUMENTO_CTA_INICIAL'')) loop',
'        apex_collection.add_member( p_collection_name  => ''DOCUMENTO_CTA_INICIAL'',',
'                                     p_n001            => c_dcmnto_cta_inicial.id_dcmnto,',
'                                     p_n002            => :P105_ID_CNVNIO);     ',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72491634547776288)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar miembro de Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''DOCUMENTO_CTA_INICIAL'',',
'        p_seq => :P105_SEQ_ID);',
'    ',
'exception ',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_DOCUMENTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
