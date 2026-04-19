prompt --application/pages/page_00395
begin
wwv_flow_api.create_page(
 p_id=>395
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Finalizacion Procesos Consignaci\00F3n')
,p_step_title=>unistr('Finalizacion Procesos Consignaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerTitulo() {',
'',
'    console.log(''Inicia ObtenerTitulo'');',
'    var region = apex.region("Proceso_consignacion");',
'    if (region) {',
'',
'        var view = apex.region("Proceso_consignacion").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");   ',
'		',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        ',
'        /***    var records = model._data.filter(function (record) {',
'            return model.getValue(record, "Observaciones") != ''"v":"","d":""''',
'            });        ',
'        ***/',
'        ',
'        var json_titulo = records.map(function (record) {',
'            return { "ID_TTLO_JDCIAL"	: model.getValue(record, "ID_TTLO_JDCIAL"),',
'                     "Observaciones"    : model.getValue(record, "Observaciones")',
'                   };                     ',
'        });         ',
'                    ',
'        console.log(''data json_titulo'');',
'        console.log(json_titulo);',
'        ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM',
'        ',
'        $s(''P395_JSON_TTLO'', json_titulo.length > 0 ? JSON.stringify(json_titulo) : '''');',
'        ',
'         console.log(''punto 1'');',
'        ',
'        //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        json_titulo.length > 0 ? apex.item("Finalizar_Procesos").show() ',
'                        : apex.item("Finalizar_Procesos").hide();',
'        ',
'        console.log(''punto 2'');',
'       ',
'        //return;',
'    }',
'   // apex.item("Finalizar_Procesos").hide();',
'    ',
'        console.log(''punto 3'');',
'    ',
'}',
'',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20231116145351'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76780615603037254)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76780739477037255)
,p_plug_name=>'ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p>',
unistr('<b><i></i></b>Esta funcionalidad permite finalizar el proceso de consignaci\00F3n de un T\00EDtulo dej\00E1ndolo en un estado  Registrado o inicial.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76780980417037257)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
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
 p_id=>wwv_flow_api.id(77096699205914323)
,p_plug_name=>'Finalizacion Procesos Consignacion'
,p_region_name=>'Proceso_consignacion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select distinct a.nmro_ttlo_jdcial',
'           ,a.dscrpcion_ttlo_estdo',
'           ,a.nmbre_dmnddo',
'           ,a.id_instncia_fljo',
'           ,a.fcha_cnsttcion',
'           ,a.idntfccion_dmnddo',
'           ,a.id_ttlo_jdcial',
'           ,to_char(a.vlor, :F_FRMTO_MNDA) vlor',
'           , null "Observaciones"',
'     from v_gf_g_titulos_judicial a',
'left join v_gf_g_titulos_jdcial_impsto b on a.id_ttlo_jdcial = b.id_ttlo_jdcial',
'join wf_g_instancias_transicion d   on a.id_instncia_fljo = d.id_instncia_fljo',
'          --and d.id_estdo_trnscion in (1, 2)',
'          and a. cdgo_ttlo_jdcial_estdo in (''ACN'',''CNS'',''ACN'',''RGS'',''ASL'', ''SDT'', ''DVL'')  --Devol ''ASL'', ''SDT'', ''DVL''',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and d.ID_USRIO   = :F_ID_USRIO',
'  and (a.nmro_ttlo_jdcial = :P395_NMRO_TTLO_JDCIAL or :P395_NMRO_TTLO_JDCIAL is null)',
'  and (b.id_impsto = :P395_ID_IMPSTO or :P395_ID_IMPSTO is null)',
'  and (b.id_impsto_sbmpsto = :P395_D_IMPSTO_SBMPSTO or :P395_D_IMPSTO_SBMPSTO is null)',
'  and (a.idntfccion_dmnddo = :P395_IDNTFCCION_DMNDDO or :P395_IDNTFCCION_DMNDDO is null)',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_comment=>'x'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21730337124396425)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
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
 p_id=>wwv_flow_api.id(21730619335396428)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero del T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21730742524396429)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha de Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21730815238396430)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(21731158338396433)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21731261326396434)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre del Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21732152406396443)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(21732590718396447)
,p_name=>'DSCRPCION_TTLO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TTLO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado del T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21850578535801712)
,p_name=>'Observaciones'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Observaciones'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>0
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
 p_id=>wwv_flow_api.id(76780434081037252)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(77097281139914326)
,p_internal_uid=>77097281139914326
,p_is_editable=>true
,p_edit_operations=>'u'
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(77097613396914327)
,p_interactive_grid_id=>wwv_flow_api.id(77097281139914326)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(77097761713914327)
,p_report_id=>wwv_flow_api.id(77097613396914327)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21758413822443893)
,p_view_id=>wwv_flow_api.id(77097761713914327)
,p_display_seq=>35
,p_column_id=>wwv_flow_api.id(21730337124396425)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21760293766443900)
,p_view_id=>wwv_flow_api.id(77097761713914327)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21730619335396428)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21760856418443902)
,p_view_id=>wwv_flow_api.id(77097761713914327)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21730742524396429)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21761446699443906)
,p_view_id=>wwv_flow_api.id(77097761713914327)
,p_display_seq=>40
,p_column_id=>wwv_flow_api.id(21730815238396430)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21763232077443918)
,p_view_id=>wwv_flow_api.id(77097761713914327)
,p_display_seq=>43
,p_column_id=>wwv_flow_api.id(21731158338396433)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21763897325443920)
,p_view_id=>wwv_flow_api.id(77097761713914327)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21731261326396434)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21769139938443944)
,p_view_id=>wwv_flow_api.id(77097761713914327)
,p_display_seq=>53
,p_column_id=>wwv_flow_api.id(21732152406396443)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21807332410589223)
,p_view_id=>wwv_flow_api.id(77097761713914327)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(21732590718396447)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21933448785109940)
,p_view_id=>wwv_flow_api.id(77097761713914327)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21850578535801712)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21849667210801703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(76780615603037254)
,p_button_name=>'btn_Cerrar_Proceso'
,p_button_static_id=>'Cerrar_Proceso'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cerrar  Proceso'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21711169265328265)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76780980417037257)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21711536902328265)
,p_name=>'P395_NMRO_TTLO_JDCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(76780980417037257)
,p_prompt=>unistr('<b>T\00EDtulo No. </b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero del proceso Jur\00EDdico que desea consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21713362682328308)
,p_name=>'P395_TIPO_FLUJO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(76780980417037257)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Seleccione de la lista el tipo de proceso que desea consultar '
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21714246232328309)
,p_name=>'P395_ID_FLJO_TREA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(76780980417037257)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Seleccione de la lista la etapa del proceso seleccionado que desea consultar.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21715137421328310)
,p_name=>'P395_JSON'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(76780980417037257)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21715544412328310)
,p_name=>'P395_CDGO_ACTO_FIN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(76780980417037257)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.id_acto_tpo',
'  from gn_d_actos_tipo_tarea t',
' where t.id_fljo_trea = (select distinct first_value(id_fljo_trea) over(order by orden desc) ultima_tarea',
'                           from v_wf_g_instancias_transicion tr',
'                          where tr.id_fljo = :p395_tipo_flujo',
'                            and exists (select * ',
'                                          from wf_d_flujos b',
'                                         where b.id_fljo = tr.id_fljo ',
'                                           and b.id_prcso = 10',
'                                           and b.cdgo_clnte = :f_cdgo_clnte))'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21732633566396448)
,p_name=>'P395_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76780980417037257)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21732756936396449)
,p_name=>'P395_IDNTFCCION_DMNDDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(76780980417037257)
,p_prompt=>unistr('<b>Identificaci\00F3n Demandado</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero del proceso Jur\00EDdico que desea consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21732835821396450)
,p_name=>'P395_D_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76780980417037257)
,p_prompt=>'<b>Sub - Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P395_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P395_ID_IMPSTO'
,p_ajax_items_to_submit=>'P395_ID_IMPSTO,P395_D_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21936042347380504)
,p_name=>'P395_JSON_TTLO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(76780980417037257)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21721936397328467)
,p_name=>'al cerrar el cuadro de dialogo'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21722465494328468)
,p_event_id=>wwv_flow_api.id(21721936397328467)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(77096699205914323)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21935748126380501)
,p_name=>'Al dar clic btn_Cerrar_Proceso'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(21849667210801703)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21935842006380502)
,p_event_id=>wwv_flow_api.id(21935748126380501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_CerrarProceso(){',
'    try{',
'        console.log(''Inicia fnc_CerrarProceso'');',
'        obtenerTitulo();',
'        console.log(''Termina obtenerTitulo'');',
'        ',
'        apex.server.process("Cerrar_Proceso",{',
'         //   f01: window.localStorage.jsonCartera,',
'            pageItems: "#F_CDGO_CLNTE, #P395_JSON_TTLO, #F_ID_USRIO"',
'        },{',
'            success: function(data){',
'                console.log(''RESPUESTA: ''+data.o_cdgo_rspsta);',
'                if(data.o_cdgo_rspsta != 0){',
'                   apex.message.clearErrors();',
'                   apex.message.showErrors ([',
'                       {',
'                           type:       "error",',
'                           location:   "page",',
'                           message:    data.o_mnsje_rspsta,',
'                           unsafe:     false',
'                       }',
'                   ]);',
'                }else{',
unistr('                   apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                   apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(''ERROR EN CERRAR PROCESO'');',
'        console.log(e);',
'    }',
'}',
'',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de finalizar el proceso?", function(okPressed) {'),
'    if(okPressed) {',
'        fnc_CerrarProceso();',
'    }',
'});',
'',
'',
'',
'',
' '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21936195791380505)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cerrar_Proceso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number := 0 ;',
'    v_mnsje_rspsta    varchar(2000) := ''OK'';',
'    v_exception       exception;',
'    v_rgistro         clob;',
'    v_id_acto         number;',
'    v_error           varchar2(2000);',
'begin',
'    ',
'    insert into muerto (n_001, v_001, c_001, t_001) values(55, ''inicia fin flujo'', :P395_JSON_TTLO, systimestamp);commit;',
'    ',
'    pkg_gf_titulos_judicial.prc_tr_fnlzar_fljo_ttlo_jdcial (p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                            p_json_ttlos    => :P395_JSON_TTLO, ',
'                                                            p_id_usrio      => :F_ID_USRIO, ',
'                                         		            p_id_acto       =>  0,',
'                                                            p_indcdr_act    => ''S'',',
'                                                            o_cdgo_rspsta   => v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta  => v_mnsje_rspsta);',
'    ',
'    --insert into muerto (n_001, v_001, c_001, t_001) values(55, ''prc_tr_fnlzar_fljo_ttlo_jdcial'', v_cdgo_rspsta || '' - ''||v_mnsje_rspsta, systimestamp);commit;',
'    ',
'    if v_cdgo_rspsta > 0 then',
'       raise v_exception;',
'    end if;',
'  ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta); ',
'    apex_json.write(''o_mnsje_rspsta'',v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'	exception',
'	    when v_exception then',
'			rollback;',
'			apex_json.open_object;',
'			apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'			apex_json.write(''o_mnsje_rspsta'',v_mnsje_rspsta);',
'			apex_json.close_object; ',
'	    ',
'        when others then',
'            rollback;',
'			v_error := sqlerrm;',
'			apex_json.open_object;',
'			apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'			apex_json.write(''o_mnsje_rspsta'','' Error controlado: ''||v_error);',
'			apex_json.close_object;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21849667210801703)
);
end;
/
