prompt --application/pages/page_00039
begin
wwv_flow_api.create_page(
 p_id=>39
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Gesti\00F3n Novedades Veh\00EDculos')
,p_step_title=>unistr('Gesti\00F3n Novedades Veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(74223836934679730)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function ver_flujo(name, id_instancia, id_nvdad_prsna){',
'    ',
'    apex.server.process(name, {',
'        f01: id_instancia,',
'        f02: id_nvdad_prsna',
'    }, {',
'        success: function (data) { ',
'                if (data.type === ''OK'') {',
'                    window.localStorage.clear();',
'                    window.location.href = data.url;',
'                }else{',
'                    apex.message.showErrors({',
'                        type: apex.message.TYPE.ERROR,',
'                        location: ["page"],',
'                        message: data.msg,',
'                        unsafe: false',
'                    });',
'                }',
'            },',
'            error: function () {',
'                console.log(arguments);',
'            }',
'        }); ',
'}',
''))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210408155034'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163415563394330304)
,p_plug_name=>'Parametros de Consulta'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163415663936330305)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <i>',
'        <b> ',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>  ',
'        </b>',
'    </i>',
'</h5>',
'<i>',
'    Funcionalidad que permite:<br><br>',
'    <b>1.</b> Conusltar las solicitudes de novedades resgitradas y pendientes por resolver. <br><br>',
'    <b>2.</b> Crear una nueva solicitus de novedad.<br><br>',
'    <br>',
'    <br>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163415758775330306)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163696255463595501)
,p_plug_name=>unistr('Gesti\00F3n de Novedades de Veh\00EDculos')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.id_nvdad_vhclo, ',
'       s.id_instncia_fljo,',
'       s.id_impsto,',
'       s.id_impsto_sbmpsto,',
'       s.id_sjto_impsto,',
'       r.idntfccion_sjto, ',
'       e.dscrpcion,',
'       s.fcha_rgstro,',
'       u.user_name',
' from si_g_novedades_vehiculo s',
' join v_si_i_sujetos_impuesto r on r.id_sjto_impsto = s.id_sjto_impsto',
' join si_d_novedades_tipo  e on s.cdgo_nvda_tpo = e.cdgo_nvdad_tpo and e.cdgo_sjto_tpo = ''V''',
' join sg_g_usuarios u on u.id_usrio = s.id_usrio',
'      ',
'      '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101452362683687601)
,p_name=>'ID_NVDAD_VHCLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDAD_VHCLO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Nvdad Vhclo'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(101452414852687602)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Novedad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(101452556708687603)
,p_name=>'USER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_NAME'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'User Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(101453741335687615)
,p_name=>'ID'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:RP,46:P46_ID_NOVEDAD:&ID_NVDAD_VHCLO.'
,p_link_text=>'<span class="fa fa-eye" aria-hidden="true"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(163698424004595635)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(105706992941748015)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(163699057537595636)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_impsto_sbmpsto',
'        , id_impsto_sbmpsto',
'     from df_i_impuestos_subimpuesto'))
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(163699642245595636)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(163700256857595636)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br>Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(163702057870595641)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(163696627086595536)
,p_internal_uid=>163696627086595536
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encontraron Novedades'
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
 p_id=>wwv_flow_api.id(163696994568595549)
,p_interactive_grid_id=>wwv_flow_api.id(163696627086595536)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(163697137665595550)
,p_report_id=>wwv_flow_api.id(163696994568595549)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101458329724687876)
,p_view_id=>wwv_flow_api.id(163697137665595550)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(101452362683687601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101458870907687878)
,p_view_id=>wwv_flow_api.id(163697137665595550)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(101452414852687602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101459313751687879)
,p_view_id=>wwv_flow_api.id(163697137665595550)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(101452556708687603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101469824973934409)
,p_view_id=>wwv_flow_api.id(163697137665595550)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(101453741335687615)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163698845766595636)
,p_view_id=>wwv_flow_api.id(163697137665595550)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(163698424004595635)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>181.85
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163699446635595636)
,p_view_id=>wwv_flow_api.id(163697137665595550)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(163699057537595636)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163700026616595636)
,p_view_id=>wwv_flow_api.id(163697137665595550)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(163699642245595636)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163700670741595637)
,p_view_id=>wwv_flow_api.id(163697137665595550)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(163700256857595636)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125.80000000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163702415766595641)
,p_view_id=>wwv_flow_api.id(163697137665595550)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(163702057870595641)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94120055077865864)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(163415758775330306)
,p_button_name=>'BTN_INCIAR_FLJO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=62000:17:&SESSION.::&DEBUG.:RP,17:P17_ID_PRCSO:96'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94117152833865834)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(163415563394330304)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94117573660865839)
,p_name=>'P39_CDGO_NVDAD_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(163415563394330304)
,p_prompt=>'Tipo de Novedad'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_NOVEDADES_PERSONA_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(dscrpcion) as d,',
'       cdgo_nvdad_prsna_estdo as r',
'  from si_d_novedades_prsna_estdo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94117894312865856)
,p_name=>'P39_IDNTFCCION_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(163415563394330304)
,p_prompt=>unistr('Identificaci\00F3n del Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94118265776865856)
,p_name=>'P39_ID_USRIO_RGSTRO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(163415563394330304)
,p_prompt=>'Usuario Registro'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || '' ['' ||idntfccion || '']'' as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' where cdgo_clnte        = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94118679889865857)
,p_name=>'P39_FCHA_RGSTRO_DSDE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(163415563394330304)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_date (''01/'' || extract(MONTH from sysdate) || ''/'' || extract(year from sysdate)) fcha_incio',
'    from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Registro Desde'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94119073808865858)
,p_name=>'P39_FCHA_RGSTRO_HSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(163415563394330304)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select LAST_DAY(SYSDATE)',
'   from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Registro Hasta'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94120434705865891)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VerFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo          number := apex_application.g_f01(1);',
'    v_id_nvdad_prsna            number := apex_application.g_f02(1);',
'    v_id_fljo_trea              number;',
'    v_url                       varchar2(4000);',
'    v_id_instncia_fljo_gnrdo    wf_g_instancias_flujo_gnrdo.id_instncia_fljo_gnrdo%Type;',
'    ',
'begin',
' begin',
'  apex_json.open_object(); ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception when no_data_found then',
'              ',
'              begin                   ',
'                  select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''P28_ID_NVDAD_PRSNA'', v_id_nvdad_prsna );',
'            apex_util.set_session_state(''P30_ID_NVDAD_PRSNA'', v_id_nvdad_prsna );',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
