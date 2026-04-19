prompt --application/pages/page_00058
begin
wwv_flow_api.create_page(
 p_id=>58
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Consulta general de Acumulaci\00F3n de procesos')
,p_step_title=>unistr('Consulta general de Acumulaci\00F3n de procesos')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(191340569422149891)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(191350343466158656)
,p_plug_name=>unistr('Procesos Jur\00EDdicos Acumulados')
,p_region_name=>'procesos_juridicos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_prcsos_jrdco',
'     , a.nmro_prcso_jrdco ',
'     , to_char(a.fcha,''dd/mm/yyyy'') as fcha',
'     , a.idntfccion',
'     , a.drccion',
'     , a.nombre_etpa',
'     , e.dscrpcion_grpo',
'     , a.estdo_etpa_vsble',
'     , a.id_acto',
'     , a.nmro_acto_dsplay',
'     , d.id_prcso_jrdco_acmldo',
'  from v_cb_g_procesos_jrdco_dcmnto a  ',
'  join wf_d_flujos_grupo_tarea b',
'    on a.id_etpa      = b.id_fljo_trea',
'  join cb_g_procesos_jrdco_rspnsble c',
'    on c.id_prcsos_jrdco     = a.id_prcsos_jrdco',
'   and trim(c.idntfccion)    = nvl(:P58_IDNTFCCION, trim(c.idntfccion))',
'   and c.cdgo_idntfccion_tpo = nvl(:P58_CDGO_IDNTFCCION_TPO, c.cdgo_idntfccion_tpo)',
'  join cb_g_procesos_jrdco_acmldo d',
'    on d.id_prcso_jrdco_pdre = a.id_prcsos_jrdco',
'  join wf_d_flujos_grupo e',
'    on e.id_fljo_grpo = b.id_fljo_grpo',
' where a.actvo        = ''S''',
'   and b.id_fljo_grpo = nvl(:P58_ID_FLJO_GRPO, b.id_fljo_grpo)',
'   and a.cdgo_clnte   = :F_CDGO_CLNTE '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(191351378046158666)
,p_heading=>unistr('Proceso Jur\00EDdico')
,p_label=>unistr('Proceso Jur\00EDdico')
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(191351406170158667)
,p_heading=>'Etapa'
,p_label=>'Etapa'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97128916016064026)
,p_name=>'DSCRPCION_GRPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_GRPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Grupo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97129049694064027)
,p_name=>'ID_PRCSO_JRDCO_ACMLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_JRDCO_ACMLDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(191350506802158658)
,p_name=>'ID_PRCSOS_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(191350598257158659)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(191351378046158666)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(191350886165158661)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(191351378046158666)
,p_use_group_for=>'BOTH'
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(191350934955158662)
,p_name=>'NOMBRE_ETPA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_ETPA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(191351027641158663)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Ver',
'<span class="fa fa-eye"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP,59:P59_ID_PRCSO_JRDCO_ACMLDO:&ID_PRCSO_JRDCO_ACMLDO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(191351113882158664)
,p_name=>'NMRO_ACTO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(191351210065158665)
,p_name=>'ESTDO_ETPA_VSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO_ETPA_VSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(191352746898158680)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(191351378046158666)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(191353254115158685)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(191351378046158666)
,p_use_group_for=>'BOTH'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(191350469566158657)
,p_internal_uid=>191350469566158657
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'	  config.initialSelection = false;',
'	  return config;',
'	}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(191525064619062107)
,p_interactive_grid_id=>wwv_flow_api.id(191350469566158657)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(191525124930062108)
,p_report_id=>wwv_flow_api.id(191525064619062107)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97306654703282633)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(97128916016064026)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97312456834309141)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(97129049694064027)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(191525598171062112)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(191350506802158658)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(191526121138062115)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(191350598257158659)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(191527172332062118)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(191350886165158661)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(191527694672062119)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(191350934955158662)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>192
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(191528161042062120)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(191351027641158663)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(191528637150062122)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(191351113882158664)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(191537132101173355)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(191351210065158665)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(191680753741820130)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(191352746898158680)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(191713212695881283)
,p_view_id=>wwv_flow_api.id(191525124930062108)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(191353254115158685)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>192
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(191356939628166910)
,p_plug_name=>'Opciones'
,p_region_name=>'procesos_juridicos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(191358097020167806)
,p_plug_name=>'Ayuda'
,p_region_name=>'procesos_juridicos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'',
unistr('<b><i>1.</i></b>Esta funcionalidad permite la gesti\00F3n de acumulaci\00F3n de procesos jur\00EDdicos <br><br>'),
unistr('<b><i>2.</i></b>Permite crear una nueva acumulaci\00F3n de procesos al darle clic al bot\00F3n "Nuevo" en el panel de opciones <br><br>'),
unistr('<b><i>3.</i></b>Permite mostrar el registro de los procesos acumulados y consultar los procesos que fueron asociados a la acumulaci\00F3n, adem\00E1s de los responsables y la cartera asociada<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97128729143064024)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(191356939628166910)
,p_button_name=>'BTN_NVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97237544714158305)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(191340569422149891)
,p_button_name=>'btn_cnsltar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(97128891699064025)
,p_branch_name=>'Go To Page 51'
,p_branch_action=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:RP,51::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(97128729143064024)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97237999525158306)
,p_name=>'P58_ID_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(191340569422149891)
,p_prompt=>'Flujo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_fljo ',
'     , id_fljo ',
'  from wf_d_flujos',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_prcso   = 10 '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Flujo de trabajo por el cual se realizo el proceso de acumulaci\00F3n ')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97238321037158308)
,p_name=>'P58_ID_FLJO_GRPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(191340569422149891)
,p_prompt=>'Grupo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_grpo',
'     , id_fljo_grpo ',
'  from wf_d_flujos_grupo',
' where id_fljo = :P58_ID_FLJO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P58_ID_FLJO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Grupos pertenecientes al flujo de procesos'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97238736473158308)
,p_name=>'P58_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(191340569422149891)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Tipo de documento del responsable de los procesos jur\00EDdico de cobro')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97239197804158308)
,p_name=>'P58_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(191340569422149891)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Documento del responsable de los procesos jur\00EDdico de cobro')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97239571190158308)
,p_name=>'P58_NMBRE_CMPLTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(191340569422149891)
,p_prompt=>'Nombre Completo'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_cmplto     || '' - '' || nmtcnco_idntfccion_tpo || ''-'' || trim(idntfccion)  d ',
'     , trim(idntfccion) || ''#''   || cdgo_idntfccion_tpo v ',
'  from v_cb_g_procesos_jrdco_rspnsble a',
'  join cb_g_procesos_jrdco_acmldo b',
'    on b.id_prcso_jrdco_pdre = a.id_prcsos_jrdco',
' where a.cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Nombre completo del responsable de los procesos jur\00EDdico de cobro')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97128439009064021)
,p_name=>'al seleccionar un registro'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P58_NMBRE_CMPLTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97128583151064022)
,p_event_id=>wwv_flow_api.id(97128439009064021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v = $v($(this.triggeringElement).attr(''id''));',
'$s(''P58_CDGO_IDNTFCCION_TPO'', v.split(''#'')[1])',
'$s(''P58_IDNTFCCION'', v.split(''#'')[0])'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97128697101064023)
,p_event_id=>wwv_flow_api.id(97128439009064021)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
end;
/
