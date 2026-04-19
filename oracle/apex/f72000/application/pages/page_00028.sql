prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('Aplicaci\00F3n Resoluci\00F3n Aclaratoria')
,p_step_title=>unistr('Aplicaci\00F3n Resoluci\00F3n Aclaratoria')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20220118112529'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(234753159181270086)
,p_plug_name=>unistr('Resoluci\00F3n Aclaratoria')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(445606703873917831)
,p_plug_name=>'Acciones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_rcrso_accion, ',
'        a.id_rcrso_tpo_accion, ',
'        a.dscrpcion, ',
'        a.id_fljo, ',
'        a.dscrpcion_fljo,',
'        a.id_instncia_fljo_hjo_gnrdo,',
'        a.fcha_incio,',
'        a.fcha_fin_plnda,',
'        a.fcha_fin_optma,',
'        a.estdo_instncia,',
'        case a.indcdor_extso when ''S'' then ''Si''',
'                           when ''N'' then ''No''',
'        end extso_dscrpcion,',
'        a.indcdor_extso,',
'        a.id_instncia_fljo_indc,',
'        case when a.id_instncia_fljo_indc is not null then',
'        --case when b.ID_INSTNCIA_FLJO is not null then',
'            ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''||b.dscrpcion_fljo||''   <span class="fa fa-eye"></span>',
'                </button>',
'            </center>''',
'        end BTN_IR_INSTANCIA    ',
'from v_gj_g_recursos_accion a',
'left join v_wf_g_instancias_flujo b on a.id_instncia_fljo_indc = b.id_instncia_fljo',
'where a.cdgo_clnte              = :F_CDGO_CLNTE ',
'-- and     a.id_instncia_fljo_hjo    = :P28_ID_INSTNCIA_FLJO_PDRE ',
' and     a.id_instncia_fljo_hjo    = :P28_ID_INSTNCIA_FLJO_HJO ',
' and     a.id_rcrso_accion_antrior is not null'))
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
,p_plug_header=>'<h4>Acciones</h4>'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(234750657025056459)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>234750657025056459
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117681411089481969)
,p_db_column_name=>'ID_RCRSO_ACCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Rcrso Accion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117681874905481970)
,p_db_column_name=>'ID_RCRSO_TPO_ACCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Rcrso Tpo Accion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117682245267481970)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Acci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117682663823481971)
,p_db_column_name=>'ID_FLJO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Fljo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117683034885481971)
,p_db_column_name=>'DSCRPCION_FLJO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Flujo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117683435984481971)
,p_db_column_name=>'ID_INSTNCIA_FLJO_HJO_GNRDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Flujo Generado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117683850524481971)
,p_db_column_name=>'FCHA_INCIO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Incio'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117684248064481971)
,p_db_column_name=>'FCHA_FIN_PLNDA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Fecha Fin Planeada'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117684669938481972)
,p_db_column_name=>'FCHA_FIN_OPTMA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha Fin Optima'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117685006443481972)
,p_db_column_name=>'ESTDO_INSTNCIA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117685467262481972)
,p_db_column_name=>'EXTSO_DSCRPCION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Exitoso?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117685808107481972)
,p_db_column_name=>'INDCDOR_EXTSO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Indcdor Extso'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117686690841481979)
,p_db_column_name=>'ID_INSTNCIA_FLJO_INDC'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Id Instncia Fljo Indc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117686204223481973)
,p_db_column_name=>'BTN_IR_INSTANCIA'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>unistr('Acci\00F3n')
,p_column_link=>'f?p=&APP_ID.:13:&SESSION.:IRFLUJO:&DEBUG.:RP:P13_ID_INSTNCIA_FLJO_INDC:#ID_INSTNCIA_FLJO_INDC#'
,p_column_linktext=>'#BTN_IR_INSTANCIA#'
,p_column_link_attr=>'onclick="imipiarLink();"'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(234771471845081524)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1176870'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RCRSO_ACCION:ID_RCRSO_TPO_ACCION:DSCRPCION:ID_FLJO:DSCRPCION_FLJO:ID_INSTNCIA_FLJO_HJO_GNRDO:FCHA_INCIO:FCHA_FIN_PLNDA:FCHA_FIN_OPTMA:ESTDO_INSTNCIA:EXTSO_DSCRPCION:INDCDOR_EXTSO:BTN_IR_INSTANCIA:ID_INSTNCIA_FLJO_INDC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(883143614576938963)
,p_plug_name=>'Acto Seleccionado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1003648285265334100)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
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
 p_id=>wwv_flow_api.id(1038502610883461691)
,p_plug_name=>'Solicitud'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(72932069932094503)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71918047722655903)
,p_plug_name=>unistr('Etapas Resoluci\00F3n Aclaratoria')
,p_parent_plug_id=>wwv_flow_api.id(1038502610883461691)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.id_rcrso',
'           ,b.id_fljo_trea',
'           ,b.nmbre_trea',
'           ,a.fcha_incio fcha',
'           ,a.fcha_fin_real fcha_fin',
'           ,case',
'               when a.id_estdo_trnscion in (1, 2) then',
'                   ''Si''',
'               when a.id_estdo_trnscion in (3, 4) then',
'                   ''No''',
'               else',
'                   ''Invalido''',
'           end actvo',
'from        wf_g_instancias_transicion      a',
'inner join  v_wf_d_flujos_tarea             b   on  b.id_fljo_trea          =   a.id_fljo_trea_orgen',
'left  join  gj_g_recursos                   c   on  c.id_instncia_fljo_hjo  =   :P28_ID_INSTNCIA_FLJO_PDRE',
'where       b.cdgo_clnte            =       :F_CDGO_CLNTE',
'and         a.id_instncia_fljo      =       :F_ID_INSTNCIA_FLJO',
'order by    a.id_instncia_trnscion desc;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71918228127655905)
,p_name=>'ID_RCRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71918385806655906)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71918492700655907)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(71918512053655908)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(71918649517655909)
,p_name=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FIN'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(71918735507655910)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(71918851652655911)
,p_name=>'BTN_OBSRVCNES'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_ID_FLJO_TREA,P17_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71918956454655912)
,p_name=>'BTN_DCMNTOS_GNRDOS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documentos Generados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:P19_ID_FLJO_TREA,P19_ID_RCRSO:&ID_FLJO_TREA.,&P28_ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(71918159307655904)
,p_internal_uid=>71918159307655904
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
 p_id=>wwv_flow_api.id(71927650680689245)
,p_interactive_grid_id=>wwv_flow_api.id(71918159307655904)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(71927776094689245)
,p_report_id=>wwv_flow_api.id(71927650680689245)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71928647690689247)
,p_view_id=>wwv_flow_api.id(71927776094689245)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(71918228127655905)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71929133241689249)
,p_view_id=>wwv_flow_api.id(71927776094689245)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(71918385806655906)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71929620279689251)
,p_view_id=>wwv_flow_api.id(71927776094689245)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(71918492700655907)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71930195573689253)
,p_view_id=>wwv_flow_api.id(71927776094689245)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(71918512053655908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71930657492689254)
,p_view_id=>wwv_flow_api.id(71927776094689245)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(71918649517655909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71931101692689256)
,p_view_id=>wwv_flow_api.id(71927776094689245)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(71918735507655910)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71931612807689258)
,p_view_id=>wwv_flow_api.id(71927776094689245)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(71918851652655911)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71932183981689260)
,p_view_id=>wwv_flow_api.id(71927776094689245)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(71918956454655912)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71919092268655913)
,p_plug_name=>'Observaciones del Recurso'
,p_parent_plug_id=>wwv_flow_api.id(1038502610883461691)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.obsrvcion,c.nmbre_trea, b.nmbre_trcro,a.fcha ,a.id_rcrso_dtlle',
'from gj_g_recursos_detalle a',
'join v_sg_g_usuarios b  on  a.id_usrio = b.id_usrio',
'join v_wf_d_flujos_tarea c on a.id_fljo_trea = c.id_fljo_trea',
'where a.id_rcrso = :P28_ID_RCRSO',
'order by a.fcha desc;'))
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
 p_id=>wwv_flow_api.id(71920035389655923)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>71920035389655923
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71920118655655924)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71920294153655925)
,p_db_column_name=>'NMBRE_TREA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71920364398655926)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71920498398655927)
,p_db_column_name=>'FCHA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71920549232655928)
,p_db_column_name=>'ID_RCRSO_DTLLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Rcrso Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(71934243290697636)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'719343'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBSRVCION:NMBRE_TREA:NMBRE_TRCRO:FCHA:ID_RCRSO_DTLLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1055858108534620110)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(1038502610883461691)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1120670548946971305)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(1055858108534620110)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion',
'     , md.dscrpcion_dcmnto',
'     , d.fcha',
'     , ''<input type="checkbox" disabled '' || decode(d.actvo, ''S'', ''checked'', '''') ||  ''/>'' actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P28_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(1047908790097090810)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>1047908790097090810
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117652650739387973)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117653060017387986)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117653422794387986)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117653802293387987)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117654276542387987)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117654678111387987)
,p_db_column_name=>'ACTVO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFActivo?')
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117655058541387987)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1047922257383097077)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1176554'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ID_DCMNTO:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1120660965872967798)
,p_plug_name=>'Datos del Gestor'
,p_parent_plug_id=>wwv_flow_api.id(1038502610883461691)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1120665847961969400)
,p_plug_name=>'Datos del Solicitante'
,p_parent_plug_id=>wwv_flow_api.id(1038502610883461691)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1120909207268292378)
,p_plug_name=>'Datos Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(1038502610883461691)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1386703052377856026)
,p_plug_name=>'Etapas Recurso'
,p_parent_plug_id=>wwv_flow_api.id(1038502610883461691)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.id_rcrso',
'           ,b.id_fljo_trea',
'           ,b.nmbre_trea',
'           ,a.fcha_incio fcha',
'           ,a.fcha_fin_real fcha_fin',
'           ,case',
'               when a.id_estdo_trnscion in (1, 2) then',
unistr('                   ''S\00ED'''),
'               when a.id_estdo_trnscion in (3, 4) then',
'                   ''No''',
'               else',
'                   ''Invalido''',
'           end actvo',
'from        wf_g_instancias_transicion      a',
'inner join  v_wf_d_flujos_tarea             b   on  b.id_fljo_trea          =   a.id_fljo_trea_orgen',
'left  join  gj_g_recursos                   c   on  c.id_instncia_fljo_hjo  =   a.id_instncia_fljo   ',
'where       b.cdgo_clnte                 =       :F_CDGO_CLNTE',
'--and         a.id_instncia_fljo      =       :F_ID_INSTNCIA_FLJO',
'and c.id_instncia_fljo_gnrdo_rsl_acl = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1149869234899138071)
,p_name=>'ID_RCRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(1149869330045138072)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1149869480137138073)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(1149869536747138074)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(1149869700322138075)
,p_name=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FIN'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1149869879341138077)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(1149892695819261273)
,p_name=>'BTN_OBSRVCNES'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_ID_FLJO_TREA,P17_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1149892719785261274)
,p_name=>'BTN_DCMNTOS_GNRDOS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documentos Generados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:P19_ID_FLJO_TREA,P19_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(1149869006447138069)
,p_internal_uid=>1149869006447138069
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
 p_id=>wwv_flow_api.id(1149874975654138558)
,p_interactive_grid_id=>wwv_flow_api.id(1149869006447138069)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(1149875016918138559)
,p_report_id=>wwv_flow_api.id(1149874975654138558)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1149876062061138569)
,p_view_id=>wwv_flow_api.id(1149875016918138559)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(1149869234899138071)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1149876520414138571)
,p_view_id=>wwv_flow_api.id(1149875016918138559)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(1149869330045138072)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1149877093900138572)
,p_view_id=>wwv_flow_api.id(1149875016918138559)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(1149869480137138073)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1149877483881138573)
,p_view_id=>wwv_flow_api.id(1149875016918138559)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(1149869536747138074)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1149877903773138575)
,p_view_id=>wwv_flow_api.id(1149875016918138559)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(1149869700322138075)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1149878916270138578)
,p_view_id=>wwv_flow_api.id(1149875016918138559)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(1149869879341138077)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1149917429283551799)
,p_view_id=>wwv_flow_api.id(1149875016918138559)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(1149892695819261273)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1149920093402572260)
,p_view_id=>wwv_flow_api.id(1149875016918138559)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(1149892719785261274)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(333090361969899289)
,p_view_id=>wwv_flow_api.id(1149875016918138559)
,p_execution_seq=>5
,p_name=>'Etapa Seleccionada'
,p_background_color=>'#0472CE'
,p_text_color=>'#FFFFFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(1149869879341138077)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Si'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1264395922085335442)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('<i>Funcionalidad que permite la generaci\00F3n de instancias y la aplicaci\00F3n de acciones.'),
'<br/>',
'<br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117673596583465784)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1003648285265334100)
,p_button_name=>'BTN_REGRESAR_RECURSO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>unistr('Regresar a la Gesti\00F3n ')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_instncia_fljo',
'from wf_g_instancias_flujo',
'where id_instncia_fljo = 1136696',
'and estdo_instncia = ''FINALIZADA'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117626859718360871)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1003648285265334100)
,p_button_name=>'BTN_GNRAR_INSTANCIA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Instancia'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from v_gj_g_recursos_accion',
'where id_rcrso = :P28_ID_RCRSO',
'and id_instncia_fljo_hjo_gnrdo is null;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(152820631404613234)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1003648285265334100)
,p_button_name=>'BTN_IR_FLJO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Flujo de Ajuste'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_id_instncia_fljo_hjo_gnrdo number;',
'  v_estdo_instncia             varchar2(20);',
'begin',
'    begin',
'        select  ',
'                a.id_instncia_fljo_hjo_gnrdo,',
'                a.estdo_instncia',
'                into',
'                v_id_instncia_fljo_hjo_gnrdo,',
'                v_estdo_instncia',
'        from v_gj_g_recursos_accion a',
'        left join v_wf_g_instancias_flujo b on a.id_instncia_fljo_indc = b.id_instncia_fljo',
'        where a.cdgo_clnte              = :F_CDGO_CLNTE ',
'        -- and     a.id_instncia_fljo_hjo    = :P28_ID_INSTNCIA_FLJO_PDRE ',
'         and     a.id_instncia_fljo_hjo    = :P28_ID_INSTNCIA_FLJO_HJO ',
'         and     a.id_rcrso_accion_antrior is not null;',
'       exception',
'         when no_data_found then',
'          null;',
'    end;',
'    ',
'    if (v_id_instncia_fljo_hjo_gnrdo is not null and v_estdo_instncia <> ''FINALIZADA'') then',
'        return true;',
'     else',
'         return false;',
'    end if;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-external-link'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(152821718409657007)
,p_branch_name=>unistr('Bifurcar a Funci\00F3n que Devuelve una URL')
,p_branch_action=>'declare'||wwv_flow.LF||
'    v_url                  varchar2(4000);'||wwv_flow.LF||
'    v_id_fljo_trea_orgen   wf_g_instancias_transicion.id_fljo_trea_orgen%type;'||wwv_flow.LF||
'    v_id_instncia_fljo     wf_g_instancias_transicion.id_instncia_fljo%type;    '||wwv_flow.LF||
'    '||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    begin '||wwv_flow.LF||
'        '||wwv_flow.LF||
'        select t.id_fljo_trea_orgen'||wwv_flow.LF||
'              , t.id_instncia_fljo'||wwv_flow.LF||
'          into v_id_fljo_trea_orgen'||wwv_flow.LF||
'             , v_id_instncia_fljo'||wwv_flow.LF||
'          from v_wf_g_instancias_flujo_gnrdo fg'||wwv_flow.LF||
'          join wf_g_instancias_transicion t'||wwv_flow.LF||
'            on t.id_instncia_fljo = fg.id_instncia_fljo_gnrdo  '||wwv_flow.LF||
'         where fg.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'||wwv_flow.LF||
'           --and t.id_estdo_trnscion in (1,2)           '||wwv_flow.LF||
'           --and t.id_usrio = :F_ID_USRIO; '||wwv_flow.LF||
'          '||wwv_flow.LF||
'          apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );'||wwv_flow.LF||
'          apex_util.set_session_state(''F_ID_FLJO_TREA''    , v_id_fljo_trea_orgen );'||wwv_flow.LF||
'          --select apex_util.prepare_url(url || nvl2(prmtros, prmtros || '','', '''') || ''P''||nmro_pgna || ''_ID_INSTNCIA_FLJO'' || '':'' || nvl2(vlres,vlres ||'','', '''' ) || v_id_instncia_fljo) url'||wwv_flow.LF||
'          select apex_util.prepare_url(url || prmtros || '':'' || vlres ) url'||wwv_flow.LF||
'            into v_url'||wwv_flow.LF||
'              from (select ''f?p=''|| c.nmro_aplccion || '':''|| b.nmro_pgna ||'':''|| v(''app_session'') ||'':PAGELOAD:NO:'' || b.nmro_pgna || '':'' url, '||wwv_flow.LF||
'                           listagg(e.nmbre_item,'','') within group (order by e.id_instncia_item_vlor)||''P104_ID_INSTNCIA_FLJO_GJ,P104_BRANCH_APP_ID,P104_CDGO_FLJO_JRDCA'' prmtros, '||wwv_flow.LF||
'                           listagg(e.vlor,'','')       within group (order by e.id_instncia_item_vlor)||:P28_ID_INSTNCIA_FLJO||'',''||:APP_ID||'',''||:P28_CDGO_FLJO vlres ,'||wwv_flow.LF||
'                           b.nmro_pgna,'||wwv_flow.LF||
'                           c.nmro_aplccion'||wwv_flow.LF||
'                      from v_wf_d_flujos_tarea a '||wwv_flow.LF||
'                      join wf_d_tareas b on a.id_trea = b.id_trea '||wwv_flow.LF||
'                      join v_sg_g_aplicaciones_cliente c on b.id_aplccion = c.id_aplccion'||wwv_flow.LF||
'                      join wf_g_instancias_transicion d on a.id_fljo_trea = d.id_fljo_trea_orgen '||wwv_flow.LF||
'                 left join wf_g_instancias_item_valor e on e.id_instncia_trnscion = d.id_instncia_trnscion'||wwv_flow.LF||
'                     where d.id_instncia_fljo   = v_id_instncia_fljo'||wwv_flow.LF||
'                       and d.id_fljo_trea_orgen = v_id_fljo_trea_orgen'||wwv_flow.LF||
'                  group by e.id_instncia_trnscion,'||wwv_flow.LF||
'                           c.nmro_aplccion, '||wwv_flow.LF||
'                           b.nmro_pgna ) s;  '||wwv_flow.LF||
'          '||wwv_flow.LF||
'    exception '||wwv_flow.LF||
'        when others then'||wwv_flow.LF||
'            v_url := ''#'';'||wwv_flow.LF||
'    end;'||wwv_flow.LF||
'    '||wwv_flow.LF||
'    return v_url;'||wwv_flow.LF||
'end;'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_when_button_id=>wwv_flow_api.id(152820631404613234)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117673761790466845)
,p_branch_name=>'Ir al Recurso'
,p_branch_action=>'--Consultamos la instancia del flujo padre'||wwv_flow.LF||
'declare'||wwv_flow.LF||
'   v_id_instncia_fljo number; '||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    select a.id_instncia_fljo'||wwv_flow.LF||
'    into v_id_instncia_fljo'||wwv_flow.LF||
'    from wf_g_instancias_flujo_gnrdo a'||wwv_flow.LF||
'    where a.id_instncia_fljo_gnrdo_hjo = :F_ID_INSTNCIA_FLJO;'||wwv_flow.LF||
'    '||wwv_flow.LF||
'    --Seteamos en Sesión la Instancia del Flujo'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo);'||wwv_flow.LF||
'    '||wwv_flow.LF||
'    --Consultamos la ultima tarea'||wwv_flow.LF||
'    declare'||wwv_flow.LF||
'        v_id_fljo_trea_orgen number;'||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'        select id_fljo_trea_orgen'||wwv_flow.LF||
'        into v_id_fljo_trea_orgen'||wwv_flow.LF||
'        from wf_g_instancias_transicion'||wwv_flow.LF||
'        where id_instncia_fljo =  v_id_instncia_fljo and'||wwv_flow.LF||
'              id_estdo_trnscion in (1,2);'||wwv_flow.LF||
'              '||wwv_flow.LF||
'        --Seteamos en Sesión la tarea'||wwv_flow.LF||
'        apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea_orgen);'||wwv_flow.LF||
'        '||wwv_flow.LF||
'        return pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo , p_id_fljo_trea     => v_id_fljo_trea_orgen);'||wwv_flow.LF||
'    end;'||wwv_flow.LF||
'    '||wwv_flow.LF||
'exception'||wwv_flow.LF||
'    when others then'||wwv_flow.LF||
'        raise_application_error(-20001, ''Problemas al consultar flujo padre, ''||sqlerrm);'||wwv_flow.LF||
'end;'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_when_button_id=>wwv_flow_api.id(117673596583465784)
,p_branch_sequence=>50
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71917958559655902)
,p_name=>'P28_ID_INSTNCIA_FLJO_HJO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117638601644387943)
,p_name=>'P28_ID_PRSNTCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117639079576387950)
,p_name=>'P28_ID_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117639497390387950)
,p_name=>'P28_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :f_cdgo_clnte',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117639821669387950)
,p_name=>'P28_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117640259376387950)
,p_name=>'P28_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P28_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117640644891387951)
,p_name=>'P28_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117641040004387951)
,p_name=>'P28_ID_SLCTUD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117641485647387951)
,p_name=>'P28_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117641877465387952)
,p_name=>'P28_FCHA_RDCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117642262132387952)
,p_name=>'P28_ID_INSTNCIA_FLJO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117642613011387952)
,p_name=>'P28_ID_INSTNCIA_FLJO_PDRE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1120909207268292378)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117643320716387953)
,p_name=>'P28_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1120660965872967798)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117643795243387953)
,p_name=>'P28_DSCRPCION_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1120660965872967798)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117644120855387953)
,p_name=>'P28_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1120660965872967798)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117644567417387953)
,p_name=>'P28_PRMER_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1120660965872967798)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117644967106387953)
,p_name=>'P28_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1120660965872967798)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117645381421387954)
,p_name=>'P28_PRMER_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1120660965872967798)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117645773609387954)
,p_name=>'P28_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1120660965872967798)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117646406154387955)
,p_name=>'P28_DSCRPCION_RSPNSBLE_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117646892816387957)
,p_name=>'P28_DSCRPCION_IDNTFCCION_TPO_S'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117647242421387957)
,p_name=>'P28_IDNTFCCION_S'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117647660321387957)
,p_name=>'P28_PRMER_NMBRE_S'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117648071066387957)
,p_name=>'P28_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117648449467387957)
,p_name=>'P28_PRMER_APLLDO_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117648884831387958)
,p_name=>'P28_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117649241040387958)
,p_name=>'P28_NMBRE_PAIS_NTFCCION_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117649626132387958)
,p_name=>'P28_NMBRE_DPRTMNTO_NTFCCION_S'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117650055374387958)
,p_name=>'P28_NMBRE_MNCPIO_NTFCCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>'Municpio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117650470964387958)
,p_name=>'P28_DRCCION_NTFCCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117650894912387959)
,p_name=>'P28_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117651214029387965)
,p_name=>'P28_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117651653579387965)
,p_name=>'P28_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(1120665847961969400)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117656119016388996)
,p_name=>'P28_ID_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117656566453388998)
,p_name=>'P28_ID_RCRSO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117656935839388998)
,p_name=>'P28_NMRO_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_prompt=>'No. Acto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117657332697388999)
,p_name=>'P28_FCHA_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_prompt=>unistr('Fecha de Notificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117657745062388999)
,p_name=>'P28_FCHA_OPTIMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_prompt=>'Fecha Optima'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117658197843388999)
,p_name=>'P28_ID_RCRSO_TIPO_CLNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_prompt=>'Tipo de Recurso'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_RECURSO_CLIENTE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion d, a.id_rcrso_tipo_clnte r',
'from gj_d_recursos_tipo_cliente a',
'inner join gj_d_recursos_tipo b on a.cdgo_rcrso_tpo = b.cdgo_rcrso_tpo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117658521768389000)
,p_name=>'P28_INDCDOR_AIR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117658930989389002)
,p_name=>'P28_AIR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_prompt=>unistr('Acci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Admisi\00F3n;A,Inadmisi\00F3n;I,Rechazo;R')
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117659797701389002)
,p_name=>'P28_DSCRPCION_ACTO_TPO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117660100776389003)
,p_name=>'P28_DFRNCIA_DIAS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117660544434389003)
,p_name=>'P28_ID_RCRSO_ACCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117660967954389006)
,p_name=>'P28_ID_ACTO_RR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117661341298389007)
,p_name=>'P28_ID_ACTO_TPO_RR'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117661778846389007)
,p_name=>'P28_FCHA_RR'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153606474458781702)
,p_name=>'P28_CDGO_FLJO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(883143614576938963)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_fljo',
'from wf_d_flujos a join wf_d_flujos_tarea b on a.id_fljo = b.id_fljo',
'where b.id_fljo_trea = :F_ID_FLJO_TREA',
'and a.cdgo_clnte = :F_CDGO_CLNTE'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117674259040469201)
,p_name=>'Al hacer clic en regresar recurso'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(117673596583465784)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117674362521469202)
,p_event_id=>wwv_flow_api.id(117674259040469201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.removeItem("wf_link");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(152820897691621784)
,p_name=>'CLIC_BTN_IR_FLJO'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(152820631404613234)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152821232262621791)
,p_event_id=>wwv_flow_api.id(152820897691621784)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.setItem(''wf_tarea'', '''');',
'window.localStorage.setItem(''wf_link'', '''');',
'apex.submit({',
'    request: ''BTN_IR_FLJO''',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117633729070386775)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Recurso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select id_rcrso,',
'           id_acto, ',
'           nmro_acto, ',
'           dscrpcion_acto_tpo, ',
'           fcha_ntfccion, ',
'           fcha_optima, ',
'           trunc(to_date(fcha_optima,''DD/MM/YYYY hh24:mi:ss''))-trunc(to_date(sysdate,''DD/MM/YYYY hh24:mi:ss'')) as dfrncia_dias,',
'           id_rcrso_tipo_clnte,',
'           a_i_r,',
'           indcdor_a_i_r',
'    into :P28_ID_RCRSO,',
'         :P28_ID_ACTO, ',
'         :P28_NMRO_ACTO, ',
'         :P28_DSCRPCION_ACTO_TPO, ',
'         :P28_FCHA_NTFCCION, ',
'         :P28_FCHA_OPTIMA, ',
'         :P28_DFRNCIA_DIAS,',
'         :P28_ID_RCRSO_TIPO_CLNTE,',
'         :P28_AIR,',
'         :P28_INDCDOR_AIR',
'    from(select a.id_rcrso,',
'                a.id_acto,',
'                a.nmro_acto,',
'                a.dscrpcion_acto_tpo,',
'                a.fcha_ntfccion,',
'                to_char(pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => a.cdgo_clnte, ',
'                                                              p_fecha_inicial => a.fcha_ntfccion, ',
'                                                              p_undad_drcion  => a.undad_drcion_pr, ',
'                                                              p_drcion        => a.drcion_pr, ',
'                                                              p_dia_tpo       => a.dia_tpo_pr),''dd/MM/yyyy'') as fcha_optima,',
'               a.id_rcrso_tipo_clnte,',
'               a.a_i_r,',
'               a.indcdor_a_i_r',
'         from  v_gj_g_recursos a',
'          where id_instncia_fljo_pdre = :P28_ID_INSTNCIA_FLJO_PDRE);',
'   --      where id_instncia_fljo_hjo = :P28_ID_INSTNCIA_FLJO_PDRE);',
'exception',
'    when others then',
'        raise_application_error(-20000,''Problemas al consultar recurso'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117690100863521323)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Instancias'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3200);',
'begin',
'    pkg_gj_recurso.prc_gn_flujo_instancias(p_cdgo_clnte			    => :F_CDGO_CLNTE,',
'                                           p_id_instncia_fljo		=> :P28_ID_INSTNCIA_FLJO_HJO,--:P28_ID_INSTNCIA_FLJO_PDRE,',
'                                           p_id_instncia_fljo_hjo   => :F_ID_INSTNCIA_FLJO,',
'                                           p_id_fljo_trea			=> :F_ID_FLJO_TREA,',
'                                           p_id_usrio			    => :F_ID_USRIO,',
'                                           o_cdgo_rspsta			=> v_cdgo_rspsta,',
'                                           o_mnsje_rspsta           => v_mnsje_rspsta);',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20000,v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117626859718360871)
,p_process_success_message=>'Flujos generados exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71917869480655901)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Flujo Hijo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_instncia_fljo_hjo',
'into :P28_ID_INSTNCIA_FLJO_HJO',
'from   gj_g_recursos ',
'where id_instncia_fljo_gnrdo_rsl_acl = :F_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117632581362383347)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Flujo Padre'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*begin',
'    select id_instncia_fljo',
'    into :P28_ID_INSTNCIA_FLJO_PDRE',
'    from wf_g_instancias_flujo_gnrdo ',
'    where id_instncia_fljo_gnrdo_hjo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        raise_application_error(-20001, ''Problemas al consultar flujo padre'');',
'end;*/',
'',
'begin',
'select a.id_instncia_fljo',
'into :P28_ID_INSTNCIA_FLJO_PDRE',
'from wf_g_instancias_flujo_gnrdo a',
'join gj_g_recursos              b on a.id_instncia_fljo_gnrdo_hjo = b.id_instncia_fljo_hjo',
'where b.id_instncia_fljo_gnrdo_rsl_acl =:F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        raise_application_error(-20001, ''Problemas al consultar flujo padre'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117632881593384069)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_tpo,',
'            a.id_mtvo,',
'            b.nmbre_impsto,',
'            c.nmbre_impsto_sbmpsto,',
'            a.idntfccion,',
'            a.id_rdcdor,',
'            a.id_slctud,',
'            a.nmro_rdcdo_dsplay,',
'            a.fcha_rdcdo,',
'            a.id_prsntcion_tpo',
'      into :P28_ID_TPO,',
'           :P28_ID_MTVO,',
'           :P28_NMBRE_IMPSTO,',
'           :P28_NMBRE_IMPSTO_SBMPSTO,',
'           :P28_IDNTFCCION_SJTO,',
'           :P28_ID_RDCDOR,',
'           :P28_ID_SLCTUD,',
'           :P28_NMRO_RDCDO_DSPLAY,',
'           :P28_FCHA_RDCDO,',
'           :P28_ID_PRSNTCION_TPO',
'      from v_pq_g_solicitudes a',
'      inner join df_c_impuestos b on a.id_impsto = b.id_impsto',
'      inner join df_i_impuestos_subimpuesto c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto and',
'                                                 a.id_impsto = c.id_impsto and',
'                                                 c.cdgo_clnte = :F_CDGO_CLNTE',
'    --  where a.id_instncia_fljo_gnrdo = :P28_ID_INSTNCIA_FLJO_PDRE;',
'        where a.id_instncia_fljo = :P28_ID_INSTNCIA_FLJO_PDRE;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20001, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20001, ''Problemas al consultar radicador''); ',
'end;',
'  ',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117633168246385115)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  b.dscrpcion_idntfccion_tpo,',
'            a.idntfccion,',
'            a.prmer_nmbre,',
'            a.sgndo_nmbre,',
'            a.prmer_aplldo,',
'            a.sgndo_aplldo',
'    into    :P28_DSCRPCION_IDNTFCCION_TPO,',
'            :P28_IDNTFCCION,',
'            :P28_PRMER_NMBRE,',
'            :P28_SGNDO_NMBRE,',
'            :P28_PRMER_APLLDO,',
'            :P28_SGNDO_APLLDO',
'    from pq_g_radicador a',
'    inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where id_rdcdor = :P28_ID_RDCDOR;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20001, ''Radicador de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20001, ''Problemas al consultar radicador''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117633489707385856)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select d.dscrpcion_rspnsble_tpo,',
'           b.dscrpcion_idntfccion_tpo,',
'           a.idntfccion,',
'           a.prmer_nmbre,',
'           a.sgndo_nmbre,',
'           a.prmer_aplldo,',
'           a.sgndo_aplldo,',
'           c.nmbre_pais,',
'           c.nmbre_dprtmnto,',
'           c.nmbre_mncpio,',
'           a.drccion_ntfccion,',
'           a.email,',
'           a.tlfno,',
'           a.cllar',
'      into :P28_DSCRPCION_RSPNSBLE_TPO,',
'           :P28_DSCRPCION_IDNTFCCION_TPO_S,',
'           :P28_IDNTFCCION_S,',
'           :P28_PRMER_NMBRE_S,',
'           :P28_SGNDO_NMBRE_S ,',
'           :P28_PRMER_APLLDO_S,',
'           :P28_SGNDO_APLLDO_S,',
'           :P28_NMBRE_PAIS_NTFCCION_S,',
'           :P28_NMBRE_DPRTMNTO_NTFCCION_S,',
'           :P28_NMBRE_MNCPIO_NTFCCION_S,',
'           :P28_DRCCION_NTFCCION_S,',
'           :P28_EMAIL_S,',
'           :P28_TLFNO_S,',
'           :P28_CLLAR_S',
'      from pq_g_solicitantes a',
'      inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'      inner join v_df_s_municipios c on a.id_mncpio_ntfccion = c.id_mncpio',
'      inner join df_s_responsables_tipo d on a.cdgo_rspnsble_tpo = d.cdgo_rspnsble_tpo',
'     where a.id_slctud = :P28_ID_SLCTUD;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitante de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar Solicitante''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
