prompt --application/pages/page_00142
begin
wwv_flow_api.create_page(
 p_id=>142
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Adjuntos - Liquidaci\00F3n de Rentas')
,p_step_title=>unistr('Adjuntos - Liquidaci\00F3n de Rentas')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>'$("#region-flotante").draggable();'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' #region-flotante {',
'    position: fixed;',
unistr('    top: 100px; /* Ajusta la posici\00F3n vertical */'),
unistr('    right: 20px; /* Ajusta la posici\00F3n horizontal */'),
unistr('    width: 700px; /* Ancho de la regi\00F3n */'),
'    background-color: #ffffff; /* Color de fondo */',
'    border: 1px solid #ccc; /* Borde */',
'    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Sombra para efecto flotante */',
unistr('    z-index: 1000; /* Asegura que est\00E9 por encima de otros elementos */'),
'    padding: 15px; /* Espaciado interno */',
'    display: none; /* Inicialmente oculta */',
'}',
'#region-flotante.visible {',
unistr('    display: block; /* Mostrar cuando se a\00F1ade la clase ''visible'' */'),
'}',
'',
'',
'#region-flotante {',
'    transition: all 0.3s ease;',
'    opacity: 0;',
'}',
'',
'#region-flotante.visible {',
'    opacity: 1;',
'} ',
'',
'.mi-estilo-personalizado {',
'  background-color: #e0f7fa;',
'  color: #006064;',
'  border: 1px solid #004d40;',
'  font-size: 16px;',
'}',
'',
'.estilo-cool {',
'    border: none;',
'    color: white;',
'    font-size: 12px; ',
'    padding: 5px; ',
'    background-color: transparent;',
'    box-shadow: none;',
'     font-weight: bold;',
'  }'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20250530141403'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20453458167045110)
,p_plug_name=>'Contrato Externo'
,p_region_name=>'region-flotante'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20453641590045111)
,p_plug_name=>'Contrato'
,p_parent_plug_id=>wwv_flow_api.id(20453458167045110)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20455133786045126)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(20453458167045110)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(305754917024324544)
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
 p_id=>wwv_flow_api.id(305755008493324545)
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
 p_id=>wwv_flow_api.id(305755042274324546)
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
 p_id=>wwv_flow_api.id(76758096619970043)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(305755042274324546)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76758456894970047)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(76758096619970043)
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
'		  table (pkg_gi_rentas.fnc_tipos_adjunto (p_cdgo_clnte              => :F_CDGO_CLNTE,',
'												  p_id_impsto               => :P138_ID_IMPSTO,',
'												  p_id_impsto_sbmpsto       => :P138_ID_IMPSTO_SBMPSTO,',
'												  p_id_impsto_acto          => :P139_ID_IMPSTO_ACTO,',
'                                                  p_id_impsto_acto_slccndo  => :P141_ACTOS_SLCCNDOS )) a	 ',
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
 p_id=>wwv_flow_api.id(76758589142970048)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>76758589142970048
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76758625432970049)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84499398081001906)
,p_db_column_name=>'ID_SBMPTO_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'I'
,p_column_label=>'Id Sbmpto Adjnto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76758723219970050)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84498990383001902)
,p_db_column_name=>'DSCRPCION_ADJNTO_TPO'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76824412522950301)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84499021083001903)
,p_db_column_name=>'ESTADO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84499133937001904)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76824567260950302)
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
 p_id=>wwv_flow_api.id(86575593389659627)
,p_db_column_name=>'ARCHIVO'
,p_display_order=>90
,p_column_identifier=>'Q'
,p_column_label=>unistr('Tipo(Tama\00F1o)')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(76833961242000207)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'768340'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ADJNTO_TPO:FILE_NAME:OBSRVCION:DSCRPCION_INDCDOR_OBLGTRIO:ESTADO:ELIMINAR::ID_SBMPTO_ADJNTO_TPO:ARCHIVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79654696067676116)
,p_plug_name=>unistr('Informaci\00F3n de Rentas')
,p_parent_plug_id=>wwv_flow_api.id(305755042274324546)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164070834422707671)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76758209533970045)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(76758096619970043)
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
 p_id=>wwv_flow_api.id(10314107150727463)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(76758096619970043)
,p_button_name=>'BTN_CNTRTO_EXTRNO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--link'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Contrato Externo'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10302107918721795)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20453458167045110)
,p_button_name=>'BTN_CERRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Cerrar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76639727772332391)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(305755042274324546)
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
 p_id=>wwv_flow_api.id(76639304991332390)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(305755042274324546)
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
 p_id=>wwv_flow_api.id(76640131700332391)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(305755042274324546)
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
 p_id=>wwv_flow_api.id(76642169535332404)
,p_branch_name=>unistr('Ir a la P\00E1gina 143 / Siguiente / Resumen')
,p_branch_action=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76639304991332390)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(77075763633293022)
,p_branch_name=>unistr(' ir a la P\00E1gina 89/136 - Informe de Liquidaciones de Rentas')
,p_branch_action=>'P138_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(76639727772332391)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10302843147721796)
,p_name=>'P142_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10303276776721796)
,p_name=>'P142_NMRO_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>unistr('No. Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10303664754721796)
,p_name=>'P142_NMBRE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10304062702721797)
,p_name=>'P142_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10304487611721797)
,p_name=>'P142_TLFNO_EXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10304846298721797)
,p_name=>'P142_CORREO_EXT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10305271511721797)
,p_name=>'P142_NMBRE_DPRTMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10305693143721797)
,p_name=>'P142_NMBRE_MNCPIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10306062615721798)
,p_name=>'P142_TPO_RGMEN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>'Tipo Regimen'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10306445975721798)
,p_name=>'P142_TPO_PRSNA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>'Tipo Persona'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10306844373721798)
,p_name=>'P142_RSPNSBLE_DE_IVA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(20455133786045126)
,p_prompt=>unistr('\00BFResponsable de IVA?')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10307541348721799)
,p_name=>'P142_NMRO_CNTRTO_EXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'No. Contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10307954433721799)
,p_name=>'P142_OBJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Objeto'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cHeight=>5
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10308399735721799)
,p_name=>'P142_FCHA_INCIO_CNTRTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10308764803721800)
,p_name=>'P142_FCHA_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10309166375721800)
,p_name=>'P142_FCHA_FRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Fecha Firma'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10309550215721800)
,p_name=>'P142_VLOR_CNTRTO_INCLYE_IVA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Valor con IVA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10309964670721800)
,p_name=>'P142_VLOR_CNTRTO_SIN_IVA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Valor sin IVA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10310331420721800)
,p_name=>'P142_VLOR_IVA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Iva'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10310763849721801)
,p_name=>'P142_TPO_CNTRTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Tipo Contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10311165185721801)
,p_name=>'P142_DRCION_DIAS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>unistr('Duraci\00F3n Dias')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10311564144721802)
,p_name=>'P142_DRCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>unistr('Duraci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10311988335721802)
,p_name=>'P142_DSCRPCION_FRMA_PGO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Forma de Pago'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10312374033721802)
,p_name=>'P142_NMBRE_DPNDNCIA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Dependencia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10312725092721802)
,p_name=>'P142_CNSCTVO_RP'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Consecutivo RP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10313167433721802)
,p_name=>'P142_FCHA_RP'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Fecha RP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10313595023721803)
,p_name=>'P142_ESTDO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(20453641590045111)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76758163851970044)
,p_name=>'P142_FILE_BLOB'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76758096619970043)
,p_prompt=>'Adjunto'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'REQUEST'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76758385139970046)
,p_name=>'P142_OBSRVCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(76758096619970043)
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
 p_id=>wwv_flow_api.id(76824656709950303)
,p_name=>'P142_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76758456894970047)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79654756467676117)
,p_name=>'P142_NMRO_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(79654696067676116)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84499200205001905)
,p_name=>'P142_ID_SBMPTO_ADJNTO_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76758096619970043)
,p_prompt=>'Tipo de Adjunto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion      d ',
'    , id_adjnto_tpo   r       ',
' from table (pkg_gi_rentas.fnc_tipos_adjunto (p_cdgo_clnte              => :F_CDGO_CLNTE,',
'                                              p_id_impsto               => :P138_ID_IMPSTO,',
'                                              p_id_impsto_sbmpsto       => :P138_ID_IMPSTO_SBMPSTO,',
'                                              p_id_impsto_acto          => :P139_ID_IMPSTO_ACTO ,',
'                                              p_id_impsto_acto_slccndo  => :P141_ACTOS_SLCCNDOS )) a',
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86573100045659603)
,p_name=>'P142_ARCHVO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76758096619970043)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86573394556659605)
,p_name=>'P142_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(76758096619970043)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86573595596659607)
,p_name=>'P142_ARCHVO_TMNO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(76758096619970043)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86573683096659608)
,p_name=>'P142_RSPSTA_TMNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(76758096619970043)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(105720081402279219)
,p_computation_sequence=>10
,p_computation_item=>'P142_OBSRVCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select ''.'' from dual;'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76824992088950306)
,p_validation_name=>unistr('Validar que observaci\00F3n no sea nulo')
,p_validation_sequence=>10
,p_validation=>'P142_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar una observaci\00F3n para agregar un adjunto')
,p_when_button_pressed=>wwv_flow_api.id(76758209533970045)
,p_associated_item=>wwv_flow_api.id(76758385139970046)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76825038500950307)
,p_validation_name=>'Adjunto no Nulo'
,p_validation_sequence=>20
,p_validation=>'P142_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un adjunto'
,p_when_button_pressed=>wwv_flow_api.id(76758209533970045)
,p_associated_item=>wwv_flow_api.id(76758163851970044)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76825362776950310)
,p_validation_name=>'Validar que ingrese adjuntos obligatorios'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select *',
'     from --gi_d_subimpuestos_adjnto_tp   a',
'		  table (pkg_gi_rentas.fnc_tipos_adjunto ( p_cdgo_clnte              => :F_CDGO_CLNTE,',
'                                                   p_id_impsto               => :P138_ID_IMPSTO,',
'                                                   p_id_impsto_sbmpsto       => :P138_ID_IMPSTO_SBMPSTO,',
'                                                   p_id_impsto_acto          => :P139_ID_IMPSTO_ACTO,',
'                                                   p_id_impsto_acto_slccndo  => :P141_ACTOS_SLCCNDOS )) a',
'     join apex_collections			    b on b.collection_name = ''ADJUNTOS_RENTA''',
'     --  and a.id_sbmpto_adjnto_tpo        = b.n001 ',
'      and a.id_adjnto_tpo               = b.n001',
'      and a.indcdor_oblgtrio            = ''S''',
'      and dbms_lob.getlength(blob001)   > 0'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Para continuar debe ingresar adjuntos obligatorios'
,p_when_button_pressed=>wwv_flow_api.id(76639304991332390)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86572919288659601)
,p_name=>'Setear tipo de archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P142_FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86573065086659602)
,p_event_id=>wwv_flow_api.id(86572919288659601)
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
'             apex.item(''P142_ARCHVO_TPO'').setValue(vTipo);',
'             apex.item(''P142_ARCHVO_TMNO'').setValue(vTamano);',
'        }',
' }',
'',
'',
'Restringir_Archivo_Tipo(this);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86573211474659604)
,p_event_id=>wwv_flow_api.id(86572919288659601)
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
'    from table (pkg_gi_rentas.fnc_adjunto_tmno ( p_id_impsto                => :P138_ID_IMPSTO,',
'												  p_id_impsto_sbmpsto       => :P138_ID_IMPSTO_SBMPSTO,',
'												  p_id_impsto_acto          => :P139_ID_IMPSTO_ACTO,',
'                                                  p_id_adjnto_tpo           => :P142_ID_SBMPTO_ADJNTO_TPO,',
'                                                  p_archvo_tpo              => :P142_ARCHVO_TPO,',
'                                                  p_id_impsto_acto_slccndo  => :P141_ACTOS_SLCCNDOS',
'                                                )) b	',
'         /*gi_d_subimpuestos_adjnto_tp a',
'         join v_gi_d_sbmpsts_adjnto_tp_frmt    b on a.id_sbmpto_adjnto_tpo = b.id_sbmpto_adjnto_tpo                                            ',
'    where   a.id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO',
'        and a.id_sbmpto_adjnto_tpo          = :P142_ID_SBMPTO_ADJNTO_TPO',
'        and b.extncion                      = :P142_ARCHVO_TPO',
'        and a.actvo = ''S''*/',
'        ;',
'   ',
'        v_tamano :=  to_number(:P142_ARCHVO_TMNO/1024/1024);',
'     ',
'        if v_archivo_tamano < v_tamano then ',
'           apex_util.set_session_state(''P142_RSPSTA'', ''MAYOR'');',
'        else',
'             apex_util.set_session_state(''P142_RSPSTA'', ''ENCONTRO'');',
'        end if;',
'        ',
' exception',
'     when others then ',
'         apex_util.set_session_state(''P142_RSPSTA'', ''NO_ENCONTRO'' );',
'        ',
'end;'))
,p_attribute_02=>'P142_ARCHVO_TPO,P142_ARCHVO_TMNO,P142_ID_SBMPTO_ADJNTO_TPO'
,p_attribute_03=>'P142_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86573491969659606)
,p_event_id=>wwv_flow_api.id(86572919288659601)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P142_RSPSTA'') == ''ENCONTRO'' ){',
'    // tipo de archivo valido',
'   apex.item(''BTN_AGREGAR_ADJUNTO'').enable();',
'',
'}',
'',
'else if  ($v(''P142_RSPSTA'') == ''MAYOR''){',
unistr('    // Archivo con tama\00F1o superior al permitido'),
'    apex.item(''BTN_AGREGAR_ADJUNTO'').disable();',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >RENTAS VARIAS</H2>'',',
unistr('        html: ''<H4>El Tama\00F1o del archivo supera lo permitido</H4>''        '),
'    });',
' }',
'',
'else if  ($v(''P142_RSPSTA'') == ''NO_ENCONTRO'' ){',
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10250418916341514)
,p_name=>'Al dar click Boton BTN_CNTRTO_EXTRNO'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10314107150727463)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10250567328341515)
,p_event_id=>wwv_flow_api.id(10250418916341514)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = $("#region-flotante");',
'region.toggleClass("visible");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10250608509341516)
,p_name=>'Al dar click BTN_CERRAR'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10302107918721795)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10250758217341517)
,p_event_id=>wwv_flow_api.id(10250608509341516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#region-flotante").removeClass("visible");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76824744977950304)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''ADJUNTOS_RENTA'',',
'        p_seq => :P142_SEQ_ID);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Adjunto Eliminado Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76825173975950308)
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
' /*   begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files;',
'        -- where name = :P142_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;*/',
'    ',
'    for c_adjunto in ( select *  from apex_application_temp_files) loop',
'    ',
'        if c_adjunto.filename is not null then',
'',
'            if (not apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_RENTA'') ) then',
'                apex_collection.create_collection( p_collection_name => ''ADJUNTOS_RENTA'');',
'            end if;',
'',
'            apex_collection.add_member( p_collection_name   => ''ADJUNTOS_RENTA''',
'                                      , p_n001              => :P142_ID_SBMPTO_ADJNTO_TPO ',
'                                      , p_c001              => :P142_OBSRVCION',
'                                      , p_c002              => c_adjunto.filename',
'                                      , p_c003              => c_adjunto.mime_type',
'                                      , p_blob001           => c_adjunto.blob_content );',
'                                      ',
'            delete apex_application_temp_files where filename = c_adjunto.filename;',
'',
'        end if;',
'    ',
'    end loop; ',
'   ',
'end;'))
,p_process_error_message=>'Error al adjuntar archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(76758209533970045)
,p_process_success_message=>'Adjunto agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76825225380950309)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar los items luego de agregar un adjunto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P142_FILE_BLOB,P142_SEQ_ID,P142_OBSRVCION,P142_ID_SBMPTO_ADJNTO_TPO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(76758209533970045)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10301393862714266)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Informacion Contrato Externo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        select   a.nmro_cntrto',
'                ,a.objto',
'                ,a.fcha_frma',
'                ,a.fcha_incio_cntrto',
'                ,a.fcha_fin',
'                ,a.vlor_cntrto_inclye_iva',
'                ,a.vlor_cntrto_sin_iva',
'                ,a.vlor_iva',
'                ,a.tpo_cntrto',
'                ,a.drcion_dias',
'                ,a.dscrpcion_frma_pgo',
'                ,a.drcion',
'                ,a.cdgo_dpndncia ||'' ''|| a.nmbre_dpndncia',
'                ,a.prmer_nmbre || '' '' || a.sgndo_nmbre || '' '' || a.prmer_aplldo || '' '' || a.sgndo_aplldo',
'                ,a.drccion',
'                ,a.tlfno',
'                ,a.correo ',
'                ,decode(a.tpo_prsna,''N'', ''Natural'', ''J'', ''Juridica'', ''Otro'') tpo_prsna',
'                ,(select dscrpcion_idntfccion_tpo from df_s_identificaciones_tipo where cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo)',
'                ,a.nmro_idntfccion ',
'                , (select nmbre_dprtmnto from df_s_departamentos where cdgo_dprtmnto  = a.cdgo_dprtmnto ) nmbre_dprtmnto',
'                , (select nmbre_mncpio   from df_s_municipios where cdgo_mncpio =  a.cdgo_mncpio)  nmbre_mncpio ',
'                ,a.tpo_rgmen',
'                ,a.estdo',
'                ,a.rspnsble_de_iva',
'                ,a.cnsctvo_rp',
'                ,a.fcha_rp',
'            into',
'                 :P142_NMRO_CNTRTO_EXT',
'                ,:P142_OBJTO',
'                ,:P142_FCHA_FRMA',
'                ,:P142_FCHA_INCIO_CNTRTO',
'                ,:P142_FCHA_FIN',
'                ,:P142_VLOR_CNTRTO_INCLYE_IVA',
'                ,:P142_VLOR_CNTRTO_SIN_IVA',
'                ,:P142_VLOR_IVA',
'                ,:P142_TPO_CNTRTO',
'                ,:P142_DRCION_DIAS',
'                ,:P142_DSCRPCION_FRMA_PGO',
'                ,:P142_DRCION ',
'                ,:P142_NMBRE_DPNDNCIA',
'                ,:P142_NMBRE ',
'                ,:P142_DRCCION',
'                ,:P142_TLFNO_EXT',
'                ,:P142_CORREO_EXT',
'                ,:P142_TPO_PRSNA',
'                ,:P142_CDGO_IDNTFCCION_TPO',
'                ,:P142_NMRO_IDNTFCCION',
'                ,:P142_NMBRE_DPRTMNTO',
'                ,:P142_NMBRE_MNCPIO',
'                ,:P142_TPO_RGMEN',
'                ,:P142_ESTDO',
'                ,:P142_RSPNSBLE_DE_IVA ',
'                ,:P142_CNSCTVO_RP        ',
'                ,:P142_FCHA_RP   ',
'        from gi_g_rentas_contrato_externo a',
'            where a.id_rnta_cntrto_extrno =  :P138_ID_RNTA_CNTRTO_EXTRNO;',
'exception',
'    when others then',
'        :P142_NMRO_CNTRTO_EXT				:= null;',
'        :P142_OBJTO                         := null;',
'        :P142_FCHA_FRMA                     := null;',
'        :P142_FCHA_FIN                      := null;',
'        :P142_FCHA_INCIO_CNTRTO             := null;',
'        :P142_VLOR_CNTRTO_INCLYE_IVA        := null;',
'        :P142_VLOR_CNTRTO_SIN_IVA           := null;',
'        :P142_VLOR_IVA                      := null;',
'        :P142_TPO_CNTRTO                    := null;',
'        :P142_DRCION_DIAS                   := null;',
'        :P142_DSCRPCION_FRMA_PGO            := null;',
'        :P142_DRCION                        := null;',
'        :P142_NMBRE_DPNDNCIA                := null;',
'        :P142_NMBRE                         := null;',
'        :P142_DRCCION                       := null;',
'        :P142_TLFNO_EXT                     := null;',
'        :P142_CORREO_EXT                    := null;',
'        :P142_TPO_PRSNA                     := null;',
'        :P142_CDGO_IDNTFCCION_TPO           := null;',
'        :P142_NMRO_IDNTFCCION               := null;',
'        :P142_NMBRE_DPRTMNTO                := null;',
'        :P142_NMBRE_MNCPIO                  := null;',
'        :P142_TPO_RGMEN                     := null;',
'        :P142_ESTDO                         := null; ',
'        :P142_RSPNSBLE_DE_IVA               := null; ',
'        :P142_CNSCTVO_RP                    := null; ',
'        :P142_FCHA_RP                       := null; ',
'end;',
'',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
