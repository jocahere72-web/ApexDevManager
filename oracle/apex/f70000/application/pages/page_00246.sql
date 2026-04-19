prompt --application/pages/page_00246
begin
wwv_flow_api.create_page(
 p_id=>246
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Param\00E9trica Homologaci\00F3n de Formulario Declaraciones')
,p_step_title=>unistr('Param\00E9trica Homologaci\00F3n de Formulario Declaraciones')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250407225725'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153389546147602936)
,p_plug_name=>unistr('Declaraci\00F3n Homologaci\00F3n')
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
 p_id=>wwv_flow_api.id(153389659272602937)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156986347487729735)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'    Funcionalidad que permite: <br/><br/>',
unistr('    Parametrizar y procesar la homologaci\00F3n de los formularios de digitaci\00F3n a los formularios de gesti\00F3n.<br/><br/>'),
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.       '),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156988183693729753)
,p_plug_name=>unistr('Detalle Homologaci\00F3n Declaraci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select  e.id_frmlrio_hmlgcion_dtlle,',
'          e.id_frmlrio_hmlgcion,',
'          e.id_frmlrio_rgion_orgn,',
'          e.dscrpcion_rgion_orgn,',
'          e.id_frmlrio_rgion_atrbto_orgn,',
'          e.dscrpcion_atrbto_orgn,',
'          e.id_frmlrio_rgion_pgna,',
'          e.id_frmlrio_rgion_atrbto_pgna',
'     from gi_d_formulario_hmlg_dtlle e ',
'    where e.id_frmlrio_hmlgcion = :P246_ID_DCLRCION_HMLGCION; ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(157090999350024147)
,p_name=>'ID_FRMLRIO_RGION_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ORGN'
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
 p_id=>wwv_flow_api.id(157091109837024149)
,p_name=>'ID_FRMLRIO_RGION_ATRBTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ATRBTO_ORGN'
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
 p_id=>wwv_flow_api.id(157091568925024153)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(157091686224024154)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(157091826635024156)
,p_name=>'DSCRPCION_RGION_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RGION_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Regi\00F3n Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(157091951126024157)
,p_name=>'DSCRPCION_ATRBTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ATRBTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Atributo Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(293034953610797624)
,p_name=>'ID_FRMLRIO_HMLGCION_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_HMLGCION_DTLLE'
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
 p_id=>wwv_flow_api.id(293035066693797625)
,p_name=>'ID_FRMLRIO_HMLGCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_HMLGCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(293035357780797628)
,p_name=>'ID_FRMLRIO_RGION_PGNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_PGNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Regi\00F3n P\00E1gina')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    a.plug_name        as d,',
'          a.id as r',
'from apex_190100.WWV_FLOW_PAGE_PLUGS a',
'join apex_190100.WWV_FLOW_STEPS      b on    a.flow_id = b.flow_id',
'                                       and   a.page_id = b.id     ',
'left join gi_d_formulario_hmlgcion  d  on    d.id_page = b.id',
'where d.id_frmlrio_hmlgcion = :P246_ID_DCLRCION_HMLGCION',
'and  upper(b.alias) like ''%DL_FRM%''',
'group by a.plug_name, a.id',
'order by a.plug_name ;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>false
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
 p_id=>wwv_flow_api.id(293035477157797629)
,p_name=>'ID_FRMLRIO_RGION_ATRBTO_PGNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ATRBTO_PGNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Atributo P\00E1gina')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    --a.name    as d,',
'          a.item_comment as d,',
'          a.id as r',
'from apex_190100.wwv_flow_step_items a',
'where a.item_plug_id = :ID_FRMLRIO_RGION_PGNA',
'group by a.item_comment, a.id',
'order by a.item_comment',
'',
'/*select    a.name        as d,',
'          a.id as r',
'from apex_190100.wwv_flow_step_items a',
'where a.item_plug_id = :ID_FRMLRIO_RGION_PGNA',
'--and  upper(b.alias) like ''%DL_FRM%''',
'--and b.id_frmlrio_rgion = :ID_FRMLRIO_RGION_DSTN',
'group by a.name, a.id',
'order by a.name */',
';',
'',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_FRMLRIO_RGION_PGNA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(157090676793024144)
,p_internal_uid=>157090676793024144
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('No se encontr\00F3 ning\00FAn dato.')
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
 p_id=>wwv_flow_api.id(157120262158116574)
,p_interactive_grid_id=>wwv_flow_api.id(157090676793024144)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>100
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(157120360057116574)
,p_report_id=>wwv_flow_api.id(157120262158116574)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(157121831798116579)
,p_view_id=>wwv_flow_api.id(157120360057116574)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(157090999350024147)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(157122872992116582)
,p_view_id=>wwv_flow_api.id(157120360057116574)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(157091109837024149)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(157128462652120932)
,p_view_id=>wwv_flow_api.id(157120360057116574)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(157091568925024153)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(157136425518248884)
,p_view_id=>wwv_flow_api.id(157120360057116574)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(157091826635024156)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>152.094
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(157136997852248886)
,p_view_id=>wwv_flow_api.id(157120360057116574)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(157091951126024157)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>369.2750026702881
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(295793336679596076)
,p_view_id=>wwv_flow_api.id(157120360057116574)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(293034953610797624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(295793827772596091)
,p_view_id=>wwv_flow_api.id(157120360057116574)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(293035066693797625)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(295798406478689481)
,p_view_id=>wwv_flow_api.id(157120360057116574)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(293035357780797628)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128.3879984741211
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(295798940037689492)
,p_view_id=>wwv_flow_api.id(157120360057116574)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(293035477157797629)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(147908898122852112)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(153389659272602937)
,p_button_name=>'BTN_NUEVA_HMLGCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Homologaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:247:&SESSION.::&DEBUG.:RP,247::'
,p_icon_css_classes=>'fa-file-new'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4938693738379802)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(153389659272602937)
,p_button_name=>'BTN_ELMNR_HMLGCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Eliminar Homologaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P246_ID_DCLRCION_HMLGCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(147909292411852112)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(153389659272602937)
,p_button_name=>'BTN_PRCSAR_HMLGCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Procesar Homologaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:245:&SESSION.:ProcesarHomolagcion:&DEBUG.:RP,245:P245_ID_DCLRCION_HMLGCION:&P246_ID_DCLRCION_HMLGCION.'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(147906904138852091)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(153389546147602936)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147907397825852098)
,p_name=>'P246_ID_DCLRCION_HMLGCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(153389546147602936)
,p_prompt=>unistr('Homologaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion as d,',
'a.id_frmlrio_hmlgcion as r',
'from gi_d_formulario_hmlgcion a',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147907708802852106)
,p_name=>'P246_ID_DCLRCN_VGNCIA_FRM_ORGN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(153389546147602936)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Formulario Origen'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion ',
'from gi_d_formulario_hmlgcion a',
'join gi_d_formularios          b on a.id_frmlrio = b.id_frmlrio',
'where a.id_frmlrio_hmlgcion = :P246_ID_DCLRCION_HMLGCION ;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147908108147852107)
,p_name=>'P246_ID_DCLRCN_VGNCIA_FRM_DSTNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(153389546147602936)
,p_prompt=>'Formulario Destino'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.alias ',
'from    gi_d_formulario_hmlgcion       a',
'join    apex_190100.wwv_flow_steps     b on a.id_page = b.id',
'where   a.id_frmlrio_hmlgcion     =    :P246_ID_DCLRCION_HMLGCION ',
'and upper   (b.alias) like ''%DL_FRM%'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(147915508267852179)
,p_name=>'Limpiar los campos P246_ID_DCLRCN_VGNCIA_FRM_ORGN cuando cargue la pagina'
,p_event_sequence=>10
,p_condition_element=>'P246_ID_DCLRCION_HMLGCION'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(147916064120852181)
,p_event_id=>wwv_flow_api.id(147915508267852179)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P246_ID_DCLRCN_VGNCIA_FRM_ORGN, P246_ID_DCLRCN_VGNCIA_FRM_DSTNO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(147914899613852159)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(156988183693729753)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Detalle Homologaci\00F3n Declaraci\00F3n - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4938743132379803)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Eliminar Homologaci\00F3n Declaraci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'begin',
'    delete from gi_d_formulario_hmlg_dtlle a where a.id_frmlrio_hmlgcion = :P246_ID_DCLRCION_HMLGCION;',
'    delete from gi_d_formulario_hmlgcion   a where a.id_frmlrio_hmlgcion = :P246_ID_DCLRCION_HMLGCION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4938693738379802)
,p_process_when=>'P246_ID_DCLRCION_HMLGCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('\00A1Homologaci\00F3n Eliminada!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4938844212379804)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar items'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P246_ID_DCLRCION_HMLGCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4938693738379802)
,p_process_when=>'P246_ID_DCLRCION_HMLGCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(147915284867852178)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Guardar Detalle de la homologaci\00F3n en GI_G_DECLARACION_HMLG_DTLLE ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'begin    ',
'     ',
'      for c_atrbtos in	(  select a.id_frmlrio_rgion_atrbto,',
'                                   (select b.dscrpcion from gi_d_frmlrios_rgion_atrbto b where b.id_frmlrio_rgion_atrbto = a.id_frmlrio_rgion_atrbto) as dscrpcion_atrbto,',
'                                   a.id_frmlrio_rgion,',
'                                   (select b.dscrpcion from gi_d_formularios_region b where b.id_frmlrio_rgion = a.id_frmlrio_rgion) as dscrpcion_rgion,',
'                                   a.dscrpcion,',
'                                   a.orden,',
'                                   a.vlor_dfcto,',
'                                   a.nmbre_dsplay',
'                                 from gi_d_frmlrios_rgion_atrbto a',
'                                 join gi_d_formularios_region    b on a.id_frmlrio_rgion          = b.id_frmlrio_rgion',
'                                 join gi_d_formularios           c on b.id_frmlrio                = c.id_frmlrio',
'                            left join gi_d_formulario_hmlgcion  d on d.id_frmlrio = c.id_frmlrio',
'                                 where d.id_frmlrio_hmlgcion = :P246_ID_DCLRCION_HMLGCION',
'                                group by a.id_frmlrio_rgion_atrbto, ',
'                                         a.id_frmlrio_rgion,',
'                                         a.dscrpcion,',
'                                         a.orden,',
'                                         a.vlor_dfcto,',
'                                         a.nmbre_dsplay',
'                                order by a.id_frmlrio_rgion )',
'      loop',
'        begin',
'            insert into gi_d_formulario_hmlg_dtlle (id_frmlrio_hmlgcion        ,id_frmlrio_rgion_orgn      ,dscrpcion_rgion_orgn          ,id_frmlrio_rgion_atrbto_orgn       ,dscrpcion_atrbto_orgn ,',
'                                                     id_frmlrio_rgion_pgna       , dscrpcion_rgion_pgna       ,id_frmlrio_rgion_atrbto_pgna   ,dscrpcion_atrbto_pgna               ,fla                   ,',
'                                                     orden                       ,vlor                       ,vlor_dsplay) ',
'                                             values (:P246_ID_DCLRCION_HMLGCION  ,c_atrbtos.id_frmlrio_rgion , c_atrbtos.dscrpcion_rgion     ,c_atrbtos.id_frmlrio_rgion_atrbto ,c_atrbtos.dscrpcion_atrbto ,',
'                                                     null                        ,null                       , null                          ,null                              ,1                      , ',
'                                                     c_atrbtos.orden             ,c_atrbtos.vlor_dfcto       , c_atrbtos.nmbre_dsplay);          ',
'         exception   ',
'             when others then',
'                 raise_application_error(-20001, ''error--> '' ||sqlerrm);',
'         end;                                                    ',
'       end loop; ',
'    commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GuardarDetalle'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
