prompt --application/pages/page_00056
begin
wwv_flow_api.create_page(
 p_id=>56
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Consulta Paz y Salvo C\00F3digo QR')
,p_step_title=>'Consulta Paz y Salvo'
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
'              + ''&accion='' + encodeURIComponent(''RPZ'');',
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
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20251001164604'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108998620394848150)
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
 p_id=>wwv_flow_api.id(2844802962698709)
,p_plug_name=>'Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(108998620394848150)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-lg'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P56_ID_SJTO_IMPSTO is not null and :P56_ESTDO = ''1'';'
,p_attribute_01=>'P56_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5282468910473003)
,p_plug_name=>'Rechazo paz y salvo'
,p_parent_plug_id=>wwv_flow_api.id(108998620394848150)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="es">',
'<head>',
'  <meta charset="UTF-8">',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <title>Mensaje de Rechazo</title>',
'  <style>',
'    body {',
'      font-family: Arial, sans-serif;',
'      background-color: #f8f9fa;',
'      display: flex;',
'      justify-content: center;',
'      align-items: center;',
'      height: 100vh;',
'      margin: 0;',
'    }',
'    .container {',
'      text-align: center;',
'      background-color: #ffffff;',
'      padding: 20px;',
'      border: 1px solid #dee2e6;',
'      border-radius: 8px;',
'      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);',
'    }',
'    .message {',
'      font-size: 18px;',
'      color: #dc3545;',
'    }',
'  </style>',
'</head>',
'<body>',
'  <div class="container">',
unistr('    <p class="message">Se\00F1or contribuyente, este certificado de paz y salvo se encuentra vencido.</p>'),
'  </div>',
'</body>',
'</html>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P56_ESTDO'
,p_plug_display_when_cond2=>'2'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(127904504395400882)
,p_plug_name=>'Estado de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(108998620394848150)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_plug_grid_column_css_classes=>'table-inf'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id_pz_slvo',
'     , ''<button type="button" class="t-Button t-Button--success" onclick="descargarPDF('' || a.id_acto || '', '''''' || a.file_name || '''''', '''''' || :F_DRCCION_SRVDOR_PBLCO || '''''')">',
'            Descargar',
'        </button>'' as "Ver Documento"     ',
'     , p.id_plntlla',
'     , p.cnsctvo      numero_acto',
'     , p.fcha_pz_slvo fecha_paz_salvo',
'     , p.id_sjto_impsto',
'from gf_g_paz_y_salvo    p',
'join v_gn_g_actos        a on p.id_acto = a.id_acto',
'where p.cdgo_clnte       = :F_CDGO_CLNTE',
'  and p.id_pz_slvo       = :P56_ID_PZ_SLVO    ',
'  and p.id_sjto_impsto   = :P56_ID_SJTO_IMPSTO;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P56_ESTDO'
,p_plug_display_when_cond2=>'1'
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
 p_id=>wwv_flow_api.id(128030420147977788)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn Dato.')
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AMOLINA'
,p_internal_uid=>128030420147977788
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14725270669102013)
,p_db_column_name=>'ID_PZ_SLVO'
,p_display_order=>10
,p_column_identifier=>'P'
,p_column_label=>'Id Pz Slvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14725387686102014)
,p_db_column_name=>'Ver Documento'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14725502437102016)
,p_db_column_name=>'NUMERO_ACTO'
,p_display_order=>30
,p_column_identifier=>'S'
,p_column_label=>'Numero Acto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14725689030102017)
,p_db_column_name=>'FECHA_PAZ_SALVO'
,p_display_order=>40
,p_column_identifier=>'T'
,p_column_label=>'Fecha Paz Salvo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14725447209102015)
,p_db_column_name=>'ID_PLNTLLA'
,p_display_order=>50
,p_column_identifier=>'R'
,p_column_label=>'Id Plntlla'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14725771700102018)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>60
,p_column_identifier=>'U'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(128047564374299666)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'32552'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PZ_SLVO:Ver Documento:ID_PLNTLLA:NUMERO_ACTO:FECHA_PAZ_SALVO:ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3234309603075109)
,p_name=>'P56_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2844802962698709)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5250800664061904)
,p_name=>'P56_ID_PZ_SLVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(127904504395400882)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5282549258473004)
,p_name=>'P56_ESTDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108998620394848150)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5282965368473008)
,p_computation_sequence=>10
,p_computation_item=>'P56_ESTDO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case ',
'          when to_char(a.fcha_pz_slvo, ''YYYY'') < to_char(sysdate, ''YYYY'') then 2',
'          else 1',
'        end as Estado ',
'from gf_g_paz_y_salvo        a',
'where a.cdgo_clnte   = :F_CDGO_CLNTE',
'    and a.id_pz_slvo = :P56_ID_PZ_SLVO;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2994310739655685)
,p_name=>'al cambiar tipo de busqueda'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P56_TPO_BSQDA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2994892424655688)
,p_event_id=>wwv_flow_api.id(2994310739655685)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P56_TPO_BSQDA'').find(''[value='' + $(''#P56_TPO_BSQDA'').val() + '']'').text();',
'$(''#P56_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
end;
/
