prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>unistr('Radicaci\00F3n')
,p_step_title=>unistr('Radicaci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20250812114304'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82714887848313501)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147527328260664696)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(82714887848313501)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
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
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P11_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(74765569410784201)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>74765569410784201
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74765738443784203)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74765920625784205)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74787587387952106)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74787686751952107)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74787769198952108)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82752361087518510)
,p_db_column_name=>'ACTVO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Aceptado'
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82824482932149501)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(74779036696790468)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'747791'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ID_DCMNTO:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147527063038664693)
,p_plug_name=>'Datos del Gestor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147527180438664695)
,p_plug_name=>'Tabulador'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(71822304308951566)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147527557351664698)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147527633965664699)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>30
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
'    Funcionalidad que permite:<br><br>',
'',
'    <b>1. </b> Instanciar el flujo de trabajo dependiendo del motivo solicitado.<br><br>',
'    <b>2. </b>Imprimir el reporte de radicado de la solicitud.<br><br>',
'    <b>3. </b> Consultar el flujo en la etapa que se encuentra la solicitud.',
'    <br><br>	',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147528668645664709)
,p_plug_name=>'Datos del Solicitante'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147779182600990198)
,p_plug_name=>'Datos Solicitud'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148158650948740293)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74744641282777172)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(147527557351664698)
,p_button_name=>'BTN_IR_FLJO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Ir a Flujo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-external-link'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82888414552600101)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(147527557351664698)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_rdcdo',
'  from pq_g_solicitudes ',
' where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'   and nmro_rdcdo  is not null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82714994056313502)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(82714887848313501)
,p_button_name=>'BTN_ACTLZAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:BORRAR:&DEBUG.:RP,15:P15_ID_SLCTUD:&P11_ID_SLCTUD.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto ',
'  from pq_g_documentos d ',
' where id_slctud = :P11_ID_SLCTUD ',
'   and indcdor_actlzar = ''S'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-external-link-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(75016583265521001)
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
'         where fg.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'||wwv_flow.LF||
'           and t.id_estdo_trnscion in (1,2)           '||wwv_flow.LF||
'           and t.id_usrio = :F_ID_USRIO; '||wwv_flow.LF||
'          '||wwv_flow.LF||
'          apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );'||wwv_flow.LF||
'          apex_util.set_session_state(''F_ID_FLJO_TREA''    , v_id_fljo_trea_orgen );'||wwv_flow.LF||
'          --select apex_util.prepare_url(url || nvl2(prmtros, prmtros || '','', '''') || ''P''||nmro_pgna || ''_ID_INSTNCIA_FLJO'' || '':'' || nvl2(vlres,vlres ||'','', '''' ) || v_id_instncia_fljo) url'||wwv_flow.LF||
'          select apex_util.prepare_url(url || prmtros || '':'' || vlres ) url'||wwv_flow.LF||
'            into v_url'||wwv_flow.LF||
'              from (select ''f?p=''|| c.nmro_aplccion || '':''|| b.nmro_pgna ||'':''|| v(''app_session'') ||'':PAGELOAD:NO:'' || b.nmro_pgna || '':'' url, '||wwv_flow.LF||
'                           listagg(e.nmbre_item,'','') within group (order by e.id_instncia_item_vlor) prmtros, '||wwv_flow.LF||
'                           listagg(e.vlor,'','')       within group (order by e.id_instncia_item_vlor) vlres ,'||wwv_flow.LF||
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
,p_branch_when_button_id=>wwv_flow_api.id(74744641282777172)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(82888554886600102)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:212,<id_slctud>&P11_ID_SLCTUD.</id_slctud>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(82888414552600101)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74930539352318105)
,p_branch_name=>'Branch To Function Returning URL'
,p_branch_action=>'declare'||wwv_flow.LF||
'    v_url                  varchar2(4000);'||wwv_flow.LF||
'    v_id_fljo_trea_orgen   wf_g_instancias_transicion.id_fljo_trea_orgen%type;'||wwv_flow.LF||
'    v_id_instncia_fljo     wf_g_instancias_transicion.id_instncia_fljo%type;'||wwv_flow.LF||
'    v_id_instncia_trnscion wf_g_instancias_transicion.id_instncia_trnscion%type;'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'        '||wwv_flow.LF||
'        select t.id_fljo_trea_orgen'||wwv_flow.LF||
'              , t.id_instncia_fljo'||wwv_flow.LF||
'              , it.id_instncia_trnscion'||wwv_flow.LF||
'          into v_id_fljo_trea_orgen'||wwv_flow.LF||
'             , v_id_instncia_fljo'||wwv_flow.LF||
'             , v_id_instncia_trnscion'||wwv_flow.LF||
'          from v_wf_g_instancias_flujo_gnrdo fg'||wwv_flow.LF||
'          join wf_g_instancias_transicion t'||wwv_flow.LF||
'            on t.id_instncia_fljo = fg.id_instncia_fljo_gnrdo'||wwv_flow.LF||
'          join wf_g_instancias_transicion it'||wwv_flow.LF||
'            on it.id_instncia_fljo = fg.id_instncia_fljo    '||wwv_flow.LF||
'         where fg.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'||wwv_flow.LF||
'           and it.id_estdo_trnscion = 1'||wwv_flow.LF||
'           and t.id_usrio = :F_ID_USRIO;'||wwv_flow.LF||
'           '||wwv_flow.LF||
'          --apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );'||wwv_flow.LF||
'          apex_util.set_session_state(''F_ID_FLJO_TREA''    , null );'||wwv_flow.LF||
'          '||wwv_flow.LF||
'          select apex_util.prepare_url(url || nvl2(prmtros, prmtros || '','', '''') || ''P''||nmro_pgna || ''_ID_INSTNCIA_FLJO'' || '':'' || nvl2(vlres,vlres ||'','', '''' ) || v_id_instncia_fljo) url          '||wwv_flow.LF||
'            into v_url'||wwv_flow.LF||
'              from (select ''f?p=''|| c.nmro_aplccion || '':''|| b.nmro_pgna ||'':''|| v(''app_session'') ||'':PAGELOAD:NO:'' || b.nmro_pgna || '':'' url, '||wwv_flow.LF||
'                           listagg(e.nmbre_item,'','') within group (order by e.id_instncia_item_vlor) prmtros, '||wwv_flow.LF||
'                           listagg(e.vlor,'','')       within group (order by e.id_instncia_item_vlor) vlres ,'||wwv_flow.LF||
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
'         '||wwv_flow.LF||
'          update wf_g_instancias_transicion '||wwv_flow.LF||
'             set id_estdo_trnscion = 2'||wwv_flow.LF||
'           where id_instncia_trnscion = v_id_instncia_trnscion;'||wwv_flow.LF||
'          '||wwv_flow.LF||
'    exception '||wwv_flow.LF||
'        when others then'||wwv_flow.LF||
'            v_url := ''#'';'||wwv_flow.LF||
'    end;'||wwv_flow.LF||
'    '||wwv_flow.LF||
'    return v_url;'||wwv_flow.LF||
'end;'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.id_fljo_trea_orgen ',
'  from v_wf_g_instancias_flujo_gnrdo fg',
'  join wf_g_instancias_transicion t',
'    on t.id_instncia_fljo = fg.id_instncia_fljo_gnrdo',
'  join wf_g_instancias_transicion it',
'    on it.id_instncia_fljo = fg.id_instncia_fljo    ',
' where fg.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'   and it.id_estdo_trnscion = 1',
'   and t.id_usrio = :F_ID_USRIO'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3314493068419576)
,p_name=>'P11_EXPDNTE_FSCLZCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_prompt=>unistr('Expediente de Fiscalizaci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --a.nmro_expdnte ||'' - ''|| to_char(a.fcha_aprtra, ''DD/MM/YYYY'') as d,',
'       a.nmro_expdnte||'' - ''||f.dscrpcion||'' - ''||e.nmro_acto_dsplay as d,',
'       --a.nmro_expdnte as r ',
'       d.id_fsclzcion_expdnte_acto as r',
'from fi_g_fiscalizacion_expdnte a',
'join fi_g_candidatos b on b.id_cnddto = a.id_cnddto',
'join v_si_i_sujetos_impuesto c on c.id_sjto_impsto = b.id_sjto_impsto',
'join fi_g_fsclzcion_expdnte_acto d on d.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'join gn_g_actos e on e.id_acto = d.id_acto',
'join gn_d_actos_tipo f on f.id_acto_tpo = e.id_acto_tpo',
'where c.idntfccion_sjto = :P11_IDNTFCCION_SJTO',
'  and a.cdgo_expdnte_estdo = ''ABT''',
'  and f.cdgo_acto_tpo in (''ROO'', ''RE'')',
';'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>5
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vldar_expdnt_fsca',
'  from pq_d_motivos',
' where id_mtvo = :P11_ID_MTVO',
'   and vldar_expdnt_fsca = ''S'';'))
,p_display_when_type=>'EXISTS'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3937652203057301)
,p_name=>'P11_NTFCA_EMIL'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>unistr('\00BFAutoriza notificaci\00F3n v\00EDa correo electr\00F3nico?')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:SI;S,NO;N'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70380104087195501)
,p_name=>'P11_OBSRVCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_prompt=>unistr('Observaci\00F3n de la solicitud')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70380336303195503)
,p_name=>'P11_VLDAR_TRBTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74736033100777114)
,p_name=>'P11_CDGO_RSPNSBLE_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74736483438777118)
,p_name=>'P11_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(147527063038664693)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74736853889777118)
,p_name=>'P11_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(147527063038664693)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74737274587777119)
,p_name=>'P11_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(147527063038664693)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74737661698777120)
,p_name=>'P11_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(147527063038664693)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74738042954777120)
,p_name=>'P11_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(147527063038664693)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74738475758777121)
,p_name=>'P11_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(147527063038664693)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74738841198777121)
,p_name=>'P11_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(147527063038664693)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74746790995777177)
,p_name=>'P11_ID_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74747182020777177)
,p_name=>'P11_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74747578052777177)
,p_name=>'P11_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P11_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74747905676777178)
,p_name=>'P11_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74748337157777179)
,p_name=>'P11_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
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
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74749057889777182)
,p_name=>'P11_CDGO_IDNTFCCION_TPO_S'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74749418802777182)
,p_name=>'P11_IDNTFCCION_S'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
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
 p_id=>wwv_flow_api.id(74749867381777184)
,p_name=>'P11_PRMER_NMBRE_S'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74750205930777184)
,p_name=>'P11_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74750632915777184)
,p_name=>'P11_PRMER_APLLDO_S'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74751087818777189)
,p_name=>'P11_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74751460733777190)
,p_name=>'P11_ID_PAIS_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74751858862777190)
,p_name=>'P11_ID_DPRTMNTO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos ',
' where id_pais = :P11_ID_PAIS_NTFCCION_S;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P11_ID_PAIS_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74752237612777190)
,p_name=>'P11_ID_MNCPIO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio ',
'  from df_s_municipios ',
' where id_dprtmnto = :P11_ID_DPRTMNTO_NTFCCION_S'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P11_ID_DPRTMNTO_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74752621081777190)
,p_name=>'P11_DRCCION_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74753002600777190)
,p_name=>'P11_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74753471678777191)
,p_name=>'P11_TLFNO_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74753842869777191)
,p_name=>'P11_CLLAR_S'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(147528668645664709)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74787469690952105)
,p_name=>'P11_ID_SLCTUD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75260293629690701)
,p_name=>'P11_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75260371862690702)
,p_name=>'P11_FCHA_RDCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82635168526692301)
,p_name=>'P11_ID_PRSNTCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(147779182600990198)
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
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3315287538427845)
,p_computation_sequence=>20
,p_computation_item=>'P11_EXPDNTE_FSCLZCION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_expdnte||'' - ''||f.dscrpcion||'' - ''||e.nmro_acto_dsplay ',
'from fi_g_fiscalizacion_expdnte a',
'join fi_g_candidatos b on b.id_cnddto = a.id_cnddto',
'join v_si_i_sujetos_impuesto c on c.id_sjto_impsto = b.id_sjto_impsto',
'join fi_g_fsclzcion_expdnte_acto d on d.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'join gn_g_actos e on e.id_acto = d.id_acto',
'join gn_d_actos_tipo f on f.id_acto_tpo = e.id_acto_tpo',
'where d.id_slctud_rqrmnto = :P11_ID_SLCTUD',
';',
'',
'        '))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(82753380295518520)
,p_name=>'al cerrar la ventana modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(82714994056313502)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82824599667149502)
,p_event_id=>wwv_flow_api.id(82753380295518520)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(112421214655609401)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74744641282777172)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112421366823609402)
,p_event_id=>wwv_flow_api.id(112421214655609401)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70380420767195504)
,p_name=>'al cambiar el tipo'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_ID_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70380520279195505)
,p_event_id=>wwv_flow_api.id(70380420767195504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select vldar_trbto',
'      into :P11_VLDAR_TRBTO',
'      from pq_d_tipos ',
'     where id_tpo = :P11_ID_TPO; ',
'exception',
'    when others then',
'        :P11_VLDAR_TRBTO := null;',
'end;'))
,p_attribute_02=>'P11_ID_TPO'
,p_attribute_03=>'P11_VLDAR_TRBTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70380695968195506)
,p_name=>'al cambiar validar tributo'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_VLDAR_TRBTO'
,p_condition_element=>'P11_VLDAR_TRBTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70380748302195507)
,p_event_id=>wwv_flow_api.id(70380695968195506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_IMPSTO,P11_ID_IMPSTO_SBMPSTO,P11_IDNTFCCION_SJTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70380812965195508)
,p_event_id=>wwv_flow_api.id(70380695968195506)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ID_IMPSTO,P11_ID_IMPSTO_SBMPSTO,P11_IDNTFCCION_SJTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77366682843162101)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'verificar Flujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' select id_instncia_fljo',
'   into :F_ID_INSTNCIA_FLJO',
'   from wf_g_instancias_flujo_gnrdo',
'  where (id_instncia_fljo_gnrdo_hjo = :F_ID_INSTNCIA_FLJO',
'      or id_instncia_fljo = :F_ID_INSTNCIA_FLJO);',
'exception ',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74787073851952101)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar datos solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo',
'     , id_mtvo',
'     , id_impsto',
'     , id_impsto_sbmpsto',
'     , idntfccion',
'     , id_rdcdor',
'     , id_slctud',
'     , nmro_rdcdo_dsplay',
'     , fcha_rdcdo',
'     , id_prsntcion_tpo ',
'  into :P11_ID_TPO',
'     , :P11_ID_MTVO',
'     , :P11_ID_IMPSTO',
'     , :P11_ID_IMPSTO_SBMPSTO',
'     , :P11_IDNTFCCION_SJTO',
'     , :P11_ID_RDCDOR',
'     , :P11_ID_SLCTUD',
'     , :P11_NMRO_RDCDO_DSPLAY',
'     , :P11_FCHA_RDCDO',
'     , :P11_ID_PRSNTCION_TPO ',
'  from v_pq_g_solicitudes',
'  where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'  ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74787115219952102)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo',
'  into :P11_CDGO_IDNTFCCION_TPO',
'     , :P11_IDNTFCCION',
'     , :P11_PRMER_NMBRE',
'     , :P11_SGNDO_NMBRE',
'     , :P11_PRMER_APLLDO',
'     , :P11_SGNDO_APLLDO',
'  from pq_g_radicador',
' where id_rdcdor = :P11_ID_RDCDOR;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74787345079952104)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_rspnsble_tpo',
'     , cdgo_idntfccion_tpo ',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo ',
'     , id_pais_ntfccion ',
'     , id_dprtmnto_ntfccion ',
'     , id_mncpio_ntfccion ',
'     , drccion_ntfccion ',
'     , email ',
'     , tlfno ',
'     , cllar',
'     , ntfca_emil',
'  into :P11_CDGO_RSPNSBLE_TPO',
'     , :P11_CDGO_IDNTFCCION_TPO_S ',
'     , :P11_IDNTFCCION_S',
'     , :P11_PRMER_NMBRE_S',
'     , :P11_SGNDO_NMBRE_S ',
'     , :P11_PRMER_APLLDO_S',
'     , :P11_SGNDO_APLLDO_S',
'     , :P11_ID_PAIS_NTFCCION_S',
'     , :P11_ID_DPRTMNTO_NTFCCION_S',
'     , :P11_ID_MNCPIO_NTFCCION_S',
'     , :P11_DRCCION_NTFCCION_S',
'     , :P11_EMAIL_S',
'     , :P11_TLFNO_S',
'     , :P11_CLLAR_S',
'     , :P11_NTFCA_EMIL',
'  from pq_g_solicitantes',
' where id_slctud = :P11_ID_SLCTUD;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70380200751195502)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('cargar observaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select obsrvcion ',
'      into :P11_OBSRVCION_S ',
'      from pq_g_solicitudes_obsrvcion ',
'     where id_slctud = :P11_ID_SLCTUD',
'     order by id_slctd_obsrvcion ',
'     fetch first 1 rows only;',
'exception',
'    when others then ',
'        :P11_OBSRVCION_S := null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83524959729102901)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Ejecutar Workflow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
