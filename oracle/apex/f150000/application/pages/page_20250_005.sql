prompt --application/pages/page_20250_005
begin
wwv_flow_api.create_page(
 p_id=>2025021
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Consulta Documento Auditoria QR'
,p_step_title=>'Consulta Documento Auditoria QR'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Portal/js/emisionRecibo.js?v=&APP_SESSION.'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'String.prototype.initCap = function () {',
unistr('   return this.toLowerCase().replace(/(?:^|\005Cs)[a-z\00E1\00E9\00ED\00FA\00F3]/g, function (m) {'),
'      return m.toUpperCase();',
'   });',
'};',
'',
'',
'/*',
'    Autor: Jbadra',
unistr('    NOTA: Se realiza el llamado al servicio usando Fetch, debido a que mediante PL/SQL y los m\00E9todos de APEX Web Services '),
unistr('          Se presentaban errores al imprimir el BLOB en dispositivos Android. Por este motivo, se omite el est\00E1ndar al invocar el servicio.'),
'*/',
'function descargarPDF(id_acto, file_name, dominio) {',
unistr('  console.log(''Entrando a la Funci\00F3n descargarPDF'');  '),
'  console.log(''Dominio: '' + dominio);',
'',
'  const url = dominio + ''/recibo/certificadoContribuyente?id_acto='' ',
'              + encodeURIComponent(id_acto) ',
'              + ''&accion='' + encodeURIComponent(''CRA'');',
'',
'  fetch(url, {',
'    method: ''GET'',',
'    headers: {',
'      ''Accept'': ''application/pdf'',',
'    }',
'  })',
'  .then(response => {',
'    if (!response.ok) {',
'      throw new Error(''No se pudo obtener el PDF'');',
'    }',
'    return response.blob();',
'  })',
'  .then(blob => {',
'    const url = window.URL.createObjectURL(blob);',
'    const a = document.createElement(''a'');',
'    a.href = url;',
'    a.download = file_name;',
'    document.body.appendChild(a);',
'    a.click();',
'    a.remove();',
'    window.URL.revokeObjectURL(url);',
'  })',
'  .catch(error => {',
'    console.error(''Error al descargar el PDF:'', error);',
'    alert(''No se pudo descargar el certificado'');',
'  });',
'}',
'',
''))
,p_javascript_code_onload=>'//validarFechaVencimiento();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-body>h5 {',
'    background-color: #fff;',
'    border: 1px solid rgba(0, 0, 0, .1);',
'    color: rgba(255, 0, 0, 0.89);',
'    padding: 1rem;',
'    text-align: center;',
'}',
'',
'.table-inf {',
'    margin-left: 10px;',
'}',
'',
'.table-inf td {',
'    font-size: 14px;',
'    text-align: left;',
'}',
'',
'.t-Region-body>p {',
'    background-color: #fff;',
'    border: 1px solid rgba(0, 0, 0, .1);',
'    color: rgba(255, 0, 0, 0.89);',
'    padding: 1rem;',
'    text-align: center;',
'}',
'',
'<style>',
'  .a-IRR-tableContainer {',
'    overflow-x: auto !important;',
'    -webkit-overflow-scrolling: touch;',
'  }',
'  .a-IRR-tableContainer .t-fht-wrapper {',
'    min-width: 600px;',
'  }',
'</style>',
''))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251119105014'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123767271218029509)
,p_plug_name=>'Estado de Cuenta'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17613453785880068)
,p_plug_name=>'Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(123767271218029509)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-lg'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P2025021_ID_SJTO_IMPSTO is not null'
,p_attribute_01=>'P2025021_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142673155218582241)
,p_plug_name=>'Estado de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(123767271218029509)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_plug_grid_column_css_classes=>'table-inf'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rprte_audtria_trza',
'     , a.id_rprte',
'     , ''<button type="button" class="t-Button t-Button--success" onclick="descargarPDF('' || a.id_rprte_audtria_trza || '', ''''''|| a.file_name || '''''', '''''' || :F_DRCCION_SRVDOR_PBLCO || '''''')">',
'            Descargar',
'        </button>'' as "Documento"',
'     , r.nmbre_rprte',
'     , a.fcha_imprsion',
'--   , a.idntfccion',
'     , case ',
'        when u.nmbre_trcro is null then ''Usuario Publico''',
'        else u.nmbre_trcro',
'       end as nmbre_trcro ',
'     , a.file_name',
'     , a.file_mimetype',
'     , a.file_blob',
'     , a.file_bfile',
'from v_gn_g_reportes_auditoria   a',
'left join v_sg_g_usuarios        u on a.id_usrio = u.id_usrio',
'join v_gn_d_reportes             r on a.id_rprte = r.id_rprte',
'where a.id_rprte_audtria_trza = :P2025021_ID_RPRTE_AUDTRIA_TRZA;',
''))
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
 p_id=>wwv_flow_api.id(142799070971159147)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn Dato.')
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AMOLINA'
,p_internal_uid=>142799070971159147
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14867431501328915)
,p_db_column_name=>'ID_RPRTE_AUDTRIA_TRZA'
,p_display_order=>10
,p_column_identifier=>'BM'
,p_column_label=>'Id Rprte Audtria Trza'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14867596840328916)
,p_db_column_name=>'ID_RPRTE'
,p_display_order=>20
,p_column_identifier=>'BN'
,p_column_label=>'Id Rprte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14867668521328917)
,p_db_column_name=>'Documento'
,p_display_order=>30
,p_column_identifier=>'BO'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14867756993328918)
,p_db_column_name=>'NMBRE_RPRTE'
,p_display_order=>40
,p_column_identifier=>'BP'
,p_column_label=>'Reporte'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14868131954328922)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>80
,p_column_identifier=>'BT'
,p_column_label=>'Usuario Imprime'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14868239553328923)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>90
,p_column_identifier=>'BU'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14868333613328924)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>100
,p_column_identifier=>'BV'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14868430007328925)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>110
,p_column_identifier=>'BW'
,p_column_label=>'File Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14868503719328926)
,p_db_column_name=>'FILE_BFILE'
,p_display_order=>120
,p_column_identifier=>'BX'
,p_column_label=>'File Bfile'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14868678531328927)
,p_db_column_name=>'FCHA_IMPRSION'
,p_display_order=>130
,p_column_identifier=>'BY'
,p_column_label=>unistr('Fecha Impresi\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(142816215197481025)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'147726'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'''ESTOESUNAPRUEBA.''_AUDTRIA_TRZA_IMPRCION_SJTO:''HOOLA''_AUDTRIA_TRZA:123_AUDTRIA_TRZA:ID_RPRTE:Documento:NMBRE_RPRTE:NMBRE_TRCRO:FILE_NAME:FILE_MIMETYPE:FILE_BLOB:FILE_BFILE:FCHA_IMPRSION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14773020307181373)
,p_name=>'P2025021_ID_RPRTE_AUDTRIA_TRZA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(142673155218582241)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14773705911181374)
,p_name=>'P2025021_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(17613453785880068)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14774527945181375)
,p_name=>'al cambiar tipo de busqueda'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025021_TPO_BSQDA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14775083675181377)
,p_event_id=>wwv_flow_api.id(14774527945181375)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P2025021_TPO_BSQDA'').find(''[value='' + $(''#P2025021_TPO_BSQDA'').val() + '']'').text();',
'$(''#P2025021_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
end;
/
