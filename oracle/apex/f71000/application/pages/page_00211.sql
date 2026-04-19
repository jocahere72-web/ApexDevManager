prompt --application/pages/page_00211
begin
wwv_flow_api.create_page(
 p_id=>211
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Anulaci\00F3n de Revocatoria de Acuerdo de Pago')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Anulaci\00F3n de Revocatoria de Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P211_DCMNTO_DISPLAY{',
'    width: 99% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33494014286634727)
,p_plug_name=>'Revocatoria Acuerdos Anulados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio,',
'       a.idntfccion_sjto,',
'       a.nmro_cnvnio,',
'       a.fcha_anlcion,',
'       a.nmro_idntfccion_slctnte,',
'       a.nmbre_slctnte,',
'       initcap(a.dscrpcion_cnvnio_rvctria_estdo) dscrpcion_cnvnio_rvctria_estdo,',
'       a.id_acto_anlcion',
'  from v_gf_g_convenios_revocatoria a ',
'  join gf_g_convenios_documentos    b on a.id_cnvnio = b.id_cnvnio and a.id_acto_anlcion= b.id_acto',
'  join (select id_cnvnio',
'          from json_table(:P186_ID_CNVNIO,''$[*]''columns id_cnvnio PATH ''$.ID_CNVNIO'')) c on a.id_cnvnio = c.id_cnvnio',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_cnvnio_rvctria_estdo = ''ANL'';',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gf_g_convenios_revocatoria  a ',
'  join gf_g_convenios_documentos   b on a.id_cnvnio = b.id_cnvnio and a.id_acto_anlcion= b.id_acto',
'  join (select id_cnvnio',
'          from json_table(:P186_ID_CNVNIO,''$[*]''columns id_cnvnio PATH ''$.ID_CNVNIO'')) c on a.id_cnvnio = c.id_cnvnio',
' where a.cdgo_cnvnio_rvctria_estdo = ''ANL'';'))
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
 p_id=>wwv_flow_api.id(33494186217634728)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>33494186217634728
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33494227390634729)
,p_db_column_name=>'ID_CNVNIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Cnvnio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33494398472634730)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n <br>Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33494488070634731)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00B0 Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33494574903634732)
,p_db_column_name=>'FCHA_ANLCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Fecha <br>Anulaci\00F3n')
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33494678957634733)
,p_db_column_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n <br>Solicitante')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33494780875634734)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Solicitante'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33494883859634735)
,p_db_column_name=>'DSCRPCION_CNVNIO_RVCTRIA_ESTDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33494975072634736)
,p_db_column_name=>'ID_ACTO_ANLCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(33638899956633719)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'336389'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FCHA_ANLCION:NMRO_CNVNIO:IDNTFCCION_SJTO:NMRO_IDNTFCCION_SLCTNTE:NMBRE_SLCTNTE:DSCRPCION_CNVNIO_RVCTRIA_ESTDO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220985907960387924)
,p_plug_name=>unistr('Anulaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113814148718753923)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(220985907960387924)
,p_button_name=>'BTN_ANULAR_REVOCATORIA'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anular Revocatoria'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Anular Revocatoria de Acuerdo de Pago?'',''BTN_ANULAR_REVOCATORIA'')'
,p_button_execute_validations=>'N'
,p_button_condition=>':P211_RSPSTA is null and :P211_ID_PLNTLLA is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-times-square-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55136151045609901)
,p_name=>'P211_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(220985907960387924)
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
 p_id=>wwv_flow_api.id(113814541693753924)
,p_name=>'P211_ID_PLNTLLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(220985907960387924)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion, ',
'       a.id_plntlla',
'  from gn_d_plantillas a',
'  join gn_d_reportes b',
'    on a.id_rprte = b.id_rprte',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_prcso in (select id_prcso',
'                        from df_s_procesos ',
'                       where id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente (:F_CDGO_CLNTE, ''ACP'', ''ARA''))'))
,p_lov_display_null=>'YES'
,p_colspan=>9
,p_read_only_when=>'P211_RSPSTA'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la plantilla de acto a generar en la anulaci\00F3n de revocatoria de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113814916560753924)
,p_name=>'P211_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(220985907960387924)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55136202617609902)
,p_name=>'Al Cambiar Plantilla'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211_ID_PLNTLLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55136321737609903)
,p_event_id=>wwv_flow_api.id(55136202617609902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113732351365193405)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular  Revocatoria de Acuerdos de Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta number;',
'begin ',
'    ',
'    pkg_gf_convenios.prc_an_rvctria_acrdo_pgo_msvo(p_cdgo_clnte   =>     :F_CDGO_CLNTE,',
'											       p_json_cnvnio  =>     :P186_ID_CNVNIO,',
'                                                   p_id_plntlla   =>     :P211_ID_PLNTLLA,',
'											       p_id_usrio     =>     :F_ID_USRIO,',
'											       o_cdgo_rspsta  =>     v_cdgo_rspsta,',
'											       o_mnsje_rspsta =>     :P211_RSPSTA);',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(113814148718753923)
,p_process_success_message=>'&P211_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55136498573609904)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar P\00E1rrafo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_prrfos in (select prrfo',
'                      from gn_d_plantillas_parrafo',
'                    where id_plntlla = :P211_ID_PLNTLLA ) loop',
'                    ',
'        :P211_DCMNTO := :P211_DCMNTO || c_prrfos.prrfo;',
'        ',
'    end loop;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P211_ID_PLNTLLA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
