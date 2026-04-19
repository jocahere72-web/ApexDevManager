prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Informaci\00F3n Ex\00F3gena')
,p_step_title=>unistr('Informaci\00F3n Ex\00F3gena')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
''))
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.ayuda-container {',
'    max-width: 260px;',
'    margin: auto;',
'    font-family: Arial, sans-serif;',
'}',
'',
'.ayuda-title {',
'    text-align: center;',
'    font-weight: bold;',
'    font-size: 1.1em;',
'    margin-bottom: 1rem;',
'	margin-top: 1rem;',
'}',
'',
'.ayuda-btn {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    background-color: #f8f9fa;',
'    border: 1px solid #ddd;',
'    border-radius: 10px;',
'    padding: 10px 15px;',
'    margin-bottom: 10px;',
'    text-decoration: none;',
'    color: #007bff;',
'    font-weight: 500;',
'    transition: background-color 0.2s ease;',
'    font-size: 1.2rem; ',
'}',
'',
'.ayuda-btn:hover {',
'    background-color: #e9ecef;',
'    text-decoration: none;',
'}',
'',
'.ayuda-btn i {',
'    font-size: 1.5rem;',
'    margin-left: 2px;',
'}'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250804102326'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11576859048196550)
,p_plug_name=>unistr('Par\00E1metros de Busqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66599028073887902)
,p_plug_name=>unistr('Informaci\00F3n del Sujeto Impuesto')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69146057680003603)
,p_plug_name=>unistr('Informaci\00F3n del Sujeto Impuesto')
,p_parent_plug_id=>wwv_flow_api.id(66599028073887902)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct a.nmbre_rzon_scial as nmbre_rzon_scial,',
'       b.drccion  as drccion,',
'       b.email',
'  from si_i_personas a',
'  join v_si_i_sujetos_impuesto b on a.id_sjto_impsto  =b.id_sjto_impsto',
' where b.id_sjto_impsto = :P11_ID_SJTO_IMPSTO',
'   ',
'   '))
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
 p_id=>wwv_flow_api.id(69146395607003606)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>69146395607003606
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69146443902003607)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Nombre / Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69146505768003608)
,p_db_column_name=>'DRCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11529390839060208)
,p_db_column_name=>'EMAIL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69158253083226067)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'691583'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_RZON_SCIAL:DRCCION:EMAIL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66599649308887908)
,p_plug_name=>'Archivos Vigencia &P11_VGNCIA.'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.file_name',
'        , b.id_exgna_archvo_tpo',
'        , b.nmbre as nmbre_exgna_archvo_tpo',
'        , b.dscrpcion as dscrpcion_exgna_archvo_tpo',
'        , a.id_infrmcion_exgna',
'        , a.fcha_dgta',
'        , a.fcha_mdfca',
'        , b.vgncia',
'        , a.dscrpcion_prdo',
unistr('        , decode (a.indcdor_prcsdo,''S'',''S\00ED'',''N'',''No'') as indcdor_prcsdo'),
'        , a.id_sjto_impsto',
'        , a.id_impsto',
unistr('        , decode (a.indcdr_crrccion,''S'',''S\00ED'',''N'',''No'') as indcdr_crrccion'),
unistr('        , decode (a.indcdor_extmprneo,''S'',''S\00ED'',''N'',''No'') as indcdor_extmprneo'),
'from df_i_exogena_archivo_tipo b',
'left join v_gi_g_informacion_exogena a on a.id_exgna_archvo_tpo = b.id_exgna_archvo_tpo',
'                                      and a.id_sjto_impsto = :P11_ID_SJTO_IMPSTO',
'                                      and a.actvo = ''S''',
'                                      and a.id_prdo = :P11_ID_PRDO',
'where b.actvo = ''S''',
'  and b.id_impsto = :P11_ID_IMPSTO',
'  and b.vgncia = :P11_VGNCIA',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P11_ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(66599718148887909)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_ID_INFRMCION_EXGNA,P14_VGNCIA,P14_ID_EXGNA_ARCHVO_TPO,P14_ID_IMPSTO,P14_ID_SJTO_IMPSTO,P14_CDGO_CLNTE,P14_COUNT_ERROR,P14_INDCDOR_EXTMPRNEO,P14_ID_PRDO:#ID_INFRMCION_EXGNA#,&P11_VGNCIA.,#ID_EXGNA_ARCHVO_TP'
||'O#,&P11_ID_IMPSTO.,&P11_ID_SJTO_IMPSTO.,&P11_CDGO_CLNTE.,0,&P11_INDCDOR_EXTMPRNEO.,&P11_ID_PRDO.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>66599718148887909
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66600080316887912)
,p_db_column_name=>'ID_INFRMCION_EXGNA'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Id Infrmcion Exgna'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69129722925536202)
,p_db_column_name=>'ID_EXGNA_ARCHVO_TPO'
,p_display_order=>20
,p_column_identifier=>'G'
,p_column_label=>'Id Exgna Archvo Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69129857665536203)
,p_db_column_name=>'NMBRE_EXGNA_ARCHVO_TPO'
,p_display_order=>30
,p_column_identifier=>'H'
,p_column_label=>'Tipo Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69145806010003601)
,p_db_column_name=>'DSCRPCION_EXGNA_ARCHVO_TPO'
,p_display_order=>40
,p_column_identifier=>'I'
,p_column_label=>unistr('Descripci\00F3n Tipo Archivo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188136350519626011)
,p_db_column_name=>'VGNCIA'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95278424093762106)
,p_db_column_name=>'DSCRPCION_PRDO'
,p_display_order=>100
,p_column_identifier=>'R'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66599871297887910)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>110
,p_column_identifier=>'A'
,p_column_label=>'Nombre de Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66600348376887915)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>120
,p_column_identifier=>'D'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66600755313887919)
,p_db_column_name=>'FCHA_MDFCA'
,p_display_order=>130
,p_column_identifier=>'E'
,p_column_label=>unistr('Fecha de Actualizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8474916194912034)
,p_db_column_name=>'INDCDOR_PRCSDO'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>unistr('\00BFProcesado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8475009387912035)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8475156910912036)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11529463370060209)
,p_db_column_name=>'INDCDR_CRRCCION'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>unistr('\00BFCorrecci\00F3n?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12174862548665126)
,p_db_column_name=>'INDCDOR_EXTMPRNEO'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>unistr('\00BFExtempor\00E1neo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69105917863338348)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'691060'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'NMBRE_EXGNA_ARCHVO_TPO:DSCRPCION_EXGNA_ARCHVO_TPO:VGNCIA:DSCRPCION_PRDO:FILE_NAME:FCHA_DGTA:INDCDOR_PRCSDO:INDCDR_CRRCCION:INDCDOR_EXTMPRNEO:'
,p_sort_column_1=>'NMBRE_EXGNA_ARCHVO_TPO'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69146616198003609)
,p_plug_name=>'Cabecera'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>unistr('<h2 ><center><b>CARGUE DE INFORMACI\00D3N EX\00D3GENA  &P11_VGNCIA.</b></center></h2>')
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69302963865464526)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="ayuda-container">',
'    <div class="ayuda-title">',
'        Ayuda <i class="fa fa-question-circle"></i>',
'    </div>',
'',
'    <a class="ayuda-btn" href="#APP_IMAGES#RESOLUCION 0279 DIC-22 2023 EXOGENA PERIDO GRAVABLE 20230957.pdf" target="_blank">',
unistr('        Resoluci\00F3n 004 de 2025 - Informaci\00F3n Ex\00F3gena <i class="fa fa-download"></i>'),
'    </a>',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95277946401762101)
,p_plug_name=>'Industria y Comercio'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="ayuda-container">',
'    <a class="ayuda-btn" href="#APP_IMAGES#Archivo 1 - Informacion exogena.xlsx" target="_blank">',
unistr('        Descargar Plantilla M\00F3delo Ex\00F3gena<i class="fa fa-download"></i>'),
'    </a>',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11_ID_IMPSTO'
,p_plug_display_when_cond2=>'230012'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95278043908762102)
,p_plug_name=>'Sobretasa Gasolina'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="ayuda-container">',
'    <a class="ayuda-btn" href="#APP_IMAGES#EXOGENA_GASOLINA.xlsx" target="_blank">',
unistr('        Descargar Plantilla M\00F3delo Ex\00F3gena<i class="fa fa-download"></i>'),
'    </a>',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11_ID_IMPSTO'
,p_plug_display_when_cond2=>'230018'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95278120927762103)
,p_plug_name=>unistr('Alumbrado P\00FAblico')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="ayuda-container">',
'    <a class="ayuda-btn" href="#APP_IMAGES#EXOGENA_ALUMBRADO.xlsx" target="_blank">',
unistr('        Descargar Plantilla M\00F3delo Ex\00F3gena<i class="fa fa-download"></i>'),
'    </a>',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11_ID_IMPSTO_SBMPSTO'
,p_plug_display_when_cond2=>'23001159'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(66599238340887904)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(11576859048196550)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69130371314536208)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(66599028073887902)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,11::'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(69076588068835150)
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6975764251652702)
,p_name=>'P11_RZON_SCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_source=>'SELECT p.nmbre_rzon_scial FROM v_si_i_personas P WHERE p.id_sjto_impsto=:P11_ID_SJTO_IMPSTO;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6975898654652703)
,p_name=>'P11_FCHA_HSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11576790627196549)
,p_name=>'P11_ID_PRDO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(11576859048196550)
,p_prompt=>'Periodo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.prdo || '' - '' || a.dscrpcion || ''['' || a.cdgo_prdcdad || ''] - '' ||',
'       b.nmbre_impsto_sbmpsto || ''['' || b.cdgo_impsto_sbmpsto || '']'' d,',
'       a.id_prdo r',
'  from df_i_periodos a',
'  join df_i_impuestos_subimpuesto b',
'    on b.id_impsto = a.id_impsto',
'   and b.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
' where b.actvo = ''S''',
'   and (a.id_impsto_sbmpsto = :P11_ID_IMPSTO_SBMPSTO or :P11_ID_IMPSTO_SBMPSTO is null)',
'   and a.id_prdo in (select x.id_prdo',
'                       from df_i_calendario_exogena x',
'                      where x.id_impsto = :P11_ID_IMPSTO',
'                        and x.vgncia = :P11_VGNCIA)',
' order by a.id_impsto, a.id_impsto_sbmpsto, a.cdgo_prdcdad, a.prdo asc;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P11_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12174597580665123)
,p_name=>'P11_INDCDOR_EXTMPRNEO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66599190673887903)
,p_name=>'P11_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(11576859048196550)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69070680374835034)
,p_name=>'P11_ID_INFRMCION_EXGNA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69070954035835102)
,p_name=>'P11_ID_SJTO_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69071374051835120)
,p_name=>'P11_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69130112030536206)
,p_name=>'P11_INDCDOR_PRSNTCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69130202738536207)
,p_name=>'P11_MNSJE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69146746985003610)
,p_name=>'P11_VGNCIA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(11576859048196550)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct b.vgncia d,',
'       b.vgncia r ',
'from df_i_exogena_archivo_tipo b',
'join df_i_calendario_exogena a on a.vgncia = b.vgncia',
'where b.actvo = ''S''',
'and b.id_impsto = :P11_ID_IMPSTO',
'order by b.vgncia desc',
'--and b.vgncia BETWEEN EXTRACT(YEAR FROM SYSDATE) - 4 AND EXTRACT(YEAR FROM SYSDATE)'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69147405180003617)
,p_name=>'P11_INDCDOR_EXSTNCIA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186978971338307601)
,p_name=>'P11_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186980494913307616)
,p_name=>'P11_CDGO_CLNTE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(66599028073887902)
,p_item_default=>'&F_CDGO_CLNTE.'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(66600573338887917)
,p_name=>unistr('Al cerrar la modal Informaci\00F3n Exogena ')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(66599649308887908)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69145994878003602)
,p_event_id=>wwv_flow_api.id(66600573338887917)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69146828178003611)
,p_name=>unistr('Click Bot\00F3n Consultar')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(66599238340887904)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152061301133444806)
,p_event_id=>wwv_flow_api.id(69146828178003611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    cursor c_sujeto_impuesto is     ',
'        select a.id_sjto_impsto',
'        from v_si_i_sujetos_impuesto a',
'        where a.cdgo_clnte      = :F_CDGO_CLNTE',
'        and a.id_impsto         = :P11_ID_IMPSTO ',
'        and a.idntfccion_sjto   = :P11_IDNTFCCION;',
'',
'    cursor c_calendario is',
'        select a.fcha_hsta',
'        from df_i_calendario_exogena a',
'        where a.cdgo_clnte  = :F_CDGO_CLNTE ',
'        and a.id_impsto     = :P11_ID_IMPSTO',
'        and a.vgncia        = :P11_VGNCIA',
'        and a.id_prdo       = :P11_ID_PRDO',
'        and a.ultmo_dgto_nit = substr(:P11_IDNTFCCION, -1, 1)',
'        and sysdate         >= a.fcha_hsta;',
'',
'    v_id_sjto_impsto        number;',
'    v_fcha_hsta             date;',
'    ',
'begin',
'    apex_util.set_session_state(''P11_INDCDOR_EXSTNCIA'', ''0'');',
'    apex_util.set_session_state(''P11_INDCDOR_PRSNTCION'', ''0'');',
'    apex_util.set_session_state(''P11_INDCDOR_EXTMPRNEO'', ''N'');',
'',
'    open c_sujeto_impuesto;',
'    fetch c_sujeto_impuesto into v_id_sjto_impsto;',
'',
'    if c_sujeto_impuesto%found then ',
'        apex_util.set_session_state(''P11_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'        apex_util.set_session_state(''P11_INDCDOR_EXSTNCIA'', ''1'');',
'        ',
'        open c_calendario;',
'        fetch c_calendario into v_fcha_hsta;',
'    ',
'        if c_calendario%found then',
'            apex_util.set_session_state(''P11_FCHA_HSTA'', v_fcha_hsta);',
'            apex_util.set_session_state(''P11_INDCDOR_PRSNTCION'', ''0'');',
'            apex_util.set_session_state(''P11_INDCDOR_EXTMPRNEO'', ''S'');',
unistr('            apex_util.set_session_state(''P11_MNSJE'', ''<H4>Apreciado(a) contribuyente, actualmente est\00E1 cargando la informaci\00F3n ex\00F3gena de forma extempor\00E1nea, la fecha m\00E1xima de presentaci\00F3n fue el d\00EDa: ''||v_fcha_hsta||''.<br>Se le informa que estar\00E1 s')
||unistr('ujeto a un proceso de fiscalizaci\00F3n y posteriormente se le estar\00E1 notificando una posible sanci\00F3n por presentaci\00F3n de la informaci\00F3n de forma extempor\00E1nea.</H4><br>'');'),
'        else',
'            apex_util.set_session_state(''P11_FCHA_HSTA'', null);',
'            apex_util.set_session_state(''P11_INDCDOR_PRSNTCION'', ''1'');',
'            apex_util.set_session_state(''P11_INDCDOR_EXTMPRNEO'', ''N'');',
'        end if;',
'        ',
'        close c_calendario;',
'        ',
'    else',
'        apex_util.set_session_state(''P11_ID_SJTO_IMPSTO'', null);',
'        apex_util.set_session_state(''P11_INDCDOR_EXSTNCIA'', ''0'');',
unistr('        apex_util.set_session_state(''P11_MNSJE'', ''<H4>La identificaci\00F3n ingresada no existe.<br>Por favor realizar el registro en la opci\00F3n Solicitud Inscripci\00F3n Contribuyentes ICA.</H4><br>'');'),
'    end if;',
'    ',
'    close c_sujeto_impuesto;',
'    ',
'exception',
'    when others then ',
'        apex_util.set_session_state(''P11_INDCDOR_EXSTNCIA'', ''0'');',
'        apex_util.set_session_state(''P11_INDCDOR_PRSNTCION'', ''0'');',
'        apex_util.set_session_state(''P11_INDCDOR_EXTMPRNEO'', ''N'');',
'        apex_util.set_session_state(''P11_ID_SJTO_IMPSTO'', null);',
'        apex_util.set_session_state(''P11_FCHA_HSTA'', null);',
'        ',
'        if c_sujeto_impuesto%isopen then',
'            close c_sujeto_impuesto;',
'        end if;',
'        if c_calendario%isopen then',
'            close c_calendario;',
'        end if;',
'end;       ',
''))
,p_attribute_02=>'P11_IDNTFCCION,P11_VGNCIA,P11_ID_PRDO,P11_ID_IMPSTO,F_CDGO_CLNTE'
,p_attribute_03=>'P11_ID_SJTO_IMPSTO,P11_INDCDOR_EXSTNCIA,P11_INDCDOR_PRSNTCION,P11_MNSJE,P11_INDCDOR_EXTMPRNEO,P11_FCHA_HSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69148209101003625)
,p_event_id=>wwv_flow_api.id(69146828178003611)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P11_IDNTFCCION'') == '''' ){',
'    Swal.fire({',
'        icon:    ''error'',',
unistr('        title:   ''<H2>Informaci\00F3n Ex\00F3gena</H2>'','),
unistr('        html:    ''<H4>Digite una identificaci\00F3n o NIT.</H4>'''),
'             }).then((result) => {',
'                                  apex.item("P11_IDNTFCCION").setValue('''');',
'                                  apex.item("P11_ID_SJTO_IMPSTO").setValue('''');',
'                                  apex.submit();',
'                                 }',
'                    );',
'}else{',
'    if ($v(''P11_VGNCIA'') == '''' ){',
'        Swal.fire({',
'            icon:    ''error'',',
unistr('            title:   ''<H2>Informaci\00F3n Ex\00F3gena</H2>'','),
'            html:    ''<H4>Seleccione una Vigencia de la lista.</H4>''',
'                 }).then((result) => {',
'                                      apex.item("P11_VGNCIA").setValue('''');',
'                                      apex.submit();',
'                                     }',
'                        );',
'    }else{',
'        if ($v(''P11_ID_PRDO'') == '''' ){',
'            Swal.fire({',
'                icon:    ''error'',',
unistr('                title:   ''<H2>Informaci\00F3n Ex\00F3gena</H2>'','),
'                html:    ''<H4>Seleccione un Periodo de la lista.</H4>''',
'                     }).then((result) => {',
'                                          apex.item("P11_ID_PRDO").setValue('''');',
'                                          apex.submit();',
'                                         }',
'                            );',
'        }else{',
'            if($v(''P11_INDCDOR_EXSTNCIA'') == ''1'' ){',
'                if($v(''P11_INDCDOR_PRSNTCION'') == ''1'' ){ ',
'                    apex.submit();',
'                }else{',
'                    Swal.fire({',
'                        icon:    ''error'',',
unistr('                        title:   ''<H2>Informaci\00F3n Ex\00F3gena</H2>'','),
'                        html:    $v(''P11_MNSJE'')',
'                             }).then((result) => {',
'                                                  apex.submit();',
'                                                 }',
'                                    ); ',
'                }    ',
'            }else{',
'                Swal.fire({',
'                    icon:    ''error'',',
unistr('                    title:   ''<H2>Informaci\00F3n Ex\00F3gena</H2>'','),
'                    html:    $v(''P11_MNSJE'')',
'                         }).then((result) => {',
'                                              apex.submit();',
'                                             }',
'                                ); ',
'            };',
'        };',
'    };',
'};'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(66599543658887907)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta del Id sujeto impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_sjto_impsto',
'          into :P11_ID_SJTO_IMPSTO',
'          from v_si_i_sujetos_impuesto',
'         where cdgo_clnte        = :F_CDGO_CLNTE',
'           and id_impsto         = :P11_ID_IMPSTO ',
'           and idntfccion_sjto   = :P11_IDNTFCCION;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
null;
end;
/
