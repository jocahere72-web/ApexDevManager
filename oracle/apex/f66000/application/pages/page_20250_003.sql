prompt --application/pages/page_20250_003
begin
wwv_flow_api.create_page(
 p_id=>2025018
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Consulta Auditoria Reportes'
,p_step_title=>'Consulta Auditoria Reportes'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20251009160055'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14724917577102010)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76558158288306763)
,p_plug_name=>'Auditoria Reportes'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rprte_audtria_trza',
'     , r.nmbre_rprte',
'     , d.file_name',
'     , r.dscrpcion_frmto_tpo',
'     , r.dscrpcion_rprte_grpo    ',
'     , a.fcha_imprsion',
'     , u.idntfccion',
'     , case ',
'        when u.nmbre_trcro is null then ''Usuario Publico''',
'        else u.nmbre_trcro',
'       end as nmbre_trcro ',
'--   , u.nmbre_trcro',
'     , u.nmbre_prfsion',
'     , u.nmbre_ofcna',
'     , u.nmbre_crgo   ',
'     , d.id_dcmnto_rprte_audtria',
'     , d.file_mimetype',
'     , d.file_blob',
'     , d.file_bfile',
'     , ''<span class="fa fa-file-text" aria-hidden="true"></span>'' as documento',
'     , s.idntfccion_sjto',
'from gn_g_reportes_auditoria_traza   a',
'join gn_g_documento_reporte_auditria d on a.id_rprte_audtria_trza = d.id_rprte_audtria_trza',
'left join v_sg_g_usuarios            u on a.id_usrio              = u.id_usrio',
'join v_gn_d_reportes                 r on a.id_rprte              = r.id_rprte',
'left join v_si_i_sujetos_impuesto    s on a.id_sjto_impsto		  = s.id_sjto_impsto',
'where r.cdgo_rprte_grpo  = :P2025018_CDGO_RPRTE_GRPO',
'  and a.id_rprte         = nvl(:P2025018_ID_RPRTE, a.id_rprte)',
'--  and a.id_usrio         = nvl(:P2025018_ID_USRIO, a.id_usrio);',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2025018_CDGO_RPRTE_GRPO'
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
 p_id=>wwv_flow_api.id(13094149827635929)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13094149827635929
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14913360714720908)
,p_db_column_name=>'ID_RPRTE_AUDTRIA_TRZA'
,p_display_order=>10
,p_column_identifier=>'AG'
,p_column_label=>'Id Rprte Audtria Trza'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14913429548720909)
,p_db_column_name=>'NMBRE_RPRTE'
,p_display_order=>20
,p_column_identifier=>'AH'
,p_column_label=>'Nombre Reporte'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14913566467720910)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'AI'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14913683952720911)
,p_db_column_name=>'DSCRPCION_FRMTO_TPO'
,p_display_order=>40
,p_column_identifier=>'AJ'
,p_column_label=>'Tipo Reporte'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14913796556720912)
,p_db_column_name=>'DSCRPCION_RPRTE_GRPO'
,p_display_order=>50
,p_column_identifier=>'AK'
,p_column_label=>'Grupo Reporte'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14913855456720913)
,p_db_column_name=>'FCHA_IMPRSION'
,p_display_order=>60
,p_column_identifier=>'AL'
,p_column_label=>unistr('Fecha Impresi\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14913956568720914)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>70
,p_column_identifier=>'AM'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14914008774720915)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>80
,p_column_identifier=>'AN'
,p_column_label=>'Usuario Imprime'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14914198637720916)
,p_db_column_name=>'NMBRE_PRFSION'
,p_display_order=>90
,p_column_identifier=>'AO'
,p_column_label=>unistr('Profesi\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14914285707720917)
,p_db_column_name=>'NMBRE_OFCNA'
,p_display_order=>100
,p_column_identifier=>'AP'
,p_column_label=>'Oficina'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14914371745720918)
,p_db_column_name=>'NMBRE_CRGO'
,p_display_order=>110
,p_column_identifier=>'AQ'
,p_column_label=>'Cargo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14914408711720919)
,p_db_column_name=>'ID_DCMNTO_RPRTE_AUDTRIA'
,p_display_order=>120
,p_column_identifier=>'AR'
,p_column_label=>'ID_D'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14914512187720920)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>130
,p_column_identifier=>'AS'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14914687016720921)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>140
,p_column_identifier=>'AT'
,p_column_label=>'File Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14914749730720922)
,p_db_column_name=>'FILE_BFILE'
,p_display_order=>150
,p_column_identifier=>'AU'
,p_column_label=>'File Bfile'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14915318968720928)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>160
,p_column_identifier=>'AW'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14914833995720923)
,p_db_column_name=>'DOCUMENTO'
,p_display_order=>170
,p_column_identifier=>'AV'
,p_column_label=>'Documento'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_BFILE,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:gn_g_documento_reporte_auditria,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,FILE_BFILE,ID_'
||'DCMNTO_RPRTE_AUDTRIA,#ID_DCMNTO_RPRTE_AUDTRIA#'
,p_column_linktext=>'#DOCUMENTO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(14741515237102433)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'147416'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RPRTE_AUDTRIA_TRZA:NMBRE_RPRTE:FILE_NAME:DSCRPCION_FRMTO_TPO:DSCRPCION_RPRTE_GRPO:FCHA_IMPRSION:IDNTFCCION:NMBRE_TRCRO:NMBRE_PRFSION:NMBRE_OFCNA:NMBRE_CRGO:ID_DCMNTO_RPRTE_AUDTRIA:FILE_MIMETYPE:FILE_BLOB:FILE_BFILE:DOCUMENTO:IDNTFCCION_SJTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76561049804306792)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
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
'Funcionalidad que permite cosultar todos los reportes a los cuales se les realizo auditoria.',
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14914962656720924)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(14724917577102010)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14912857481720903)
,p_name=>'P2025018_CDGO_RPRTE_GRPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14724917577102010)
,p_prompt=>'<h6>Grupo de Reporte</h6>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select g.dscrpcion',
'     , g.cdgo_rprte_grpo',
'  from gn_d_reportes_grupo g',
'  join gn_d_reportes r on r.cdgo_rprte_grpo = g.cdgo_rprte_grpo  ',
'where exists (',
'       select 1',
'         from gn_g_reportes_auditoria_traza a',
'        where a.id_rprte = r.id_rprte',
'      );'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14912901265720904)
,p_name=>'P2025018_ID_RPRTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14724917577102010)
,p_prompt=>'<h6>Reporte</h6>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.nmbre_rprte',
'     , r.id_rprte',
'  from gn_d_reportes r',
'where r.cdgo_rprte_grpo = :P2025018_CDGO_RPRTE_GRPO',
'and exists (',
'       select 1',
'         from gn_g_reportes_auditoria_traza a',
'        where a.id_rprte = r.id_rprte',
'      );'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2025018_CDGO_RPRTE_GRPO'
,p_ajax_items_to_submit=>'P2025018_ID_RPRTE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14913055794720905)
,p_name=>'P2025018_ID_USRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14724917577102010)
,p_prompt=>'<h6>Usuario</h6>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.nmbre_trcro',
'     , u.id_usrio',
'  from v_sg_g_usuarios u',
' where exists (',
'       select 1',
'         from gn_g_reportes_auditoria_traza a',
'        where a.id_usrio = u.id_usrio',
'      );'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(14915205026720927)
,p_validation_name=>'validar tipo de reporte '
,p_validation_sequence=>10
,p_validation=>'P2025018_CDGO_RPRTE_GRPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un tipo de reporte.'
,p_when_button_pressed=>wwv_flow_api.id(14914962656720924)
,p_associated_item=>wwv_flow_api.id(14912857481720903)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
