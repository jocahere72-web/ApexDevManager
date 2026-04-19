prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Cambio de Estrato - Novedad Predial'
,p_step_title=>'Cambio de Estrato - Novedad Predial'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.t-Form-label{',
'  font-weight: 700;',
'}*/'))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20260313155133'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2595726573914301)
,p_plug_name=>'Tab - Datos Registro'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2595884064914302)
,p_plug_name=>'<b>Documentos Soportes</b>'
,p_parent_plug_id=>wwv_flow_api.id(2595726573914301)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P16_ID_NVDAD_PRDIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2596387213914307)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(2595884064914302)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Soporte Cambio de Estrato'' dscrpcion_dcmnto',
'    , blob001 file_blob',
'    , c002 file_name',
'    , c001 obsrvcion',
'    , case',
'        when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'        else  ''Pendiente''',
'        end Estado,',
'        ''Si'' dscrpcion_indcdor_oblgtrio ',
'from  ',
'    apex_collections    ',
'where ',
'    collection_name = ''DOCUMENTOS_CAMBIO_ESTRATO''',
'and c004 = :F_ID_INSTNCIA_FLJO'))
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
 p_id=>wwv_flow_api.id(2596406455914308)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DBALDOVINO'
,p_internal_uid=>2596406455914308
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2596532552914309)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2596653666914310)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Archivo'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2596763728914311)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2596806611914312)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2645105526799201)
,p_db_column_name=>'ESTADO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2645234175799202)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2617157260081525)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'26172'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:FILE_BLOB:FILE_NAME:OBSRVCION:ESTADO:DSCRPCION_INDCDOR_OBLGTRIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2978367552481201)
,p_plug_name=>'<b>Documentos Soportes</b>'
,p_parent_plug_id=>wwv_flow_api.id(2595726573914301)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Soporte Cambio de Estrato'' dscrpcion_dcmnto',
'     , d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion     ',
'     , d.file_blob',
'from pq_g_documento_cambio_estrato d',
'where d.id_slctud = :P16_ID_SLCTUD'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P16_ID_NVDAD_PRDIO'
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
 p_id=>wwv_flow_api.id(2978470817481202)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DBALDOVINO'
,p_internal_uid=>2978470817481202
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3002092836724102)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2978802024481206)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2978500774481203)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTO_CAMBIO_ESTRATO:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2978685149481204)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2978731709481205)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3001989021724101)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'File Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2986155218491910)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'29862'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:FILE_NAME:OBSRVCION:ID_DCMNTO:FILE_BLOB:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(235496825856644339)
,p_plug_name=>'<b>Registro Cambio de Estrato</b>'
,p_parent_plug_id=>wwv_flow_api.id(2595726573914301)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P16_ID_NVDAD_PRDIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16534513604259901)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(127606721354780983)
,p_plug_name=>unistr('<b>Informaci\00F3n de Predio</b>')
,p_parent_plug_id=>wwv_flow_api.id(16534513604259901)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P16_ID_SJTO_IMPSTO'
,p_attribute_01=>'P16_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236788737545919839)
,p_plug_name=>unistr('<b>Vigencias de Aplicaci\00F3n</b>')
,p_parent_plug_id=>wwv_flow_api.id(16534513604259901)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.vgncia,',
'       a.prdo,',
'       a.indcdor_exste_prdo,',
'       (select d.dscrpcion',
'          from df_i_predios_destino d',
'         where d.id_prdio_dstno = c.id_prdio_dstno) prdio_dstno,',
'       decode(c.cdgo_estrto, ''99'', ''NO DEFINIDO'', c.cdgo_estrto) cdgo_estrto,',
'       c.area_trrno,',
'       c.area_cnsctrda,',
'       (select decode(max(e.id_dtrmncion), null, ''N'', ''S'')',
'          from gi_g_determinaciones e',
'          join gi_g_determinacion_detalle f',
'            on f.id_dtrmncion = e.id_dtrmncion',
'           and f.vgncia = a.vgncia',
'         where e.id_sjto_impsto = :P16_ID_SJTO_IMPSTO) dtrmndo --a.vgncia, a.prdo, a.indcdor_exste_prdo',
'  from table(pkg_si_novedades_predio.fnc_ca_vigencias_fecha(p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                            p_id_impsto         => :P16_ID_IMPSTO,',
'                                                            p_id_impsto_sbmpsto => :P16_ID_IMPSTO_SBMPSTO,',
'                                                            p_fecha             => :P16_FCHA_INCIO_APLCCION)) a',
'  left join gi_g_liquidaciones b',
'    on b.id_sjto_impsto = :P16_ID_SJTO_IMPSTO',
'   and b.cdgo_lqdcion_estdo = ''L''',
'   and b.vgncia = a.vgncia',
'  left join gi_g_liquidaciones_ad_predio c',
'    on c.id_lqdcion = b.id_lqdcion                                                             '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P16_FCHA_INCIO_APLCCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from dual ',
' where :P16_ID_NVDAD_PRDIO is null',
' union',
' select 1',
'  from si_g_novedades_predio_dtlle a',
'  join si_g_novedades_prdio_vgncia b',
'    on a.id_nvdad_prdio_dtlle = b.id_nvdad_prdio_dtlle',
' where a.id_nvdad_prdio = :P16_ID_NVDAD_PRDIO'))
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
 p_id=>wwv_flow_api.id(236788797483919840)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('La fecha inicio de aplicaci\00F3n [&P16_FCHA_INCIO_APLCCION.] aplica para vigencia futura.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>236788797483919840
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123009818044462559)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123010278913462561)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123010652863462561)
,p_db_column_name=>'INDCDOR_EXSTE_PRDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Indcdor Exste Prdo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115683260129059706)
,p_db_column_name=>'PRDIO_DSTNO'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115683320215059707)
,p_db_column_name=>'CDGO_ESTRTO'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115683477818059708)
,p_db_column_name=>'AREA_TRRNO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'A. Terreno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115683592353059709)
,p_db_column_name=>'AREA_CNSCTRDA'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'A. Construida'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115683696650059710)
,p_db_column_name=>'DTRMNDO'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Determinado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(236795174331931079)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1230110'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'VGNCIA:PRDO::PRDIO_DSTNO:CDGO_ESTRTO:AREA_TRRNO:AREA_CNSCTRDA:DTRMNDO'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(123011435762462568)
,p_report_id=>wwv_flow_api.id(236795174331931079)
,p_name=>'Periodos que no existen en el sistema'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'INDCDOR_EXSTE_PRDO'
,p_operator=>'='
,p_expr=>'N'
,p_condition_sql=>' (case when ("INDCDOR_EXSTE_PRDO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''N''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FF7755'
,p_row_font_color=>'#FFFFFF'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236587685951037139)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
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
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P16_ID_NVDAD_PRDIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(335255120491230199)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(335646352363007836)
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
'  <b>1.</b> El registro de novedad de cambio de estrato.<br/><br/>',
'  <b>2.</b> Visualizar las vigencias por reliquidar.<br/><br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(123009148646462549)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(236587685951037139)
,p_button_name=>'Btn_Registrar_Novedad'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Novedad'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2596135146914305)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2595884064914302)
,p_button_name=>'BTN_AGRGAR'
,p_button_static_id=>'BTN_AGRGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Seguro de Cargar este Archivo?'',''BTN_AGRGAR'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2595954858914303)
,p_name=>'P16_FILE_BLOB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2595884064914302)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2596088936914304)
,p_name=>'P16_OBSRVCION_CMBIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2595884064914302)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>99
,p_cHeight=>2
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2990388546561501)
,p_name=>'P16_ID_SLCTUD'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_slctud',
'from v_pq_g_solicitudes',
'where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15049059955961701)
,p_name=>'P16_VGNCIA_ACTUAL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15074532725738203)
,p_name=>'P16_RSPSTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123012141929462569)
,p_name=>'P16_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123012582028462576)
,p_name=>'P16_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123012909438462576)
,p_name=>'P16_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123013351082462577)
,p_name=>'P16_ID_ACTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123013795474462577)
,p_name=>'P16_ID_ENTDAD_NVDAD'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_prompt=>'Originada por'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select dscrpcion as v',
'         , id_entdad_nvdad as k',
'      from df_i_entidades_novedad',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_impsto  = :P16_ID_IMPSTO',
'  order by v'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Entidad que autoriza la novedad.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'400'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123014622925462582)
,p_name=>'P16_NMRO_DCMTO_SPRTE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_prompt=>unistr('N\00FAmero de Acto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de Acto Soporte.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123015595028462583)
,p_name=>'P16_FCHA_DCMNTO_SPRTE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_prompt=>'Fecha Acto'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha de Acto Soporte.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123016428510462583)
,p_name=>'P16_FCHA_INCIO_APLCCION'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_prompt=>unistr('Fecha Inicio de Aplicaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Simula las vigencias de aplicaci\00F3n de la novedad.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123017332738462584)
,p_name=>'P16_CDGO_ESTRTO'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_prompt=>'Nuevo Estrato'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion_estrto as v',
'       , cdgo_estrto as k ',
'    from df_s_estratos  ',
'   where cdgo_estrto not in ( ''00'' , ''99'' )',
'order by cdgo_estrto'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Estrato del predio'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123018295000462589)
,p_name=>'P16_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>110
,p_cMaxlength=>200
,p_cHeight=>1
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Observaci\00F3n de la novedad.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123019157897462589)
,p_name=>'P16_ID_NVDAD_PRDIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(235496825856644339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2968405603370101)
,p_validation_name=>'validar que el archivo no este vacio'
,p_validation_sequence=>10
,p_validation=>'P16_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Documento'
,p_when_button_pressed=>wwv_flow_api.id(2596135146914305)
,p_associated_item=>wwv_flow_api.id(2595954858914303)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2645300957799203)
,p_validation_name=>'Validar doumentos obligatorios'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.c002     ',
'from apex_collections c',
'where c.collection_name = ''DOCUMENTOS_CAMBIO_ESTRATO''',
'and c.seq_id = 1',
'and c.c002 is not null'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Debe subir el soporte del cambio de estrato. '
,p_when_button_pressed=>wwv_flow_api.id(123009148646462549)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3033494038338301)
,p_validation_name=>'Validar peso del documento'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from  apex_collections    ',
'where collection_name = ''DOCUMENTOS_CAMBIO_ESTRATO''',
'and c004 = :F_ID_INSTNCIA_FLJO',
'and dbms_lob.getlength(blob001) > 0'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('El documento cargado est\00E1 da\00F1ado, revisar.')
,p_when_button_pressed=>wwv_flow_api.id(123009148646462549)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(123020941141462602)
,p_name=>'Al Cambiar Fecha Inicio Aplicacion'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_FCHA_INCIO_APLCCION'
,p_condition_element=>'P16_FCHA_INCIO_APLCCION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11998154604612402)
,p_event_id=>wwv_flow_api.id(123020941141462602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('console.log("===== INICIO VALIDACI\00D3N =====");'),
'',
'const fechaInicio = $v("P16_FCHA_INCIO_APLCCION");',
'const fechaDoc = $v("P16_FCHA_DCMNTO_SPRTE");',
'',
'console.log("Fecha inicio:", fechaInicio);',
'console.log("Fecha documento:", fechaDoc);',
'',
'if (!fechaInicio || !fechaDoc) {',
'    console.log("No hay fechas suficientes para validar");',
'    return;',
'}',
'',
'const obtenerAnio = (fecha) => parseInt(fecha.split("/")[2], 10);',
'',
'const anioInicio = obtenerAnio(fechaInicio);',
'const anioDoc = obtenerAnio(fechaDoc);',
'',
unistr('console.log("A\00F1o inicio:", anioInicio);'),
unistr('console.log("A\00F1o documento:", anioDoc);'),
'',
'let nuevaFecha;',
'let respuesta = 0;',
'',
'if (anioInicio < anioDoc) {',
'',
unistr('    console.log("CONDICI\00D3N: a\00F1o inicio menor que a\00F1o documento");'),
'',
'    nuevaFecha = "01/01/" + anioDoc;',
'    respuesta = 1;',
'',
'    apex.message.alert(',
unistr('        "La fecha de inicio de aplicaci\00F3n no puede ser inferior a la vigencia del documento soporte. " +'),
unistr('        "La fecha ha sido actualizada autom\00E1ticamente a " + nuevaFecha + "."'),
'    );',
'',
'} else {',
'',
unistr('    console.log("CONDICI\00D3N: a\00F1o inicio v\00E1lido");'),
'',
'    nuevaFecha = "01/01/" + anioInicio;',
'}',
'',
'console.log("Fecha final calculada:", nuevaFecha);',
'console.log("Respuesta:", respuesta);',
'',
'/* Evita ciclo infinito en el change */',
'if ($v("P16_FCHA_INCIO_APLCCION") !== nuevaFecha) {',
'    apex.item("P16_FCHA_INCIO_APLCCION").setValue(nuevaFecha, null, true);',
'}',
'',
'$s("P16_RSPSTA", respuesta);',
'',
unistr('console.log("===== FIN VALIDACI\00D3N =====");'),
''))
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12011452089744103)
,p_event_id=>wwv_flow_api.id(123020941141462602)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(236788737545919839)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12011211581744101)
,p_name=>'Al Cambiar Fecha documento soporte'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_FCHA_DCMNTO_SPRTE'
,p_condition_element=>'P16_FCHA_DCMNTO_SPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12011375759744102)
,p_event_id=>wwv_flow_api.id(12011211581744101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('console.log("===== INICIO VALIDACI\00D3N =====");'),
'',
'const fechaInicio = $v("P16_FCHA_INCIO_APLCCION");',
'const fechaDoc = $v("P16_FCHA_DCMNTO_SPRTE");',
'',
'console.log("Fecha inicio:", fechaInicio);',
'console.log("Fecha documento:", fechaDoc);',
'',
'if (!fechaInicio || !fechaDoc) {',
'    console.log("No hay fechas suficientes para validar");',
'    return;',
'}',
'',
'const obtenerAnio = (fecha) => parseInt(fecha.split("/")[2], 10);',
'',
'const anioInicio = obtenerAnio(fechaInicio);',
'const anioDoc = obtenerAnio(fechaDoc);',
'',
unistr('console.log("A\00F1o inicio:", anioInicio);'),
unistr('console.log("A\00F1o documento:", anioDoc);'),
'',
'let nuevaFecha;',
'let respuesta = 0;',
'',
'if (anioInicio < anioDoc) {',
'',
unistr('    console.log("CONDICI\00D3N: a\00F1o inicio menor que a\00F1o documento");'),
'',
'    nuevaFecha = "01/01/" + anioDoc;',
'    respuesta = 1;',
'',
'    apex.message.alert(',
unistr('        "La fecha de inicio de aplicaci\00F3n no puede ser inferior a la vigencia del documento soporte. " +'),
unistr('        "La fecha ha sido actualizada autom\00E1ticamente a " + nuevaFecha + "."'),
'    );',
'',
'} else {',
'',
unistr('    console.log("CONDICI\00D3N: a\00F1o inicio v\00E1lido");'),
'',
'    nuevaFecha = "01/01/" + anioInicio;',
'}',
'',
'console.log("Fecha final calculada:", nuevaFecha);',
'console.log("Respuesta:", respuesta);',
'',
'/* Evita ciclo infinito en el change */',
'if ($v("P16_FCHA_INCIO_APLCCION") !== nuevaFecha) {',
'    apex.item("P16_FCHA_INCIO_APLCCION").setValue(nuevaFecha, null, true);',
'}',
'',
'$s("P16_RSPSTA", respuesta);',
'',
unistr('console.log("===== FIN VALIDACI\00D3N =====");'),
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12011776856744106)
,p_event_id=>wwv_flow_api.id(12011211581744101)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(236788737545919839)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15074999926738207)
,p_name=>'validar fecha inicio aplicacion '
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(123009148646462549)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15075006149738208)
,p_event_id=>wwv_flow_api.id(15074999926738207)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vgncia_fcha_incio_aplccion number :=',
'        nvl(to_number(to_char(to_date(:P16_FCHA_INCIO_APLCCION,''DD/MM/YYYY''),''YYYY'')),0);',
'',
'    v_vgncia_fcha_dcmnto number :=',
'        nvl(to_number(to_char(to_date(:P16_FCHA_DCMNTO_SPRTE,''DD/MM/YYYY''),''YYYY'')),0);',
'',
'    v_fcha varchar2(20);',
'',
'begin',
'',
'    if v_vgncia_fcha_incio_aplccion < v_vgncia_fcha_dcmnto then',
'        apex_util.set_session_state(''P16_RSPSTA'',1);',
'    else',
'        apex_util.set_session_state(''P16_RSPSTA'',0);',
'    end if;',
'',
'end;',
''))
,p_attribute_02=>'P16_FCHA_INCIO_APLCCION,P16_RSPSTA'
,p_attribute_03=>'P16_FCHA_INCIO_APLCCION,P16_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15075196017738209)
,p_event_id=>wwv_flow_api.id(15074999926738207)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P16_RSPSTA,P16_FCHA_INCIO_APLCCION'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Llamar a la funci\00F3n seg\00FAn la l\00F3gica requerida'),
'var respuesta = $v(''P16_RSPSTA'');',
'',
'if (respuesta === ''1'') {',
'',
'    // Mostrar mensaje',
'    apex.message.alert(',
unistr('      "La fecha de inicio de aplicaci\00F3n no puede ser inferior a la vigencia del documento soporte."'),
'    );',
'} else {',
'    apex.page.submit("Btn_Registrar_Novedad");',
'} ',
'',
''))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(123020540323462602)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Novedad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select a.id_nvdad_prdio',
'          , a.id_entdad_nvdad',
'          , a.nmro_dcmto_sprte',
'          , a.fcha_dcmnto_sprte',
'          , a.fcha_incio_aplccion',
'          , b.cdgo_estrto_nvo',
'          , a.obsrvcion',
'       into :P16_ID_NVDAD_PRDIO',
'          , :P16_ID_ENTDAD_NVDAD',
'          , :P16_NMRO_DCMTO_SPRTE',
'          , :P16_FCHA_DCMNTO_SPRTE',
'          , :P16_FCHA_INCIO_APLCCION',
'          , :P16_CDGO_ESTRTO',
'          , :P16_OBSRVCION',
'       from si_g_novedades_predio a',
'       join si_g_novedades_predio_dtlle b',
'         on a.id_nvdad_prdio   = b.id_nvdad_prdio',
'      where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'exception',
'     when no_data_found then',
'          :P16_ID_NVDAD_PRDIO := null;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15048380899950719)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Trae Vigencia Actual '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_vgncia number;',
'begin',
'  v_vgncia := pkg_gn_generalidades.fnc_cl_defniciones_cliente(:F_CDGO_CLNTE,''GFN'',''VAC'');',
'  :P16_VGNCIA_ACTUAL := v_vgncia ;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2596237316914306)
,p_process_sequence=>5
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar_archivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob blob;',
'     v_seq  varchar2(4000);',
'     r_temp_files apex_application_temp_files%rowtype;',
'begin',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P16_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS_CAMBIO_ESTRATO'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTOS_CAMBIO_ESTRATO'');',
'        end if;',
'',
'        begin',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS_CAMBIO_ESTRATO'';',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS_CAMBIO_ESTRATO''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => :P16_OBSRVCION_CMBIO',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_c004 => :F_ID_INSTNCIA_FLJO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS_CAMBIO_ESTRATO''',
'                                          , p_c001 => :P16_OBSRVCION_CMBIO',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_c004 => :F_ID_INSTNCIA_FLJO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'    end if;',
'end;'))
,p_process_error_message=>unistr('No se encontr\00F3 archivo.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2596135146914305)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(123020139429462600)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Novedad de Predial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	o_cdgo_rspsta  number;',
'	o_mnsje_rspsta varchar2(4000);',
'begin',
'   ',
'',
'	apex_json.initialize_clob_output;  ',
'    apex_json.open_array;',
'	apex_json.open_object;',
'	apex_json.write( ''id_sjto_impsto''  , :P16_ID_SJTO_IMPSTO );',
'	apex_json.write( ''cdgo_estrto_nvo'' , :P16_CDGO_ESTRTO );  ',
'	apex_json.close_all;',
'	',
'	pkg_si_novedades_predio.prc_rg_novedad_predial( p_id_usrio              => :F_ID_USRIO',
'                                                  , p_cdgo_clnte            => :F_CDGO_CLNTE',
'                                                  , p_id_impsto	            => :P16_ID_IMPSTO',
'                                                  , p_id_impsto_sbmpsto	    => :P16_ID_IMPSTO_SBMPSTO',
'                                                  , p_id_entdad_nvdad	    => :P16_ID_ENTDAD_NVDAD',
'                                                  , p_id_acto_tpo           => :P16_ID_ACTO_TPO',
'                                                  , p_nmro_dcmto_sprte      => :P16_NMRO_DCMTO_SPRTE',
'                                                  , p_fcha_dcmnto_sprte     => :P16_FCHA_DCMNTO_SPRTE',
'                                                  , p_fcha_incio_aplccion   => :P16_FCHA_INCIO_APLCCION',
'                                                  , p_obsrvcion			    => :P16_OBSRVCION',
'                                                  , p_id_instncia_fljo	 	=> :F_ID_INSTNCIA_FLJO',
'                                                  , p_json                  => apex_json.get_clob_output',
'                                                  , o_cdgo_rspsta           => o_cdgo_rspsta',
'                                                  , o_mnsje_rspsta          => o_mnsje_rspsta',
'                                                  , o_id_nvdad_prdio        => :P16_ID_NVDAD_PRDIO );',
'    ',
'    apex_json.free_output; ',
'	',
'	if( o_cdgo_rspsta != 0 ) then',
'		raise_application_error( -20001 , o_mnsje_rspsta );',
'	end if;',
'',
'end;  '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(123009148646462549)
,p_process_success_message=>unistr('Novedad de predial registrada con \00E9xito #&P16_ID_NVDAD_PRDIO.')
);
end;
/
