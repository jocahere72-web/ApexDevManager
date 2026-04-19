prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Detalle Lote'
,p_step_title=>'Detalle Lote'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'',
'',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#btn{',
'  border-radius: 5px;',
'}'))
,p_step_template=>wwv_flow_api.id(30309424961578275)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20221018151700'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40927289496714607)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
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
 p_id=>wwv_flow_api.id(40927882795714613)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
unistr('Funcionalidad que permite la visualizaci\00F3n del detalle de un lote.'),
'    <br/>',
'    <br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41016413373805003)
,p_plug_name=>'Lote'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(121969875589943042)
,p_plug_name=>'Detalle Lote'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct    b.id_acto,',
'                   b.nmro_acto,',
'                   b.cdgo_acto_orgen,',
'                   b.dscrpcion_acto_orgen,',
'                   b.id_acto_tpo,',
'                   initcap(b.dscrpcion_acto_tpo) dscrpcion_acto_tpo,',
'                   b.fcha ',
'  from nt_d_lote_detalle a',
'  join v_nt_g_notfccnes_gn_g_actos b',
'    on a.id_acto = b.id_acto',
' where a.id_lte = :P22_ID_LOTE',
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
 p_id=>wwv_flow_api.id(121845466640999478)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h5>No existe detalle para Lote  [ &P22_ID_LOTE. - ',
' &P22_DESCRIPCION. ]</h5>'))
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>121845466640999478
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40947348774883731)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Id Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40947708174883732)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'No. Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40948172060883732)
,p_db_column_name=>'CDGO_ACTO_ORGEN'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Cdgo Acto Orgen'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40948593283883732)
,p_db_column_name=>'DSCRPCION_ACTO_ORGEN'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40949357655883733)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84515334398060803)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118269692530171504)
,p_db_column_name=>'FCHA'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Fcha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(122000468129196238)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'409505'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ACTO:NMRO_ACTO:CDGO_ACTO_ORGEN:DSCRPCION_ACTO_ORGEN:DSCRPCION_ACTO_TPO:ID_ACTO_TPO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40927322568714608)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(40927289496714607)
,p_button_name=>'Regresar'
,p_button_static_id=>'btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(115654516562865730)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(40927289496714607)
,p_button_name=>'Btn_Regresar_Lotes'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Regresar  a Lotes'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P22_VER_RGRESAR_LTES'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40928889865714623)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(40927289496714607)
,p_button_name=>'Eliminar_Lote'
,p_button_static_id=>'btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Eliminar Lote'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select id_lte ',
'        from nt_g_lote ',
'        where id_lte = :P22_ID_LOTE and',
'              cdgo_estdo_lte = ''GEN'')'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41254151007777007)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(40927289496714607)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P22_ID_LOTE and',
'              b.cdgo_mdio   IN (''CCE'',''CEL'') and',
'              a.cdgo_estdo_lte = ''EPR'') --Correo Certificado'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122997057726442601)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(40927289496714607)
,p_button_name=>'Btn_Actualizar_Edicto'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar Edicto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP,31:P31_ID_LOTE:&P22_ID_LOTE.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_lte ',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte         = :P22_ID_LOTE and',
'              b.cdgo_mdio      = ''EDT'' and',
'              a.cdgo_estdo_lte = ''EPR'') --Correo Certificado'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-clipboard-edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(41184739852413609)
,p_branch_name=>'Ir pagina 21 cuando elimine lote'
,p_branch_action=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,22,21::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(40928889865714623)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(115653317225865718)
,p_branch_action=>'f?p=&APP_ID.:22:&SESSION.:ImprimirGuia:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(41254151007777007)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(115654492582865729)
,p_branch_name=>unistr('Regresar a P\00E1gina Origen')
,p_branch_action=>'f?p=&APP_ID.:&P22_BRANCH.:&SESSION.::&DEBUG.:RP,22,&P22_BRANCH.::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(40927322568714608)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(115654757661865732)
,p_branch_name=>unistr('Ir a P\00E1gina 21')
,p_branch_action=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,13,21::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(115654516562865730)
,p_branch_sequence=>50
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40926867538714603)
,p_name=>'P22_ID_LOTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_prompt=>unistr('<b>N\00FAmero Lote</b>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40926950580714604)
,p_name=>'P22_DESCRIPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_prompt=>unistr('<b>Descripci\00F3n</b>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40927057582714605)
,p_name=>'P22_BRANCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(121969875589943042)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52872919814352205)
,p_name=>'P22_ACTO_TIPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_prompt=>'<b>Tipo de Acto</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52874178349352217)
,p_name=>'P22_FCHA_GNRCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_prompt=>unistr('<b>Fecha Generaci\00F3n</b>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52874240087352218)
,p_name=>'P22_ESTDO_LTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52874372381352219)
,p_name=>'P22_FCHA_PRCSMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_prompt=>'<b>Fecha de Procesamiento</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52874491910352220)
,p_name=>'P22_ID_NTFCION_MDIO_EVDNCIA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52874556961352221)
,p_name=>'P22_DSCRPCION_MDIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_prompt=>unistr('<b>Medio de Notificaci\00F3n</b>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52874613373352222)
,p_name=>'P22_DSCRPCION_ENTDAD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_prompt=>'<b>Entidad</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115654685704865731)
,p_name=>'P22_VER_RGRESAR_LTES'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(41016413373805003)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(41212666661360183)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_tpo    varchar2(15);',
'    v_mnsje        varchar(3200);',
'begin',
'    pkg_nt_notificacion.prc_el_lote(',
'        p_id_lote    => :P22_ID_LOTE,',
'        o_mnsje_tpo  => v_mnsje_tpo,',
'        o_mnsje      => v_mnsje',
'    );',
'    if(v_mnsje_tpo = ''ERROR'') then',
'        RAISE_APPLICATION_ERROR (-20000,v_mnsje); ',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(40928889865714623)
,p_process_success_message=>'Lote eliminado exitosamente ..! '
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52874086396352216)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga Informaci\00F3n del Lote')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.dscrpcion,',
'           to_char(a.fcha_gnrcion, ''dd/MM/YYYY''),',
'           case a.cdgo_estdo_lte',
'            when ''GEN'' then ''Generado''',
'            when ''PRO'' then ''Procesado''',
'            when ''EPR'' then ''En Proceso''',
'           end estdo_lte,',
'           b.dscrpcion acto_tipo,',
'           a.fcha_prcsmnto,',
'           a.id_ntfcion_mdio_evdncia,',
'           c.dscrpcion_mdio,',
'           c.dscrpcion_entdad',
'    into   :P22_DESCRIPCION,',
'           :P22_FCHA_GNRCION,',
'           :P22_ESTDO_LTE,',
'           :P22_ACTO_TIPO,',
'           :P22_FCHA_PRCSMNTO,',
'           :P22_ID_NTFCION_MDIO_EVDNCIA,',
'           :P22_DSCRPCION_MDIO,',
'           :P22_DSCRPCION_ENTDAD',
'    from nt_g_lote a',
'    left join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'    inner join v_nt_d_ntfccion_mdio_entdd c on a.id_entdad_clnte_mdio = c.id_entdad_clnte_mdio',
'    where id_lte = :P22_ID_LOTE;',
'exception',
'    when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90788078962739206)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir Guia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql           clob;',
'    v_file_blob     blob;',
'    v_msg_error     varchar2(3200);',
'begin',
'    v_sql :=   ''select a.id_lte_dtlle "Id. Lote Detalle",',
'                       b.dscrpcion_acto_tpo "Tipo de Acto",',
unistr('                       b.nmro_acto "N\00FAmero del Acto",'),
'                       to_char(b.fcha,''||chr(39)||''dd/MM/yyyy''||chr(39)||'') "Fecha del Acto",',
unistr('                       b.idntfccion_sjto "Identificaci\00F3n del Sujeto",'),
unistr('                       c.cdgo_idntfccion_tpo "Tipo de Identificaci\00F3n",'),
unistr('                       c.idntfccion "Identificaci\00F3n",'),
'                       c.prmer_nmbre "Primer Nombre",',
'                       c.sgndo_nmbre "Segundo Nombre",',
'                       c.prmer_aplldo "Primer Apellido",',
'                       c.sgndo_aplldo "Segundo Apellido",',
unistr('                       c.drccion_ntfccion "Direcci\00F3n Notificaci\00F3n",'),
'                       d.nmbre_mncpio "Municipio",',
'                       e.nmbre_dprtmnto "Departamento",',
unistr('                       f.nmbre_pais "Pa\00EDs",'),
'                       null "Orden de Servicio",',
unistr('                       null "N\00FAmero de Guia",'),
unistr('                       null "Fecha de Notificaci\00F3n",'),
'                       null "Estado",',
unistr('                       null "Causal de Devoluci\00F3n",'),
'                       null "Nombre Recibe",',
unistr('                       null "Identificaci\00F3n Recibe",'),
'                       null  "Evidencia Nombre Completo"',
'                from nt_d_lote_detalle                  a',
'                inner join v_gn_g_actos_sujeto_impuesto b on a.id_acto                  = b.id_acto',
'                inner join gn_g_actos_responsable       c on a.id_acto_rspnsble         = c.id_acto_rspnsble',
'                inner join df_s_municipios              d on c.id_mncpio_ntfccion       = d.id_mncpio',
'                inner join df_s_departamentos           e on c.id_dprtmnto_ntfccion     = e.id_dprtmnto',
'                inner join df_s_paises                  f on c.id_pais_ntfccion         = f.id_pais',
'                where a.id_lte =''||:P22_ID_LOTE||',
'                ''',
'                and a.id_acto_rspnsble in',
'                (select min(g.id_acto_rspnsble)',
'                from nt_d_lote_detalle g',
'                where g.id_acto = a.id_acto)',
'                order by b.nmro_acto'';',
'    pkg_gn_generalidades.prc_ge_excel_sql(',
'        p_sql       => v_sql,',
'        o_file_blob => v_file_blob,',
'        o_msgerror  => v_msg_error',
'    );',
'    ',
'    if(v_msg_error is not null)then',
'        raise_application_error(-20000, v_msg_error);',
'    end if;',
'    ',
'    --',
'    owa_util.mime_header(  ',
'        ''application/ms-excel'',  ',
'        false  ',
'    );',
'    ',
'    htp.p(''Content-length: '' ||sys.dbms_lob.getlength(v_file_blob) );  ',
'    htp.p(''Content-Disposition: attachment; filename="GuiaNotificacion''||:P22_ID_LOTE||to_char(sysdate,''yyyyMMddHHmiss'')||''.xlsx"'');  ',
'    htp.p(''Cache-Control: max-age=0'');',
'    owa_util.http_header_close;  ',
'    wpg_docload.download_file(v_file_blob);  ',
'    apex_application.stop_apex_engine;  ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ImprimirGuia'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
