prompt --application/pages/page_00045
begin
wwv_flow_api.create_page(
 p_id=>45
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr('Certificado Declaraci\00F3n ')
,p_step_title=>unistr('Certificado Declaraci\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>' ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210531161735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71020654373164133)
,p_plug_name=>'Sujeto impuesto'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35731364179290406)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P45_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71021403518164141)
,p_plug_name=>'Declaraciones'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dclrcion',
'     , a.id_impsto',
'     , a.id_impsto_sbmpsto',
'     , a.nmro_cnsctvo',
'     , a.fcha_rgstro',
'     , a.cdgo_dclrcion_estdo',
'     , a.fcha_prsntcion          ',
'     , b.vlor',
'     , b.fcha_rcdo',
'  from gi_g_declaraciones a',
'  left join re_g_recaudos      b  on a.id_rcdo = b.id_rcdo',
'                                 and b.cdgo_rcdo_estdo =  ''AP''',
'where a.cdgo_clnte          =  :F_CDGO_CLNTE',
'  and a.id_sjto_impsto      =  :P45_ID_SJTO_IMPSTO  ',
'  and a.cdgo_dclrcion_estdo = nvl(:P45_CLRCION_STDO, a.cdgo_dclrcion_estdo)',
'  and a.nmro_cnsctvo        =  nvl(:P45_NMRO_DCLRCION, a.nmro_cnsctvo)',
'  and (a.fcha_prsntcion     >= :P45_FCHA_PRSNTCION_IN  or :P45_FCHA_PRSNTCION_IN  is null ) ',
'  and (a.fcha_prsntcion     <= :P45_FCHA_PRSNTCION_FIN or :P45_FCHA_PRSNTCION_FIN is null );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27492372257010909)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(27492490108010910)
,p_name=>'FCHA_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Recaudo '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(27492544882010911)
,p_name=>'ID_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span class="fa fa-eye" aria-hidden="true"></span>'
,p_link_target=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP:P34_ID_DCLRCION,P34_ID_SJTO_IMPSTO,P34_NMRO_DCLRCION:&ID_DCLRCION.,&P45_ID_SJTO_IMPSTO.,&NMRO_CNSCTVO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71021688256164143)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(71021744826164144)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(71021863922164145)
,p_name=>'NMRO_CNSCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNSCTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Declaraci\00F3n ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(71021940365164146)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Registro  Declaraci\00F3n ')
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
 p_id=>wwv_flow_api.id(71022030609164147)
,p_name=>'CDGO_DCLRCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_DCLRCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Estado Declaraci\00F3n ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>unistr('STATIC:Registrada;REG,Autorizada;AUT,Presentada;PRS,Correcci\00F3n;COR,Aplicada;APL,Firme;FRM,Anulada;ANU')
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
 p_id=>wwv_flow_api.id(71022131180164148)
,p_name=>'FCHA_PRSNTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRSNTCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Presentaci\00F3n Declaraci\00F3n ')
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(71021557190164142)
,p_internal_uid=>71021557190164142
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
 p_id=>wwv_flow_api.id(71504701687082780)
,p_interactive_grid_id=>wwv_flow_api.id(71021557190164142)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(71504832049082781)
,p_report_id=>wwv_flow_api.id(71504701687082780)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27528421892351906)
,p_view_id=>wwv_flow_api.id(71504832049082781)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(27492372257010909)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123.88900000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27529072308351908)
,p_view_id=>wwv_flow_api.id(71504832049082781)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(27492490108010910)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27530947518357056)
,p_view_id=>wwv_flow_api.id(71504832049082781)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(27492544882010911)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70.22200000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71505228245082790)
,p_view_id=>wwv_flow_api.id(71504832049082781)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(71021688256164143)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71505728217082796)
,p_view_id=>wwv_flow_api.id(71504832049082781)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(71021744826164144)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71506201375082798)
,p_view_id=>wwv_flow_api.id(71504832049082781)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(71021863922164145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71506753281082800)
,p_view_id=>wwv_flow_api.id(71504832049082781)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(71021940365164146)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191.333
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71507262932082802)
,p_view_id=>wwv_flow_api.id(71504832049082781)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(71022030609164147)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>213
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71507723804082803)
,p_view_id=>wwv_flow_api.id(71504832049082781)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(71022131180164148)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>227
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115272523053506685)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
unistr('Funcionalidad que permite consultar las Declaraciones de Delineaci\00F3n Urbana asociadas a un Sujeto y Generar un certificado a aquellas declaraciones que fueron presentadas y pagadas.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'</i>',
'',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27492297667010908)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(71021403518164141)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71021318783164140)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(71020654373164133)
,p_button_name=>'Btn_consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71021084112164137)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(71020654373164133)
,p_button_name=>'Btn_consulta_por_parametros'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_image_alt=>unistr('Consulta Por Par\00E1metros')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(71021160685164138)
,p_branch_name=>unistr('Ir a P\00E1gina 3')
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_PGNA,P3_NMRO_APP,P3_NMBRE_ITEM_SBIMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM,P3_IMPSTO_SBMPSTO,P3_ID_IMPSTO:&APP_PAGE_ID.,&APP_ID.,P45_ID_IMPSTO_SBIMPSTO,P45_ID_IMPSTO,P45_ID_SJTO_IMPSTO,&P45_ID_IMPSTO_SBIMPSTO.,&P45_ID_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(71021084112164137)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27491801604010904)
,p_name=>'P45_NMRO_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(71021403518164141)
,p_prompt=>unistr('N\00B0 Declaraci\00F3n: ')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27491978178010905)
,p_name=>'P45_CLRCION_STDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71021403518164141)
,p_prompt=>'Estado:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:Registrada;REG,Autorizada;AUT,Presentada;PRS,Correcci\00F3n ;COR,Aplicada;APL,Firme;FRM,Anulada;ANU')
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27492038183010906)
,p_name=>'P45_FCHA_PRSNTCION_IN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(71021403518164141)
,p_prompt=>unistr('Fecha Presentaci\00F3n Inicial:')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27492114783010907)
,p_name=>'P45_FCHA_PRSNTCION_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(71021403518164141)
,p_prompt=>unistr('Fecha Presentaci\00F3n Final:')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P45_FCHA_PRSNTCION_IN.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71020744821164134)
,p_name=>'P45_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(71020654373164133)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71020818478164135)
,p_name=>'P45_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71020654373164133)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
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
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71020947321164136)
,p_name=>'P45_ID_IMPSTO_SBIMPSTO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(71020654373164133)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto as d',
'     , id_impsto_sbmpsto       as r',
'  from df_i_impuestos_subimpuesto',
'  where id_impsto = :P45_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P45_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71021283897164139)
,p_name=>'P45_IDNTFCCION_PRMT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(71020654373164133)
,p_prompt=>unistr('Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71508937679119801)
,p_name=>'P45_RSPSTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(71020654373164133)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71509062632119802)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Por identificaci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_sjto    idntfccion_sjto        ',
'  into :P45_IDNTFCCION_PRMT',
'  from V_SI_I_SUJETOS_IMPUESTO a',
' where a.id_sjto_impsto = :P45_ID_SJTO_IMPSTO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71022346307164150)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto X boton consultar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_estdo_blqdo_sjto      si_i_sujetos_impuesto.estdo_blqdo%type;',
'    v_id_sjto_estdo       si_i_sujetos_impuesto.id_sjto_estdo%type;',
'    ',
'begin',
'    select id_sjto_impsto,     estdo_blqdo_sjto,   id_sjto_estdo',
'      into v_id_sjto_impsto,   v_estdo_blqdo_sjto, v_id_sjto_estdo',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte    = :F_CDGO_CLNTE',
'       and (id_impsto    = :P45_ID_IMPSTO or :P45_ID_IMPSTO is null)',
'       and (idntfccion_sjto    = :P45_IDNTFCCION_PRMT or idntfccion_antrior = :P45_IDNTFCCION_PRMT);',
'    ',
'    if v_estdo_blqdo_sjto = ''N'' and v_id_sjto_estdo = 1 then ',
'        :P45_RSPSTA := '''';',
'        :P45_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'        ',
'    elsif v_estdo_blqdo_sjto = ''S'' then',
'        :P45_RSPSTA := ''El sujeto impuesto ingresado se encuentra bloqueado'';',
'        :P45_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    elsif v_id_sjto_estdo != 1 then',
'        :P45_RSPSTA := ''El sujeto impuesto ingresado No se encuentra activo'';',
'        :P45_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    end if;',
'exception',
'    when no_data_found then ',
'    :P45_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    :P45_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end; '))
,p_process_error_message=>'&P45_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(71021318783164140)
,p_process_success_message=>'&P45_RSPSTA.'
);
end;
/
