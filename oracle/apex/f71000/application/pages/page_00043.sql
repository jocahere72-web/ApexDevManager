prompt --application/pages/page_00043
begin
wwv_flow_api.create_page(
 p_id=>43
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr(' Proyecci\00F3n de Acuerdo - Cartera ')
,p_step_title=>unistr(' Proyecci\00F3n de Acuerdo - Cartera ')
,p_autocomplete_on_off=>'OFF'
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
'    if($v(''P43_VGNCIA_PRDO'')){',
'        try{',
'            // convierte en tipo json',
'            vgncia_prdo = JSON.parse($v(''P43_VGNCIA_PRDO''));                    ',
'        }catch(e){',
'            vgncia_prdo = [];',
'        }',
'    }   ',
unistr('    //si el json est\00E1 lleno '),
'    if (vgncia_prdo.length > 0){      ',
'        // construye la vista',
'        var view = apex.region(''deuda'').widget().interactiveGrid("getCurrentView"); ',
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
'',
'',
' '))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buttonCollapse(''t_Button_rightControlButton'');',
'apenascargue();',
'if( apex.region("deuda") )',
'    apex.region("deuda").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20240711161950'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43449999092066309)
,p_plug_name=>'Cartera'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(43441465037066295)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43450098909066309)
,p_plug_name=>'Cartera'
,p_region_name=>'deuda'
,p_parent_plug_id=>wwv_flow_api.id(43449999092066309)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id',
'        , a.vgncia',
'        , a.prdo',
'        , sum(a.vlor_sldo_cptal) vlor_sldo_cptal',
'        , sum(a.vlor_intres) vlor_intres',
'        , sum(a.vlor_sldo_cptal) + sum(a.vlor_intres) vlor_ttal',
'        , a.vgncia_pryccion',
'        , a.id_orgen',
'        , a.cdgo_mvmnto_orgn',
'     --   , a.nmbre_scrsal',
'        , case when (:P43_INDCDOR_CNVNIO_CRTRA_RVCDA = ''N'') then  ',
'            (select pkg_gf_convenios.fnc_cl_cartera_revocada (:F_CDGO_CLNTE, :P41_ID_SJTO_IMPSTO, a.id_orgen) from dual)',
'        else',
'        ''N''',
'        end as rvcda ,',
'        decode((select pkg_gf_convenios.fnc_cl_cartera_revocada (:F_CDGO_CLNTE, :P41_ID_SJTO_IMPSTO, a.id_orgen) from dual),''N'', ''No'',''Si'') dscpcion_rvcda   ',
'     from (',
'            select a.vgncia || a.prdo || a.cdgo_mvmnto_orgn || a.id_orgen as id',
'                 , a.vgncia',
'                 , a.prdo',
'                 , vlor_sldo_cptal',
'                 , case ',
'                    when :P43_INSLVNCIA = ''S''  and :P43_CLCLA_INTRES = ''N'' then ',
'                           0',
'                     when :P43_INSLVNCIA = ''S''  and :P43_CLCLA_INTRES = ''S''  and :P43_FCHA_CNGLA_INTRES is not null then ',
'                       pkg_gf_movimientos_financiero.fnc_cl_interes_mora (  p_cdgo_clnte         =>  a.cdgo_clnte,',
'                                                                             p_id_impsto          =>  a.id_impsto,',
'                                                                             p_id_impsto_sbmpsto  =>  a.id_impsto_sbmpsto,',
'                                                                             p_vgncia             =>  a.vgncia,',
'                                                                             p_id_prdo            =>  a.id_prdo,',
'                                                                             p_id_cncpto          =>  a.id_cncpto,',
'                                                                             p_cdgo_mvmnto_orgn   =>  a.cdgo_mvmnto_orgn,',
'                                                                             p_id_orgen           =>  a.id_orgen,',
'                                                                             p_vlor_cptal         =>  a.vlor_sldo_cptal ,',
'                                                                             p_indcdor_clclo      =>  ''CLD'',',
'                                                                             p_fcha_pryccion      =>  :P43_FCHA_CNGLA_INTRES)',
'                      when gnra_intres_mra = ''S'' then ',
'                        pkg_gf_movimientos_financiero.fnc_cl_interes_mora (  p_cdgo_clnte         =>  a.cdgo_clnte,',
'                                                                             p_id_impsto          =>  a.id_impsto,',
'                                                                             p_id_impsto_sbmpsto  =>  a.id_impsto_sbmpsto,',
'                                                                             p_vgncia             =>  a.vgncia,',
'                                                                             p_id_prdo            =>  a.id_prdo,',
'                                                                             p_id_cncpto          =>  a.id_cncpto,',
'                                                                             p_cdgo_mvmnto_orgn   =>  a.cdgo_mvmnto_orgn,',
'                                                                             p_id_orgen           =>  a.id_orgen,',
'                                                                             p_vlor_cptal         =>  a.vlor_sldo_cptal ,',
'                                                                             p_indcdor_clclo      =>  ''CLD'',',
'                                                                             p_fcha_pryccion      =>  sysdate)',
'                    else',
'                        0',
'                   end as           vlor_intres',
'                 , a.vgncia         vgncia_pryccion',
'                 , a.id_orgen',
'                 , a.cdgo_mvmnto_orgn',
'               --  , a.nmbre_scrsal',
'              from v_gf_g_cartera_x_concepto        a',
'                  left join gf_g_proyecciones_cartera        b on b.id_pryccion = :P41_ID_PRYCCION',
'                        and b.vgncia                         = a.vgncia',
'                        and b.id_prdo                        = a.id_prdo',
'                         and b.id_cncpto                     = a.id_cncpto',
'                         and b.id_orgen                      = a.id_orgen',
'             where a.cdgo_clnte                     = :F_CDGO_CLNTE',
'               and a.id_impsto                      = :P41_ID_IMPSTO',
'               and a.id_impsto_sbmpsto              = :P41_ID_IMPSTO_SBMPSTO',
'               and a.id_sjto_impsto                 = :P41_ID_SJTO_IMPSTO',
'               and (a.cdgo_mvnt_fncro_estdo         = ''NO'' or b.id_pryccion is not null)',
'           order by a.vgncia',
'                  , a.prdo',
'     ) a',
' where a.vlor_sldo_cptal > 0',
' group by id',
'        , a.vgncia',
'        , a.prdo',
'        , a.vgncia_pryccion',
'        , a.id_orgen',
'        , a.cdgo_mvmnto_orgn',
'    --    , a.nmbre_scrsal',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18375131102363808)
,p_name=>'RVCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RVCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18375228480363809)
,p_name=>'DSCPCION_RVCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCPCION_RVCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BF Cartera <br>Revocada ?')
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
 p_id=>wwv_flow_api.id(29098720929667801)
,p_name=>'VGNCIA_PRYCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_PRYCCION'
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
 p_id=>wwv_flow_api.id(42345018333115419)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(42345180956115420)
,p_name=>'Selector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43327918002292144)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(43328025442292145)
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43328188616292146)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(43328274284292147)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Interes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(47971733879622302)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Or\00EDgen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(47971891313622303)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
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
 p_id=>wwv_flow_api.id(65764749203864610)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(43327803642292143)
,p_internal_uid=>43327803642292143
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(43916525164782770)
,p_interactive_grid_id=>wwv_flow_api.id(43327803642292143)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(43916670884782771)
,p_report_id=>wwv_flow_api.id(43916525164782770)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18395821522536055)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(18375131102363808)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18396390735536062)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(18375228480363809)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29104872448667972)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(29098720929667801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43917101494782773)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(43327918002292144)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43917699168782776)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(43328025442292145)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43918190286782778)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(43328188616292146)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43918620902782779)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(43328274284292147)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44266007314331705)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(42345018333115419)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48018367017198926)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(47971733879622302)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48025480009356946)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(47971891313622303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(65894816303029794)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(65764749203864610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(143931000004)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_execution_seq=>5
,p_name=>'Carteras Revocadas'
,p_background_color=>'#99CCFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(18375228480363809)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Si'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(103210000050)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(43328188616292146)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(202897002091)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(43328274284292147)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(307173002091)
,p_view_id=>wwv_flow_api.id(43916670884782771)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(42345018333115419)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44673097928380803)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
unistr('    <p align="justify"> Funcionalidad de Proyecci\00F3n de Acuerdos de Pago.<br> '),
'        <b> <center> Paso 2 Seleccionar Cartera </center> </b> <br>',
'        Se muestran las vigencias con saldo aptas para ser parte de un acuerdo de pago. <br> <br>',
unistr('        De acuerdo al tipo de acuerdo de pago seleccionado, se deber\00E1n seleccionar todas las vigencias o s\00F3lo algunas.<br>   '),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43451749020066310)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(43449999092066309)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP,41,43,53,44,72::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43452080506066310)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(43449999092066309)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43451937249066310)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(43449999092066309)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(43453554492066311)
,p_branch_name=>'Go To Page 44 - Datos del Convenio'
,p_branch_action=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:44::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43452080506066310)
,p_branch_sequence=>20
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50984049150826230)
,p_branch_name=>'Go To Page 53 - Cuota Inicial'
,p_branch_action=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43452080506066310)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(43452858636066311)
,p_branch_name=>unistr('Ir a P\00E1gina 41 - Sujeto Impuesto')
,p_branch_action=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43451937249066310)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2829451282023212)
,p_name=>'P43_VGNCIA_PRDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18374992563363806)
,p_name=>'P43_INDCDOR_CNVNIO_CRTRA_RVCDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23375506040392708)
,p_name=>'P43_CLCLA_INTRES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFCobra Inter\00E9s?')
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>2
,p_grid_column=>2
,p_display_when=>'P43_INSLVNCIA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23375617237392709)
,p_name=>'P43_FCHA_CNGLA_INTRES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_prompt=>unistr('Fecha Congela Inter\00E9s')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P43_INSLVNCIA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha hasta cuando se va a realizar el c\00E1lculo de los intereses.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23375758528392710)
,p_name=>'P43_INSLVNCIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23375868769392711)
,p_name=>'P43_FCHA_RSLCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_prompt=>unistr('Fecha Resoluci\00F3n')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P43_INSLVNCIA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de la resoluci\00F3n para el c\00E1lculo de los intereses.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23375925237392712)
,p_name=>'P43_NMRO_RSLCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_prompt=>unistr('No. Resoluci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P43_INSLVNCIA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('No. Resoluci\00F3n')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42345220766115421)
,p_name=>'P43_NMRO_VGNCIA_SLCCNDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65764985154864612)
,p_name=>'P43_PRDOS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74767263555437904)
,p_name=>'P43_RANGO_DEUDA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(43450098909066309)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29122112357837702)
,p_computation_sequence=>10
,p_computation_item=>'P43_VGNCIA_PRDO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg( json_object(key ''VGNCIA'' is a.vgncia,',
'                                  key ''PRDO'' is a.prdo,',
'                                  key ''ID_ORGEN'' is a.id_orgen,',
'                                  key ''CDGO_MVMNTO_ORGEN'' is a.cdgo_mvmnto_orgen)) json',
'  from (select vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'          from v_gf_g_proyecciones_cartera',
'         where id_pryccion = :P41_ID_PRYCCION',
'        group by vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'        )a;'))
,p_compute_when=>'P43_VGNCIA_PRDO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(74767351544437905)
,p_computation_sequence=>20
,p_computation_item=>'P43_RANGO_DEUDA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select rngo_vgncia',
'     from gf_d_convenios_tipo',
'    where id_cnvnio_tpo        = :P41_ID_CNVNIO_TPO'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18375037484363807)
,p_computation_sequence=>30
,p_computation_item=>'P43_INDCDOR_CNVNIO_CRTRA_RVCDA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_cnvnio_crtra_rvcda',
'from gf_d_convenios_cnfgrcion',
'where cdgo_clnte = :F_CDGO_CLNTE;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(42345562506115424)
,p_validation_name=>unistr('Selecci\00F3n una o mas Vigencias-Periodo')
,p_validation_sequence=>10
,p_validation=>'P43_VGNCIA_PRDO'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>unistr('Debe seleccionar una o m\00E1s Vigencias para poder continuar')
,p_when_button_pressed=>wwv_flow_api.id(43452080506066310)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(54618549546142108)
,p_validation_name=>'Validar Cartera Convenida'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_vgncia_crtra            varchar2(2000);',
'    v_cntdad_orgen_cnvnda     number;',
'    v_cntdad_slccndos         number;',
'    ',
'begin',
'    ',
'   select count(1)',
'     into v_cntdad_slccndos',
'     from json_table (:P43_VGNCIA_PRDO, ''$[*]'' columns (id_orgen   path ''$.ID_ORGEN''',
'                                                       ,vgncia    path ''$.VGNCIA''  ',
'                                                       ,prdo      path ''$.PRDO''',
'                                                     )',
'                     )b ;',
'                                  ',
'    select listagg(a.id_orgen, '','') within group (order by a.id_orgen), count(c.id_orgen)',
'      into v_vgncia_crtra, v_cntdad_orgen_cnvnda',
'      from v_gf_g_convenios_cartera a',
'      join gf_g_proyecciones_cartera b on b.id_pryccion = :P41_ID_PRYCCION',
'                                     and b.vgncia = a.vgncia',
'                                     and b.id_prdo = a.id_prdo',
'                                     and b.id_orgen = a.id_orgen',
'      left join json_table (:P43_VGNCIA_PRDO, ''$[*]'' columns (id_orgen   path ''$.ID_ORGEN''',
'                                                         ,vgncia    path ''$.VGNCIA''  ',
'                                                         ,prdo      path ''$.PRDO''',
'                                                        )',
'                        )c on a.id_orgen    = c.id_orgen',
'                          and a.vgncia      = c.vgncia',
'                          and a.prdo        = c.prdo',
'     where a.cdgo_cnvnio_estdo = ''APL'';',
'     ',
'    if (v_vgncia_crtra is not null) then',
'        if (v_cntdad_orgen_cnvnda <> v_cntdad_slccndos) then',
unistr('            return ''la cartera se encuentra convenida para los or\00EDgenes ''|| v_vgncia_crtra||''. S\00ED desea realice una nueva proyecci\00F3n para las vigencias restantes''; '),
'        else',
unistr('            return ''la cartera se encuentra convenida para los or\00EDgenes ''|| v_vgncia_crtra; '),
'        end if;        ',
'    else',
'        return null;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(43452080506066310)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23376451219392717)
,p_validation_name=>'Valida fecha en que se congelan los intereses si es acuerdo de insolvencia'
,p_validation_sequence=>30
,p_validation=>'P43_FCHA_CNGLA_INTRES'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor registre la fecha desde la cual se van a congelar los intereses.'
,p_validation_condition=>':P43_INSLVNCIA = ''S'' and :P43_CLCLA_INTRES = ''S'''
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(43452080506066310)
,p_associated_item=>wwv_flow_api.id(23375617237392709)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23376729936392720)
,p_validation_name=>'Valida  que la fecha de resolucion  no sea nula si es acuerdo de insolvencia'
,p_validation_sequence=>40
,p_validation=>'P43_FCHA_RSLCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor registre la fecha de la resoluci\00F3n')
,p_validation_condition=>':P43_INSLVNCIA = ''S'''
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(43452080506066310)
,p_associated_item=>wwv_flow_api.id(23375868769392711)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23376830133392721)
,p_validation_name=>'Valida numero resolucion no sea nulo si es acuerdo de insolvencia'
,p_validation_sequence=>50
,p_validation=>'P43_NMRO_RSLCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor registre la n\00FAmero de la resoluci\00F3n')
,p_validation_condition=>':P43_INSLVNCIA = ''S'''
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(43452080506066310)
,p_associated_item=>wwv_flow_api.id(23375925237392712)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42345396551115422)
,p_name=>'Al seleccionar las vigencias'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(43450098909066309)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42345477699115423)
,p_event_id=>wwv_flow_api.id(42345396551115422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.data.selectedRecords.length > 0) {',
'    var model = this.data.model;',
'    var records = this.data.selectedRecords; ',
'    var ids="";',
'    var vgncia_prdo="";',
'    ',
'        // Solo permite seleccionar las cartereas que no han sido revocadas',
'        records = records.filter(function (record) {',
'                return ( [''N''].includes( model.getValue(record, "RVCDA")) ) ',
'             });',
' ',
'  // console.log ("records --> " , records);',
'    ',
'    var json = records.map(function (record){',
'        ids += model.getValue( record, ''ID'' ) + '':'';',
'        vgncia_prdo += model.getValue( record, ''VGNCIA'' ) + model.getValue( record, ''PRDO'' ) + '':'';',
'        return {''VGNCIA'':  parseFloat(model.getValue(record, ''VGNCIA'')),',
'                ''PRDO'':  parseFloat(model.getValue(record, ''PRDO'')),',
'                ''CDGO_MVMNTO_ORGN'':  model.getValue(record, ''CDGO_MVMNTO_ORGN''),',
'                ''ID_ORGEN'': model.getValue(record, ''ID_ORGEN'' )',
'               };',
'    });',
'       ',
'      $s(''P43_PRDOS'', vgncia_prdo);',
'      $s(''P43_VGNCIA_PRDO'', ids); ',
'    ',
'    //Seleccionamos los item no procesados en el interactive grid ',
'   apex.region("deuda").widget().interactiveGrid("setSelectedRecords", records);',
'    ',
'}else{',
'    $s(''P43_VGNCIA_PRDO'', null);',
'}',
'',
' if($v(''P43_RNGO_VGNCIA'') == ''T'' ){',
'      apex.region("deuda").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");    ',
' }',
'',
'//if(this.data.selectedRecords.length > 0) {',
'//    var model = this.data.model;',
'//    var records = this.data.selectedRecords; ',
'//    var ids="";',
'//    var vgncia_prdo="";',
'//    ',
'//    var json = records.map(function (record){',
'//        ids += model.getValue( record, ''ID'' ) + '':'';',
'//        vgncia_prdo += model.getValue( record, ''VGNCIA'' ) + model.getValue( record, ''PRDO'' ) + '':'';',
'//        return {''VGNCIA'':  parseFloat(model.getValue(record, ''VGNCIA'')),',
'//                ''PRDO'':  parseFloat(model.getValue(record, ''PRDO'')),',
'//                ''CDGO_MVMNTO_ORGN'':  model.getValue(record, ''CDGO_MVMNTO_ORGN''),',
'//                ''ID_ORGEN'': model.getValue(record, ''ID_ORGEN'' )',
'//               };',
'//    });',
'//       ',
'//      $s(''P43_PRDOS'', vgncia_prdo);',
'//      $s(''P43_VGNCIA_PRDO'', ids);',
'//}else{',
'//    $s(''P43_VGNCIA_PRDO'', null);',
'//}',
'//',
'//if($v(''P43_RNGO_VGNCIA'') == ''T'' ){',
'//      apex.region("deuda").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");    ',
'//}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23376038838392713)
,p_name=>'Cuando cambie si genera o no Intereses de Mora en el caso de la insolvencia'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P43_CLCLA_INTRES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23376194639392714)
,p_event_id=>wwv_flow_api.id(23376038838392713)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23376262659392715)
,p_name=>'Cuando cambie la fecha para congelar los intereses'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P43_FCHA_CNGLA_INTRES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23376394083392716)
,p_event_id=>wwv_flow_api.id(23376262659392715)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23376570054392718)
,p_name=>unistr('Cuando cambie la fecha de resoluci\00F3n')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P43_FCHA_RSLCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23376662562392719)
,p_event_id=>wwv_flow_api.id(23376570054392718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23376952847392722)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar tipo de convenio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select rngo_vgncia,         indcdor_inslvncia',
'    into   :P43_RANGO_DEUDA ,   :P43_INSLVNCIA',
'    from gf_d_convenios_tipo',
'    where id_cnvnio_tpo        = :P41_ID_CNVNIO_TPO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P41_ID_CNVNIO_TPO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
