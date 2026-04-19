prompt --application/pages/page_00069
begin
wwv_flow_api.create_page(
 p_id=>69
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Acuerdo de Pago - Cartera'
,p_step_title=>'Acuerdo de Pago - Cartera'
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
'    if($v(''P69_VGNCIA_PRDO'')){',
'        try{',
'            // convierte en tipo json',
'            vgncia_prdo = JSON.parse($v(''P69_VGNCIA_PRDO''));                    ',
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
'',
'/*function apenascargue(){',
'    var view = apex.region("deudas").widget().interactiveGrid("getCurrentView"),',
'    model = view.model;      ',
'    var seleccionados = $v("P69_VGNCIA_PRDO");',
'    var arrSeleccionados = seleccionados.split('':'').map((f) =>{',
'        return model._data.filter((data) => {',
'                var arr =f.split('','');',
'                return model.getValue(data, ''VGNCIA'') === arr[0] &&  model.getValue(data, ''PRDO'') === arr[1]',
'            })[0]',
'    }).filter(f => f);',
'        view.setSelectedRecords(arrSeleccionados); ',
'}',
'',
'function VigenciasSeleccionadas() {',
'    var i, records, record, sal, model,',
'        vgncia_prdo = '''',',
'        num_vigencias_seleccionadas = 0,',
'        view = apex.region("deudas").widget().interactiveGrid("getCurrentView");',
'        model = view.model;',
'        records = view.getSelectedRecords();',
'        if ( records.length > 0 ) { ',
'            for ( i = 0; i < records.length; i++ ) {',
'                record = records[i];',
'                console.log(i, record);',
'                num_vigencias_seleccionadas = num_vigencias_seleccionadas + 1; ',
'                 console.log(i, num_vigencias_seleccionadas);',
'                vgncia_prdo = vgncia_prdo + '':'' + parseFloat(model.getValue(record, "VGNCIA")) + '',''+ parseFloat(model.getValue(record, "PRDO")) + '','' + parseFloat(model.getValue(record, "ID_ORGEN"));',
'                console.log(i, vgncia_prdo);',
'           }               ',
'        } ',
'',
'         $s("P69_NMRO_VGNCIA_SLCCNDA", num_vigencias_seleccionadas);',
'         $s("P69_VGNCIA_PRDO", vgncia_prdo.substr(1, vgncia_prdo.length));',
'        console.log($v(''P69_VGNCIA_PRDO''));',
'}*/',
'',
' '))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buttonCollapse(''t_Button_rightControlButton'');',
'apenascargue();',
'',
'if($v(''P69_ID_CNVNIO'')){',
'    if ($v(''P69_INDCDOR_RQRE_CTA_INCIAL'')=== ''S''){',
'        apex.item(''cuotaInicial'').show();     ',
'    }else{',
'        apex.item(''cuotaInicial'').hide();',
'    }        ',
'} ',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_VALIDAR_DOCUMENTO{',
'    padding: 0.3rem !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20250506182824'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116988723649787379)
,p_plug_name=>'Cartera'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(73655524996021574)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56843645043326705)
,p_plug_name=>'Tipo Acuerdo'
,p_region_name=>'tipoAcuerdo'
,p_parent_plug_id=>wwv_flow_api.id(116988723649787379)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116988823466787379)
,p_plug_name=>'Cartera'
,p_region_name=>'deudas'
,p_parent_plug_id=>wwv_flow_api.id(116988723649787379)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(nvl(a.vlor_sldo_cptal,0))                                vlor_sldo_cptal',
'        , sum(nvl(a.vlor_intres,0))                                 vlor_intres',
'        , sum(nvl(a.vlor_sldo_cptal,0)) + sum(nvl(a.vlor_intres,0)) vlor_ttal',
'        , a.vgncia',
'        , a.prdo',
'        , a.id_orgen ',
'        , a.cdgo_mvmnto_orgn ',
'        , a.vgncia || a.prdo || a.cdgo_mvmnto_orgn || a.id_orgen as id',
'        , case when (:P69_INDCDOR_CNVNIO_CRTRA_RVCDA = ''N'') then  ',
'				(select pkg_gf_convenios.fnc_cl_cartera_revocada (:F_CDGO_CLNTE, :P52_ID_SJTO_IMPSTO, a.id_orgen) from dual)',
'		 else',
'			''N''',
'		end as rvcda,',
'		decode((select pkg_gf_convenios.fnc_cl_cartera_revocada (:F_CDGO_CLNTE, :P52_ID_SJTO_IMPSTO, a.id_orgen) from dual),''N'', ''No'',''Si'') dscpcion_rvcda       ',
'        from ( select a.vgncia || a.prdo || a.cdgo_mvmnto_orgn || a.id_orgen as id',
'                 , a.vgncia',
'                 , a.prdo',
'                 , a.vlor_sldo_cptal',
'                 , case ',
'                     when :P69_INSLVNCIA = ''S''  and :P69_CLCLA_INTRES = ''N'' then ',
'                           0',
'                     when :P69_INSLVNCIA = ''S''  and :P69_CLCLA_INTRES = ''S''  and :P69_FCHA_CNGLA_INTRES is not null then ',
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
'                                                                             p_fcha_pryccion      =>  :P69_FCHA_CNGLA_INTRES)',
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
'					, a.vgncia      vgncia_pryccion',
'					, a.id_orgen',
'					, a.cdgo_mvmnto_orgn',
'                   from v_gf_g_cartera_x_concepto    a',
'                 -- left join gf_g_convenios_cartera  b on a.vgncia = b.vgncia',
'                --    and a.id_prdo         = b.id_prdo',
'                --    and a.id_orgen        = b.id_orgen',
'                  --  and a.id_cncpto       = b.id_cncpto',
'				   where a.id_sjto_impsto = :P52_ID_SJTO_IMPSTO',
'						and a.id_impsto                  = :P52_ID_IMPSTO',
'						and a.id_impsto_sbmpsto          = :P52_ID_IMPSTO_SBMPSTO',
'						and a.cdgo_mvnt_fncro_estdo      = ''NO''',
'						and a.vlor_sldo_cptal            > 0 ) a',
' group by a.vgncia',
'        , a.prdo',
'        , a.id_orgen',
'        , a.id_orgen',
'        , a.cdgo_mvmnto_orgn'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2701494886835602)
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
 p_id=>wwv_flow_api.id(18593285311249101)
,p_name=>'RVCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RVCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18593309729249102)
,p_name=>'DSCPCION_RVCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCPCION_RVCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BF Cartera <br>Revocada ?')
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
 p_id=>wwv_flow_api.id(47971676529622301)
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
 p_id=>wwv_flow_api.id(48492474633134001)
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
 p_id=>wwv_flow_api.id(115883742890836489)
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
 p_id=>wwv_flow_api.id(115883905513836490)
,p_name=>'Selector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116866642560013214)
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
 p_id=>wwv_flow_api.id(116866750000013215)
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
 p_id=>wwv_flow_api.id(116866913174013216)
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
 p_id=>wwv_flow_api.id(116866998842013217)
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
 p_id=>wwv_flow_api.id(116866528200013213)
,p_internal_uid=>116866528200013213
,p_is_editable=>false
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
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(117455249722503840)
,p_interactive_grid_id=>wwv_flow_api.id(116866528200013213)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(117455395442503841)
,p_report_id=>wwv_flow_api.id(117455249722503840)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2710934376955849)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(2701494886835602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18599246598249334)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(18593285311249101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18599779261249338)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(18593309729249102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47977623142622724)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(47971676529622301)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48498486770134208)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(48492474633134001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117455826052503843)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(116866642560013214)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117456423726503846)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(116866750000013215)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117456914844503848)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(116866913174013216)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117457345460503849)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(116866998842013217)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117804731872052775)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(115883742890836489)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(72429000001)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_execution_seq=>5
,p_name=>'Carteras Revocadas'
,p_background_color=>'#99CCFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(18593309729249102)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Si'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(55500000016)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(116866913174013216)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(144775000016)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(116866998842013217)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(249328000016)
,p_view_id=>wwv_flow_api.id(117455395442503841)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(115883742890836489)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(126053023664874597)
,p_plug_name=>'Datos Cuota Inicial'
,p_region_name=>'cuotaInicial'
,p_parent_plug_id=>wwv_flow_api.id(116988723649787379)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13684489010795116)
,p_plug_name=>'Documentos de Cuota Incicial'
,p_parent_plug_id=>wwv_flow_api.id(126053023664874597)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id,',
'         n001 id_dcmnto,',
'         b.nmro_dcmnto,',
'         b.fcha_dcmnto,',
'         b.fcha_vncmnto,',
'         b.vlor_ttal_dcmnto,',
'         b.dscrpcion_indcdor_pgo_aplcdo',
'   from apex_collections       a',
'   join v_re_g_documentos      b on a.n001 = b.id_dcmnto',
'    and a.n002                 = :F_ID_INSTNCIA_FLJO',
'  where collection_name        = ''DOCUMENTO_CTA_INICIAL'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'     from apex_collections       a',
'     join v_re_g_documentos      b on a.n001 = b.id_dcmnto',
'      and a.n002                 = :F_ID_INSTNCIA_FLJO',
'    where collection_name        = ''DOCUMENTO_CTA_INICIAL'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13684604384795118)
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
 p_id=>wwv_flow_api.id(13684790116795119)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Vencimiento'
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
 p_id=>wwv_flow_api.id(13684852714795120)
,p_name=>'VLOR_TTAL_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor del Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(13684939249795121)
,p_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFDocuemento Pagado?')
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
 p_id=>wwv_flow_api.id(13685045740795122)
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
 p_id=>wwv_flow_api.id(13685121640795123)
,p_name=>'FCHA_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DCMNTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Documento'
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
 p_id=>wwv_flow_api.id(13685522461795127)
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
 p_id=>wwv_flow_api.id(13685696821795128)
,p_name=>'Eliminar Documento'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=&APP_ID.:69:&SESSION.:ELIMINAR_DOCUMENTO:&DEBUG.:RP:P69_SEQ_ID,P69_NMRO_DCMNTO:&SEQ_ID.,&NMRO_DCMNTO.'
,p_link_text=>'<span aria-hidden="true" class="fa fa-trash" style="color: red;" ></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(13684599759795117)
,p_internal_uid=>13684599759795117
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
 p_id=>wwv_flow_api.id(14276307515003548)
,p_interactive_grid_id=>wwv_flow_api.id(13684599759795117)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(14276428783003549)
,p_report_id=>wwv_flow_api.id(14276307515003548)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14276907568003563)
,p_view_id=>wwv_flow_api.id(14276428783003549)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(13684604384795118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14277428212003574)
,p_view_id=>wwv_flow_api.id(14276428783003549)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(13684790116795119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14277952249003576)
,p_view_id=>wwv_flow_api.id(14276428783003549)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(13684852714795120)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14278488347003578)
,p_view_id=>wwv_flow_api.id(14276428783003549)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(13684939249795121)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14278900839003580)
,p_view_id=>wwv_flow_api.id(14276428783003549)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(13685045740795122)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14280162836006056)
,p_view_id=>wwv_flow_api.id(14276428783003549)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(13685121640795123)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14294657862091243)
,p_view_id=>wwv_flow_api.id(14276428783003549)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(13685522461795127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14299893545102833)
,p_view_id=>wwv_flow_api.id(14276428783003549)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(13685696821795128)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161405712673075801)
,p_plug_name=>'Insolvencia'
,p_parent_plug_id=>wwv_flow_api.id(116988723649787379)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P69_INSLVNCIA'
,p_plug_display_when_cond2=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118211822486101873)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73548349881728602)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(126053023664874597)
,p_button_name=>'BTN_VALIDAR_DOCUMENTO'
,p_button_static_id=>'BTN_VALIDAR_DOCUMENTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Validar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus-square'
,p_grid_column_attributes=>'style="margin-top:4px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>4
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73539401115721081)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(116988723649787379)
,p_button_name=>'CANCEL'
,p_button_static_id=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Ã‚Â¿EstÃƒÂ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCEL'')'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73540285547721084)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(116988723649787379)
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
 p_id=>wwv_flow_api.id(73539880467721083)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(116988723649787379)
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
 p_id=>wwv_flow_api.id(73547919285721112)
,p_branch_name=>'Go To Page 73 - Extracto'
,p_branch_action=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_BRANCH:&P69_BRANCH.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73540285547721084)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55219748632099601)
,p_branch_name=>unistr('Ir a P\00E1gina')
,p_branch_action=>'f?p=&APP_ID.:&P69_BRANCH.:&SESSION.::&DEBUG.:RP,41,44,43,53,72::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73539401115721081)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(73547188748721111)
,p_branch_name=>unistr('Ir a P\00E1gina 52- Informaci\00F3n B\00E1sica')
,p_branch_action=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73539880467721083)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13685765536795129)
,p_name=>'P69_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(13684489010795116)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18480385859405801)
,p_name=>'P69_INDCDOR_CNVNIO_CRTRA_RVCDA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(116988823466787379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23377206673392725)
,p_name=>'P69_INSLVNCIA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23377326239392726)
,p_name=>'P69_CLCLA_INTRES'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(161405712673075801)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFCobra Inter\00E9s?')
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_display_when=>'P69_INSLVNCIA'
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
 p_id=>wwv_flow_api.id(23377692383392729)
,p_name=>'P69_FCHA_CNGLA_INTRES'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(161405712673075801)
,p_prompt=>unistr('Fecha Congela Inter\00E9s')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P69_INSLVNCIA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23378055796392733)
,p_name=>'P69_FCHA_RSLCION'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(161405712673075801)
,p_prompt=>unistr('Fecha Resoluci\00F3n')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P69_INSLVNCIA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de la resoluci\00F3n para el c\00E1lculo de los intereses.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23378555340392738)
,p_name=>'P69_NMRO_RSLCION'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(161405712673075801)
,p_prompt=>unistr('No. Resoluci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P69_INSLVNCIA'
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
 p_id=>wwv_flow_api.id(56843478409326703)
,p_name=>'P69_INDCDOR_RQRE_CTA_INCIAL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73543928065721093)
,p_name=>'P69_NMRO_VGNCIA_SLCCNDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(116988823466787379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73544310347721096)
,p_name=>'P69_VGNCIA_PRDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(116988823466787379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73548281660728601)
,p_name=>'P69_NMRO_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_prompt=>unistr('N\00B0 Documento')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Dig\00EDte el n\00FAmero de acuerdo de pago')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73548700759728606)
,p_name=>'P69_VLOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_prompt=>'Valor Pagado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_display_when=>'P69_ID_DCMNTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Valor de la Cuota Inicial'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73548890972728607)
,p_name=>'P69_FCHA_RCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_prompt=>'Fecha de Recaudo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P69_ID_DCMNTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha de Recaudo de la Cuota Inicial.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73549891814728617)
,p_name=>'P69_INDCDOR_TNE_PRYCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFTiene Proyecci\00F3n?')
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>'P69_ID_DCMNTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si existe proyecci\00F3n de acuerdo de pago.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73549969220728618)
,p_name=>'P69_NMRO_PRYCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_prompt=>unistr('N\00B0 Proyecci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P69_ID_DCMNTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de Proyecci\00F3n del acuerdo de pago.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73550022538728619)
,p_name=>'P69_FCHA_PRYCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_prompt=>unistr('Fecha Proyecci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P69_ID_DCMNTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha de registro de la proyecci\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73550306178728622)
,p_name=>'P69_ID_DCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73551083373728629)
,p_name=>'P69_ID_CNVNIO_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(56843645043326705)
,p_prompt=>'Tipo de Acuerdo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_select clob;    ',
'begin',
'    v_select := pkg_gf_convenios.fnc_cl_select_tipo_convenio (:F_CDGO_CLNTE, :P52_CDGO_SJTO_TPO, :P52_ID_SJTO_IMPSTO );',
'    return v_select;',
'end;',
''))
,p_lov_display_null=>'YES'
,p_colspan=>10
,p_read_only_when=>':P69_ID_CNVNIO is not null '
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de acuerdo de pago con el que se realiza la solicitud.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74403133385784103)
,p_name=>'P69_VLOR_CTA_INCIAL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75036231916223705)
,p_name=>'P69_RNGO_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(116988823466787379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87455535200384403)
,p_name=>'P69_ID_CNVNIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89188851750064936)
,p_name=>'P69_ID_INSTNCIA_FLJO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(116988723649787379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90799645124906105)
,p_name=>'P69_BRANCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(116988723649787379)
,p_item_default=>'47'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93192750027213902)
,p_name=>'P69_ID_PRYCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(126053023664874597)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(56843598477326704)
,p_computation_sequence=>10
,p_computation_item=>'P69_INDCDOR_RQRE_CTA_INCIAL'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_exge_cta_incial',
'  from gf_d_convenios_tipo',
' where id_cnvnio_tpo = :P69_ID_CNVNIO_TPO'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(33352037448064202)
,p_computation_sequence=>20
,p_computation_item=>'P69_VGNCIA_PRDO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg( json_object(key ''VGNCIA'' is a.vgncia,',
'                                  key ''PRDO'' is a.prdo,',
'                                  key ''ID_ORGEN'' is a.id_orgen,',
'                                  key ''CDGO_MVMNTO_ORGEN'' is a.cdgo_mvmnto_orgen)) json',
'  from (select vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'          from v_gf_g_proyecciones_cartera',
'         where id_pryccion= :P69_ID_PRYCCION',
'        group by vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'        )a;'))
,p_compute_when=>':P52_ID_CNVNIO is null and :P69_INDCDOR_TNE_PRYCCION = ''S'''
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(32487690298882301)
,p_computation_sequence=>30
,p_computation_item=>'P69_VGNCIA_PRDO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg( json_object(key ''VGNCIA'' is a.vgncia,',
'                                  key ''PRDO'' is a.prdo,',
'                                  key ''ID_ORGEN'' is a.id_orgen,',
'                                  key ''CDGO_MVMNTO_ORGEN'' is a.cdgo_mvmnto_orgen)) json',
'  from (select vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'          from v_gf_g_convenios_cartera',
'         where id_cnvnio = :P52_ID_CNVNIO',
'        group by vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'        )a;'))
,p_compute_when=>'P69_VGNCIA_PRDO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(89419717778082103)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P69_ID_INSTNCIA_FLJO'
,p_compute_when=>'P69_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(75036368073223706)
,p_computation_sequence=>20
,p_computation_item=>'P69_RNGO_VGNCIA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select rngo_vgncia',
'     from gf_d_convenios_tipo',
'    where id_cnvnio_tpo        = :P69_ID_CNVNIO_TPO'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18480493918405802)
,p_computation_sequence=>30
,p_computation_item=>'P69_INDCDOR_CNVNIO_CRTRA_RVCDA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_cnvnio_crtra_rvcda',
'from gf_d_convenios_cnfgrcion',
'where cdgo_clnte = :F_CDGO_CLNTE;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(75060770655031409)
,p_validation_name=>'Id del documento no nulo'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_indcdor_exge_cta_incial    varchar2(1)    := ''N'';',
'    v_count_dcmntos              number         := 0;',
'    ',
'begin ',
'    begin',
'        select indcdor_exge_cta_incial',
'          into v_indcdor_exge_cta_incial',
'          from gf_d_convenios_tipo ',
'         where id_cnvnio_tpo                   = :P69_ID_CNVNIO_TPO;',
'    exception',
'        when others then ',
'            v_indcdor_exge_cta_incial    := ''N'';',
'    end;',
'    ',
'    if v_indcdor_exge_cta_incial = ''S'' then ',
'        select count (n001) ',
'          into v_count_dcmntos',
'          from apex_collections ',
'         where collection_name      = ''DOCUMENTO_CTA_INICIAL''',
'           and n002                 = :F_ID_INSTNCIA_FLJO;',
'        if v_count_dcmntos > 0 then ',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe ingresar y validar un documento de cuota inicial'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(73540285547721084)
,p_associated_item=>wwv_flow_api.id(73548281660728601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73548614524728605)
,p_validation_name=>'Documento Nulo'
,p_validation_sequence=>20
,p_validation=>'P69_NMRO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Ingrese un N\00B0 Documento')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio_tpo ',
'   from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P69_ID_CNVNIO_TPO ',
'    and indcdor_exge_cta_incial = ''S''',
'    and (select count (n001) ',
'           from apex_collections ',
'           where collection_name        = ''DOCUMENTO_CTA_INICIAL''',
'             and n002                 = :F_ID_INSTNCIA_FLJO) = 0'))
,p_validation_condition_type=>'EXISTS'
,p_when_button_pressed=>wwv_flow_api.id(73540285547721084)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73548484554728603)
,p_validation_name=>unistr('\00BFDocumento Existe?')
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_dcmnto number;',
'    ',
'begin  ',
'    :P69_VLOR      := null;',
'    :P69_FCHA_RCDO := null;',
'    :P69_ID_DCMNTO := null;',
'',
'    begin ',
'        select id_dcmnto ',
'          into :P69_ID_DCMNTO',
'          from re_g_documentos',
'         where cdgo_clnte =          :F_CDGO_CLNTE',
'           and id_impsto =           :P52_ID_IMPSTO',
'           and id_impsto_sbmpsto =   :P52_ID_IMPSTO_SBMPSTO',
'           and id_sjto_impsto =      :P52_ID_SJTO_IMPSTO',
'           and nmro_dcmnto =         :P69_NMRO_DCMNTO;',
'           return true;',
'    exception ',
'        when no_data_found then ',
'            :P69_ID_DCMNTO    := null;',
'            :P69_VLOR         := null;',
'            :P69_FCHA_RCDO    := null;',
'            return false;',
'    end;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El Documento ingresado no existe o no pertenece al Sujeto '
,p_always_execute=>'Y'
,p_validation_condition=>'P69_NMRO_DCMNTO,BTN_VALIDAR_DOCUMENTO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(73548281660728601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73548564876728604)
,p_validation_name=>unistr('\00BFDocumento Pagado?')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_dcmnto number;',
'    v_id_rcdo    number;',
'    ',
'begin',
'    :P69_VLOR := '''';',
'    :P69_FCHA_RCDO := '''';',
'    ',
'    if :P69_INDCDOR_RQRE_CTA_INCIAL = ''S'' then ',
'        begin ',
'            select id_dcmnto ',
'              into v_id_dcmnto',
'              from re_g_documentos',
'             where cdgo_clnte = :F_CDGO_CLNTE',
'               and nmro_dcmnto = :P69_NMRO_DCMNTO;',
'        exception ',
'            when no_data_found then ',
'                    v_id_rcdo       := null;',
'                    :P69_VLOR       := null;',
'                    :P69_FCHA_RCDO  := null;',
'                return false;',
'        end;',
'',
'        if v_id_dcmnto > 0 then ',
'',
'            begin ',
'                select id_rcdo,',
'                      /* vlor vlor_cta_incial, ',
'                       to_char(vlor,:F_FRMTO_MNDA), */',
'                       to_char(fcha_rcdo,''DD/MM/YYYY''), ',
'                       id_rcdo',
'                  into v_id_rcdo,',
'                     /* :P69_VLOR_CTA_INCIAL, ',
'                       :P69_VLOR, */',
'                       :P69_FCHA_RCDO, ',
'                       :P69_NMRO_PRYCCION',
'                  from re_g_recaudos  ',
'                 where id_orgen        = v_id_dcmnto',
'                   and cdgo_rcdo_estdo = ''AP''',
'                   and rownum = 1;',
'',
'                 begin ',
'                       select ''S'', ',
'                              nmro_pryccion, ',
'                              fcha_pryccion, ',
'                              id_cnvnio_tpo',
'                        into :P69_INDCDOR_TNE_PRYCCION, ',
'                             :P69_NMRO_PRYCCION, ',
'                             :P69_FCHA_PRYCCION, ',
'                             :P69_ID_CNVNIO_TPO',
'                         from v_gf_g_proyecciones ',
'                        where cdgo_clnte          = :F_CDGO_CLNTE',
'                          and id_pryccion         = (select max(id_pryccion) ',
'                                                       from v_gf_g_proyecciones ',
'                                                      where nmro_dcmnto         = :P69_NMRO_DCMNTO',
'                                                        and cdgo_clnte          = :F_CDGO_CLNTE);           ',
'                   exception ',
'                        when no_data_found then ',
'                            :P69_INDCDOR_TNE_PRYCCION := ''N'';',
'                            :P69_NMRO_PRYCCION := null;',
'                            :P69_FCHA_PRYCCION := null;',
'                   end;',
'',
'            exception ',
'                when no_data_found then ',
'                     v_id_rcdo       := null;',
'                    :P69_VLOR       := null;',
'                    :P69_FCHA_RCDO  := null;',
'                    :P69_FCHA_PRYCCION := null;',
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
,p_validation_condition=>'BTN_VALIDAR_DOCUMENTO,P69_NMRO_DCMNTO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(73548281660728601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73545823893721110)
,p_validation_name=>unistr('Selecci\00F3n una o mas Vigencias-Periodo')
,p_validation_sequence=>50
,p_validation=>'P69_VGNCIA_PRDO'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>unistr('Debe seleccionar una o m\00E1s Vigencias para poder continuar')
,p_when_button_pressed=>wwv_flow_api.id(73540285547721084)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(113059070436229702)
,p_validation_name=>'Solicitudes Anteriores'
,p_validation_sequence=>60
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
'                              from  json_table(:P69_VGNCIA_PRDO, ''$[*]'' ',
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
'               join v_gf_g_convenios_cartera b on a.id_cnvnio = b.id_cnvnio',
'              where a.id_sjto_impsto = :P52_ID_SJTO_IMPSTO',
'                and a.cdgo_cnvnio_estdo in (''SLC'', ''APB'', ''APL'')',
'                and a.id_cnvnio != :P52_ID_CNVNIO',
'                and b.vgncia = c_vgncia_prdio.vgncia',
'                and b.prdo = c_vgncia_prdio.prdo',
'                and b.id_orgen = c_vgncia_prdio.id_orgen',
'                and b.cdgo_mvmnto_orgen = c_vgncia_prdio.cdgo_mvmnto_orgn',
'                order by id_cnvnio, vgncia, id_prdo; ',
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
,p_validation_condition=>'P69_VGNCIA_PRDO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(73540285547721084)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(56662196423224301)
,p_validation_name=>'Valida Activo'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from gf_d_convenios_tipo',
'  where id_cnvnio_tpo = :P69_ID_CNVNIO_TPO',
'    and actvo = ''S'''))
,p_validation_type=>'EXISTS'
,p_error_message=>'Tipo de Acuerdo de Pago Inactivo'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(73540285547721084)
,p_associated_item=>wwv_flow_api.id(73551083373728629)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13685308827795125)
,p_validation_name=>'Documento No Repetido en la Coleccion'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select n001 id_dcmnto',
'   from apex_collections    a',
'   join re_g_documentos     b on a.n001 = b.id_dcmnto',
'  where collection_name = ''DOCUMENTO_CTA_INICIAL''',
'    and b.cdgo_clnte    = :F_CDGO_CLNTE',
'    and b.nmro_dcmnto   = :P69_NMRO_DCMNTO',
'    and a.n002          = :F_ID_INSTNCIA_FLJO'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El Documento Ingresado ya se encuentra registrado'
,p_when_button_pressed=>wwv_flow_api.id(73548349881728602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23377942315392732)
,p_validation_name=>'Valida fecha en que se congelan los intereses si es acuerdo de insolvencia'
,p_validation_sequence=>90
,p_validation=>'P69_FCHA_CNGLA_INTRES'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor registre la fecha desde la cual se van a congelar los intereses.'
,p_validation_condition=>':P69_INSLVNCIA = ''S'' and :P69_CLCLA_INTRES = ''S'''
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(73540285547721084)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23378392307392736)
,p_validation_name=>'Valida  que la fecha de resolucion  no sea nula si es acuerdo de insolvencia'
,p_validation_sequence=>100
,p_validation=>'P69_FCHA_RSLCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor registre la fecha de la resoluci\00F3n')
,p_validation_condition=>'P69_INSLVNCIA'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(73540285547721084)
,p_associated_item=>wwv_flow_api.id(23378055796392733)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23378646737392739)
,p_validation_name=>'Valida numero resolucion no sea nulo si es acuerdo de insolvencia'
,p_validation_sequence=>110
,p_validation=>'P69_NMRO_RSLCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor registre la n\00FAmero de la resoluci\00F3n')
,p_validation_condition=>'P69_INSLVNCIA'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(73540285547721084)
,p_associated_item=>wwv_flow_api.id(23378555340392738)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73546148029721110)
,p_name=>'Al seleccionar las vigencias'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(116988823466787379)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73546652670721111)
,p_event_id=>wwv_flow_api.id(73546148029721110)
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
'      // Solo permite seleccionar las cartereas que no han sido revocadas',
'        records = records.filter(function (record) {',
'                return ( [''N''].includes( model.getValue(record, "RVCDA")) ) ',
'             });',
'',
'     var json = records.map(function (record){',
'        ids += model.getValue( record, ''ID'' ) + '':'';',
'        return {''VGNCIA'':  parseFloat(model.getValue(record, ''VGNCIA'')),',
'                ''PRDO'':  parseFloat(model.getValue(record, ''PRDO'')),',
'                ''CDGO_MVMNTO_ORGN'':  model.getValue(record, ''CDGO_MVMNTO_ORGN''),',
'                ''ID_ORGEN'':  model.getValue(record, ''ID_ORGEN'')',
'               };',
'    });         ',
'    //$s(''P69_VGNCIA_PRDO'', JSON.stringify(json));',
'    $s(''P69_VGNCIA_PRDO'', ids);',
'    ',
'     //Seleccionamos los item no procesados en el interactive grid ',
'   apex.region("deudas").widget().interactiveGrid("setSelectedRecords", records);',
'    ',
'}else{',
'    $s(''P69_VGNCIA_PRDO'', null);',
'}',
'',
'if($v(''P69_RNGO_VGNCIA'') == ''T'' ){',
'      apex.region("deudas").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");    ',
'}',
'',
' ',
'// if(this.data.selectedRecords.length > 0) {',
'// ',
'//     var model = this.data.model;',
'//     var records = this.data.selectedRecords; ',
'//     var ids="";',
'//     ',
'//     var json = records.map(function (record){',
'//         ids += model.getValue( record, ''ID'' ) + '':'';',
'//         return {''VGNCIA'':  parseFloat(model.getValue(record, ''VGNCIA'')),',
'//                 ''PRDO'':  parseFloat(model.getValue(record, ''PRDO'')),',
'//                 ''CDGO_MVMNTO_ORGN'':  model.getValue(record, ''CDGO_MVMNTO_ORGN''),',
'//                 ''ID_ORGEN'':  model.getValue(record, ''ID_ORGEN'')',
'//                };',
'//     });         ',
'//     //$s(''P69_VGNCIA_PRDO'', JSON.stringify(json));',
'//     $s(''P69_VGNCIA_PRDO'', ids);',
'//     ',
'// }else{',
'//     $s(''P69_VGNCIA_PRDO'', null);',
'// }',
'// ',
'// if($v(''P69_RNGO_VGNCIA'') == ''T'' ){',
'//       apex.region("deudas").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");    ',
'// }',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73552918658728648)
,p_name=>unistr('Actualizar Pag\00EDna')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_ID_CNVNIO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73553088726728649)
,p_event_id=>wwv_flow_api.id(73552918658728648)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56878668972055001)
,p_name=>'Al Ingresar Documento'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_NMRO_DCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56878793438055002)
,p_event_id=>wwv_flow_api.id(56878668972055001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P69_NMRO_DCMNTO'')){',
'    apex.item(''BTN_VALIDAR_DOCUMENTO'').show();',
'}else{',
'    apex.item(''BTN_VALIDAR_DOCUMENTO'').hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23377474636392727)
,p_name=>'Cuando cambie si genera o no Intereses de Mora en el caso de la insolvencia'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_CLCLA_INTRES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23377540261392728)
,p_event_id=>wwv_flow_api.id(23377474636392727)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23377717507392730)
,p_name=>'Cuando cambie la fecha para congelar los intereses'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_FCHA_CNGLA_INTRES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23377811315392731)
,p_event_id=>wwv_flow_api.id(23377717507392730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23378170974392734)
,p_name=>unistr('Cuando cambie la fecha de resoluci\00F3n')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_FCHA_RSLCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23378274267392735)
,p_event_id=>wwv_flow_api.id(23378170974392734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92139440369860301)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n del Documento de Cuota Inicial y Proyecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_orgen',
'        , to_char( NVL(:P69_VLOR_CTA_INCIAL, 0) + b.vlor,:F_FRMTO_MNDA)vlor_rcdo',
'        , to_char(b.fcha_rcdo,''DD/MM/YYYY'')fcha_rcdo',
'        , case when c.nmro_pryccion is not null then',
'                   ''S''',
'                else',
'                    ''N''',
'            end as indcdor_tne_pryccion',
'        , c.id_pryccion',
'        , c.nmro_pryccion',
'        , trunc(c.fcha_pryccion)',
'        , c.id_cnvnio_tpo',
'        , NVL(:P69_VLOR_CTA_INCIAL, 0) + b.vlor',
'        , c.indcdor_clcla_intres',
'        , trunc(c.fcha_cngla_intres)',
'        , c.nmro_rslcion',
'        , trunc(c.fcha_rslcion)',
'    into :P69_ID_DCMNTO',
'        , :P69_VLOR',
'        , :P69_FCHA_RCDO',
'        , :P69_INDCDOR_TNE_PRYCCION',
'        , :P69_ID_PRYCCION',
'        , :P69_NMRO_PRYCCION',
'        , :P69_FCHA_PRYCCION',
'        , :P69_ID_CNVNIO_TPO',
'        , :P69_VLOR_CTA_INCIAL',
'        , :P69_CLCLA_INTRES',
'        , :P69_FCHA_CNGLA_INTRES',
'        , :P69_NMRO_RSLCION',
'        , :P69_FCHA_RSLCION ',
'     from re_g_documentos           a',
'     join re_g_recaudos             b on a.id_dcmnto    = b.id_orgen    ',
'     left join gf_g_proyecciones    c on b.id_orgen     = c.id_dcmnto_cta_incial',
'    where b.nmro_dcmnto               = :P69_NMRO_DCMNTO',
'      and b.cdgo_rcdo_estdo         = ''AP''',
'      and rownum = 1;'))
,p_process_error_message=>'No se puede agregar el Documento, porque no se encuentra pagado, o  no corresponde al Sujeto'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73548349881728602)
,p_process_when=>'P69_NMRO_DCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13685268702795124)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Guardar Documento en Colecci\00F3n de Documentos de Cuotas Iniciales')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_collection.add_member( p_collection_name => ''DOCUMENTO_CTA_INICIAL'',',
'                                p_n001            => :P69_ID_DCMNTO,',
'                                p_n002            => :F_ID_INSTNCIA_FLJO); ',
'    :P69_NMRO_DCMNTO:= '''';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73548349881728602)
,p_process_success_message=>'Se registro el Documento Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73552870004728647)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Limpiar Vigencias seleccionadas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P69_NMRO_VGNCIA_SLCCNDA := null;',
':P69_VGNCIA_PRDO := null;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86048089285040304)
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
'            id_slctud ',
'            --c.indcdor_clcla_intres,',
'            --trunc(c.fcha_cngla_intres)',
'      into :P69_ID_CNVNIO,',
'           :P69_ID_CNVNIO_TPO,',
'           :P69_ID_DCMNTO,',
'           :P69_NMRO_DCMNTO,',
'           :P69_VLOR_CTA_INCIAL,',
'           :P69_VLOR,',
'           :P69_FCHA_RCDO,',
'           :P69_ID_PRYCCION,',
'           :P69_NMRO_PRYCCION,',
'           :P69_FCHA_PRYCCION,       ',
'           :P52_ID_SJTO_IMPSTO,',
'           :P52_ID_IMPSTO,',
'           :P52_ID_IMPSTO_SBMPSTO,',
'           :P52_CDGO_SJTO_TPO,',
'           :P69_INDCDOR_TNE_PRYCCION,',
'           :P52_ID_SLCTUD ',
'           --:P69_CLCLA_INTRES,',
'           --:P69_FCHA_CNGLA_INTRES',
'      from v_gf_g_convenios   a',
'      left join v_re_g_recaudos    b on a.id_dcmnto_cta_incial = b.id_orgen and cdgo_rcdo_estdo = ''AP''',
'      left join gf_g_proyecciones  c on a.id_dcmnto_cta_incial = c.id_dcmnto_cta_incial',
'    where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13684356985795115)
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
'                        where id_cnvnio = :P69_ID_CNVNIO',
'                         and a.id_dcmnto not in (select m.n001 from apex_collections m where m.collection_name = ''DOCUMENTO_CTA_INICIAL'')) loop',
'        apex_collection.add_member( p_collection_name  => ''DOCUMENTO_CTA_INICIAL'',',
'                                     p_n001            => c_dcmnto_cta_inicial.id_dcmnto,',
'                                     p_n002            => :P69_ID_CNVNIO);     ',
'    end loop;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13685836872795130)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar miembro de Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'v_vlor_ttal_dcmnto number;',
'begin ',
'    begin',
'    select ',
'         b.vlor_ttal_dcmnto',
'         into v_vlor_ttal_dcmnto',
'   from apex_collections       a',
'   join v_re_g_documentos      b on a.n001 = b.id_dcmnto',
'  where collection_name        = ''DOCUMENTO_CTA_INICIAL''',
'  and seq_id = :P69_SEQ_ID;',
'  ',
'  exception when others then',
'  v_vlor_ttal_dcmnto := 0;',
'  end;',
'',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''DOCUMENTO_CTA_INICIAL'',',
'        p_seq => :P69_SEQ_ID);',
'        ',
'    :P69_VLOR						:= to_char(:P69_VLOR_CTA_INCIAL - v_vlor_ttal_dcmnto,:FRMTO_MNDA);',
'    :P69_VLOR_CTA_INCIAL			:= :P69_VLOR_CTA_INCIAL - v_vlor_ttal_dcmnto;',
'    :P69_FCHA_RCDO					:= null;',
'    :P69_INDCDOR_TNE_PRYCCION		:= null;',
'    :P69_NMRO_PRYCCION				:= null;',
'    :P69_FCHA_PRYCCION				:= null;',
'    :P69_INSLVNCIA                  := null;',
'    :P69_CLCLA_INTRES               := null;',
'    :P69_FCHA_CNGLA_INTRES          := null;',
'    :P69_FCHA_RSLCION               := null;',
'    :P69_NMRO_RSLCION               := null;',
'exception ',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_DOCUMENTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23377012009392723)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar tipo de convenio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  rngo_vgncia,         ',
'           indcdor_exge_cta_incial ,         ',
'           indcdor_inslvncia',
'   into    :P69_RNGO_VGNCIA,    ',
'           :P69_INDCDOR_RQRE_CTA_INCIAL,     ',
'           :P69_INSLVNCIA',
'   from gf_d_convenios_tipo',
'    where id_cnvnio_tpo        = :P69_ID_CNVNIO_TPO;',
'     '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P69_ID_CNVNIO_TPO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
