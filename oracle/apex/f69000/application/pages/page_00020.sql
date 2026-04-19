prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Aplicaci\00F3n de Novedad Masiva - Predial')
,p_step_title=>unistr('Aplicaci\00F3n de Novedad Masiva - Predial')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190709131739'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123926790914912501)
,p_plug_name=>'Datos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_nvdad_prdio_dtlle',
'      , idntfccion_sjto_frmtda ',
'      , trim(drccion) as drccion',
'      , dscrpcion_dstno_antrior',
'      , dscrpcion_dstno_nvo',
'      , dscrpcion_uso_slo_antrior',
'      , dscrpcion_uso_slo_nvo',
'      , dscrpcion_estrto_antrior',
'      , dscrpcion_estrto_nvo',
'      , dscrpcion_nvdad_estdo',
'      , mnsje_rspsta',
'      , case when cdgo_nvdad_estdo = ''AP'' then',
'                ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'                </button>',
'                </center>''',
'        end accion',
'   from v_si_g_novedades_predio_dtlle',
'  where id_nvdad_prdio = :P20_ID_NVDAD_PRDIO'))
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
 p_id=>wwv_flow_api.id(123935672826952305)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>123935672826952305
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123935785145952306)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123935856717952307)
,p_db_column_name=>'DRCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Definici\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123935963292952308)
,p_db_column_name=>'DSCRPCION_DSTNO_ANTRIOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Destino Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123936089040952309)
,p_db_column_name=>'DSCRPCION_DSTNO_NVO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Destino Nuevo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123936178915952310)
,p_db_column_name=>'DSCRPCION_USO_SLO_ANTRIOR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Uso Suelo Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123936286155952311)
,p_db_column_name=>'DSCRPCION_USO_SLO_NVO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Uso Suelo Nuevo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123936337489952312)
,p_db_column_name=>'DSCRPCION_ESTRTO_ANTRIOR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estrato Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123936487238952313)
,p_db_column_name=>'DSCRPCION_ESTRTO_NVO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estrato Nuevo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3606447268169901)
,p_db_column_name=>'DSCRPCION_NVDAD_ESTDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3606522139169902)
,p_db_column_name=>'MNSJE_RSPSTA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Mensaje Respuesta'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3606691684169903)
,p_db_column_name=>'ID_NVDAD_PRDIO_DTLLE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Resumen de Reliquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3606794041169904)
,p_db_column_name=>'ACCION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Resumen de Reliquidaci\00F3n')
,p_column_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_ID_NVDAD_PRDIO_DTLLE:#ID_NVDAD_PRDIO_DTLLE#'
,p_column_linktext=>'#ACCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(123954287480039816)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1239543'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'IDNTFCCION_SJTO_FRMTDA:DRCCION:DSCRPCION_DSTNO_ANTRIOR:DSCRPCION_DSTNO_NVO:DSCRPCION_USO_SLO_ANTRIOR:DSCRPCION_USO_SLO_NVO:DSCRPCION_ESTRTO_ANTRIOR:DSCRPCION_ESTRTO_NVO:DSCRPCION_NVDAD_ESTDO::ID_NVDAD_PRDIO_DTLLE:ACCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(247437185900099887)
,p_plug_name=>'Actos'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto_frmtda',
'     , trim(a.drccion) as drccion ',
'     , b.id_acto_tpo',
'     , b.dscrpcion_acto_tpo',
'     , b.id_acto',
'     , b.nmro_acto',
'     , b.nmro_acto_dsplay',
'     , case when b.nmro_acto is not null then',
'                ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'                </button>',
'                </center>''',
'        end accion',
'  from v_si_g_novedades_predio_dtlle a',
'  join v_gn_g_actos b',
'    on a.id_acto = b.id_acto',
' where id_nvdad_prdio = :P20_ID_NVDAD_PRDIO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from si_g_novedades_predio_dtlle',
'where id_nvdad_prdio = :P20_ID_NVDAD_PRDIO',
'  and id_acto is not null'))
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
 p_id=>wwv_flow_api.id(247437293266099888)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>247437293266099888
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123942993505000799)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Numero'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123943320942000806)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123943763373000806)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Acto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123944198416000807)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Numero Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123944552043000807)
,p_db_column_name=>'NMRO_ACTO_DSPLAY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nmro Acto Dsplay'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123944980603000807)
,p_db_column_name=>'ACCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Accion'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,#ID_ACTO#'
,p_column_linktext=>'#ACCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123935459154952303)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123935592817952304)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Definici\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(247445914232143372)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1239453'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'IDNTFCCION_SJTO_FRMTDA:DRCCION:DSCRPCION_ACTO_TPO:ID_ACTO:NMRO_ACTO:ACCION:'
,p_sort_column_1=>'ID_ACTO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(352655499988364153)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
'   from si_g_novedades_predio_dtlle ',
'  where id_nvdad_prdio = :P20_ID_NVDAD_PRDIO',
'    and cdgo_nvdad_estdo = ''RG'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(451714479022334627)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite: <br/><br/>',
unistr('  <b>1.</b> La aplicaci\00F3n masiva de novedad de predial.<br/><br/>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(487894341294608139)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(123933820769941444)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(352655499988364153)
,p_button_name=>'Btn_Aplicar_Novedad'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de aplicar la novedad?'',''Btn_Aplicar_Novedad'')'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(123935389361952302)
,p_branch_action=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(123933820769941444)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123926896173912502)
,p_name=>'P20_ID_NVDAD_PRDIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(123926790914912501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(123935217918952301)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Novedad de Predial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta  number;',
'	o_mnsje_rspsta varchar2(4000);',
'begin',
'    pkg_si_novedades_predio.prc_ap_novedad_predial( p_id_usrio       => :F_ID_USRIO',
'                                                  , p_cdgo_clnte     => :F_CDGO_CLNTE',
'                                                  , p_id_nvdad_prdio => :P20_ID_NVDAD_PRDIO',
'                                                  , p_id_fljo_trea   => :F_ID_FLJO_TREA',
'                                                  , o_cdgo_rspsta    => o_cdgo_rspsta',
'                                                  , o_mnsje_rspsta   => o_mnsje_rspsta );',
'    ',
'    if( o_cdgo_rspsta != 0 ) then',
'		raise_application_error( -20001 , o_mnsje_rspsta );',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(123933820769941444)
,p_process_success_message=>unistr('Novedad de predial aplicada con \00E9xito.')
);
end;
/
