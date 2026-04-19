prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Gesti\00F3n de Clientes')
,p_step_title=>unistr('Gesti\00F3n de Clientes')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que desea eliminar este cliente?'';')
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20201125091322'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2223180448283405)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2223363779283407)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'Funcionalidad que permite modificar y eliminar los datos relacionados a un cliente.',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
' </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2224576335283419)
,p_plug_name=>unistr('Pesta\00F1a')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2223754563283411)
,p_plug_name=>unistr('Im\00E1genes Clientes')
,p_parent_plug_id=>wwv_flow_api.id(2224576335283419)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_imgen_clnte,',
'        b.cdgo_dfncion_clnte_ctgria || ''-'' || b.dscrpcion_dfncion_clnte_ctgria dfncion_clnte_ctgria,',
'        a.cdgo_imgen_clnte,',
'        a.file_name,',
'        a.file_mimetype',
'  from df_c_imagenes_cliente            a',
'  join df_c_definiciones_clnte_ctgria   b on a.id_dfncion_clnte_ctgria = b.id_dfncion_clnte_ctgria',
' where a.cdgo_clnte = :P30_CDGO_CLNTE',
'order by  2'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P30_CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(2223861341283412)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:RP,106:P106_ID_IMGEN_CLNTE:#ID_IMGEN_CLNTE#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>2223861341283412
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2223980449283413)
,p_db_column_name=>'ID_IMGEN_CLNTE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Ver'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2224191201283415)
,p_db_column_name=>'CDGO_IMGEN_CLNTE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2224668612283420)
,p_db_column_name=>'DFNCION_CLNTE_CTGRIA'
,p_display_order=>40
,p_column_identifier=>'G'
,p_column_label=>unistr('Categor\00EDa Definici\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2224723859283421)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'H'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2224878833283422)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2270211243571807)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'22703'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_IMGEN_CLNTE:DFNCION_CLNTE_CTGRIA:FILE_NAME:FILE_MIMETYPE:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95862385270194685)
,p_plug_name=>unistr('Gesti\00F3n de Clientes')
,p_parent_plug_id=>wwv_flow_api.id(2224576335283419)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97587534905821722)
,p_plug_name=>unistr('Configuraci\00F3n Financiera')
,p_parent_plug_id=>wwv_flow_api.id(2224576335283419)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_cnfgrcion_fnncra',
'        , cdgo_clnte',
'        , des_cdgo_rdndeo_exprsion_gnral',
'        , d_cdgo_rdndeo_exprsion_int_prd',
'        , d_cdgo_rdndeo_exprsion_int_ttl',
'        , descrpcion_cdgo_tpo_dias_anio',
'        , nmro_dias_anio',
'        , fcha_dsde',
'        , fcha_hsta',
'     from v_df_c_configuracion_fnncra',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
' order by fcha_dsde desc'))
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
 p_id=>wwv_flow_api.id(97587612833821723)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.:RP,179:P179_ID_CNFGRCION_FNNCRA:#ID_CNFGRCION_FNNCRA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>97587612833821723
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97587772648821724)
,p_db_column_name=>'ID_CNFGRCION_FNNCRA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Cnfgrcion Fnncra'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97587838942821725)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97587902327821726)
,p_db_column_name=>'DES_CDGO_RDNDEO_EXPRSION_GNRAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Redondeo Genal'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97588009330821727)
,p_db_column_name=>'D_CDGO_RDNDEO_EXPRSION_INT_PRD'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Redondeo de Inter\00E9s de Mora por periodo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97588149301821728)
,p_db_column_name=>'D_CDGO_RDNDEO_EXPRSION_INT_TTL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Redondeo Total de Inter\00E9s de Mora')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97588361970821730)
,p_db_column_name=>'DESCRPCION_CDGO_TPO_DIAS_ANIO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>unistr('C\00E1lculo de n\00FAmero de d\00EDas del a\00F1o')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97588482941821731)
,p_db_column_name=>'NMRO_DIAS_ANIO'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>unistr('N\00FAmero del d\00EDa del a\00F1o')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97588598835821732)
,p_db_column_name=>'FCHA_DSDE'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Fecha Desde'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97588670328821733)
,p_db_column_name=>'FCHA_HSTA'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Fecha hasta'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(98875900371941183)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'988760'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_CNFGRCION_FNNCRA:CDGO_CLNTE:DES_CDGO_RDNDEO_EXPRSION_GNRAL:D_CDGO_RDNDEO_EXPRSION_INT_PRD:D_CDGO_RDNDEO_EXPRSION_INT_TTL:DESCRPCION_CDGO_TPO_DIAS_ANIO:NMRO_DIAS_ANIO:FCHA_DSDE:FCHA_HSTA'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2223411335283408)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2223180448283405)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP,25::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2225294670283426)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2223180448283405)
,p_button_name=>'BTN_NUEVA_IMAGEN'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Nueva Imagen'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:RP,106:P106_CDGO_CLNTE:&P30_CDGO_CLNTE.'
,p_button_condition=>'P30_CDGO_CLNTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-image'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97589036908821737)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2223180448283405)
,p_button_name=>'BTN_NUEVA_CONFIGURACION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>unistr('Nueva Configuraci\00F3n <br> Financiera')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.:RP:P179_CDGO_CLNTE:&F_CDGO_CLNTE.'
,p_button_condition=>'P30_CDGO_CLNTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95862829526194702)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(95862385270194685)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P30_CDGO_CLNTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95863093017194702)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(95862385270194685)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP,30::'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95862722562194702)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(95862385270194685)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P30_CDGO_CLNTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95862980700194702)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95862385270194685)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P30_CDGO_CLNTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2223673156283410)
,p_branch_name=>unistr('Ir a la P\00E1gina Anterior')
,p_branch_action=>'P30_BRANCH'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(2223411335283408)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2223527897283409)
,p_name=>'P30_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2223180448283405)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35042010296215402)
,p_name=>'P30_CLLAR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Celular'
,p_source=>'CLLAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de celular del cliente, El n\00FAmero debe iniciar por el n\00FAmero tres (3) seguido de 9.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95864689161194726)
,p_name=>'P30_CDGO_CLNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95865071927194760)
,p_name=>'P30_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_source=>'CDGO_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmtcnco_idntfccion_tpo ||''-'' ||initcap(dscrpcion_idntfccion_tpo) as d,',
'   cdgo_idntfccion_tpo as r',
'from DF_S_IDENTIFICACIONES_TIPO',
'order by 1 asc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de identificaci\00F3n del cliente. ')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95865363682194764)
,p_name=>'P30_NMRO_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'NMRO_IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');", onkeypress="return validarExpresion(event, ''letraNumero'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del cliente')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95865772544194765)
,p_name=>'P30_NMBRE_CLNTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre Cliente'
,p_source=>'NMBRE_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>18
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el nombre del cliente '
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95866143427194768)
,p_name=>'P30_DRCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Direcci\00F3n')
,p_source=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la direcci\00F3n del cliente.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95866538272194768)
,p_name=>'P30_TLFNO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tel\00E9fono')
,p_source=>'TLFNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>11
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroParentesis'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero telef\00F3nico del cliente. con el siguiente formato (C)-NNNNNNN')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95866974191194768)
,p_name=>'P30_EMAIL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>18
,p_cMaxlength=>320
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el correo electr\00F3nico del cliente, de acuerdo con la estructura cliente@mail.com')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95867394249194769)
,p_name=>'P30_ID_PAIS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Pa\00EDs')
,p_source=>'ID_PAIS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el pa\00EDs de ubicaci\00F3n del cliente')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95867718360194769)
,p_name=>'P30_ID_DPRTMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Departamento'
,p_source=>'ID_DPRTMNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select nmbre_dprtmnto , id_dprtmnto from df_s_departamentos where id_pais = :P30_ID_PAIS'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P30_ID_PAIS'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el departamento de ubicaci\00F3n del cliente')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95868174338194769)
,p_name=>'P30_ID_MNCPIO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Municipio'
,p_source=>'ID_MNCPIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NMBRE_MNCPIO , ID_MNCPIO FROM DF_S_MUNICIPIOS',
'WHERE ID_DPRTMNTO = :P30_ID_DPRTMNTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P30_ID_DPRTMNTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el municipio de ubicaci\00F3n del cliente')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95868506109194769)
,p_name=>'P30_SLGAN'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Eslogan'
,p_source=>'SLGAN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el eslogan del cliente. M\00E1ximo 50 caracteres.')
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95868958102194770)
,p_name=>'P30_NMBRE_ENCRGDO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Encargado'
,p_source=>'NMBRE_ENCRGDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>18
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el nombre del encargado de la oficina del cliente'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95869370266194770)
,p_name=>'P30_ID_OFCNA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oficina'
,p_source=>'ID_OFCNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OFICINA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_ofcna as d,',
'       id_ofcna as r',
'  from df_c_oficinas',
'where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la oficina que correspondiente.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95869717049194770)
,p_name=>'P30_STIO_WEB'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sitio Web'
,p_source=>'STIO_WEB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>320
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el sitio web del cliente'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95870195297194770)
,p_name=>'P30_ACTVO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Casilla de activaci\00F3n y desactivaci\00F3n del cliente. ')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95870511899194771)
,p_name=>'P30_ESCDO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Escudo'
,p_source=>'ESCDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Almacene la imagen del escudo del cliente.'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
,p_attribute_11=>'image/*'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115859691384561401)
,p_name=>'P30_SMBLO_MNDA'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('S\00EDmbolo Moneda')
,p_source=>'SMBLO_MNDA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:$;$,\20AC;\20AC,\00A3;\00A3,Bs;Bs,R$;R$,\00A5;\00A5,\00A2;\00A2,kr;kr')
,p_cHeight=>1
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione de la lista el s\00EDmbolo de la moneda a utilizar')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115859714903561402)
,p_name=>'P30_FRMTO_MNDA'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Formato Moneda'
,p_source=>'FRMTO_MNDA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el formato de la moneda utilizada por el cliente'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115859876759561403)
,p_name=>'P30_NMRO_DCMLES'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(95862385270194685)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero Decimales')
,p_source=>'NMRO_DCMLES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese los n\00FAmeros de decimales utilizados por el cliente ')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(64707759930164503)
,p_validation_name=>'email'
,p_validation_sequence=>10
,p_validation=>'P30_EMAIL'
,p_validation2=>'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'El Email no cumple con el formato, favor ingresar Email de acuerdo a la estructura'
,p_always_execute=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23244865916739002)
,p_validation_name=>'CDLA_SOLO_NMROS'
,p_validation_sequence=>30
,p_validation=>'P30_NMRO_IDNTFCCION'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('El Tipo Identificaci\00F3n que est\00E1 intentando ingresar no es v\00E1lido. Por favor, verifique e intente nuevamente.')
,p_validation_condition=>'P30_CDGO_IDNTFCCION_TPO'
,p_validation_condition2=>'C'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(95865363682194764)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35042150049215403)
,p_validation_name=>unistr('valida formato del tel\00E9fono ')
,p_validation_sequence=>40
,p_validation=>'return pkg_gn_generalidades.fnc_vl_expresion(p_cdgo_exp => ''CCT'', p_vlor => :P30_TLFNO);'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>':P30_TLFNO IS NOT NULL AND :P30_ID_PAIS = 5'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(95866538272194768)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35042297061215404)
,p_validation_name=>'valida numero celular inicie por el numero 3'
,p_validation_sequence=>50
,p_validation=>'return pkg_gn_generalidades.fnc_vl_expresion(p_cdgo_exp => ''CCC'', p_vlor => :P30_CLLAR);'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>':P30_CLLAR IS NOT NULL AND :P30_ID_PAIS = 5'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(35042010296215402)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2225425291283428)
,p_name=>unistr('Refrescar Regi\00F3n al Cerrar el Dialogo')
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(2223754563283411)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2225508121283429)
,p_event_id=>wwv_flow_api.id(2225425291283428)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2223754563283411)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2225802845283432)
,p_name=>unistr('Rerescar la regi\00F3n de Imagens de cliente al cerrar la modal de imagenes de clientes')
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(2223180448283405)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2225919008283433)
,p_event_id=>wwv_flow_api.id(2225802845283432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2223754563283411)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97589175127821738)
,p_name=>unistr('Rerescar la regi\00F3n de configuraci\00F3n financiera al cerrar la modal de configuraci\00F3n financiera')
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(97589036908821737)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97589295266821739)
,p_event_id=>wwv_flow_api.id(97589175127821738)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(97587534905821722)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97589707312821744)
,p_name=>unistr('Refrescar la regi\00F3n de configuraci\00F3n al cerrar la modal llamada desde el editar de esa misma region')
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(97587534905821722)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97589884580821745)
,p_event_id=>wwv_flow_api.id(97589707312821744)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(97587534905821722)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(64707598499164501)
,p_name=>unistr('May\00FAsculas')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_NMBRE_CLNTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(64707677730164502)
,p_event_id=>wwv_flow_api.id(64707598499164501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'campoMayuscula(this.triggeringElement);'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95871365119194774)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_S_CLIENTES'
,p_attribute_02=>'DF_S_CLIENTES'
,p_attribute_03=>'P30_CDGO_CLNTE'
,p_attribute_04=>'CDGO_CLNTE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95871799494194774)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_S_CLIENTES'
,p_attribute_02=>'DF_S_CLIENTES'
,p_attribute_03=>'P30_CDGO_CLNTE'
,p_attribute_04=>'CDGO_CLNTE'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95872153219194774)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95862980700194702)
);
end;
/
