prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>unistr('Generaci\00F3n de lotes')
,p_step_title=>unistr('Generaci\00F3n de lotes')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(30309424961578275)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250312170943'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39481728245368937)
,p_plug_name=>'Lote'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>unistr('<h5>Selecci\00F3n de lote</h5>')
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55324499369462502)
,p_plug_name=>'Edicto'
,p_parent_plug_id=>wwv_flow_api.id(39481728245368937)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30318497486578280)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''EDT'') --Edicto'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55324511671462503)
,p_plug_name=>'Gaceta'
,p_parent_plug_id=>wwv_flow_api.id(39481728245368937)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30318497486578280)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''GCT'') --Gaceta'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55324685180462504)
,p_plug_name=>'Prensa'
,p_parent_plug_id=>wwv_flow_api.id(39481728245368937)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30318497486578280)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''PSA'') --Prensa'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39928063949225520)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
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
 p_id=>wwv_flow_api.id(81023264187059322)
,p_plug_name=>'Detalle Lote'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct    b.id_acto,',
'                   b.nmro_acto,',
'                   b.cdgo_acto_orgen,',
'                   b.dscrpcion_acto_orgen,',
'                   b.id_acto_tpo,',
'                   b.dscrpcion_acto_tpo,',
'                   b.fcha',
'  from nt_d_lote_detalle a',
'  join v_nt_g_notfccnes_gn_g_actos b',
'    on a.id_acto = b.id_acto',
' where a.id_lte = :P13_ID_LTE',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P13_ID_LTE'
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
 p_id=>wwv_flow_api.id(80898855238115758)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:13:&SESSION.:DELETE:&DEBUG.:RP,13:P13_ID_ACTO,P13_ID_LTE:#ID_ACTO#,&P13_ID_LTE.'
,p_detail_link_text=>'<span aria-hidden="true" class="fa fa-rotate-left" style="color: #d22204;" alt="Revertir"></span>'
,p_owner=>'JCUAO'
,p_internal_uid=>80898855238115758
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40825213170902439)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Id Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40825668962902442)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'No. Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40826056480902443)
,p_db_column_name=>'CDGO_ACTO_ORGEN'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Cdgo Acto Orgen'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40826473090902443)
,p_db_column_name=>'DSCRPCION_ACTO_ORGEN'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40827251508902443)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40699327631487807)
,p_db_column_name=>'FCHA'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Fcha'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84569266151081101)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(81053856726312518)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'408288'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ACTO:NMRO_ACTO:CDGO_ACTO_ORGEN:DSCRPCION_ACTO_ORGEN:DSCRPCION_ACTO_TPO:ID_ACTO_TPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(214890470156789569)
,p_plug_name=>unistr('Medios de Notificaci\00F3n')
,p_region_name=>'badgeListColor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_mdio, ',
'        a.dscrpcion_mdio,',
'        a.id_mdio,',
'        count(*) cantidad',
'from v_nt_g_notificaciones_detalle a',
'inner join nt_d_medio b on a.id_mdio = b.id_mdio and',
'                           b.indcdor_msvo = ''S''',
'where a.id_entdad_clnte_mdio is null and',
'      a.id_fncnrio_prcsmnto  is null and',
'      trunc(a.fcha_fin_trmno) >= trunc(sysdate) and',
'      a.cantdad_respnsbles_notfcdos = 0 and',
'      a.id_ntfccion in (select id_ntfccion',
'                        from nt_g_notificaciones',
'                        where indcdor_ntfcdo = ''N'')',
'group by a.cdgo_mdio, a.dscrpcion_mdio, a.id_mdio'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CANTIDAD'
,p_attribute_04=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,30:P30_ID_MDIO:&ID_MDIO.'
,p_attribute_05=>'4'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'DSCRPCION_MDIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(267507857204023014)
,p_plug_name=>'ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite:',
unistr('1. La creaci\00F3n r\00E1pida de lotes.<br>'),
unistr('2. La adici\00F3n de actos al lote creado.<br>'),
unistr('3. Confirmaci\00F3n del lote.<br>'),
'<br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40880222728224827)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(39928063949225520)
,p_button_name=>'BTN_CREAR_LOTE'
,p_button_static_id=>'btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39929029769225530)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(39928063949225520)
,p_button_name=>'BTN_ADICIONAR'
,p_button_static_id=>'btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Adicionar Actos'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition=>'P13_ID_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-address-book-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52873662919352212)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(39928063949225520)
,p_button_name=>'BTN_IMPRIMIR_EDICTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Imprimir Edicto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''EDT'') --Edicto'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40299040074113615)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(39928063949225520)
,p_button_name=>'BTN_CNFRMAR_LTE'
,p_button_static_id=>'btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Confirmar Lote'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P13_ID_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(38414510399757543)
,p_branch_name=>'ir a la pagina 15'
,p_branch_action=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP,15:P15_ID_LTE:&P13_ID_LTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(39929029769225530)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(53252603219734049)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP,2:P2_ID_RPRTE,P2_XML:51,&P13_XML.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(52873662919352212)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(115654374972865728)
,p_branch_name=>unistr('Ir a P\00E1gina 22')
,p_branch_action=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22,13:P22_ID_LOTE,P22_BRANCH,P22_VER_RGRESAR_LTES:&P13_ID_LTE.,&APP_PAGE_ID.,S&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(40299040074113615)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39927726803225517)
,p_name=>'P13_ID_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(39481728245368937)
,p_prompt=>'Lote'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_lte||'' - ''||dscrpcion d, id_lte r ',
'from  nt_g_lote',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      id_fncnrio_gnrcion = :F_ID_FNCNRIO and',
'      cdgo_estdo_lte = ''GEN'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40829644621902450)
,p_name=>'P13_ACTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(81023264187059322)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40830031461902450)
,p_name=>'P13_ID_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(81023264187059322)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52873032406352206)
,p_name=>'P13_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(55324499369462502)
,p_prompt=>unistr('Fecha y Hora Fijaci\00F3n')
,p_format_mask=>'DD/MM/YYYY HH:MI:SS AM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52873107955352207)
,p_name=>'P13_UBCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(55324499369462502)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52873465226352210)
,p_name=>'P13_FILE_EVDNCIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(39481728245368937)
,p_prompt=>'Evidencia'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_colspan=>4
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      in (''EDT'',''GCT'', ''PSA'')) --Edicto, Gaceta, Prensa'))
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(30391853713578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'image/*,application/pdf'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52876709353352243)
,p_name=>'P13_XML'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(55324499369462502)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''EDT'') --Edicto'))
,p_display_when_type=>'SQL_EXPRESSION'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52876958428352245)
,p_name=>'P13_FCHA_PBLCCION_GCTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(55324511671462503)
,p_prompt=>unistr('Fecha de Publicaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_attributes=>' onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52877057713352246)
,p_name=>'P13_NMRO_GCETA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(55324511671462503)
,p_prompt=>'No. Gaceta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55324793017462505)
,p_name=>'P13_UBCCION_PRNSA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(55324685180462504)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55324815561462506)
,p_name=>'P13_FCHA_RGSTRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(55324685180462504)
,p_prompt=>unistr('Fecha de Reg\00EDstro')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52873249913352208)
,p_validation_name=>unistr('Valida si la ubicaci\00F3n esta vac\00EDa al Imprimir Edicto')
,p_validation_sequence=>10
,p_validation=>'P13_UBCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# Vac\00EDo, por favor verifique!')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''EDT'') --Edicto'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(52873662919352212)
,p_associated_item=>wwv_flow_api.id(52873107955352207)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52873749894352213)
,p_validation_name=>unistr('Valida si la ubicaci\00F3n esta vac\00EDa al Confirmar Lote')
,p_validation_sequence=>20
,p_validation=>'P13_UBCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# Vac\00EDo, por favor verifique!')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''EDT'') --Edicto'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(40299040074113615)
,p_associated_item=>wwv_flow_api.id(52873107955352207)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52873312146352209)
,p_validation_name=>unistr('Valida si fecha de fijaci\00F3n esta vac\00EDa al Imprimir Edicto')
,p_validation_sequence=>30
,p_validation=>'P13_FCHA_INCIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# Vac\00EDo, por favor verifique!')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''EDT'') --Edicto'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(52873662919352212)
,p_associated_item=>wwv_flow_api.id(52873032406352206)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52873870015352214)
,p_validation_name=>unistr('Valida si fecha de fijaci\00F3n esta vac\00EDa al Confirmar Lote')
,p_validation_sequence=>40
,p_validation=>'P13_FCHA_INCIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# Vac\00EDo, por favor verifique!')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''EDT'') --Edicto'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(40299040074113615)
,p_associated_item=>wwv_flow_api.id(52873032406352206)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52873551398352211)
,p_validation_name=>'Valida si la evidencia esta vacia al Confirmar Lote'
,p_validation_sequence=>50
,p_validation=>'P13_FILE_EVDNCIA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# Vac\00EDo, por favor verifique!')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      in (''EDT'',''GCT'', ''PSA'')) --Edicto, Gaceta, Prensa'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(40299040074113615)
,p_associated_item=>wwv_flow_api.id(52873465226352210)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52876499792352240)
,p_validation_name=>'Valida actos al Imprimir Edicto'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (',
'    select b.id_acto,',
'           b.nmro_acto,',
'           b.cdgo_acto_orgen,',
'           b.dscrpcion_acto_orgen,',
'           b.id_acto_tpo,',
'           b.dscrpcion_acto_tpo,',
'           b.fcha',
'  from nt_d_lote_detalle a',
'  join v_nt_g_notfccnes_gn_g_actos b',
'    on a.id_acto = b.id_acto',
' where a.id_lte = :P13_ID_LTE',
');'))
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'Problemas al Imprimir Edicto, por favor adicione actos al lote'
,p_when_button_pressed=>wwv_flow_api.id(52873662919352212)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52877105210352247)
,p_validation_name=>unistr('Valida fecha de publicaci\00F3n al Confirmar Lote')
,p_validation_sequence=>70
,p_validation=>'P13_FCHA_PBLCCION_GCTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# Vac\00EDo, por favor verifique!')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''GCT'') --Gaceta'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(40299040074113615)
,p_associated_item=>wwv_flow_api.id(52876958428352245)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52877272980352248)
,p_validation_name=>'Valida no. gaceta al Confirmar Lote'
,p_validation_sequence=>80
,p_validation=>'P13_NMRO_GCETA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# Vac\00EDo, por favor verifique!')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''GCT'') --Gaceta'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(40299040074113615)
,p_associated_item=>wwv_flow_api.id(52877057713352246)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(55324945868462507)
,p_validation_name=>unistr('Valida Ubicaci\00F3n Prensa al Confirmar Lote')
,p_validation_sequence=>90
,p_validation=>'P13_UBCCION_PRNSA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# Vac\00EDo, por favor verifique!')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''PSA'') --Prensa'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(40299040074113615)
,p_associated_item=>wwv_flow_api.id(55324793017462505)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(55325010254462508)
,p_validation_name=>unistr('Valida Fecha Reg\00EDstro Prensa al Confirmar Lote_1')
,p_validation_sequence=>100
,p_validation=>'P13_FCHA_RGSTRO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# Vac\00EDo, por favor verifique!')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P13_ID_LTE and',
'              b.cdgo_mdio      = ''PSA'') --Prensa'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(40299040074113615)
,p_associated_item=>wwv_flow_api.id(55324815561462506)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40075440424213347)
,p_name=>unistr('Al Cerrar Modal De Adici\00F3n de Actos Actualiza')
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40699637506487810)
,p_event_id=>wwv_flow_api.id(40075440424213347)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(81023264187059322)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40878095701197021)
,p_name=>unistr('Boton Adicionar Actos: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39929029769225530)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40878427916197023)
,p_event_id=>wwv_flow_api.id(40878095701197021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_ID_LTE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40882523917229557)
,p_name=>unistr('Crear Bot\00F3n: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(40880222728224827)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40882923847229557)
,p_event_id=>wwv_flow_api.id(40882523917229557)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_ID_LTE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40830579822905898)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Elimina acto en detalle'
,p_process_sql_clob=>'DELETE NT_D_LOTE_DETALLE WHERE ID_LTE = :P13_ID_LTE AND ID_ACTO = :P13_ID_ACTO;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40438270066839602)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Confirmar Lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_tpo varchar2(20);',
'    v_mnsje     varchar2(3000);',
'    v_cdgo_mdio nt_d_medio.cdgo_mdio%type;',
'    v_error exception;',
'begin',
'    --Consultamos el Medio Asociado al Lote',
'    begin',
'        select b.cdgo_mdio',
'        into v_cdgo_mdio',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte = :P13_ID_LTE;',
'    exception',
'        when no_data_found then',
unistr('            v_mnsje := ''Problemas al consultar Medio de Notificaci\00F3n Asociado al Lote, ''||SQLERRM;'),
'            raise v_error;',
'    end;',
'    ',
'    pkg_nt_notificacion.prc_ac_lote(',
'        p_id_lote       => :P13_ID_LTE,',
'        p_id_fncnrio    => :F_ID_FNCNRIO,',
'        o_mnsje_tpo     => v_mnsje_tpo,',
'        o_mnsje         => v_mnsje',
'    );',
'    ',
'    if(v_mnsje_tpo = ''ERROR'') then',
'        raise v_error;',
'    end if;',
'    ',
'    --EDT - Edicto',
'    if(v_cdgo_mdio = ''EDT'')then',
'        pkg_nt_notificacion.prc_rg_edicto(',
'            p_id_lte                => :P13_ID_LTE,',
'            p_fcha_incio            => :P13_FCHA_INCIO,',
'            p_ubccion               => :P13_UBCCION,',
'            p_file_evdncia          => :P13_FILE_EVDNCIA,',
'            p_id_fncnrio            => :F_ID_FNCNRIO,',
'            o_mnsje_tpo             => v_mnsje_tpo,',
'            o_mnsje                 => v_mnsje',
'        );',
'    --GCT - GACETA',
'    elsif(v_cdgo_mdio = ''GCT'')then',
'        pkg_nt_notificacion.prc_rg_gaceta(',
'            p_id_lte                => :P13_ID_LTE,',
'            p_nmro_gceta            => :P13_NMRO_GCETA,',
'            p_fcha_pblccion         => :P13_FCHA_PBLCCION_GCTA,',
'            p_file_evdncia          => :P13_FILE_EVDNCIA,',
'            p_id_fncnrio            => :F_ID_FNCNRIO,',
'            o_mnsje_tpo             => v_mnsje_tpo,',
'            o_mnsje                 => v_mnsje',
'        );',
'    --PSA -PRENSA',
'    elsif(v_cdgo_mdio = ''PSA'')then',
'        pkg_nt_notificacion.prc_rg_prensa(',
'            p_id_lte                => :P13_ID_LTE,',
'            p_ubccion               => :P13_UBCCION_PRNSA,',
'            p_fcha_rgstro           => :P13_FCHA_RGSTRO,',
'            p_file_evdncia          => :P13_FILE_EVDNCIA,',
'            p_id_fncnrio            => :F_ID_FNCNRIO,',
'            o_mnsje_tpo             => v_mnsje_tpo,',
'            o_mnsje                 => v_mnsje',
'        );',
'    end if;',
'    ',
'    if(v_mnsje_tpo = ''ERROR'') then',
'        raise v_error;',
'    end if;',
'    ',
'exception',
'    when v_error then',
'        rollback;',
'        raise_application_error (-20000,v_mnsje);   ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(40299040074113615)
,p_process_success_message=>'Lote Procesado Exitosamente!'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52876662837352242)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Genera XML y Codifica los Caracteres Especiales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P13_XML := --apex_util.url_encode (',
'        /*p_url => */ ',
'        ''<data><id_lte>''||:P13_ID_LTE||''</id_lte>''|| ',
'        ''<ubicacion>''||:P13_UBCCION||''</ubicacion>''||',
'        ''<fecha_inicio>''||to_char(to_date(:P13_FCHA_INCIO, ''DD/MM/YYYY HH:MI:SS AM''),''YYYYMMDDHHMISSAM'')||''</fecha_inicio></data>'';',
'    --);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(52873662919352212)
);
null;
end;
/
