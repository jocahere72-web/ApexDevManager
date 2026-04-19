prompt --application/pages/page_00094
begin
wwv_flow_api.create_page(
 p_id=>94
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Documentos Requeridos'
,p_page_mode=>'MODAL'
,p_step_title=>'Documentos Requeridos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'700'
,p_dialog_width=>'1000'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241004104542'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3094000650903322)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion obsrvcion_archvo',
'     --, d.file_blob',
'     , d.file_mimetype',
'     , md.dscrpcion_dcmnto',
'     , to_char(d.fcha,''DD/MM/YYYY'') fcha_crgue_archvo',
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto ',
'  --join fi_g_fsclzcion_expdnte_acto f on f.id_slctud_rqrmnto = d.id_slctud ',
' where md.actvo = ''S''',
'   and d.id_slctud = :P94_ID_SLCTUD_RQRMNTO',
';'))
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
 p_id=>wwv_flow_api.id(3094166190903323)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'BVILLEGAS'
,p_internal_uid=>3094166190903323
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3094321248903325)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3094779621903329)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>'Tipo<br>Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3094885478903330)
,p_db_column_name=>'FCHA_CRGUE_ARCHVO'
,p_display_order=>40
,p_column_identifier=>'G'
,p_column_label=>'Fecha Subida<br>Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3094442628903326)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>'Nombre<br>Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3094611431903328)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Tipo Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3094260086903324)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>70
,p_column_identifier=>'A'
,p_column_label=>'Descargar<br>Archivo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3094515413903327)
,p_db_column_name=>'OBSRVCION_ARCHVO'
,p_display_order=>80
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n<br>Archivo')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3095145953903333)
,p_db_column_name=>'ACTVO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\00BFActivo?')
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(3107428450976484)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'31075'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO:DSCRPCION_DCMNTO:FCHA_CRGUE_ARCHVO:FILE_MIMETYPE:FILE_NAME:OBSRVCION_ARCHVO:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3115723757100009)
,p_plug_name=>'Asociar Expediente'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3115491331100006)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(3115723757100009)
,p_button_name=>'BTN_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3095254806903334)
,p_name=>'P94_ID_SLCTUD_RQRMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3115723757100009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3115087223100002)
,p_name=>'P94_INDCDR_CMPLE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3115723757100009)
,p_prompt=>unistr('\00BFCumple?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3115896857100010)
,p_name=>'P94_EXPDNTE_SAN_NEI'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3115723757100009)
,p_prompt=>unistr('Expedientes<br>Sancionatorio por<br>No Enviar Informaci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmro_expdnte as d, ',
'        a.nmro_expdnte as r',
' from fi_g_fiscalizacion_expdnte a',
' join v_fi_g_candidatos b on b.id_cnddto = a.id_cnddto',
'where b.cdgo_prgrma = ''S''',
'  and b.cdgo_sbprgrma = ''NEI''',
'  and b.id_sjto_impsto in (select b.id_sjto_impsto',
'                             from pq_g_solicitudes d--documentos d',
'                             join pq_g_solicitudes_motivo a',
'                               on a.id_slctud = d.id_slctud',
'                             join pq_g_slctdes_mtvo_sjt_impst b',
'                               on b.id_slctud_mtvo = a.id_slctud_mtvo',
'                            where d.id_slctud = :P94_ID_SLCTUD_RQRMNTO);',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET_FILTER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3690078292091107)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select  b.nmro_expdnte,',
'        a.indcdor_cmple',
'  into :P94_EXPDNTE_SAN_NEI,',
'       :P94_INDCDR_CMPLE',
'  from fi_g_fsclzcion_expdnte_acto a',
'  join fi_g_fiscalizacion_expdnte b on b.NMRO_EXPDNTE = a.NMRO_EXPDNTE_SNCNTRIO',
' where a.id_slctud_rqrmnto = :P94_ID_SLCTUD_RQRMNTO;',
' exception when no_data_found then',
'     :P94_EXPDNTE_SAN_NEI := null;',
'     :P94_INDCDR_CMPLE := ''N'';',
' end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3690168352091108)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar campos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_rspsta    varchar2(100);',
'begin',
'    begin',
'        update fi_g_fsclzcion_expdnte_acto a',
'           set a.indcdor_cmple = :P94_INDCDR_CMPLE,',
'               a.nmro_expdnte_sncntrio = :P94_EXPDNTE_SAN_NEI',
'         where a.id_slctud_rqrmnto = :P94_ID_SLCTUD_RQRMNTO;',
'    exception',
'        when others then',
'            v_mnsje_rspsta := ''Problemas al actualizar campos.'';',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3115491331100006)
);
end;
/
