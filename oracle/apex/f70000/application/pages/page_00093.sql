prompt --application/pages/page_00093
begin
wwv_flow_api.create_page(
 p_id=>93
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Informaci\00F3n Base de Liquidaci\00F3n')
,p_step_title=>unistr('Informaci\00F3n Base de Liquidaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var loadData = true;'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#adicional [id^="INP"]'').each(function () {',
'    $(this).attr(''onkeypress'', ''return validarExpresion(event, "letraNumeroEspacio");'');',
'});',
'',
'function load() {',
'    var actos = [];',
'    // trae el valor del json',
'    if ($v(''P93_ACTOS'')) {',
'        try {',
'            // convierte en tipo json',
'            actos = JSON.parse($v(''P93_ACTOS''));',
'        } catch (e) {',
'            actos = [];',
'        }',
'    }',
unistr('    //si el json est\00E1 lleno '),
'    if (actos.length > 0) {',
'        // construye la vista',
'        var view = apex.region(''actosTributo'').widget().interactiveGrid("getCurrentView");',
'        // recorremos el json trayendo el valor',
'        actos = actos.map(m => Number(m.ID_IMPSTO_ACTO));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;',
'        // trae todos los registros del modelo',
'        var records = model._data;',
'        console.log(actos, records);',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f) => {',
'            return actos.indexOf(Number(model.getValue(f, ''ID_IMPSTO_ACTO''))) > -1',
'        });',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);',
'    }',
'',
'    setTimeout(function () {',
'        if ($v(''P93_CNCPTOS'')) {',
'            apex.item(''NEXT'').show();',
'            if ($v(''P93_INDCDOR_RQRE_ASCDA'') === ''N'' && $v(''P93_EXISTE_INFRMCION_ADCNAL'') === ''N''){',
'                 $(''#SR_info_tab'').hide();',
'            }else{',
'                $(''#SR_info_tab'').show();                ',
'            }',
'        } else {',
'            $(''#SR_info_tab'').hide();',
'            apex.item(''NEXT'').hide();',
'        }',
'        $(''#SR_conceptos_tab a'').click(function () {',
'            apex.region(''conceptos'').refresh();',
'            if ($v(''P93_CNCPTOS'')) {',
'                setTimeout(function () {',
'                    cargarConceptos();',
'                }, 300);',
'            } else {',
'                loadData = false;',
'            }',
'        });',
'        cargarConceptos();',
'    }, 300);',
'}',
'',
'function cargarConceptos() {',
'    try {',
'        var cncptos = [];',
'        if ($v(''P93_CNCPTOS'')) {',
'            cncptos = JSON.parse($v(''P93_CNCPTOS''));',
'        }',
'        var viewC = apex.region(''conceptos'').widget().interactiveGrid("getCurrentView");',
'        if (cncptos.length > 0) {',
'            cncptos = cncptos.map(m => Number(m.ID_IMPSTO_ACTO_CNCPTO));',
'            var modelC = viewC.model;',
'            var recordsC = modelC._data;',
'            recordsC = recordsC.filter((f) => {',
'                return cncptos.indexOf(Number(modelC.getValue(f, ''ID_IMPSTO_ACTO_CNCPTO''))) > -1',
'            });',
'            //setea los valores de los registros',
'            viewC.setSelectedRecords(recordsC);',
'        }',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        loadData = false;',
'    }',
'}',
'',
'load();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#conceptos_ig_report_settings{',
'    display : none;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200519202613'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19865197416460801)
,p_plug_name=>unistr('Informaci\00F3n Base Liquidaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(19863316626456068)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20033448678201635)
,p_plug_name=>'Tabs'
,p_parent_plug_id=>wwv_flow_api.id(19865197416460801)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19866762791460817)
,p_plug_name=>'<b>Tributo a Liquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(20033448678201635)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-lg'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19869787934460847)
,p_plug_name=>'Tabs'
,p_parent_plug_id=>wwv_flow_api.id(19866762791460817)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19867354818460823)
,p_plug_name=>'Actos Tributos'
,p_region_name=>'actosTributo'
,p_parent_plug_id=>wwv_flow_api.id(19869787934460847)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_acto',
'       ,nmbre_impsto_acto',
'       ,cdgo_impsto_acto',
'  from v_df_i_impuestos_acto',
' where id_impsto = :P93_ID_IMPSTO',
'   and id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO',
'   and actvo = ''S'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P93_LQDCION_MTPLE'
,p_plug_display_when_cond2=>'S'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19867645951460826)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19867712565460827)
,p_name=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(20030171790201602)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(40651491297356914)
,p_name=>'CDGO_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(19867570136460825)
,p_internal_uid=>19867570136460825
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(19950149160993302)
,p_interactive_grid_id=>wwv_flow_api.id(19867570136460825)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(19950244653993302)
,p_report_id=>wwv_flow_api.id(19950149160993302)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19950735255993305)
,p_view_id=>wwv_flow_api.id(19950244653993302)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(19867645951460826)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19951297910993310)
,p_view_id=>wwv_flow_api.id(19950244653993302)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(19867712565460827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40900598020897708)
,p_view_id=>wwv_flow_api.id(19950244653993302)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(40651491297356914)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19867444436460824)
,p_plug_name=>'Conceptos Acto(s)'
,p_region_name=>'conceptos'
,p_parent_plug_id=>wwv_flow_api.id(19869787934460847)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_impsto_acto_cncpto',
'        , a.id_impsto_acto',
'        , ''['' || a.cdgo_cncpto  ||  ''] '' || a.dscrpcion_cncpto dscrpcion_cncpto',
unistr('        , decode(a.unco, ''S'', ''S\00ED'', ''N'', ''No'')                 unco'),
'        , dscrpcion_gnra_intres_mra                            gnra_intres_mra',
'        , c.txto_trfa',
unistr('        , decode(c.indcdor_usa_bse, ''S'', ''S\00ED'', ''N'', ''No'')    indcdor_usa_base'),
'   from v_df_i_impuestos_acto_concepto                         a',
'   join df_i_periodos                                          b on a.id_prdo                  = b.id_prdo',
'   join gi_d_tarifas_esquema                                   c on a.id_impsto_acto_cncpto    = c.id_impsto_acto_cncpto',
'    where (a.id_impsto_acto in (select id from json_table(:P93_ACTOS, ''$[*]'' columns(id number path ''$.ID_IMPSTO_ACTO'' )))',
'        or a.id_impsto_acto = :P93_ID_IMPSTO_ACTO)',
'      and a.actvo = ''S''',
'      and a.vgncia = pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''GFN'', p_cdgo_dfncion_clnte => ''VAC'')',
'      and a.prdo = pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''GFN'', p_cdgo_dfncion_clnte => ''PAC'')',
'      and sysdate <= cast(a.fcha_vncmnto as date )',
' group by a.id_impsto_acto_cncpto',
'        , a.id_impsto_acto',
'        , a.dscrpcion_cncpto',
'        , a.nmbre_impsto_acto',
'        , a.unco',
'        , dscrpcion_gnra_intres_mra ',
'        , a.cdgo_cncpto',
'        , a.vgncia',
'        , a.id_prdo',
'        , b.dscrpcion',
'        ,  c.txto_trfa',
'        ,  c.indcdor_usa_bse;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4857491178958925)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(4857568503958926)
,p_name=>'INDCDOR_USA_BASE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_USA_BASE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFUsa Base?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(19868502059460835)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>106
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
 p_id=>wwv_flow_api.id(19869504019460845)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19869604267460846)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(20030496095201605)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38291809152203836)
,p_name=>'UNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00DAnico')
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
 p_id=>wwv_flow_api.id(40651750160356917)
,p_name=>'GNRA_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GNRA_INTRES_MRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFInter\00E9s Mora?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(19868226734460832)
,p_internal_uid=>19868226734460832
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(19955979547017488)
,p_interactive_grid_id=>wwv_flow_api.id(19868226734460832)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(19956070071017488)
,p_report_id=>wwv_flow_api.id(19955979547017488)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1100052006804)
,p_view_id=>wwv_flow_api.id(19956070071017488)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(4857491178958925)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4997612600404651)
,p_view_id=>wwv_flow_api.id(19956070071017488)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(4857568503958926)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19957510769017495)
,p_view_id=>wwv_flow_api.id(19956070071017488)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(19868502059460835)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>374
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20019802117155650)
,p_view_id=>wwv_flow_api.id(19956070071017488)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(19869504019460845)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20020939695159878)
,p_view_id=>wwv_flow_api.id(19956070071017488)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(19869604267460846)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39158471271298682)
,p_view_id=>wwv_flow_api.id(19956070071017488)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(38291809152203836)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40903412487915796)
,p_view_id=>wwv_flow_api.id(19956070071017488)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(40651750160356917)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36810055389463017)
,p_plug_name=>unistr('Regi\00F3n Botones')
,p_parent_plug_id=>wwv_flow_api.id(19866762791460817)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20033308790201634)
,p_plug_name=>unistr('<b>Informaci\00F3n Relacionada</b>')
,p_region_name=>'info'
,p_parent_plug_id=>wwv_flow_api.id(20033448678201635)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20033675153201637)
,p_plug_name=>unistr('<b>Informaci\00F3n Asociada</b>')
,p_region_name=>'asociada'
,p_parent_plug_id=>wwv_flow_api.id(20033308790201634)
,p_region_template_options=>'#DEFAULT#:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'  from  df_i_impuestos_acto a',
'  join  gi_d_subimpuestos_asociada b on a.id_impsto_sbmpsto = b.id_impsto_sbmpsto',
' where  b.cdgo_clnte = :F_CDGO_CLNTE',
'   and  a.id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO',
'   and  a.indcdor_rqre_ascsda = ''S''',
'   and  (a.id_impsto_acto in (select id_impsto_acto',
'                              from json_table(:P93_ACTOS, ''$[*]'' columns id_impsto_acto path ''$.ID_IMPSTO_ACTO'')) or :P93_ACTOS is null);'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20033793240201638)
,p_plug_name=>unistr('<b>Informaci\00F3n Adicional</b>')
,p_region_name=>'adicional'
,p_parent_plug_id=>wwv_flow_api.id(20033308790201634)
,p_region_template_options=>'#DEFAULT#:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(pkg_gi_titulos_ejecutivo.fnc_gn_region_metadatos(p_cdgo_clnte          =>    :F_CDGO_CLNTE,',
'                                                       p_id_impsto           =>    :P93_ID_IMPSTO,',
'                                                       p_id_impsto_sbmpsto   =>    :P93_ID_IMPSTO_SBMPSTO,',
'                                                       p_id_orgen            =>    :P93_ID_RNTA			',
'                                                       ));'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19865249392460802)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>    ',
unistr('    <p align="justify">La funcionalidad de la informaci\00F3n base liquidaci\00F3n permite<br><br> '),
unistr('        <b>1.</b> Selecci\00F3n del tributo de rentas a liquidar.<br><br> '),
unistr('        <b>2.</b> Selecci\00F3n de hecho generador actos por concepto.<br><br> '),
unistr('        <b>3.</b> Registro de la informaci\00F3n de la asociada.<br><br> '),
unistr('        <b>4.</b> Registro de la informaci\00F3n adicional.<br><br> '),
'        <b>5.</b> Registro de la base gravable del tributo.<br><br> ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>     '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19865416940460804)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19865197416460801)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP,88::'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19865542809460805)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19865197416460801)
,p_button_name=>'NEXT'
,p_button_static_id=>'NEXT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(19865609475460806)
,p_branch_name=>unistr('Ir a P\00E1gina 91')
,p_branch_action=>'f?p=&APP_ID.:91:&SESSION.::&DEBUG.:RP:P91_SUB_IMPUESTO,P91_IMPUESTO,P91_FCHA_EXPDCION:&P93_ID_IMPSTO_SBMPSTO.,&P93_ID_IMPSTO.,&P93_FCHA_EXPDCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(19865542809460805)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(20511396008041532)
,p_branch_name=>unistr('Ir a P\00E1gina 89')
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP,93::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(19865416940460804)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16222787379689132)
,p_name=>'P93_LBEL_FCHA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20033675153201637)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16222897826689133)
,p_name=>'P93_INDCDOR_EXTRNJRO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20033675153201637)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16222948214689134)
,p_name=>'P93_INDCDOR_MXTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20033675153201637)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19866878495460818)
,p_name=>'P93_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19866762791460817)
,p_prompt=>'Sub Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d ',
'       ,id_impsto_sbmpsto r       ',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P93_ID_IMPSTO',
'    and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P93_ID_RNTA'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tributo de rentas para liquidaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19866983584460819)
,p_name=>'P93_ID_IMPSTO_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(19866762791460817)
,p_prompt=>'Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_acto d',
'      ,id_impsto_acto r',
' from df_i_impuestos_acto',
'where id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO',
'  and actvo = ''S'';',
'   '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P93_ID_IMPSTO_SBMPSTO'
,p_ajax_items_to_submit=>'P93_ID_IMPSTO_ACTO'
,p_ajax_optimize_refresh=>'N'
,p_begin_on_new_line=>'N'
,p_display_when=>'P93_LQDCION_MTPLE'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('En caso de no manejar m\00FAltiples actos, seleccione el acto asociado al tributo a liquidar.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20031163034201612)
,p_name=>'P93_LQDCION_MTPLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(19866762791460817)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20032186263201622)
,p_name=>'P93_ACTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19867354818460823)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20032632814201627)
,p_name=>'P93_CNCPTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19867444436460824)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20033966190201640)
,p_name=>'P93_ASCDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20033675153201637)
,p_prompt=>'Asociada'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d',
'       ,id_sbmpsto_ascda',
'  from gi_d_subimpuestos_asociada',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO',
'   and activo = ''S'';'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la asociada correspondiente a la renta que desea liquidar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20034086538201641)
,p_name=>'P93_CDGO_ASCDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20033675153201637)
,p_prompt=>unistr('C\00F3digo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20034184857201642)
,p_name=>'P93_TXTO_ASCDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20033675153201637)
,p_prompt=>'Soporte Asociada'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingresa el n\00FAmero del contrato sobre el que se liquida la renta.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20034296790201643)
,p_name=>'P93_FCHA_EXPDCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20033675153201637)
,p_prompt=>'Fecha de &P93_LBEL_FCHA.'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la Fecha en que se se genera el acto.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20511055030041529)
,p_name=>'P93_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19866762791460817)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto r',
'    ,  a.nmbre_impsto  d',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO'))
,p_lov_display_null=>'YES'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(1) a',
'    from v_sg_g_menu_impuesto     a',
'    join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
'   where a.cdgo_clnte       = :F_CDGO_CLNTE',
'     and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'     and a.id_mnu           = :F_ID_MNU',
'     and b.id_usrio         = :F_ID_USRIO',
'  having count(1) > 1;'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo que desea consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20511819071041537)
,p_name=>'P93_ID_RNTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(19866762791460817)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35412821783826901)
,p_name=>'P93_INDCDOR_RQRE_ASCDA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(19866762791460817)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37510736495196610)
,p_name=>'P93_JSON_MTDTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19865197416460801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49020213256734002)
,p_name=>'P93_EXISTE_INFRMCION_ADCNAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(19866762791460817)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(38289771860203815)
,p_computation_sequence=>20
,p_computation_item=>'P93_LQDCION_MTPLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lqdcion_mltple ',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte  = :F_CDGO_CLNTE',
'   and id_impsto   = :P93_ID_IMPSTO',
'   and id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO; '))
,p_computation_error_message=>'ASXASXASX'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(36810254407463019)
,p_computation_sequence=>30
,p_computation_item=>'P93_ACTOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg( json_object(key ''ID_IMPSTO_ACTO'' is id_impsto_acto))',
'  from gi_g_rentas_acto   ',
' where id_rnta = :P93_ID_RNTA;'))
,p_compute_when=>':P93_LQDCION_MTPLE = ''S'' and :P93_ACTOS is null'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(46019588635660706)
,p_computation_sequence=>40
,p_computation_item=>'P93_ID_IMPSTO_ACTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_acto',
'  from gi_g_rentas_acto',
' where id_rnta = :P93_ID_RNTA; '))
,p_compute_when=>'P93_LQDCION_MTPLE'
,p_compute_when_text=>'N'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(36811119321463028)
,p_computation_sequence=>10
,p_computation_item=>'P93_CNCPTOS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select json_arrayagg( json_object(key ''ID_IMPSTO_ACTO_CNCPTO'' is a.id_impsto_acto_cncpto))',
'  from (select  id_impsto_acto_cncpto',
'          from  gi_g_rentas_acto_concepto a',
'          join  gi_g_rentas_acto b on  a.id_rnta_acto = b.id_rnta_acto',
'         where  b.id_rnta = :P93_ID_RNTA',
'      group by  id_impsto_acto_cncpto) a;'))
,p_compute_when=>'P93_CNCPTOS'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(36811605960463033)
,p_computation_sequence=>20
,p_computation_item=>'P93_ID_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(36810914153463026)
,p_validation_name=>'Valida Conceptos Actos'
,p_validation_sequence=>20
,p_validation=>'P93_CNCPTOS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione los Actos por conceptos asociados al tributo!')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(19865542809460805)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(36811939690463036)
,p_validation_name=>'Valida Fecha Vencimiento'
,p_validation_sequence=>30
,p_validation=>'P93_FCHA_EXPDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Fecha de &P93_LBEL_FCHA. debe tener alg\00FAn valor.')
,p_validation_condition=>'P93_INDCDOR_RQRE_ASCDA'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(19865542809460805)
,p_associated_item=>wwv_flow_api.id(20034296790201643)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19868765484460837)
,p_name=>'Al Cambiar Tributo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93_ID_IMPSTO_SBMPSTO'
,p_condition_element=>'P93_ID_RNTA'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20031050163201611)
,p_event_id=>wwv_flow_api.id(19868765484460837)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select lqdcion_mltple',
'      into :P93_LQDCION_MTPLE  ',
'      from df_i_impuestos_subimpuesto',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO;',
'       ',
'        if (:P93_LQDCION_MTPLE = ''N'') then',
'            begin',
'                    select min(id_impsto_acto)',
'                     into :P93_ID_IMPSTO_ACTO  ',
'                     from df_i_impuestos_acto',
'                    where id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO;',
'            exception',
'                when others then',
'                    null;',
'            end;            ',
'        end if;',
'',
'exception',
'    when others then',
'        null;',
'end;'))
,p_attribute_02=>'P93_ID_IMPSTO_SBMPSTO'
,p_attribute_03=>'P93_LQDCION_MTPLE,P93_ID_IMPSTO_ACTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38291622495203834)
,p_event_id=>wwv_flow_api.id(19868765484460837)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P93_LQDCION_MTPLE'') === ''N'') {    ',
'    $s(''P93_ACTOS'', null);',
'    $s(''P93_CNCPTOS'', null);',
'}else{',
'    $s(''P93_ID_IMPSTO_ACTO'', null);',
'    $s(''P93_CNCPTOS'', null);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38289350063203811)
,p_event_id=>wwv_flow_api.id(19868765484460837)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20031828562201619)
,p_name=>'Al Seleccionar Actos'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(19867354818460823)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20031916449201620)
,p_event_id=>wwv_flow_api.id(20031828562201619)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.data.selectedRecords.length > 0) {',
'    var model = this.data.model;',
'    var records = this.data.selectedRecords; ',
'    var json = records.map(function (record){',
'        return {''ID_IMPSTO_ACTO'':  model.getValue(record, ''ID_IMPSTO_ACTO'') };',
'    });         ',
'    $s(''P93_ACTOS'', JSON.stringify(json));  ',
'       ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20032288986201623)
,p_event_id=>wwv_flow_api.id(20031828562201619)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_count number;',
'begin',
'    select  count(1)',
'       into v_count',
'      from  df_i_impuestos_acto ',
'     where  id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO',
'       and  indcdor_rqre_ascsda = ''S''',
'       and  (id_impsto_acto in (select id_impsto_acto',
'                                  from json_table(:P93_ACTOS, ''$[*]'' columns id_impsto_acto path ''$.ID_IMPSTO_ACTO'')) or :P93_ACTOS is null);',
'       --and  (id_impsto_acto = :P93_ID_IMPSTO_ACTO or :P93_ID_IMPSTO_ACTO is null);',
'       ',
'       :P93_INDCDOR_RQRE_ASCDA := case when v_count > 0 then ''S'' else ''N'' end;',
'exception',
'    when others then',
'        :P93_INDCDOR_RQRE_ASCDA := ''N''; ',
'end;   '))
,p_attribute_02=>'P93_ACTOS'
,p_attribute_03=>'P93_ACTOS,P93_INDCDOR_RQRE_ASCDA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36810899617463025)
,p_event_id=>wwv_flow_api.id(20031828562201619)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$v(''P93_ACTOS'') || $v(''P93_ID_IMPSTO_ACTO'') ? $(''#SR_conceptos_tab'').show() : $(''#SR_conceptos_tab'').hide(); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36808823128463005)
,p_event_id=>wwv_flow_api.id(20031828562201619)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v(''P93_INDCDOR_RQRE_ASCDA'') === ''S''? $(''#asociada'').show() : $(''#asociada'').hide();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20032429236201625)
,p_name=>'Al Seleccionar Conceptos'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(19867444436460824)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20032578985201626)
,p_event_id=>wwv_flow_api.id(20032429236201625)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(!loadData){',
'    if(this.data.selectedRecords.length > 0) {',
'        var model = this.data.model;',
'        var records = this.data.selectedRecords; ',
'        var json = records.map(function (record){',
'            return {''ID_IMPSTO_ACTO_CNCPTO'':  model.getValue(record, ''ID_IMPSTO_ACTO_CNCPTO'') };',
'        });         ',
'        $s(''P93_CNCPTOS'', JSON.stringify(json)); ',
'        if ($v(''P93_CNCPTOS'')) {',
'            apex.item(''NEXT'').show();',
'            if ($v(''P93_INDCDOR_RQRE_ASCDA'') === ''N'' && $v(''P93_EXISTE_INFRMCION_ADCNAL'') === ''N''){',
'                 $(''#SR_info_tab'').hide();',
'            }else{',
'                $(''#SR_info_tab'').show();',
'            }',
'        } else {',
'            $(''#SR_info_tab'').hide();',
'            apex.item(''NEXT'').hide();',
'        }',
'            /*if ($v(''P93_CNCPTOS'') && ($v(''P93_INDCDOR_RQRE_ASCDA'') === ''S'' || $v(''P93_EXISTE_INFRMCION_ADCNAL'') === ''S'')){',
'                $(''#SR_info_tab'').show();',
'                apex.item(''NEXT'').show();',
'            }else if ($v(''P93_CNCPTOS'')){',
'                apex.item(''NEXT'').show();',
'            }else{',
'                $(''#SR_info_tab'').hide();',
'                apex.item(''NEXT'').hide();',
'            }',
'        apex.item(''NEXT'').show(); ',
'        $(''#SR_info_tab'').show();*/',
'    }else{',
'        $s(''P93_CNCPTOS'', null);',
'        apex.item(''NEXT'').hide(); ',
'        $(''#SR_info_tab'').hide();',
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48967538087095801)
,p_event_id=>wwv_flow_api.id(20032429236201625)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_count number;',
'begin',
'    select  count(1)',
'       into v_count',
'      from  df_i_impuestos_acto ',
'     where  id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO',
'       and  indcdor_rqre_ascsda = ''S''',
'       and  id_impsto_acto = :P93_ID_IMPSTO_ACTO;',
'       ',
'       :P93_INDCDOR_RQRE_ASCDA := case when v_count > 0 then ''S'' else ''N'' end;',
'exception',
'    when others then',
'        :P93_INDCDOR_RQRE_ASCDA := ''N''; ',
'end;   '))
,p_attribute_02=>'P93_ID_IMPSTO_ACTO,P93_ID_IMPSTO_SBMPSTO,P93_CNCPTOS'
,p_attribute_03=>'P93_INDCDOR_RQRE_ASCDA,P93_CNCPTOS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49020392667734003)
,p_event_id=>wwv_flow_api.id(20032429236201625)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_count        number;',
'begin',
'    select count (1)',
'      into v_count',
'      from df_i_impstos_sbmpsto_mtdta',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO;',
'       ',
'       :P93_EXISTE_INFRMCION_ADCNAL := case when v_count > 0 then ''S'' else ''N'' end;',
'       ',
'exception',
'    when no_data_found then',
'        :P93_EXISTE_INFRMCION_ADCNAL := ''N'';        ',
'end;'))
,p_attribute_02=>'P93_ID_IMPSTO_SBMPSTO,P93_CNCPTOS,P93_EXISTE_INFRMCION_ADCNAL'
,p_attribute_03=>'P93_EXISTE_INFRMCION_ADCNAL,P93_CNCPTOS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20213559256190009)
,p_name=>'Setear asociada'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93_ASCDA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20213616870190010)
,p_event_id=>wwv_flow_api.id(20213559256190009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P93_ASCDA'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20213717684190011)
,p_event_id=>wwv_flow_api.id(20213559256190009)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93_CDGO_ASCDA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_ascda',
'  from gi_d_subimpuestos_asociada',
' where id_sbmpsto_ascda = :P93_ASCDA;'))
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36811317062463030)
,p_name=>'Valida Campos'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19865542809460805)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36811438184463031)
,p_event_id=>wwv_flow_api.id(36811317062463030)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var errors = [];',
'apex.message.clearErrors();',
'$(''.t-Form-error'').remove();',
'if (errors.length === 0) {',
'    $(''#adicional [required]'').each(function () {',
'        var id = $(this).attr(''id'');',
'        if (!$v(id)) {',
'            errors.push({',
'                type: "error",',
'                location: ["page", "inline"],',
'                pageItem: id,',
unistr('                message:$(''[for="''+id+''"]'').text() + " debe tener alg\00FAn valor."'),
'            });',
'        };',
'    });',
'}',
'',
'if (errors.length > 0) {  ',
'    console.log(''TENGO ERRORES'');',
'    apex.message.showErrors(errors);',
'}else{',
'    //arma el json de los metadatos para insertar',
'    var json = [];',
'    $(''[id*="INP"]'').each(function () {',
'        var id = $(this).attr(''id'');',
'        var valor = $v(id);',
'        if (valor) {',
'            json.push({',
'                ''key'': id.replace(''INP'',''''),',
'                ''value'': valor',
'            });',
'        }',
'    });',
'    console.log(json);',
'    $s(''P93_JSON_MTDTOS'', JSON.stringify(json));',
'    apex.submit(''NEXT'');',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39263221665813838)
,p_name=>'Al Cambiar Acto Tributo'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49094987860737101)
,p_event_id=>wwv_flow_api.id(39263221665813838)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$v(''P93_EXISTE_INFRMCION_ADCNAL'') === ''S''? $(''#adicional'').show() : $(''#adicional'').hide();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39262973306813835)
,p_event_id=>wwv_flow_api.id(39263221665813838)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null'
,p_attribute_02=>'P93_ACTOS,P93_ID_IMPSTO_ACTO'
,p_attribute_03=>'P93_ACTOS'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39263560310813841)
,p_event_id=>wwv_flow_api.id(39263221665813838)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93_ID_IMPSTO_ACTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39263822343813844)
,p_event_id=>wwv_flow_api.id(39263221665813838)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19867444436460824)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36809461709463011)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga de Liquidaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select   id_impsto',
'        ,    id_impsto_sbmpsto   ',
'        ,    id_sjto_impsto ',
'        ,    idntfccion_sjto',
'        ,    indcdor_usa_extrnjro',
'        ,    indcdor_usa_mxto ',
'        ,    to_char(vlor_bse_grvble, ''999G999G999G999G999G999G990D99'')',
'        ,    fcha_rgstro',
'      into   :P93_ID_IMPSTO',
'        ,    :P93_ID_IMPSTO_SBMPSTO',
'        ,    :P91_ID_SJTO_IMPSTO ',
'        ,    :P91_IDENTIFICACION',
'        ,    :P91_INDCDOR_USA_EXTRNJRO',
'        ,    :P91_INDCDOR_USA_MXTO ',
'        ,    :P91_VLOR_BSE_GRVBLE',
'        ,    :P91_FCHA_LQDCION',
'      from  v_gi_g_rentas',
'     where  cdgo_clnte = :F_CDGO_CLNTE',
'       and  id_rnta = :P93_ID_RNTA;       ',
'exception',
'    when others then',
'        null;        ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36810119329463018)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga de Datos Informaci\00F3n Asociada')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  id_sbmpsto_ascda',
'        ,   txto_ascda',
'        ,   fcha_expdcion',
'      into  :P93_ASCDA',
'        ,   :P93_TXTO_ASCDA',
'        ,   :P93_FCHA_EXPDCION ',
'      from  v_gi_g_rentas ',
'     where  cdgo_clnte = :F_CDGO_CLNTE',
'       and  id_rnta = :P93_ID_RNTA;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(20213133426190005)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Definiciones Renta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select indcdor_usa_extrnjro',
'           ,indcdor_usa_mxto',
unistr('           ,initcap(nvl(lbel_fcha_expdcion, ''Expedici\00F3n''))'),
'      into :P93_INDCDOR_EXTRNJRO',
'           ,:P93_INDCDOR_MXTO',
'           ,:P93_LBEL_FCHA',
'      from gi_d_definiciones_rentas',
'     where cdgo_clnte = :F_CDGO_CLNTE;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
