prompt --application/pages/page_00270
begin
wwv_flow_api.create_page(
 p_id=>270
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Registrar Contribuyente'
,p_page_mode=>'MODAL'
,p_step_title=>'Registrar Contribuyente'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'ERICO'
,p_last_upd_yyyymmddhh24miss=>'20220509123940'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268264091334545364)
,p_plug_name=>unistr('Informaci\00F3n del Contribuyente')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22581161322298702)
,p_plug_name=>'<b>Sucursales</b>'
,p_parent_plug_id=>wwv_flow_api.id(268264091334545364)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , c001 id_sjto_impsto',
'        , c002 nmbre',
'        , c003 prncpal_s_n',
'        , c004 cdgo_scrsal',
'        , c005 id_dprtmnto_ntfccion',
'        , c006 id_mncpio_ntfccion',
'        , c007 drccion_ntfccion',
'        , c008 email',
'        , c009 tlfno',
'        , c010 cllar',
'        , c011 actvo ',
'        , ''<center>',
'            <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Eliminar  ',
'                <span class="fa fa-trash-o" aria-hidden="true"></span>',
'            </button>',
'        </center>'' as btn_eliminar',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES''',
'     -- and n001                = :F_ID_INSTNCIA_FLJO',
'    order by cdgo_scrsal;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES'''))
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
 p_id=>wwv_flow_api.id(22581389078298704)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:272:&SESSION.::&DEBUG.:RP,272:P272_SEQ_ID:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JPRADA'
,p_internal_uid=>22581389078298704
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22581455533298705)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22582143611298712)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(22118235286832618)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22582345473298714)
,p_db_column_name=>'ACTVO'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(22118235286832618)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22582483526298715)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22582587083298716)
,p_db_column_name=>'NMBRE'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Sucursal'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22582683771298717)
,p_db_column_name=>'CDGO_SCRSAL'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>unistr('C\00F3digo Sucursal')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22582703730298718)
,p_db_column_name=>'ID_DPRTMNTO_NTFCCION'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(9153237613253457)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22582807523298719)
,p_db_column_name=>'ID_MNCPIO_NTFCCION'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(9154092262253466)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22582919208298720)
,p_db_column_name=>'DRCCION_NTFCCION'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22583062958298721)
,p_db_column_name=>'EMAIL'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22583174823298722)
,p_db_column_name=>'TLFNO'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22583220383298723)
,p_db_column_name=>'CLLAR'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Celular'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22884797910646201)
,p_db_column_name=>'BTN_ELIMINAR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:270:&SESSION.:ELIMINAR_SUCURSAL:&DEBUG.:RP:P270_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'#BTN_ELIMINAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(22591308207390094)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'225914'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE:CDGO_SCRSAL:ID_DPRTMNTO_NTFCCION:ID_MNCPIO_NTFCCION:DRCCION_NTFCCION:ACTVO:EMAIL:TLFNO:CLLAR::BTN_ELIMINAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268700655249238559)
,p_plug_name=>unistr('<b>Informaci\00F3n B\00E1sica</b>')
,p_parent_plug_id=>wwv_flow_api.id(268264091334545364)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268701473631238567)
,p_plug_name=>'<b>Responsables</b>'
,p_parent_plug_id=>wwv_flow_api.id(268264091334545364)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , c003 cdgo_idntfccion_tpo',
'        , c004 idntfccion',
'        , c005 prmer_nmbre',
'        , c006 sgndo_nmbre',
'        , c007 prmer_aplldo',
'        , c008 sgndo_aplldo',
'        , c009 prncpal_s_n',
'        , c010 cdgo_tpo_rspnsble',
'        , c020 actvo',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'    --  and n001                = :F_ID_INSTNCIA_FLJO;'))
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
 p_id=>wwv_flow_api.id(268702166073238574)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:271:&SESSION.::&DEBUG.:RP,271:P271_SEQ_ID:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>268702166073238574
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22104890724830657)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22105118299831239)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo de<br> Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(22119812204833463)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22105403953831303)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>unistr('Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22105763938831303)
,p_db_column_name=>'PRMER_NMBRE'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'Primer Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22106157206831303)
,p_db_column_name=>'SGNDO_NMBRE'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Segundo Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22106532728831304)
,p_db_column_name=>'PRMER_APLLDO'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'Primer Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22106980504831304)
,p_db_column_name=>'SGNDO_APLLDO'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Segundo Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22107329599831364)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(22118235286832618)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22107769322831365)
,p_db_column_name=>'CDGO_TPO_RSPNSBLE'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'Tipo de <br>Responsable'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(22121357272833464)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22108174682831415)
,p_db_column_name=>'ACTVO'
,p_display_order=>210
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(22118235286832618)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(268836812830861762)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'221084'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:CDGO_IDNTFCCION_TPO:IDNTFCCION:PRMER_NMBRE:SGNDO_NMBRE:PRMER_APLLDO:SGNDO_APLLDO:PRNCPAL_S_N:CDGO_TPO_RSPNSBLE:ACTVO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22108870443831472)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(268701473631238567)
,p_button_name=>'BTN_NUEVO_RESPONSABLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Nuevo Responsable'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:271:&SESSION.::&DEBUG.:RP,271::'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22097024743829863)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(268264091334545364)
,p_button_name=>'BTN_CREAR_SUJETO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear Contribuyente'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P270_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22581001070298701)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(268264091334545364)
,p_button_name=>'BTN_AGRGAR_SCRSLES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Agregar Sucursal'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-network-hub'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(22117956970832616)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(22097024743829863)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(22646633166389203)
,p_branch_name=>'redirigir_pag_272'
,p_branch_action=>'f?p=&APP_ID.:272:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(22581001070298701)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22097491196829941)
,p_name=>'P270_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(268264091334545364)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22097787137830061)
,p_name=>'P270_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(268264091334545364)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22098378080830180)
,p_name=>'P270_TPO_PRSNA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_item_default=>'N'
,p_prompt=>'Tipo de Persona'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Natural;N,Jur\00EDdica;J')
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22098629784830181)
,p_name=>'P270_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22099076737830182)
,p_name=>'P270_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22099418603830182)
,p_name=>'P270_ID_SJTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>'Tipo de Sujeto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_sjto_tpo',
'        , id_sjto_tpo',
'     from df_i_sujetos_tipo',
'    where cdgo_clnte            = :F_CDGO_CLNTE',
'      and id_impsto             = :P270_ID_IMPSTO',
'      and sysdate               between fcha_dsde and fcha_hsta',
' order by nmbre_sjto_tpo'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22099834458830183)
,p_name=>'P270_NMBRE_RZON_SCIAL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>unistr('Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22100237421830183)
,p_name=>'P270_PRMER_NMBRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22100672297830184)
,p_name=>'P270_SGNDO_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22101076530830269)
,p_name=>'P270_PRMER_APLLDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22101472301830269)
,p_name=>'P270_SGNDO_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22101893207830269)
,p_name=>'P270_ID_PAIS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_item_default=>'select id_pais from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22102246289830270)
,p_name=>'P270_ID_DPRTMNTO'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_item_default=>'select id_dprtmnto from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_DEPARTAMENTOS1'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22102636563830270)
,p_name=>'P270_ID_MNCPIO'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_item_default=>'select id_mncpio from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'select nmbre_mncpio, id_mncpio from df_s_municipios where id_dprtmnto = :P270_ID_DPRTMNTO'
,p_lov_cascade_parent_items=>'P270_ID_DPRTMNTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22103009956830270)
,p_name=>'P270_DRCCION'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22103478478830271)
,p_name=>'P270_CLLAR'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22103710509830459)
,p_name=>'P270_TLFNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22104181163830459)
,p_name=>'P270_EMAIL'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(268700655249238559)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22615266705474703)
,p_name=>'P270_VLDR_RGSTRO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(268264091334545364)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22708626717817606)
,p_name=>'P270_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22581161322298702)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22109612863831795)
,p_validation_name=>unistr('Validad que el Tipo de Identificaci\00F3n no sea nulo')
,p_validation_sequence=>10
,p_validation=>'P270_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P270_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_associated_item=>wwv_flow_api.id(22098629784830181)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22708125713817601)
,p_validation_name=>'Validar que el Sujeto Impuesto No exista'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        number;',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P270_ID_IMPSTO',
'       and idntfccion_sjto           = :P270_IDNTFCCION;',
'    ',
'   return false;',
'exception',
'    when no_data_found then ',
'        return true;  ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El Sujeto Tributo que desea crear, ya existe.'
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22109946447832069)
,p_validation_name=>'Validar que el primer nombre no este vacio'
,p_validation_sequence=>30
,p_validation=>'P270_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_associated_item=>wwv_flow_api.id(22100237421830183)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22110258648832070)
,p_validation_name=>'Validar que el primer Apellido no este vacio'
,p_validation_sequence=>40
,p_validation=>'P270_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P270_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_associated_item=>wwv_flow_api.id(22101076530830269)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22110656908832070)
,p_validation_name=>'Validar que el correo sea valido'
,p_validation_sequence=>50
,p_validation=>'regexp_like (:P270_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un Email valido.'
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_associated_item=>wwv_flow_api.id(22104181163830459)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22111003752832070)
,p_validation_name=>'Validar que Exista un Responsable Principal cuando sera persona natural'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and c009                = ''S'';'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Para registrar la solicitud de inscripci\00F3n debe ingresar un responsable principal')
,p_validation_condition=>'P270_TPO_PRSNA'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22111480993832132)
,p_validation_name=>'Validar que el numero de Celular sea valido'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P270_CLLAR) != 10 then ',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, por favor ingrese 10 n\00FAmeros'';    '),
'    elsif substr(:P270_CLLAR, 1, 1) != ''3'' then',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, debe iniciar con 3'';    '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_associated_item=>wwv_flow_api.id(22103478478830271)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22111753290832133)
,p_validation_name=>'Validar que el numero de telefono sea valido'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P270_TLFNO) != 7 then ',
unistr('        return ''El n\00FAmero de tel\00E9fono ingresado no es valido, por favor ingrese 7 n\00FAmeros'';  '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_associated_item=>wwv_flow_api.id(22103710509830459)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22112183964832133)
,p_validation_name=>unistr('Valida direcci\00F3n no este vacio')
,p_validation_sequence=>90
,p_validation=>'P270_DRCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_associated_item=>wwv_flow_api.id(22103009956830270)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22615707714474708)
,p_validation_name=>'Validar que el celular no este vacio'
,p_validation_sequence=>100
,p_validation=>'P270_CLLAR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_associated_item=>wwv_flow_api.id(22103478478830271)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22615805455474709)
,p_validation_name=>'Valida correo que no este vacio'
,p_validation_sequence=>110
,p_validation=>'P270_EMAIL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22097024743829863)
,p_associated_item=>wwv_flow_api.id(22104181163830459)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22112860857832204)
,p_name=>'Ocultar / Mostrar Cuando es Persona Natural'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P270_TPO_PRSNA'
,p_condition_element=>'P270_TPO_PRSNA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22113270823832206)
,p_event_id=>wwv_flow_api.id(22112860857832204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P270_PRMER_NMBRE,P270_SGNDO_NMBRE,P270_PRMER_APLLDO,P270_SGNDO_APLLDO,P270_CDGO_IDNTFCCION_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22113713926832206)
,p_event_id=>wwv_flow_api.id(22112860857832204)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P270_NMBRE_RZON_SCIAL,P270_ID_SJTO_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22114208392832264)
,p_event_id=>wwv_flow_api.id(22112860857832204)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P270_PRMER_NMBRE,P270_SGNDO_NMBRE,P270_PRMER_APLLDO,P270_SGNDO_APLLDO,P270_CDGO_IDNTFCCION_TPO,P118_SGNDO_NMBRE,P118_PRMER_APLLDO,P118_SGNDO_APLLDO,P118_CDGO_IDNTFCCION_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22114751032832264)
,p_event_id=>wwv_flow_api.id(22112860857832204)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P270_NMBRE_RZON_SCIAL,P270_ID_SJTO_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22115204269832265)
,p_event_id=>wwv_flow_api.id(22112860857832204)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(268701473631238567)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22115750373832265)
,p_event_id=>wwv_flow_api.id(22112860857832204)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(268701473631238567)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22116144457832265)
,p_name=>unistr('Si el tipo de persona es Natural calcular el valor de raz\00F3n social')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P270_PRMER_NMBRE,P270_SGNDO_NMBRE,P270_PRMER_APLLDO,P270_SGNDO_APLLDO'
,p_condition_element=>'P270_TPO_PRSNA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22116627971832614)
,p_event_id=>wwv_flow_api.id(22116144457832265)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    var rzon_scial ;',
'    rzon_scial = $v("P270_PRMER_NMBRE") + " " + $v("P270_SGNDO_NMBRE") + " " + $v("P270_PRMER_APLLDO") + " " + $v("P270_SGNDO_APLLDO");',
'    apex.item("P270_NMBRE_RZON_SCIAL").setValue(rzon_scial);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22116949518832615)
,p_name=>unistr('NuevoRefrescar la region de responsables cuando se cierra la modal de gesti\00F3n de responsables')
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(268701473631238567)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22117470802832615)
,p_event_id=>wwv_flow_api.id(22116949518832615)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(268701473631238567)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22583543779298726)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar coleccion de Sucursales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(',
'    p_collection_name => ''SUCURSALES'');',
'   -- APEX_COLLECTION.DELETE_COLLECTION(',
'     --   p_collection_name => ''SUCURSALES'');',
'        :P270_VLDR_RGSTRO:='''';',
'        ',
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(',
'    p_collection_name => ''RESPONSABLES'');',
'   -- APEX_COLLECTION.DELETE_COLLECTION(',
'     --   p_collection_name => ''SUCURSALES'');',
'        :P270_VLDR_RGSTRO:='''';        ',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P270_VLDR_RGSTRO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'RGSTRO'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22112406966832133)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_nvdad_prsna         number;',
'    v_cdgo_rspsta            number;',
'    v_mnsje_rspsta           varchar2(1000);    ',
'    v_cdgo_idntffcion_tpo    varchar2(3)    := ''N'';',
'    v_id_sjto_impsto         number;',
' ',
'begin',
'',
'    insert into muerto (v_001,V_002 ) values (''PERSONA'', ''ENTRO A REGISTRAR''); COMMIT;',
'    ',
'    pkg_si_novedades_persona.prc_rg_sjto_impsto (p_cdgo_clnte						    => :F_CDGO_CLNTE,',
'                                                 p_ssion							    => :APP_SESSION,',
'                                                 p_id_impsto						    => :P270_ID_IMPSTO,',
'                                                 p_id_usrio_rgstro					    => :F_ID_USRIO,',
'                                                 -- Datos de Inscripcion --',
'                                                 p_tpo_prsna						    => :P270_TPO_PRSNA ,',
'                                                 p_cdgo_idntfccion_tpo		            => nvl(:P270_CDGO_IDNTFCCION_TPO,v_cdgo_idntffcion_tpo ),',
'                                             --  p_cdgo_idntfccion_tpo				    => :P270_CDGO_IDNTFCCION_TPO,',
'                                                 p_idntfccion						    => :P270_IDNTFCCION,',
'                                                 p_prmer_nmbre						    => :P270_PRMER_NMBRE,',
'                                                 p_sgndo_nmbre						    => :P270_SGNDO_NMBRE,',
'                                                 p_prmer_aplldo					        => :P270_PRMER_APLLDO,',
'                                                 p_sgndo_aplldo					        => :P270_SGNDO_APLLDO,',
'                                                 p_nmbre_rzon_scial				        => :P270_NMBRE_RZON_SCIAL,',
'                                                 p_drccion							    => :P270_DRCCION,',
'                                                 p_id_pais							    => :P270_ID_PAIS,',
'                                                 p_id_dprtmnto						    => :P270_ID_DPRTMNTO,',
'                                                 p_id_mncpio						    => :P270_ID_MNCPIO,',
'                                                 p_email							    => :P270_EMAIL,',
'                                                 p_tlfno							    => :P270_TLFNO,',
'                                                 p_cllar							    => :P270_CLLAR,',
'                                                 p_id_sjto_tpo						    => :P270_ID_SJTO_TPO,',
'                                                 -- Fin Datos de Inscripcion --',
'                                                 o_id_sjto_impsto                       =>v_id_sjto_impsto,',
'                                                 o_id_nvdad_prsna					    => v_id_nvdad_prsna,',
'                                                 o_cdgo_rspsta						    => v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta					        => v_mnsje_rspsta );',
'                                                 ',
'    -- apex_util.set_session_state(''P270_ID_SJTO_IMPSTO'',v_id_sjto_impsto);                     ',
'     ',
' if v_cdgo_rspsta <> 0 then ',
'     raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', Error al registrar la solicitud. '' || v_mnsje_rspsta);  ',
'  end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22097024743829863)
,p_process_success_message=>'Contribuyente registrado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22708793778817607)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Sucursal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''SUCURSALES'',',
'        p_seq => :P270_SEQ_ID);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_SUCURSAL'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Sucursal Eliminada Exitosamente'
);
end;
/
