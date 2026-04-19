prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Aplicaci\00F3n - Novedad Predial')
,p_step_title=>unistr('Aplicaci\00F3n - Novedad Predial')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20251016141017'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115125614619797403)
,p_plug_name=>unistr('Tab de Aplicaci\00F3n de Novedad')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2622418313227901)
,p_plug_name=>'<b>Documentos Soportes</b>'
,p_parent_plug_id=>wwv_flow_api.id(115125614619797403)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2622512012227902)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(2622418313227901)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Soporte Cambio de Estrato'' dscrpcion_dcmnto',
'     , d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion',
'     , d.fcha',
'  from pq_g_documento_cambio_estrato d',
'    where d.id_slctud = nvl(:P11_ID_SLCTUD, :F_ID_INSTNCIA_FLJO) -- Req.0028158'))
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
 p_id=>wwv_flow_api.id(2622752763227904)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DBALDOVINO'
,p_internal_uid=>2622752763227904
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2622966645227906)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2623154252227908)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2623282533227909)
,p_db_column_name=>'FCHA'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2623049856227907)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2622800391227905)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'A'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTO_CAMBIO_ESTRATO:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3014653793777603)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2630494920295219)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'26305'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:FILE_NAME:OBSRVCION:FCHA:ID_DCMNTO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16639514728603001)
,p_plug_name=>'<b>Datos del Predio</b>'
,p_parent_plug_id=>wwv_flow_api.id(115125614619797403)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122756669824243001)
,p_plug_name=>'Datos del Predio Novedad'
,p_parent_plug_id=>wwv_flow_api.id(16639514728603001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(144243593583360032)
,p_plug_name=>unistr('Informaci\00F3n Sujeto Tributo')
,p_parent_plug_id=>wwv_flow_api.id(16639514728603001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P11_ID_SJTO_IMPSTO'
,p_attribute_01=>'P11_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122758057988243015)
,p_plug_name=>'<b>Vigencias a Reliquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(115125614619797403)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select vgncia',
'         , prdo',
'      from v_si_g_novedades_prdio_vgncia',
'     where id_nvdad_prdio_dtlle = :P11_ID_NVDAD_PRDIO_DTLLE',
'  order by vgncia desc',
'         , prdo desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from v_si_g_novedades_prdio_vgncia',
' where id_nvdad_prdio_dtlle = :P11_ID_NVDAD_PRDIO_DTLLE'))
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
 p_id=>wwv_flow_api.id(122758148748243016)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encuentra vigencias a reliquidar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>122758148748243016
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122758250226243017)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122758357548243018)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(122795231174749622)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1227953'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123494540969099103)
,p_plug_name=>'<b>Datos del Acto</b>'
,p_parent_plug_id=>wwv_flow_api.id(115125614619797403)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_acto_tpo',
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
'  from si_g_novedades_predio_dtlle a',
'  join v_gn_g_actos b',
'    on a.id_acto = b.id_acto',
' where id_nvdad_prdio_dtlle = :P11_ID_NVDAD_PRDIO_DTLLE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from si_g_novedades_predio_dtlle',
' where id_nvdad_prdio_dtlle = :P11_ID_NVDAD_PRDIO_DTLLE',
'   and id_acto is not null'))
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
 p_id=>wwv_flow_api.id(123494648335099104)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>123494648335099104
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123494784591099105)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Numero'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123494861034099106)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123494934854099107)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Acto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123495002140099108)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Numero Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123495159065099109)
,p_db_column_name=>'NMRO_ACTO_DSPLAY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nmro Acto Dsplay'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123495252709099110)
,p_db_column_name=>'ACCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Accion'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,#ID_ACTO#'
,p_column_linktext=>'#ACCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(123503269301142588)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1235033'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ACTO_TPO:DSCRPCION_ACTO_TPO:ID_ACTO:NMRO_ACTO:NMRO_ACTO_DSPLAY:ACCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(235235520521173086)
,p_plug_name=>'<b>Registro de Novedad</b>'
,p_parent_plug_id=>wwv_flow_api.id(115125614619797403)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P11_ID_NVDAD_PRDIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(228721915755422713)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
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
'   from si_g_novedades_predio ',
'  where id_nvdad_prdio   = :P11_ID_NVDAD_PRDIO',
'    /*and cdgo_nvdad_estdo = ''RG''*/'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(327390080577616651)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(327780225469392363)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
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
unistr('  <b>1.</b> La Aplicaci\00F3n de novedad de predial.<br/><br/>'),
'  <b>2.</b> Visualizar los datos de la novedad.<br/><br/>',
'  <b>3.</b> Visualizar los datos del predio.<br/><br/>',
'  <b>4.</b> Visualizar las vigencia a reliquidar.<br/><br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(115143057137848113)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(228721915755422713)
,p_button_name=>'Btn_Aplicar_Novedad'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Confirmar Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Ã‚Â¿EstÃƒÂ¡ seguro de confirmar el registro de la novedad?'',''Btn_Aplicar_Novedad'')'
,p_button_condition=>':P11_CDGO_NVDAD_ESTDO IN ( ''NA'' , ''RG'' )'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(123494310683099101)
,p_branch_name=>'Go To Page 11'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(115143057137848113)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3014561458777602)
,p_name=>'P11_ID_SLCTUD'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_slctud',
'from v_pq_g_solicitudes',
'where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10332247575628901)
,p_name=>'P11_ID_ACTO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16563365308423901)
,p_name=>'P11_USRIO_RGSTRO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_prompt=>unistr('Registr\00F3')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16686288859011201)
,p_name=>'P11_CDGO_NVDAD_ESTDO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16686344933011202)
,p_name=>'P11_DSCRPCION_NVDAD_ESTDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122747429371991291)
,p_name=>'P11_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122747843125991293)
,p_name=>'P11_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122748235519991294)
,p_name=>'P11_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122756669824243001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122748673474991294)
,p_name=>'P11_ID_ACTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TIPO_ACTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion as d,',
'       id_acto_tpo as r',
'  from gn_d_actos_tipo',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122749039620991294)
,p_name=>'P11_ID_ENTDAD_NVDAD'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_prompt=>'Originada por'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select dscrpcion as v',
'         , id_entdad_nvdad as k',
'      from df_i_entidades_novedad',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_impsto  = :P11_ID_IMPSTO',
'  order by v'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Entidad que autoriza la novedad.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'400'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122749984240991299)
,p_name=>'P11_NMRO_DCMTO_SPRTE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_prompt=>unistr('N\00FAmero de Acto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de Acto Soporte.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122750837451991299)
,p_name=>'P11_FCHA_DCMNTO_SPRTE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_prompt=>'Fecha Acto'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha de Acto Soporte.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122751742196991300)
,p_name=>'P11_FCHA_INCIO_APLCCION'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_item_default=>'''01/01/'' || to_char( sysdate , ''YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha Inicio de Aplicaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Simula las vigencias de aplicaci\00F3n de la novedad.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122753587102991302)
,p_name=>'P11_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>110
,p_cMaxlength=>200
,p_cHeight=>1
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Observaci\00F3n de la novedad.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122754479074991302)
,p_name=>'P11_ID_NVDAD_PRDIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122756899955243003)
,p_name=>'P11_DSTNO_NVO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(122756669824243001)
,p_prompt=>'Nuevo Destino'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122757005530243005)
,p_name=>'P11_USO_SLO_NVO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(122756669824243001)
,p_prompt=>'Nuevo Uso del Suelo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122757300892243008)
,p_name=>'P11_ESTRTO_NVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(122756669824243001)
,p_prompt=>'Nuevo Estrato'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122757986606243014)
,p_name=>'P11_ID_NVDAD_PRDIO_DTLLE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(122756669824243001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122808520833192901)
,p_name=>'P11_INDCDOR_RLQDCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(235235520521173086)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122757527953243010)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Predio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_sjto_impsto',
'         , a.dscrpcion_dstno_nvo',
'         , a.dscrpcion_uso_slo_nvo',
'         , a.dscrpcion_estrto_nvo',
'         , a.id_nvdad_prdio_dtlle',
'         , a.cdgo_nvdad_estdo',
'         , a.dscrpcion_nvdad_estdo',
'      into :P11_ID_SJTO_IMPSTO',
'         , :P11_DSTNO_NVO',
'         , :P11_USO_SLO_NVO',
'         , :P11_ESTRTO_NVO',
'         , :P11_ID_NVDAD_PRDIO_DTLLE',
'         , :P11_CDGO_NVDAD_ESTDO',
'         , :P11_DSCRPCION_NVDAD_ESTDO',
'      from v_si_g_novedades_predio_dtlle a',
'     where id_nvdad_prdio = :P11_ID_NVDAD_PRDIO;',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122757657569243011)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Novedad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select a.id_entdad_nvdad',
'          , a.nmro_dcmto_sprte',
'          , a.fcha_dcmnto_sprte',
'          , a.fcha_incio_aplccion',
'          , a.obsrvcion',
'          , a.id_impsto',
'          , a.id_impsto_sbmpsto',
'          , a.id_acto_tpo',
'          , a.indcdor_rlqdcion',
'          , a.idntfccion || '' - '' || a.nmbre_trcro as usrio_rgstro',
'       into :P11_ID_ENTDAD_NVDAD',
'          , :P11_NMRO_DCMTO_SPRTE',
'          , :P11_FCHA_DCMNTO_SPRTE',
'          , :P11_FCHA_INCIO_APLCCION',
'          , :P11_OBSRVCION',
'          , :P11_ID_IMPSTO',
'          , :P11_ID_IMPSTO_SBMPSTO',
'          , :P11_ID_ACTO_TPO',
'          , :P11_INDCDOR_RLQDCION',
'          , :P11_USRIO_RGSTRO',
'       from v_si_g_novedades_predio a',
'      where a.id_nvdad_prdio = :P11_ID_NVDAD_PRDIO;',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10337905644696601)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Id Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select t.id_acto into :P11_ID_ACTO  ',
'    from si_g_novedades_predio_dtlle t ',
'    where t.id_nvdad_prdio = :P11_ID_NVDAD_PRDIO;',
'exception when no_data_found then',
'    :P11_ID_ACTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122352118518062001)
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
'                                                  , p_id_nvdad_prdio => :P11_ID_NVDAD_PRDIO',
'                                                  , p_id_fljo_trea   => :F_ID_FLJO_TREA',
'                                                  , o_cdgo_rspsta    => o_cdgo_rspsta',
'                                                  , o_mnsje_rspsta   => o_mnsje_rspsta );',
'    ',
'    if( o_cdgo_rspsta != 0 ) then',
'        raise_application_error( -20001 , o_mnsje_rspsta );',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(115143057137848113)
,p_process_success_message=>unistr('Novedad de predial registrada con \00E9xito.')
);
end;
/
