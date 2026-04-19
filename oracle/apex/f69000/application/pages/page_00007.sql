prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Consulta de Novedades  Predial'
,p_step_title=>'Consulta de Novedades  Predial'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_css_classes=>'parametroBusqueda2'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(88632095060928477)
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210204200356'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48047828026390203)
,p_plug_name=>'Consulta de Novedades'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_entdad_nvdad',
'     , a.dscrpcion_acto_tpo',
'     , a.nmro_dcmto_sprte',
'     , a.fcha_dcmnto_sprte',
'     , a.fcha_incio_aplccion',
'     , a.obsrvcion     ',
'     , a.fcha_rgstro',
'     , b.id_nvdad_prdio',
'     , b.idntfccion_sjto_frmtda',
'     , b.dscrpcion_dstno_antrior',
'     , b.dscrpcion_dstno_nvo',
'     , b.dscrpcion_uso_slo_antrior',
'     , b.dscrpcion_uso_slo_nvo',
'     , b.dscrpcion_estrto_antrior',
'     , b.dscrpcion_estrto_nvo',
'     , b.dscrpcion_sjto_estdo',
'     , c.id_nvdad_prdio_vgncia',
'     , c.id_nvdad_prdio_dtlle',
'     , c.vgncia',
'     , c.prdo',
'     , b.id_acto ',
'  from v_si_g_novedades_predio       a',
'  join v_si_g_novedades_predio_dtlle b   on a.id_nvdad_prdio        = b.id_nvdad_prdio   ',
'  join v_si_g_novedades_prdio_vgncia c   on b.id_nvdad_prdio_dtlle  = c.id_nvdad_prdio_dtlle     ',
' where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'   and a.id_impsto                   = :P7_ID_IMPSTO',
'   and a.id_impsto_sbmpsto           = :P7_ID_IMPSTO_SBMPSTO',
'   and ((trunc(a.fcha_rgstro)        between :P7_FCHA_INCIAL      and :P7_FCHA_FNAL)',
'       or (trunc(a.fcha_rgstro) >= :P7_FCHA_INCIAL and :P7_FCHA_FNAL is null) ',
'       or (trunc(a.fcha_rgstro) <= :P7_FCHA_FNAL and :P7_FCHA_INCIAL  is null)',
'       or(:P7_FCHA_INCIAL is null and :P7_FCHA_FNAL is null ))',
'   and a.fcha_incio_aplccion         = nvl(:P7_FCHA_INCIO_APLCCION, fcha_incio_aplccion)',
'   and a.id_acto_tpo                 = nvl(:P7_ID_ACTO_TPO, id_acto_tpo)',
'   and a.id_entdad_nvdad             = nvl(:P7_ID_ENTDAD_NVDAD, id_entdad_nvdad)   ',
'   and b.idntfccion_sjto             = nvl(:P7_IDNTFCCION_SJTO, b.idntfccion_sjto )',
'   and b.cdgo_nvdad_estdo            = ''AP'';'))
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
 p_id=>wwv_flow_api.id(48050472551390229)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato. ')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>48050472551390229
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48050500922390230)
,p_db_column_name=>'DSCRPCION_ENTDAD_NVDAD'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Entidad'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48050644340390231)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48050729689390232)
,p_db_column_name=>'NMRO_DCMTO_SPRTE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. Documento Soporte'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48050862404390233)
,p_db_column_name=>'FCHA_DCMNTO_SPRTE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Documento Soporte'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48050990586390234)
,p_db_column_name=>'FCHA_INCIO_APLCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Fecha Inicio Aplicaci\00F3n ')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051064681390235)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Observaci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051132185390236)
,p_db_column_name=>'ID_NVDAD_PRDIO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Id Nvdad Prdio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051296659390237)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051350325390238)
,p_db_column_name=>'DSCRPCION_DSTNO_ANTRIOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Destino Anterior '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051434110390239)
,p_db_column_name=>'DSCRPCION_DSTNO_NVO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Destino Nuevo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051564358390240)
,p_db_column_name=>'DSCRPCION_USO_SLO_ANTRIOR'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Uso Suelo Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051667437390241)
,p_db_column_name=>'DSCRPCION_USO_SLO_NVO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Uso Suelo Nuevo '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051718591390242)
,p_db_column_name=>'DSCRPCION_ESTRTO_ANTRIOR'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Estrato Anterior '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051829890390243)
,p_db_column_name=>'DSCRPCION_ESTRTO_NVO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Estrato Nuevo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48051956027390244)
,p_db_column_name=>'DSCRPCION_SJTO_ESTDO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Estado Sujeto '
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48052181244390246)
,p_db_column_name=>'ID_NVDAD_PRDIO_VGNCIA'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Id Nvdad Prdio Vgncia'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48052233683390247)
,p_db_column_name=>'ID_NVDAD_PRDIO_DTLLE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Id Nvdad Prdio Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101435729414456401)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>190
,p_column_identifier=>'X'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48052377958390248)
,p_db_column_name=>'VGNCIA'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48052474690390249)
,p_db_column_name=>'PRDO'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48241701407623603)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>'Ver Acto'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,#ID_ACTO#'
,p_column_linktext=>'<button type="button" class="t-Button t-Button--icon t-Button--success t-Button--simple t-Button--iconRight">Ver<span aria-hidden="true" class="t-Icon t-Icon--right fa fa-eye"></span></button>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(48218481782523337)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'482185'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IDNTFCCION_SJTO_FRMTDA:DSCRPCION_DSTNO_ANTRIOR:DSCRPCION_DSTNO_NVO:DSCRPCION_ESTRTO_ANTRIOR:DSCRPCION_ESTRTO_NVO:DSCRPCION_USO_SLO_ANTRIOR:DSCRPCION_USO_SLO_NVO:DSCRPCION_ENTDAD_NVDAD:DSCRPCION_ACTO_TPO:NMRO_DCMTO_SPRTE:FCHA_DCMNTO_SPRTE:FCHA_INCIO_A'
||'PLCCION:FCHA_RGSTRO:OBSRVCION:VGNCIA:PRDO:ID_ACTO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48595341836579510)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_entdad_nvdad',
'     , a.dscrpcion_acto_tpo',
'     , a.nmro_dcmto_sprte',
'     , a.fcha_dcmnto_sprte',
'     , a.fcha_incio_aplccion',
'     , a.obsrvcion',
'     , b.id_nvdad_prdio',
'     , b.idntfccion_sjto_frmtda',
'     , b.dscrpcion_dstno_antrior',
'     , b.dscrpcion_dstno_nvo',
'     , b.dscrpcion_uso_slo_antrior',
'     , b.dscrpcion_uso_slo_nvo',
'     , b.dscrpcion_estrto_antrior',
'     , b.dscrpcion_estrto_nvo',
'     , b.dscrpcion_sjto_estdo',
'     , c.id_nvdad_prdio_vgncia',
'     , c.id_nvdad_prdio_dtlle',
'     , c.vgncia',
'     , c.prdo',
'     , b.id_acto ',
'  from v_si_g_novedades_predio         a',
'  join v_si_g_novedades_predio_dtlle   b  ',
'    on a.id_nvdad_prdio              = b.id_nvdad_prdio',
'  join v_si_g_novedades_prdio_vgncia   c',
'    on b.id_nvdad_prdio_dtlle        = c.id_nvdad_prdio_dtlle',
' where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'   and a.id_impsto                   = :P7_ID_IMPSTO',
'   and a.id_impsto_sbmpsto           = :P7_ID_IMPSTO_SBMPSTO',
'   and a.fcha_incio_aplccion         = nvl(:P7_FCHA_INCIO_APLCCION, fcha_incio_aplccion)',
'   and a.id_acto_tpo                 = nvl(:P7_ID_ACTO_TPO, id_acto_tpo)',
'   and a.id_entdad_nvdad             = nvl(:P7_ID_ENTDAD_NVDAD, id_entdad_nvdad)   ',
'   and b.idntfccion_sjto             = nvl(:P7_IDNTFCCION_SJTO, b.idntfccion_sjto )',
'   and b.cdgo_nvdad_estdo            =''AP'';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48595480277579511)
,p_plug_name=>'Opciones 2'
,p_parent_plug_id=>wwv_flow_api.id(48595341836579510)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105695032675675804)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(197027056710016209)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <i>',
'        <b> ',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>  ',
'        </b>',
'    </i>',
'</h5>',
'<i>',
'    Funcionalidad que permite consultar las novedades registradas en el sistema de forma general o mediante filtro de consulta.',
'    <br>',
'    <br>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105696762921675821)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(105695032675675804)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48614193431673699)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(48595480277579511)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(48594845299579505)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P7_ID_RPRTE.,&P7_XML.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(48614193431673699)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48047793729390202)
,p_name=>'P7_IDNTFCCION_SJTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(105695032675675804)
,p_prompt=>unistr('Identificaci\00F3n:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto a consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48612794876670263)
,p_name=>'P7_XML'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(105695032675675804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48613074854671972)
,p_name=>'P7_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(48595480277579511)
,p_prompt=>'Reporte:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte   as d',
'     , id_rprte      as r',
'  from gn_d_reportes',
' where id_rprte=532;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101412170366026805)
,p_name=>'P7_FCHA_INCIAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(105695032675675804)
,p_prompt=>'Fecha de Registro Inicial:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione una fecha de aplicaci\00F3n a consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101412272461026806)
,p_name=>'P7_FCHA_FNAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(105695032675675804)
,p_prompt=>'Fecha de Registro Final:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione una fecha de aplicaci\00F3n a consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105696006974675814)
,p_name=>'P7_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105695032675675804)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Tributo'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Tributo a consular de la lista.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105696166891675815)
,p_name=>'P7_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105695032675675804)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'    , id_impsto_sbmpsto as r',
' from df_i_impuestos_subimpuesto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  and id_impsto  = :P7_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Sub-Impuesto'
,p_lov_cascade_parent_items=>'P7_ID_IMPSTO'
,p_ajax_items_to_submit=>'P7_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Sub-Tributo a consular de la lista.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105696367505675817)
,p_name=>'P7_FCHA_INCIO_APLCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(105695032675675804)
,p_prompt=>unistr('Fecha de Aplicaci\00F3n:')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione una fecha de aplicaci\00F3n a consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105696499282675818)
,p_name=>'P7_ID_ACTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(105695032675675804)
,p_prompt=>'Tipo de Acto:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, id_acto_tpo',
'from gn_d_actos_tipo',
'where cdgo_acto_tpo in (''ACD'',''ACE'',''ACU'')',
'and cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Tipo Acto'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Tipo de Acto a consular de la lista.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105696569464675819)
,p_name=>'P7_ID_ENTDAD_NVDAD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105695032675675804)
,p_prompt=>'Entidad:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion',
'    , a.id_entdad_nvdad',
' from df_i_entidades_novedad a',
'where exists (',
'                   select 1',
'                     from df_i_entidades_nvdd_act_tpo b',
'                    where b.id_entdad_nvdad = a.id_entdad_nvdad',
'                      and b.id_acto_tpo     = :P7_ID_ACTO_TPO',
'             )'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione una Entidad'
,p_lov_cascade_parent_items=>'P7_ID_ACTO_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione una Entidad a consular de la lista.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48594948064579506)
,p_name=>'Al cambiar reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_ID_RPRTE'
,p_condition_element=>'P7_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48595017778579507)
,p_event_id=>wwv_flow_api.id(48594948064579506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(48614193431673699)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48595144916579508)
,p_event_id=>wwv_flow_api.id(48594948064579506)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(48614193431673699)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48611822529664709)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_XML'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'begin',
'     ',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P7_ID_RPRTE;',
'  ',
'    :P7_XML :=    ''<data><id_impsto>''   || :P7_ID_IMPSTO           || ''</id_impsto>''',
'        || ''<id_impsto_sbmpsto>''   || :P7_ID_IMPSTO_SBMPSTO   || ''</id_impsto_sbmpsto>''         ',
'        || ''<id_acto_tpo>''         || :P7_ID_ACTO_TPO         || ''</id_acto_tpo>''         ',
'        || ''<id_entdad_nvdad>''     || :P7_ID_ENTDAD_NVDAD     || ''</id_entdad_nvdad>''         ',
'        || ''<fcha_incio_aplccion>'' || :P7_FCHA_INCIO_APLCCION || ''</fcha_incio_aplccion>''         ',
'        || ''<idntfccion_sjto>''     || :P7_IDNTFCCION_SJTO     || ''</idntfccion_sjto>''         ',
'        || ''<nmbre_rprte>''         || v_nmbre_rprte            || ''</nmbre_rprte></data>'' ;',
'        ',
'        ',
'exception',
'     when no_data_found then',
'          null;',
'end;',
'',
'',
'        ',
'        ',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
