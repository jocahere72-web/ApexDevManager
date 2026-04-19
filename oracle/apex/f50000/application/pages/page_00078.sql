prompt --application/pages/page_00078
begin
wwv_flow_api.create_page(
 p_id=>78
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Vigencias-Periodos'
,p_step_title=>'Vigencias-Periodos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') !== ''true''){',
'		$(''#''+id).click();',
'	}',
'}',
'',
''))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251231164442'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16586707534969304)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
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
 p_id=>wwv_flow_api.id(16586810999969305)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'Funcionalidad que permite gestionar las vigencias y periodos de un tributo.',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97575569804939172)
,p_plug_name=>'Periodos &P78_VGNCIA.'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prdo,',
'       cdgo_clnte,',
'       id_impsto,',
'       id_impsto_sbmpsto,',
'       vgncia,',
'       prdo,',
'       cdgo_prdcdad,',
'       dscrpcion',
'  from df_i_periodos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto = :P78_IMPSTO',
'   and id_impsto_sbmpsto = :P78_SBMPSTO',
'   and vgncia = :P78_VGNCIA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P78_IMPSTO,P78_SBMPSTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'PLSQL_EXPRESSION'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P78_VGNCIA IS NULL OR',
':P78_IMPSTO IS NULL OR',
':P78_SBMPSTO IS NULL '))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17901294736744402)
,p_name=>'CDGO_PRDCDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_PRDCDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodicidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.dscrpcion,',
'         a.cdgo_prdcdad',
'    from df_s_periodicidad   a',
'order by a.dscrpcion;'))
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
 p_id=>wwv_flow_api.id(97308163244708826)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97308235462708827)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97577297406939186)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97577883912939187)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'&F_CDGO_CLNTE.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97578496971939187)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P78_IMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97579093650939187)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P78_SBMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97579635011939189)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P78_VGNCIA'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97580251634939189)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_item_width=>2
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
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
 p_id=>wwv_flow_api.id(97580862108939189)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeyup="campoMayuscula(this)"'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(97575900632939182)
,p_internal_uid=>97575900632939182
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
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
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    console.log("options: ", options);',
'    return options;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(97576334330939183)
,p_interactive_grid_id=>wwv_flow_api.id(97575900632939182)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(97576452926939184)
,p_report_id=>wwv_flow_api.id(97576334330939183)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18433965898481727)
,p_view_id=>wwv_flow_api.id(97576452926939184)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(17901294736744402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97577622003939187)
,p_view_id=>wwv_flow_api.id(97576452926939184)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(97577297406939186)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97578255772939187)
,p_view_id=>wwv_flow_api.id(97576452926939184)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(97577883912939187)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97578811473939187)
,p_view_id=>wwv_flow_api.id(97576452926939184)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(97578496971939187)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97579436019939188)
,p_view_id=>wwv_flow_api.id(97576452926939184)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(97579093650939187)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97580022617939189)
,p_view_id=>wwv_flow_api.id(97576452926939184)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(97579635011939189)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97580666693939189)
,p_view_id=>wwv_flow_api.id(97576452926939184)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(97580251634939189)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>234
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97581277276939191)
,p_view_id=>wwv_flow_api.id(97576452926939184)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(97580862108939189)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98460837232762592)
,p_view_id=>wwv_flow_api.id(97576452926939184)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(97308163244708826)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101689064128058407)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97309105390708836)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16586707534969304)
,p_button_name=>'BTN_NUEVA_VIGENCIA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Vigencia'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.:RP,79::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26418777010097210)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(101689064128058407)
,p_button_name=>'P78_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26418523362097208)
,p_name=>'P78_VGNCIA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(101689064128058407)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia as text,',
'       vgncia as value',
'  from df_s_vigencias',
' order by vgncia desc'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P78_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la vigencia a consultar'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97308554393708830)
,p_name=>'P78_IMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(101689064128058407)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto, ',
'       id_impsto ',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo a consultar'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97308621656708831)
,p_name=>'P78_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(101689064128058407)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto,',
'       id_impsto_sbmpsto',
'  from v_df_i_impuestos_subimpuesto ',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P78_IMPSTO',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P78_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el sun tributo a consultar'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98743129704493603)
,p_tabular_form_region_id=>wwv_flow_api.id(97575569804939172)
,p_validation_name=>unistr('Per\00EDodo es \00FAnico misma vigencia, impuesto y sub-impuesto')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from df_i_periodos',
' where vgncia = :P78_VGNCIA',
'   and id_impsto = :P78_IMPSTO',
'   and id_impsto_sbmpsto = :P78_SBMPSTO',
'   and prdo = :PRDO',
'   and id_prdo != nvl(:ID_PRDO, -1)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('El per\00EDodo indicado ya existe para la vigencia, el impuesto y sub-impuestos escogidos')
,p_validation_condition_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98809497914635801)
,p_tabular_form_region_id=>wwv_flow_api.id(97575569804939172)
,p_validation_name=>unistr('Descripci\00F3n es \00FAnico misma vigencia, impuesto y sub-impuesto_1')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from df_i_periodos',
' where vgncia = :P78_VGNCIA',
'   and id_impsto = :P78_IMPSTO',
'   and id_impsto_sbmpsto = :P78_SBMPSTO',
'   and dscrpcion = :DSCRPCION',
'   and id_prdo != nvl(:ID_PRDO, -1)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('La descripci\00F3n indicada ya existe para la vigencia, el impuesto y sub-impuestos escogidos')
,p_validation_condition_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_associated_column=>'DSCRPCION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46357717415318809)
,p_validation_name=>'Validar Campo '
,p_validation_sequence=>30
,p_validation=>'P78_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Tributo debe tener un valor.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(26418777010097210)
,p_associated_item=>wwv_flow_api.id(97308554393708830)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46357861229318810)
,p_validation_name=>'Validar Campo _1'
,p_validation_sequence=>40
,p_validation=>'P78_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Sub Tributo debe tener un valor.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(26418777010097210)
,p_associated_item=>wwv_flow_api.id(97308621656708831)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46357989327318811)
,p_validation_name=>'Validar Campo _1_1'
,p_validation_sequence=>50
,p_validation=>'P78_VGNCIA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Vigencia debe tener un valor.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(26418777010097210)
,p_associated_item=>wwv_flow_api.id(26418523362097208)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97309303524708838)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26419374281097216)
,p_name=>'Cerrar Cuadro de Dialogo'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(97309105390708836)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26419434267097217)
,p_event_id=>wwv_flow_api.id(26419374281097216)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_consultarVigencias(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    console.log(''Inicio'');',
'    try{',
'        await apex.server.process ( "ajax_consultarVigencias", {}, {',
'            success: function(data){',
'                var v_data = JSON.parse(data.data).sort(function(a, b){return b.id-a.id});',
'                $(''#P78_VGNCIA option[value!=""]'').remove();',
'                v_data.forEach((d) => {                     ',
'                    $(`<option value="${d.id}">${d.text}</option>`).appendTo($(''#P78_VGNCIA''));',
'                })',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
'//fnc_consultarVigencias();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26420511561097228)
,p_event_id=>wwv_flow_api.id(26419374281097216)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P78_VGNCIA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26420641191097229)
,p_event_id=>wwv_flow_api.id(26419374281097216)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97308393137708828)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(97575569804939172)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Per\00EDodos - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P78_CNSLTAR'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Se han guardado los cambios.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26419530530097218)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_consultarVigencias'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vgncia clob;',
'begin',
'    apex_json.open_object;',
'    select  json_arrayagg(json_object(key ''id'' value a.vgncia, key ''text''  value a.vgncia returning clob) returning clob)',
'    into    v_vgncia',
'    from    df_s_vigencias  a',
'    order by a.vgncia desc;',
'    apex_json.write(''type'', 0);',
unistr('    apex_json.write(''msg'', ''Acci\00F3n procesada con \00E9xito.'');'),
'    apex_json.write(''data'', v_vgncia);',
'    apex_json.close_object;',
'    exception',
'        when others then',
'            apex_json.write(''type'', 0);',
'            apex_json.write(''msg'', ''Error en la consulta de las vigencias.'');',
'            apex_json.write(''data'', v_vgncia);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
