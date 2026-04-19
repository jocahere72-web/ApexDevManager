prompt --application/pages/page_00390
begin
wwv_flow_api.create_page(
 p_id=>390
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registrar TJ'
,p_step_title=>unistr('Registrar T\00EDtulo Judicial')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JNARVAEZ'
,p_last_upd_yyyymmddhh24miss=>'20260309091536'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16582722666785009)
,p_plug_name=>'Registro TJ'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GF_G_TITULOS_JUDICIAL'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16869373432811928)
,p_plug_name=>unistr('<b>T\00EDtulos Registrados</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
'        --,a.idntfccion_dmndnte',
'        --,a.nmbre_dmndnte',
'        ,decode(a.id_ttlo_jdcial_area,a.id_ttlo_jdcial_area, c.nmbre_area , ''-'') as id_ttlo_jdcial_area',
'        ,decode(a.cdgo_idntfccion_tpo_dmnddo, a.cdgo_idntfccion_tpo_dmnddo, b.dscrpcion_idntfccion_tpo, ''-'') as cdgo_idntfccion_tpo_dmnddo',
'        ,a.idntfccion_dmnddo',
'        ,a.nmbre_dmnddo',
'        ,a.nmro_ttlo_pdre',
'        ,a.id_ttlo_pdre',
'        ,a.cdgo_entdad_cnsgnnte||'' - ''||d.nmbre_bnco as cdgo_entdad_cnsgnnte',
'        ,a.id_bnco_cnsgnnte',
'        ,decode(a.cdgo_ttlo_jdcial_estdo, a.cdgo_ttlo_jdcial_estdo, f.dscrpcion, ''-'') as cdgo_ttlo_jdcial_estdo',
'        ,a.id_embrgo_rslcion',
'        ,a.id_instncia_fljo_pdre',
'        ,a.id_instncia_fljo',
'        ,a.id_slctud',
'        ,a.cdgo_entdad_rcddr||'' - ''||e.nmbre_bnco as cdgo_entdad_rcddr',
'        ,a.id_bnco_rcddr',
'        ,a.cnsctvo_embrgo',
'        ,case',
'            when  a.cdgo_ttlo_jdcial_estdo = ''RGS'' then ''<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">''',
'         end as link',
'from gf_g_titulos_judicial a',
'join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'join df_c_areas c on c.id_area = a.id_ttlo_jdcial_area',
'join df_c_bancos d on d.id_bnco = a.id_bnco_cnsgnnte',
'join df_c_bancos e on e.id_bnco = a.id_bnco_rcddr',
'left join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'left join mc_g_embargos_resolucion g on g.id_embrgos_rslcion = a.id_embrgo_rslcion',
'where a.nmro_ttlo_jdcial = nvl(:P390_NMRO_TTLO, a.nmro_ttlo_jdcial)',
'  and a.idntfccion_dmnddo = nvl(:P390_IDNTFCCION_DMNDDO, a.idntfccion_dmnddo)',
'  and a.cdgo_ttlo_jdcial_estdo = nvl(:P390_CDGO_TTLO_JDCIAL_ESTDO, a.cdgo_ttlo_jdcial_estdo)',
'  and ((a.fcha_cnsttcion between :P390_FCHA_INCIO and :P390_FCHA_FNAL)',
'       or (a.fcha_cnsttcion >= :P390_FCHA_INCIO and :P390_FCHA_FNAL is null) ',
'       or (a.fcha_cnsttcion <= :P390_FCHA_FNAL and :P390_FCHA_INCIO  is null)',
'       or(:P390_FCHA_INCIO is null and :P390_FCHA_FNAL is null ))',
'--and a.id_instncia_fljo is null',
'--and a.idntfccion_dmnddo = :P390_IDNTFCCION',
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
 p_id=>wwv_flow_api.id(16872665931821405)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'BVILLEGAS'
,p_internal_uid=>16872665931821405
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16872749412821406)
,p_db_column_name=>'ID_TTLO_JDCIAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Ttlo Jdcial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16872893073821407)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16872976720821408)
,p_db_column_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Ttlo Jdcial Crgdo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16873069384821409)
,p_db_column_name=>'NMRO_TTLO_JDCIAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16873125584821410)
,p_db_column_name=>'FCHA_CNSTTCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Fecha<br>Constituci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16873206098821411)
,p_db_column_name=>'VLOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G999D99'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16873589483821414)
,p_db_column_name=>'ID_TTLO_JDCIAL_AREA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\00C1rea')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16873650418821415)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16873705129821416)
,p_db_column_name=>'IDNTFCCION_DMNDDO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Identificaci\00F3n<br>Demandado')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16873857944821417)
,p_db_column_name=>'NMBRE_DMNDDO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Nombre<br>Demandado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16873945665821418)
,p_db_column_name=>'NMRO_TTLO_PDRE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874017606821419)
,p_db_column_name=>'ID_TTLO_PDRE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Id Ttlo Pdre'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874171741821420)
,p_db_column_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Entidad<br>Consignante'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874247797821421)
,p_db_column_name=>'ID_BNCO_CNSGNNTE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Id Bnco Cnsgnnte'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874325575821422)
,p_db_column_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>unistr('Estado T\00EDtulo Judicial')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874407651821423)
,p_db_column_name=>'ID_EMBRGO_RSLCION'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>unistr('Resoluci\00F3n Embargo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874558613821424)
,p_db_column_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Id Instncia Fljo Pdre'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874607047821425)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Id Instncia Fljo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874730266821426)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Id Solicitud PQR'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874875260821427)
,p_db_column_name=>'CDGO_ENTDAD_RCDDR'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Entidad<br>Recaudadora'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16874926102821428)
,p_db_column_name=>'ID_BNCO_RCDDR'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Id Bnco Rcddr'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16875285411821431)
,p_db_column_name=>'CNSCTVO_EMBRGO'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Consecutivo Embargo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21266037220406402)
,p_db_column_name=>'LINK'
,p_display_order=>250
,p_column_identifier=>'Z'
,p_column_label=>'Editar'
,p_column_link=>'f?p=&APP_ID.:391:&SESSION.::&DEBUG.:RP:P391_ID_TTLO_JDCIAL:#ID_TTLO_JDCIAL#'
,p_column_linktext=>'#LINK#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(16951409353140405)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'169515'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'LINK:NMRO_TTLO_JDCIAL:FCHA_CNSTTCION:VLOR:CDGO_IDNTFCCION_TPO_DMNDDO:IDNTFCCION_DMNDDO:NMBRE_DMNDDO:CDGO_ENTDAD_CNSGNNTE:CDGO_ENTDAD_RCDDR:CDGO_TTLO_JDCIAL_ESTDO:CNSCTVO_EMBRGO:NMRO_TTLO_PDRE:'
,p_sort_column_1=>'FCHA_CNSTTCION'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(21283656112623040)
,p_report_id=>wwv_flow_api.id(16951409353140405)
,p_name=>unistr('T\00EDtulos Registrados')
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_operator=>'='
,p_expr=>'REGISTRADO'
,p_condition_sql=>' (case when ("CDGO_TTLO_JDCIAL_ESTDO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''REGISTRADO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#99CCFF'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16875035546821429)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41215945822738523)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45483606026270266)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('<b>1.</b> Registrar t\00EDtulo judicial.<br><br>'),
unistr('<b>2.</b> Modificar t\00EDtulo judicial.<br><br>'),
unistr('<b>3.</b> Eliminar t\00EDtulo judicial.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16875154007821430)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16875035546821429)
,p_button_name=>'BTN_NVO_TTLO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo T\00EDtulo')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:391:&SESSION.::&DEBUG.:RP,391::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-clipboard-new'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22045367567112601)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(16875035546821429)
,p_button_name=>'BTN_NVO_TTLO_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo T\00EDtulo')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:388:&SESSION.::&DEBUG.:RP,388::'
,p_icon_css_classes=>'fa-clipboard-new'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5584467780791601)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(16875035546821429)
,p_button_name=>'BTN_GSTION'
,p_button_static_id=>'BTN_GSTION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Gesti\00F3n De T\00EDtulos')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:249:&SESSION.::&DEBUG.:RP,249::'
,p_icon_css_classes=>'fa-arrow-up-right-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16585460398785036)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16582722666785009)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-clipboard-new'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22458772473533291)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(41215945822738523)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16582944005785011)
,p_name=>'P390_ID_TTLO_JDCIAL'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_source=>'ID_TTLO_JDCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16583088550785012)
,p_name=>'P390_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16583171636785013)
,p_name=>'P390_ID_TTLO_JDCIAL_CRGDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_source=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16583204489785014)
,p_name=>'P390_NMRO_TTLO_JDCIAL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_prompt=>unistr('N\00FAmero T\00EDtulo Judicial')
,p_source=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16583388675785015)
,p_name=>'P390_FCHA_CNSTTCION'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_prompt=>unistr('Fecha Constituci\00F3n')
,p_source=>'FCHA_CNSTTCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16583414747785016)
,p_name=>'P390_VLOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_prompt=>'Valor'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_source=>'VLOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16583559747785017)
,p_name=>'P390_IDNTFCCION_DMNDNTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_idntfccion',
'  from df_s_clientes',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('Identificaci\00F3n Demandante')
,p_source=>'IDNTFCCION_DMNDNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16583607721785018)
,p_name=>'P390_NMBRE_DMNDNTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte',
'  from df_s_clientes',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Nombre Demandante'
,p_source=>'NMBRE_DMNDNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16583784218785019)
,p_name=>'P390_ID_TTLO_JDCIAL_AREA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_prompt=>unistr('\00C1rea')
,p_source=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_area as d,',
'       id_area as r',
'  from df_c_areas',
' order by 2 asc'))
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16584066062785022)
,p_name=>'P390_NMBRE_DMNDDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_prompt=>'Nombre Demandado'
,p_source=>'NMBRE_DMNDDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rzon_scial',
'from v_si_i_sujetos_responsable a',
'where a.cdgo_idntfccion_tpo = :P390_CDGO_IDNTFCCION_TPO_DMNDDO',
'and a.id_sjto_rspnsble = :P390_IDNTFCCION_DMNDDO'))
,p_cSize=>30
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16584167181785023)
,p_name=>'P390_NMRO_TTLO_PDRE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_prompt=>unistr('N\00FAmero T\00EDtulo Judicial Padre')
,p_source=>'NMRO_TTLO_PDRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16584264224785024)
,p_name=>'P390_ID_TTLO_PDRE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_source=>'ID_TTLO_PDRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16584353472785025)
,p_name=>'P390_CDGO_ENTDAD_CNSGNNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_source=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16584443401785026)
,p_name=>'P390_ID_BNCO_CNSGNNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_prompt=>unistr('C\00F3digo Entidad Consignante')
,p_source=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'       and cdgo_bnco = 40',
'  order by cdgo_bnco'))
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16584639221785028)
,p_name=>'P390_ID_EMBRGO_RSLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_source=>'ID_EMBRGO_RSLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16584734194785029)
,p_name=>'P390_ID_INSTNCIA_FLJO_PDRE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_source=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16584877530785030)
,p_name=>'P390_ID_INSTNCIA_FLJO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_source=>'ID_INSTNCIA_FLJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16584944333785031)
,p_name=>'P390_ID_SLCTUD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_source=>'ID_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16585051217785032)
,p_name=>'P390_CDGO_ENTDAD_RCDDR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_source=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16585144272785033)
,p_name=>'P390_ID_BNCO_RCDDR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_item_source_plug_id=>wwv_flow_api.id(16582722666785009)
,p_prompt=>unistr('C\00F3digo Entidad Recaudadora')
,p_source=>'ID_BNCO_RCDDR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'  order by cdgo_bnco'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16585534502785037)
,p_name=>'P390_RSPSTA'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(16582722666785009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22460254553533328)
,p_name=>'P390_NMRO_TTLO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(41215945822738523)
,p_prompt=>unistr('<b>T\00EDtulo No. </b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22460694886533332)
,p_name=>'P390_IDNTFCCION_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(41215945822738523)
,p_prompt=>unistr('<b>Identificaci\00F3n Demandado</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22461042939533332)
,p_name=>'P390_CDGO_TTLO_JDCIAL_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(41215945822738523)
,p_prompt=>unistr('<b>Estado T\00EDtulo</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TITULOS_ESTADOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_ttlo_jdcial_estdo as r',
'  from gf_d_titulos_judicial_estdo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22461446964533332)
,p_name=>'P390_FCHA_INCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(41215945822738523)
,p_prompt=>unistr('<b>Fecha Constituci\00F3n Desde</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22461817591533333)
,p_name=>'P390_FCHA_FNAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(41215945822738523)
,p_prompt=>unistr('<b>Fecha Constituci\00F3n Hasta</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22466424807644501)
,p_name=>'P390_CDGO_IDNTFCCION_TPO_DMNDDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(41215945822738523)
,p_prompt=>unistr('<b>Tipo Identificaci\00F3n Demandado</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo as d,',
'       cdgo_idntfccion_tpo as r',
'  from df_s_identificaciones_tipo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16682051889331115)
,p_computation_sequence=>40
,p_computation_item=>'P390_CDGO_ENTDAD_CNSGNNTE'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_bnco ',
'  from df_c_bancos a',
' where a.id_bnco = :P390_ID_BNCO_CNSGNNTE'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16682377445332770)
,p_computation_sequence=>40
,p_computation_item=>'P390_CDGO_ENTDAD_RCDDR'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_bnco ',
'  from df_c_bancos a',
' where a.id_bnco = :P390_ID_BNCO_RCDDR'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16682670089335106)
,p_computation_sequence=>40
,p_computation_item=>'P390_ID_TTLO_PDRE'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_TTLO_JDCIAL',
'FROM GF_G_TITULOS_JUDICIAL',
'WHERE NMRO_TTLO_JDCIAL = :P390_NMRO_TTLO_PDRE'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16974260825729409)
,p_name=>'Al cerrar la modal'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16974388439729410)
,p_event_id=>wwv_flow_api.id(16974260825729409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(16869373432811928)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22462209338537461)
,p_name=>'Al cambiar tributo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P390_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22462656224537472)
,p_event_id=>wwv_flow_api.id(22462209338537461)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select min(id_impsto_sbmpsto)',
'      into :P390_ID_IMPSTO_SBMPSTO       ',
'      from df_i_impuestos_subimpuesto',
'     where id_impsto = :P390_ID_IMPSTO;',
'end;'))
,p_attribute_02=>'P390_ID_IMPSTO,P390_ID_IMPSTO_SBMPSTO'
,p_attribute_03=>'P390_ID_IMPSTO_SBMPSTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22466567949644502)
,p_name=>'Al cambiar fecha desde'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P390_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22466633573644503)
,p_event_id=>wwv_flow_api.id(22466567949644502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P390_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P390_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16664880885858738)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Secuencia DML'
,p_process_sql_clob=>':P390_ID_TTLO_JDCIAL := sq_gf_g_titulos_judicial.nextval;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16585460398785036)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16585295337785034)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(16582722666785009)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Registrar  TJ'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16585460398785036)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('\00A1T\00EDtulo Registrado Satisfactoriamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16666160162882377)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registro Traza'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_cdgo_rspsta            number;',
'    v_id_instncia_fljo       number;',
'    v_id_fljo_trea_orgen     number;',
'    v_type_rspsta            varchar2(1);',
'    v_mnsje_rspsta           varchar2(200); ',
'    v_error_msg              number;  ',
'    ',
'begin',
'    pkg_gf_titulos_judicial.prc_rg_titulos_traza(p_cdgo_clnte                 =>    :F_CDGO_CLNTE,',
'                                                 p_id_ttlo_jdcial             =>    :P390_ID_TTLO_JDCIAL,',
'                                                 p_cdgo_ttlo_jdcial_estdo     =>    :P390_CDGO_TTLO_JDCIAL_ESTDO, ',
unistr('                                                 p_obsrvcion                  =>    ''T\00CDTULO No. ''||:P390_NMRO_TTLO_JDCIAL ||'' REGISTRADO'','),
'                                                 p_id_usrio                   =>    :F_ID_USRIO,',
'                                                 o_cdgo_rspsta                =>    v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta               =>    :P390_RSPSTA);',
'    /*begin',
'                        ',
'         select a.id_instncia_fljo,',
'                b.id_fljo_trea_orgen',
'            into v_id_instncia_fljo,',
'                 v_id_fljo_trea_orgen ',
'            from gf_g_titulos_judicial a',
'            join wf_g_instancias_transicion b on a.id_instncia_fljo = b.id_instncia_fljo ',
'            and b.id_estdo_trnscion in (1,2)',
'            where id_ttlo_jdcial = :P390_ID_TTLO_JDCIAL;',
'    ',
'            pkg_pl_workflow_1_0.prc_rg_instancias_transicion(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                             p_id_fljo_trea		=> v_id_fljo_trea_orgen,',
'                                                             p_json				=> ''[]'' ,',
'                                                             o_type				=> v_type_rspsta,',
'                                                             o_mnsje			=> v_mnsje_rspsta,',
'                                                             o_id_fljo_trea		=> v_error_msg,',
'                                                             o_error			=> v_error_msg);',
'             if v_type_rspsta = ''S'' then',
'                raise_application_error( -20001 , v_mnsje_rspsta); ',
'             end if;         ',
'    end;    ',
'    ',
'     apex_util.set_session_state(''F_ID_FLJO_TREA'','''');*/',
'     ',
'    if v_cdgo_rspsta != 0 then',
unistr('        raise_application_error(-20001, ''Error al Registrar el T\00EDtulo'');'),
'    end if;    ',
'',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16585460398785036)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P390_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16582829014785010)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(16582722666785009)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Registrar TJ'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
