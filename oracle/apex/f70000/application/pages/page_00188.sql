prompt --application/pages/page_00188
begin
wwv_flow_api.create_page(
 p_id=>188
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Consulta de Solicitud de Pin'
,p_step_title=>'Consulta de Solicitud de Pin'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let consultarSujeto = (event, expresion) => {',
'',
'    if (event.key == "Enter") {',
'        ',
'        if ($v(''P188_NIT'') != ''''){',
'            return apex.submit({ request: ''btn_consultar'', submitIfEnter: event});                        ',
'        }else{',
'           Swal.fire({',
unistr('                //icon: ''Validaci\00F3n'','),
unistr('               title: ''<H2 >Validaci\00F3n</H2>'','),
unistr('                html: `<h4>Digite una Identificaci\00F3n</h4>`'),
'           }); ',
'        }',
'    }',
'    ',
'    return validarExpresion(event, expresion);',
'};',
'',
''))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JRANGEL'
,p_last_upd_yyyymmddhh24miss=>'20201204082846'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99845692028009111)
,p_plug_name=>'Consultar Sujeto Impuesto y Pin'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99846348274009118)
,p_plug_name=>unistr('Informaci\00F3n del Sujeto')
,p_parent_plug_id=>wwv_flow_api.id(99845692028009111)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P188_ID_SJTO_IMPSTO'
,p_attribute_01=>'P188_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99846415061009119)
,p_plug_name=>'Solicitudes VUR'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99848285797009137)
,p_plug_name=>unistr('Solicitudes de Liquidaci\00F3n de VUR')
,p_parent_plug_id=>wwv_flow_api.id(99846415061009119)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_rnta,',
'        a.nmro_rnta, ',
'        a.fcha_rgstro,',
'        a.vlor_bse_grvble,',
'        a.cdgo_rnta_estdo,',
'        a.id_dcmnto,',
'        case when a.cdgo_rnta_estdo in (''APB'',''LQD'') then',
'                  ''<span class="fa fa-print" aria-hidden="true"></span>''',
'             else',
'                  ''''   ',
'        end as IMPRMIR,',
'        b.nmro_dcmnto,',
'        trunc(b.fcha_vncmnto) as fcha_vncmnto,',
'        case when a.cdgo_rnta_estdo = ''APB'' then',
'                    case when b.indcdor_pgo_aplcdo = ''S'' then ',
'                            ''Pagado''',
'                         else',
'                            case when trunc(b.fcha_vncmnto) < trunc(sysdate) then',
'                                    ''Vencido''',
'                                 else',
'                                    ''Vigente''                        ',
'                            end',
'                    end             ',
'             else',
'              ''''',
'        end as indcdor_pgo,',
'         case when b.indcdor_pgo_aplcdo = ''N'' then ',
'            case when trunc(b.fcha_vncmnto) < trunc(sysdate) then',
'                       ''<span class="fa fa-exchange" aria-hidden="true"></span>''  ',
'                 else',
'                      ''''   ',
'            end          ',
'        end as VENCIDO',
'   from gi_g_rentas          a',
'   left join re_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'  where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_impsto         = :P188_ID_IMPSTO',
'    and a.id_impsto_sbmpsto = :P188_ID_IMPSTO_SBMPSTO',
'    and a.id_sjto_impsto    = :P188_ID_SJTO_IMPSTO',
'    and a.nmro_rnta         = nvl(:P188_PIN,a.nmro_rnta)',
'   -- and a.id_usrio          = :F_ID_USRIO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99848428149009139)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Rnta'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(99848596992009140)
,p_name=>'NMRO_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00BA Liquidaci\00F3n ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(99848614064009141)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha <br> de Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(99848733285009142)
,p_name=>'VLOR_BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(99848826199009143)
,p_name=>'CDGO_RNTA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_RNTA_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado de Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion,',
'        cdgo_rnta_estdo ',
'from    gi_d_rentas_estado'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99848931872009144)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Dcmnto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(99849028121009145)
,p_name=>'IMPRMIR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPRMIR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documento <br> de Pago'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&IMPRMIR.'
,p_link_target=>'f?p=&APP_ID.:188:&SESSION.:imprimir:&DEBUG.:RP:P188_ID_RNTA,P188_ID_DCMNTO,P188_NMRO_RNTA:&ID_RNTA.,&ID_DCMNTO.,&NMRO_RNTA.'
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
 p_id=>wwv_flow_api.id(99849115786009146)
,p_name=>'NMRO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Nmro Dcmnto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(99849295913009147)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha <br> de Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(99849378906009148)
,p_name=>'INDCDOR_PGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_PGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado <br> del Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(99849474795009149)
,p_name=>'VENCIDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VENCIDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Cambiar <br> Fecha de Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&VENCIDO.'
,p_link_target=>'f?p=&APP_ID.:189:&SESSION.::&DEBUG.:RP,189:P189_ID_RNTA,P189_FCHA_VNCMNTO,P189_CDGO_RNTA_ESTDO,P189_NMRO_RNTA,P189_VLOR_BSE:&ID_RNTA.,&FCHA_VNCMNTO.,&CDGO_RNTA_ESTDO.,&NMRO_RNTA.,&VLOR_BSE_GRVBLE.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(99848361666009138)
,p_internal_uid=>99848361666009138
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
 p_id=>wwv_flow_api.id(99962631018391288)
,p_interactive_grid_id=>wwv_flow_api.id(99848361666009138)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(99962762868391288)
,p_report_id=>wwv_flow_api.id(99962631018391288)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99963264911391292)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(99848428149009139)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99963790634391301)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(99848596992009140)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99964260479391303)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(99848614064009141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99964756955391304)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(99848733285009142)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127.19999999999999
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99965260592391306)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(99848826199009143)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156.4
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99965743024391308)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(99848931872009144)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99966232474391310)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(99849028121009145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99966734250391311)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(99849115786009146)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99967220872391313)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(99849295913009147)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>173.2
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99967798425391315)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(99849378906009148)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126.4
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99968267240391318)
,p_view_id=>wwv_flow_api.id(99962762868391288)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(99849474795009149)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99845943835009114)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(99845692028009111)
,p_button_name=>'btn_consultar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99845755876009112)
,p_name=>'P188_NIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99845692028009111)
,p_prompt=>unistr('<b>Identificaci\00F3n</b> ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99845814183009113)
,p_name=>'P188_PIN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99845692028009111)
,p_prompt=>'<b>Pin</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99846596118009120)
,p_name=>'P188_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99846659221009121)
,p_name=>'P188_RSPSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99846771649009122)
,p_name=>'P188_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99846845944009123)
,p_name=>'P188_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99846948020009124)
,p_name=>'P188_ID_DCMNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99847195047009126)
,p_name=>'P188_ID_RNTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99847291992009127)
,p_name=>'P188_ID_RPRTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99847318490009128)
,p_name=>'P188_NMRO_RNTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99847445805009129)
,p_name=>'P188_CDGO_RNTA_ESTDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99847566248009130)
,p_name=>'P188_INDCDOR_RNTA_PGADA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99847647323009131)
,p_name=>'P188_FCHA_VNCMNTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99847793051009132)
,p_name=>'P188_INDCDOR_PGO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(99846415061009119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(99847988256009134)
,p_computation_sequence=>10
,p_computation_item=>'P188_ID_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto',
'  from df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'  and cdgo_impsto = ''REN'';'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(99848105146009136)
,p_computation_sequence=>20
,p_computation_item=>'P188_ID_IMPSTO_SBMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte          = :F_CDGO_CLNTE',
'   and id_impsto           = :P188_ID_IMPSTO',
'   and cdgo_impsto_sbmpsto = ''VUR'';'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99846056902009115)
,p_name=>'Al consultar sujeto'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(99845943835009114)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99846176967009116)
,p_event_id=>wwv_flow_api.id(99846056902009115)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P188_NIT'') != ''''){',
'        apex.submit(''btn_consultar'');',
'}else{',
'   Swal.fire({',
unistr('        //icon: ''Validaci\00F3n'','),
unistr('       title: ''<H2 >Validaci\00F3n</H2>'','),
unistr('        html: `<h4>Digite una Identificaci\00F3n</h4>`'),
'   }); ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99846204411009117)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'	select     a.id_sjto_impsto',
'      into     :P188_ID_SJTO_IMPSTO',
'      from     v_si_i_sujetos_impuesto a',
'      join     si_i_personas           b on a.id_sjto_impsto = b.id_sjto_impsto',
'    where     a.cdgo_clnte      =   :F_CDGO_CLNTE',
'      and     a.id_impsto       =   :P188_ID_IMPSTO',
'      and     a.idntfccion_sjto =   :P188_NIT;',
'        ',
'        :P188_RSPSTA := ''Consulta realizada con exito.!'';',
'exception         ',
'        when no_data_found then',
'                :P188_ID_SJTO_IMPSTO := '''';',
'                :P188_RSPSTA         := ''No se ha encontrado ningun dato.'';',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(99845943835009114)
,p_process_success_message=>'&P188_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99849519969009150)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir recibo '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_gn_d_reportes     gn_d_reportes%rowtype;',
'     v_blob              blob;     ',
'    ',
'begin   ',
'    apex_session.attach( p_app_id     => 66000',
'                       , p_page_id    => 2',
'                       , p_session_id => v(''APP_SESSION'') );',
'',
'    --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'        begin',
'            select a.*',
'              into v_gn_d_reportes',
'              from gn_d_reportes   a',
'               join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'               and cdgo_clnte              = :F_CDGO_CLNTE',
'             where cdgo_rprte_grpo = ''RRV'' ',
'               and a.indcdor_gnrco = ''N'';',
'        exception',
'            when no_data_found then ',
'                 select a.*',
'                  into v_gn_d_reportes',
'                  from gn_d_reportes   a',
'                 where a.cdgo_rprte_grpo = ''RRV''  ',
'                   and a.indcdor_gnrco = ''S''',
'                   and rownum            = 1;',
'            when others then ',
'                :P188_ID_RNTA := null;',
'        end;',
'',
'    --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO             ',
'    apex_util.set_session_state(''P2_ID_RPRTE'', v_gn_d_reportes.id_rprte);',
'    apex_util.set_session_state(''P2_PRMTRO_1'', :P188_ID_RNTA);',
'    apex_util.set_session_state(''P2_PRMTRO_2'', :P188_ID_DCMNTO);',
'       ',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'',
'    htp.init;',
'    owa_util.mime_header(''application/pdf'', FALSE );',
'    htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
unistr('    htp.p(''Content-Disposition: attachment; filename="LIQUIDACI\00D3N_''||:P188_NMRO_RNTA||''.pdf"'' );'),
'    htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'    apex_application.stop_apex_engine;',
'    ',
'exception  ',
'     when others then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
