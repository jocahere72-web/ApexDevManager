prompt --application/pages/page_00185
begin
wwv_flow_api.create_page(
 p_id=>185
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Subsanar Adjuntos Solicitudes'
,p_step_title=>'Subsanar Adjuntos Solicitudes'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201209104922'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(406458987639395504)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>	'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(406459079108395505)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
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
unistr('    <p align="center"><b>Liquidaci\00F3n de Rentas Varias.</b> <br> <br> '),
'      Adjuntos<br><br>  </p>',
unistr('      <p align="justify">En este paso se debe ingresar los adjuntos soporte de la liquidaci\00F3n.</p>'),
'    ',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(406459112889395506)
,p_plug_name=>unistr('Widzard Liquidaci\00F3n de Rentas')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(76379350032438234)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177462167235041003)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(406459112889395506)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177462527510041007)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(177462167235041003)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.seq_id',
'        , a.id_adjnto_tpo id_sbmpto_adjnto_tpo  -- a.id_sbmpto_adjnto_tpo',
'        , a.dscrpcion     dscrpcion_adjnto_tpo  --a.dscrpcion_adjnto_tpo',
'        , b.c002       	  file_name',
'        , b.c001          obsrvcion',
'        , case',
'			when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'			else  ''Pendiente''',
'		end Estado',
unistr('        , decode (a.indcdor_oblgtrio, ''S'', ''S\00ED'', ''N'', ''No'') dscrpcion_indcdor_oblgtrio'),
'        , 1 eliminar',
'        , /*(select listagg ((frmto)||''(''||(tmno_mxmo)||''MB)   '') ',
'           from v_gi_d_sbmpsts_adjnto_tp_frmt ',
'           where id_sbmpto_adjnto_tpo =  a.id_sbmpto_adjnto_tpo) archivo*/ archvo archivo',
'     from --gi_d_subimpuestos_adjnto_tp       a',
'		  table (pkg_gi_rentas.fnc_tipos_adjunto (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'												  p_id_impsto           => :P138_ID_IMPSTO,',
'												  p_id_impsto_sbmpsto   => :P138_ID_IMPSTO_SBMPSTO,',
'												  p_id_impsto_acto      => :P139_ID_IMPSTO_ACTO )) a	 ',
'     left join apex_collections			    b on b.collection_name = ''ADJUNTOS_RENTA''',
'      and a.id_adjnto_tpo = b.n001',
'      --and a.id_sbmpto_adjnto_tpo            = b.n001   ',
'    --where a.id_impsto_sbmpsto               = :P138_ID_IMPSTO_SBMPSTO     ',
'												  '))
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
 p_id=>wwv_flow_api.id(177462659758041008)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>177462659758041008
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100710187802070984)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100712962957071006)
,p_db_column_name=>'ID_SBMPTO_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'I'
,p_column_label=>'Id Sbmpto Adjnto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100710532434070988)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100711713506070989)
,p_db_column_name=>'DSCRPCION_ADJNTO_TPO'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100710944999070988)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100712109582070989)
,p_db_column_name=>'ESTADO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100712513781070989)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100711394891070989)
,p_db_column_name=>'ELIMINAR'
,p_display_order=>80
,p_column_identifier=>'D'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:142:&SESSION.:ELIMINAR_ADJUNTO:&DEBUG.:RP:P142_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-trash" style="color: red;" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100713302117071006)
,p_db_column_name=>'ARCHIVO'
,p_display_order=>90
,p_column_identifier=>'Q'
,p_column_label=>unistr('Tipo(Tama\00F1o)')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(177538031857071167)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1007137'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ADJNTO_TPO:FILE_NAME:OBSRVCION:DSCRPCION_INDCDOR_OBLGTRIO:ESTADO:ELIMINAR::ID_SBMPTO_ADJNTO_TPO:ARCHIVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(180358766682747076)
,p_plug_name=>unistr('Informaci\00F3n de Rentas')
,p_parent_plug_id=>wwv_flow_api.id(406459112889395506)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164070834422707671)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100706672984070980)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(177462167235041003)
,p_button_name=>'BTN_AGREGAR_ADJUNTO'
,p_button_static_id=>'BTN_AGREGAR_ADJUNTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Adjunto'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100705166063070971)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(406459112889395506)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perdera todos los cambios que no se han guardado'',''CANCEL'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100705527213070975)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(406459112889395506)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100705953432070975)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(406459112889395506)
,p_button_name=>'PREVIUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100719630297071015)
,p_branch_name=>unistr('Ir a la P\00E1gina 143 / Siguiente / Resumen')
,p_branch_action=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(100705527213070975)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100720030827071015)
,p_branch_name=>unistr(' ir a la P\00E1gina 89/136 - Informe de Liquidaciones de Rentas')
,p_branch_action=>'P138_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(76639727772332391)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100707014617070980)
,p_name=>'P185_ID_SBMPTO_ADJNTO_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177462167235041003)
,p_prompt=>'Tipo de Adjunto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion      d ',
'    , id_adjnto_tpo   r       ',
' from table (pkg_gi_rentas.fnc_tipos_adjunto (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                              p_id_impsto           => :P138_ID_IMPSTO,',
'                                              p_id_impsto_sbmpsto   => :P138_ID_IMPSTO_SBMPSTO,',
'                                              p_id_impsto_acto      => :P139_ID_IMPSTO_ACTO )) a',
'where a.id_adjnto_tpo not in (select b.n001',
'                                       from apex_collections b',
'                                       where b.collection_name = ''ADJUNTOS_RENTA'') ',
'/*                                       ',
'select dscrpcion_adjnto_tpo',
'        , id_sbmpto_adjnto_tpo',
'from gi_d_subimpuestos_adjnto_tp    a     ',
'where   a.id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO',
'    and a.id_sbmpto_adjnto_tpo not in (select b.n001',
'                                       from apex_collections b',
'                                       where b.collection_name = ''ADJUNTOS_RENTA'')',
'                                         -- and b.n001 = a.id_sbmpto_adjnto_tpo)',
'*/   '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un tipo de adjunto -- '
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100707427251070983)
,p_name=>'P185_FILE_BLOB'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(177462167235041003)
,p_prompt=>'Adjunto'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100707864823070983)
,p_name=>'P185_ARCHVO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(177462167235041003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100708235473070983)
,p_name=>'P185_ARCHVO_TMNO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(177462167235041003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100708625352070983)
,p_name=>'P185_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(177462167235041003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100709092278070983)
,p_name=>'P185_RSPSTA_TMNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(177462167235041003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100709472381070984)
,p_name=>'P185_OBSRVCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(177462167235041003)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>1000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100714134348071007)
,p_name=>'P185_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177462527510041007)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100714850232071008)
,p_name=>'P185_NMRO_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(180358766682747076)
,p_prompt=>unistr('N\00B0 Liquidaci\00F3n')
,p_source=>'P138_NMRO_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>5
,p_display_when=>'P138_NMRO_RNTA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100715378498071011)
,p_validation_name=>unistr('Validar que observaci\00F3n no sea nulo')
,p_validation_sequence=>10
,p_validation=>'P185_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar una observaci\00F3n para agregar un adjunto')
,p_when_button_pressed=>wwv_flow_api.id(100706672984070980)
,p_associated_item=>wwv_flow_api.id(100709472381070984)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100715775610071011)
,p_validation_name=>'Adjunto no Nulo'
,p_validation_sequence=>20
,p_validation=>'P185_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un adjunto'
,p_when_button_pressed=>wwv_flow_api.id(100706672984070980)
,p_associated_item=>wwv_flow_api.id(100707427251070983)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100716140865071011)
,p_validation_name=>'Validar que ingrese adjuntos obligatorios'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select *',
'     from --gi_d_subimpuestos_adjnto_tp   a',
'		  table (pkg_gi_rentas.fnc_tipos_adjunto ( p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                   p_id_impsto           => :P138_ID_IMPSTO,',
'                                                   p_id_impsto_sbmpsto   => :P138_ID_IMPSTO_SBMPSTO,',
'                                                   p_id_impsto_acto      => :P139_ID_IMPSTO_ACTO )) a	     ',
'     join apex_collections			    b on b.collection_name = ''ADJUNTOS_RENTA''',
'      --and a.id_sbmpto_adjnto_tpo        = b.n001 ',
'      and a.id_adjnto_tpo               = b.n001',
'      and a.indcdor_oblgtrio            = ''S''',
'      and dbms_lob.getlength(blob001)   > 0'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Para continuar debe ingresar adjuntos obligatorios'
,p_when_button_pressed=>wwv_flow_api.id(100705527213070975)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100717684195071014)
,p_name=>'Setear tipo de archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P185_FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100719128795071015)
,p_event_id=>wwv_flow_api.id(100717684195071014)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function Restringir_Archivo_Tipo($this) { ',
'',
'    var file = $this.triggeringElement.files[0];',
'',
'        if (file !== undefined ) {',
'             vTipo = new String( file.type );',
'             vTamano = new String( file.size );',
'             apex.item(''P185_ARCHVO_TPO'').setValue(vTipo);',
'             apex.item(''P185_ARCHVO_TMNO'').setValue(vTamano);',
'        }',
' }',
'',
'',
'Restringir_Archivo_Tipo(this);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100718100045071014)
,p_event_id=>wwv_flow_api.id(100717684195071014)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_archvo_tpo         varchar2(100);',
'    v_archivo_tamano     number;',
'    v_tamano            number;',
'begin ',
'    select b.extncion, b.tmno_mxmo ',
'    into v_archvo_tpo, v_archivo_tamano',
'    from table (pkg_gi_rentas.fnc_adjunto_tmno ( p_id_impsto           => :P138_ID_IMPSTO,',
'												  p_id_impsto_sbmpsto   => :P138_ID_IMPSTO_SBMPSTO,',
'												  p_id_impsto_acto      => :P139_ID_IMPSTO_ACTO,',
'                                                  p_id_adjnto_tpo       => :P185_ID_SBMPTO_ADJNTO_TPO,',
'                                                  p_archvo_tpo          => :P185_ARCHVO_TPO',
'                                                )) b	',
'         /*gi_d_subimpuestos_adjnto_tp a',
'         join v_gi_d_sbmpsts_adjnto_tp_frmt    b on a.id_sbmpto_adjnto_tpo = b.id_sbmpto_adjnto_tpo                                            ',
'    where   a.id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO',
'        and a.id_sbmpto_adjnto_tpo          = :P185_ID_SBMPTO_ADJNTO_TPO',
'        and b.extncion                      = :P185_ARCHVO_TPO',
'        and a.actvo = ''S''*/',
'        ;',
'   ',
'        v_tamano :=  to_number(:P185_ARCHVO_TMNO/1024/1024);',
'     ',
'        if v_archivo_tamano < v_tamano then ',
'           apex_util.set_session_state(''P185_RSPSTA'', ''MAYOR'');',
'        else',
'             apex_util.set_session_state(''P185_RSPSTA'', ''ENCONTRO'');',
'        end if;',
'        ',
' exception',
'     when others then ',
'         apex_util.set_session_state(''P185_RSPSTA'', ''NO_ENCONTRO'' );',
'        ',
'end;'))
,p_attribute_02=>'P185_ARCHVO_TPO,P185_ARCHVO_TMNO,P185_ID_SBMPTO_ADJNTO_TPO'
,p_attribute_03=>'P185_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100718628426071015)
,p_event_id=>wwv_flow_api.id(100717684195071014)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P185_RSPSTA'') == ''ENCONTRO'' ){',
'    // tipo de archivo valido',
'   apex.item(''BTN_AGREGAR_ADJUNTO'').enable();',
'',
'}',
'',
'else if  ($v(''P185_RSPSTA'') == ''MAYOR''){',
unistr('    // Archivo con tama\00F1o superior al permitido'),
'    apex.item(''BTN_AGREGAR_ADJUNTO'').disable();',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >RENTAS VARIAS</H2>'',',
unistr('        html: ''<H4>El Tama\00F1o del archivo supera lo permitido</H4>''        '),
'    });',
' }',
'',
'else if  ($v(''P185_RSPSTA'') == ''NO_ENCONTRO'' ){',
'    // No existe el tipo de archivo',
'    apex.item(''BTN_AGREGAR_ADJUNTO'').disable();',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >RENTAS VARIAS</H2>'',',
'        html: ''<H4>El Tipo de archivo no es permitido</H4>''        ',
'    });',
'  ',
'',
'',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100716466341071013)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''ADJUNTOS_RENTA'',',
'        p_seq => :P185_SEQ_ID);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Adjunto Eliminado Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100716858420071013)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar Adjunto'
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
'         where name = :P185_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_RENTA'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ADJUNTOS_RENTA'');',
'        end if;',
'        ',
'        apex_collection.add_member( p_collection_name   => ''ADJUNTOS_RENTA''',
'                                  , p_n001              => :P185_ID_SBMPTO_ADJNTO_TPO ',
'                                  , p_c001              => :P185_OBSRVCION',
'                                  , p_c002              => r_temp_files.filename',
'                                  , p_c003              => r_temp_files.mime_type',
'                                  , p_blob001           => r_temp_files.blob_content );',
'             ',
'    end if;',
'end;'))
,p_process_error_message=>'Adjunto agregado exitosamente'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(100706672984070980)
,p_process_success_message=>'Adjunto agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100717263400071013)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar los items luego de agregar un adjunto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P185_FILE_BLOB,P185_SEQ_ID,P185_OBSRVCION,P185_ID_SBMPTO_ADJNTO_TPO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(100706672984070980)
);
end;
/
