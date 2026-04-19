prompt --application/pages/page_00038
begin
wwv_flow_api.create_page(
 p_id=>38
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Tipos de Acuerdo de Pago'
,p_step_title=>'Tipos de Acuerdo de Pago'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20221103210030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40627609279824947)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35406739971267613)
,p_plug_name=>unistr('Tipo de Garant\00EDa')
,p_parent_plug_id=>wwv_flow_api.id(40627609279824947)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css">',
'',
'table.bordes',
'{   border: 2px solid rgba(0,0,0,0.1);',
'    border-top-width: 1px;',
'    border-right-width: 1px;',
'    border-bottom-width: 1px;',
'    border-left-width: 1px;',
'    font-size:10px;',
'',
'}',
'  </style>',
'',
'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:12px" class="bordes">',
'   ',
'    <tr>',
unistr('    <td><i>Caracterizar las Garant\00EDas que soportaran el tipo de Acuerdo de Pago si este lo exige:</i></td>'),
'    <td></td>',
'',
'  </tr>',
'  <tr>',
unistr('    <td><i>* Definir el Numero cuotas m\00EDnimas para que el tipo de Acuerdo de Pago exija garant\00EDa.</i> </td>'),
unistr('    <td><i>* Definir el Numero UVT M\00EDnimas para que el tipo de Acuerdo de Pago exija garant\00EDa.</i> </td>'),
'  ',
'  </tr>',
'  <tr>',
'',
unistr('    <td><i>* Definir el tipo de garant\00EDa.</i></td>'),
'    <td><i></i></td>',
'',
'',
'  </tr>',
'',
'</table>',
'    '))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41874745477978140)
,p_plug_name=>'P_38_CUADRICULA_TPO_GRNTIA'
,p_parent_plug_id=>wwv_flow_api.id(35406739971267613)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_cnvnio_grntia_tpo',
'    ,   id_cnvnio_tpo',
'    ,   id_grntia_tpo',
'    ,   actvo ',
'  from  gf_d_convenios_tipo_grntia ',
' where  id_cnvnio_tpo = :P38_ID_CNVNIO_TPO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P38_ID_CNVNIO_TPO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(41874935458978142)
,p_name=>'ID_GRNTIA_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_GRNTIA_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('TIPO DE GARANT\00CDA')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(33754492628369580)
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(41875314180978146)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42038781151356503)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42038899633356504)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42040220921356518)
,p_name=>'ID_CNVNIO_GRNTIA_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO_GRNTIA_TPO'
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
 p_id=>wwv_flow_api.id(42040347374356519)
,p_name=>'ID_CNVNIO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO_TPO'
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
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P38_ID_CNVNIO_TPO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(41874825188978141)
,p_internal_uid=>41874825188978141
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(42032494689309432)
,p_interactive_grid_id=>wwv_flow_api.id(41874825188978141)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(42032577283309433)
,p_report_id=>wwv_flow_api.id(42032494689309432)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42033037465309436)
,p_view_id=>wwv_flow_api.id(42032577283309433)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(41874935458978142)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42035020763309444)
,p_view_id=>wwv_flow_api.id(42032577283309433)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(41875314180978146)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42079382401436778)
,p_view_id=>wwv_flow_api.id(42032577283309433)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(42038781151356503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42312716151905663)
,p_view_id=>wwv_flow_api.id(42032577283309433)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(42040220921356518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42313243565905667)
,p_view_id=>wwv_flow_api.id(42032577283309433)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(42040347374356519)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35406855160267614)
,p_plug_name=>'Revocatoria'
,p_parent_plug_id=>wwv_flow_api.id(40627609279824947)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css">',
'',
'table.bordes',
'{   border: 2px solid rgba(0,0,0,0.1);',
'    border-top-width: 1px;',
'    border-right-width: 1px;',
'    border-bottom-width: 1px;',
'    border-left-width: 1px;',
'    font-size:10px;',
'',
'}',
'  </style>',
'',
'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:12px" class="bordes">',
'   ',
'    <tr>',
'        <td>',
unistr('            <i>Caracterizar el m\00E9todo de revocatoria que utilizara el tipo de Acuerdo de Pago:</i>'),
'        </td>',
'    </tr>',
'    <tr>',
'        <td>',
unistr('            <i>* Definir el m\00E9todo de revocatoria.</i>'),
'        </td>',
'        <td>',
unistr('            <i>* Definir si el m\00E9todo de revocatoria tendr\00E1 en cuanta el incumplimiento de Vigencias Futuras.</i>'),
'        </td>',
'    </tr>',
'</table>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40627837219824949)
,p_plug_name=>'Generalidades'
,p_parent_plug_id=>wwv_flow_api.id(40627609279824947)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41872906832978122)
,p_plug_name=>'Cuota Inicial'
,p_parent_plug_id=>wwv_flow_api.id(40627609279824947)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css">',
'',
'table.bordes',
'{   border: 2px solid rgba(0,0,0,0.1);',
'    border-top-width: 1px;',
'    border-right-width: 1px;',
'    border-bottom-width: 1px;',
'    border-left-width: 1px;',
'    ',
'',
'}',
'  </style>',
'',
'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:12px" class="bordes">',
'   ',
'    <tr>',
'    <td><i>Caracterizar la cuota inicial del Acuerdo de Pago si este lo exige:</i></td>',
'    <td></td>',
'',
'  </tr>',
'  <tr>',
'    <td><i>* Definir si la vigencia de la cuota inicial  hace parte de las vigencias del Acuerdo de Pago </i> </td>',
'    <td><i>* Definir si el valor a pagar de cuota inicial es por el total o por un abono de las vigencias. </i> </td>',
'  ',
'  </tr>',
'  <tr>',
'',
'    <td><i>* Definir el porcentaje de las vigencias a pagar como cuota inicial.</i></td>',
unistr('    <td><i>* Definir el l\00EDmite de porcentaje a pagar como cuota inicial.</i></td>'),
'',
'',
'  </tr>',
'',
'</table>',
'    ',
'',
'',
'',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82949807459838810)
,p_plug_name=>'Condiciones'
,p_parent_plug_id=>wwv_flow_api.id(40627609279824947)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_cnvnio_tpo_cndcion,',
'		a.id_cnvnio_atrbto,',
'		a.nmbre_atrbto,',
'        a.id_oprdor_tpo,',
'        a.dscrpcion_oprdor_tpo,',
'		a.vlor1,',
'		a.vlor2',
'  from v_gf_d_convenios_tipo_cndcion a ',
'  where id_cnvnio_tpo = :P38_ID_CNVNIO_TPO;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P38_ID_CNVNIO_TPO'
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
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css">',
'',
'table.bordes',
'{   border: 2px solid rgba(0,0,0,0.1);',
'    border-top-width: 1px;',
'    border-right-width: 1px;',
'    border-bottom-width: 1px;',
'    border-left-width: 1px;',
'    font-size:10px;',
'',
'}',
'  </style>',
'',
'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:12px" class="bordes">',
'   ',
'    <tr>',
'    <td><i>Caracterizar las condiciones que seran evaluadas sobre los atributos del Sujeto impuesto (Predio,Vehiculo,etc) para aplicara al el tipo de Acuerdo de Pago:</i></td>',
'    <td></td>',
'',
'  </tr>',
'  <tr>',
'    <td><i></i> </td>',
'    <td><i></i> </td>',
'  ',
'  </tr>',
'  <tr>',
'',
'    <td><i></i></td>',
'    <td><i></i></td>',
'',
'',
'  </tr>',
'',
'</table>'))
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(82949870094838811)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP,39:P39_ID_CNVNIO_TPO_CNDCION,P38_CDGO_SJTO_TPO,P39_ID_CNVNIO_ATRBTO,P39_VLOR_1_SELECT_LIST,P39_VLOR_2_SELECT_LIST,P39_VLOR_1_TEXT,P39_VLOR_2_TEXT,P39_ID_OPRDOR_TPO,P39_ID_CNVNIO_TPO:#ID_CNVNIO_TPO_CNDCION#,&P38_C'
||'DGO_SJTO_TPO.,#ID_CNVNIO_ATRBTO#,#VLOR1#,#VLOR2#,#VLOR1#,#VLOR2#,#ID_OPRDOR_TPO#,&P38_ID_CNVNIO_TPO.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>82949870094838811
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42338201782105987)
,p_db_column_name=>'ID_CNVNIO_TPO_CNDCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Cnvnio Tpo Cndcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42338631458105987)
,p_db_column_name=>'ID_CNVNIO_ATRBTO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Id Cnvnio Atrbto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42341021044105989)
,p_db_column_name=>'NMBRE_ATRBTO'
,p_display_order=>40
,p_column_identifier=>'H'
,p_column_label=>'Atributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42347951183115448)
,p_db_column_name=>'ID_OPRDOR_TPO'
,p_display_order=>50
,p_column_identifier=>'I'
,p_column_label=>'Id Oprdor Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42340661775105988)
,p_db_column_name=>'DSCRPCION_OPRDOR_TPO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Operador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42339087507105987)
,p_db_column_name=>'VLOR1'
,p_display_order=>70
,p_column_identifier=>'C'
,p_column_label=>'Valor 1'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42339498395105988)
,p_db_column_name=>'VLOR2'
,p_display_order=>80
,p_column_identifier=>'D'
,p_column_label=>'Valor 2'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(84674562813198564)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'423414'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_CNVNIO_TPO_CNDCION:ID_CNVNIO_ATRBTO:NMBRE_ATRBTO:DSCRPCION_OPRDOR_TPO:VLOR1:VLOR2:ID_OPRDOR_TPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75502885453918370)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(75502954638918371)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b></h5>',
unistr('<p align="justify">Funcionalidad que permite ingresar, modificar y eliminar los tipos de acuerdo de Pago y su caracterizaci\00F3n.</p>'),
unistr('<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario</p></i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41832051272739879)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(75502885453918370)
,p_button_name=>'Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41834233895739883)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(75502885453918370)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P38_ID_CNVNIO_TPO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41833896646739883)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(75502885453918370)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P38_ID_CNVNIO_TPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41833448992739882)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(75502885453918370)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro desea eliminar este tipo de acuerdo de pago?'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P38_ID_CNVNIO_TPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42343466080115403)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(82949807459838810)
,p_button_name=>'BTN_AGREGAR_ATRIBUTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Atributo'
,p_button_position=>'TOP'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(33491723794634704)
,p_branch_name=>'Go To Page 37'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(42042572957356541)
,p_branch_name=>'P38_BRANCH'
,p_branch_action=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP,39:P39_CDGO_SJTO_TPO,P39_ID_CNVNIO_TPO:&P38_CDGO_SJTO_TPO.,&P38_ID_CNVNIO_TPO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(42343466080115403)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23378844140392741)
,p_name=>'P38_INDCDOR_INSLVNCIA'
,p_is_required=>true
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFInsolvencia?')
,p_source=>'INDCDOR_INSLVNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el tipo de acuerdo es de Insolvencia, si lo es, tiene caracter\00EDsticas especiales.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40627963915824950)
,p_name=>'P38_TSA_PRFRNCIAL_EA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tasa Referencial Efectivo Anual'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_source=>'TSA_PRFRNCIAL_EA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('tasa de inter\00E9s que calcula el costo o valor de inter\00E9s esperado en un plazo de un a\00F1o')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41834687338739883)
,p_name=>'P38_ID_CNVNIO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(40627609279824947)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_CNVNIO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41835059515739886)
,p_name=>'P38_CDGO_CLNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40627609279824947)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41835400149739886)
,p_name=>'P38_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>200
,p_cHeight=>5
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Descripci\00F3n o definici\00F3n del tipo de acuerdo.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41836389378739888)
,p_name=>'P38_RNGO_VGNCIA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rango Vigencia'
,p_source=>'RNGO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Determina si el acuerdo de pago bajo este tipo tendr\00E1 en cuenta todas las vigencias de la cartera (T) o las vigencias parciales de la cartera (P) para su aplicaci\00F3n.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'T'
,p_attribute_03=>'Todas'
,p_attribute_04=>'P'
,p_attribute_05=>'Puntuales'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41837293766739889)
,p_name=>'P38_ID_DCRTO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Decreto'
,p_source=>'ID_DCRTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_DECRETOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION as d,',
'       ID_DCRTO as r',
'  from DF_C_DECRETOS',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Decreto con el que se autoriza el tipo de acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41838172016739890)
,p_name=>'P38_FCHA_LMTE_ELBRCION'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha L\00EDmite de Elaboraci\00F3n')
,p_source=>'FCHA_LMTE_ELBRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha l\00EDmite para que el contribuyente elabore la solicitud del acuerdo de pago.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41839095239739892)
,p_name=>'P38_NMRO_MXMO_CTAS'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 M\00E1ximo de Cuotas')
,p_source=>'NMRO_MXMO_CTAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de cuotas m\00E1ximas en que se puede dividir el valor del acuerdo de pago.')
,p_attribute_01=>'1'
,p_attribute_02=>'60'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41839940434739892)
,p_name=>'P38_FCHA_MXMA_CTAS'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha M\00E1xima de  Cuotas')
,p_source=>'FCHA_MXMA_CTAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha m\00E1xima de vencimiento de la \00FAltima cuota del acuerdo de pago.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41840866334739893)
,p_name=>'P38_INDCDOR_CLCLA_FNCCION'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFCalcula Valor de Financiaci\00F3n?')
,p_source=>'INDCDOR_CLCLA_FNCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indicador que determina si el valor de las cuotas del acuerdo de pago tendr\00E1 financiaci\00F3n.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41841733940739893)
,p_name=>'P38_INDCDOR_CLCLA_FNCCN_SB_TTA'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFCalcula Sobre el Total del Capital?')
,p_source=>'INDCDOR_CLCLA_FNCCN_SB_TTAL_K'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indicador que determina si el valor de financiaci\00F3n se calcular\00E1 sobre el valor total del capital.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41842623714739894)
,p_name=>'P38_INDCDOR_RQRE_GRNTIA'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(35406739971267613)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFRequiere Garant\00EDa?')
,p_source=>'INDCDOR_RQRE_GRNTIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el acuerdo de pago bajo este tipo exigir\00E1 garant\00EDa que lo respalde.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41844429639739895)
,p_name=>'P38_NMRO_CTA_MNMA_RQRE_GRNTIA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(35406739971267613)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Cuotas M\00EDnimas')
,p_source=>'NMRO_CTA_MNMA_RQRE_GRNTIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de cuotas m\00EDnimas para requerir garant\00EDa.')
,p_attribute_01=>'1'
,p_attribute_02=>'60'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41845375246739895)
,p_name=>'P38_NMRO_UVT_MNMA_RQRE_GRNTIA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(35406739971267613)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 UVT M\00EDnimas para garantia ')
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_source=>'NMRO_UVT_MNMA_RQRE_GRNTIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>21
,p_cMaxlength=>21
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de UVT m\00EDnimas para requerir garant\00EDa (se compara con el total de la deuda de las vigencias del acuerdo de pago).')
,p_attribute_01=>'1'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41846275867739896)
,p_name=>'P38_INDCDOR_EXGE_CTA_INCIAL'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(41872906832978122)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFExige Cuota Inicial?')
,p_source=>'INDCDOR_EXGE_CTA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el acuerdo de pago exigir\00E1 una cuota inicial para ser elaborado.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41848040224739897)
,p_name=>'P38_CTA_INCIAL_PRCNTJE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(41872906832978122)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Porcentaje'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_source=>'CTA_INCIAL_PRCNTJE_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica el porcentaje de pago de las vigencias para cuota inicial de acuerdo de pago.'
,p_attribute_01=>'1'
,p_attribute_02=>'100'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41850708259739899)
,p_name=>'P38_ID_RVCTRIA_MTDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(35406855160267614)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Metodo de Revocatoria'
,p_source=>'ID_RVCTRIA_MTDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_METODO_REVOCATORIA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       id_rvctria_mtdo as r',
'  from gf_d_revocatoria_metodo',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Indica el m\00E9todo a utilizar para revocar el acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41870832341978101)
,p_name=>'P38_INDCDOR_VRFCA_DDA'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFValida Rango de Deuda?')
,p_source=>'INDCDOR_VRFCA_DDA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Determina si el acuerdo de pago perteneciente a este tipo de acuerdo valida la deuda dentro de un rango para poder ser aplicado.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41870973706978102)
,p_name=>'P38_RNGO_DDA_DSDE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rango de Deuda Desde'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_source=>'RNGO_DDA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>21
,p_cMaxlength=>21
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Valor m\00EDnimo de deuda para aplicar el acuerdo de pago.')
,p_attribute_01=>'1'
,p_attribute_02=>'999999999999999999999'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41871075286978103)
,p_name=>'P38_RNGO_DDA_HSTA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rango de Deuda Hasta'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_source=>'RNGO_DDA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>21
,p_cMaxlength=>21
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Valor m\00E1ximo de deuda para aplicar al acuerdo de pago. ')
,p_attribute_01=>'1'
,p_attribute_02=>'999999999999999999999'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41872771357978120)
,p_name=>'P38_INDCDOR_APLCA_DSCNTO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFAplica Descuento?')
,p_source=>'INDCDOR_APLCA_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Determina si el acuerdo de pago aplica descuentos.',
''))
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41872896177978121)
,p_name=>'P38_ACTVO'
,p_is_required=>true
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el tipo de acuerdo de pago est\00E1 activo o no.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41873332689978126)
,p_name=>'P38_INDCDOR_GNRA_ACTO_CNVNIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFGenera Acto del Acuerdo?')
,p_source=>'INDCDOR_GNRA_ACTO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Determina si genera o no acto de acuerdos de pago.',
''))
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41873473410978127)
,p_name=>'P38_ID_ACTO_TPO_CNVNIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Acto '
,p_source=>'ID_ACTO_TPO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TIPOS_ACTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION as d,',
'       id_acto_tpo  as r',
'      from GN_D_ACTOS_TIPO',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'      order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Define el tipo de acto que respalda el acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41874119402978134)
,p_name=>'P38_INDCDOR_PRMTE_ADCCNAR_VGNCIA'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFAdiciona Vigencias?')
,p_source=>'INDCDOR_PRMTE_ADCCNAR_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Determina si el acuerdo de pago permite adicionar vigencias a las inicialmente pactadas por las partes.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41874281904978135)
,p_name=>'P38_NMRO_MXMO_ADCCNAR_VGNCIA'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 M\00E1ximo de Cuotas')
,p_source=>'NMRO_MXMO_ADCCNAR_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de cuotas m\00E1xima pueden ser adicionadas al acuerdo de pago de este tipo.')
,p_attribute_01=>'1'
,p_attribute_02=>'60'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41874629379978139)
,p_name=>'P38_INDCDOR_PRMTE_MDFCAR_NMRO_CTA'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFModifica el N\00FAmero de Cuotas ?')
,p_source=>'INDCDOR_PRMTE_MDFCAR_NMRO_CTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Determina si el acuerdo de pago permite modificar el n\00FAmero de cuotas a las inicialmente pactadas por las partes, ya sea para reducirlas o incrementarlas.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42039106580356507)
,p_name=>'P38_INDCDOR_RVCTRIA_VGNCIA_FTRA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(35406855160267614)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFValida Incumplimiento por Vigencias Futuras? ')
,p_source=>'INDCDOR_RVCTRIA_VGNCIA_FTRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si al revocar el acuerdo de pago se tienen en cuenta las vigencias futuras est\00E9n a paz y salvo.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42039275567356508)
,p_name=>'P38_CTA_INCIAL_VGNCIA_CNVNIO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(41872906832978122)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFCuota Inicial es Parte del Valor del Acuerdo?')
,p_source=>'CTA_INCIAL_VGNCIA_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'si la(s) vigencia(s) para la cuota inicial hacen parte de las vigencias seleccionadas en el acuerdo de pago.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42039323936356509)
,p_name=>'P38_CTA_INCIAL_ABNO_TTAL_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(41872906832978122)
,p_use_cache_before_default=>'NO'
,p_item_default=>'T'
,p_prompt=>unistr('\00BFCuota inicial sobre el total o abono de vigencias?')
,p_source=>'CTA_INCIAL_ABNO_TTAL_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>' la cuota inicial es por el total o abano de una o mas vigencias (las vigencias pueden que no haga parte del convenio).'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'T'
,p_attribute_03=>'TOTAL'
,p_attribute_04=>'A'
,p_attribute_05=>'ABONO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42040013342356516)
,p_name=>'P38_CTA_INCIAL_PRCNTJE_MXMO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(41872906832978122)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Limite M\00E1ximo del Porcentaje ')
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_source=>'LMTA_PRCNTJE_MXMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el limite m\00E1ximo del porcentaje para la cuota inicial del acuerdo de pago.')
,p_attribute_01=>'1'
,p_attribute_02=>'100'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42040133217356517)
,p_name=>'P38_CTA_INCIAL_PRCNTJE_MNMO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(41872906832978122)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Limite M\00EDnimo del Porcentaje ')
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_source=>'LMTA_PRCNTJE_MNMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el limite m\00EDnimo del porcentaje para la cuota inicial del acuerdo de pago.')
,p_attribute_01=>'1'
,p_attribute_02=>'100'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42040474881356520)
,p_name=>'P38_INDCDOR_LMTA_PRCNTJE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(41872906832978122)
,p_use_cache_before_default=>'NO'
,p_item_default=>'NO'
,p_prompt=>unistr('\00BFLimita porcentaje de cuota inicial?')
,p_source=>'INDCDOR_LMTA_PRCNTJE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Rango de porcentajes que indica si el acuerdo de pago exigir\00E1 una cuota inicial para ser realizado.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42343909688115408)
,p_name=>'P38_CDGO_SJTO_TPO'
,p_is_required=>true
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(40627837219824949)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Sujeto'
,p_source=>'CDGO_SJTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion_sjto_tpo as d, ',
'       cdgo_sjto_tpo as r ',
'  from df_s_sujetos_tipo',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de sujeto asociado al tipo de acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41853525706739903)
,p_validation_name=>'P38_FCHA_LMTE_ELBRCION must be timestamp'
,p_validation_sequence=>40
,p_validation=>'P38_FCHA_LMTE_ELBRCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(41838172016739890)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41853920998739903)
,p_validation_name=>'P38_FCHA_MXMA_CTAS _Valido'
,p_validation_sequence=>50
,p_validation=>'P38_FCHA_MXMA_CTAS'
,p_validation_type=>'ITEM_IS_DATE'
,p_error_message=>'Introduzca una fecha Valida'
,p_associated_item=>wwv_flow_api.id(41839940434739892)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(43324244025292107)
,p_validation_name=>'validar que el limite de porcentaje max sea mayor que el limite minimo'
,p_validation_sequence=>60
,p_validation=>':P38_CTA_INCIAL_PRCNTJE_MAX > :P38_CTA_INCIAL_PRCNTJE_MIN'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('El valor m\00E1ximo del porcentaje debe ser mayor que el valor m\00EDnimo.')
,p_associated_item=>wwv_flow_api.id(42040013342356516)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33172982630297701)
,p_validation_name=>'Valida Deuda'
,p_validation_sequence=>70
,p_validation=>'not(to_number(:P38_RNGO_DDA_DSDE,''999G999G999G999G999G999G990D99'') >= to_number(:P38_RNGO_DDA_HSTA,''999G999G999G999G999G999G990D99''))'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Ingrese un rango v\00E1lido para la deuda.')
,p_always_execute=>'Y'
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(41871075286978103)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33173159898297703)
,p_validation_name=>'Validar porcentaje'
,p_validation_sequence=>80
,p_validation=>'not(to_number(:P38_CTA_INCIAL_PRCNTJE_MNMO,''999G999G999G999G999G999G990D99'') >= to_number(:P38_CTA_INCIAL_PRCNTJE_MXMO,''999G999G999G999G999G999G990D99''))'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Ingrese un rango v\00E1lido para porcentaje.')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(42040013342356516)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41858282043739906)
,p_name=>'Mostrar Ind_clcla_fnncion_sb_ttal cuando ind_clcla_fnccion es S'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_INDCDOR_CLCLA_FNCCION'
,p_condition_element=>'P38_INDCDOR_CLCLA_FNCCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41858780443739907)
,p_event_id=>wwv_flow_api.id(41858282043739906)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_INDCDOR_CLCLA_FNCCN_SB_TTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41859207580739907)
,p_event_id=>wwv_flow_api.id(41858282043739906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_INDCDOR_CLCLA_FNCCN_SB_TTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41859733471739907)
,p_event_id=>wwv_flow_api.id(41858282043739906)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_INDCDOR_CLCLA_FNCCN_SB_TTA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41872376905978116)
,p_name=>'Mostrar rngo_dda_dsde y rngo_dda_hsta cuando ind_vrfca_dda es S'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_INDCDOR_VRFCA_DDA'
,p_condition_element=>'P38_INDCDOR_VRFCA_DDA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41872418821978117)
,p_event_id=>wwv_flow_api.id(41872376905978116)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_RNGO_DDA_DSDE,P38_RNGO_DDA_HSTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41872599054978118)
,p_event_id=>wwv_flow_api.id(41872376905978116)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_RNGO_DDA_DSDE,P38_RNGO_DDA_HSTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41860181502739907)
,p_name=>'Mostrar Tipo de Garantia Cuando requiere garantia sea S'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_INDCDOR_RQRE_GRNTIA'
,p_condition_element=>'P38_INDCDOR_RQRE_GRNTIA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41860695877739907)
,p_event_id=>wwv_flow_api.id(41860181502739907)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_NMRO_CTA_MNMA_RQRE_GRNTIA,P38_NMRO_UVT_MNMA_RQRE_GRNTIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41861168722739908)
,p_event_id=>wwv_flow_api.id(41860181502739907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_NMRO_CTA_MNMA_RQRE_GRNTIA,P38_NMRO_UVT_MNMA_RQRE_GRNTIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41856858255739906)
,p_name=>'Mostrar Tipo de Acto cuando Genera Acto de Incumplimiento de Cuotas sea s'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_INDCDOR_RVCTRIA_VGNCIA_FTRA'
,p_condition_element=>'P38_INDCDOR_RVCTRIA_VGNCIA_FTRA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41857363500739906)
,p_event_id=>wwv_flow_api.id(41856858255739906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CDGO_ACTO_TPO_RVCTRIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57183369974491606)
,p_event_id=>wwv_flow_api.id(41856858255739906)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CDGO_ACTO_TPO_RVCTRIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41855469133739905)
,p_name=>unistr('Mostrar de una o m\00E1s Vigencias')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_INDCDOR_EXGE_CTA_INCIAL'
,p_condition_element=>'P38_INDCDOR_EXGE_CTA_INCIAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41855931023739905)
,p_event_id=>wwv_flow_api.id(41855469133739905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CTA_INCIAL_VGNCIA_CNVNIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57182811144491601)
,p_event_id=>wwv_flow_api.id(41855469133739905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CTA_INCIAL_PRCNTJE,P38_INDCDOR_LMTA_PRCNTJE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27663065966462704)
,p_event_id=>wwv_flow_api.id(41855469133739905)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CTA_INCIAL_ABNO_TTAL_VGNCIA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'T'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41856465815739906)
,p_event_id=>wwv_flow_api.id(41855469133739905)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CTA_INCIAL_VGNCIA_CNVNIO,P38_CTA_INCIAL_ABNO_TTAL_VGNCIA,P38_CTA_INCIAL_PRCNTJE,P38_INDCDOR_LMTA_PRCNTJE,P38_CTA_INCIAL_PRCNTJE_MXMO,P38_CTA_INCIAL_PRCNTJE_MNMO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42041444821356530)
,p_event_id=>wwv_flow_api.id(41855469133739905)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_INDCDOR_LMTA_PRCNTJE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57183560811491608)
,p_event_id=>wwv_flow_api.id(41855469133739905)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CTA_INCIAL_ABNO_TTAL_VGNCIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41873851445978131)
,p_name=>'Mostrar Tipo de Acto cuando Genera Acto del Convenio sea s'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_INDCDOR_GNRA_ACTO_CNVNIO'
,p_condition_element=>'P38_INDCDOR_GNRA_ACTO_CNVNIO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41873965240978132)
,p_event_id=>wwv_flow_api.id(41873851445978131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_ID_ACTO_TPO_CNVNIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41874031206978133)
,p_event_id=>wwv_flow_api.id(41873851445978131)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_ID_ACTO_TPO_CNVNIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41874379475978136)
,p_name=>'Mostrar nmero max adicionar vigencia cuando ind_vrfca_dda es S'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_INDCDOR_PRMTE_ADCCNAR_VGNCIA'
,p_condition_element=>'P38_INDCDOR_PRMTE_ADCCNAR_VGNCIA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41874401906978137)
,p_event_id=>wwv_flow_api.id(41874379475978136)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_NMRO_MXMO_ADCCNAR_VGNCIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41874511580978138)
,p_event_id=>wwv_flow_api.id(41874379475978136)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_NMRO_MXMO_ADCCNAR_VGNCIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41875716066978150)
,p_name=>'Mostrar P_38_CUADRICULA_TPO_GRNTIA Cuando requiere garantia sea S'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_INDCDOR_RQRE_GRNTIA'
,p_condition_element=>'P38_INDCDOR_RQRE_GRNTIA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42038559340356501)
,p_event_id=>wwv_flow_api.id(41875716066978150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(41874745477978140)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42038625767356502)
,p_event_id=>wwv_flow_api.id(41875716066978150)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(41874745477978140)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42039481293356510)
,p_name=>'Mostrar si la cuota inicial es total o abono'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_CTA_INCIAL_VGNCIA_CNVNIO'
,p_condition_element=>'P38_CTA_INCIAL_VGNCIA_CNVNIO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42039658401356512)
,p_event_id=>wwv_flow_api.id(42039481293356510)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CTA_INCIAL_PRCNTJE_MNMO,P38_CTA_INCIAL_PRCNTJE_MXMO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43323762120292102)
,p_event_id=>wwv_flow_api.id(42039481293356510)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_INDCDOR_LMTA_PRCNTJE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42040531465356521)
,p_name=>'Mostrar limites de porcentaje'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_INDCDOR_LMTA_PRCNTJE'
,p_condition_element=>'P38_INDCDOR_LMTA_PRCNTJE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42040659447356522)
,p_event_id=>wwv_flow_api.id(42040531465356521)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CTA_INCIAL_PRCNTJE_MXMO,P38_CTA_INCIAL_PRCNTJE_MNMO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42040799867356523)
,p_event_id=>wwv_flow_api.id(42040531465356521)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CTA_INCIAL_PRCNTJE_MXMO,P38_CTA_INCIAL_PRCNTJE_MNMO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(43323869881292103)
,p_name=>'Nuevo'
,p_event_sequence=>120
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43323969834292104)
,p_event_id=>wwv_flow_api.id(43323869881292103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_CTA_INCIAL_ABNO_TTAL_VGNCIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46591657227325211)
,p_name=>unistr('Actualizar Regi\00F3n al cerrar la modal de atributos')
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(82949807459838810)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46591742887325212)
,p_event_id=>wwv_flow_api.id(46591657227325211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(82949807459838810)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(41854206324739904)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GF_D_CONVENIOS_TIPO'
,p_attribute_02=>'GF_D_CONVENIOS_TIPO'
,p_attribute_03=>'P38_ID_CNVNIO_TPO'
,p_attribute_04=>'ID_CNVNIO_TPO'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(41854635963739904)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GF_D_CONVENIOS_TIPO'
,p_attribute_02=>'GF_D_CONVENIOS_TIPO'
,p_attribute_03=>'P38_ID_CNVNIO_TPO'
,p_attribute_04=>'ID_CNVNIO_TPO'
,p_attribute_09=>'P38_ID_CNVNIO_TPO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Se han guardado los cambios.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(42038939574356505)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(41874745477978140)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('P_38_CUADRICULA_TPO_GRNTIA: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_only_for_changed_rows=>'N'
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(41855052675739904)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(41833448992739882)
);
end;
/
