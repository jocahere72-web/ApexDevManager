prompt --application/pages/page_00121
begin
wwv_flow_api.create_page(
 p_id=>121
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Inscripci\00F3n de personas Desconocidas')
,p_step_title=>unistr('Inscripci\00F3n de personas Desconocidas')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20220618113400'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88772462079139291)
,p_plug_name=>unistr('Informaci\00F3n del Contribuyente')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89209025993832486)
,p_plug_name=>unistr('<b>Informaci\00F3n General</b>')
,p_parent_plug_id=>wwv_flow_api.id(88772462079139291)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89209081373832487)
,p_plug_name=>'<b>Representante Legal</b>'
,p_parent_plug_id=>wwv_flow_api.id(88772462079139291)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89209185269832488)
,p_plug_name=>'<b>Actividad Principal</b>'
,p_parent_plug_id=>wwv_flow_api.id(88772462079139291)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89209722739832493)
,p_plug_name=>'<b>Establecimientos</b>'
,p_parent_plug_id=>wwv_flow_api.id(88772462079139291)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90623926375604874)
,p_plug_name=>'ESTABLECIMIENTOS'
,p_parent_plug_id=>wwv_flow_api.id(89209722739832493)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  seq_id  ',
'        , c001                                Nombre',
'        , c002                                Direccion',
'        , C003	                              Correo_Electronico',
'        , C004                                Telefono',
'        , c005 						          Codigo_CIIU',
'from APEX_collections                    ',
'where collection_name                     = ''ESTABLECIMIENTOS''',
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
 p_id=>wwv_flow_api.id(88208563881468010)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:RP:P122_SEQ_ID:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'LARIZA'
,p_internal_uid=>88208563881468010
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(88208669920468011)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(88208783908468012)
,p_db_column_name=>'NOMBRE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(88209179186468016)
,p_db_column_name=>'CODIGO_CIIU'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>unistr('C\00F3digo CIIU')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(88208842281468013)
,p_db_column_name=>'DIRECCION'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(88208941339468014)
,p_db_column_name=>'CORREO_ELECTRONICO'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Correo Electr\00F3nico')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(88209032736468015)
,p_db_column_name=>'TELEFONO'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(88288359921465201)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'882884'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:NOMBRE:DIRECCION:CORREO_ELECTRONICO:TELEFONO:CODIGO_CIIU'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89209973669832496)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>	'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89210112703832497)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="justify">Funcionalidad que permite registrar la solicitus de inscripci\00F3n de un nuevo contribuyente.<br> '),
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15579189012294874)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(89209973669832496)
,p_button_name=>'BTN_IR_PQR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Radicar Solicitud -  PQR'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP:P302_ID_MTVO:73'
,p_button_condition=>'P121_VALIDAR_IMPRIMIR'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15579502534294875)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(89209973669832496)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir Formulario'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:121:&SESSION.:IMPRIMIR:&DEBUG.:RP::'
,p_button_condition=>'P121_VALIDAR_IMPRIMIR'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(88210665346468031)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(89209973669832496)
,p_button_name=>'BTN_CARGAR_DATOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Confirmar Datos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P121_VALIDAR_IMPRIMIR'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15580372813294875)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(89209722739832493)
,p_button_name=>'BTN_ACTIVIDAD_ECONOMICA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Nuevo Establecimiento'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:RP,122::'
,p_icon_css_classes=>'fa-sitemap'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(15620787729294937)
,p_branch_name=>'Radicar Solicitud -  PQR'
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP,121:P302_ID_MTVO:72&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(15579189012294874)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(15620362356294937)
,p_branch_name=>'Radicar Solicitud -  PQR'
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP,121:P302_ID_MTVO:73&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(15579189012294874)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15581311261294876)
,p_name=>'P121_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(88772462079139291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15581774023294876)
,p_name=>'P121_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(88772462079139291)
,p_item_default=>'87582'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15582459545294877)
,p_name=>'P121_TPO_PRSNA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(89209025993832486)
,p_item_default=>'J'
,p_prompt=>'Tipo de Persona'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Nit;J,C\00E9dula;N')
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15583253795294881)
,p_name=>'P121_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(89209025993832486)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15583629742294881)
,p_name=>'P121_NMBRE_RZON_SCIAL'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(89209025993832486)
,p_prompt=>unistr('Nombres y Apellidos completos Y/O Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15586089362294884)
,p_name=>'P121_ID_DPRTMNTO'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(89209025993832486)
,p_item_default=>'select id_dprtmnto from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_DEPARTAMENTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15586453074294885)
,p_name=>'P121_ID_MNCPIO'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(89209025993832486)
,p_item_default=>'select id_mncpio from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'select nmbre_mncpio, id_mncpio from df_s_municipios where id_dprtmnto = :P121_ID_DPRTMNTO'
,p_lov_cascade_parent_items=>'P121_ID_DPRTMNTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15586845381294885)
,p_name=>'P121_DRCCION'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(89209025993832486)
,p_prompt=>unistr('Direcci\00F3n de Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15588749206294886)
,p_name=>'P121_TLFNO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(89209025993832486)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15589156015294886)
,p_name=>'P121_CLLAR'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(89209025993832486)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15589564963294887)
,p_name=>'P121_EMAIL'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(89209025993832486)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15590212766294887)
,p_name=>'P121_ID_ACTVDAD_ECNMCA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(89209185269832488)
,p_prompt=>unistr('Actividad Ec\00F3nomica Principal')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.cdgo  || '' - '' || a.dscrpcion  ,',
'         a.cdgo  cdgo_actvdad_ecnmca',
'from     fi_d_codigos_ciiu a ',
' order by cdgo_actvdad_ecnmca ',
'',
'/*select  a.dscrpcion,',
'        a.id_dclrcns_esqma_trfa         id_actvdad_ecnmca,',
'        a.cdgo_dclrcns_esqma_trfa       cdgo_actvdad_ecnmca',
'from    gi_d_dclrcns_esqma_trfa     a',
'join    gi_d_dclrcns_esqma_trfa_tpo b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'where   b.cdgo_clnte                =   :F_CDGO_CLNTE',
'        and cdgo_dclrcns_esqma_trfa_tpo in (''1'',''2'',''3'',''4'')',
'        and sysdate between fcha_dsde and fcha_hsta',
'order by  cdgo_actvdad_ecnmca*/',
' ',
' ',
' /* select b.dscrpcion',
'        , b.id_actvdad_ecnmca',
'        , b.cdgo_actvdad_ecnmca',
'     from gi_d_actividades_ecnmca_tpo    a',
'     join gi_d_actividades_economica     b on a.id_actvdad_ecnmca_tpo = b.id_actvdad_ecnmca_tpo',
'    where a.cdgo_clnte                   = :F_CDGO_CLNTE',
' order by b.cdgo_actvdad_ecnmca*/'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15590620387294888)
,p_name=>'P121_FCHA_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(89209185269832488)
,p_prompt=>'Fecha Registro Mercantil'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15591060588294888)
,p_name=>'P121_NMRO_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(89209185269832488)
,p_prompt=>'No. Registro Mercantil'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15591405322294888)
,p_name=>'P121_FCHA_INCIO_ACTVDDES'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(89209185269832488)
,p_prompt=>'Fecha inicio Actividades'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87964692457085304)
,p_name=>'P121_NMBRE_RPRSNTNTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(89209081373832487)
,p_prompt=>'Representante Legal'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87964705589085305)
,p_name=>'P121_IDNTFCCION_RPRSNTNTE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(89209081373832487)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87964851571085306)
,p_name=>'P121_CLLAR_RPRSNTNTE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(89209081373832487)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87964924558085307)
,p_name=>'P121_CDGO_CIIU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(89209185269832488)
,p_prompt=>unistr('C\00F3digo CIIU')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88177442808670602)
,p_name=>'P121_TPO_REGIMEN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(89209185269832488)
,p_prompt=>unistr('\00BF R\00E9gimen simple de tributaci\00F3n-RST ?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'NO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88453244917082504)
,p_name=>'P121_VALIDAR_IMPRIMIR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(89209722739832493)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118589378103617801)
,p_name=>'P121_ACTVDAD_OCSNAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(89209185269832488)
,p_prompt=>unistr('\00BFActividad Ocasional?')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(88209406579468019)
,p_computation_sequence=>10
,p_computation_item=>'P121_CDGO_CIIU'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select :P121_ID_ACTVDAD_ECNMCA  from dual;'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(15600445228294905)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P121_ID_INSTNCIA_FLJO'
,p_compute_when=>'P121_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(15600811077294919)
,p_computation_sequence=>20
,p_computation_item=>'P121_IDNTFCCION_RPRSNTNTE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select idntfccion',
'      from v_pq_g_solicitudes',
'     where id_instncia_fljo_gnrdo = :P121_ID_INSTNCIA_FLJO;',
''))
,p_compute_when=>'P121_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(15601154966294920)
,p_computation_sequence=>30
,p_computation_item=>'P121_ID_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_impsto',
'     from v_pq_g_solicitudes',
'    where id_instncia_fljo_gnrdo = :P121_ID_INSTNCIA_FLJO'))
,p_compute_when=>'P121_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15602765080294921)
,p_validation_name=>'Validar que el correo sea valido'
,p_validation_sequence=>50
,p_validation=>'regexp_like (:P121_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un Email valido.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(15589564963294887)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15605963852294928)
,p_validation_name=>'Validar que el la razon social no sea nulo'
,p_validation_sequence=>60
,p_validation=>'P121_NMBRE_RZON_SCIAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P121_TPO_PRSNA'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(15579502534294875)
,p_associated_item=>wwv_flow_api.id(15583629742294881)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15606367664294928)
,p_validation_name=>'Validar que el la actividad principal no sea nulo'
,p_validation_sequence=>70
,p_validation=>'P121_ID_ACTVDAD_ECNMCA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P121_TPO_PRSNA'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(15579502534294875)
,p_associated_item=>wwv_flow_api.id(15590212766294887)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15605165775294928)
,p_validation_name=>'Validar que el numero de Celular sea valido'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P121_CLLAR) != 10 then ',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, por favor ingrese 10 n\00FAmeros'';    '),
'    elsif substr(:P121_CLLAR, 1, 1) != ''3'' then',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, debe iniciar con 3'';    '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15605590368294928)
,p_validation_name=>'Validar que el numero de telefono sea valido'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P121_TLFNO) != 7 then ',
unistr('        return ''El n\00FAmero de tel\00E9fono ingresado no es valido, por favor ingrese 7 n\00FAmeros'';  '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15601964675294920)
,p_validation_name=>unistr('Validar que la identificaci\00F3n no este vac\00EDo')
,p_validation_sequence=>130
,p_validation=>'P121_IDNTFCCION_RPRSNTNTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P121_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(15579502534294875)
,p_associated_item=>wwv_flow_api.id(15583253795294881)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15602382264294921)
,p_validation_name=>unistr('Validar que la identificaci\00F3n no este vac\00EDo_1')
,p_validation_sequence=>140
,p_validation=>'P121_IDNTFCCION_RPRSNTNTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P121_TPO_PRSNA'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(15579502534294875)
,p_associated_item=>wwv_flow_api.id(15583253795294881)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15607097665294929)
,p_name=>'Ocultar / Mostrar Cuando es Persona Natural'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P121_TPO_PRSNA'
,p_condition_element=>'P121_TPO_PRSNA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15607593913294930)
,p_event_id=>wwv_flow_api.id(15607097665294929)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P121_PRMER_NMBRE,P121_SGNDO_NMBRE,P121_PRMER_APLLDO,P121_SGNDO_APLLDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15608003269294930)
,p_event_id=>wwv_flow_api.id(15607097665294929)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P121_PRMER_NMBRE,P121_SGNDO_NMBRE,P121_PRMER_APLLDO,P121_SGNDO_APLLDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15608532239294930)
,p_event_id=>wwv_flow_api.id(15607097665294929)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P121_NMBRE_RZON_SCIAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15609080518294930)
,p_event_id=>wwv_flow_api.id(15607097665294929)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P121_NMBRE_RZON_SCIAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15610078804294931)
,p_event_id=>wwv_flow_api.id(15607097665294929)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(89209185269832488)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15611036704294932)
,p_event_id=>wwv_flow_api.id(15607097665294929)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(89209722739832493)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15612507796294933)
,p_event_id=>wwv_flow_api.id(15607097665294929)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(15580372813294875)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15613029439294933)
,p_event_id=>wwv_flow_api.id(15607097665294929)
,p_event_result=>'FALSE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(15580372813294875)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15614371550294934)
,p_name=>unistr('Si el tipo de persona es Juridica calcular el valor de raz\00F3n social')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P121_TPO_PRSNA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15614869807294934)
,p_event_id=>wwv_flow_api.id(15614371550294934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    var rzon_scial ;',
'    rzon_scial = $v("P121_PRMER_NMBRE") + " " + $v("P121_SGNDO_NMBRE") + " " + $v("P121_PRMER_APLLDO") + " " + $v("P121_SGNDO_APLLDO");',
'    apex.item("P121_NMBRE_RZON_SCIAL").setValue(rzon_scial);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15615247263294934)
,p_name=>unistr('Actualizar Direcci\00F3n de Notificacci\00F3n')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P121_DRCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15615745961294935)
,p_event_id=>wwv_flow_api.id(15615247263294934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    var drccion ;',
'    drccion = $v("P121_DRCCION");',
'     apex.item("P121_DRCCION_NTFCCION").setValue(drccion);  ',
'     apex.item("P121_DRCCION_CMRA_CMRCIO").setValue(drccion);  ',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15617068300294935)
,p_name=>unistr('Refrescar la region de responsables y actividades economicas cuando se cierra la modal desde la regi\00F3n de opciones')
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(89209722739832493)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15618015612294936)
,p_event_id=>wwv_flow_api.id(15617068300294935)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(90623926375604874)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15618421396294936)
,p_name=>unistr('Refrescar region de Actividades econ\00F3micas al cerrar modeal desde la regi\00F3n de actividades econ\00F3micas')
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90623926375604874)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15618904985294936)
,p_event_id=>wwv_flow_api.id(15618421396294936)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(90623926375604874)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15619363159294936)
,p_name=>'Al cambiar calcular el nmbre_rzon_scial'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P121_PRMER_NMBRE,P121_SGNDO_NMBRE,P121_PRMER_APLLDO,P121_SGNDO_APLLDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15619823950294936)
,p_event_id=>wwv_flow_api.id(15619363159294936)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    var rzon_scial ;',
'    rzon_scial = $v("P121_PRMER_NMBRE") + " " + $v("P121_SGNDO_NMBRE") + " " + $v("P121_PRMER_APLLDO") + " " + $v("P121_SGNDO_APLLDO");',
'    apex.item("P121_NMBRE_RZON_SCIAL").setValue(rzon_scial);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88209504569468020)
,p_name=>'Actualizar actividad economica'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P121_ID_ACTVDAD_ECNMCA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88209933247468024)
,p_event_id=>wwv_flow_api.id(88209504569468020)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let    value    = apex.item(''P121_ID_ACTVDAD_ECNMCA'').getValue()',
'',
'apex.item(''P121_CDGO_CIIU'').setValue(value)',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88210577577468030)
,p_event_id=>wwv_flow_api.id(88209504569468020)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P121_CDGO_CIIU'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88453045020082502)
,p_name=>'submit'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(88210665346468031)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88453148776082503)
,p_event_id=>wwv_flow_api.id(88453045020082502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.page.submit("IMPRIMIR");',
'',
'',
'apex.submit({',
'            request: ''IMPRIMIR'',',
'            set: {',
'                "P121_VALIDAR_IMPRIMIR": ''S''',
'            },',
'            showWait: true,',
'            }); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88210929802468034)
,p_name=>'Limitar la fecha de inicio de actividades con la fecha de registro mercantil'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P121_FCHA_RGSTRO_CMRA_CMRCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88211018598468035)
,p_event_id=>wwv_flow_api.id(88210929802468034)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P118_FCHA_INCIO_ACTVDDES").datepicker( ''option'' , ''minDate'' , $("#P118_FCHA_RGSTRO_CMRA_CMRCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88453325294082505)
,p_name=>'actualizar cargar/imprimir'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P121_TPO_PRSNA ,P121_FCHA_INCIO_ACTVDDES ,P121_NMBRE_RPRSNTNTE ,P121_NMBRE_RZON_SCIAL ,P121_IDNTFCCION_RPRSNTNTE ,P121_TPO_REGIMEN ,P121_ID_ACTVDAD_ECNMCA ,P121_IDNTFCCION ,P121_CLLAR_RPRSNTNTE ,P121_CDGO_CIIU ,P121_NMRO_RGSTRO_CMRA_CMRCIO ,P121_ID_D'
||'PRTMNTO ,P121_DRCCION ,P121_ID_MNCPIO ,P121_TLFNO ,P121_CLLAR ,P121_EMAIL,P121_FCHA_RGSTRO_CMRA_CMRCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88453427646082506)
,p_event_id=>wwv_flow_api.id(88453325294082505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let validarImprimir = apex.item(''P121_VALIDAR_IMPRIMIR'').getValue();',
'',
'if(validarImprimir === ''S''){',
'    apex.submit({',
'            request: ''IMPRIMIR'',',
'            set: {',
'                ''P121_VALIDAR_IMPRIMIR'': ''N''',
'            },',
'            showWait: true,',
'            }); ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15606669067294929)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_idntffcion_tpo      varchar2(3)    := ''N'';',
'    v_id_impsto                number         := 230012;     ',
'    v_id_impsto_sbmpsto        number         := 2300122;',
'    v_cdgo_rspsta              number;',
'    v_mnsje_rspsta             varchar2(1000);',
'    v_id_nvdad_prsna           number;',
'    ',
'begin',
'   /* begin',
'        select id_impsto',
'              , id_impsto_sbmpsto',
'            into v_id_impsto',
'               , v_id_impsto_sbmpsto',
'           from v_pq_g_solicitudes',
'          where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'    exception',
'        when others then',
'            raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', Error al consultar la solicitud'');  ',
'    end;*/',
'    ',
'    pkg_si_novedades_persona.prc_rg_novedad_persona (p_cdgo_clnte				=> :F_CDGO_CLNTE,',
'                                                     p_ssion					=> :APP_SESSION,',
'                                                     p_id_impsto				=> v_id_impsto,',
'                                                     p_id_impsto_sbmpsto		=> v_id_impsto_sbmpsto,',
'                                                     p_id_instncia_fljo			=> :F_ID_INSTNCIA_FLJO,',
'                                                     p_cdgo_nvdad_tpo			=> ''INS'',',
unistr('                                                     p_obsrvcion                => ''Inscripci\00F3n de Persona por PQR Portal'','),
'                                                     p_id_usrio_rgstro			=> :F_ID_USRIO,',
'                                                     -- Datos de Inscripcion --',
'                                                     p_tpo_prsna                => :P121_TPO_PRSNA,',
'                                                     p_cdgo_idntfccion_tpo		=> nvl(:P121_CDGO_IDNTFCCION_TPO,v_cdgo_idntffcion_tpo ),',
'                                                     p_idntfccion				=> :P121_IDNTFCCION,',
'                                                     p_prmer_nmbre				=> :P121_PRMER_NMBRE,',
'                                                     p_sgndo_nmbre				=> :P121_SGNDO_NMBRE,',
'                                                     p_prmer_aplldo				=> :P121_PRMER_APLLDO,',
'                                                     p_sgndo_aplldo				=> :P121_SGNDO_APLLDO,',
'                                                     p_nmbre_rzon_scial			=> :P121_NMBRE_RZON_SCIAL,',
'                                                     p_drccion					=> :P121_DRCCION,',
'                                                     p_id_pais					=> :P121_ID_PAIS,',
'                                                     p_id_dprtmnto				=> :P121_ID_DPRTMNTO,',
'                                                     p_id_mncpio				=> :P121_ID_MNCPIO,',
'                                                     p_drccion_ntfccion			=> :P121_DRCCION_NTFCCION,',
'                                                     p_id_pais_ntfccion			=> :P121_ID_PAIS_NTFCCION,',
'                                                     p_id_dprtmnto_ntfccion		=> :P121_ID_DPRTMNTO_NTFCCION,',
'                                                     p_id_mncpio_ntfccion		=> :P121_ID_MNCPIO_NTFCCION,',
'                                                     p_email					=> :P121_EMAIL,',
'                                                     p_tlfno					=> :P121_TLFNO,',
'                                                     p_cllar					=> :P121_CLLAR,',
'                                                     p_nmro_rgstro_cmra_cmrcio	=> :P121_NMRO_RGSTRO_CMRA_CMRCIO,',
'                                                     p_fcha_rgstro_cmra_cmrcio	=> :P121_FCHA_RGSTRO_CMRA_CMRCIO,',
'                                                     p_fcha_incio_actvddes		=> :P121_FCHA_INCIO_ACTVDDES,',
'                                                     p_nmro_scrsles				=> :P121_NMRO_SCRSLES,',
'                                                     p_drccion_cmra_cmrcio		=> :P121_DRCCION_CMRA_CMRCIO,',
'                                                     p_id_actvdad_ecnmca		=> :P121_ID_ACTVDAD_ECNMCA,',
'                                                     p_id_sjto_tpo              => :P121_ID_SJTO_TPO,',
'                                                     -- Fin Datos de Inscripcion--',
'                                                     o_id_nvdad_prsna			=> v_id_nvdad_prsna,',
'                                                     o_cdgo_rspsta				=> v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta				=> v_mnsje_rspsta);',
'    if v_cdgo_rspsta != 0 then ',
'        raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', Error al registrar la solicitud. '' || v_mnsje_rspsta);  ',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(15579502534294875)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Solicitud registrada exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(88207618778468001)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir_reporte'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Armamos nuestro Json con los conceptos que se hallan registrado',
'  declare',
'  v_dscrpcion               varchar2(400) ;',
'  v_json_estblcmnto         clob;',
'  v_json_cntrbynte          clob;',
'  v_id_rprte                number;',
'  v_gn_d_reportes           gn_d_reportes%rowtype;',
'  v_blob                    blob;',
'  v_fcha_rgtro_mrctil       varchar2(20);',
'  v_nmro_rgtro_mrctil       varchar2(50);',
'  v_fcha_incio_actvddes     varchar2(20); ',
'  v_identificacion          varchar2(20);',
'  v_dprtmnto                varchar2(400);',
'  v_mncpcio                 varchar2(400);',
'  begin',
'    ',
'    select id_rprte into v_id_rprte from gn_d_reportes',
'    where cdgo_rprte_grpo =''FII'' ;',
'    ',
'    v_identificacion:= :P121_IDNTFCCION;',
'    ',
'    -- v_fcha_rgtro_mrctil := to_char(''dd/mm/yyyy'',:P121_FCHA_RGSRTRO_CMRA_CMRCIO2);',
'    -- v_fcha_rgtro_mrctil := to_char(''dd/mm/yyyy'',NVL(:P121_FCHA_RGSTRO_CMRA_CMRCIO, ''VACIO''));',
'    --insert into muerto (v_001,v_002) values (''v_fcha_rgtro_mrctil'', v_fcha_rgtro_mrctil);commit;',
'   -- v_fcha_incio_actvddes := to_char(''dd/mm/yyyy'',:P121_FCHA_INCIO_ACTVDDES);',
'   --  insert into muerto (v_001,v_002) values (''v_fcha_incio_actvddes'', v_fcha_incio_actvddes);commit;',
'    ',
'    select a.dscrpcion',
'    into v_dscrpcion',
'    from fi_d_codigos_ciiu a where ',
'    a.cdgo = :P121_ID_ACTVDAD_ECNMCA;',
'    ',
'    begin',
'        APEX_JSON.initialize_clob_output;',
'        APEX_JSON.open_array();',
'        for c_datos_json in (select       a.c001                               ',
unistr('                                        , a.c002   --DIRECCI\00D3N                           '),
'                                        , a.C003	                          ',
'                                        , a.C004                              ',
'                                        , a.c005 	 --CDGO					        ',
'                                from apex_collections   a         ',
'                                where a.collection_name = ''ESTABLECIMIENTOS'') loop',
'            --insert into muerto ( n_001, v_001  )  values ( 33, ''json concepto:'' || c_datos_json.c001||'' - c_datos_json.n004:''||c_datos_json.n004) ; commit;',
'            APEX_JSON.open_object();',
'            APEX_JSON.write(''nombre_establecimiento'',c_datos_json.c001);',
'            APEX_JSON.write(''cdgo_establecimiento'', c_datos_json.C005 );',
'            APEX_JSON.write(''direccion_establecimiento'',c_datos_json.c002);',
'            APEX_JSON.write(''email_establecimiento'',c_datos_json.c003);',
'            APEX_JSON.write(''telefono_establecimiento'',c_datos_json.c004);',
'            APEX_JSON.close_object;',
'       end loop;',
'    APEX_JSON.close_array;',
'    ',
'    v_json_estblcmnto := APEX_JSON.get_clob_output;',
'   end;',
'   ',
'   select nmbre_dprtmnto',
'   into v_dprtmnto',
'   from df_s_departamentos ',
'   where id_dprtmnto = :P121_ID_DPRTMNTO;',
'',
'    select nmbre_mncpio ',
'    into v_mncpcio',
'    from df_s_municipios ',
'    where id_mncpio = :P121_ID_MNCPIO;',
'',
'   ',
'   begin',
'       APEX_JSON.initialize_clob_output;',
'        APEX_JSON.open_object();',
'            APEX_JSON.write(''nombre'',:P121_NMBRE_RZON_SCIAL);',
'            APEX_JSON.write(''identificacion'', :P121_IDNTFCCION);',
'            APEX_JSON.write(''direccion'',:P121_DRCCION);',
'            APEX_JSON.write(''departamento'',v_dprtmnto);',
'            APEX_JSON.write(''municipio'',v_mncpcio);',
'            APEX_JSON.write(''telefono'',:P121_TLFNO);',
'            APEX_JSON.write(''celular'',:P121_CLLAR);',
'            APEX_JSON.write(''email'',:P121_EMAIL);',
'            APEX_JSON.write(''nombre_representante'',:P121_NMBRE_RPRSNTNTE);',
'            APEX_JSON.write(''id_representante'',:P121_IDNTFCCION_RPRSNTNTE);',
'            APEX_JSON.write(''celular_representante'',:P121_CLLAR_RPRSNTNTE);',
'            APEX_JSON.write(''fcha_inicio'',:P121_FCHA_INCIO_ACTVDDES);',
'            APEX_JSON.write(''tipo_regimen'',:P121_TPO_REGIMEN);',
'            ',
'            APEX_JSON.write(''dscrpcion'',v_dscrpcion);',
'            APEX_JSON.write(''cdgo_ciiu'',:P121_CDGO_CIIU);',
'            APEX_JSON.write(''registro_mercantil'',:P121_NMRO_RGSTRO_CMRA_CMRCIO);',
'            APEX_JSON.write(''fcha_rgstro_mrcntil'',:P121_FCHA_RGSTRO_CMRA_CMRCIO);',
'            ',
'            APEX_JSON.write(''actvdad_ocsnal'',:P121_ACTVDAD_OCSNAL);',
'            ',
'            ',
'        APEX_JSON.close_object;',
'        v_json_cntrbynte := APEX_JSON.get_clob_output;',
'    end;',
'    ',
'   insert into muerto (v_001,c_001,t_001) values (''Json_fisca'',v_json_estblcmnto,sysdate);commit;',
'   insert into muerto (v_001,c_001,t_001) values (''Json_fisca2'',v_json_cntrbynte,sysdate);commit;',
'   apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );',
'   apex_util.set_session_state(''P37_JSON'', v_json_cntrbynte);',
'   apex_util.set_session_state(''P37_JSON_2'', v_json_estblcmnto);',
'   apex_util.set_session_state(''P37_ID_RPRTE'', v_json_estblcmnto);',
'',
'    --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'    select r.*',
'      into v_gn_d_reportes ',
'      from gn_d_reportes r',
'      where r.id_rprte = v_id_rprte;',
'',
'    --Asignamos los valores al blob para crear el documento.',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'    htp.init;',
'    owa_util.mime_header(''application/pdf'', FALSE );',
'    htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
unistr('    htp.p(''Content-Disposition: attachment; filename="Formulario_de_inscripci\00F3n_''||:P121_IDNTFCCION||''.pdf"'' );'),
'    htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'    apex_application.stop_apex_engine;',
'   ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'IMPRIMIR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
