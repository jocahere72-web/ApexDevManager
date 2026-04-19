prompt --application/pages/page_00304
begin
wwv_flow_api.create_page(
 p_id=>304
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n Documentos Migrados')
,p_step_title=>unistr('Gesti\00F3n Documentos Migrados')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20201126161232'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98720880485446201)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98721165259446204)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(98720880485446201)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P304_ID_SJTO_IMPSTO'
,p_attribute_01=>'P304_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98721498765446207)
,p_plug_name=>'Parametros'
,p_parent_plug_id=>wwv_flow_api.id(98720880485446201)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98721754367446210)
,p_plug_name=>'Documento'
,p_parent_plug_id=>wwv_flow_api.id(98720880485446201)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dcmnto,',
'       a.nmbre_impsto_sbmpsto,',
'       a.nmro_dcmnto,',
'       to_char(a.fcha_dcmnto, ''DD/MM/YYYY'') as fcha_dcmnto,',
'       to_char(a.fcha_vncmnto, ''DD/MM/YYYY'') as fcha_vncmnto,',
'       a.vlor_ttal_dcmnto,',
'       decode(a.indcdor_pgo_aplcdo, ''N'', ''No Aplicado'', ''Aplicado'') as indcdor_pgo_aplcdo',
'from v_re_g_documentos a',
'where a.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_sjto_impsto = :P304_ID_SJTO_IMPSTO ',
'and a.indcdor_pgo_aplcdo = ''N''',
'--and extract( year from to_date( to_char(a.fcha_dcmnto, ''DD/MM/YYYY''),  ''DD-MM-YYYY'' )) < :P304_VGNCIA_ACTUAL;'))
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
 p_id=>wwv_flow_api.id(98721809391446211)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:308:&SESSION.::&DEBUG.:RP,308:P308_ID_DCMNTO,P308_ID_SJTO_IMPSTO,P308_NMRO_DCMNTO,P308_NMRO_DCMNTO_VSUAL:#ID_DCMNTO#,&P304_ID_SJTO_IMPSTO.,#NMRO_DCMNTO#,#NMRO_DCMNTO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'LTORRES'
,p_internal_uid=>98721809391446211
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98721925934446212)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98722014748446213)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98722187798446214)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'N# Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98722271982446215)
,p_db_column_name=>'FCHA_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98722365759446216)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98722419212446217)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98722631077446219)
,p_db_column_name=>'INDCDOR_PGO_APLCDO'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFAplicado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(98747935328800238)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'987480'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO:NMBRE_IMPSTO_SBMPSTO:NMRO_DCMNTO:FCHA_DCMNTO:FCHA_VNCMNTO:VLOR_TTAL_DCMNTO:INDCDOR_PGO_APLCDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(278669312809690624)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(278672131539692519)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'',
'<p align="justify">',
'<i>Funcionalidad que permite consultar los documentos de un sujeto impuesto</i>',
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98739185232714920)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(278669312809690624)
,p_button_name=>'Btn_nuevo_documento'
,p_button_static_id=>'confirmar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Documento'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:308:&SESSION.::&DEBUG.:RP,308:P308_ID_SJTO_IMPSTO:&P304_ID_SJTO_IMPSTO.'
,p_icon_css_classes=>'fa-file-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98727970791495614)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(98721498765446207)
,p_button_name=>'BTN_CONSULTAR'
,p_button_static_id=>'cnsltar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>6
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98720996804446202)
,p_name=>'P304_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98721498765446207)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98721018011446203)
,p_name=>'P304_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(98721498765446207)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98722790848446220)
,p_name=>'P304_VGNCIA_ACTUAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(98721498765446207)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98721636779446209)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select id_sjto_impsto',
'    into :P304_ID_SJTO_IMPSTO',
'    from v_si_i_sujetos_impuesto',
'    where cdgo_clnte = :F_CDGO_CLNTE',
'    and idntfccion_sjto = :P304_IDNTFCCION;',
'',
'exception',
'    when others then',
'        :P304_ID_SJTO_IMPSTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(98727970791495614)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98722982745446222)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener Vigencia Actual'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''GFN'', p_cdgo_dfncion_clnte => ''VAC'') ',
'    into :P304_VGNCIA_ACTUAL',
'    from dual;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
