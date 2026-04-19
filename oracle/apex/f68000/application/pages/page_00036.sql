prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Anexo Documentos Pendientes Pqr'
,p_step_title=>'Anexo Documentos Pendientes Pqr'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function imprimir_(){',
'  /*apex.server.process ("Imprimir_documentos", {  ',
'  pageItems: "#P9_IDNTFCCION_SJTO,#P9_ID_IMPSTO,#P9_ID_MTVO,#P9_ID_IMPSTO_SBMPSTO"',
'  }).then(function(resp){',
'      var waitPopup$ = apex.widget.waitPopup();',
'       var data = resp.data;',
'       var count = 0;',
'       apex.message.clearErrors();',
'       if (resp.type){',
'          var inter = setInterval(function(){',
'          window.open(data[count].url, ''_self'');          ',
'          if ((data.length - 1) === count){',
'              clearInterval(inter);',
'              waitPopup$.remove();',
'          }',
'          count++;    ',
'       }, 800); ',
'       }else {           ',
'           apex.message.showErrors([',
'               {',
'                   type:       "error",',
'                   location:   [ "page","inline" ],',
'                   pageItem:   "P9_ID_MTVO",',
'                   message:    "No se encontraron documentos parametrizados para este motivo",',
'                   unsafe:     false',
'               }',
'           ]);',
'           waitPopup$.remove();',
'       }              ',
'     }',
');*/',
' console.log();   ',
'}',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_VLDAR {',
'    padding: 0.3rem !important;',
'}'))
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20221118075609'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(265705429611401781)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(127862078727713401)
,p_plug_name=>'Documentos cargados en PQR'
,p_parent_plug_id=>wwv_flow_api.id(265705429611401781)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   p.id_mtvo_dcmnto',
'         , p.id_dcmnto',
'        , m.dscrpcion_dcmnto',
'        --, p.file_blob',
'        , p.file_name',
'        , p.obsrvcion,',
'        case',
'            when dbms_lob.getlength(p.file_blob) > 0 then ''Cargado''',
'            else  ''Pendiente''',
'        end Estado,',
'        m.dscrpcion_indcdor_oblgtrio ,',
'        a.nmro_rdcdo_dsplay nro_radicado,',
'        to_char(p.fcha , ''dd/mm/yyyy'') Fecha_radicado,',
'        u.nmbre_trcro as Usuario_radica --d.prmer_nmbre ||'' '' || d.sgndo_nmbre|| '' '' || d.prmer_aplldo|| '' '' || d.sgndo_aplldo   ',
'from pq_g_documentos          p ',
'join pq_g_solicitudes         a on p.id_slctud = a.id_slctud',
'join pq_g_radicador           d on d.id_rdcdor = a.id_rdcdor',
'join pq_g_solicitudes_motivo  b on a.id_slctud = b.id_slctud',
'join v_pq_d_motivos_documento m on b.ID_MTVO   = m.ID_MTVO and p.ID_MTVO_DCMNTO = m.ID_MTVO_DCMNTO ',
'left join v_sg_g_usuarios          u on p.id_usrio  = u.id_usrio',
'where a.nmro_rdcdo_dsplay =  :P36_NMRO_RDCDO ',
'order by m.dscrpcion_dcmnto; ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from pq_g_documentos          p ',
'join pq_g_solicitudes         a on p.id_slctud = a.id_slctud',
'where a.nmro_rdcdo_dsplay =  :P36_NMRO_RDCDO'))
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
 p_id=>wwv_flow_api.id(127862154933713402)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>127862154933713402
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(127862268034713403)
,p_db_column_name=>'ID_MTVO_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS_HIST:FILE_BLOB:ID_DCMNTO_HIST::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(127862319796713404)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(127862564467713406)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(127862618572713407)
,p_db_column_name=>'ESTADO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(127862716663713408)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(127862807744713409)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(127862998868713410)
,p_db_column_name=>'USUARIO_RADICA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Usuario Registr\00F3')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(127863097323713411)
,p_db_column_name=>'FECHA_RADICADO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha Registro'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(127863189683713412)
,p_db_column_name=>'NRO_RADICADO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'No. Radicado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(128037115934753902)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(127870878596719983)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1278709'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:ESTADO:FILE_NAME:DSCRPCION_INDCDOR_OBLGTRIO:USUARIO_RADICA:FECHA_RADICADO:NRO_RADICADO::ID_DCMNTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(266149701524474984)
,p_plug_name=>'Documentos_pendientes'
,p_region_name=>'DOCUMENTOS_P'
,p_parent_plug_id=>wwv_flow_api.id(265705429611401781)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  ',
'select  m.id_mtvo_dcmnto',
'        , m.dscrpcion_dcmnto',
'        , blob001 file_blob',
'        , c002 file_name',
'        , c001 obsrvcion,',
'        case',
'            when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'            else  ''Pendiente''',
'        end Estado,',
'        m.dscrpcion_indcdor_oblgtrio /* , ',
'        a.nmro_rdcdo_dsplay nro_radicado,',
'        to_char(a.fcha_rdcdo , ''dd/mm/yyyy'') Fecha_radicado,',
'        d.prmer_nmbre ||'' '' || d.sgndo_nmbre|| '' '' || d.prmer_aplldo|| '' '' || d.sgndo_aplldo as Usuario_radica */      ',
'from v_pq_d_motivos_documento m',
'left join apex_collections    c on m.id_mtvo_dcmnto = c.n001    ',
'      and c.collection_name = ''DOCUMENTOS_P''',
'join pq_g_solicitudes_motivo b on b.ID_MTVO = m.ID_MTVO',
'join pq_g_solicitudes a on b.id_slctud = a.id_slctud',
'--join pq_g_radicador d on d.id_rdcdor = a.id_rdcdor',
'where a.nmro_rdcdo_dsplay = :P36_NMRO_RDCDO',
'order by m.dscrpcion_dcmnto',
'/* and not exists ( select 1 from pq_g_documentos p where p.id_slctud = a.id_slctud ',
'                   and p.id_mtvo_dcmnto = m.id_mtvo_dcmnto )  */',
'; ',
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
 p_id=>wwv_flow_api.id(266151560237475002)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>266151560237475002
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(192919638143514297)
,p_db_column_name=>'ID_MTVO_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Mtvo Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(192920020199514312)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(192920374477514313)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Archivo'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(192920729044514313)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(192921127432514314)
,p_db_column_name=>'ESTADO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(192921591171514314)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(192921979306514314)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(266255208657767791)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1929223'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:ESTADO::FILE_NAME:DSCRPCION_INDCDOR_OBLGTRIO:FECHA_RADICA_DSPLAY'
,p_sort_column_1=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(192922737756514324)
,p_report_id=>wwv_flow_api.id(266255208657767791)
,p_name=>'Obligatorio'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_operator=>'='
,p_expr=>'Si'
,p_condition_sql=>' (case when ("DSCRPCION_INDCDOR_OBLGTRIO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Si''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#D0F1CD'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(265705658702401783)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
' from apex_collections',
' where collection_name = ''DOCUMENTOS_P''',
' and n001 = :P36_ID_MTVO_DCMNTO;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(265705735316401784)
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
unistr('Funcionalidad que permite anexar los documentos pdf pendientes en una pqr radicada. El par\00E1metro b\00E1sico es el n\00FAmero del radicado.<br><br>'),
'Se debe anexar al menos un documento de los pendientes para continuar el proceso de la pqr, <br>',
unistr('Una vez ingresados los datos hacer clic en el bot\00F3n Agregar.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.        </i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(265706769996401794)
,p_plug_name=>unistr('Par\00E1metros de Consulta')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>',
'',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(466308005618221564)
,p_plug_name=>'Datos de la Solicitud'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>55
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P36_NMRO_RDCDO'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(192923404688514329)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(265705658702401783)
,p_button_name=>'BTN_INSERTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select s.id_slctud ',
'  from pq_g_solicitudes s',
' where s.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
' */',
' ',
' select 1',
' from apex_collections',
' where collection_name = ''DOCUMENTOS_P''',
' and n001 = :P36_ID_MTVO_DCMNTO;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(127806036468845201)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(265706769996401794)
,p_button_name=>'BTN_CONSULTAR_RDCDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>3
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(127863301400713414)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(265706769996401794)
,p_button_name=>'Limpiar_sesiones'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(71867662452951594)
,p_button_image_alt=>'Limpiar_sesiones'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(192914034924514245)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(265705429611401781)
,p_button_name=>'BTN_SCANNER'
,p_button_static_id=>'BTN_SCANNER'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Escaner'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=50000:909:&SESSION.::&DEBUG.:RP,909:P909_APP_ID,P909_APP_PAGE_ID:&APP_ID.,&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(192914441032514257)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(265705429611401781)
,p_button_name=>'BTN_AGRGAR'
,p_button_static_id=>'BTN_AGRGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Cargar este Archivo? '',''BTN_AGRGAR'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(127806146645845202)
,p_name=>'P36_INDICADOR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(265706769996401794)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128002030462605997)
,p_name=>'P36_ID_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128002345946606021)
,p_name=>'P36_ID_PRSNTCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128002782765606022)
,p_name=>'P36_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
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
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128003125381606023)
,p_name=>'P36_ESTADO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>'Estado '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128003533720606023)
,p_name=>'P36_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>'Respuesta'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128003982248606023)
,p_name=>'P36_ID_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
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
 p_id=>wwv_flow_api.id(128004391852606025)
,p_name=>'P36_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P36_ID_IMPSTO',
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
 p_id=>wwv_flow_api.id(128004732145606025)
,p_name=>'P36_IDNTFCCION_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_api.id(128005183127606025)
,p_name=>'P36_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128005513449606025)
,p_name=>'P36_FCHA_RDCDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
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
 p_id=>wwv_flow_api.id(128005961815606025)
,p_name=>'P36_FCHA_PRYCTDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>'Fecha Proyectada '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128006382615606026)
,p_name=>'P36_OBSRVCION_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
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
 p_id=>wwv_flow_api.id(128006722281606026)
,p_name=>'P36_ID_SLCTUD'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128007161350606026)
,p_name=>'P36_VLDAR_TRBTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128007508160606026)
,p_name=>'P36_TAREA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>'Tarea Actual'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128007973183606028)
,p_name=>'P36_USUARIO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_prompt=>'Usuario Radicador: '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128008348296606028)
,p_name=>'P36_ID_INSTNCIA_FLJO_GNRDO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128008797729606028)
,p_name=>'P36_PAGE_ID'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128009115189606030)
,p_name=>'P36_APP_ID'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128009525507606030)
,p_name=>'P36_INDCDOR_DCMNTO_PNDNTE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128037092320753901)
,p_name=>'P36_ID_ESTDO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128051539005401001)
,p_name=>'P36_ID_RDCDOR'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(466308005618221564)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192914896741514260)
,p_name=>'P36_ID_MTVO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(265705429611401781)
,p_prompt=>'Documentos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_dcmnto',
'     , id_mtvo_dcmnto',
'from v_pq_d_motivos_documento a',
'join pq_g_solicitudes_motivo  b on b.ID_MTVO = a.ID_MTVO ',
'join pq_g_solicitudes         a on b.id_slctud = a.id_slctud',
' where a.nmro_rdcdo_dsplay = :P36_NMRO_RDCDO and',
'       actvo = ''S''',
'  ',
' '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de documento que se requiere adjuntar para la solicitud.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192915728728514278)
,p_name=>'P36_OPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(265705429611401781)
,p_item_default=>'F'
,p_prompt=>unistr('Opci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Explorador de Archivos;F,Escaner;E'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione una de las opciones para adjuntar el documento a la solicitud.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192916613222514279)
,p_name=>'P36_FILE_BLOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(265705429611401781)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Habilita ventana de b\00FAsqueda para ingresar el documento adjunto correspondiente.')
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192917560615514279)
,p_name=>'P36_OBSRVCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(265705429611401781)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>99
,p_cHeight=>2
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la observaci\00F3n correspondiente a la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192918431427514284)
,p_name=>'P36_NMRO_FLIO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(265705429611401781)
,p_item_default=>'1'
,p_prompt=>unistr('N\00FAmero de Folios')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>10
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de documentos f\00EDsicos recibidos en la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192931240994514337)
,p_name=>'P36_NMRO_RDCDO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(265706769996401794)
,p_prompt=>'Numero Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de radicado a consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(127806294819845203)
,p_computation_sequence=>10
,p_computation_item=>'P36_INDICADOR'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_cl_defniciones_cliente ( p_cdgo_clnte                => :F_CDGO_CLNTE,',
'                                                         p_cdgo_dfncion_clnte_ctgria => ''PQR'',',
'                                                         p_cdgo_dfncion_clnte        => ''CDU'' ) as ind  ',
'from dual'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(192955968482514404)
,p_validation_name=>'validar radicado a consultar'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'',
'    v_vlda number;',
'    v_id_estdo  number;',
'begin',
'',
'    select id_estdo into v_id_estdo from pq_g_solicitudes ',
'    where nmro_rdcdo_dsplay= :P36_NMRO_RDCDO ;',
'   /*-- and cdgo_rspsta is null -- no ha finaizado la PQR',
unistr('    --and inddor_dcmnto_pdnte = ''S'' -- se marc\00F3 como solicitud con documentos pendientes'),
'    and',
'        case when',
'             :P36_INDICADOR = ''S''   then ',
'                to_number(:F_ID_USRIO)',
'         else',
'             id_usrio ',
'         end = id_usrio;*/',
'',
'',
'    if v_id_estdo = 4 then',
'        return  false;',
'    else',
'        return True;',
'    end if; ',
'   ',
'End;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La solicitud se encuentra resuelta. No es posible anexar m\00E1s documentos.')
,p_when_button_pressed=>wwv_flow_api.id(127806036468845201)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(192956362878514405)
,p_validation_name=>'Documento no sea nulo'
,p_validation_sequence=>40
,p_validation=>'P36_ID_MTVO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Documento'
,p_when_button_pressed=>wwv_flow_api.id(192914441032514257)
,p_associated_item=>wwv_flow_api.id(192914896741514260)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(192957147107514406)
,p_validation_name=>'Documento no sea nulo escaner'
,p_validation_sequence=>50
,p_validation=>'P36_ID_MTVO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Documento'
,p_when_button_pressed=>wwv_flow_api.id(192914034924514245)
,p_associated_item=>wwv_flow_api.id(192914896741514260)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(192956706832514405)
,p_validation_name=>'Validar Documentos Obligatorios'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select m.indcdor_oblgtrio     ',
'     from v_pq_d_motivos_documento m ',
'left join apex_collections c',
'       on id_mtvo_dcmnto = n001    ',
'      and collection_name = ''DOCUMENTOS_P''',
'    where id_mtvo = :P36_ID_MTVO',
'      and m.indcdor_oblgtrio = ''S''',
'      and m.actvo = ''S''',
'      and c.n001 is null;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Debe subir todos los documentos obligatorios'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(192914441032514257)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(192970710953514445)
,p_name=>'Al cambiar la opcion de archivo'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P36_OPCION'
,p_condition_element=>'P36_OPCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192971297154514445)
,p_event_id=>wwv_flow_api.id(192970710953514445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P36_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192971779295514445)
,p_event_id=>wwv_flow_api.id(192970710953514445)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P36_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192972229882514446)
,p_event_id=>wwv_flow_api.id(192970710953514445)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(192914441032514257)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192972768569514448)
,p_event_id=>wwv_flow_api.id(192970710953514445)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(192914441032514257)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192973227947514449)
,p_event_id=>wwv_flow_api.id(192970710953514445)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(192914034924514245)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192973779398514449)
,p_event_id=>wwv_flow_api.id(192970710953514445)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(192914034924514245)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(192974151735514450)
,p_name=>'al cerrar la ventana modal'
,p_event_sequence=>100
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192974646985514450)
,p_event_id=>wwv_flow_api.id(192974151735514450)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob         blob;',
'     v_seq          varchar2(4000);',
'     v_filename     varchar2(4000);',
'     v_mime_type    varchar2(4000);     ',
'     ',
'     ',
'begin',
'   -- delete muerto;commit;',
'    begin',
'        select blob001,',
'               c001,',
'               c002',
'          into v_blob,',
'               v_filename,',
'               v_mime_type',
'          from apex_collections',
'         where collection_name = ''SCANNER'';',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'   ',
'    insert into muerto (v_001, v_002) values (v_filename, v_mime_type);',
'    commit;',
'    ',
'    if v_blob is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS_P'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTOS_P'');',
'        end if;',
'',
'        begin',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS_P''',
'               and n001 = :P36_ID_MTVO_DCMNTO;',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS_P''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => :P36_OBSRVCION',
'                                          , p_c002 => v_filename',
'                                          , p_c003 => v_mime_type',
'                                          , p_n001 => :P36_ID_MTVO_DCMNTO',
'                                          , p_blob001 => v_blob );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS_P''',
'                                          , p_c001 => :P36_OBSRVCION',
'                                          , p_c002 => v_filename',
'                                          , p_c003 => v_mime_type',
'                                          , p_n001 => :P36_ID_MTVO_DCMNTO',
'                                          , p_blob001 => v_blob );        ',
'        end;       ',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192975161115514451)
,p_event_id=>wwv_flow_api.id(192974151735514450)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(266149701524474984)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(192975508578514451)
,p_name=>unistr('al hacer clic en el bot\00F3n insertar ')
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74203170231940602)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192976050337514451)
,p_event_id=>wwv_flow_api.id(192975508578514451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = [];',
'json.push({''motivos'': $v(''P36_ID_MTVO''), ''sjtos'':[{''id_impsto'':$v(''P36_ID_IMPSTO''),''id_impsto_sbmpsto'':$v(''P36_ID_IMPSTO_SBMPSTO''), ''idntfccion'': $v(''P36_IDNTFCCION_SJTO'')}]});',
'',
'$s(''P36_JSON'', JSON.stringify(json));'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192976563368514452)
,p_event_id=>wwv_flow_api.id(192975508578514451)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BTN_INSERTAR'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(192961794794514422)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar Datos de la coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'if apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS_P'') then ',
'    apex_collection.delete_collection( p_collection_name => ''DOCUMENTOS_P'');            ',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'PAGELOAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(192958993731514414)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar_archivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob blob;',
'     v_seq  varchar2(4000);',
'     r_temp_files apex_application_temp_files%rowtype;',
'begin',
'        ',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P36_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'                ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS_P'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTOS_P'');',
'        end if;',
'',
'        begin',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS_P''',
'               and n001 = :P36_ID_MTVO_DCMNTO;',
'  ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS_P''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => :P36_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P36_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'  ',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS_P''',
'                                          , p_c001 => :P36_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P36_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'        ',
'        delete apex_application_temp_files where filename = r_temp_files.filename;',
'            ',
'  insert into muerto(n_001 , v_001, v_002, t_001 ) values( 11, ''borrado'', ''fin'', systimestamp); commit;',
'    end if;',
'end;'))
,p_process_error_message=>'No se encontro archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(192914441032514257)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(127841711766271412)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Sesion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(127863301400713414)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(192960155401514419)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar_documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_slctud    number;',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'',
'    select id_slctud into v_id_slctud from pq_g_solicitudes a',
'    where  a.nmro_rdcdo_dsplay = :P36_NMRO_RDCDO;',
' ',
'    pkg_pq_pqr.prc_rg_documento_pendiente_pqr(p_cdgo_clnte          => :F_CDGO_CLNTE',
'                                            , p_id_slctud           => v_id_slctud   ',
'                                            , p_id_usrio            => :F_ID_USRIO',
'                                            , p_inddor_dcmnto_pdnte => ''N''',
'                                            , o_cdgo_rspsta         => v_cdgo_rspsta',
'                                            , o_mnsje_rspsta        => v_mnsje_rspsta);',
'',
'    if(v_cdgo_rspsta != 0) then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(192923404688514329)
,p_process_success_message=>unistr('\00A1Solicitud Registrada de Forma Exitosa!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(128023763834624963)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar datos solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_tpo',
'     , a.id_mtvo',
'     , a.id_impsto',
'     , a.id_impsto_sbmpsto',
'     , a.idntfccion',
'     , a.id_rdcdor',
'     , a.id_slctud',
'     , a.nmro_rdcdo_dsplay',
'     , a.fcha_rdcdo',
'     , a.id_prsntcion_tpo ',
'     , d.nmbre_trea',
'     , e.nmbre_trcro',
'     , a.id_instncia_fljo_gnrdo',
'     , a.dscrpcion_estdo',
'     , trunc(a.fcha_pryctda)',
'     , a.dscrpcion_rspsta',
'     ,a.indcdor_dcmnto_pndnte',
'     , a.id_estdo',
'  into :P36_ID_TPO',
'     , :P36_ID_MTVO',
'     , :P36_ID_IMPSTO',
'     , :P36_ID_IMPSTO_SBMPSTO',
'     , :P36_IDNTFCCION_SJTO',
'     , :P36_ID_RDCDOR',
'     , :P36_ID_SLCTUD',
'     , :P36_NMRO_RDCDO_DSPLAY',
'     , :P36_FCHA_RDCDO',
'     , :P36_ID_PRSNTCION_TPO ',
'     , :P36_TAREA',
'     , :P36_USUARIO',
'     , :P36_ID_INSTNCIA_FLJO_GNRDO',
'     , :P36_ESTADO',
'     , :P36_FCHA_PRYCTDA',
'     , :P36_RSPSTA',
'     , :P36_INDCDOR_DCMNTO_PNDNTE',
'     , :P36_ID_ESTDO',
'  from v_pq_g_solicitudes         a',
'  join wf_g_instancias_transicion b on a.id_instncia_fljo   = b.id_instncia_fljo and b.id_estdo_trnscion in (1,2,3)',
'  join wf_d_flujos_tarea          c on b.id_fljo_trea_orgen = c.id_fljo_trea ',
'  join wf_d_tareas                d on c.id_trea            = d.id_trea  ',
'  join v_sg_g_usuarios            e on b.id_usrio           = e.id_usrio',
' where A.NMRO_RDCDO_DSPLAY = :P36_NMRO_RDCDO',
'     and rownum=1;',
'  ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P36_NMRO_RDCDO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
