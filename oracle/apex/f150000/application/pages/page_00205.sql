prompt --application/pages/page_00205
begin
wwv_flow_api.create_page(
 p_id=>205
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Informe de Liquidaciones de Rentas'
,p_step_title=>'Informe de Liquidaciones de Rentas'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    ocultarAyudaD();',
'    apex.item( "informacion_basica" ).hide();',
'    apex.item( "liquidaciones" ).hide();',
'    ',
'});',
'',
'',
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    if($v(''P205_RSPSTA'') == ''0'' ){',
'        apex.item( "informacion_basica" ).hide();',
'        apex.item( "liquidaciones" ).hide();',
'   }',
'    if($v(''P205_RSPSTA'') == ''1'' ){',
'        apex.item( "informacion_basica" ).show();',
'        apex.item( "liquidaciones" ).show();',
'   }',
'    ',
'});',
'',
'/*',
'if( apex.region("region_conceptos") )',
'    apex.region("region_conceptos").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");*/'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(252165693921651362)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251201104818'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15446343612498200)
,p_plug_name=>'Liquidaciones'
,p_region_name=>'liquidaciones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_rnta',
'        , a.id_impsto',
'        , a.id_impsto_sbmpsto',
'        , a.id_dcmnto',
'        , trunc(b.fcha_vncmnto) as fcha_vncmnto',
'        , a.id_sjto_impsto',
'		, a.fcha_rgstro',
'        , a.nmro_dcmnto',
'		, a.txto_ascda',
'		, a.nmbre_impsto_sbmpsto',
'		, a.dscrpcion_ascda',
'		, ''<span class="fa fa-eye"></span>''  ver',
'		, a.id_lqdcion',
'		, (select case ',
'                    when upper(m.txto_bse_grvble ) = ''BASE GRAVABLE'' then ',
'                        to_char(vlor_bse_grvble, :F_FRMTO_MNDA) ',
'                    else  ',
'                        vlor_bse_grvble || '' '' ||upper(m.txto_bse_grvble ) ',
'                    end as txto_bse',
'                   from df_i_impuestos_acto m ',
'                   join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'                  where n.id_rnta           = a.id_rnta',
'                    and rownum = 1',
'			) txto_bse',
'        , a.dscrpcion_rnta_estdo',
'        , a.dscrpcion_entrno',
'        , a.dscrpcion_indcdor_exncion',
'        , a.dscrpcion_indcdor_rnta_pgda',
'         , case ',
'            when a.indcdor_rnta_pgda = ''N'' and trunc(b.fcha_vncmnto) >= trunc(sysdate) and cdgo_rnta_estdo != ''ANL'' and pkg_gn_generalidades.fnc_vl_pago_pse(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_impsto => a.id_impsto, p_cdgo_impsto_sbmpsto => a.id_im'
||'psto_sbmpsto) = ''S'' then',
'                ''<a href="f?p=''||:APP_ID||'':23:''||:APP_SESSION||''::NO:RP,23:P23_CDGO_CLNTE,P23_FCHA,P23_CDGO_ORGN_TPO,P23_ID_IMPSTO,P23_ID_IMPSTO_SBMPSTO,P23_CDGO_RCBO_TPO,P23_ID_ORGEN:''||:F_CDGO_CLNTE||'',''||trunc(b.fcha_vncmnto)||'',''||''DC''||'',''||a.i'
||'d_impsto||'',''||a.id_impsto_sbmpsto||'',''||''DNO,''||a.id_dcmnto||''" title="Pago PSE" class="t-Button t-Button--icon t-Button--iconRight lto5482178785609347_0 t-Button--hot"><span class="t-Button-label">Pago PSE</span><span aria-hidden="true" class="t-Ic'
||'on t-Icon--right fa fa-credit-card"></span></a>''',
'            else',
'                null',
'          end as PSE,',
'        b.vlor_ttal_dcmnto',
'	 from v_gi_g_rentas		    a',
'     left join re_g_documentos  b on b.nmro_dcmnto = a.nmro_dcmnto --b.id_dcmnto = a.id_dcmnto',
'	where a.cdgo_clnte		    = :F_CDGO_CLNTE',
'	  and a.id_impsto		    = :P205_ID_IMPSTO',
'	  and a.idntfccion_sjto     = :P205_PRMTRO',
'      and a.nmro_dcmnto           = :P205_NMRO_RNTA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3751828867474350)
,p_name=>'NMRO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Documento')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(4254763307589325)
,p_name=>'DSCRPCION_INDCDOR_RNTA_PGDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_RNTA_PGDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFLiquidaci\00F3n <br>Pagada?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(7179536903286302)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7179640044286303)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7179798081286304)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7179895518286305)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha <br>Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_format_mask=>'DD/MM/YYYY'
,p_item_width=>30
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7179935174286306)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7181506377286322)
,p_name=>'PSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PSE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pago PSE'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PSE.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10610178817179678)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
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
 p_id=>wwv_flow_api.id(10610258165179679)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
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
 p_id=>wwv_flow_api.id(10610384477179680)
,p_name=>'TXTO_ASCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_ASCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Soporte <br>Asociada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(10610492294179681)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(10610566187179682)
,p_name=>'DSCRPCION_ASCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ASCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Asociada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(10734851140506936)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&VER.'
,p_link_target=>'f?p=&APP_ID.:206:&SESSION.::&DEBUG.:RP,206:P206_ID_RNTA:&ID_RNTA.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10735159545506939)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
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
 p_id=>wwv_flow_api.id(10735303903506940)
,p_name=>'TXTO_BSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_BSE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Base de Renta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10735351280506941)
,p_name=>'DSCRPCION_RNTA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RNTA_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(10735463230506942)
,p_name=>'DSCRPCION_ENTRNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ENTRNO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFLiquidada en <br> Entorno?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>7
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
 p_id=>wwv_flow_api.id(80928419315670816)
,p_name=>'DSCRPCION_INDCDOR_EXNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_EXNCION'
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
 p_id=>wwv_flow_api.id(85165835874979624)
,p_name=>'VLOR_TTAL_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10610047886179677)
,p_internal_uid=>10610047886179677
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(10740618877507118)
,p_interactive_grid_id=>wwv_flow_api.id(10610047886179677)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10740769827507119)
,p_report_id=>wwv_flow_api.id(10740618877507118)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22075213389037)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(4254763307589325)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7192887160385929)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(7179536903286302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7193451860385931)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(7179640044286303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7196421158400893)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(7179798081286304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7197084672400894)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(7179895518286305)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7199377575412449)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(7179935174286306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7584655239642435)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(7181506377286322)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10741162524507124)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10610178817179678)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10741692944507128)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(10610258165179679)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
,p_sort_order=>2
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10742126284507130)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(10610384477179680)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10742685386507132)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10610492294179681)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>187
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10743193500507133)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(10610566187179682)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>185
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10745182469507139)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10734851140506936)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>63
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10746693305507145)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(10735159545506939)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10747125091507147)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(10735303903506940)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10747648601507149)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(10735351280506941)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10748209817507150)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(10735463230506942)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(79932121865548182)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(3751828867474350)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81238192737189960)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(80928419315670816)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126000606761244872)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(85165835874979624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(43354000000)
,p_view_id=>wwv_flow_api.id(10740769827507119)
,p_execution_seq=>2.5
,p_name=>'PAGADA'
,p_background_color=>'#99FF99'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(4254763307589325)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15604245687931274)
,p_plug_name=>'Definiciones de Rentas'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(356664535335848740)
,p_plug_name=>'Sujeto Tributo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84684250925653867)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(356664535335848740)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89961639259975926)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(356664535335848740)
,p_button_name=>'btn_hstrial_pgos'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Historial de Pagos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP:P33_ID_SJTO_IMPSTO:&P205_ID_SJTO_IMPSTO.'
,p_button_condition=>'P205_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5482178785609347)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(356664535335848740)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5481754469609347)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(356664535335848740)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,205,206::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4032907641646108)
,p_name=>'P205_MSG_LIQUIDACION_VENCIDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15446343612498200)
,p_prompt=>unistr('<b><p style="color:blue">Si no esta disponible el Bot\00F3n PSE  su liquidaci\00F3n  N\00B0 &P205_NMRO_RNTA. se encuentra vencida y debe actualizarla haciendo clic en el visor que se encuentra en la columna VER.</b> ')
,p_display_as=>'NATIVE_PCT_GRAPH'
,p_colspan=>8
,p_grid_column=>3
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5482541969609348)
,p_name=>'P205_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(356664535335848740)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>'Seleccione el tributo asociado al acuerdo de pago.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5483448254609348)
,p_name=>'P205_CDGO_SJTO_TPO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(356664535335848740)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5483838697609348)
,p_name=>'P205_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(356664535335848740)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5484298202609349)
,p_name=>'P205_PRMTRO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(356664535335848740)
,p_prompt=>'Nit/CC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realizar\00E1 la liquidaci\00F3n de la renta.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5485108178609349)
,p_name=>'P205_RSPSTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(356664535335848740)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5485597829609349)
,p_name=>'P205_VGNCIA_ACTUAL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(356664535335848740)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte 				  => :F_CDGO_CLNTE, ',
'                                                       p_cdgo_dfncion_clnte_ctgria    => ''GFN'', ',
'                                                       p_cdgo_dfncion_clnte		      => ''VAC'') vngcia',
'from dual;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5485953795609349)
,p_name=>'P205_ID_PRDO_ACTUAL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(356664535335848740)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte 				  => :F_CDGO_CLNTE, ',
'                                                       p_cdgo_dfncion_clnte_ctgria    => ''GFN'', ',
'                                                       p_cdgo_dfncion_clnte 		  => ''PAC'') a',
'  from dual;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5486642812609350)
,p_name=>'P205_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84684250925653867)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5487087961609350)
,p_name=>'P205_NMBRE_RZON_SCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84684250925653867)
,p_prompt=>'Nombre / Razon Social'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5487472284609350)
,p_name=>'P205_UBCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84684250925653867)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5487820589609351)
,p_name=>'P205_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84684250925653867)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5488218371609351)
,p_name=>'P205_CDGO_SJTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84684250925653867)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5488922220609351)
,p_name=>'P205_LBEL_ITEM_FCHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15604245687931274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5489320584609352)
,p_name=>'P205_INDCDOR_USA_EXTRNJRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(15604245687931274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5489793506609352)
,p_name=>'P205_INDCDOR_USA_MXTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(15604245687931274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7336910903382301)
,p_name=>'P205_NMRO_RNTA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(356664535335848740)
,p_prompt=>'No. Documento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(109511864045345101)
,p_computation_sequence=>10
,p_computation_item=>'P205_ID_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 230013',
'from dual;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5490245472609352)
,p_computation_sequence=>20
,p_computation_item=>'P205_CDGO_SJTO_TPO_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_sjto_tpo',
'  from df_c_impuestos    a',
' where a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.id_impsto       = :P205_ID_IMPSTO'))
,p_compute_when=>'P205_ID_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7337017698382302)
,p_validation_name=>'Numero de liquidacion no sea nula'
,p_validation_sequence=>10
,p_validation=>'P205_NMRO_RNTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El n\00FAmero de la liquidaci\00F3n no puede ser nula, por favor ingreselo.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(5482178785609347)
,p_associated_item=>wwv_flow_api.id(7336910903382301)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5492100541609353)
,p_name=>unistr('Al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5482178785609347)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5492659473609354)
,p_event_id=>wwv_flow_api.id(5492100541609353)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_ctdad_acrdos          number    := 0;',
'    v_id_cnvnio             number;',
'    v_tpo_bsqda             varchar2(3);',
'    ',
'begin',
'    begin ',
'        select a.id_sjto_impsto',
'          into v_id_sjto_impsto',
'          from v_si_i_sujetos_impuesto    a',
'          join si_i_personas              b on a.id_sjto_impsto    = b.id_sjto_impsto',
'         where cdgo_clnte                 = :F_CDGO_CLNTE',
'           and id_impsto                  = :P205_ID_IMPSTO',
'           and a.idntfccion_sjto          = :P205_PRMTRO;',
'        ',
'        apex_util.set_session_state(''P205_RSPSTA'', ''1'');',
'        apex_util.set_session_state(''P205_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'',
'    exception',
'        when no_data_found then ',
'        :P205_RSPSTA                := ''0'';',
'        :P205_ID_SJTO_IMPSTO        := null;',
'        apex_util.set_session_state(''P205_RSPSTA'', ''0'');',
'        apex_util.set_session_state(''P205_ID_SJTO_IMPSTO'', null);',
'',
'        when others then ',
'            apex_util.set_session_state(''P205_RSPSTA'', ''0'');',
'            apex_util.set_session_state(''P205_ID_SJTO_IMPSTO'', null);',
'    end;',
'end;'))
,p_attribute_02=>'P205_PRMTRO'
,p_attribute_03=>'P205_ID_SJTO_IMPSTO,P205_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5493109512609354)
,p_event_id=>wwv_flow_api.id(5492100541609353)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P205_RSPSTA'') == ''1'' ){',
'    // Si existe el sujeto impuesto',
'    apex.submit();',
'}',
'else if  ($v(''P205_RSPSTA'') == ''0'' ){',
'    // No existe el sujeto impuesto',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >RENTAS VARIAS</H2>'',',
'        html: ''<H4>El Sujeto Impuesto ingresado NO existe.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "informacion_basica" ).hide();',
'    //apex.item( "tab_selector_convenio" ).hide();',
'}',
'',
'else if  ($v(''P205_RSPSTA'') == ''2'' ){    ',
'    // Exite el Sujeto Impuesto pero no tiene acuerdo de pagos aplicados',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >>RENTAS VARIAS</H2>'',',
'        html: ''<H4>El Sujeto Impuesto Consultado no tiene Acuerdos de Pagos Aplicados.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "informacion_basica" ).hide();',
'    //apex.item( "tab_selector_convenio" ).hide(); ',
'}',
'else if  ($v(''P205_RSPSTA'') == ''3'' ){    ',
'    // El Acuerdo de Pago consultado no Existe',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >>RENTAS VARIAS</H2>'',',
'        html: ''<H4>El Acuerdo de Pago consultado no Existe.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "informacion_basica" ).hide();',
'    //apex.item( "tab_selector_convenio" ).hide(); ',
'}',
'',
';',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5493585921609354)
,p_name=>unistr('Refrescar P\00E1gina ')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P205_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5494532033609355)
,p_event_id=>wwv_flow_api.id(5493585921609354)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P205_ID_IMPSTO_ACTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5494088131609354)
,p_event_id=>wwv_flow_api.id(5493585921609354)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5494949119609355)
,p_name=>'New'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P205_ID_IMPSTO_ACTO_CNCPTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5495475909609355)
,p_event_id=>wwv_flow_api.id(5494949119609355)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P205_ID_IMPSTO_ACTO_CNCPTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4254863422589326)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Job Rentas Pagadas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    DBMS_SCHEDULER.RUN_JOB(job_name => ''"GENESYS"."IT_GI_RENTAS_PAGADAS"'', USE_CURRENT_SESSION => FALSE);',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from dba_scheduler_running_jobs',
'where job_name = ''IT_GI_RENTAS_PAGADAS'';'))
,p_process_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5491735775609353)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Definiciones de Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.indcdor_usa_extrnjro',
'         , a.indcdor_usa_mxto',
unistr('         , initcap(nvl(a.lbel_fcha_expdcion, ''Expedici\00F3n''))'),
'      into :P205_INDCDOR_USA_EXTRNJRO',
'         , :P205_INDCDOR_USA_MXTO',
'         , :P205_LBEL_ITEM_FCHA',
'      from gi_d_rentas_configuracion    a',
'     where a.cdgo_clnte                = :F_CDGO_CLNTE;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5491390361609353)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select a.idntfccion_sjto_frmtda',
'        , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'        , a.drccion',
'        , a.cdgo_sjto_tpo',
'        , nmbre_rzon_scial',
'     into :P205_IDNTFCCION_SJTO_FRMTDA',
'        , :P205_UBCCION',
'        , :P205_DRCCION',
'        , :P205_CDGO_SJTO_TPO  ',
'        , :P205_NMBRE_RZON_SCIAL    ',
'     from V_SI_I_SUJETOS_IMPUESTO    a',
'     join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'    where a.id_sjto_impsto           = :P205_ID_SJTO_IMPSTO;',
'',
'exception',
'    when others then',
'        :P205_IDNTFCCION_SJTO_FRMTDA       := null;',
'        :P205_IDNTFCCION_ANTRIOR_FRMTDA    := null;',
'        :P205_UBCCION                      := null;',
'        :P205_DRCCION                      := null;',
'        :P205_CDGO_SJTO_TPO                := null;',
'        :P205_MTRCLA_INMBLRIA              := null;',
'        :P205_ID_SJTO_IMPSTO               := null;',
'end;'))
,p_process_error_message=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5490511937609352)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select a.id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto    a',
'      join si_i_predios               b on a.id_sjto_impsto    = b.id_sjto_impsto',
'     where cdgo_clnte                 = :F_CDGO_CLNTE',
'       and id_impsto                  = :P205_ID_IMPSTO',
'       and (',
'               (:P205_TPO_BSQDA       = ''REF'' and a.idntfccion_sjto     = :P205_PRMTRO) or',
'               (:P205_TPO_BSQDA       = ''RAN'' and a.idntfccion_antrior  = :P205_PRMTRO) or',
'               (:P205_TPO_BSQDA       = ''DIR'' and a.drccion             = :P205_PRMTRO) or',
'               (:P205_TPO_BSQDA       = ''MTR'' and b.mtrcla_inmblria     = :P205_PRMTRO)',
'            );',
'    ',
'    :P205_RSPSTA := ''1'';',
'    :P205_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P205_ID_SJTO_IMPSTO := null;',
'     :P205_RSPSTA := ''0'';',
'     --:P205_RSPSTA := '' No Existe el Sujeto Impuesto'' ;',
'end;'))
,p_process_error_message=>'&P205_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5482178785609347)
,p_process_success_message=>'&P205_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5490925922609353)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P205_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P205_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5482178785609347)
,p_process_when=>':P205_ID_SJTO_IMPSTO IS NULL or :P205_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P205_RSPSTA.'
);
end;
/
