prompt --application/pages/page_00139
begin
wwv_flow_api.create_page(
 p_id=>139
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Acto / Informaci\00F3n Relacionada')
,p_step_title=>unistr('Acto / Informaci\00F3n Relacionada')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#region-flotante").draggable();',
'',
'function apenascargue(){',
'      var cncptos = [];',
'    // trae el valor del json',
'    if($v(''P139_CNCPTOS'')){',
'        try{',
'            // convierte en tipo json',
'            cncptos = JSON.parse($v(''P139_CNCPTOS''));                    ',
'        }catch(e){',
'            cncptos = [];',
'        }',
'    }   ',
unistr('    //si el json est\00E1 lleno '),
'    if (cncptos.length > 0){      ',
'        // construye la vista',
'        var view = apex.region(''conceptos'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        cncptos = cncptos.map(m => Number(m.ID_IMPSTO_ACTO_CNCPTO));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;',
'        console.log(cncptos, records);',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return cncptos.indexOf(Number(model.getValue(f, ''ID_IMPSTO_ACTO_CNCPTO''))) > -1',
'        });',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);',
'    } ',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ocultarAyudaD();',
'apenascargue();',
'if( apex.region("conceptos") )',
'    apex.region("conceptos").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' #region-flotante {',
'    position: fixed;',
unistr('    top: 100px; /* Ajusta la posici\00F3n vertical */'),
unistr('    right: 20px; /* Ajusta la posici\00F3n horizontal */'),
unistr('    width: 700px; /* Ancho de la regi\00F3n */'),
'    background-color: #ffffff; /* Color de fondo */',
'    border: 1px solid #ccc; /* Borde */',
'    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Sombra para efecto flotante */',
unistr('    z-index: 1000; /* Asegura que est\00E9 por encima de otros elementos */'),
'    padding: 15px; /* Espaciado interno */',
'    display: none; /* Inicialmente oculta */',
'}',
'#region-flotante.visible {',
unistr('    display: block; /* Mostrar cuando se a\00F1ade la clase ''visible'' */'),
'}',
'',
'',
'#region-flotante {',
'    transition: all 0.3s ease;',
'    opacity: 0;',
'}',
'',
'#region-flotante.visible {',
'    opacity: 1;',
'} ',
'',
'.mi-estilo-personalizado {',
'  background-color: #e0f7fa;',
'  color: #006064;',
'  border: 1px solid #004d40;',
'  font-size: 16px;',
'}',
'',
'.estilo-cool {',
'    border: none;',
'    color: white;',
'    font-size: 12px; ',
'    padding: 5px; ',
'    background-color: transparent;',
'    box-shadow: none;',
'     font-weight: bold;',
'  }'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250710101019'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20407988365857613)
,p_plug_name=>'Contrato Externo'
,p_region_name=>'region-flotante'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10249626935341506)
,p_plug_name=>'Tab Container'
,p_parent_plug_id=>wwv_flow_api.id(20407988365857613)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20408171788857614)
,p_plug_name=>'Contrato'
,p_parent_plug_id=>wwv_flow_api.id(10249626935341506)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20409663984857629)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(10249626935341506)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(152492620193670548)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>	'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(152492711662670549)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
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
unistr('    <p align="center"><b>Liquidaci\00F3n de Rentas Varias.</b> <br> <br> '),
unistr('      Actos y/o informaci\00F3n Adicional<br><br>  </p>'),
unistr('      <p align="justify">En este paso se relacionan el o los actos y los conceptos que ser\00E1n liquidados. <br><br>'),
unistr('      Si el acto relacionado requiere informaci\00F3n adicional, \00E9sta se debe ingresar.</p>'),
'    ',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(152492745443670550)
,p_plug_name=>unistr('Widzard Liquidaci\00F3n de Rentas')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(76379350032438234)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11024508771370638)
,p_plug_name=>'Informacion Acto'
,p_parent_plug_id=>wwv_flow_api.id(152492745443670550)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22104910970913953)
,p_plug_name=>'<b>Impuesto Acto</b>'
,p_region_name=>'actos'
,p_parent_plug_id=>wwv_flow_api.id(11024508771370638)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre_impsto_acto',
'        , a.id_impsto_acto',
'     from v_df_i_impuestos_acto         a',
'    where a.actvo = ''S''',
'    and (a.id_impsto_acto              in ( select c.id_impsto_acto',
'                                               from df_c_grupos_acto_entidad      a',
'                                               join df_i_grupos_acto_impsto_act   b on a.id_grpo_acto     = b.id_grpo_acto',
'                                               join df_i_impuestos_acto           c on b.id_impsto_acto   = c.id_impsto_acto',
'                                              where a.id_entdad                   = nvl(:P138_ID_ENTDAD_USRIO, :P138_ID_ENTDAD)',
'                                                 and c.id_impsto_sbmpsto          = :P138_ID_IMPSTO_SBMPSTO',
'                                                 and (:P138_ID_ENTDAD_USRIO       is not null ',
'                                                   or :P138_ID_ENTDAD             is not null)',
'                                            )',
'    or (:P138_ID_ENTDAD_USRIO is null and :P138_ID_ENTDAD is null and a.id_impsto = :P138_ID_IMPSTO and a.id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO)) '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P138_INDCDOR_LQDA_MLTPLES_ACTOS'
,p_plug_display_when_cond2=>'S'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(a.id_impsto_acto) a',
'     from v_df_i_impuestos_acto           a',
'     join df_i_grupos_acto_impsto_act   b on a.id_impsto_acto   = b.id_impsto_acto',
'     join df_c_grupos_acto_entidad      c on b.id_grpo_acto    = c.id_grpo_acto',
'     join df_c_funcionarios             d on c.id_entdad        = d.id_entdad',
'     join v_sg_g_usuarios               e on d.id_fncnrio       = e.id_fncnrio',
'    where e.id_usrio                    = :F_ID_USRIO',
'   having count(a.id_impsto_acto)       = 1'))
,p_plug_footer=>'Seleccione el (los) Actos que desea liquidar.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22105077049913955)
,p_name=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>250
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
 p_id=>wwv_flow_api.id(22105224855913956)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Impsto Acto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22202177080853411)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(22105046170913954)
,p_internal_uid=>22105046170913954
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(22196482428832057)
,p_interactive_grid_id=>wwv_flow_api.id(22105046170913954)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(22196622184832057)
,p_report_id=>wwv_flow_api.id(22196482428832057)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22197162027832058)
,p_view_id=>wwv_flow_api.id(22196622184832057)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(22105077049913955)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22197635140832059)
,p_view_id=>wwv_flow_api.id(22196622184832057)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(22105224855913956)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(152492453254670547)
,p_plug_name=>'Acto'
,p_parent_plug_id=>wwv_flow_api.id(11024508771370638)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76540970903204526)
,p_plug_name=>'Tab Selector'
,p_parent_plug_id=>wwv_flow_api.id(152492745443670550)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76386571310575212)
,p_plug_name=>'Conceptos'
,p_region_name=>'conceptos'
,p_parent_plug_id=>wwv_flow_api.id(76540970903204526)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_impsto_acto_cncpto',
'        , a.id_impsto_acto',
'        , ''['' || a.cdgo_cncpto  ||  ''] '' || a.dscrpcion_cncpto       dscrpcion_cncpto',
'        , a.dscrpcion_gnra_intres_mra                                gnra_intres_mra',
unistr('        , a.dias_mrgn_mra || '' d\00EDas '' ||lower( a.dscrpcion_tpo_dias) dias_mrgn_mra'),
'     from v_df_i_impuestos_acto_concepto                        a',
'     join df_i_periodos                                         b on a.id_prdo                  = b.id_prdo',
'    where a.id_impsto_acto                                      = :P139_ID_IMPSTO_ACTO',
'      and a.actvo                                               = ''S''',
'      and a.vgncia                                              = :P138_VGNCIA_ACTUAL',
'      and a.prdo                                                = :P138_PRDO_ACTUAL'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76386735673575214)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(76386806299575215)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(76386942302575216)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>106
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
 p_id=>wwv_flow_api.id(76387184535575218)
,p_name=>'GNRA_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GNRA_INTRES_MRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFGenera Interes de Mora?')
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
 p_id=>wwv_flow_api.id(76387985334575226)
,p_name=>'DIAS_MRGN_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRGN_MRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Margen Mora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>56
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
 p_id=>wwv_flow_api.id(76662022203599805)
,p_name=>'Selector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(76386615242575213)
,p_internal_uid=>76386615242575213
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
 p_id=>wwv_flow_api.id(76423350068907867)
,p_interactive_grid_id=>wwv_flow_api.id(76386615242575213)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(76423419342907871)
,p_report_id=>wwv_flow_api.id(76423350068907867)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76423880371907904)
,p_view_id=>wwv_flow_api.id(76423419342907871)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(76386735673575214)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76424326818907927)
,p_view_id=>wwv_flow_api.id(76423419342907871)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(76386806299575215)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76424817305907929)
,p_view_id=>wwv_flow_api.id(76423419342907871)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(76386942302575216)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>601.6669999999999
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76425814035907933)
,p_view_id=>wwv_flow_api.id(76423419342907871)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(76387184535575218)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>237.66699999999997
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76455897455460284)
,p_view_id=>wwv_flow_api.id(76423419342907871)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(76387985334575226)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>227.66699999999997
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76540445122204521)
,p_plug_name=>unistr('Informaci\00F3n Adicional')
,p_parent_plug_id=>wwv_flow_api.id(76540970903204526)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select 1',
'     from df_i_impuestos_acto ',
'    where id_impsto_sbmpsto      = :P138_ID_IMPSTO_SBMPSTO',
'      and id_impsto_acto         = :P139_ID_IMPSTO_ACTO',
'      and indcdor_rqre_ascsda    = ''S'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76541375246204530)
,p_plug_name=>'Metadatos'
,p_region_name=>'adicional'
,p_parent_plug_id=>wwv_flow_api.id(76540970903204526)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(pkg_gi_titulos_ejecutivo.fnc_gn_region_metadatos(p_cdgo_clnte          =>    :F_CDGO_CLNTE,',
'                                                       p_id_impsto           =>    :P138_ID_IMPSTO,',
'                                                       p_id_impsto_sbmpsto   =>    :P138_ID_IMPSTO_SBMPSTO,',
'                                                       p_id_orgen            =>    :P138_ID_RNTA			',
'                                                       ));'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count (1) a',
'     from df_i_impstos_sbmpsto_mtdta',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO',
'    having count (1) > 0;'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94004701805670917)
,p_plug_name=>unistr('Liquidaci\00F3n Asociada')
,p_region_name=>'liquidaciones_padre'
,p_parent_plug_id=>wwv_flow_api.id(76540970903204526)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rnta,      ',
'       a.id_lqdcion, ',
'       ''<span class="fa fa-eye"></span>''  ver,  ',
'       a.nmro_rnta,',
'       a.nmbre_impsto_sbmpsto, ',
'       c.nmbre_impsto_acto, ',
'       a.idntfccion_sjto,   ',
'       a.nmbre_rzon_scial,',
'       a.fcha_expdcion, ',
'       a.fcha_aprbcion,',
'       trunc(d.fcha_rcdo) fcha_rcdo,',
'       to_char(a.vlor_bse_grvble,:F_FRMTO_MNDA) vlor_bse_grvble,',
'       to_char(sum(b.vlor_lqddo),:F_FRMTO_MNDA) vlor_lqddo',
'  from v_gi_g_rentas                a',
'  join v_gi_g_rentas_acto_concepto  b on a.id_rnta = b.id_rnta ',
'                                     and b.ID_IMPSTO_ACTO = :P139_ID_IMPSTO_ACTO_PDRE',
'  join df_i_impuestos_acto          c on b.id_impsto_acto = c.id_impsto_acto',
'  join v_re_g_recaudos              d on a.nmro_dcmnto    = d.nmro_dcmnto',
'                                     and d.cdgo_rcdo_estdo  = ''AP''',
' where a.cdgo_rnta_estdo   = ''APB'' ',
'   and a.indcdor_rnta_pgda = ''S''',
'   -- no tenga liquidaciones con el acto hijo',
'   and not exists ( select g.id_rnta',
'                      from gi_g_rentas                g',
'                     where g.id_rnta_antrior = a.id_rnta',
unistr('                       and g.cdgo_rnta_estdo in (''RGS'', ''APB'') -- para la actualizaci\00F3n de la renta VUR'),
'                  ) ',
' group by a.id_rnta,       ',
'          a.id_lqdcion,    ',
'          a.nmro_rnta,',
'          a.nmbre_impsto_sbmpsto, ',
'          c.nmbre_impsto_acto, ',
'          a.idntfccion_sjto, ',
'          a.nmbre_rzon_scial,',
'          a.fcha_expdcion, ',
'          a.fcha_aprbcion,',
'          d.fcha_rcdo,',
'          a.vlor_bse_grvble;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P139_ID_IMPSTO_ACTO_PDRE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94004923251670919)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(94005027764670920)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(94005103458670921)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(94005297070670922)
,p_name=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>250
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
 p_id=>wwv_flow_api.id(94005370460670923)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n<br>Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(94005440331670924)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre <br>Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(94005543732670925)
,p_name=>'FCHA_EXPDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_EXPDCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha <br>Expedici\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
,p_include_in_export=>true
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94005664859670926)
,p_name=>'FCHA_APRBCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APRBCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha<br> Aprobaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94006029553670930)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor <br> Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94973740606449010)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94973948917449012)
,p_name=>'NMRO_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero <br>Liquidaci\00F3n')
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94974033785449013)
,p_name=>'FCHA_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RCDO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha<br>Pago'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94974249170449015)
,p_name=>'VLOR_BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_BSE_GRVBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor Base<br>Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94974300555449016)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(94004830089670918)
,p_internal_uid=>94004830089670918
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
,p_toolbar_buttons=>'SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(94917264012259487)
,p_interactive_grid_id=>wwv_flow_api.id(94004830089670918)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(94917379568259489)
,p_report_id=>wwv_flow_api.id(94917264012259487)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33914535378848)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(94974249170449015)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94917802199259499)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(94004923251670919)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>44
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94918370211259503)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(94005027764670920)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94918858156259505)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(94005103458670921)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94919333986259507)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(94005297070670922)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>345
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94919854987259509)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(94005370460670923)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94920394543259511)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(94005440331670924)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>173
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94920804292259513)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(94005543732670925)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94921308306259515)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(94005664859670926)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94923362643259522)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(94006029553670930)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95991025076458145)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(94973948917449012)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95991509693458149)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(94974033785449013)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>158
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96050299075945491)
,p_view_id=>wwv_flow_api.id(94917379568259489)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(94974300555449016)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79883023341484514)
,p_plug_name=>unistr('Informaci\00F3n renta')
,p_parent_plug_id=>wwv_flow_api.id(152492745443670550)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164070834422707671)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10268814650549148)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(152492453254670547)
,p_button_name=>'BTN_CNTRTO_EXTRNO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--link'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Contrato Externo'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>8
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10256670831534301)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20407988365857613)
,p_button_name=>'BTN_CERRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Cerrar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76402439262785533)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(152492745443670550)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perdera todos los cambios que no se han guardado'',''CANCEL'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76402019918785530)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(152492745443670550)
,p_button_name=>'NEXT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76386370917575210)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(152492745443670550)
,p_button_name=>'PREVIUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76409247766785570)
,p_branch_name=>unistr('Ir a la P\00E1gina 141 / Siguiente / Proyecci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76402019918785530)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(77075655878293021)
,p_branch_name=>unistr('Ir a la P\00E1gina 89/136- Informe de Rentas')
,p_branch_action=>'P138_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(76402439262785533)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4386199702896610)
,p_name=>'P139_TIPO_TERCERO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10257376229534304)
,p_name=>'P139_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10257793969534306)
,p_name=>'P139_NMRO_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>unistr('No. Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10258186932534306)
,p_name=>'P139_NMBRE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10258585808534306)
,p_name=>'P139_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10258991927534307)
,p_name=>'P139_TLFNO_EXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10259331492534307)
,p_name=>'P139_CORREO_EXT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10259728259534307)
,p_name=>'P139_NMBRE_DPRTMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10260119312534307)
,p_name=>'P139_NMBRE_MNCPIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10260542130534308)
,p_name=>'P139_TPO_RGMEN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>'Tipo Regimen'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10260927005534308)
,p_name=>'P139_TPO_PRSNA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>'Tipo Persona'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10261390911534308)
,p_name=>'P139_RSPNSBLE_DE_IVA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(20409663984857629)
,p_prompt=>unistr('\00BFResponsable de IVA?')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10262079129534309)
,p_name=>'P139_NMRO_CNTRTO_EXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'No. Contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10262441299534309)
,p_name=>'P139_OBJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Objeto'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cHeight=>5
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10262881347534309)
,p_name=>'P139_FCHA_INCIO_CNTRTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10263271082534309)
,p_name=>'P139_FCHA_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10263630078534310)
,p_name=>'P139_FCHA_FRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Fecha Firma'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10264005103534310)
,p_name=>'P139_VLOR_CNTRTO_INCLYE_IVA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Valor con IVA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10264495147534310)
,p_name=>'P139_VLOR_CNTRTO_SIN_IVA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Valor sin IVA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10264866308534310)
,p_name=>'P139_VLOR_IVA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Iva'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10265219054534311)
,p_name=>'P139_TPO_CNTRTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Tipo Contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10265643030534311)
,p_name=>'P139_DRCION_DIAS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>unistr('Duraci\00F3n Dias')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10266068994534311)
,p_name=>'P139_DRCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>unistr('Duraci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10266476502534312)
,p_name=>'P139_DSCRPCION_FRMA_PGO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Forma de Pago'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10266816504534312)
,p_name=>'P139_NMBRE_DPNDNCIA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Dependencia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10267249317534312)
,p_name=>'P139_CNSCTVO_RP'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Consecutivo RP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10267677369534312)
,p_name=>'P139_FCHA_RP'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Fecha RP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10268069626534313)
,p_name=>'P139_ESTDO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(20408171788857614)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11024288367370635)
,p_name=>'P139_ACTOS_SLCCNDOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22104910970913953)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11562610476628305)
,p_name=>'P139_INDCDOR_VLDA_PRDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11562750333628306)
,p_name=>'P139_NMRO_RNTA_EXSTE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11562865448628307)
,p_name=>'P139_RSPSTA_EXSTE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11867045410348701)
,p_name=>'P139_INDCDOR_MNJA_SCRSAL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76386442517575211)
,p_name=>'P139_ID_IMPSTO_ACTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_prompt=>'Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_acto ',
'        , id_impsto_acto ',
'     from v_df_i_impuestos_acto         a',
'    where a.actvo = ''S''',
'    and (a.id_impsto_acto              in ( select c.id_impsto_acto',
'                                               from df_c_grupos_acto_entidad      a',
'                                               join df_i_grupos_acto_impsto_act   b on a.id_grpo_acto     = b.id_grpo_acto',
'                                               join df_i_impuestos_acto           c on b.id_impsto_acto   = c.id_impsto_acto',
'                                              where a.id_entdad                   = nvl(:P138_ID_ENTDAD_USRIO, :P138_ID_ENTDAD)',
'                                                 and c.id_impsto_sbmpsto          = :P138_ID_IMPSTO_SBMPSTO',
'                                                 and (:P138_ID_ENTDAD_USRIO       is not null ',
'                                                   or :P138_ID_ENTDAD             is not null)',
'                                            )',
'    or (:P138_ID_ENTDAD_USRIO is null and :P138_ID_ENTDAD is null and id_impsto = :P138_ID_IMPSTO and id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO))',
' order by nmbre_impsto_acto'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un Acto --'
,p_display_when=>'P138_INDCDOR_LQDA_MLTPLES_ACTOS'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(a.id_impsto_acto) a',
'     from v_df_i_impuestos_acto           a',
'     join df_i_grupos_acto_impsto_act   b on a.id_impsto_acto   = b.id_impsto_acto',
'     join df_c_grupos_acto_entidad      c on b.id_grpo_acto    = c.id_grpo_acto',
'     join df_c_funcionarios             d on c.id_entdad        = d.id_entdad',
'     join v_sg_g_usuarios               e on d.id_fncnrio       = e.id_fncnrio',
'    where e.id_usrio                    = :F_ID_USRIO',
'   having count(a.id_impsto_acto)       = 1'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el acto que desea registrar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76541083115204527)
,p_name=>'P139_ID_IMPSTO_ASCDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76540445122204521)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select min(id_sbmpsto_ascda)',
'     from gi_d_subimpuestos_asociada',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO',
'      and activo                        = ''S'';'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Asociada'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion d',
'        , id_sbmpsto_ascda ',
'     from gi_d_subimpuestos_asociada',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO',
'      and activo                        = ''S'';'))
,p_cHeight=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(id_sbmpsto_ascda)',
'     from gi_d_subimpuestos_asociada',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO',
'      and activo                        = ''S''',
' having  count(id_sbmpsto_ascda) = 1'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76541120960204528)
,p_name=>'P139_TXTO_ASCDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76540445122204521)
,p_prompt=>'Soporte'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76661915559599804)
,p_name=>'P139_CNCPTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76386571310575212)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76753805989970001)
,p_name=>'P139_INDCDOR_USA_EXTRNJRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFExtranjero?')
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>'P138_USA_INDCDOR_EXTRNJRO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Determine si el sujeto pasivo es de nacionalidad extranjera.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76753973423970002)
,p_name=>'P139_INDCDOR_USA_MXTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P138_USA_INDCDOR_MXTO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Determine si el hecho generador fue constituido por una entidad p\00FAlbica y privada')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77075375789293018)
,p_name=>'P139_INDCDOR_CNTRTO_GSLNA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFContrato de Combustible?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Determine si el hecho generador es de combustible'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77076743921293032)
,p_name=>'P139_JSON_MTDTOS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76540445122204521)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79883160925484515)
,p_name=>'P139_NMRO_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(79883023341484514)
,p_prompt=>unistr('N\00B0 Liquidaci\00F3n')
,p_source=>'P138_NMRO_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>5
,p_display_when=>'P138_NMRO_RNTA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94007428231670944)
,p_name=>'P139_ID_RNTA_ASCDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(94004701805670917)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94972871342449001)
,p_name=>'P139_ID_IMPSTO_ACTO_PDRE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100914486236162101)
,p_name=>'P139_FCHA_EXPDCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_prompt=>'&P138_LBEL_FCHA.'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>13
,p_tag_attributes=>'onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de suscripci\00F3n del hecho generador.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102339541390460925)
,p_name=>'P139_INDCDOR_MNJA_CNTRTO_ESE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFContrato de  ESE?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Determine si el hecho generador es de ESE'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102339860737460928)
,p_name=>'P139_CNTRO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(152492453254670547)
,p_prompt=>'Tipo de Contrato'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select ''Contrato de Combustible''          cdgo_cntrto_tpo',
'        , ''GSLNA''                           dscrpcion_cntrto_tpo',
'    from v_gi_d_rntas_cnfgrcion_sbmpst   ',
'   where cdgo_clnte                         = :F_CDGO_CLNTE',
'     and id_impsto_sbmpsto                  = :P138_ID_IMPSTO_SBMPSTO',
'     and indcdor_cntrto_gslna               = ''S''',
'union',
'   select ''Contrato de E.S.E''               cdgo_cntrto_tpo',
'        , ''ESE''                             dscrpcion_cntrto_tpo',
'     from v_gi_d_rntas_cnfgrcion_sbmpst   ',
'     where cdgo_clnte                       = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto                 = :P138_ID_IMPSTO_SBMPSTO',
'      and indcdor_mnja_cntrto_ese           = ''S''',
'      and (:P138_INDCDOR_RQRE_ENTDAD        = ''S''',
'      and ( nvl(:P138_ID_ENTDAD_USRIO, :P138_ID_ENTDAD)            in (select id_entdad ',
'                                               from df_s_entidades ',
'                                              where indcdor_mnja_cntro_ese = ''S''',
'                                              )',
'          ))'))
,p_lov_display_null=>'YES'
,p_colspan=>5
,p_grid_column=>1
,p_display_when=>':P138_INDCDOR_CNTRTO_GSLNA =  ''S'' or :P139_INDCDOR_MNJA_CNTRTO_ESE = ''S'''
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(76539688014204513)
,p_computation_sequence=>10
,p_computation_item=>'P139_ID_IMPSTO_ACTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select min( a.id_impsto_acto)',
'     from v_df_i_impuestos_acto         a',
'    where a.id_impsto_acto              in ( select c.id_impsto_acto',
'                                               from df_c_grupos_acto_entidad      a',
'                                               join df_i_grupos_acto_impsto_act   b on a.id_grpo_acto     = b.id_grpo_acto',
'                                               join df_i_impuestos_acto           c on b.id_impsto_acto   = c.id_impsto_acto',
'                                              where a.id_entdad                   = nvl(:P138_ID_ENTDAD_USRIO, :P138_ID_ENTDAD)',
'                                                 and c.id_impsto_sbmpsto          = :P138_ID_IMPSTO_SBMPSTO',
'                                                 and (:P138_ID_ENTDAD_USRIO       is not null ',
'                                                   or :P138_ID_ENTDAD             is not null)',
'                                            )',
'    or (:P138_ID_ENTDAD_USRIO is null and :P138_ID_ENTDAD is null and a.id_impsto = :P138_ID_IMPSTO and a.id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO)',
' order by a.nmbre_impsto_acto;',
' '))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(102856530500131211)
,p_computation_sequence=>20
,p_computation_item=>'P139_CNTRO_TPO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select  decode(:P139_INDCDOR_MNJA_CNTRTO_ESE, ''S'',''ESE'', DECODE(:P139_INDCDOR_CNTRTO_GSLNA, ''S'',''GSLNA'', ''''))   dscrpcion_cntrto_tpo',
'     from v_gi_d_rntas_cnfgrcion_sbmpst   ',
'     where cdgo_clnte                       = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto                 = :P138_ID_IMPSTO_SBMPSTO',
'',
''))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4386341641896612)
,p_validation_name=>'Valida Tipo de tercero'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_trcro_tpo ',
'      from v_si_i_sujetos_responsable    a',
'      join v_si_c_terceros               b on a.cdgo_clnte   = b.cdgo_clnte',
'       and a.idntfccion_rspnsble         = b.idntfccion',
'     where a.id_sjto_impsto              = :P138_ID_SJTO_IMPSTO',
'       and prncpal_s_n                   = ''S''',
'       and cdgo_trcro_tpo                is not null;'))
,p_validation_type=>'EXISTS'
,p_error_message=>'El Sujeto tributo no tiene parametrizado si es mayorista o minorista.'
,p_always_execute=>'Y'
,p_validation_condition=>'P139_CNTRO_TPO'
,p_validation_condition2=>'GSLNA'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(77075375789293018)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76541489920204531)
,p_validation_name=>'Validar Asociada no Nulo'
,p_validation_sequence=>20
,p_validation=>'P139_ID_IMPSTO_ASCDA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione una asociada'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select count(1) a',
'     from df_i_impuestos_acto ',
'    where id_impsto_sbmpsto      = :P138_ID_IMPSTO_SBMPSTO',
'      and id_impsto_acto         = :P139_ID_IMPSTO_ACTO',
'      and indcdor_rqre_ascsda    = ''S''',
'      having count(1) > 0'))
,p_validation_condition_type=>'EXISTS'
,p_when_button_pressed=>wwv_flow_api.id(76402019918785530)
,p_associated_item=>wwv_flow_api.id(76541083115204527)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76541640288204533)
,p_validation_name=>'Validar texto de Asociada no Nulo'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rqre_ascsda       number;',
'    v_indcdor_vldcion   varchar2(1);',
'    v_cntidad           number;',
'begin',
'',
'    select count(1) a',
'      into v_rqre_ascsda',
'      from df_i_impuestos_acto ',
'     where id_impsto_sbmpsto      = :P138_ID_IMPSTO_SBMPSTO',
'       and id_impsto_acto         = :P139_ID_IMPSTO_ACTO',
'       and indcdor_rqre_ascsda    = ''S''',
'    --having count(1) > 0',
'    ;',
'    ',
'    if ( v_rqre_ascsda > 0 ) then ',
'       if ( :P139_TXTO_ASCDA is not null ) then',
'        select indcdor_vldcion',
'          into v_indcdor_vldcion',
'          from gi_d_subimpuestos_asociada',
'         where cdgo_clnte         = :F_CDGO_CLNTE',
'           and id_impsto_sbmpsto  = :P138_ID_IMPSTO_SBMPSTO;',
'        ',
'        if ( v_indcdor_vldcion = ''S'' ) then',
'           select count(1) into v_cntidad',
'             from gi_g_rentas',
'            where cdgo_clnte        = :F_CDGO_CLNTE          ',
'              and id_impsto         = :P138_ID_IMPSTO             ',
'              and id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO',
'              and id_sbmpsto_ascda  = :P139_ID_IMPSTO_ASCDA ',
'              and txto_ascda        = :P139_TXTO_ASCDA ',
'              and cdgo_rnta_estdo   <> ''RCH'' ;',
'        ',
'            if ( v_cntidad = 0 ) then',
'               return true;',
'            else',
'               return false;',
'            end if;',
'        else',
'            return true;',
'        end if;      ',
'      else',
'        return false;',
'      end if;        ',
'    else',
'        return true;',
'    end if;',
'    ',
'exception ',
'   when others then  ',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Por favor ingrese un soporte v\00E1lido')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(76402019918785530)
,p_associated_item=>wwv_flow_api.id(76541120960204528)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77073904871293004)
,p_validation_name=>'Validar conceptos no nullo'
,p_validation_sequence=>40
,p_validation=>'P139_CNCPTOS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Para poder continuar debe seleccionar los conceptos'
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(76402019918785530)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6212091158084401)
,p_validation_name=>unistr('Validar Fecha de Expedici\00F3n no nula')
,p_validation_sequence=>50
,p_validation=>'P139_FCHA_EXPDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar una fecha para continuar'
,p_when_button_pressed=>wwv_flow_api.id(76402019918785530)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(105051091821298315)
,p_validation_name=>'Validar Tarifa Esquema'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta        number;',
'    o_mnsje_rspsta       clob;',
'begin ',
'',
'    for c_impsto_acto in ( select  id_impsto_acto   ',
'                           from json_table(:P139_ACTOS_SLCCNDOS,  ''$[*]'' columns',
'                                            id_impsto_acto number path ''$.ID_IMPSTO_ACTO'' ',
'                                          )',
'                         ) loop',
'                            pkg_gi_rentas.prc_vl_tarifa_esquema ( p_cdgo_clnte							=> :F_CDGO_CLNTE',
'                                                                , p_id_impsto							=> :P138_ID_IMPSTO',
'                                                                , p_id_impsto_sbmpsto					=> :P138_ID_IMPSTO_SBMPSTO',
'                                                                , p_id_impsto_acto						=> c_impsto_acto.id_impsto_acto',
'                                                                , p_fcha_expdcion						=> :P139_FCHA_EXPDCION',
'                                                                , o_cdgo_rspsta							=> o_cdgo_rspsta',
'                                                                , o_mnsje_rspsta						=> o_mnsje_rspsta);',
'        if o_cdgo_rspsta != 0 then',
'            return o_mnsje_rspsta;',
'        end if;',
'    end loop;',
'',
'    return null;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(76402019918785530)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(11562540113628304)
,p_validation_name=>'Valida no exista liquidacion  para la vgncia prdo'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    -- Se busca si el subimpuesto valida periodo para las tarifas',
'    select indcdor_vlda_prdo ',
'    into :P139_INDCDOR_VLDA_PRDO',
'      from v_gi_d_rntas_cnfgrcion_sbmpst',
'     where  cdgo_clnte = :F_CDGO_CLNTE',
'        and id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO;',
'',
'    ',
'    if :P139_INDCDOR_VLDA_PRDO = ''S'' then ',
'    ',
'        begin',
'            -- Se verifica si ya existe una liquidacion para esa vigencia/periodo',
'            select nmro_rnta',
'            into :P139_NMRO_RNTA_EXSTE',
'            from gi_g_rentas  a',
'                join gi_g_rentas_acto b on a.id_rnta = b.id_rnta',
'            where a.cdgo_clnte          = :F_CDGO_CLNTE',
'                and a.id_impsto         = :P138_ID_IMPSTO',
'                and a.id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO',
'                and b.id_impsto_acto    = :P139_ID_IMPSTO_ACTO',
'                and a.id_sjto_impsto    = :P138_ID_SJTO_IMPSTO',
'                and a.id_sjto_scrsal    = :P138_ID_SJTO_SCRSAL',
'                and extract(month from to_date(a.fcha_expdcion))     = extract(month from to_date(:P139_FCHA_EXPDCION)) ',
'                and extract(year from to_date(a.fcha_expdcion))      = extract(year from to_date(:P139_FCHA_EXPDCION)) ',
'                and a.cdgo_rnta_estdo   in (''APB'', ''LQD'')',
'                and rownum = 1;',
'',
'',
unistr('                :P139_RSPSTA_EXSTE := :F_NMBRE_USRIO || ''. '' || ''Con base en la informaci\00F3n  '),
unistr('                                        que est\00E1 intentando procesar, hemos encontrado que ya existe una liquidaci\00F3n '),
unistr('                                        en el sistema con la misma vigencia/periodo, Liquidaci\00F3n No. [ '' || :P139_NMRO_RNTA_EXSTE || '' ].         '),
unistr('                                        Por este motivo, no es posible continuar con esta liquidaci\00F3n. '';'),
'',
'                return false;	',
'         exception ',
'	            when no_data_found then ',
'		            return true;',
'          end;',
'     else',
'         return true;',
'     end if;',
'							',
'exception ',
'	when no_data_found then ',
'		return true;',
'end;',
'--return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&P139_RSPSTA_EXSTE.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(76402019918785530)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(11024457481370637)
,p_validation_name=>'Validar seleccion de actos'
,p_validation_sequence=>80
,p_validation=>'P139_ACTOS_SLCCNDOS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor, seleccione al menos un acto para liquidar.'
,p_when_button_pressed=>wwv_flow_api.id(76402019918785530)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76387700789575224)
,p_name=>'Al cambiar el impuesto acto'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P139_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94008050906670950)
,p_event_id=>wwv_flow_api.id(76387700789575224)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_impsto_acto_pdre a',
'     into :P139_ID_IMPSTO_ACTO_PDRE',
'     from df_i_impuestos_acto           a ',
'    where a.id_impsto_acto = :P139_ID_IMPSTO_ACTO;'))
,p_attribute_02=>'P139_ID_IMPSTO_ACTO'
,p_attribute_03=>'P139_ID_IMPSTO_ACTO_PDRE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76387803942575225)
,p_event_id=>wwv_flow_api.id(76387700789575224)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5069733234697145)
,p_event_id=>wwv_flow_api.id(76387700789575224)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	select json_arrayagg(',
'         json_object(''ID_IMPSTO_ACTO'' value :P139_ID_IMPSTO_ACTO)  ',
'       ) ',
'    into :P139_ACTOS_SLCCNDOS',
'	from dual;'))
,p_attribute_02=>'P139_ACTOS_SLCCNDOS'
,p_attribute_03=>'P139_ACTOS_SLCCNDOS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76661726799599802)
,p_name=>'Al Seleccionar Conceptos'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(76386571310575212)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76661800824599803)
,p_event_id=>wwv_flow_api.id(76661726799599802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(76386571310575212)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if( apex.region("conceptos") )',
'    apex.region("conceptos").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");',
'',
'    if(this.data.selectedRecords.length > 0) {',
'        var model = this.data.model;',
'        var records = this.data.selectedRecords; ',
'        var json = records.map(function (record){',
'            return {''ID_IMPSTO_ACTO_CNCPTO'':  model.getValue(record, ''ID_IMPSTO_ACTO_CNCPTO'') };',
'        });         ',
'        $s(''P139_CNCPTOS'', JSON.stringify(json)); ',
'    }'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76754120016970004)
,p_name=>unistr('Mostrar Items de liquidaci\00F3n anterior')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P139_INDCDOR_LQDCCION_ADCNAL'
,p_condition_element=>'P139_INDCDOR_LQDCCION_ADCNAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76754229045970005)
,p_event_id=>wwv_flow_api.id(76754120016970004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P139_INDCDOR_CNTRTO_GSLNA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76754447227970007)
,p_event_id=>wwv_flow_api.id(76754120016970004)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P139_INDCDOR_CNTRTO_GSLNA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77076488776293029)
,p_name=>'Validar de campos de Metadatos'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76402019918785530)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77076544093293030)
,p_event_id=>wwv_flow_api.id(77076488776293029)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(76541375246204530)
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
'    $s(''P139_JSON_MTDTOS'', JSON.stringify(json));',
'    apex.submit(''NEXT'');',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94007547750670945)
,p_name=>unistr('Al seleccionar liquidaci\00F3n padre')
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(94004701805670917)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94007606788670946)
,p_event_id=>wwv_flow_api.id(94007547750670945)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(94004701805670917)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s(''P139_ID_RNTA_ASCDA'' , this.data.model.getValue(this.data.selectedRecords[0] , "ID_RNTA"));',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10249452393341504)
,p_name=>'Al dar click Boton BTN_CNTRTO_EXTRNO'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10268814650549148)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10249525377341505)
,p_event_id=>wwv_flow_api.id(10249452393341504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = $("#region-flotante");',
'region.toggleClass("visible");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10249728906341507)
,p_name=>'Al dar click BTN_CERRAR'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10256670831534301)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10249815252341508)
,p_event_id=>wwv_flow_api.id(10249728906341507)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#region-flotante").removeClass("visible");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11183289228492116)
,p_name=>'Al seleccionar los actos, crear el json de actos a liquidar'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(22104910970913953)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11184115121492120)
,p_event_id=>wwv_flow_api.id(11183289228492116)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P139_ACTOS_SLCCNDOS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.data.selectedRecords.length > 0) {        ',
'    var model = this.data.model;',
'    var records = this.data.selectedRecords; ',
'',
'        var json = records.map(function (record){',
'            return {',
'                ''ID_IMPSTO_ACTO'': model.getValue(record, ''ID_IMPSTO_ACTO'')  ',
'            };',
'        });         ',
'    ',
'        $s(''P139_ACTOS_SLCCNDOS'', JSON.stringify(json));',
'}else{ ',
'    apex.item(''P139_ACTOS_SLCCNDOS'').setValue(null);',
'} ',
'',
'window.localStorage.setItem(''jsonImpuestoActoSeleccionado'', JSON.stringify(json));'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11183604322492119)
,p_event_id=>wwv_flow_api.id(11183289228492116)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P139_ACTOS_SLCCNDOS'
,p_attribute_03=>'P139_ACTOS_SLCCNDOS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6212579530084406)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Impuesto acto concepto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select min( a.id_impsto_acto)',
'     into :P139_ID_IMPSTO_ACTO',
'     from v_df_i_impuestos_acto         a',
'    where a.id_impsto_acto              in ( select c.id_impsto_acto',
'                                               from df_c_grupos_acto_entidad      a',
'                                               join df_i_grupos_acto_impsto_act   b on a.id_grpo_acto     = b.id_grpo_acto',
'                                               join df_i_impuestos_acto           c on b.id_impsto_acto   = c.id_impsto_acto',
'                                              where a.id_entdad                   = nvl(:P138_ID_ENTDAD_USRIO, :P138_ID_ENTDAD)',
'                                                 and c.id_impsto_sbmpsto          = :P138_ID_IMPSTO_SBMPSTO',
'                                                 and (:P138_ID_ENTDAD_USRIO       is not null ',
'                                                   or :P138_ID_ENTDAD             is not null)',
'                                            )',
'    or (:P138_ID_ENTDAD_USRIO is null and :P138_ID_ENTDAD is null and a.id_impsto = :P138_ID_IMPSTO and a.id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO)',
' order by a.nmbre_impsto_acto;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P138_ID_ENTDAD is not null and :P139_ID_IMPSTO_ACTO is null and 1 = 2'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94973893372449011)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(94004701805670917)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Liquidaciones Padre - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10255779730532069)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Informacion Contrato Externo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        select   a.nmro_cntrto',
'                ,a.objto',
'                ,a.fcha_frma',
'                ,a.fcha_incio_cntrto',
'                ,a.fcha_fin',
'                ,a.vlor_cntrto_inclye_iva',
'                ,a.vlor_cntrto_sin_iva',
'                ,a.vlor_iva',
'                ,a.tpo_cntrto',
'                ,a.drcion_dias',
'                ,a.dscrpcion_frma_pgo',
'                ,a.drcion',
'                ,a.cdgo_dpndncia ||'' ''|| a.nmbre_dpndncia',
'                ,a.prmer_nmbre || '' '' || a.sgndo_nmbre || '' '' || a.prmer_aplldo || '' '' || a.sgndo_aplldo',
'                ,a.drccion',
'                ,a.tlfno',
'                ,a.correo ',
'                ,decode(a.tpo_prsna,''N'', ''Natural'', ''J'', ''Juridica'', ''Otro'') tpo_prsna',
'                ,(select dscrpcion_idntfccion_tpo from df_s_identificaciones_tipo where cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo)',
'                ,a.nmro_idntfccion ',
'                , (select nmbre_dprtmnto from df_s_departamentos where cdgo_dprtmnto  = a.cdgo_dprtmnto ) nmbre_dprtmnto',
'                , (select nmbre_mncpio   from df_s_municipios where cdgo_mncpio =  a.cdgo_mncpio)  nmbre_mncpio ',
'                ,a.tpo_rgmen',
'                ,a.estdo',
'                ,a.rspnsble_de_iva',
'                ,a.cnsctvo_rp',
'                ,a.fcha_rp',
'            into',
'                 :P139_NMRO_CNTRTO_EXT',
'                ,:P139_OBJTO',
'                ,:P139_FCHA_FRMA',
'                ,:P139_FCHA_INCIO_CNTRTO',
'                ,:P139_FCHA_FIN',
'                ,:P139_VLOR_CNTRTO_INCLYE_IVA',
'                ,:P139_VLOR_CNTRTO_SIN_IVA',
'                ,:P139_VLOR_IVA',
'                ,:P139_TPO_CNTRTO',
'                ,:P139_DRCION_DIAS',
'                ,:P139_DSCRPCION_FRMA_PGO',
'                ,:P139_DRCION ',
'                ,:P139_NMBRE_DPNDNCIA',
'                ,:P139_NMBRE ',
'                ,:P139_DRCCION',
'                ,:P139_TLFNO_EXT',
'                ,:P139_CORREO_EXT',
'                ,:P139_TPO_PRSNA',
'                ,:P139_CDGO_IDNTFCCION_TPO',
'                ,:P139_NMRO_IDNTFCCION',
'                ,:P139_NMBRE_DPRTMNTO',
'                ,:P139_NMBRE_MNCPIO',
'                ,:P139_TPO_RGMEN',
'                ,:P139_ESTDO',
'                ,:P139_RSPNSBLE_DE_IVA ',
'                ,:P139_CNSCTVO_RP        ',
'                ,:P139_FCHA_RP   ',
'        from gi_g_rentas_contrato_externo a',
'            where a.id_rnta_cntrto_extrno =  :P138_ID_RNTA_CNTRTO_EXTRNO;',
'exception',
'    when others then',
'        :P139_NMRO_CNTRTO_EXT				:= null;',
'        :P139_OBJTO                         := null;',
'        :P139_FCHA_FRMA                     := null;',
'        :P139_FCHA_FIN                      := null;',
'        :P139_FCHA_INCIO_CNTRTO             := null;',
'        :P139_VLOR_CNTRTO_INCLYE_IVA        := null;',
'        :P139_VLOR_CNTRTO_SIN_IVA           := null;',
'        :P139_VLOR_IVA                      := null;',
'        :P139_TPO_CNTRTO                    := null;',
'        :P139_DRCION_DIAS                   := null;',
'        :P139_DSCRPCION_FRMA_PGO            := null;',
'        :P139_DRCION                        := null;',
'        :P139_NMBRE_DPNDNCIA                := null;',
'        :P139_NMBRE                         := null;',
'        :P139_DRCCION                       := null;',
'        :P139_TLFNO_EXT                     := null;',
'        :P139_CORREO_EXT                    := null;',
'        :P139_TPO_PRSNA                     := null;',
'        :P139_CDGO_IDNTFCCION_TPO           := null;',
'        :P139_NMRO_IDNTFCCION               := null;',
'        :P139_NMBRE_DPRTMNTO                := null;',
'        :P139_NMBRE_MNCPIO                  := null;',
'        :P139_TPO_RGMEN                     := null;',
'        :P139_ESTDO                         := null; ',
'        :P139_RSPNSBLE_DE_IVA               := null; ',
'        :P139_CNSCTVO_RP                    := null; ',
'        :P139_FCHA_RP                       := null; ',
'end;',
'',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
