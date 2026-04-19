prompt --application/pages/page_00184
begin
wwv_flow_api.create_page(
 p_id=>184
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro Revocatoria'
,p_page_mode=>'MODAL'
,p_step_title=>'Registro Revocatoria de Acuerdos de Pago'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P184_DCMNTO_DISPLAY{',
'    width: 99% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107172087078634001)
,p_plug_name=>'registro'
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
 p_id=>wwv_flow_api.id(338175127764443236)
,p_plug_name=>'Acuerdos de Pago Revocados'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio,',
'       a.idntfccion_sjto_frmtda,',
'       a.nmro_cnvnio,',
'       to_char(a.fcha_slctud, ''DD/MM/YYYY'') fcha_slctud,',
'       a.nmro_idntfccion_slctnte,',
'       a.nmbre_slctnte,       ',
'       a.dscrpcion_cnvnio_tpo,',
'       b.id_acto',
'  from v_gf_g_convenios a',
'  join gf_g_convenios_revocatoria b on a.id_cnvnio = b.id_cnvnio',
'  join gf_g_convenios_documentos c on b.id_acto = c.id_acto',
'  join (select id_cnvnio',
'          from json_table (:P175_ID_CNVNIO, ''$[*]'' columns id_cnvnio path ''$.ID_CNVNIO'')) d on a.id_cnvnio = d.id_cnvnio',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and c.id_plntlla = :P184_ID_PLNTLLA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_gf_g_convenios_revocatoria a',
'  join (select id_cnvnio',
'          from json_table (:P175_ID_CNVNIO, ''$[*]'' columns id_cnvnio path ''$.ID_CNVNIO'')) d on a.id_cnvnio = d.id_cnvnio',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_cnvnio_rvctria_estdo = ''RGS'''))
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
 p_id=>wwv_flow_api.id(33491982404634706)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>33491982404634706
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33492022807634707)
,p_db_column_name=>'ID_CNVNIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Cnvnio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33492151945634708)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33492212275634709)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00B0 Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33492307743634710)
,p_db_column_name=>'FCHA_SLCTUD'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha <br> Solicitud'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33492452392634711)
,p_db_column_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n Solicitante')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33492575378634712)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Solicitante'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33492685088634713)
,p_db_column_name=>'DSCRPCION_CNVNIO_TPO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Tipo Acuerdo de Pago'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33492707476634714)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Acto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:V_GN_G_ACTOS:FILE_BLOB:ID_ACTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(33549280839978607)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'335493'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CNVNIO:IDNTFCCION_SJTO_FRMTDA:DSCRPCION_CNVNIO_TPO:FCHA_SLCTUD:NMRO_IDNTFCCION_SLCTNTE:NMBRE_SLCTNTE:ID_ACTO:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107172201609634003)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(107172087078634001)
,p_button_name=>'BTN_REGISTRAR_REVOCATORIA'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Revocatoria'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Registrar Revocatoria de Acuerdo de Pago?'',''BTN_REGISTRAR_REVOCATORIA'')'
,p_button_execute_validations=>'N'
,p_button_condition=>':P184_RSPSTA is null and :P184_ID_PLNTLLA is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(17794712926330902)
,p_branch_name=>unistr('Ir a la p\00E1gina de consulta 175')
,p_branch_action=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(107172201609634003)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50164772290213310)
,p_name=>'P184_ID_ACTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(107172087078634001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50286334928784001)
,p_name=>'P184_DCMNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(107172087078634001)
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.width = ''100%'';',
'    opt.height = 400;',
'    opt.resize_enabled = false; ',
'    opt.readOnly = true;',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return opt;',
'}',
''))
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107172170850634002)
,p_name=>'P184_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(107172087078634001)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion',
'        , a.id_plntlla',
'     from gn_d_plantillas           a',
'     join gf_d_revocatoria_metodo   b on a.id_acto_tpo  = b.id_acto_tpo_rvctria',
'    where b.id_rvctria_mtdo         = :P175_ID_RVCTRIA_MTDO'))
,p_lov_display_null=>'YES'
,p_colspan=>9
,p_read_only_when=>'P184_RSPSTA'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la plantilla de acto a generar en la revocatoria de acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108027274615890701)
,p_name=>'P184_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(107172087078634001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50164375072213306)
,p_name=>'Al Cambiar Plantilla'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P184_ID_PLNTLLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50164462491213307)
,p_event_id=>wwv_flow_api.id(50164375072213306)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107196672634932501)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Revocatoria Acuerdo de Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta    number;',
'',
'begin ',
'',
'    pkg_gf_convenios.prc_rg_rvctria_acrdo_pgo_msvo( p_cdgo_clnte     		=>    :F_CDGO_CLNTE,',
'                                                    p_cdna_cnvnio    		=>    :P175_ID_CNVNIO,',
'                                                    p_id_usrio       		=>    :F_ID_USRIO,',
'                                                    p_id_plntlla     		=>    :P184_ID_PLNTLLA,',
'                                                    p_id_rvctria_mtdo		=>    :P175_ID_RVCTRIA_MTDO,',
'                                                    o_cdgo_rspsta    		=>    v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta   		=>    :P184_RSPSTA);',
'     if v_cdgo_rspsta != 0 then ',
'              raise_application_error(-20001, :P184_RSPSTA);',
'     end if;    ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(107172201609634003)
,p_process_success_message=>'&P184_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50165042306213313)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr(' Cargar P\00E1rrafo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_prrfos in (select prrfo',
'                      from gn_d_plantillas_parrafo',
'                    where id_plntlla = :P184_ID_PLNTLLA ) loop',
'                    ',
'        :P184_DCMNTO := :P184_DCMNTO || c_prrfos.prrfo;',
'        ',
'    end loop;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P184_ID_PLNTLLA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
