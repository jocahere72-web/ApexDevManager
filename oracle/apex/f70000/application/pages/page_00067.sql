prompt --application/pages/page_00067
begin
wwv_flow_api.create_page(
 p_id=>67
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Tipo'
,p_step_title=>'Declaraciones Tipo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200403162347'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17902942987744419)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(17903112762744421)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
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
unistr('<i>Funcionalidad que permite gestionar los tipos de declaraci\00F3n(Periodos, Reg\00EDmenes).<br><br>	'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18561666381436315)
,p_plug_name=>'Declaraciones Tabs'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P67_ID_IMPSTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17901342127744403)
,p_plug_name=>'Tipos de Declaraciones'
,p_parent_plug_id=>wwv_flow_api.id(18561666381436315)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_dclrcn_tpo,',
'            a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            a.cdgo_prdcdad,',
'            b.nmbre_impsto_acto,',
'            a.dscrpcion,',
'            a.actvo',
'from        gi_d_declaraciones_tipo a',
'inner join  df_i_impuestos_acto     b   on  b.id_impsto_acto    =   a.id_impsto_acto',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and     a.id_impsto         =   nvl(:P67_ID_IMPSTO, a.id_impsto)',
'and     a.id_impsto_sbmpsto =   nvl(:P67_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'and     a.cdgo_prdcdad      =   nvl(:P67_CDGO_PRDCDAD, a.cdgo_prdcdad);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17902287235744412)
,p_name=>'ID_DCLRCN_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCN_TPO'
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
 p_id=>wwv_flow_api.id(17902360788744413)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto,',
'        a.id_impsto',
'from    df_c_impuestos  a;'))
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
 p_id=>wwv_flow_api.id(17902491776744414)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_sbmpsto,',
'        a.id_impsto_sbmpsto',
'from    df_i_impuestos_subimpuesto  a;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_IMPSTO'
,p_ajax_items_to_submit=>'ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17902577678744415)
,p_name=>'CDGO_PRDCDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_PRDCDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodicidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.cdgo_prdcdad',
'from    df_s_periodicidad   a;'))
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
 p_id=>wwv_flow_api.id(17902695920744416)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(17902746916744417)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Si;S,No;N'
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
 p_id=>wwv_flow_api.id(17902816146744418)
,p_name=>'Editar'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Editar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:RP,68:P68_ID_DCLRCN_TPO:&ID_DCLRCN_TPO.'
,p_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18561290577436311)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(40681551088743402)
,p_name=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(17902195370744411)
,p_internal_uid=>17902195370744411
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
 p_id=>wwv_flow_api.id(18484951128468073)
,p_interactive_grid_id=>wwv_flow_api.id(17902195370744411)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(18485071263468073)
,p_report_id=>wwv_flow_api.id(18484951128468073)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18485597090468076)
,p_view_id=>wwv_flow_api.id(18485071263468073)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(17902287235744412)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18486020114468079)
,p_view_id=>wwv_flow_api.id(18485071263468073)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(17902360788744413)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18486567366468081)
,p_view_id=>wwv_flow_api.id(18485071263468073)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(17902491776744414)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18487003392468082)
,p_view_id=>wwv_flow_api.id(18485071263468073)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(17902577678744415)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18487582824468084)
,p_view_id=>wwv_flow_api.id(18485071263468073)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(17902695920744416)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18488069616468085)
,p_view_id=>wwv_flow_api.id(18485071263468073)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(17902746916744417)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18506988159545139)
,p_view_id=>wwv_flow_api.id(18485071263468073)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(17902816146744418)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40695101991799308)
,p_view_id=>wwv_flow_api.id(18485071263468073)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(40681551088743402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18562313930436322)
,p_plug_name=>'Periodos'
,p_parent_plug_id=>wwv_flow_api.id(18561666381436315)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion_tpo_vgncia,',
'        a.id_dclrcn_tpo,',
'        a.vgncia,',
'        a.id_prdo,',
'        a.actvo',
'from    gi_d_dclrcnes_tpos_vgncias  a;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(17901342127744403)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18562525845436324)
,p_name=>'ID_DCLRCION_TPO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_TPO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18562634736436325)
,p_name=>'ID_DCLRCN_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCN_TPO'
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
,p_parent_column_id=>wwv_flow_api.id(17902287235744412)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18562722482436326)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.vgncia text,',
'            a.vgncia value',
'from        df_i_impuestos_acto_concepto    a',
'inner join  gi_d_declaraciones_tipo         b   on  b.id_impsto_acto    =  a.id_impsto_acto',
'where       b.id_dclrcn_tpo =   :ID_DCLRCN_TPO',
'group by a.vgncia',
'order by a.vgncia;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18562839869436327)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.prdo || '' - '' || b.dscrpcion text,',
'            b.id_prdo value',
'from        df_i_impuestos_acto_concepto    a',
'inner join  df_i_periodos                   b   on  b.id_prdo           =   a.id_prdo',
'inner join  gi_d_declaraciones_tipo         c   on  c.id_impsto_acto    =   a.id_impsto_acto',
'                                                and c.cdgo_prdcdad      =   b.cdgo_prdcdad',
'where       c.id_dclrcn_tpo =   :ID_DCLRCN_TPO',
'and         a.vgncia        =   :VGNCIA',
'group by b.prdo || '' - '' || b.dscrpcion,',
'         b.id_prdo',
'order by b.prdo || '' - '' || b.dscrpcion;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'ID_DCLRCN_TPO,VGNCIA'
,p_ajax_items_to_submit=>'ID_PRDO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18562976670436328)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18563000173436329)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18563148974436330)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(18562479213436323)
,p_internal_uid=>18562479213436323
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
 p_id=>wwv_flow_api.id(18595830667969070)
,p_interactive_grid_id=>wwv_flow_api.id(18562479213436323)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(18595975052969070)
,p_report_id=>wwv_flow_api.id(18595830667969070)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18596432466969073)
,p_view_id=>wwv_flow_api.id(18595975052969070)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(18562525845436324)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18596935112969075)
,p_view_id=>wwv_flow_api.id(18595975052969070)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(18562634736436325)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18597498191969077)
,p_view_id=>wwv_flow_api.id(18595975052969070)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(18562722482436326)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18597955533969078)
,p_view_id=>wwv_flow_api.id(18595975052969070)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(18562839869436327)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18598480950969080)
,p_view_id=>wwv_flow_api.id(18595975052969070)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(18562976670436328)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18608245856017890)
,p_view_id=>wwv_flow_api.id(18595975052969070)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(18563000173436329)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20291766479660628)
,p_plug_name=>'Tipos de Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(18561666381436315)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion_tpo_sjto,',
'        a.id_dclrcn_tpo,',
'        a.id_sjto_tpo',
'from    gi_d_dclrcnes_tpos_sjto    a;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(17901342127744403)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20291944300660630)
,p_name=>'ID_DCLRCION_TPO_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_TPO_SJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20292000911660631)
,p_name=>'ID_DCLRCN_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCN_TPO'
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
,p_parent_column_id=>wwv_flow_api.id(17902287235744412)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20292136092660632)
,p_name=>'ID_SJTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo de Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sjto_tpo,',
'        a.id_sjto_tpo',
'from    df_i_sujetos_tipo   a',
'where   exists(select   1',
'               from     gi_d_declaraciones_tipo b',
'               where    b.id_dclrcn_tpo =   :ID_DCLRCN_TPO',
'               and      b.id_impsto     =   a.id_impsto)',
'order by a.nmbre_sjto_tpo;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20292297382660633)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20292327844660634)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(20291873984660629)
,p_internal_uid=>20291873984660629
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
 p_id=>wwv_flow_api.id(20441604883883212)
,p_interactive_grid_id=>wwv_flow_api.id(20291873984660629)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(20441716713883212)
,p_report_id=>wwv_flow_api.id(20441604883883212)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20442233016883215)
,p_view_id=>wwv_flow_api.id(20441716713883212)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(20291944300660630)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20442622610883219)
,p_view_id=>wwv_flow_api.id(20441716713883212)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(20292000911660631)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20443172150883221)
,p_view_id=>wwv_flow_api.id(20441716713883212)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(20292136092660632)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20446081322892135)
,p_view_id=>wwv_flow_api.id(20441716713883212)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(20292297382660633)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18561796394436316)
,p_plug_name=>unistr('Opciones de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17903033361744420)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(17902942987744419)
,p_button_name=>'BTN_NVO_DCLRCION_TPO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo Tipo<br>De Declaraci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:RP,68::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18562254704436321)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18561796394436316)
,p_button_name=>'BTN_Consultar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16412668569495819)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(17902942987744419)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,69::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18561854676436317)
,p_name=>'P67_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18561796394436316)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo a consultar'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18561983908436318)
,p_name=>'P67_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18561796394436316)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_sbmpsto,',
'        a.id_impsto_sbmpsto',
'from    df_i_impuestos_subimpuesto  a',
'where   a.id_impsto =   :P67_ID_IMPSTO',
'order by    a.nmbre_impsto_sbmpsto;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P67_ID_IMPSTO'
,p_ajax_items_to_submit=>'P67_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el sub-tributo a consultar'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18562038697436319)
,p_name=>'P67_CDGO_PRDCDAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(18561796394436316)
,p_prompt=>'Periodicidad'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.cdgo_prdcdad',
'from    df_s_periodicidad   a',
'order by a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la periodicidad del tributo a consultar'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18563589449436334)
,p_tabular_form_region_id=>wwv_flow_api.id(18562313930436322)
,p_validation_name=>unistr('Validar Periodos \00DAnicos')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_d_dclrcnes_tpos_vgncias  a',
'where   a.id_dclrcn_tpo =   :ID_DCLRCN_TPO',
'and     a.vgncia        =   :VGNCIA',
'and     a.id_prdo       =   :ID_PRDO'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El periodo ya se encuentra definido.'
,p_validation_condition_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20292554208660636)
,p_tabular_form_region_id=>wwv_flow_api.id(20291766479660628)
,p_validation_name=>unistr('Validar tipo de sujeto \00FAnico')
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_d_dclrcnes_tpos_sjto a',
'where   id_dclrcn_tpo   =   :ID_DCLRCN_TPO',
'and     id_sjto_tpo     =   :ID_SJTO_TPO;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El tipo de sujeto ya se encuentra parametrizado.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20292675983660637)
,p_tabular_form_region_id=>wwv_flow_api.id(18562313930436322)
,p_validation_name=>unistr('Validar relaci\00F3n periodos formularios')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_d_dclrcnes_vgncias_frmlr a',
'where   exists(select   1',
'               from     gi_d_dclrcnes_tpos_vgncias  b',
'               where    b.id_dclrcion_tpo_vgncia    =   :ID_DCLRCION_TPO_VGNCIA',
'               and      b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'              );'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('El periodo tiene registrado una relaci\00F3n con formularios.')
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20292849602660639)
,p_tabular_form_region_id=>wwv_flow_api.id(18562313930436322)
,p_validation_name=>unistr('Validar fechas de presentaci\00F3n')
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_d_dclrcnes_fcha_prsntcn  a',
'where   exists(select   1',
'               from     gi_d_dclrcnes_tpos_vgncias  b',
'               where    b.id_dclrcion_tpo_vgncia    =   :ID_DCLRCION_TPO_VGNCIA',
'               and      b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'              );'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('El periodo tiene registrado fechas de presentaci\00F3n.')
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17905053802744440)
,p_name=>'Btn Cerrar Ventana'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(17903033361744420)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17905168587744441)
,p_event_id=>wwv_flow_api.id(17905053802744440)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(17901342127744403)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17905233925744442)
,p_name=>'CI Cerrar Ventana'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(17901342127744403)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17905317705744443)
,p_event_id=>wwv_flow_api.id(17905233925744442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(17901342127744403)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28930887905922302)
,p_name=>unistr('al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(18562254704436321)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28930944091922303)
,p_event_id=>wwv_flow_api.id(28930887905922302)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$redirect([''P67_ID_IMPSTO'',''P67_ID_IMPSTO_SBMPSTO'',''P67_CDGO_PRDCDAD''], [$v(''P67_ID_IMPSTO''),$v(''P67_ID_IMPSTO_SBMPSTO''),$v(''P67_CDGO_PRDCDAD'')]);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18561331193436312)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(17901342127744403)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Declaraciones Tipo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18563205614436331)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(18562313930436322)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Periodos a Declarar: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(20292487178660635)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(20291766479660628)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Tipos de Sujeto: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
