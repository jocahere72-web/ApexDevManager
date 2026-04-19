prompt --application/pages/page_00172
begin
wwv_flow_api.create_page(
 p_id=>172
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Registro Solicitud Modificaci\00F3n N\00FAmero de Cuotas Acuerdo de Pago')
,p_step_title=>unistr('Registro Modificaci\00F3n de Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101165025'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103878126291926901)
,p_plug_name=>'workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:margin-bottom-none:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105051527951258601)
,p_plug_name=>unistr('Registro Modificaci\00F3n Acuerdo de Pago')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104543257795907801)
,p_plug_name=>'PQR'
,p_parent_plug_id=>wwv_flow_api.id(105051527951258601)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112657924454343602)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(104543257795907801)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112658176486343604)
,p_plug_name=>unistr('<b>INFORMACI\00D3N DEL SOLICITANTE </b>')
,p_parent_plug_id=>wwv_flow_api.id(104543257795907801)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112674755142407101)
,p_plug_name=>'<b>DOCUMENTOS </b>'
,p_parent_plug_id=>wwv_flow_api.id(104543257795907801)
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_dcmnto,',
'        c.dscrpcion_dcmnto,',
'        a.file_name,',
'        a.obsrvcion,',
'        1 dscrgar',
'   from pq_g_documentos             a',
'   join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(112675772707407111)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>112675772707407111
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112675863164407112)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112675992056407113)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112676090200407114)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112676108252407115)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112676280709407116)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Descarga'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(112683119778411820)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1126832'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO:DSCRPCION_DCMNTO:FILE_NAME:OBSRVCION:DSCRGAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105194862037632601)
,p_plug_name=>unistr('Tipo de Modificaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(105051527951258601)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109687723304204205)
,p_plug_name=>'Plan de pago'
,p_parent_plug_id=>wwv_flow_api.id(105194862037632601)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select seq_id, ',
'        n001 nmro_cta, ',
'        n004 vlor_cptal,',
'        n005 vlor_intres,',
'        n003 vlor_fnccion,',
'        n002 vlor_cta, ',
'        d001 fcha_cta',
'  from apex_collections ',
'  where collection_name = ''MODIFICACION_CONVENIO''',
' order by n001'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P172_ID_CNVNIO_MDFCCION'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109688105331204209)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
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
 p_id=>wwv_flow_api.id(109688271056204210)
,p_name=>'NMRO_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero Cuota')
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
 p_id=>wwv_flow_api.id(109688368130204211)
,p_name=>'VLOR_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Cuota'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(109688453257204212)
,p_name=>'FCHA_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CTA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Cuota'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(112236674687680401)
,p_name=>'VLOR_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(112236755754680402)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(112236861216680403)
,p_name=>'VLOR_FNCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_FNCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Financiaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(109688037210204208)
,p_internal_uid=>109688037210204208
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(109700813105366698)
,p_interactive_grid_id=>wwv_flow_api.id(109688037210204208)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(109700945653366699)
,p_report_id=>wwv_flow_api.id(109700813105366698)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109701409298366702)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(109688105331204209)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109701956030366705)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(109688271056204210)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109702494383366706)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(109688368130204211)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109702962285366707)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(109688453257204212)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>30
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112242645966686334)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(112236674687680401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112243126707686338)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(112236755754680402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112243686356686339)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(112236861216680403)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(11641000002)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(109688368130204211)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(121210003356)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(112236861216680403)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(251146003356)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(112236755754680402)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(345714003356)
,p_view_id=>wwv_flow_api.id(109700945653366699)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(112236674687680401)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120296457584507801)
,p_plug_name=>'Actualizar Plan de Pago '
,p_parent_plug_id=>wwv_flow_api.id(105194862037632601)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cta, ',
'        to_char(vlor_cptal, :F_FRMTO_MNDA) vlor_cptal,',
'        to_char(vlor_intres, :F_FRMTO_MNDA) vlor_intres,',
'        to_char(vlor_fncncion, :F_FRMTO_MNDA) vlor_fncncion,',
'        to_char(vlor_ttal, :F_FRMTO_MNDA) vlor_ttal,  ',
'        to_char(fcha_vncmnto, ''DD/MM/YYYY'') fcha_vncmnto',
'  from gf_g_cnvnios_mdfccn_extrct ',
'  where id_cnvnio_mdfccion = :P172_ID_CNVNIO_MDFCCION',
' order by nmro_cta'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P172_ID_CNVNIO_MDFCCION'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(120296649929507803)
,p_name=>'NMRO_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero Cuota')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(120296728660507804)
,p_name=>'VLOR_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(120296887383507805)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(120296981706507806)
,p_name=>'VLOR_FNCNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_FNCNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Financiaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(120297028068507807)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Cuota'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(120297160048507808)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(120296558594507802)
,p_internal_uid=>120296558594507802
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(120302046769529865)
,p_interactive_grid_id=>wwv_flow_api.id(120296558594507802)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(120302194399529865)
,p_report_id=>wwv_flow_api.id(120302046769529865)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120302610142529873)
,p_view_id=>wwv_flow_api.id(120302194399529865)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(120296649929507803)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120303125069529877)
,p_view_id=>wwv_flow_api.id(120302194399529865)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(120296728660507804)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120303643839529878)
,p_view_id=>wwv_flow_api.id(120302194399529865)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(120296887383507805)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120304117269529880)
,p_view_id=>wwv_flow_api.id(120302194399529865)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(120296981706507806)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120304668553529881)
,p_view_id=>wwv_flow_api.id(120302194399529865)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(120297028068507807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120305192467529882)
,p_view_id=>wwv_flow_api.id(120302194399529865)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(120297160048507808)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(272386253357716951)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(318460437763428688)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
'    <p align="justify">Esta Funcionalidad Facilita.<br><br> ',
unistr('        <b>1. </b>Se muestra la informaci\00F3n b\00E1sica del solicitante, la informaci\00F3n del sujeto tributo y los documentos que est\00E1n relacionados con la radicaci\00F3n.<br><br>        '),
unistr('        <b>2. </b> Permite Definir el tipo de modificaci\00F3n, ya sea por n\00FAmero de cuotas, fecha de cuotas o adici\00F3n de vigencias. asi mismo, permite actualizar la informaci\00F3n necesaria para efectos de la modificaci\00F3n.<br><br>'),
unistr('        <b>3. </b>Permite el registro de la modificaci\00F3n del acuerdo de pago.<br><br>'),
'    </p>',
'',
'</i>     '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109789701803595702)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(105194862037632601)
,p_button_name=>'BTN_PLAN_PAGO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Actualizar Plan de Pago'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P172_ID_CNVNIO_MDFCCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105351342150731080)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(272386253357716951)
,p_button_name=>'BTN_NUEVO_REGISTRO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Modificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM GF_G_CONVENIOS_MODIFICACION B',
'  WHERE B.ID_CNVNIO_MDFCCION = :P172_ID_CNVNIO_MDFCCION'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(112412699357573202)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(272386253357716951)
,p_button_name=>'BTN_PLAN_PAGO_ACTUAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Plan Pago Actual'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'not exists (select 1 ',
'  from gf_g_convenios_modificacion ',
' where cdgo_cnvnio_mdfccion_estdo = ''APL''',
'   and id_cnvnio_mdfccion = :P172_ID_CNVNIO_MDFCCION)'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(115479266502860601)
,p_branch_name=>'Ir a Pagina 16'
,p_branch_action=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP:P16_ID_CNVNIO_MDFCCION:&P172_ID_CNVNIO_MDFCCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(105351342150731080)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(120284886678819803)
,p_branch_name=>'Ir a Pagina 195'
,p_branch_action=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.:RP:P195_ID_CNVNIO:&P172_ID_CNVNIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(112412699357573202)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103898105495547304)
,p_name=>'P172_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112658176486343604)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104543361422907802)
,p_name=>'P172_DRCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(112657924454343602)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104543400813907803)
,p_name=>'P172_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112657924454343602)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104543562470907804)
,p_name=>'P172_NMBRE_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112657924454343602)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104543693254907805)
,p_name=>'P172_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112657924454343602)
,p_prompt=>'SubTributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104587497409237002)
,p_name=>'P172_CDGO_IDNTFCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112658176486343604)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104587558965237003)
,p_name=>'P172_NMRO_IDNTFCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(112658176486343604)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104587641111237004)
,p_name=>'P172_NMBRE_CMPLTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112658176486343604)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104587723027237005)
,p_name=>'P172_DRCCION_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(112658176486343604)
,p_prompt=>unistr('Direcci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104587855760237006)
,p_name=>'P172_UBCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(112658176486343604)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104587920782237007)
,p_name=>'P172_TLFNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(112658176486343604)
,p_prompt=>'Telefono'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104588060136237008)
,p_name=>'P172_CLLAR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(112658176486343604)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104588121288237009)
,p_name=>'P172_EMAIL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(112658176486343604)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105015586450159301)
,p_name=>'P172_ID_SLCTUD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(112657924454343602)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105194929260632602)
,p_name=>'P172_ID_CNVNIO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_prompt=>unistr('N\00FAmero de Acuerdo')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select a.nmro_cnvnio||'' - N\00B0 Cuotas Anteriores: ''|| count(b.nmro_cta) as d, a.id_cnvnio '),
'from gf_g_convenios a',
'join gf_g_convenios_extracto b on a.id_cnvnio = b.id_cnvnio and actvo = ''S''',
'where a.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_sjto_impsto = :P172_ID_SJTO_IMPSTO',
'and a.cdgo_cnvnio_estdo = ''APL''',
'group by a.id_cnvnio, a.nmro_cnvnio;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P172_ID_CNVNIO_MDFCCION'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105195048771632603)
,p_name=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_prompt=>unistr('Tipo de Modificaci\00F3n ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_MODIFICACION_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.dscrpcion as d',
'       ,t.cdgo_cnvnio_mdfccion_tpo as r',
'  from gf_d_convenios_mdfccn_tpo t',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_read_only_when=>'P172_ID_CNVNIO_MDFCCION'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105195229474632605)
,p_name=>'P172_MDFCCION_NMRO_CTA_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_prompt=>unistr('Tipo Modificaci\00F3n N\00FAmero de Cuotas')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:ADICI\00D3N;ADC,REDUCCI\00D3N;RDC')
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_read_only_when=>'P172_ID_CNVNIO_MDFCCION'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105195385865632606)
,p_name=>'P172_NVO_NMRO_CTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_prompt=>unistr('Nuevo N\00FAmero de Cuotas')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_read_only_when=>'P172_ID_CNVNIO_MDFCCION'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105195448103632607)
,p_name=>'P172_FCHA_SGTE_CTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_prompt=>'Fecha Siguiente Cuota'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_read_only_when=>'P172_ID_CNVNIO_MDFCCION'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_02=>'&P172_FCHA_MINA_ADDDA.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105195555579632608)
,p_name=>'P172_CDGO_PRDCDAD_CTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_prompt=>'Periodicidad De Cuota'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PERIODICIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_prdcdad as r',
'  from df_s_periodicidad',
' order by cntdad_vce_anio desc'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_read_only_when=>'P172_ID_CNVNIO_MDFCCION'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105606347605385703)
,p_name=>'P172_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107020532408612201)
,p_name=>'P172_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(112657924454343602)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107499462515409301)
,p_name=>'P172_NVO_ID_PRDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Vigencia-Periodo: '' || vgncia||'' - ''|| prdo  || '', con Saldo: ['' || to_char(sum(vlor_sldo_cptal) + sum(vlor_intres), ''FM$999G999G999G999G999G999G990'') ||'']''  d,',
'       id_prdo',
'  from v_gf_g_cartera_x_vigencia ',
' where cdgo_mvnt_fncro_estdo = ''NO''',
'   and cdgo_clnte = :F_CDGO_CLNTE',
'   and id_sjto_impsto = :P172_ID_SJTO_IMPSTO',
'   and (vgncia, id_prdo ) not in (select vgncia, id_prdo ',
'                                     from gf_g_convenios_cartera',
'                                    where id_cnvnio = :P172_ID_CNVNIO)',
'group by id_prdo, prdo, vgncia                        ',
'',
'',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109687459140204202)
,p_name=>'P172_ID_CNVNIO_MDFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112710856554210204)
,p_name=>'P172_FCHA_MINA_ADDDA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105194862037632601)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select min(m.fcha_vncmnto)  + 1',
'  from v_gf_g_convenios_extracto m',
' where m.id_cnvnio = :P172_ID_CNVNIO',
'   and m.actvo = ''S''',
'   and m.estdo_cta = ''ADEUDADA'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(103897865245547301)
,p_computation_sequence=>10
,p_computation_item=>'P172_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_INSTNCIA_FLJO'
,p_compute_when=>'P172_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(107414278050558801)
,p_validation_name=>unistr('tipo de modificaci\00F3n de numero de cuota no nulo')
,p_validation_sequence=>10
,p_validation=>'P172_MDFCCION_NMRO_CTA_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar un Valor'
,p_validation_condition=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_validation_condition2=>'MNC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(105351342150731080)
,p_associated_item=>wwv_flow_api.id(105195229474632605)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(112412579410573201)
,p_validation_name=>'la fecha de la siguiente cuota no puede ser menor a la fecha minima de las cuotas adeudadas'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P172_FCHA_SGTE_CTA > ( select a.fcha_vncmnto',
'                  from ( select a.fcha_vncmnto,',
'                                case when a.nmro_cta = 1 then',
'                                        trunc(a.fcha_slctud)',
'                                      else',
'                                        trunc(first_value(a.fcha_vncmnto) over ( partition by a.id_cnvnio order by a.nmro_cta desc range between 1 following and unbounded following ))',
'                                     end as fcha_antrior,',
'                                     a.nmro_cta,',
'                                     b.cdgo_prdcdad_cta',
'                                from v_gf_g_convenios_extracto a',
'                                join gf_g_convenios b on a.id_cnvnio = b.id_cnvnio',
'                               where a.id_cnvnio = :P172_ID_CNVNIO',
'                                 and a.actvo = ''S'') a',
'                    where a.fcha_vncmnto = (select min(m.fcha_vncmnto) ',
'                                              from v_gf_g_convenios_extracto m',
'                                             where m.id_cnvnio = :P172_ID_CNVNIO',
'                                               and m.actvo = ''S''',
'                                               and m.estdo_cta = ''ADEUDADA''));'))
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'La fecha debe ser mayor a la fecha de la primera cuota adeudada'
,p_validation_condition=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_validation_condition2=>'MFC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(109789701803595702)
,p_associated_item=>wwv_flow_api.id(105195448103632607)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(112710956445210205)
,p_validation_name=>unistr('Periodicidad no nula cuando el tipo de modificaci\00F3n es de fecha de acuerdo de pago')
,p_validation_sequence=>30
,p_validation=>'P172_CDGO_PRDCDAD_CTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione una periodicidad'
,p_validation_condition=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_validation_condition2=>'MFC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(109789701803595702)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(112413296231573208)
,p_validation_name=>unistr('Nuevo n\00FAmero de cuotas no nulo')
,p_validation_sequence=>40
,p_validation=>'P172_NVO_NMRO_CTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor ingresar el nuevo n\00FAmero de cuotas')
,p_validation_condition=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_validation_condition2=>'MNC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(105195385865632606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(112413309074573209)
,p_validation_name=>unistr('Nuevo n\00FAmero de cuotas mayor que cuotas anteriores cuando sea modificaci\00F3n de cuotas y adici\00F3n de cuotas ')
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_ctas_cnvnio     number;',
'begin ',
'',
'    select count(b.nmro_cta)',
'      into v_nmro_ctas_cnvnio',
'      from gf_g_convenios a',
'      join gf_g_convenios_extracto b on a.id_cnvnio = b.id_cnvnio',
'     where a.id_cnvnio = :P172_ID_CNVNIO; ',
'    ',
'    if v_nmro_ctas_cnvnio < :P172_NVO_NMRO_CTA then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('El n\00FAmero numero de cuotas debe ser superior al n\00FAmero de cuotas actual del acuerdo de pago')
,p_validation_condition=>':P172_CDGO_CNVNIO_MDFCCION_TPO  = ''MNC'' and :P172_MDFCCION_NMRO_CTA_TPO = ''ADC'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(105195385865632606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(112413430489573210)
,p_validation_name=>unistr('Nuevo n\00FAmero de cuotas menor que cuotas anteriores cuando sea modificaci\00F3n de cuotas y reducci\00F3n de cuotas _1')
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_ctas_cnvnio     number;',
'begin ',
'    select nmro_cta',
'      into v_nmro_ctas_cnvnio',
'      from gf_g_convenios',
'     where id_cnvnio = :P172_ID_CNVNIO; ',
'    ',
'    if v_nmro_ctas_cnvnio > :P172_NVO_NMRO_CTA then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('El n\00FAmero numero de cuotas debe ser menor al n\00FAmero de cuotas actual del acuerdo de pago')
,p_validation_condition=>':P172_CDGO_CNVNIO_MDFCCION_TPO  = ''MNC'' and :P172_MDFCCION_NMRO_CTA_TPO = ''RDC'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(105195385865632606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(122576747528264103)
,p_validation_name=>unistr('Valida M\00E1ximo N\00FAmero de Cuotas')
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_nmro_mxmo_ctas    number;',
'begin',
'',
'    select a.nmro_mxmo_ctas',
'      into v_nmro_mxmo_ctas',
'      from gf_d_convenios_tipo a ',
'      join gf_g_convenios b on a.id_cnvnio_tpo = b.id_cnvnio_tpo',
'     where b.id_cnvnio = :P172_ID_CNVNIO;',
'     ',
'     if :P172_NVO_NMRO_CTA > v_nmro_mxmo_ctas then',
'         return false;',
'     end if;',
'     ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Valor Supera el M\00E1ximo N\00FAmero de Cuotas Permitido para este Tipo de Acuerdo de Pago.')
,p_validation_condition=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_validation_condition2=>'MNC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(109789701803595702)
,p_associated_item=>wwv_flow_api.id(105195385865632606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105450528086484803)
,p_name=>unistr('Modificaci\00F3n N\00FAmero de Cuotas')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_condition_element=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'MNC'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_BE.CTB.SELECT2|ITEM TYPE|slctchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105450694694484804)
,p_event_id=>wwv_flow_api.id(105450528086484803)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P172_MDFCCION_NMRO_CTA_TPO,P172_NVO_NMRO_CTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105451173033484809)
,p_event_id=>wwv_flow_api.id(105450528086484803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P172_MDFCCION_NMRO_CTA_TPO,P172_NVO_NMRO_CTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105450797085484805)
,p_name=>unistr('Modificaci\00F3n Fecha Cuotas')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_condition_element=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'MFC'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105450873185484806)
,p_event_id=>wwv_flow_api.id(105450797085484805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P172_FCHA_SGTE_CTA,P172_CDGO_PRDCDAD_CTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105450959280484807)
,p_event_id=>wwv_flow_api.id(105450797085484805)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P172_FCHA_SGTE_CTA,P172_CDGO_PRDCDAD_CTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(107499598602409302)
,p_name=>'Adicionar Vigencia'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_condition_element=>'P172_CDGO_CNVNIO_MDFCCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'AVA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(107499608657409303)
,p_event_id=>wwv_flow_api.id(107499598602409302)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P172_NVO_ID_PRDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(107499718457409304)
,p_event_id=>wwv_flow_api.id(107499598602409302)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P172_NVO_ID_PRDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119027608397491101)
,p_name=>'Borrar Ruta Actual'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(105351342150731080)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119027789108491102)
,p_event_id=>wwv_flow_api.id(119027608397491101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''BTN_NUEVO_REGISTRO'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109687304693204201)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Plan de Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_nmro_cta              number;',
'    v_nmro_ctas_cnvnio      number;',
'    v_vlor_cta              number;',
'    v_vlor_ttal_cnvnio      number;',
'    v_fcha_cta              date;',
'    v_cdgo_prdcdad_cta      varchar2(5);',
'    v_fcha_cta_hbil         date;',
'    v_nmro_dia              varchar2(200);',
'    v_mnsje                 varchar2(200);',
'    v_fcha_slctud           date;',
'    v_fcha_cta_antrior      date;',
'    v_vlor_ttal_cptal       number;',
'    v_vlor_ttal_intres      number;',
'    v_vlor_cta_cptal        number;',
'    v_vlor_cta_intres       number;',
'    v_tsa_dria_cnvnio       number;',
'    v_sldo_cptal            number;',
'    v_sldo_intres           number;',
'    v_vlor_fnccion          number;',
'    v_ttal_ctas             number;',
'    v_vlor_cta_incial       number;',
'    v_anio                  number;',
'    v_valida_error          exception; ',
'    v_cdgo_cnvnio_mdfccion_tpo  varchar2(3); ',
'    v_fcha_prmra_cta          date;',
'    v_count                   number;',
'    v_vlor_ctal_nva_vgncia    number;',
'    v_vlor_intres_nva_vgncia  number;',
'    v_fcha_mxma_ctas          date;',
'    ',
'begin',
'    ',
'    v_nmro_cta                  := 0;',
'    v_nmro_dia                  := 0;',
'    v_nmro_ctas_cnvnio          := 0;',
'    v_cdgo_prdcdad_cta          := null;',
'    :P172_RSPSTA                := null ;',
'    v_fcha_cta_antrior          := null;',
'    v_vlor_ttal_cnvnio          := 0;',
'    v_vlor_ttal_cptal           := 0;',
'    v_vlor_ttal_intres          := 0;',
'    v_vlor_cta_cptal            := 0;',
'    v_vlor_cta_intres           := 0;',
'    v_tsa_dria_cnvnio           := 0;',
'    v_sldo_cptal                := 0;',
'    v_sldo_intres               := 0;',
'    v_vlor_fnccion              := 0;',
'    v_ttal_ctas                 := 0;',
'    v_count                     := 0; ',
'    v_anio                      := extract (year from sysdate);',
'    v_cdgo_cnvnio_mdfccion_tpo  := null; ',
'',
'  ',
'        if :P172_CDGO_CNVNIO_MDFCCION_TPO = ''MNC''  then ',
'            v_nmro_ctas_cnvnio:= :P172_NVO_NMRO_CTA;          ',
'            begin',
'                select a.fcha_vncmnto,',
'                       a.fcha_antrior,',
'                       a.fcha_antrior,',
'                       a.cdgo_prdcdad_cta',
'                  into v_fcha_prmra_cta,',
'                       v_fcha_slctud, ',
'                       v_fcha_cta_antrior,',
'                       v_cdgo_prdcdad_cta',
'                  from ( select a.fcha_vncmnto,',
'                                case when a.nmro_cta = 1 then',
'                                        trunc(a.fcha_slctud)',
'                                      else',
'                                        trunc(first_value(a.fcha_vncmnto) over ( partition by a.id_cnvnio order by a.nmro_cta desc range between 1 following and unbounded following ))',
'                                     end as fcha_antrior,',
'                                     a.nmro_cta,',
'                                     b.cdgo_prdcdad_cta',
'                                from v_gf_g_convenios_extracto a',
'                                join gf_g_convenios b on a.id_cnvnio = b.id_cnvnio',
'                               where a.id_cnvnio = :P172_ID_CNVNIO',
'                                 and a.actvo = ''S'') a',
'                    where a.fcha_vncmnto = (select min(m.fcha_vncmnto) ',
'                                              from v_gf_g_convenios_extracto m',
'                                             where m.id_cnvnio = :P172_ID_CNVNIO',
'                                               and m.actvo = ''S''',
'                                               and m.estdo_cta = ''ADEUDADA'')',
'                                               and rownum = 1',
'                  order by nmro_cta;',
'                  ',
'                  insert into gti_aux (col1, col2) values (''entrando a modificacion de cuota(mnc): '', null);commit; ',
'                  ',
'            exception',
'                when no_data_found then ',
'                    raise_application_error(-20001, ''Error: El convenio no cumple con las condiciones'');',
'            end;',
'            ',
'            v_fcha_cta := v_fcha_prmra_cta;',
'            ',
'      elsif :P172_CDGO_CNVNIO_MDFCCION_TPO = ''MFC'' then',
'            v_cdgo_prdcdad_cta := :P172_CDGO_PRDCDAD_CTA; ',
'            v_fcha_cta  := :P172_FCHA_SGTE_CTA;',
'            ',
'            select a.fcha_antrior,',
'                   a.nmro_cta_cnvnio,',
'                   a.nmro_cta - 1',
'              into v_fcha_slctud, ',
'                   v_nmro_ctas_cnvnio,',
'                   v_nmro_cta',
'              from ( select a.fcha_vncmnto,',
'                            case when a.nmro_cta = 1 then',
'                                    trunc(a.fcha_slctud)',
'                                  else',
'                                    trunc(first_value(a.fcha_vncmnto) over ( partition by a.id_cnvnio order by a.nmro_cta desc range between 1 following and unbounded following ))',
'                                 end as fcha_antrior,',
'                                 a.nmro_cta,',
'                                 b.cdgo_prdcdad_cta,',
'                                 b.nmro_cta nmro_cta_cnvnio',
'                            from v_gf_g_convenios_extracto a',
'                            join gf_g_convenios b on a.id_cnvnio = b.id_cnvnio',
'                           where a.id_cnvnio = :P172_ID_CNVNIO',
'                             and a.actvo = ''S'') a',
'                where a.fcha_vncmnto = (select min(m.fcha_vncmnto) ',
'                                          from v_gf_g_convenios_extracto m',
'                                         where m.id_cnvnio = :P172_ID_CNVNIO',
'                                           and m.actvo = ''S''',
'                                           and m.estdo_cta = ''ADEUDADA'')',
'              order by nmro_cta;',
'             ',
'             insert into gti_aux (col1, col2) values (''v_cdgo_prdcdad_cta: '', v_cdgo_prdcdad_cta);commit; ',
'             insert into gti_aux (col1, col2) values (''v_fcha_cta: '', to_char(v_fcha_cta));commit; ',
'             insert into gti_aux (col1, col2) values (''v_nmro_cta: '', v_nmro_cta);commit; ',
'             ',
'      elsif :P172_CDGO_CNVNIO_MDFCCION_TPO = ''AVA'' and :P172_NVO_ID_PRDO is not null then ',
'              v_vlor_ctal_nva_vgncia    := 0;',
'              v_vlor_intres_nva_vgncia  := 0;',
'    ',
'            select a.fcha_antrior,',
'                   a.fcha_vncmnto,',
'                   a.nmro_cta_cnvnio,',
'                   a.nmro_cta - 1,',
'                   a.cdgo_prdcdad_cta',
'              into v_fcha_slctud, ',
'                   v_fcha_cta,',
'                   v_nmro_ctas_cnvnio,',
'                   v_nmro_cta,',
'                   v_cdgo_prdcdad_cta',
'              from ( select a.fcha_vncmnto,',
'                            case when a.nmro_cta = 1 then',
'                                    trunc(a.fcha_slctud)',
'                                  else',
'                                    trunc(first_value(a.fcha_vncmnto) over ( partition by a.id_cnvnio order by a.nmro_cta desc range between 1 following and unbounded following ))',
'                                 end as fcha_antrior,',
'                                 a.nmro_cta,',
'                                 b.cdgo_prdcdad_cta,',
'                                 b.nmro_cta nmro_cta_cnvnio',
'                            from v_gf_g_convenios_extracto a',
'                            join gf_g_convenios b on a.id_cnvnio = b.id_cnvnio',
'                           where a.id_cnvnio = :P172_ID_CNVNIO',
'                             and a.actvo = ''S'') a',
'                where a.fcha_vncmnto = (select min(m.fcha_vncmnto) ',
'                                          from v_gf_g_convenios_extracto m',
'                                         where m.id_cnvnio = :P172_ID_CNVNIO',
'                                           and m.actvo = ''S''',
'                                           and m.estdo_cta = ''ADEUDADA'')',
'              order by nmro_cta;',
'              ',
'              select sum(c.vlor_sldo_cptal) as vlor_sldo_cptal,',
'                     sum(c.vlor_intres)     as vlor_intres ',
'                into v_vlor_ctal_nva_vgncia,',
'                     v_vlor_intres_nva_vgncia',
'                from gf_g_convenios              a',
'                join v_gf_g_cartera_x_vigencia   c on a.id_sjto_impsto = c.id_sjto_impsto',
'                        and a.cdgo_cnvnio_estdo = ''APL''',
'                        and c.id_prdo = :P172_NVO_ID_PRDO          ',
'                      where a.id_cnvnio =  :P172_ID_CNVNIO;   ',
'      end if; ',
'          ',
'     APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''MODIFICACION_CONVENIO''); ',
'    ',
'    begin  ',
'       select pkg_gf_movimientos_financiero.fnc_cl_tea_a_ted (p_tsa_efctva_anual => tsa_prfrncial_ea , p_anio => v_anio, p_nmro_dcmles => 4) / 100',
'         into v_tsa_dria_cnvnio',
'         from gf_d_convenios_tipo ',
'        where id_cnvnio_tpo = (select id_cnvnio_tpo from gf_g_convenios m where id_cnvnio = :P172_ID_CNVNIO);     ',
'    exception ',
'        when no_data_found then',
'            v_tsa_dria_cnvnio := 0.001;',
'    end;    ',
'      insert into gti_aux (col1, col2) values (''v_tsa_dria_cnvnio: '', v_tsa_dria_cnvnio);commit;',
'',
'    begin',
'        select a.fcha_mxma_ctas',
'          into v_fcha_mxma_ctas',
'          from gf_d_convenios_tipo a ',
'          join gf_g_convenios b on a.id_cnvnio_tpo = b.id_cnvnio_tpo',
'         where b.id_cnvnio = :P172_ID_CNVNIO;',
'    exception',
'        when no_data_found then',
unistr('            raise_application_error(-20001, ''Error: no encontr\00F3 fecha m\00E1xima'');'),
'    end;',
'       ',
'     for c_crtra in (select sum(c.vlor_sldo_cptal) as vlor_sldo_cptal,',
'                            sum(c.vlor_intres)     as vlor_intres         ',
'                       from gf_g_convenios              a',
'                       join gf_g_convenios_cartera      b on a.id_cnvnio = b.id_cnvnio',
'                       join v_gf_g_cartera_x_vigencia   c on a.id_sjto_impsto = c.id_sjto_impsto',
'                        and a.cdgo_cnvnio_estdo = ''APL''',
'                        and b.vgncia = c.vgncia ',
'                        and b.id_prdo = c.id_prdo               ',
'                      where a.id_cnvnio =  :P172_ID_CNVNIO ) loop   ',
'                     ',
'                    v_vlor_ttal_cnvnio := v_vlor_ttal_cnvnio + (c_crtra.vlor_sldo_cptal + c_crtra.vlor_intres);',
'                    v_vlor_ttal_cptal := v_vlor_ttal_cptal + c_crtra.vlor_sldo_cptal;',
'                    v_vlor_ttal_intres := v_vlor_ttal_intres + c_crtra.vlor_intres;',
'                    ',
'                    insert into gti_aux (col1, col2) values (''For v_vlor_ttal_cnvnio: '', v_vlor_ttal_cnvnio);commit;  ',
'    end loop;',
'    ',
'    if :P172_CDGO_CNVNIO_MDFCCION_TPO = ''AVA'' and :P172_NVO_ID_PRDO is not null then',
'         v_vlor_ttal_cnvnio := v_vlor_ttal_cnvnio + (v_vlor_ctal_nva_vgncia + v_vlor_intres_nva_vgncia);',
'         v_vlor_ttal_cptal  := v_vlor_ttal_cptal + v_vlor_ctal_nva_vgncia;',
'         v_vlor_ttal_intres := v_vlor_ttal_intres + v_vlor_intres_nva_vgncia;  ',
'         ',
'         insert into gti_aux (col1, col2) values (''v_vlor_ctal_nva_vgncia: '', v_vlor_ctal_nva_vgncia);commit;',
'         insert into gti_aux (col1, col2) values (''v_vlor_intres_nva_vgncia: '', v_vlor_intres_nva_vgncia);commit;',
'    ',
'    end if;',
'    ',
'    insert into gti_aux (col1, col2) values (''v_vlor_ttal_cnvnio: '', v_vlor_ttal_cnvnio);commit;',
'    insert into gti_aux (col1, col2) values (''v_vlor_ttal_cptal: '', v_vlor_ttal_cptal);commit;',
'    insert into gti_aux (col1, col2) values (''v_vlor_ttal_intres: '', v_vlor_ttal_intres);commit;',
'    ',
'    while (v_nmro_cta < v_nmro_ctas_cnvnio ) loop',
'        v_count := v_count + 1 ;',
'         ',
'        v_nmro_cta := v_nmro_cta + 1; ',
'         insert into gti_aux (col1, col2) values (''v_nmro_cta: '', v_nmro_cta);commit;',
'         v_vlor_cta_cptal     := round(v_vlor_ttal_cptal / v_nmro_ctas_cnvnio,2) ;',
'         v_vlor_cta_intres    := round(v_vlor_ttal_intres / v_nmro_ctas_cnvnio,2);',
'         ',
'         insert into gti_aux (col1, col2) values ('' v_fcha_cta: '', to_char(v_fcha_cta));commit;     ',
'         ',
'		 if v_nmro_cta > 1  and v_count > 1  then ',
'         ',
'             insert into gti_aux (col1, col2) values ('' a v_fcha_cta: '', to_char(v_fcha_cta));commit; ',
'             insert into gti_aux (col1, col2) values ('' a P69_CDGO_PRDCDAD_CTA: '', v_cdgo_prdcdad_cta);commit; ',
'             if v_cdgo_prdcdad_cta = ''ANU'' then',
'                 v_fcha_cta := add_months(v_fcha_cta, 12);        ',
'             elsif v_cdgo_prdcdad_cta = ''SMT'' then',
'                 v_fcha_cta := add_months(v_fcha_cta, 6);         ',
'             elsif v_cdgo_prdcdad_cta = ''TRM'' then',
'                 v_fcha_cta := add_months(v_fcha_cta, 3);          ',
'             elsif v_cdgo_prdcdad_cta = ''CRM'' then',
'                 v_fcha_cta := add_months(v_fcha_cta, 4);          ',
'             elsif v_cdgo_prdcdad_cta = ''BIM'' then',
'                 v_fcha_cta := add_months(v_fcha_cta, 2);          ',
'             elsif v_cdgo_prdcdad_cta = ''MNS'' then',
'                 v_fcha_cta := add_months(v_fcha_cta, 1); ',
'             end if;',
'             insert into gti_aux (col1, col2) values ('' d v_fcha_cta: '', to_char(v_fcha_cta));commit;              ',
'         end if;',
'             ',
'             v_fcha_cta_hbil := pk_util_calendario.proximo_dia_habil(:F_CDGO_CLNTE, v_fcha_cta);',
'             insert into gti_aux (col1, col2) values (''v_fcha_cta_hbil: '', to_char(v_fcha_cta_hbil));commit; ',
'             ',
'             insert into gti_aux (col1, col2) values (''v_nmro_dia: '', v_nmro_dia);commit; ',
'             ',
'             insert into gti_aux (col1, col2) values (''v_nmro_cta: '', v_nmro_cta);commit; ',
'             insert into gti_aux (col1, col2) values (''v_fcha_slctud: '', to_char(v_fcha_slctud));commit; ',
'             ',
'             if v_nmro_cta = 1 then ',
'                v_nmro_dia     := trunc(v_fcha_cta_hbil) - trunc(v_fcha_slctud);',
'                v_sldo_cptal   := v_vlor_ttal_cptal;',
'                v_sldo_intres  := v_vlor_ttal_intres;',
'             elsif v_nmro_cta > 1 and v_count = 1  then',
'                v_nmro_dia     := trunc(v_fcha_cta_hbil) - trunc(v_fcha_slctud);',
'                v_sldo_cptal   := v_vlor_ttal_cptal;',
'                v_sldo_intres  := v_vlor_ttal_intres;',
'             else',
'                v_nmro_dia     := trunc(v_fcha_cta_hbil) - trunc(v_fcha_cta_antrior);                ',
'                v_sldo_cptal   := round(v_sldo_cptal - v_vlor_cta_cptal,3);  ',
'                v_sldo_intres  := round(v_sldo_intres - v_vlor_cta_intres,3);',
'                ',
'             insert into gti_aux (col1, col2) values (''v_nmro_dia: '', v_nmro_dia);commit; ',
'             insert into gti_aux (col1, col2) values (''v_sldo_cptal: '', v_sldo_cptal);commit; ',
'             insert into gti_aux (col1, col2) values (''v_sldo_intres: '', v_sldo_intres);commit; ',
'                 ',
'             end if;',
'             ',
'             insert into gti_aux (col1, col2) values (''v_tsa_dria_cnvnio: '', v_tsa_dria_cnvnio);commit; ',
'             insert into gti_aux (col1, col2) values (''to_number(v_nmro_dia): '', to_number(v_nmro_dia));commit; ',
'             insert into gti_aux (col1, col2) values (''v_sldo_cptal: '', v_sldo_cptal);commit;  ',
'             ',
'             v_vlor_fnccion := nvl(round(v_tsa_dria_cnvnio * to_number(v_nmro_dia) * v_sldo_cptal,2),0) ;',
'             ',
'             insert into gti_aux (col1, col2) values (''v_vlor_cta_cptal: '', v_vlor_cta_cptal);commit; ',
'             insert into gti_aux (col1, col2) values (''v_vlor_cta_intres: '', v_vlor_cta_intres);commit; ',
'             insert into gti_aux (col1, col2) values (''v_vlor_fnccion: '', v_vlor_fnccion);commit; ',
'             ',
'			 v_vlor_cta     := round(v_vlor_cta_cptal +  v_vlor_cta_intres + v_vlor_fnccion,2);',
'			 ',
'             insert into gti_aux (col1, col2) values (''v_vlor_cta: '', v_vlor_cta);commit; ',
'             ',
'             v_ttal_ctas    := v_ttal_ctas + v_vlor_cta;',
'             insert into gti_aux (col1, col2) values (''v_ttal_ctas: '', v_ttal_ctas);commit; ',
'             ',
'             ',
'             ',
'             if v_ttal_ctas < v_vlor_ttal_cnvnio and v_nmro_cta =  v_nmro_ctas_cnvnio then ',
'                 v_vlor_cta := v_vlor_ttal_cnvnio - v_ttal_ctas;',
'             end if;',
'',
'                 if v_fcha_cta_hbil is not null then ',
'                   --if v_fcha_cta_hbil <= v_fcha_mxma_ctas then',
'                        v_fcha_cta_antrior := v_fcha_cta_hbil;',
'                        insert into gti_aux (col1, col2) values ('' d v_fcha_cta: '', to_char(v_fcha_cta));commit;              ',
'                        APEX_COLLECTION.ADD_MEMBER( p_collection_name => ''MODIFICACION_CONVENIO'',',
'                                                 p_n001            => v_nmro_cta,',
'                                                 p_n002            => v_vlor_cta,',
'                                                 p_n003            => v_vlor_fnccion,',
'                                                 p_n004            => v_vlor_cta_cptal,',
'                                                 p_n005            => v_vlor_cta_intres,',
'                                                 p_d001            => v_fcha_cta_hbil);',
'                  /* else',
unistr('                        v_mnsje := ''N\00FAmero de Cuotas Excede la Fecha M\00E1xima ''|| v_fcha_mxma_ctas;   '),
'                        raise_application_error(-20001, v_mnsje);   ',
'                       ',
'                   end if;*/                    ',
'                 else',
'                    begin ',
unistr('                        v_mnsje := ''No existe parametrizaci\00F3n del calendario para la fecha '' || to_char(v_fcha_cta, ''DD/MM/YYYY'');'),
'                        :P172_RSPSTA := v_mnsje;',
'',
'                        if apex_collection.collection_exists(''MODIFICACION_CONVENIO'') then',
'                            APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''MODIFICACION_CONVENIO'');',
'                          ',
'                        end if;   ',
'                    exception ',
'                         when others then ',
'                             v_mnsje := SQLCODE || '' -  - '' ||  SQLERRM; ',
'                              insert into gti_aux (col1, col2) values (1, ''Mensaje de Error: '' || v_mnsje);commit;',
'',
'                    end;',
'',
'                 ',
'                 end if;                  ',
'',
'             ',
'         end loop;',
'     ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(109789701803595702)
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105195764771632610)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Modificaci\00F3n Acuerdo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_cdgo_rspsta  number;',
'v_id_cnvnio_mdfccion  number;',
'',
'begin',
'    pkg_gf_convenios.prc_rg_mdfccion_acuerdo_pago(p_cdgo_clnte                 => :F_CDGO_CLNTE,',
'                                                  p_id_cnvnio                  => :P172_ID_CNVNIO,',
'                                                  p_cdgo_cnvnio_mdfccion_tpo   => :P172_CDGO_CNVNIO_MDFCCION_TPO,',
'                                                  p_cdgo_mdfccion_nmro_cta_tpo => :P172_MDFCCION_NMRO_CTA_TPO,',
'                                                  p_nvo_nmro_cta               => :P172_NVO_NMRO_CTA,',
'                                                  p_fcha_sgte_cta              => :P172_FCHA_SGTE_CTA,',
'                                                  p_cdgo_prdcdad_cta           => :P172_CDGO_PRDCDAD_CTA,',
'                                                  p_id_usrio                   => :F_ID_USRIO,',
'                                                  p_id_instncia_fljo_hjo       => :P172_ID_INSTNCIA_FLJO,',
'                                                  p_id_prdo                    => :P172_NVO_ID_PRDO,',
'                                                  o_id_cnvnio_mdfccion         => :P172_ID_CNVNIO_MDFCCION,              ',
'                                                  o_cdgo_rspsta                => v_cdgo_rspsta,',
'                                                  o_mnsje_rspsta               => :P172_RSPSTA);',
'   ',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001,:P172_RSPSTA);',
'    end if;',
'     apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'end;                            ',
'                             '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(105351342150731080)
,p_process_success_message=>'&P172_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122634910469005024)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar Coleccion'
,p_process_sql_clob=>'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''MODIFICACION_CONVENIO'');'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P172_ID_CNVNIO_MDFCCION is null and :P172_CDGO_CNVNIO_MDFCCION_TPO is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'entreeeeeee a borrar coleccion 2'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117105410906711201)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar Coleccion'
,p_process_sql_clob=>'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''MODIFICACION_CONVENIO'');'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P172_ID_CNVNIO_MDFCCION is null and :P172_CDGO_CNVNIO_MDFCCION_TPO is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104566007939078601)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n Datos Solicitante y sujeto impuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ',
'        a.idntfccion,',
'        c.nmbre_impsto,',
'        d.nmbre_impsto_sbmpsto,',
'        c.drccion,',
'        a.idntfccion,',
'        a.nmbre_slctnte,',
'        a.ubccion,',
'        a.drccion_ntfccion,',
'        a.tlfno,',
'        a.cllar,',
'        a.email,',
'        c.id_sjto_impsto',
'  into ',
'       :P172_IDNTFCCION,',
'       :P172_NMBRE_IMPSTO,',
'       :P172_NMBRE_IMPSTO_SBMPSTO,',
'       :P172_DRCCION,',
'       :P172_NMRO_IDNTFCION,',
'       :P172_NMBRE_CMPLTO,',
'       :P172_UBCCION,',
'       :P172_DRCCION_NTFCCION,',
'       :P172_TLFNO,',
'       :P172_CLLAR,',
'       :P172_EMAIL,',
'       :P172_ID_SJTO_IMPSTO',
'  ',
' from v_pq_g_solicitantes      a',
' join v_pq_g_solicitudes       b on a.id_slctud = b.id_slctud',
' join v_si_i_sujetos_impuesto  c on b.id_impsto = c.id_impsto and b.idntfccion = c.idntfccion_sjto',
' join  df_i_impuestos_subimpuesto d on b.id_impsto = c.id_impsto and b.id_impsto_sbmpsto = d.id_impsto_sbmpsto ',
'where b.id_instncia_fljo_gnrdo = :P172_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(120284708388819802)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n datos de modificaci\00F3n registrada')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_cnvnio_mdfccion_tpo,',
'       id_cnvnio, ',
'       cdgo_mdfccion_nmro_cta_tpo,',
'       nvo_nmro_cta,',
'       fcha_sgte_cta,',
'       cdgo_prdcdad_cta,',
'       id_cnvnio_mdfccion',
'  into :P172_CDGO_CNVNIO_MDFCCION_TPO,',
'       :P172_ID_CNVNIO,',
'       :P172_MDFCCION_NMRO_CTA_TPO,',
'       :P172_NVO_NMRO_CTA,',
'       :P172_FCHA_SGTE_CTA,',
'       :P172_CDGO_PRDCDAD_CTA,',
'       :P172_ID_CNVNIO_MDFCCION',
' from  gf_g_convenios_modificacion ',
' where id_instncia_fljo_hjo = :P172_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists(select id_cnvnio_mdfccion',
'         from gf_g_convenios_modificacion',
'        where id_instncia_fljo_hjo = :P172_ID_INSTNCIA_FLJO)'))
,p_process_when_type=>'SQL_EXPRESSION'
);
end;
/
