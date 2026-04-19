prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'Metadatos'
,p_page_mode=>'MODAL'
,p_step_title=>'Metadatos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que desea eliminar el registro?'';')
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_protection_level=>'C'
,p_last_upd_yyyymmddhh24miss=>'20191106102103'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4831287285443916)
,p_plug_name=>'Create Form'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76356263645582458)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4837949436443928)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76357285744582459)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4912691539782611)
,p_plug_name=>'Meta Data'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_dcmnto_tpo_mtdta ',
'     , id_dcmnto_tpo ',
'     , metadata nmbre ',
'     , dto_tpo ',
'     , dscrpcion_dto_tpo ',
'     , objto_tpo ',
'     , dscrpcion_objto_tpo ',
'     , orgen_tpo ',
'     , dscrpcion_orgen_tpo ',
'     , orgen ',
'     , indcdor_rqrdo',
'     , dscrpcion_indcdor_rqrdo ',
'     , actvo ',
'     , dscrpcion_actvo',
'     , orden',
'     , dscrpcion_indcdor_unco',
'  from v_gd_d_documentos_tipo_mtdta',
' where id_dcmnto_tpo = :P4_ID_DCMNTO_TPO  ',
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
 p_id=>wwv_flow_api.id(4912870686782613)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,4:P4_ID_DCMNTO_TPO_MTDTA:#ID_DCMNTO_TPO_MTDTA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'MCARO'
,p_internal_uid=>4912870686782613
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4912945401782614)
,p_db_column_name=>'ID_DCMNTO_TPO_MTDTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto Tpo Mtdta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913076901782615)
,p_db_column_name=>'ID_DCMNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Dcmnto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913156003782616)
,p_db_column_name=>'NMBRE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913257145782617)
,p_db_column_name=>'DTO_TPO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Dto Tpo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913332275782618)
,p_db_column_name=>'DSCRPCION_DTO_TPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo de dato '
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913459031782619)
,p_db_column_name=>'OBJTO_TPO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Objto Tpo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913505863782620)
,p_db_column_name=>'DSCRPCION_OBJTO_TPO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Tipo de objeto '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913659329782621)
,p_db_column_name=>'ORGEN_TPO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Orgen Tpo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913718969782622)
,p_db_column_name=>'DSCRPCION_ORGEN_TPO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Tipo de origen'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913820088782623)
,p_db_column_name=>'ORGEN'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913917018782624)
,p_db_column_name=>'INDCDOR_RQRDO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Indcdor Rqrdo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4914176234782626)
,p_db_column_name=>'DSCRPCION_INDCDOR_RQRDO'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>unistr('\00BFRequerido?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4914021615782625)
,p_db_column_name=>'ACTVO'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Actvo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4914257336782627)
,p_db_column_name=>'DSCRPCION_ACTVO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7577131396079326)
,p_db_column_name=>'ORDEN'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(28576373194727828)
,p_db_column_name=>'DSCRPCION_INDCDOR_UNCO'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('\00BFDebe ser \00DAnico?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4965826614874076)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'49659'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO_TPO_MTDTA:ID_DCMNTO_TPO:NMBRE:DTO_TPO:DSCRPCION_DTO_TPO:OBJTO_TPO:DSCRPCION_OBJTO_TPO:ORGEN_TPO:DSCRPCION_ORGEN_TPO:ORGEN:INDCDOR_RQRDO:DSCRPCION_INDCDOR_RQRDO:ACTVO:DSCRPCION_ACTVO:ORDEN:DSCRPCION_INDCDOR_UNCO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5271283864384803)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(4837949436443928)
,p_button_name=>'NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'Nuevo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,4:P4_ID_DCMNTO_TPO:&P4_ID_DCMNTO_TPO.'
,p_button_condition=>'P4_ID_DCMNTO_TPO_MTDTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4854451385631938)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(4831287285443916)
,p_button_name=>'BTN_VLRES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Valores'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID_DCMNTO_TPO_MTDTA:&P4_ID_DCMNTO_TPO_MTDTA.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_column_attributes=>'style="margin-top:5px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4838397537443929)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4837949436443928)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4839913024443933)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4837949436443928)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P4_ID_DCMNTO_TPO_MTDTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4840349045443933)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4837949436443928)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P4_ID_DCMNTO_TPO_MTDTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4840780354443933)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4837949436443928)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P4_ID_DCMNTO_TPO_MTDTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6162289844811310)
,p_branch_action=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,4:P4_ID_DCMNTO_TPO:&P4_ID_DCMNTO_TPO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4831653425443917)
,p_name=>'P4_ID_DCMNTO_TPO_MTDTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DCMNTO_TPO_MTDTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4832024572443923)
,p_name=>'P4_ID_DCMNTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DCMNTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4832488241443924)
,p_name=>'P4_NMBRE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre'
,p_source=>'NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>50
,p_colspan=>5
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el nombre del metadato'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4832856152443924)
,p_name=>'P4_DTO_TPO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de dato'
,p_source=>'DTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Car\00E1cter;C,Num\00E9rico;N,Fecha;D')
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione de la lista el tipo de dato que ser\00E1 ingresado en el metadato')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4833249026443925)
,p_name=>'P4_OBJTO_TPO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de objeto'
,p_source=>'OBJTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Texto;T,Lista de Selecci\00F3n;S,Textarea;A')
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione de la lista el tipo de objeto del metadato, para el tipo lista se mostrar\00E1 el campo de origen de la lista.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4833618446443925)
,p_name=>'P4_ORGEN_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de origen'
,p_source=>'ORGEN_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Est\00E1tico;E,Consulta SQL;S')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el origen de los datos que contendr\00E1 la lista de selecci\00F3n del metadato.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4834012937443925)
,p_name=>'P4_ORGEN'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta SQL'
,p_placeholder=>'Ingrese la consulta SQL'
,p_source=>'ORGEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>50
,p_cMaxlength=>4000
,p_cHeight=>3
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Ingresar la consulta SQL, debe retornar dos columnas.',
'Ejemplo: ''select 1, 2 from dual'' '))
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4834464017443925)
,p_name=>'P4_INDCDOR_RQRDO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFRequerido?')
,p_source=>'INDCDOR_RQRDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" si el metadato ser\00E1 requerido ')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4834867683443926)
,p_name=>'P4_ACTVO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar el metadato y "No" para desactivarlo.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7576959835079324)
,p_name=>'P4_ORDEN'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Orden'
,p_source=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>3
,p_cMaxlength=>3
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de orden que tendr\00E1 el metadato')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28576234243727827)
,p_name=>'P4_INDCDOR_UNCO'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(4831287285443916)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFDebe ser \00DAnico?')
,p_source=>'INDCDOR_UNCO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4915871136782643)
,p_validation_name=>unistr('Validar si existen datos en la colecci\00F3n')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_count    number;    ',
'begin',
'    select count(1)',
'      into v_count',
'      from apex_collections',
'     where collection_name = ''METADATA_VALORES'';',
'     ',
'     return v_count > 0;',
'exception',
'    when others then',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'No se encontraron datos para los valores del metadato'
,p_validation_condition=>':P4_ORGEN_TPO = ''E'' and :REQUEST not in (''DELETE'')'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4916035401782645)
,p_validation_name=>'Validar la consulta SQL'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob; ',
'begin',
'    v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P4_ORGEN;',
'    execute immediate v_sql ;    ',
'exception when others then',
'   return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P4_ORGEN_TPO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(4834012937443925)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4916164705782646)
,p_validation_name=>'Validar el numero de columnas de la consulta SQL'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    type c_cursor_type is ref cursor;',
'    c_cursor           c_cursor_type;',
'    v_to_cursor_number number; ',
'    v_desc_table       dbms_sql.desc_tab;',
'    v_column_count     number;',
'    ',
'begin',
'    open c_cursor for :P4_ORGEN; --using p_xml ;',
'    v_to_cursor_number := dbms_sql.to_cursor_number(c_cursor);  ',
'    dbms_sql.describe_columns(v_to_cursor_number, v_column_count, v_desc_table);',
'    return v_column_count = 2;',
'exception',
'    when others then',
'       return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('El n\00FAmero de columnas de la consulta debe ser igual a 2 ')
,p_validation_condition=>'P4_ORGEN_TPO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(4834012937443925)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13353479638938306)
,p_validation_name=>'Validar que no existan valores'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from gd_d_dcmntos_tpo_mtdta_vlor',
'where id_dcmnto_tpo_mtdta = :P4_ID_DCMNTO_TPO_MTDTA'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Debe eliminar los valores del metadato'
,p_validation_condition=>'P4_ORGEN_TPO'
,p_validation_condition2=>'E'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(4839913024443933)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4838448074443929)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4838397537443929)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4839290602443931)
,p_event_id=>wwv_flow_api.id(4838448074443929)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4853715880631931)
,p_name=>unistr('al cambiar el tipo de objeto a lista de selecci\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_OBJTO_TPO'
,p_condition_element=>'P4_OBJTO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4854034254631934)
,p_event_id=>wwv_flow_api.id(4853715880631931)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_ORGEN_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4853833101631932)
,p_event_id=>wwv_flow_api.id(4853715880631931)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_ORGEN_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4853933823631933)
,p_event_id=>wwv_flow_api.id(4853715880631931)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4914350801782628)
,p_event_id=>wwv_flow_api.id(4853715880631931)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4854451385631938)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4914511647782630)
,p_name=>'al cambiar el tipo de objeto a texto'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_OBJTO_TPO'
,p_condition_element=>'P4_OBJTO_TPO'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'T,A'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4854193558631935)
,p_event_id=>wwv_flow_api.id(4914511647782630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_ORGEN_TPO,P4_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4914402987782629)
,p_event_id=>wwv_flow_api.id(4914511647782630)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4854451385631938)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4854228915631936)
,p_event_id=>wwv_flow_api.id(4914511647782630)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_ORGEN_TPO,P4_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4914708311782632)
,p_name=>unistr('al cambiar el tipo de origen a Est\00E1tico')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_ORGEN_TPO'
,p_condition_element=>'P4_ORGEN_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4914813122782633)
,p_event_id=>wwv_flow_api.id(4914708311782632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4854451385631938)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4915276183782637)
,p_event_id=>wwv_flow_api.id(4914708311782632)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5271099053384801)
,p_event_id=>wwv_flow_api.id(4914708311782632)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4914943180782634)
,p_name=>'al cambiar el tipo de origen a SQL'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_ORGEN_TPO'
,p_condition_element=>'P4_ORGEN_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4915088530782635)
,p_event_id=>wwv_flow_api.id(4914943180782634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4854451385631938)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4915142254782636)
,p_event_id=>wwv_flow_api.id(4914943180782634)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4841564573443934)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Automatic Row Processing'
,p_attribute_02=>'GD_D_DOCUMENTOS_TIPO_MTDTA'
,p_attribute_03=>'P4_ID_DCMNTO_TPO_MTDTA'
,p_attribute_04=>'ID_DCMNTO_TPO_MTDTA'
,p_attribute_09=>'P4_ID_DCMNTO_TPO_MTDTA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Proceso realizado de forma exitosa!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4916246260782647)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar datos de la colecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_orgen_tpo varchar2(1) := case when :P4_ORGEN_TPO is null then ''N'' else :P4_ORGEN_TPO end;',
'begin',
'    if v_orgen_tpo = ''N'' then',
'        delete gd_d_dcmntos_tpo_mtdta_vlor',
'         where id_dcmnto_tpo_mtdta = :P4_ID_DCMNTO_TPO_MTDTA;',
'        return;',
'    end if;',
'    for c_datos in ( select a.c001',
'                          , a.c002',
'                          , case when a.n001 is null and b.id_dcmnto_tpo_mtdta_vlor is not null ',
'                                 then ''D''',
'                                 when b.id_dcmnto_tpo_mtdta_vlor is null ',
'                                 then ''I'' ',
'                                 else ''U''',
'                            end as action',
'                          , nvl( b.id_dcmnto_tpo_mtdta_vlor , a.n001 ) as id_dcmnto_tpo_mtdta_vlor',
'                       from ( select a.c001',
'                                   , a.c002',
'                                   , a.n001',
'                                from apex_collections a',
'                               where a.collection_name = ''METADATA_VALORES''',
'                            ) a               ',
'                  full join ( select id_dcmnto_tpo_mtdta_vlor',
'                                    , vlor_dsplay ',
'                                    , vlor_rturn ',
'                                 from gd_d_dcmntos_tpo_mtdta_vlor ',
'                                where id_dcmnto_tpo_mtdta      = :P4_ID_DCMNTO_TPO_MTDTA',
'                            ) b',
'                         on a.n001 = b.id_dcmnto_tpo_mtdta_vlor ',
'        ',
'                   )',
'    loop',
'        case c_datos.action ',
'            when ''I'' then',
'                insert into gd_d_dcmntos_tpo_mtdta_vlor (id_dcmnto_tpo_mtdta    , vlor_dsplay , vlor_rturn  )',
'                                                 values (:P4_ID_DCMNTO_TPO_MTDTA, c_datos.c001, c_datos.c002);',
'            when ''U'' then',
'                update gd_d_dcmntos_tpo_mtdta_vlor',
'                   set vlor_dsplay = c_datos.c001',
'                     , vlor_rturn  = c_datos.c002',
'                 where id_dcmnto_tpo_mtdta_vlor = c_datos.id_dcmnto_tpo_mtdta_vlor;',
'            when ''D'' then',
'                delete gd_d_dcmntos_tpo_mtdta_vlor',
'                 where  id_dcmnto_tpo_mtdta_vlor = c_datos.id_dcmnto_tpo_mtdta_vlor;',
'        end case;            ',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4841168219443934)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch'
,p_attribute_02=>'GD_D_DOCUMENTOS_TIPO_MTDTA'
,p_attribute_03=>'P4_ID_DCMNTO_TPO_MTDTA'
,p_attribute_04=>'ID_DCMNTO_TPO_MTDTA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5271160468384802)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('cargar los datos de la colecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_collection.create_or_truncate_collection( p_collection_name => ''METADATA_VALORES'');   ',
'    for c_collection in ( select id_dcmnto_tpo_mtdta_vlor n001',
'                               , vlor_dsplay c001',
'                               , vlor_rturn c002',
'                            from gd_d_dcmntos_tpo_mtdta_vlor a',
'                           where a.id_dcmnto_tpo_mtdta = :P4_ID_DCMNTO_TPO_MTDTA',
'                         )',
'    loop',
'        apex_collection.add_member( p_collection_name => ''METADATA_VALORES''',
'                                   , p_c001           => c_collection.c001',
'                                   , p_c002           => c_collection.c002',
'                                   , p_n001           => c_collection.n001 );',
'    end loop;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
