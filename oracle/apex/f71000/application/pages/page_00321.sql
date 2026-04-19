prompt --application/pages/page_00321
begin
wwv_flow_api.create_page(
 p_id=>321
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Emisi\00F3n de Recibos Puntual - Fecha Anterior - ')
,p_step_title=>unistr('Emisi\00F3n de Recibos Puntual - Fecha Anterior - ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function calculaTotal() {',
'        ',
'        var i, records, record, sal, model,',
'            v_vlor_ttal = 0,',
'            total = 0,',
'            vgncia_prdo = '' {"VGNCIA_PRDO":['',',
'            view = apex.region("deuda").widget().interactiveGrid("getCurrentView");',
'            model = view.model;',
'            records = view.getSelectedRecords();',
'            ',
'            //Realizamos un filtro de todos los datos seleccionados del interactive grid que esten en estado Normal',
'            records = records.filter(function (record) {',
'                return ( [''NO'', ''CN''].includes( model.getValue(record, "CDGO_MVNT_FNCRO_ESTDO")) && model.getValue(record, "DSCRPCION_INDCDOR_MVMNTO_BLQDO") === ''No'' ) ',
'            });',
'            ',
'            if ( records.length > 0 ) {',
'             ',
'                for ( i = 0; i < records.length; i++ ) {',
'                    record = records[i];',
'                    v_vlor_ttal = parseFloat(accounting.unformat(model.getValue(record, "VLOR_TTAL"),","));',
'                     ',
'                    if (v_vlor_ttal > 0) { ',
'                        vgncia_prdo = vgncia_prdo + ''{"vgncia":''      + parseFloat(model.getValue(record, "VGNCIA")) + ',
'                                                    '',"prdo":''        + parseFloat(model.getValue(record, "PRDO")) + ',
'                                                    '',"id_orgen":''    + model.getValue(record, "ID_ORGEN") + ''},'';',
'                        if ( !isNaN(v_vlor_ttal) ) {',
'                            total += v_vlor_ttal;',
'                        }',
'                    }  ',
'                     ',
'               }',
'            } ',
'            ',
'    ',
'            $s("P321_VLOR_TTAL", total);',
'            vgncia_prdo = vgncia_prdo.substring(vgncia_prdo.length-1, 1) ;',
'            vgncia_prdo = vgncia_prdo + '']}''',
'            $s("P321_VGNCIA_PRDO", vgncia_prdo);',
'    ',
'        //Seleccionamos los item no procesados en el interactive grid ',
'        apex.region("deuda").widget().interactiveGrid("setSelectedRecords", records);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if( apex.region("deuda") )',
'    apex.region("deuda").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20230410104250'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(273017100331558920)
,p_plug_name=>'Fecha Vencimiento'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_sjto_impsto ',
'  from si_i_sujetos_impuesto',
' where id_sjto_impsto = :P321_ID_SJTO_IMPSTO',
'   --and id_sjto_estdo = 1',
'   and estdo_blqdo = ''N'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(277286825201235933)
,p_plug_name=>'Sujeto Tributo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148924795580498664)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(277286825201235933)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P321_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(277287116875235936)
,p_plug_name=>'Deuda'
,p_region_name=>'deuda'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'  from (',
'            select a.cdgo_mvmnto_orgn,',
'                    a.id_orgen,',
'                    pkg_gf_movimientos_financiero.fnc_co_dscrpcion_mvmnto_fnncro( p_id_mvmnto_fncro => a.id_mvmnto_fncro ) as dscrpcion_orgen,',
'                    a.vgncia, ',
'                    a.prdo,',
'                    case when a.cdgo_mvnt_fncro_estdo = ''AN'' and :P321_INDCDOR_FSCA = ''S'' then ''NO'' else a.cdgo_mvnt_fncro_estdo end as cdgo_mvnt_fncro_estdo,',
'                    a.dscrpcion_indcdor_mvmnto_blqdo,',
'                    a.dscrpcion_mvnt_fncro_estdo,',
'                    to_char(sum(a.vlor_sldo_cptal),:F_FRMTO_MNDA)    vlor_sldo_cptal, ',
'                    to_char(sum(a.vlor_intres),:F_FRMTO_MNDA)        vlor_intres, ',
'                    to_char(sum(a.vlor_ttal),:F_FRMTO_MNDA)          vlor_ttal ',
'               from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto (p_cdgo_clnte 			            => :F_CDGO_CLNTE,',
'                                                                                 p_id_impsto                        => :P321_ID_IMPSTO,',
'                                                                                 p_id_impsto_sbmpsto                => :P321_ID_IMPSTO_SBMPSTO,',
'                                                                                 p_id_sjto_impsto                   => :P321_ID_SJTO_IMPSTO,',
'                                                                                 p_fcha_vncmnto                     => sysdate ))a',
'            group by a.cdgo_mvmnto_orgn,',
'                    a.id_orgen,',
'                    pkg_gf_movimientos_financiero.fnc_co_dscrpcion_mvmnto_fnncro( p_id_mvmnto_fncro => a.id_mvmnto_fncro ),',
'                    a.vgncia, ',
'                    a.prdo,',
'                    a.cdgo_mvnt_fncro_estdo,',
'                    a.dscrpcion_indcdor_mvmnto_blqdo,',
'                    a.dscrpcion_mvnt_fncro_estdo',
'            order by ( case when sum(a.vlor_ttal)  = 0 then 1 else 0 end )',
'                   , a.vgncia desc',
'                   , a.prdo desc',
'     ) a'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_sjto_impsto ',
'  from si_i_sujetos_impuesto',
' where id_sjto_impsto = :P321_ID_SJTO_IMPSTO',
'   --and id_sjto_estdo = 1',
'   and estdo_blqdo = ''N'''))
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111954577159345079)
,p_name=>'DSCRPCION_INDCDOR_MVMNTO_BLQDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_MVMNTO_BLQDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFMovimiento Bloqueado?')
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
 p_id=>wwv_flow_api.id(148924549817498662)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(148924664811498663)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(152296633064563172)
,p_name=>'DSCRPCION_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Descripci\00F3n Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&DSCRPCION_ORGEN.'
,p_link_target=>'#'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(219027890068336852)
,p_name=>'CDGO_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVNT_FNCRO_ESTDO'
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
 p_id=>wwv_flow_api.id(270658757723909231)
,p_name=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(270658858440909232)
,p_name=>'+ Cartera'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<button style="color:green" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton "  title="M\00E1s Detalle" >'),
'<span class="fa fa-plus-square-o"></span>',
'</button>',
'',
'',
''))
,p_link_target=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:RP,46:P46_ID_SJTO_IMPSTO,P46_VGNCIA,P46_PRDO,P46_FCHA_VNCMNTO,P46_ID_ORGEN,P46_ID_IMPSTO,P46_ID_IMPSTO_SBMPSTO:&P321_ID_SJTO_IMPSTO.,&VGNCIA.,&PRDO.,&P45_FCHA_VNCMNTO.,&ID_ORGEN.,&P321_ID_IMPSTO.,&P321_ID_IMPSTO_SBM'
||'PSTO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(273017584161558925)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(277288208153235947)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(277288321462235948)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(277288369423235949)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(277288455672235950)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(277288587566235951)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(277288098976235946)
,p_internal_uid=>277288098976235946
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
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(282275213233302698)
,p_interactive_grid_id=>wwv_flow_api.id(277288098976235946)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(282275323902302699)
,p_report_id=>wwv_flow_api.id(282275213233302698)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118008997494296429)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(111954577159345079)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149011660428763206)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(148924549817498662)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149012206996763228)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(148924664811498663)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(157449276677667381)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(152296633064563172)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>468
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(219111334725750501)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(219027890068336852)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(282275758233302710)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(277288208153235947)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(282276156378302745)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(277288321462235948)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(282276737607302747)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(277288369423235949)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(282277177549302748)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(277288455672235950)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(282277658346302750)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(277288587566235951)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(282973079530992287)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(270658757723909231)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(282991933836027876)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(270658858440909232)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>48
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(101673404874386393)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_execution_seq=>5
,p_name=>'Bloqueada'
,p_background_color=>'#F5D5D8'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(111954577159345079)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(101673473322386349)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_execution_seq=>10
,p_name=>'Convenio'
,p_background_color=>'#FBFFBF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(270658757723909231)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Convenio'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(101674193901394202)
,p_view_id=>wwv_flow_api.id(282275323902302699)
,p_execution_seq=>15
,p_name=>'Anulada'
,p_background_color=>'#DEDBDE'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(270658757723909231)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Anulada'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_filter(
 p_id=>wwv_flow_api.id(101673435328386359)
,p_report_id=>wwv_flow_api.id(282275213233302698)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_api.id(277288369423235949)
,p_operator=>'NEQ'
,p_is_case_sensitive=>false
,p_expression=>'$0'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(287788228624647425)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'',
'',
'<p ALIGN="justify"><i>Funcionalidad que permite generar un documento de pago para un Sujeto de Impuesto, se debe seleccionar:</i></p>',
'',
'<b><i> a. </i></b><i> Impuesto y Sub-Impuesto.</i><br>',
'<b><i> b. </i></b><i> Sujeto Impuesto.</i><br>',
unistr('<b><i> c. </i></b><i> La fecha de vencimiento (fecha de proyecci\00F3n de Inter\00E9s de mora).</i><br>'),
'<b><i> d. </i></b><i> Las vigencias y Periodos.</i><br>',
'<b><i> e. </i></b><i> Tipo de Recibo.</i>',
'<br><br>	',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101675015618386362)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(277286825201235933)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101674670266386361)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(277286825201235933)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101684528829386390)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(277287116875235936)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101684908116386391)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(277287116875235936)
,p_button_name=>'BTN_SIGUIENTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(101698330042386422)
,p_branch_name=>'Ir a 322 Deuda Proyectada'
,p_branch_action=>'f?p=&APP_ID.:322:&SESSION.::&DEBUG.:RP,322::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(101684908116386391)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(101698794544386422)
,p_branch_name=>'Ir a Busqueda Sujeto Impuesto'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P321_ID_SJTO_IMPSTO,&P321_ID_IMPSTO.,&P321_ID_IMPSTO_SBMPSTO.,P321_ID_IMPSTO,P321_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(101674670266386361)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101673974739386359)
,p_name=>'P321_FCHA_VNCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(273017100331558920)
,p_item_default=>'sysdate-1'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101675474797386362)
,p_name=>'P321_INDCDOR_ENTRNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(277286825201235933)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101675872806386362)
,p_name=>'P321_INDCDOR_FSCA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(277286825201235933)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101676227508386362)
,p_name=>'P321_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(277286825201235933)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101676683789386363)
,p_name=>'P321_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(277286825201235933)
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
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101677080723386363)
,p_name=>'P321_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(277286825201235933)
,p_prompt=>'Sub-Tributos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto,',
'        id_impsto_sbmpsto',
'   from df_i_impuestos_subimpuesto',
'   where id_impsto = :P321_ID_IMPSTO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P321_ID_IMPSTO'
,p_ajax_items_to_submit=>'P321_ID_IMPSTO,P321_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101677437940386364)
,p_name=>'P321_IDNTFCCION_PRMT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(277286825201235933)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101677852924386364)
,p_name=>'P321_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(277286825201235933)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101685346877386391)
,p_name=>'P321_VLOR_TTAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(277287116875235936)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101685777261386391)
,p_name=>'P321_VGNCIA_PRDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(277287116875235936)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101686177118386395)
,p_name=>'P321_VGNCIA_PRDO_PS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(277287116875235936)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_cdna_vgncia_prdo_ps    varchar2(4000);',
'',
'begin ',
'    begin  ',
'        select listagg (a.vgncia || '','' || a.prdo, '':'') within group (order by vgncia, prdo) cdna_vgncia_prdo',
'           into v_cdna_vgncia_prdo_ps ',
'          from v_gf_g_cartera_x_vigencia a',
'         where a.id_sjto_impsto = :P321_ID_SJTO_IMPSTO',
'           and (a.vlor_sldo_cptal - a.vlor_intres) = 0',
'          group by id_sjto_impsto ; ',
'    exception ',
'        when no_data_found then ',
'            v_cdna_vgncia_prdo_ps := null;',
'     end;',
'    :P321_VGNCIA_PRDO_PS := v_cdna_vgncia_prdo_ps;     ',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101686974885386404)
,p_validation_name=>'Validar Impuesto'
,p_validation_sequence=>20
,p_validation=>'P321_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe selecccionar un impuesto'
,p_validation_condition=>'BTN_CONSULTA_PARAMETROS,BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(101674670266386361)
,p_associated_item=>wwv_flow_api.id(101676683789386363)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101687342914386405)
,p_validation_name=>unistr('identificaci\00F3n no nula')
,p_validation_sequence=>50
,p_validation=>'P321_IDNTFCCION_PRMT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor ingrese un identificaci\00F3n para consultar')
,p_when_button_pressed=>wwv_flow_api.id(101675015618386362)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101687738941386405)
,p_validation_name=>'Validar si Existen Vigencias seleccionadas con deuda mayor a 0'
,p_validation_sequence=>80
,p_validation=>'P321_VLOR_TTAL'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'Debe seleccionar vigencias con deuda superior a cero (0).'
,p_when_button_pressed=>wwv_flow_api.id(101684908116386391)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101690852403386408)
,p_name=>'Ocultar item valor abono cuando el tipo del recibo sea DNO'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P321_CDGO_RCBO_TPO'
,p_condition_element=>'P321_CDGO_RCBO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101691301900386409)
,p_event_id=>wwv_flow_api.id(101690852403386408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P321_VLOR_ABONO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101691834474386410)
,p_event_id=>wwv_flow_api.id(101690852403386408)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P321_VLOR_ABONO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101692289834386410)
,p_name=>'al cambiar Validar Valor del Abono no sea mayor al total de la deuda seleccionada'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P321_VLOR_ABONO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101692730096386410)
,p_event_id=>wwv_flow_api.id(101692289834386410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculaTotal();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101693158166386411)
,p_name=>'Al cambiar la fecha de vencimiento refrescar el IG de deuda'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P321_FCHA_VNCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101693691161386411)
,p_event_id=>wwv_flow_api.id(101693158166386411)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P321_FCHA_VNCMNTO'',:P321_FCHA_VNCMNTO);',
'END;'))
,p_attribute_02=>'P321_FCHA_VNCMNTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101694191852386412)
,p_event_id=>wwv_flow_api.id(101693158166386411)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(277287116875235936)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101694564917386412)
,p_name=>unistr('Al seleccionar Calcular total Deuda Seleccionada regi\00F3n')
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(277287116875235936)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101695047790386412)
,p_event_id=>wwv_flow_api.id(101694564917386412)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculaTotal();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101695485996386412)
,p_name=>unistr('Al cambiar el Valor del impuesto Refrescar la regi\00F3n de deuda')
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P321_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101696463984386420)
,p_event_id=>wwv_flow_api.id(101695485996386412)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(277287116875235936)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101695908734386412)
,p_event_id=>wwv_flow_api.id(101695485996386412)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'$(''#P321_IDNTFCCION_PRMT'').text(''Referencia/Matricula'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101696828192386420)
,p_name=>'New'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P321_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101697357791386421)
,p_event_id=>wwv_flow_api.id(101696828192386420)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P321_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101697832557386421)
,p_event_id=>wwv_flow_api.id(101696828192386420)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(277287116875235936)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101688814423386406)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_sjto    idntfccion_sjto        ',
'  into :P321_IDNTFCCION_PRMT',
'  from V_SI_I_SUJETOS_IMPUESTO a',
' where a.id_sjto_impsto = :P321_ID_SJTO_IMPSTO;'))
,p_process_error_message=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101689259005386406)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_estdo_blqdo_sjto      si_i_sujetos_impuesto.estdo_blqdo%type;',
'    v_id_sjto_estdo       si_i_sujetos_impuesto.id_sjto_estdo%type;',
'    ',
'begin',
'',
'    select id_sjto_impsto,     estdo_blqdo_sjto,   id_sjto_estdo',
'      into v_id_sjto_impsto,   v_estdo_blqdo_sjto, v_id_sjto_estdo',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte       = :F_CDGO_CLNTE',
'       and (id_impsto       = :P321_ID_IMPSTO ',
'        or :P321_ID_IMPSTO is null)',
'       and idntfccion_sjto   = :P321_IDNTFCCION_PRMT ',
'        /*or idntfccion_antrior = :P321_IDNTFCCION_PRMT ',
'        or mtrcla_inmblria    = :P321_IDNTFCCION_PRMT)*/;      ',
'    ',
'    if v_estdo_blqdo_sjto = ''N'' and v_id_sjto_estdo = 1 then ',
'        --:P321_RSPSTA := '''';',
'        :P321_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'        ',
'    elsif v_estdo_blqdo_sjto = ''S'' then',
'        :P321_RSPSTA := ''El sujeto impuesto ingresado se encuentra bloqueado'';',
'        :P321_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    elsif v_id_sjto_estdo != 1 then',
'        :P321_RSPSTA := ''El sujeto impuesto ingresado No se encuentra activo'';',
'        :P321_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    end if;',
'exception',
'    when no_data_found then ',
'        :P321_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'        :P321_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'    when others then ',
'        :P321_RSPSTA := ''Error: '' || sqlerrm;',
'end; '))
,p_process_error_message=>'&P321_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101675015618386362)
,p_process_when=>'P321_IDNTFCCION_PRMT'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'123'
,p_process_success_message=>'&P321_RSPSTA.'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Cambio:   20200211   Jose Yi',
unistr('Inclusi\00F3n en la consulta del Sujeto_Impuesto para busqued por Indentificaci\00F3n Anterior (Predios)'),
'',
'idntfccion_antrior = :P45_IDNTFCCION_PRMT'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101690491281386407)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto X enter del item identificacion_prmt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte    = :F_CDGO_CLNTE',
'       and (id_impsto    = :P321_ID_IMPSTO or :P321_ID_IMPSTO is null)',
'       and (idntfccion_sjto    = :P321_IDNTFCCION_PRMT or idntfccion_antrior = :P321_IDNTFCCION_PRMT or mtrcla_inmblria = :P321_IDNTFCCION_PRMT);      ',
'    ',
'    :P321_RSPSTA := '''';',
'    :P321_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P321_ID_SJTO_IMPSTO := null;',
'    :P321_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P321_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P321_RSPSTA.'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Cambio:   20200211   Jose Yi',
unistr('Inclusi\00F3n en la consulta del Sujeto_Impuesto para busqued por Indentificaci\00F3n Anterior (Predios)'),
'',
'idntfccion_antrior = :P45_IDNTFCCION_PRMT'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101689609689386407)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P321_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P321_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101675015618386362)
,p_process_when=>':P321_ID_SJTO_IMPSTO IS NULL or :P321_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P321_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101690082482386407)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Cache de toda la P\00E1gina')
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'45'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101684528829386390)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101688461418386406)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Indicador Fiscalizanci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    :P321_INDCDOR_FSCA := pkg_fi_fiscalizacion.fnc_co_indicador_fisca(p_cdgo_clnte	     => :F_CDGO_CLNTE,',
'                                                                     p_id_impsto         => :P321_ID_IMPSTO,',
'                                                                     p_id_impsto_sbmpsto => :P321_ID_IMPSTO_SBMPSTO,',
'                                                                     p_id_sjto_tpo       => :P321_ID_SJTO_IMPSTO);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101675015618386362)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101688088044386405)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Indicador Fisca'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    :P321_INDCDOR_FSCA := pkg_fi_fiscalizacion.fnc_co_indicador_fisca(p_cdgo_clnte	     => :F_CDGO_CLNTE,',
'                                                                     p_id_impsto         => :P321_ID_IMPSTO,',
'                                                                     p_id_impsto_sbmpsto => :P321_ID_IMPSTO_SBMPSTO,',
'                                                                     p_id_sjto_tpo       => :P321_ID_SJTO_IMPSTO);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'PRMTRO_BSQDA'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
