prompt --application/pages/page_00085
begin
wwv_flow_api.create_page(
 p_id=>85
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Homologaci\00F3n Objetos')
,p_step_title=>unistr('Homologaci\00F3n Objetos')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20191107111548'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18887264860829531)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(18887354358829532)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
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
'<i>',
unistr('Funcionalidad que permite gestionar la selecci\00F3n de los lotes puntuales o masivos para iniciar el proceso de prescripci\00F3n.<br><br>'),
'</i>',
'<br><br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18887428998829533)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19032791177792120)
,p_plug_name=>'Homologaciones de Objetos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_hmlgcion_prpdad_item,',
'            c.id_hmlgcion,',
'            a.id_hmlgcion_prpdad,',
'            a.id_frmlrio,',
'            a.id_frmlrio_rgion,',
'            a.id_frmlrio_rgion_atrbto,',
'            a.fla',
'from        gi_d_hmlgcnes_prpddes_items a',
'inner join  gi_d_hmlgcnes_prpdad        b on b.id_hmlgcion_prpdad   =   a.id_hmlgcion_prpdad',
'inner join  gi_d_homologaciones         c on c.id_hmlgcion          =   b.id_hmlgcion',
'where       c.id_hmlgcion           =   nvl(:P85_ID_HMLGCION, c.id_hmlgcion)',
'and         b.id_hmlgcion_prpdad    =   nvl(:P85_GI_D_HMLGCNES_PRPDAD, b.id_hmlgcion_prpdad)',
'and         exists(select       1',
'                   from         gi_d_formularios        d',
'                   where        d.cdgo_clnte    =   :F_CDGO_CLNTE',
'                   and          d.id_frmlrio    =   nvl(:P85_ID_FRMLRIO, d.id_frmlrio)',
'                   and          d.id_frmlrio    =   a.id_frmlrio',
'                  )',
'and         exists(select   1',
'                   from     gi_d_formularios_region e',
'                   where    e.id_frmlrio_rgion  =   nvl(:P85_ID_FRMLRIO_RGION, e.id_frmlrio_rgion)',
'                   and      e.id_frmlrio_rgion  =   a.id_frmlrio_rgion',
'                  )',
'and         exists(select   1',
'                   from     gi_d_frmlrios_rgion_atrbto  f',
'                   where    f.id_frmlrio_rgion_atrbto   =   nvl(:P85_ID_FRMLRIO_RGION_ATRBTO, f.id_frmlrio_rgion_atrbto)',
'                   and      f.id_frmlrio_rgion_atrbto   =   a.id_frmlrio_rgion_atrbto',
'                  );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19032922521792122)
,p_name=>'ID_HMLGCION_PRPDAD_ITEM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_HMLGCION_PRPDAD_ITEM'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19033080607792123)
,p_name=>'ID_HMLGCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_HMLGCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Objeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_objto,',
'        a.id_hmlgcion',
'from    gi_d_homologaciones a;'))
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
 p_id=>wwv_flow_api.id(19033105384792124)
,p_name=>'ID_HMLGCION_PRPDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_HMLGCION_PRPDAD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Propiedad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_prpdad || '' - '' || a.obsrvcion,',
'        a.id_hmlgcion_prpdad',
'from    gi_d_hmlgcnes_prpdad    a;'))
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
 p_id=>wwv_flow_api.id(19033278255792125)
,p_name=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Formulario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_frmlrio || '' - '' || a.dscrpcion,',
'        a.id_frmlrio',
'from    gi_d_formularios    a;'))
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
 p_id=>wwv_flow_api.id(19033348498792126)
,p_name=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Regi\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion',
'from    gi_d_formularios_region a;'))
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
 p_id=>wwv_flow_api.id(19033498102792127)
,p_name=>'ID_FRMLRIO_RGION_ATRBTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ATRBTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Atributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion_atrbto',
'from    gi_d_frmlrios_rgion_atrbto  a;'))
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
 p_id=>wwv_flow_api.id(19035204654792145)
,p_name=>'Editar'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Editar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP,86:P86_ID_HMLGCION_PRPDAD_ITEM:&ID_HMLGCION_PRPDAD_ITEM.'
,p_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20293857728660649)
,p_name=>'FLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FLA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Fila'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(19032801720792121)
,p_internal_uid=>19032801720792121
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
 p_id=>wwv_flow_api.id(19074709207137717)
,p_interactive_grid_id=>wwv_flow_api.id(19032801720792121)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(19074880379137717)
,p_report_id=>wwv_flow_api.id(19074709207137717)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19075300529137718)
,p_view_id=>wwv_flow_api.id(19074880379137717)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(19032922521792122)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19075853843137719)
,p_view_id=>wwv_flow_api.id(19074880379137717)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(19033080607792123)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19076366669137721)
,p_view_id=>wwv_flow_api.id(19074880379137717)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(19033105384792124)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19076890458137722)
,p_view_id=>wwv_flow_api.id(19074880379137717)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(19033278255792125)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19077363220137724)
,p_view_id=>wwv_flow_api.id(19074880379137717)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(19033348498792126)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19077878900137725)
,p_view_id=>wwv_flow_api.id(19074880379137717)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(19033498102792127)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19102642666508116)
,p_view_id=>wwv_flow_api.id(19074880379137717)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(19035204654792145)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22001380508376607)
,p_view_id=>wwv_flow_api.id(19074880379137717)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(20293857728660649)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19033678082792129)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18887264860829531)
,p_button_name=>'BTN_NVO_HMLGCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Homologacion'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP,86:P86_ID_HMLGCION,P86_ID_HMLGCION_PRPDAD,P86_ID_FRMLRIO,P86_ID_FRMLRIO_RGION,P86_ID_FRMLRIO_RGION_ATRBTO:&P85_ID_HMLGCION.,&P85_GI_D_HMLGCNES_PRPDAD.,&P85_ID_FRMLRIO.,&P85_ID_FRMLRIO_RGION.,&P85_ID_FRMLRIO_RGION_ATRBTO.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16414056518495833)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(18887264860829531)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18888055970829539)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18887428998829533)
,p_button_name=>'BTN_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16414148787495834)
,p_branch_action=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,69::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(16414056518495833)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18887580812829534)
,p_name=>'P85_ID_HMLGCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18887428998829533)
,p_prompt=>'Objeto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_objto,',
'        a.id_hmlgcion',
'from    gi_d_homologaciones a',
'order by a.nmbre_objto;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18887687442829535)
,p_name=>'P85_GI_D_HMLGCNES_PRPDAD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18887428998829533)
,p_prompt=>'Propiedad Objeto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_prpdad || '' - '' || a.obsrvcion,',
'        a.id_hmlgcion_prpdad',
'from    gi_d_hmlgcnes_prpdad    a',
'where   a.id_hmlgcion   =   nvl(:P85_ID_HMLGCION, a.id_hmlgcion)',
'order by a.cdgo_prpdad;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P85_ID_HMLGCION'
,p_ajax_items_to_submit=>'P85_GI_D_HMLGCNES_PRPDAD'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18887751576829536)
,p_name=>'P85_ID_FRMLRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(18887428998829533)
,p_prompt=>'Formulario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_frmlrio || '' - '' || a.dscrpcion d,',
'        a.id_frmlrio r',
'from    gi_d_formularios    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'order by a.cdgo_frmlrio, a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18887833395829537)
,p_name=>'P85_ID_FRMLRIO_RGION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(18887428998829533)
,p_prompt=>unistr('Regi\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.dscrpcion,',
'        b.id_frmlrio_rgion',
'from    gi_d_formularios_region b',
'where   exists(select   1',
'               from     gi_d_formularios    a',
'               where    a.cdgo_clnte    =   :F_CDGO_CLNTE',
'               and      a.id_frmlrio    =   :P85_ID_FRMLRIO',
'               and      a.id_frmlrio    =   b.id_frmlrio',
'              )',
'order by b.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P85_ID_FRMLRIO'
,p_ajax_items_to_submit=>'P85_ID_FRMLRIO_RGION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18887990537829538)
,p_name=>'P85_ID_FRMLRIO_RGION_ATRBTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(18887428998829533)
,p_prompt=>'Atributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion_atrbto',
'from    gi_d_frmlrios_rgion_atrbto  a',
'where   exists(select   1',
'               from     gi_d_formularios_region b',
'               where    b.id_frmlrio_rgion  =   :P85_ID_FRMLRIO_RGION',
'               and      b.id_frmlrio_rgion  =   a.id_frmlrio_rgion',
'              )',
'order by a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P85_ID_FRMLRIO_RGION'
,p_ajax_items_to_submit=>'P85_ID_FRMLRIO_RGION_ATRBTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19119482561696603)
,p_name=>'Btn Cerrar Ventana'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19033678082792129)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19119568155696604)
,p_event_id=>wwv_flow_api.id(19119482561696603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19032791177792120)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19119643933696605)
,p_name=>'IG Cerrar Ventana'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(19032791177792120)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19119777979696606)
,p_event_id=>wwv_flow_api.id(19119643933696605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19032791177792120)
,p_stop_execution_on_error=>'Y'
);
end;
/
