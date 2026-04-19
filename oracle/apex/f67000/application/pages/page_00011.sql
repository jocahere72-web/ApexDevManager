prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>'Envio Programado'
,p_step_title=>'Envio Programado'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#boton-custom{',
'margin-top: 26px;',
'}',
''))
,p_step_template=>wwv_flow_api.id(71592158849187941)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191211162733'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5138291859976540)
,p_plug_name=>'Pantalla Basada en MA_G_ENVIOS_PROGRAMADO'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5344761102796732)
,p_plug_name=>'Destinatarios'
,p_parent_plug_id=>wwv_flow_api.id(5138291859976540)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71613067978187954)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P11_ID_ENVIO_PRGRMDO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5344805836796733)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(5138291859976540)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71613067978187954)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P11_ID_ENVIO_PRGRMDO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5211816057462421)
,p_plug_name=>'Tabs'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(71630979842187961)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P11_ID_ENVIO_PRGRMDO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5213892441462441)
,p_plug_name=>'Consultas'
,p_parent_plug_id=>wwv_flow_api.id(5211816057462421)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71623038711187958)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_envio_prgrmdo_cnslta,',
'       id_envio_prgrmdo,',
'       dscrpcion,',
'       id_cnslta_mstro,',
'       cnslta,',
'       case',
'           when id_cnslta_mstro is not null then ''Constructor SQL''',
'           when id_cnslta_mstro is null then ''Consulta SQL''',
'       end tpo_cnslta,',
'       case actvo',
'           when ''S'' then ''Si''',
'           when ''N'' then ''No''',
'       end actvo',
'from ma_g_envios_prgrmdo_cnslta',
'where id_envio_prgrmdo = :P11_ID_ENVIO_PRGRMDO'))
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
 p_id=>wwv_flow_api.id(13044092981893305)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_ID_ENVIO_PRGRMDO_CNSLTA:#ID_ENVIO_PRGRMDO_CNSLTA#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></center>'
,p_owner=>'JCUAO'
,p_internal_uid=>13044092981893305
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13044175274893306)
,p_db_column_name=>'ID_ENVIO_PRGRMDO_CNSLTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Envio Prgrmdo Cnslta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13044221475893307)
,p_db_column_name=>'ID_ENVIO_PRGRMDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Envio Prgrmdo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13044331606893308)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13044474477893309)
,p_db_column_name=>'ID_CNSLTA_MSTRO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Cnslta Mstro'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13044537892893310)
,p_db_column_name=>'CNSLTA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Cnslta'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13047972095893344)
,p_db_column_name=>'TPO_CNSLTA'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Tipo de Consulta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13044645517893311)
,p_db_column_name=>'ACTVO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13056345442936696)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'130564'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION:TPO_CNSLTA:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5643947387637203)
,p_plug_name=>'Medios de Envio'
,p_parent_plug_id=>wwv_flow_api.id(5211816057462421)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71623038711187958)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_envio_prgrmdo_mdio,',
'        a.id_envio_prgrmdo,',
'        a.cdgo_envio_mdio,',
'        b.dscrpcion dscrpcion_mdio,',
'        a.asnto,',
'        a.txto_mnsje,',
'        a.actvo,',
'        case a.actvo',
'            when ''S'' then ''Si''',
'            when ''N'' then ''No''',
'        end dscrpcion_actvo',
'from ma_g_envios_programado_mdio a',
'inner join ma_d_envios_medio b on a.cdgo_envio_mdio = b.cdgo_envio_mdio',
'where a.id_envio_prgrmdo = :P11_ID_ENVIO_PRGRMDO'))
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
 p_id=>wwv_flow_api.id(5644154161637205)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13:P13_ID_ENVIO_PRGRMDO_MDIO:#ID_ENVIO_PRGRMDO_MDIO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JCUAO'
,p_internal_uid=>5644154161637205
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5644231649637206)
,p_db_column_name=>'ID_ENVIO_PRGRMDO_MDIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Envio Prgrmdo Mdio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5644396563637207)
,p_db_column_name=>'ID_ENVIO_PRGRMDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Envio Prgrmdo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5644405584637208)
,p_db_column_name=>'CDGO_ENVIO_MDIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Cdgo Envio Mdio'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5644505731637209)
,p_db_column_name=>'DSCRPCION_MDIO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Medio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5644620044637210)
,p_db_column_name=>'ASNTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Asunto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5644715489637211)
,p_db_column_name=>'TXTO_MNSJE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Txto Mnsje'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5644848770637212)
,p_db_column_name=>'ACTVO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5646949168637233)
,p_db_column_name=>'DSCRPCION_ACTVO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5656142156728713)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'56562'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ENVIO_PRGRMDO_MDIO:ID_ENVIO_PRGRMDO:CDGO_ENVIO_MDIO:DSCRPCION_MDIO:ASNTO:TXTO_MNSJE:ACTVO:DSCRPCION_ACTVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5648344787637247)
,p_plug_name=>'Destinatarios'
,p_parent_plug_id=>wwv_flow_api.id(5211816057462421)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71623038711187958)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_envio_prgrmdo_dstntr,',
'        id_envio_prgrmdo,',
'        id_usrio,',
'        nmbre,',
'        nmro_cllar,',
'        email,',
'        actvo',
'from ma_g_envios_prgrmdo_dstntrs',
'where id_envio_prgrmdo = :P11_ID_ENVIO_PRGRMDO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P11_ID_ENVIO_PRGRMDO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5648543563637249)
,p_name=>'ID_ENVIO_PRGRMDO_DSTNTR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENVIO_PRGRMDO_DSTNTR'
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
,p_default_type=>'SEQUENCE'
,p_default_expression=>'sq_ma_g_envios_prgrmdo_dstntrs'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5648686246637250)
,p_name=>'ID_ENVIO_PRGRMDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENVIO_PRGRMDO'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P11_ID_ENVIO_PRGRMDO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5803107850215001)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(5820474879316533)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(5803276686215002)
,p_name=>'NMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(5803351436215003)
,p_name=>'NMRO_CLLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CLLAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'# Celular'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_api.id(5803403636215004)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(5803500206215005)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
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
 p_id=>wwv_flow_api.id(5803657374215006)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5803763468215007)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(5648414645637248)
,p_internal_uid=>5648414645637248
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(5809081373216841)
,p_interactive_grid_id=>wwv_flow_api.id(5648414645637248)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(5809175348216841)
,p_report_id=>wwv_flow_api.id(5809081373216841)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5809605812216844)
,p_view_id=>wwv_flow_api.id(5809175348216841)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(5648543563637249)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5810173897216846)
,p_view_id=>wwv_flow_api.id(5809175348216841)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(5648686246637250)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5810601397216848)
,p_view_id=>wwv_flow_api.id(5809175348216841)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(5803107850215001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5811151047216849)
,p_view_id=>wwv_flow_api.id(5809175348216841)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(5803276686215002)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5811687576216850)
,p_view_id=>wwv_flow_api.id(5809175348216841)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(5803351436215003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5812135690216852)
,p_view_id=>wwv_flow_api.id(5809175348216841)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(5803403636215004)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5812651258216853)
,p_view_id=>wwv_flow_api.id(5809175348216841)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(5803500206215005)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5814015629223017)
,p_view_id=>wwv_flow_api.id(5809175348216841)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(5803657374215006)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5344988458796734)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Opciones <i class="fa fa-gear" aria-hidden="true"></i></center></b></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5433984517206213)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite gestionar un envio programado.',
'    <br/>',
'    <br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5345068994796735)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5344988458796734)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5138795384976540)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5344988458796734)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P11_ID_ENVIO_PRGRMDO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5138645613976540)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5344988458796734)
,p_button_name=>'BTN_INSERTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P11_ID_ENVIO_PRGRMDO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5138858020976540)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(5344988458796734)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Desea eliminar el registro seleccionado?'',''BTN_ELIMINAR'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P11_ID_ENVIO_PRGRMDO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5644952780637213)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5643947387637203)
,p_button_name=>'BTN_NUEVO_MEDIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Nuevo Medio de Envio'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13:P13_ID_ENVIO_PRGRMDO:&P11_ID_ENVIO_PRGRMDO.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13044729712893312)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5213892441462441)
,p_button_name=>'BTN_NUEVA_CONSULTA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Nueva Consulta'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_ID_ENVIO_PRGRMDO:&P11_ID_ENVIO_PRGRMDO.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5989643952474601)
,p_branch_name=>'Go To Page 10'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'BTN_ELIMINAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5140924192976568)
,p_name=>'P11_ID_ENVIO_PRGRMDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_ENVIO_PRGRMDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5141283559976575)
,p_name=>'P11_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5141663483976575)
,p_name=>'P11_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>500
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5142098056976576)
,p_name=>'P11_EJCCION_TPO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_item_default=>'EVN'
,p_prompt=>unistr('Tipo de Ejecuci\00F3n')
,p_source=>'EJCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Una vez;UNV,Repeticion;RPT,Evento;EVN'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5142492820976576)
,p_name=>'P11_FCHA_INCIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha de Inicio'
,p_format_mask=>'dd/MM/yyyy hh:mi:ss am'
,p_source=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_02=>'+0d'
,p_attribute_04=>'focus'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5143298312976584)
,p_name=>'P11_FCHA_FIN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha de Finalizaci\00F3n')
,p_format_mask=>'dd/MM/yyyy hh:mi:ss am'
,p_source=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_02=>'&P11_FCHA_INCIO.'
,p_attribute_04=>'focus'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5144095866976585)
,p_name=>'P11_INTRVLO_RPTCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_item_default=>'DI'
,p_prompt=>unistr('Intervalo de Repetici\00F3n')
,p_source=>'INTRVLO_RPTCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC2:A\00F1o(s);AN,Mes(es);MN,Semana(s);SM,Dia(s);DI,Hora(s);HR,Minuto(s);MI')
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675659070187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'6'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5144457097976585)
,p_name=>'P11_VLOR_INTRVLO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor Intervalo'
,p_source=>'VLOR_INTRVLO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5145201420976586)
,p_name=>'P11_ORGEN_TPO_DSTNTRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5344761102796732)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Origen Destinatarios'
,p_source=>'ORGEN_TPO_DSTNTRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Consulta;SQL,Lista;LST,Definido en Consulta Principal;DCP'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5146024039976586)
,p_name=>'P11_ORGEN_DSTNTRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5344761102796732)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Funcion'
,p_source=>'ORGEN_DSTNTRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_MA_FUNCIONES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_name || '' version '' || overload d,  ',
'	   object_name r',
'from user_arguments ',
'where package_name = ''PKG_MA_FUNCIONES''',
'and argument_name is not null',
'group by object_name,overload',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5146474603976586)
,p_name=>'P11_ORGEN_TPO_ADJUNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5344805836796733)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Origen Adjuntos'
,p_source=>'ORGEN_TPO_ADJUNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Consulta;SQL'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675659070187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5147248947976587)
,p_name=>'P11_ORGEN_ADJUNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5344805836796733)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Funci\00F3n')
,p_source=>'ORGEN_ADJUNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_MA_FUNCIONES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_name || '' version '' || overload d,  ',
'	   object_name r',
'from user_arguments ',
'where package_name = ''PKG_MA_FUNCIONES''',
'and argument_name is not null',
'group by object_name,overload',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>60
,p_cMaxlength=>500
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('La consulta a seleccionar debe tener \00FAnicamente las siguientes columnas o alias (file_name, file_mimetype, file_blob)')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5147607151976587)
,p_name=>'P11_ID_USRIO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_ID_USRIO'
,p_item_default_type=>'ITEM'
,p_source=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5989848499474603)
,p_name=>'P11_CNFRMCION_ENVIO'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('Confirmaci\00F3n de Envi\00F3')
,p_source=>'CNFRMCION_ENVIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P11_ID_ENVIO_PRGRMDO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9199328838752710)
,p_name=>'P11_ID_ENVIO_PRGRMD_CNSLTA_PRNCPAL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta principal'
,p_source=>'ID_ENVIO_PRGRMD_CNSLTA_PRNCPAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ENVIOS_CONSULTAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, id_envio_prgrmdo_cnslta r',
'from ma_g_envios_prgrmdo_cnslta',
'where id_envio_prgrmdo = :P11_ID_ENVIO_PRGRMDO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P11_ID_ENVIO_PRGRMDO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9199449571752711)
,p_name=>'P11_ID_ENVIO_PRGRMD_CNSLTA_DSTNTR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5344761102796732)
,p_prompt=>'Consulta'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ENVIOS_CONSULTAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, id_envio_prgrmdo_cnslta r',
'from ma_g_envios_prgrmdo_cnslta',
'where id_envio_prgrmdo = :P11_ID_ENVIO_PRGRMDO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9199553856752712)
,p_name=>'P11_ID_ENVIO_PRGRMDO_CNSLTA_ADJNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5344805836796733)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta'
,p_source=>'ID_ENVIO_PRGRMDO_CNSLTA_ADJNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ENVIOS_CONSULTAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, id_envio_prgrmdo_cnslta r',
'from ma_g_envios_prgrmdo_cnslta',
'where id_envio_prgrmdo = :P11_ID_ENVIO_PRGRMDO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('La consulta a seleccionar debe tener \00FAnicamente las siguientes columnas o alias (file_name, file_mimetype, file_blob)')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16411305133495806)
,p_name=>'P11_IDNTFCDOR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(5138291859976540)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Identificador'
,p_source=>'IDNTFCDOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5804401241215014)
,p_validation_name=>'Valida Fecha de Inicio'
,p_validation_sequence=>20
,p_validation=>'P11_FCHA_INCIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Campo #LABEL# vacio, por favor verifique!'
,p_validation_condition=>'(:P11_EJCCION_TPO = ''UNV'' or :P11_EJCCION_TPO = ''RPT'')'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(5142492820976576)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5804588360215015)
,p_validation_name=>'Valida Fecha Fin'
,p_validation_sequence=>30
,p_validation=>'P11_FCHA_FIN'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Campo #LABEL# vacio, por favor verifique!'
,p_validation_condition=>'P11_EJCCION_TPO'
,p_validation_condition2=>'RPT'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(5143298312976584)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5804676780215016)
,p_validation_name=>'Valida Valor de Intervalo'
,p_validation_sequence=>40
,p_validation=>'P11_VLOR_INTRVLO'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'Campo #LABEL# vacio, por favor verifique!'
,p_validation_condition=>'P11_EJCCION_TPO'
,p_validation_condition2=>'RPT'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(5144457097976585)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5804827106215018)
,p_validation_name=>'Valida Origen Adjunto'
,p_validation_sequence=>60
,p_validation=>'P11_ORGEN_ADJUNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Campo #LABEL# vacio, por favor verifique!'
,p_validation_condition=>'P11_ORGEN_TPO_ADJUNTO'
,p_validation_condition2=>'FNC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(5147248947976587)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13043660606893301)
,p_validation_name=>'Valida SQL adjunto'
,p_validation_sequence=>70
,p_validation=>'P11_ID_ENVIO_PRGRMDO_CNSLTA_ADJNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Campo #LABEL# vacio, por favor verifique!'
,p_validation_condition=>'P11_ORGEN_TPO_ADJUNTO'
,p_validation_condition2=>'SQL'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(9199553856752712)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5804982027215019)
,p_validation_name=>'Valida origen destinatarios'
,p_validation_sequence=>80
,p_validation=>'P11_ORGEN_DSTNTRIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Campo #LABEL# vacio, por favor verifique!'
,p_validation_condition=>'P11_ORGEN_TPO_DSTNTRIO'
,p_validation_condition2=>'FNC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(5146024039976586)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13043798451893302)
,p_validation_name=>'Valida consulta destinatarios'
,p_validation_sequence=>90
,p_validation=>'P11_ID_ENVIO_PRGRMD_CNSLTA_DSTNTR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Campo #LABEL# vacio, por favor verifique!'
,p_validation_condition=>'P11_ID_ENVIO_PRGRMD_CNSLTA_DSTNTR'
,p_validation_condition2=>'SQL'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(9199449571752711)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13486506539353012)
,p_validation_name=>unistr('Valida envi\00F3 programado al confirmar envio')
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje varchar2(32000);',
'begin',
'    v_mnsje := pkg_ma_envios.fnc_vl_valida_confirmacion_envio_programado(p_id_envio_prgrmdo => :P11_ID_ENVIO_PRGRMDO);',
'    if(v_mnsje is not null)then',
'        return v_mnsje;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P11_CNFRMCION_ENVIO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(5138795384976540)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(16411990647495812)
,p_tabular_form_region_id=>wwv_flow_api.id(5648344787637247)
,p_validation_name=>'Valida Numero de Celular'
,p_validation_sequence=>110
,p_validation=>'REGEXP_LIKE (:NMRO_CLLAR, ''^3[0-9]{9}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El numero de celular no es valido por favor verifique!'
,p_associated_column=>'NMRO_CLLAR'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(16412005606495813)
,p_tabular_form_region_id=>wwv_flow_api.id(5648344787637247)
,p_validation_name=>'Valida Email'
,p_validation_sequence=>120
,p_validation=>'regexp_like (:EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Direcci\00F3n de correo invalida por favor verifique.')
,p_associated_column=>'EMAIL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29112732685792308)
,p_validation_name=>'Valida Fecha Inicial Menor Fecha Final'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(:P11_FCHA_INCIO > :P11_FCHA_FIN)then',
'    return ''La fecha final no puede ser inferior a la fecha inicial, por favor verifique.'';',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>':P11_EJCCION_TPO = ''RPT'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(5143298312976584)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5341679320796701)
,p_name=>'Al cambiar tipo de ejecucion = INM '
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_EJCCION_TPO'
,p_condition_element=>'P11_EJCCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'INM'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5341856025796703)
,p_event_id=>wwv_flow_api.id(5341679320796701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FCHA_INCIO,P11_FCHA_FIN,P11_INTRVLO_RPTCION,P11_VLOR_INTRVLO,P11_IDNTFCDOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5341739702796702)
,p_event_id=>wwv_flow_api.id(5341679320796701)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FCHA_INCIO,P11_FCHA_FIN,P11_INTRVLO_RPTCION,P11_VLOR_INTRVLO,P11_IDNTFCDOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5341913146796704)
,p_name=>'Al cambiar tipo de ejecucion = UNV'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_EJCCION_TPO'
,p_condition_element=>'P11_EJCCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'UNV'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5342171402796706)
,p_event_id=>wwv_flow_api.id(5341913146796704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FCHA_FIN,P11_INTRVLO_RPTCION,P11_VLOR_INTRVLO,P11_IDNTFCDOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5342049355796705)
,p_event_id=>wwv_flow_api.id(5341913146796704)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FCHA_FIN,P11_INTRVLO_RPTCION,P11_VLOR_INTRVLO,P11_IDNTFCDOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5343036077796715)
,p_event_id=>wwv_flow_api.id(5341913146796704)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FCHA_INCIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5342216304796707)
,p_name=>'Al cambiar tipo de ejecucion = RPT'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_EJCCION_TPO'
,p_condition_element=>'P11_EJCCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'RPT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5342965785796714)
,p_event_id=>wwv_flow_api.id(5342216304796707)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FCHA_INCIO,P11_FCHA_FIN,P11_INTRVLO_RPTCION,P11_VLOR_INTRVLO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16411572293495808)
,p_event_id=>wwv_flow_api.id(5342216304796707)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_IDNTFCDOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16411474646495807)
,p_event_id=>wwv_flow_api.id(5342216304796707)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_IDNTFCDOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5803962771215009)
,p_name=>'Al Seleccionar usuario'
,p_event_sequence=>160
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(5648344787637247)
,p_triggering_element=>'ID_USRIO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'ID_USRIO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5804112429215011)
,p_event_id=>wwv_flow_api.id(5803962771215009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'NMBRE,NMRO_CLLAR,EMAIL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5804288893215012)
,p_event_id=>wwv_flow_api.id(5803962771215009)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'NMBRE,NMRO_CLLAR,EMAIL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29113464767792315)
,p_event_id=>wwv_flow_api.id(5803962771215009)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select nmbre_trcro, tlfno, email',
'    into :NMBRE, :NMRO_CLLAR, :EMAIL',
'    from v_sg_g_usuarios where id_usrio = :ID_USRIO;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_attribute_02=>'ID_USRIO'
,p_attribute_03=>'NMBRE,NMRO_CLLAR,EMAIL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5804030570215010)
,p_event_id=>wwv_flow_api.id(5803962771215009)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'NMBRE,NMRO_CLLAR,EMAIL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9199603150752713)
,p_name=>'Al cambiar tipo de origen destinatarios  = FNC'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_ORGEN_TPO_DSTNTRIO'
,p_condition_element=>'P11_ORGEN_TPO_DSTNTRIO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'FNC'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9200254085752719)
,p_event_id=>wwv_flow_api.id(9199603150752713)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ORGEN_DSTNTRIO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9200138681752718)
,p_event_id=>wwv_flow_api.id(9199603150752713)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ORGEN_DSTNTRIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9200039055752717)
,p_event_id=>wwv_flow_api.id(9199603150752713)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ORGEN_DSTNTRIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9202359187752740)
,p_event_id=>wwv_flow_api.id(9199603150752713)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ORGEN_DSTNTRIO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9200340877752720)
,p_name=>'Al cambiar tipo de origen destinatarios  = SQL'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_ORGEN_TPO_DSTNTRIO'
,p_condition_element=>'P11_ORGEN_TPO_DSTNTRIO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SQL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9199717803752714)
,p_event_id=>wwv_flow_api.id(9200340877752720)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_ENVIO_PRGRMD_CNSLTA_DSTNTR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9199852362752715)
,p_event_id=>wwv_flow_api.id(9200340877752720)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_ENVIO_PRGRMD_CNSLTA_DSTNTR,P11_ORGEN_DSTNTRIO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9200548618752722)
,p_event_id=>wwv_flow_api.id(9200340877752720)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_ENVIO_PRGRMD_CNSLTA_DSTNTR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9200684750752723)
,p_event_id=>wwv_flow_api.id(9200340877752720)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_ENVIO_PRGRMD_CNSLTA_DSTNTR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9202111200752738)
,p_name=>'Al cambiar tipo de origen adjuntos = FNC'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_ORGEN_TPO_ADJUNTO'
,p_condition_element=>'P11_ORGEN_TPO_ADJUNTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'FNC'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9202419173752741)
,p_event_id=>wwv_flow_api.id(9202111200752738)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ORGEN_ADJUNTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9202845923752745)
,p_event_id=>wwv_flow_api.id(9202111200752738)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ORGEN_ADJUNTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9202294578752739)
,p_event_id=>wwv_flow_api.id(9202111200752738)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ORGEN_ADJUNTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9202794576752744)
,p_event_id=>wwv_flow_api.id(9202111200752738)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ORGEN_ADJUNTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9202918254752746)
,p_name=>'Al cambiar tipo de origen adjuntos = SQL'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_ORGEN_TPO_ADJUNTO'
,p_condition_element=>'P11_ORGEN_TPO_ADJUNTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SQL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9203178809752748)
,p_event_id=>wwv_flow_api.id(9202918254752746)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_ENVIO_PRGRMDO_CNSLTA_ADJNTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9203371616752750)
,p_event_id=>wwv_flow_api.id(9202918254752746)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_ENVIO_PRGRMDO_CNSLTA_ADJNTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9203074400752747)
,p_event_id=>wwv_flow_api.id(9202918254752746)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_ENVIO_PRGRMDO_CNSLTA_ADJNTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9203203283752749)
,p_event_id=>wwv_flow_api.id(9202918254752746)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_ENVIO_PRGRMDO_CNSLTA_ADJNTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16410833357495801)
,p_name=>'Al cambiar tipo de ejecucion = EVN'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_EJCCION_TPO'
,p_condition_element=>'P11_EJCCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'EVN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16410985163495802)
,p_event_id=>wwv_flow_api.id(16410833357495801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FCHA_INCIO,P11_FCHA_FIN,P11_INTRVLO_RPTCION,P11_VLOR_INTRVLO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16411109032495804)
,p_event_id=>wwv_flow_api.id(16410833357495801)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FCHA_INCIO,P11_FCHA_FIN,P11_INTRVLO_RPTCION,P11_VLOR_INTRVLO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16411228416495805)
,p_event_id=>wwv_flow_api.id(16410833357495801)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_IDNTFCDOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5149629078976589)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from MA_G_ENVIOS_PROGRAMADO'
,p_attribute_02=>'MA_G_ENVIOS_PROGRAMADO'
,p_attribute_03=>'P11_ID_ENVIO_PRGRMDO'
,p_attribute_04=>'ID_ENVIO_PRGRMDO'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5211781095462420)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener Consecutivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P11_ID_ENVIO_PRGRMDO := sq_ma_g_envios_programado.nextval;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5138645613976540)
,p_process_when=>'P11_ID_ENVIO_PRGRMDO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5150089537976589)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of MA_G_ENVIOS_PROGRAMADO'
,p_attribute_02=>'MA_G_ENVIOS_PROGRAMADO'
,p_attribute_03=>'P11_ID_ENVIO_PRGRMDO'
,p_attribute_04=>'ID_ENVIO_PRGRMDO'
,p_attribute_09=>'P11_ID_ENVIO_PRGRMDO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29113327742792314)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(5648344787637247)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Destinatarios - CRUD'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if(:ID_USRIO is not null)then',
'        select nmbre_trcro, tlfno, email',
'        into :NMBRE, :NMRO_CLLAR, :EMAIL',
'        from v_sg_g_usuarios where id_usrio = :ID_USRIO;',
'    end if;',
'    case :APEX$ROW_STATUS',
'    when ''C'' then',
'        insert into ma_g_envios_prgrmdo_dstntrs(',
'            id_envio_prgrmdo,',
'            id_usrio,',
'            nmbre,',
'            nmro_cllar,',
'            email,',
'            actvo',
'        )values(',
'            :P11_ID_ENVIO_PRGRMDO,',
'            :ID_USRIO,',
'            :NMBRE,',
'            :NMRO_CLLAR,',
'            :EMAIL,',
'            :ACTVO',
'        )returning id_envio_prgrmdo_dstntr into :ID_ENVIO_PRGRMDO_DSTNTR;',
'    when ''U'' then',
'        update ma_g_envios_prgrmdo_dstntrs',
'        set id_usrio = :ID_USRIO,',
'            nmbre = :NMBRE,',
'            nmro_cllar = :NMRO_CLLAR,',
'            email = :EMAIL,',
'            actvo = :ACTVO',
'        where id_envio_prgrmdo_dstntr = :ID_ENVIO_PRGRMDO_DSTNTR;',
'    when ''D'' then',
'        delete from ma_g_envios_prgrmdo_dstntrs',
'        where id_envio_prgrmdo_dstntr = :ID_ENVIO_PRGRMDO_DSTNTR;',
'    end case;',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
