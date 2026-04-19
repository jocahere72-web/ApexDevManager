prompt --application/pages/page_20240
begin
wwv_flow_api.create_page(
 p_id=>2024004
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Emisi\00F3n de Recibo Puntual Proindiviso')
,p_step_title=>unistr('Emisi\00F3n de Recibo Puntual Proindiviso')
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
'                //return ( [''NO'', ''CN''].includes( model.getValue(record, "CDGO_MVNT_FNCRO_ESTDO")) && model.getValue(record, "DSCRPCION_INDCDOR_MVMNTO_BLQDO") === ''No'' ) ',
'            //Realizamos un filtro de todos los datos seleccionados del interactive grid que esten en estado Normal',
'            records = records.filter(function (record) {',
'                return ( [''NO''].includes( model.getValue(record, "CDGO_MVNT_FNCRO_ESTDO")) && model.getValue(record, "DSCRPCION_INDCDOR_MVMNTO_BLQDO") === ''No'' ) ',
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
'            $s("P2024004_VLOR_TTAL", total);',
'            vgncia_prdo = vgncia_prdo.substring(vgncia_prdo.length-1, 1) ;',
'            vgncia_prdo = vgncia_prdo + '']}''',
'            $s("P2024004_VGNCIA_PRDO", vgncia_prdo);',
'    ',
'        //Seleccionamos los item no procesados en el interactive grid ',
'        apex.region("deuda").widget().interactiveGrid("setSelectedRecords", records);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if( apex.region("deuda") )',
'{   apex.region("deuda").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");',
'} ',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250709153346'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10277746191802348)
,p_plug_name=>unistr('Generaci\00F3n Documento por Responsable')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2024004_INDCDOR_TPO_DCMNTO'
,p_plug_display_when_cond2=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(176588081009435510)
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
' where id_sjto_impsto = :P2024004_ID_SJTO_IMPSTO',
'   --and id_sjto_estdo = 1',
'   and estdo_blqdo = ''N'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(180857805879112523)
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
 p_id=>wwv_flow_api.id(52495776258375254)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(180857805879112523)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P2024004_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(180858097553112526)
,p_plug_name=>'Deuda'
,p_region_name=>'deuda'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 	d.*, c.nmbre nmbre_scrsal',
'from 	(select	a.cdgo_mvmnto_orgn,',
'				a.id_orgen,',
'				pkg_gf_movimientos_financiero.fnc_co_dscrpcion_mvmnto_fnncro ( p_id_mvmnto_fncro => a.id_mvmnto_fncro ) as dscrpcion_orgen,',
'				a.vgncia,',
'				a.prdo,',
'				--a.fcha_vncmnto,',
'				case',
'					when a.cdgo_mvnt_fncro_estdo = ''AN'' and :P2024004_INDCDOR_FSCA = ''S'' then ''NO''',
'					else a.cdgo_mvnt_fncro_estdo',
'				end as cdgo_mvnt_fncro_estdo,',
'				a.dscrpcion_indcdor_mvmnto_blqdo,',
'				a.dscrpcion_mvnt_fncro_estdo,',
'				nvl((	select ''S''',
'						from 	v_gf_g_prescripciones 		a',
'						join 	gf_g_prscrpcnes_sjto_impsto b on b.id_prscrpcion = a.id_prscrpcion',
'						join 	gf_g_prscrpcnes_vgncia 		c on c.id_prscrpcion_sjto_impsto = b.id_prscrpcion_sjto_impsto',
'						where 	b.cdgo_clnte            = :F_CDGO_CLNTE',
'						and 	b.id_impsto             = :P2024004_ID_IMPSTO',
'						and 	b.id_impsto_sbmpsto     = :P2024004_ID_IMPSTO_SBMPSTO',
'						and 	b.id_sjto_impsto        = :P2024004_ID_SJTO_IMPSTO',
'						and 	a.id_estdo_slctud       <> 4',
'						and 	c.vgncia                = a.vgncia',
'						and 	c.id_prdo               = a.id_prdo',
unistr('						and 	rownum = 1 -- Hugo Mart\00EDnez 24/05/2023 '),
unistr('						-- se agreg\00F3 este Rownum porque hay m\00E1s de una prescripci\00F3n'),
'						-- con vigencias repetidas lo que hace que la consulta falle',
'                    ),',
'                   ''N'') prscrpcion_trmte,',
'				to_char(sum(a.vlor_sldo_cptal), :F_FRMTO_MNDA)             vlor_sldo_cptal,',
'				to_char(sum(a.vlor_intres), :F_FRMTO_MNDA)                 vlor_intres,',
'				to_char(sum(a.vlor_ttal), :F_FRMTO_MNDA)                   vlor_ttal,         ',
'				to_char(sum(a.vlor_sldo_cptal_prcntje), :F_FRMTO_MNDA)     vlor_sldo_cptal_prcntje, -- DOC. PORCENTUALIDAD',
'				to_char(sum(a.vlor_intres_prcntje), :F_FRMTO_MNDA)         vlor_intres_prcntje, -- DOC. PORCENTUALIDAD',
'				to_char(sum(a.vlor_ttal_prcntje), :F_FRMTO_MNDA)           vlor_ttal_prcntje -- DOC. PORCENTUALIDAD',
'                , a.indcdor_pgdo',
'        from 	table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto( ',
'												p_cdgo_clnte        => :F_CDGO_CLNTE,',
'												p_id_impsto         => :P2024004_ID_IMPSTO,',
'												p_id_impsto_sbmpsto => :P2024004_ID_IMPSTO_SBMPSTO,',
'												p_id_sjto_impsto    => :P2024004_ID_SJTO_IMPSTO,',
'												--p_fcha_vncmnto      => /*to_date(:P2024004_FCHA_VNCMNTO,''DD/MM/YYYY'')*/ ',
'												p_fcha_vncmnto      => sysdate,',
'                                                p_id_rspnsble       => :P2024004_ID_RSPNSBLE',
'                                                ) ',
'                       ) a',
'        where 	a.CDGO_MVNT_FNCRO_ESTDO IN (''NO'') --and :P2024004_ID_IMPSTO != 230012',
'        --and     a.indcdor_pgdo = 0 ',
'        group by 	a.cdgo_mvmnto_orgn,',
'					a.id_orgen,',
'					pkg_gf_movimientos_financiero.fnc_co_dscrpcion_mvmnto_fnncro (p_id_mvmnto_fncro => a.id_mvmnto_fncro),',
'					a.vgncia,',
'					a.prdo,',
'					a.id_prdo,',
'					--a.fcha_vncmnto,',
'					a.cdgo_mvnt_fncro_estdo,',
'					a.dscrpcion_indcdor_mvmnto_blqdo,',
'					a.dscrpcion_mvnt_fncro_estdo, a.indcdor_pgdo',
'        having ( sum(a.vlor_ttal) > 0 and a.indcdor_pgdo = 0 )  --sum(a.vlor_ttal) > 0',
'        order by (case',
'                    when sum(a.vlor_ttal) = 0 then 1 else 0',
'                  end),',
'                  a.vgncia desc, ',
'        a.prdo desc',
'        ) d',
'  left join gi_g_liquidaciones    b on b.id_lqdcion = d.id_orgen',
'  left join si_i_sujetos_sucursal c on b.id_sjto_scrsal = c.id_sjto_scrsal ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_sjto_impsto ',
'  from si_i_sujetos_impuesto',
' where id_sjto_impsto = :P2024004_ID_SJTO_IMPSTO',
'   --and id_sjto_estdo = 1',
'   and estdo_blqdo = ''N'''))
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5036397062539438)
,p_name=>'INDCDOR_PGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_PGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Indcdor Pgdo'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(10276983009802340)
,p_name=>'VLOR_SLDO_CPTAL_PRCNTJE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL_PRCNTJE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor Capital<br>Porcentual'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(10277025312802341)
,p_name=>'VLOR_INTRES_PRCNTJE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_PRCNTJE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Valor Inter\00E9s<br>Porcentual')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(10277173168802342)
,p_name=>'VLOR_TTAL_PRCNTJE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_PRCNTJE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor Total<br>Porcentual'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(15525557837221669)
,p_name=>'DSCRPCION_INDCDOR_MVMNTO_BLQDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_MVMNTO_BLQDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFMovimiento<br>Bloqueado?')
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
 p_id=>wwv_flow_api.id(52495530495375252)
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
 p_id=>wwv_flow_api.id(52495645489375253)
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
 p_id=>wwv_flow_api.id(55867613742439762)
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
 p_id=>wwv_flow_api.id(72536733094410544)
,p_name=>'NMBRE_SCRSAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SCRSAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sucursal'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(122598870746213442)
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
 p_id=>wwv_flow_api.id(143323547930101641)
,p_name=>'PRSCRPCION_TRMTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRSCRPCION_TRMTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Prscrpcion Trmte'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(174229738401785821)
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
 p_id=>wwv_flow_api.id(174229839118785822)
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
,p_link_target=>'f?p=&APP_ID.:2024005:&SESSION.::&DEBUG.:RP,2024005:P2024005_ID_SJTO_IMPSTO,P2024005_VGNCIA,P2024005_PRDO,P2024005_FCHA_VNCMNTO,P2024005_ID_ORGEN:&P2024004_ID_SJTO_IMPSTO.,&VGNCIA.,&PRDO.,&P2024004_FCHA_VNCMNTO.,&ID_ORGEN.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(176588564839435515)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(180859188831112537)
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
 p_id=>wwv_flow_api.id(180859302140112538)
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
 p_id=>wwv_flow_api.id(180859350101112539)
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
 p_id=>wwv_flow_api.id(180859436350112540)
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
 p_id=>wwv_flow_api.id(180859568244112541)
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
 p_id=>wwv_flow_api.id(180859079654112536)
,p_internal_uid=>180859079654112536
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
 p_id=>wwv_flow_api.id(185846193911179288)
,p_interactive_grid_id=>wwv_flow_api.id(180859079654112536)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(185846304580179289)
,p_report_id=>wwv_flow_api.id(185846193911179288)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5250400222272502)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(10276983009802340)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5250965865272506)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(10277025312802341)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5251611730272508)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(10277173168802342)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5325851962495628)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(5036397062539438)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21579978172173019)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(15525557837221669)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(52582641106639796)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(52495530495375252)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(52583187674639818)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(52495645489375253)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61020257355543971)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(55867613742439762)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>238
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72903276132741470)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(72536733094410544)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(122682315403627091)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(122598870746213442)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143379976937042323)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(143323547930101641)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185846738911179300)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(180859188831112537)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185847137056179335)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(180859302140112538)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>75
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185847718285179337)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(180859350101112539)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185848158227179338)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(180859436350112540)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185848639024179340)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(180859568244112541)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186544060208868877)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(174229738401785821)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186562914513904466)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(174229839118785822)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>48
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(5244447984262939)
,p_view_id=>wwv_flow_api.id(185846304580179289)
,p_execution_seq=>5
,p_name=>unistr('PRESCRIPCIONES EN TR\00C1MITE')
,p_background_color=>'#FFFF99'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(143323547930101641)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'S'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(191359209302524015)
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
 p_id=>wwv_flow_api.id(5245988252262967)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(180857805879112523)
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
 p_id=>wwv_flow_api.id(5245568134262965)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(180857805879112523)
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
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5258708822262994)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(180858097553112526)
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
 p_id=>wwv_flow_api.id(5259105004262994)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(180858097553112526)
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
 p_id=>wwv_flow_api.id(5279623392263023)
,p_branch_name=>'Ir a 2024006 Deuda Proyectada'
,p_branch_action=>'f?p=&APP_ID.:2024006:&SESSION.::&DEBUG.:RP,2024006:P2024006_FCHA_VNCMNTO:&P2024004_FCHA_VNCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5259105004262994)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5280030456263024)
,p_branch_name=>'Ir a Busqueda Sujeto Impuesto'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P2024004_ID_SJTO_IMPSTO,&P2024004_ID_IMPSTO.,&P2024004_ID_IMPSTO_SBMPSTO.,P2024004_ID_IMPSTO,P2024004_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5245568134262965)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5244884621262958)
,p_name=>'P2024004_FCHA_VNCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(176588081009435510)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5246395194262968)
,p_name=>'P2024004_INDCDOR_ENTRNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5246787081262968)
,p_name=>'P2024004_INDCDOR_ACTLZA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5247196145262969)
,p_name=>'P2024004_INDCDOR_FSCA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5247559376262969)
,p_name=>'P2024004_DFNCION_ISI'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
':P2024004_DFNCION_ISI :=  pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte 				    => :F_CDGO_CLNTE,',
'										                             p_cdgo_dfncion_clnte_ctgria	=> ''CLN'',',
'										                             p_cdgo_dfncion_clnte			=> ''ISI'') ;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5247946545262970)
,p_name=>'P2024004_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5248334724262970)
,p_name=>'P2024004_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
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
 p_id=>wwv_flow_api.id(5248783259262971)
,p_name=>'P2024004_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
,p_prompt=>'Sub-Tributos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto,',
'        id_impsto_sbmpsto',
'   from df_i_impuestos_subimpuesto',
'   where id_impsto = :P2024004_ID_IMPSTO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2024004_ID_IMPSTO'
,p_ajax_items_to_submit=>'P2024004_ID_IMPSTO,P2024004_ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(5249155948262972)
,p_name=>'P2024004_IDNTFCCION_PRMT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
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
 p_id=>wwv_flow_api.id(5249546641262972)
,p_name=>'P2024004_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5249907887262973)
,p_name=>'P2024004_INDCDOR_TPO_DCMNTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(180857805879112523)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5259577346262994)
,p_name=>'P2024004_VLOR_TTAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(180858097553112526)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5259948239262995)
,p_name=>'P2024004_VGNCIA_PRDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(180858097553112526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5260345994262995)
,p_name=>'P2024004_VGNCIA_PRDO_PS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(180858097553112526)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_cdna_vgncia_prdo_ps    varchar2(4000);',
'',
'begin ',
'    begin  ',
'        select listagg (a.vgncia || '','' || a.prdo, '':'') within group (order by vgncia, prdo) cdna_vgncia_prdo',
'           into v_cdna_vgncia_prdo_ps ',
'          from v_gf_g_cartera_x_vigencia a',
'         where a.id_sjto_impsto = :P2024004_ID_SJTO_IMPSTO',
'           and (a.vlor_sldo_cptal - a.vlor_intres) = 0',
'          group by id_sjto_impsto ; ',
'    exception ',
'        when no_data_found then ',
'            v_cdna_vgncia_prdo_ps := null;',
'     end;',
'    :P2024004_VGNCIA_PRDO_PS := v_cdna_vgncia_prdo_ps;     ',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5261353870262996)
,p_name=>'P2024004_TPO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10277746191802348)
,p_item_default=>'R'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5261785304262996)
,p_name=>'P2024004_ID_RSPNSBLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10277746191802348)
,p_prompt=>'Responsables'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  idntfccion||'' - ''||PRMER_NMBRE || decode(PRMER_APLLDO, ''.'' , null, '' ''||PRMER_APLLDO) d, ID_SJTO_RSPNSBLE r',
'from    si_i_sujetos_responsable ',
'where   id_sjto_impsto = :P2024004_ID_SJTO_IMPSTO'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5262156507262997)
,p_name=>'P2024004_PRCNTJE_RSPNSBLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(10277746191802348)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5262609329263008)
,p_validation_name=>'Validar Impuesto'
,p_validation_sequence=>20
,p_validation=>'P2024004_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe selecccionar un impuesto'
,p_validation_condition=>'BTN_CONSULTA_PARAMETROS,BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(5245568134262965)
,p_associated_item=>wwv_flow_api.id(5248334724262970)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5263024001263008)
,p_validation_name=>unistr('identificaci\00F3n no nula')
,p_validation_sequence=>50
,p_validation=>'P2024004_IDNTFCCION_PRMT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor ingrese un identificaci\00F3n para consultar')
,p_when_button_pressed=>wwv_flow_api.id(5245988252262967)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5263448885263009)
,p_validation_name=>unistr('Validar que la fecha de vencimiento este dentro de un rango de fechas en la parametrizaci\00F3n de tasas mora')
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_fcha_vlda varchar2(1);',
'begin     ',
'    v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P2024004_ID_IMPSTO, to_date(:P2024004_FCHA_VNCMNTO));',
'    if v_fcha_vlda = ''S''  then',
'        return true;',
'    else ',
'        return false;',
'    end if;       ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de Vencimiento seleccionada no es valida. Por favor revise las par\00E1metrizaci\00F3n de Tasas Mora')
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(5259105004262994)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5263882208263009)
,p_validation_name=>'Validar si Existen Vigencias seleccionadas con deuda mayor a 0'
,p_validation_sequence=>80
,p_validation=>'P2024004_VLOR_TTAL'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'Debe seleccionar vigencias con deuda superior a cero (0).'
,p_when_button_pressed=>wwv_flow_api.id(5259105004262994)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5267664661263012)
,p_name=>'Ocultar item valor abono cuando el tipo del recibo sea DNO'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024004_CDGO_RCBO_TPO'
,p_condition_element=>'P2024004_CDGO_RCBO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5268188242263014)
,p_event_id=>wwv_flow_api.id(5267664661263012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024004_VLOR_ABONO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5268620388263015)
,p_event_id=>wwv_flow_api.id(5267664661263012)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024004_VLOR_ABONO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5269061726263015)
,p_name=>'al cambiar Validar Valor del Abono no sea mayor al total de la deuda seleccionada'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024004_VLOR_ABONO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5269571835263016)
,p_event_id=>wwv_flow_api.id(5269061726263015)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculaTotal();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5269951917263016)
,p_name=>'Al cambiar la fecha de vencimiento refrescar el IG de deuda'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024004_FCHA_VNCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5270451994263016)
,p_event_id=>wwv_flow_api.id(5269951917263016)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P2024004_FCHA_VNCMNTO'',:P2024004_FCHA_VNCMNTO);',
'END;'))
,p_attribute_02=>'P2024004_FCHA_VNCMNTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5270933525263017)
,p_event_id=>wwv_flow_api.id(5269951917263016)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(180858097553112526)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5271327478263017)
,p_name=>unistr('Al seleccionar Calcular total Deuda Seleccionada regi\00F3n')
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(180858097553112526)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5271880277263018)
,p_event_id=>wwv_flow_api.id(5271327478263017)
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
 p_id=>wwv_flow_api.id(5272251895263018)
,p_name=>unistr('Al cambiar el Valor del impuesto Refrescar la regi\00F3n de deuda')
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024004_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5272737071263018)
,p_event_id=>wwv_flow_api.id(5272251895263018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(180858097553112526)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5273279700263019)
,p_event_id=>wwv_flow_api.id(5272251895263018)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'$(''#P2024004_IDNTFCCION_PRMT'').text(''Referencia/Matricula'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5273620563263019)
,p_name=>'New'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024004_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5274118558263019)
,p_event_id=>wwv_flow_api.id(5273620563263019)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P2024004_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5274695918263019)
,p_event_id=>wwv_flow_api.id(5273620563263019)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(180858097553112526)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5275922055263020)
,p_name=>'Al cambiar ID_RSPNSBLE'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024004_ID_RSPNSBLE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5276467556263021)
,p_event_id=>wwv_flow_api.id(5275922055263020)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5265620867263010)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_sjto    idntfccion_sjto        ',
'  into :P2024004_IDNTFCCION_PRMT',
'  from V_SI_I_SUJETOS_IMPUESTO a',
' where a.id_sjto_impsto = :P2024004_ID_SJTO_IMPSTO;'))
,p_process_error_message=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5264446063263010)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta si genera por responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    :P2024004_INDCDOR_TPO_DCMNTO := pkg_re_documentos.fnc_co_sujeto_proindiviso( p_cdgo_clnte       => :F_CDGO_CLNTE, ',
'                                                                            p_id_sjto_impsto   => :P2024004_ID_SJTO_IMPSTO );',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5266055333263011)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_estdo_blqdo_sjto      si_i_sujetos_impuesto.estdo_blqdo%type;',
'    v_id_sjto_estdo       si_i_sujetos_impuesto.id_sjto_estdo%type;    ',
'begin',
'',
'    select id_sjto_impsto,     estdo_blqdo_sjto,   id_sjto_estdo',
'      into v_id_sjto_impsto,   v_estdo_blqdo_sjto, v_id_sjto_estdo',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte       = :F_CDGO_CLNTE',
'       and (id_impsto       = :P2024004_ID_IMPSTO  or :P2024004_ID_IMPSTO is null)',
'       and idntfccion_sjto  = :P2024004_IDNTFCCION_PRMT ',
'    /*    or idntfccion_antrior = :P2024004_IDNTFCCION_PRMT ',
'        or mtrcla_inmblria    = :P2024004_IDNTFCCION_PRMT)*/;      ',
'    ',
'    if v_estdo_blqdo_sjto = ''N'' and v_id_sjto_estdo = 1 then ',
'        :P2024004_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'        ',
'    elsif v_estdo_blqdo_sjto = ''S'' then',
'        :P2024004_RSPSTA := ''El sujeto impuesto ingresado se encuentra bloqueado'';',
'        :P2024004_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'        ',
'    elsif v_id_sjto_estdo != 1 then',
'        :P2024004_RSPSTA := ''El sujeto impuesto ingresado No se encuentra activo'';',
'        :P2024004_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'        ',
'    end if;',
'    ',
'exception',
'    when no_data_found then ',
'        :P2024004_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'        :P2024004_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end; '))
,p_process_error_message=>'&P2024004_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5245988252262967)
,p_process_success_message=>'&P2024004_RSPSTA.'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Cambio:   20200211   Jose Yi',
unistr('Inclusi\00F3n en la consulta del Sujeto_Impuesto para busqued por Indentificaci\00F3n Anterior (Predios)'),
'',
'idntfccion_antrior = :2024004_IDNTFCCION_PRMT'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5267295530263012)
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
'       and (id_impsto    = :P2024004_ID_IMPSTO or :P2024004_ID_IMPSTO is null)',
'       and (idntfccion_sjto    = :P2024004_IDNTFCCION_PRMT or idntfccion_antrior = :P2024004_IDNTFCCION_PRMT or mtrcla_inmblria = :P2024004_IDNTFCCION_PRMT);      ',
'    ',
'    :P2024004_RSPSTA := '''';',
'    :P2024004_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P2024004_ID_SJTO_IMPSTO := null;',
'    :P2024004_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P2024004_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P2024004_RSPSTA.'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Cambio:   20200211   Jose Yi',
unistr('Inclusi\00F3n en la consulta del Sujeto_Impuesto para busqued por Indentificaci\00F3n Anterior (Predios)'),
'',
'idntfccion_antrior = :P2024004_IDNTFCCION_PRMT'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5266405818263011)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P2024004_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P2024004_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5245988252262967)
,p_process_when=>':P2024004_ID_SJTO_IMPSTO IS NULL or :P2024004_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P2024004_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5266895928263012)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Cache de toda la P\00E1gina')
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'2024004'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5258708822262994)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5265293438263010)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Indicador Fiscalizanci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    :P2024004_INDCDOR_FSCA := pkg_fi_fiscalizacion.fnc_co_indicador_fisca(p_cdgo_clnte	     => :F_CDGO_CLNTE,',
'                                                                     p_id_impsto         => :P2024004_ID_IMPSTO,',
'                                                                     p_id_impsto_sbmpsto => :P2024004_ID_IMPSTO_SBMPSTO,',
'                                                                     p_id_sjto_tpo       => :P2024004_ID_SJTO_IMPSTO);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5245988252262967)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5264807322263010)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Indicador Fisca'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    :P2024004_INDCDOR_FSCA := pkg_fi_fiscalizacion.fnc_co_indicador_fisca(p_cdgo_clnte	     => :F_CDGO_CLNTE,',
'                                                                     p_id_impsto         => :P2024004_ID_IMPSTO,',
'                                                                     p_id_impsto_sbmpsto => :P2024004_ID_IMPSTO_SBMPSTO,',
'                                                                     p_id_sjto_tpo       => :P2024004_ID_SJTO_IMPSTO);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'PRMTRO_BSQDA'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5264131845263009)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtiene_Porcentaje'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    --v_cdgo_rspsta     number := 0;',
'    v_mnsje_rspsta    varchar2(1000); ',
'    v_exception       exception;',
'    v_prcntje_prtcpcion   number;',
'begin',
'',
'    insert into muerto (n_001, v_001, v_002 , t_001) values (1 , ''INICIA v_prcntje_prtcpcion ajax'' , :P2024004_ID_RSPNSBLE, systimestamp ); commit;',
'    ',
'    select  to_char(prcntje_prtcpcion) into v_prcntje_prtcpcion',
'    from    si_i_sujetos_responsable ',
'    where   id_sjto_rspnsble = :P2024004_ID_RSPNSBLE ;',
'    ',
'    insert into muerto (n_001, v_001, v_002 , t_001) values (1 , ''VALOR v_prcntje_prtcpcion ajax'' , v_prcntje_prtcpcion, systimestamp ); commit;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', 0);',
'    apex_json.write(''o_mnsje_rspsta'', ''OK'');',
'    apex_json.write(''o_vlor_prcntje'', v_prcntje_prtcpcion);',
'    apex_json.close_object;',
'',
'exception',
'    when others then',
'        rollback;',
'        v_mnsje_rspsta := sqlerrm;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 99);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''o_vlor_prcntje'', 0);',
'        apex_json.close_object;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
