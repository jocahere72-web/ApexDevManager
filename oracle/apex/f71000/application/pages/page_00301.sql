prompt --application/pages/page_00301
begin
wwv_flow_api.create_page(
 p_id=>301
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Aprobar o Rechazar Reversion AP'
,p_step_title=>'Aprobar o Rechazar Reversion AP'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210826103930'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207607618483737041)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207767770798119739)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207767866481119740)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(207767770798119739)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207767968393119741)
,p_plug_name=>unistr('<b>INFORMACI\00D3N DEL SOLICITANTE</b>')
,p_parent_plug_id=>wwv_flow_api.id(207767770798119739)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207772239702119783)
,p_plug_name=>'tab'
,p_parent_plug_id=>wwv_flow_api.id(207767770798119739)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207768166337119743)
,p_plug_name=>'<b>DATOS DEL ACUERDO</b>'
,p_parent_plug_id=>wwv_flow_api.id(207772239702119783)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207771416122119775)
,p_plug_name=>'Cartera'
,p_parent_plug_id=>wwv_flow_api.id(207768166337119743)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select c.vgncia,',
'          p.prdo,  ',
'          to_char(c.vlor_cptal, :F_FRMTO_MNDA) vlor_cptal,',
'          to_char(c.vlor_intres, :F_FRMTO_MNDA) vlor_intres,',
'          to_char(c.vlor_cptal+vlor_intres , :F_FRMTO_MNDA)vlor_ttal',
'    from gf_g_convenios_cartera c',
'    join df_i_periodos p',
'      on p.id_prdo = c.id_prdo    ',
'    where id_cnvnio =  :P301_ID_CNVNIO;'))
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
 p_id=>wwv_flow_api.id(214727383309832043)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>214727383309832043
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94498705674789091)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94499078937789114)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94499423133789114)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94499813002789114)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94500204195789115)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(214741831334859840)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'945006'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207772271351119784)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(207768166337119743)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cta,',
'        to_char(vlor_ttal, :F_FRMTO_MNDA) vlor_ttal,',
'        fcha_vncmnto',
'   from gf_g_convenios_extracto',
'  where id_cnvnio =  :P301_ID_CNVNIO',
'         and actvo = ''S'';',
' '))
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
 p_id=>wwv_flow_api.id(207772422755119785)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JIRIARTE'
,p_internal_uid=>207772422755119785
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94501302343789143)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94502115869789149)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Cuota'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94501786586789147)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(207938740663743771)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'945025'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(355274551125755159)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(533211242930424363)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(355274551125755159)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>    ',
'    <p align="justify">En esta Funcionalidad.<br><br> ',
unistr('        <b>1.</b> Se muestra la informaci\00F3n del acuerdo de pago.<br><br>'),
unistr('        <b>2.</b> Se permite aprobar la reversi\00F3n del acuerdo de pago.<br><br>'),
unistr('        <b>3.</b> Se permite seleccionar la opci\00F3n de aplicar o rechazar la reversi\00F3n del acuerdo.'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>     '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94512173961789186)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(355274551125755159)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.:RP,187::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94512592005789187)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(355274551125755159)
,p_button_name=>'BTN_APRBAR_RVRSION'
,p_button_static_id=>'BTN_APROBAR_ACUERDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Aprobar Reversi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P301_CDGO_CNVNIO_RVRSION_ESTDO'
,p_button_condition2=>'RGS'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94512989246789187)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(355274551125755159)
,p_button_name=>'BTN_APLCAR_RVRSION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Aplicar Reversi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P301_CDGO_CNVNIO_RVRSION_ESTDO'
,p_button_condition2=>'APB'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94513396863789187)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(355274551125755159)
,p_button_name=>'BTN_RECHAZAR_RVRSION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Rechazar Reversi\00F3n - Mostrar')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'R'
,p_button_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_icon_css_classes=>'fa-clipboard-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94513704133789187)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(355274551125755159)
,p_button_name=>'RECHAZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Rechazar Reversi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P301_CDGO_CNVNIO_RVRSION_ESTDO = ''APB'' OR ',
':P301_CDGO_CNVNIO_RVRSION_ESTDO= ''RGS'''))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-clipboard-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94511440748789179)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(355274551125755159)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_VALOR:v_gn_g_actos,file_blob,file_mimetype,id_acto,file_name,&P301_ID_ACTO.'
,p_button_condition=>'P301_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94511891618789186)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(355274551125755159)
,p_button_name=>'BTN_VER_ACTO_1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Generar Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94519126004789338)
,p_branch_name=>unistr('ir pagina 302 Plantilla - Apllicaci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP,302:P302_CDGO_ACCION,P302_BRANCH:APL,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(94512989246789187)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94519588796789338)
,p_branch_name=>'ir pagina 302 Plantilla - Rechazo'
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP,302:P302_CDGO_ACCION,P302_BRANCH:RCH,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(94513704133789187)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94518700922789336)
,p_branch_name=>'Ir pagina 147'
,p_branch_action=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(94512592005789187)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94484543755788966)
,p_name=>'P301_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(207767770798119739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94484958398788981)
,p_name=>'P301_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(207767770798119739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94485382483788981)
,p_name=>'P301_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(207767770798119739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94485777882788981)
,p_name=>'P301_ID_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(207767770798119739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94486042583788994)
,p_name=>'P301_NMBRE_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(207767770798119739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94486477061788995)
,p_name=>'P301_RSPTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(207767770798119739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94486844324788995)
,p_name=>'P301_A_O_R'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(207767770798119739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94487569399788997)
,p_name=>'P301_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(207767866481119740)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94487925876788998)
,p_name=>'P301_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(207767866481119740)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94488375677788998)
,p_name=>'P301_DRCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(207767866481119740)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94488727658788998)
,p_name=>'P301_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(207767866481119740)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94489116577788999)
,p_name=>'P301_ID_INSTNCIA_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(207767866481119740)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94489591293788999)
,p_name=>'P301_NMBRE_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(207767866481119740)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94489993791789012)
,p_name=>'P301_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(207767866481119740)
,p_prompt=>'Sub Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94490671394789013)
,p_name=>'P301_CDGO_IDNTFCCION_TPO_SLCTNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(207767968393119741)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94491004771789014)
,p_name=>'P301_NMRO_IDNTFCCION_SLCTNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(207767968393119741)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94491435288789014)
,p_name=>'P301_NMBRE_SLCTNTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(207767968393119741)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94491855649789016)
,p_name=>'P301_UBCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(207767968393119741)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94492215891789016)
,p_name=>'P301_DRCCION_NTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(207767968393119741)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94492613033789016)
,p_name=>'P301_TLFNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(207767968393119741)
,p_prompt=>unistr('Tel\00E9fono/Celular')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94493057163789016)
,p_name=>'301_EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(207767968393119741)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94494049281789018)
,p_name=>'P301_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94494483883789018)
,p_name=>'P301_NMRO_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_prompt=>unistr('Acuerdo N\00B0 :')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94494891793789018)
,p_name=>'P301_CDGO_CNVNIO_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94495280555789019)
,p_name=>'P301_ID_CNVNIO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_prompt=>'Tipo de Acuerdo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94495624737789020)
,p_name=>'P301_VLOR_CTA_INCIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_prompt=>'Valor Cuota Inicial'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94496007050789020)
,p_name=>'P301_FCHA_PGO_CTA_INCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_prompt=>'Fecha Limite Pago'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94496402741789020)
,p_name=>'P301_FCHA_PRMRA_CTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_prompt=>'Fecha Primera Cuota'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94496812777789021)
,p_name=>'P301_NMRO_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_prompt=>unistr('N\00B0 Cuotas')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94497691708789021)
,p_name=>'P301_NMRO_CTAS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94498026133789021)
,p_name=>'P301_CNVNIO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94606427596264502)
,p_name=>'P301_ID_CNVNIO_RVRSION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(207767866481119740)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94606543729264503)
,p_name=>'P301_CDGO_CNVNIO_RVRSION_ESTDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94910441459097301)
,p_name=>'P301_FCHA_RCHZO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(207768166337119743)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(94727187033814301)
,p_computation_sequence=>10
,p_computation_item=>'P301_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_INSTNCIA_FLJO'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(94514576116789277)
,p_computation_sequence=>20
,p_computation_item=>'P301_ID_CNVNIO_RVRSION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio_rvrsion',
'  from gf_g_convenios_reversion b',
' where b.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94517788934789331)
,p_name=>'Borrar Ruta Actual'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94513396863789187)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94518256443789331)
,p_event_id=>wwv_flow_api.id(94517788934789331)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''BTN_APROBAR_CVN_MDFCCION'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94516331458789304)
,p_name=>'Aprobar Mod AP'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94512592005789187)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94516847614789322)
,p_event_id=>wwv_flow_api.id(94516331458789304)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' declare',
'',
'    v_cdgo_rspsta    number;',
'',
'begin',
'',
'   pkg_gf_convenios.prc_ap_reversion_acuerdo_pago ( p_cdgo_clnte           =>		:F_CDGO_CLNTE,',
'                                                    p_id_cnvnio         	=>		:P301_ID_CNVNIO,',
'                                                    p_id_usrio          	=>		:F_ID_USRIO,',
'                                                    o_cdgo_rspsta       	=>		v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta      	=>		:P301_RSPSTA); ',
'                                                ',
'          if v_cdgo_rspsta = 0 then',
unistr('              :P301_RSPSTA := ''\00A1Aprobaci\00F3n de Reversi\00F3n Realizada Satisfactoriamente!'';'),
'          end if;',
'          ',
'    apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'end;',
'',
' ',
''))
,p_attribute_02=>'P301_RSPTA'
,p_attribute_03=>'P301_RSPTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94517335474789330)
,p_event_id=>wwv_flow_api.id(94516331458789304)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var mensaje =  $v( "P301_RSPTA" );',
'Swal.fire({',
'            icon: ''error'',',
'            title:  mensaje,',
'            html: ''''',
'        });',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94514852802789286)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--set serveroutput on',
'declare',
'    o_cdgo_rspsta         number;',
'    o_mnsje_rspsta        varchar2(1000);',
'    V_ID_PLNTLLA          NUMBER            := 74;',
'    v_P214_ID_ACTO_TPO    number            := 208;',
'    v_cdgo_clnte            number :=6;',
'    v_id_cnvnio_mdfccion    number :=12;',
'    V_Id_Cnvnio             number :=85;    ',
'    v_html                  clob;',
'    v_id_acto               number := 4151400;    ',
'    ',
'begin',
'    v_html := pkg_gn_generalidades.fnc_ge_dcmnto(''<COD_CLNTE>''            || v_cdgo_clnte           || ''</COD_CLNTE>',
'                                                 <ID_CNVNIO_MDFCCION>''    || v_id_cnvnio_mdfccion   || ''</ID_CNVNIO_MDFCCION>',
'                                                 <ID_CNVNIO>''             || V_Id_Cnvnio            ||  ''</ID_CNVNIO>',
'                                                 <ID_ACTO_TPO>''           || v_P214_ID_ACTO_TPO      || ''</ID_ACTO_TPO>',
'                                                 <ID_PLNTLLA>''            || V_ID_PLNTLLA            || ''</ID_PLNTLLA>'', V_ID_PLNTLLA);',
'',
'    update gf_g_convenios_documentos',
'     set dcmnto = v_html',
'     where id_cnvnio = V_Id_Cnvnio',
'       and id_cnvnio_mdfccion = v_id_cnvnio_mdfccion',
'       and id_rprte             = 294;',
'       ',
'   pkg_gf_convenios.prc_gn_reporte_acuerdo_pago(p_cdgo_clnte   => 6,',
'                                                 p_id_cnvnio    => V_Id_Cnvnio,',
'                                                 p_id_plntlla   => V_ID_PLNTLLA,',
'                                                 p_id_acto      => v_id_acto,',
'                                                 o_cdgo_rspsta  => o_cdgo_rspsta,',
'                                                 o_mnsje_rspsta => o_mnsje_rspsta);',
'    DBMS_OUTPUT.put_line(''o_mnsje_rspsta: '' || o_mnsje_rspsta);',
' end; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94511891618789186)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94515938225789299)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VALIDA APROBACION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if(:REQUEST = ''BTN_APLCAR_MDFCCION'')then',
'        begin',
'            update gf_g_convenios_modificacion',
'               set cdgo_estdo_trnscion = ''APL''',
'             where id_cnvnio_mdfccion = :P301_ID_CNVNIO_MDFCCION;',
'        exception',
'            when others then',
unistr('                raise_application_error(-20001, ''No se Actualiz\00F3 la transicion'');'),
'        end;        ',
'    elsif(:REQUEST = ''RECHAZAR'')then',
'         begin',
'            update gf_g_convenios_modificacion',
'               set cdgo_estdo_trnscion = ''RCH''',
'             where id_cnvnio_mdfccion = :P301_ID_CNVNIO_MDFCCION;',
'        exception',
'            when others then',
unistr('                raise_application_error(-20001, ''No se Actualiz\00F3 la transicion'');'),
'        end;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94515525442789298)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Aprobar reversi\00F3n de Acuerdo de pagos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta    number;',
'',
'begin',
'',
'    pkg_gf_convenios.prc_ap_reversion_acuerdo_pago ( p_cdgo_clnte           =>		:F_CDGO_CLNTE,',
'                                                    p_id_cnvnio         	=>		:P301_ID_CNVNIO,',
'                                                    p_id_usrio          	=>		:F_ID_USRIO,',
'                                                    o_cdgo_rspsta       	=>		v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta      	=>		:P301_RSPSTA); ',
'                                                ',
'          if v_cdgo_rspsta = 0 then',
unistr('              :P301_RSPSTA := ''\00A1Aprobaci\00F3n de Reversi\00F3n Realizada Satisfactoriamente!'';'),
'          end if;',
'          ',
'    apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'end;'))
,p_process_error_message=>'&P301_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94512592005789187)
,p_process_success_message=>'&P301_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94515198899789294)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Convenios'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'select	  id_cnvnio                       ',
'	 --   , id_cnvnio_rvrsion                ',
'		, id_acto                         ',
'		, idntfccion_sjto_frmtda          ',
'		, drccion                         ',
'		, id_cnvnio_tpo                   ',
'		, id_impsto                       ',
'		, nmbre_impsto                    ',
'		, id_impsto_sbmpsto               ',
'		, nmbre_impsto_sbmpsto            ',
'		, nmro_cnvnio                     ',
'		, cdgo_cnvnio_estdo               ',
'		, fcha_prmra_cta                                ',
'		, nmro_cta                        ',
'		, to_char(vlor_cta_incial, :f_frmto_mnda)',
'        , to_char(fcha_lmte_cta_incial, ''dd/mm/yyyy'') ',
'		, nmro_mxmo_ctas            						     ',
'		, id_sjto_impsto      									            ',
'		, nmro_rdcdo_dsplay               ',
'		, cdgo_cnvnio_rvrsion_estdo       ',
'		, mtvo_rchzo_rvrsion              ',
'		, fcha_rchzo                      ',
'		, nmbre_slctnte                   ',
'		, cdgo_idntfccion_tpo_slctnte     ',
'		, nmro_idntfccion_slctnte         ',
'		, drccion_ntfccion                ',
'		, nmbre_pais_ntfccion || '' - '' || nmbre_dprtmnto_ntfccion || '' - '' || nmbre_mncpio_ntfccion',
'        , tlfno || '' - '' || cllar        ',
'INTO ',
'		:P301_ID_CNVNIO                       ',
'	--	, :P301_ID_CNVNIO_RVRSION                ',
'		, :P301_ID_ACTO                         ',
'	    , :P301_IDNTFCCION        ',
'		, :P301_DRCCION                         ',
'		, :P301_ID_CNVNIO_TPO                   ',
'		, :P301_ID_IMPSTO                       ',
'		, :P301_NMBRE_IMPSTO                    ',
'		, :P301_ID_IMPSTO_SBMPSTO               ',
'		, :P301_NMBRE_IMPSTO_SBMPSTO            ',
'		, :P301_NMRO_CNVNIO                     ',
'		, :P301_CDGO_CNVNIO_ESTDO               ',
'		, :P301_FCHA_PRMRA_CTA                                ',
'		, :P301_NMRO_CTA                        ',
'		, :P301_VLOR_CTA_INCIAL',
'		, :P301_FCHA_PGO_CTA_INCIAL	',
'		, :P301_NMRO_CTAS      ',
'		, :P301_ID_SJTO_IMPSTO            ',
'		, :P301_NMRO_RDCDO_DSPLAY               ',
'		, :P301_CDGO_CNVNIO_RVRSION_ESTDO       ',
'		, :P301_MTVO_RCHZO_RVRSION              ',
'		, :P301_FCHA_RCHZO                      ',
'		, :P301_NMBRE_SLCTNTE                   ',
'		, :P301_CDGO_IDNTFCCION_TPO_SLCTNTE     ',
'		, :P301_NMRO_IDNTFCCION_SLCTNTE         ',
'		, :P301_DRCCION_NTFCCION                ',
'		, :P301_UBCCION',
'		, :P301_TLFNO   ',
'from v_gf_g_convenios_reversion ',
'where id_instncia_fljo_hjo =  :F_ID_INSTNCIA_FLJO;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P301_ID_CNVNIO_RVRSION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
