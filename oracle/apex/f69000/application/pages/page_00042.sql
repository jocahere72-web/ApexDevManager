prompt --application/pages/page_00042
begin
wwv_flow_api.create_page(
 p_id=>42
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Adjuntos y Observaci\00F3n vh')
,p_step_title=>unistr('Adjuntos y Observaci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(74223836934679730)
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20230810143701'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8130071570222302)
,p_plug_name=>'flujo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8130434207222306)
,p_plug_name=>unistr('tab_Observaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(8130071570222302)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'FUNCTION_BODY'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_estado number;',
'begin',
'   select w.id_estdo_trnscion',
'     into v_estado',
'     from wf_g_instancias_transicion w',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and w.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'      and w.id_usrio = :F_ID_USRIO;',
'',
'  if v_estado = 3 then ',
'    return true; ',
'    else ',
'    return false; ',
'  end if ;',
'',
'exception',
'        when others then ',
'        null; ',
'    ',
'end;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85890545614770460)
,p_plug_name=>unistr('Observaci\00F3n / Adjuntos')
,p_parent_plug_id=>wwv_flow_api.id(8130434207222306)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85899362160008060)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(85890545614770460)
,p_icon_css_classes=>'fa-trash-o'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SEQ_ID',
'     , c001',
'     , c002',
'     , c003',
'     , c004',
'     , d001',
'     , ''<span aria-hidden="true" class="fa fa-trash-o"></span>'' as elmnar',
'  FROM APEX_collections    a    ',
' where collection_name = ''ARCHIVOS_VEHICULO_NOV''  and  n001 = :F_ID_INSTNCIA_FLJO;',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'FUNCTION_BODY'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_estado number;',
'begin',
'   select w.id_estdo_trnscion',
'     into v_estado',
'     from wf_g_instancias_transicion w',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and w.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'      and w.id_usrio = :F_ID_USRIO;',
'',
'  if v_estado = 3 then ',
'    return true; ',
'    else ',
'    return false; ',
'  end if ;',
'',
'exception',
'        when others then ',
'        null; ',
'    ',
'end;'))
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
 p_id=>wwv_flow_api.id(85899589004008062)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>85899589004008062
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8182575684699634)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'L'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8229781095364302)
,p_db_column_name=>'C001'
,p_display_order=>20
,p_column_identifier=>'M'
,p_column_label=>'C001'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8229811836364303)
,p_db_column_name=>'C002'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>'C002'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8229982723364304)
,p_db_column_name=>'C003'
,p_display_order=>40
,p_column_identifier=>'O'
,p_column_label=>'C003'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8230095738364305)
,p_db_column_name=>'C004'
,p_display_order=>50
,p_column_identifier=>'P'
,p_column_label=>'Nombre_Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8230149496364306)
,p_db_column_name=>'D001'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>unistr('Fecha Registr\00F3')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8230263496364307)
,p_db_column_name=>'ELMNAR'
,p_display_order=>70
,p_column_identifier=>'R'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:42:&SESSION.:eliminar:&DEBUG.:RP:P42_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'#ELMNAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(85907164769210756)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'81829'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'C004:D001:ELMNAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86576773093499459)
,p_plug_name=>'Items'
,p_parent_plug_id=>wwv_flow_api.id(85890545614770460)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_adjntos_vhclo',
'     , file_name',
'     , fcha',
'  --   , file_blob',
'     , 1 DESCARGAR',
'  from gi_g_adjuntos_vehiculo',
' where id_sjto_impsto = :P42_SJTO_IMPSTO;',
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
 p_id=>wwv_flow_api.id(86576911887499460)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>86576911887499460
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8762989117776001)
,p_db_column_name=>'ID_ADJNTOS_VHCLO'
,p_display_order=>10
,p_column_identifier=>'N'
,p_column_label=>'Id Adjntos Vhclo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8763022282776002)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>20
,p_column_identifier=>'O'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8763138707776003)
,p_db_column_name=>'FCHA'
,p_display_order=>30
,p_column_identifier=>'P'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8763200239776004)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>40
,p_column_identifier=>'Q'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_G_ADJUNTOS_VEHICULO:FILE_BLOB:ID_ADJNTOS_VHCLO::::::attachment:<span class="fa fa-cloud-download" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(86583119008504804)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'81888'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:FCHA:DESCARGAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86204080762736059)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'    <p align="justify">Funcionalidad de Solicitud de Novedad.<br> <br>',
unistr('    <center><b> Paso 2 Observaci\00F3nes y Adjunto.</b> </center><br>'),
unistr('    <b> 1</b> Se debe singresar una observaci\00F3n de la novedad.<br> <br>'),
'    <b> 2</b> Agregar los documentos que soportan las solicitud de novedad<br>',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8178206510699624)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(85890545614770460)
,p_button_name=>'BTN_NUEVO_ADJUNTO'
,p_button_static_id=>'BTN_NUEVO_ADJUNTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Adjunto'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_estado1 number;',
'begin',
'   select w.id_estdo_trnscion',
'     into v_estado1',
'     from wf_g_instancias_transicion w',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and w.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'      and w.id_usrio = :F_ID_USRIO;',
'',
'  if v_estado1 = 3 then ',
'    return false; ',
'    else ',
'    return true; ',
'  end if ;',
'',
'exception',
'        when others then ',
'        null; ',
'    ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8130113551222303)
,p_name=>'P42_CDGO_CLNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8130262974222304)
,p_name=>'P42_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8130396493222305)
,p_name=>'P42_ID_IMPSTO_SBIMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8178667258699625)
,p_name=>'P42_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_prompt=>unistr('Observaci\00F3n Novedad')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>1000
,p_cHeight=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_estado number;',
'begin',
'   select w.id_estdo_trnscion',
'     into v_estado',
'     from wf_g_instancias_transicion w',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and w.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'      and w.id_usrio = :F_ID_USRIO;',
'',
'  if v_estado = 3 then ',
'    return true; ',
'    else ',
'    return false; ',
'  end if ;',
'',
'exception',
'        when others then ',
'        null; ',
'    ',
'end;'))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8183794081699635)
,p_name=>'P42_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(85899362160008060)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8208117958938826)
,p_name=>'P42_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8208479462945579)
,p_name=>'P42_TIPO_ARCHIVO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_prompt=>'Tipo Archivo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   dscrpcion_adjnto_tpo,',
'         id_sbmpto_adjnto_tpo',
'from     gi_d_subimpuestos_adjnto_tp    a     ',
'where    a.id_impsto_sbmpsto = :P42_ID_IMPSTO_SBIMPSTO',
'and      a.id_sbmpto_adjnto_tpo = 81',
'and      a.actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8209331429983279)
,p_name=>'P42_TMNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8209776417992130)
,p_name=>'P42_ARCVHO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8228190147314407)
,p_name=>'P42_ADJUNTO_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8253162653596801)
,p_name=>'P42_CDGO_NVDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8259000400664101)
,p_name=>'P42_SJTO_IMPSTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8640434081725101)
,p_name=>'P42_DATOS_OBSERVACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_prompt=>'Datos Observacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select gh.obsrvcion  from  si_g_novedades_vehiculo gh ',
' where gh.cdgo_clnte        = :P42_CDGO_CLNTE   and ',
'       gh.id_impsto         = :P42_ID_IMPSTO and ',
'       gh.id_impsto_sbmpsto = :P42_ID_IMPSTO_SBIMPSTO and ',
'       gh.id_instncia_fljo  = :F_ID_INSTNCIA_FLJO;'))
,p_display_when_type=>'EXISTS'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_estado number;',
'begin',
'   select w.id_estdo_trnscion',
'     into v_estado',
'     from wf_g_instancias_transicion w',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and w.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'      and w.id_usrio = :F_ID_USRIO;',
'',
'  if v_estado = 3 then ',
'    return true; ',
'    else ',
'    return false; ',
'  end if ;',
'',
'exception',
'        when others then ',
'        null; ',
'    ',
'end;'))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23786257080454401)
,p_name=>'P42_FECHA_NOVEDAD'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(85890545614770460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8196498252750975)
,p_computation_sequence=>50
,p_computation_item=>'P42_CDGO_CLNTE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_CDGO_CLNTE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8196718060751937)
,p_computation_sequence=>50
,p_computation_item=>'P42_ID_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_impsto',
'      from df_c_impuestos',
'     where cdgo_clnte  = :F_CDGO_CLNTE',
'       and cdgo_impsto = ''VHL'';'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8197031519752920)
,p_computation_sequence=>50
,p_computation_item=>'P42_ID_IMPSTO_SBIMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P42_ID_IMPSTO'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8680621525002301)
,p_validation_name=>'validacion_Observacion'
,p_validation_sequence=>20
,p_validation=>'P42_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Debe ser ingresado.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8291616652119201)
,p_validation_name=>'Validacion_adjunto_archivo'
,p_validation_sequence=>30
,p_validation=>'P42_ARCVHO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# Debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(8178206510699624)
,p_associated_item=>wwv_flow_api.id(8209776417992130)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8191146059699654)
,p_name=>'Inactivar botones cuado la novedad este registrada'
,p_event_sequence=>10
,p_condition_element=>'P28_ID_NVDAD_PRSNA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8191607346699654)
,p_event_id=>wwv_flow_api.id(8191146059699654)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(8178206510699624)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8209947557998704)
,p_name=>'Setea_Archivo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_ARCVHO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8211361370998717)
,p_event_id=>wwv_flow_api.id(8209947557998704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TIPO_ARCHIVO,P42_TMNO,P42_ADJUNTO_TPO'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function Restringir_Archivo_Tipo($this) { ',
'',
'    var file = $this.triggeringElement.files[0];',
'',
'        if (file !== undefined ) {',
'             vTipo = new String( file.type );',
'             vTamano = new String( file.size );',
'             apex.item(''P42_ADJUNTO_TPO'').setValue(vTipo);',
'             apex.item(''P42_TMNO'').setValue(vTamano);',
'        }',
' }',
'',
'Restringir_Archivo_Tipo(this);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8210827995998717)
,p_event_id=>wwv_flow_api.id(8209947557998704)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_archvo_tpo         varchar2(100);',
'    v_archivo_tamano     number;',
'    v_tamano             number;',
'    v_espacial          varchar2(100); ',
'begin ',
'     ',
'        select upper(substr(:P42_ADJUNTO_TPO,instr(:P42_ADJUNTO_TPO,''/'') + 1, length(:P42_ADJUNTO_TPO)))  into v_espacial from dual; ',
'           insert into muerto(v_001) values(''Verificando archivo adjunto ''||:P42_ID_IMPSTO_SBIMPSTO||''-''||:P42_TIPO_ARCHIVO||''-''||v_espacial ); commit;',
'    select   b.extncion, ',
'             b.tmno_mxmo ',
'    into     v_archvo_tpo, ',
'             v_archivo_tamano',
'    from     gi_d_subimpuestos_adjnto_tp a',
'    join     v_gi_d_sbmpsts_adjnto_tp_frmt    b on a.id_sbmpto_adjnto_tpo = b.id_sbmpto_adjnto_tpo',
'    where    a.id_impsto_sbmpsto               = :P42_ID_IMPSTO_SBIMPSTO',
'          and  a.id_sbmpto_adjnto_tpo          = :P42_TIPO_ARCHIVO',
'          and  b.extncion              =  v_espacial           ',
'          and  a.actvo = ''S'';',
'        ',
'    /*    insert into muerto(v_001) values(''Verificando archivo adjunto ''||v_archivo_tamano||''-''||v_tamano||''-''||v_espacial); ',
'        commit;*/',
'       v_tamano :=  to_number(:P42_TMNO/1024/1024);',
'                ',
'         insert into muerto(v_001) values(''Verificando archivo adjunto ''||v_archivo_tamano||''-''||v_tamano||''-''||:P42_ADJUNTO_TPO); commit;',
'        if v_archivo_tamano < v_tamano then ',
'           apex_util.set_session_state(''P42_RSPSTA'',''MAYOR'');',
'        else',
'             apex_util.set_session_state(''P42_RSPSTA'',''ENCONTRO'');',
'        end if;',
'        ',
' exception',
'     when others then ',
'         apex_util.set_session_state(''P42_RSPSTA'',''NO_ENCONTRO'');',
'        ',
'end;'))
,p_attribute_02=>'P42_RSPSTA,P42_TMNO,P42_TIPO_ARCHIVO,P42_ADJUNTO_TPO'
,p_attribute_03=>'P42_RSPSTA,P42_TMNO,P42_TIPO_ARCHIVO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8210364489998713)
,p_event_id=>wwv_flow_api.id(8209947557998704)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P42_RSPSTA'') == ''ENCONTRO'' ){',
'    console.log(''Entrando al IF encontro: '' + $v(''P42_RSPSTA'') );',
'    // tipo de archivo valido',
'   apex.item(''BTN_NUEVO_ADJUNTO'').enable();',
'',
'}',
'',
'else if  ($v(''P42_RSPSTA'') == ''MAYOR''){',
'    console.log(''Entrando al IF MAYOR: '' + $v(''P42_RSPSTA'') );',
unistr('    // Archivo con tama\00F1o superior al permitido'),
'    apex.item(''BTN_NUEVO_ADJUNTO'').disable();',
'    Swal.fire({',
'    ',
unistr('        title:''<H2 >Validaci\00F3n</H2>'','),
unistr('        html: ''<H4>El Tama\00F1o del archivo supera lo permitido</H4>''        '),
'    });',
' }',
'',
'else if  ($v(''P42_RSPSTA'') == ''NO_ENCONTRO'' ){',
'    console.log(''Entrando al IF NO_ENCONTRO: '' + $v(''P45_RSPSTA'') );',
'    // No existe el tipo de archivo',
'    apex.item(''BTN_NUEVO_ADJUNTO'').disable();',
'    Swal.fire({',
'        ',
unistr('        title:  ''<H2 >Validaci\00F3n</H2>'','),
'        html: ''<H4>El Tipo de archivo no es permitido</H4>''        ',
'    });',
'  }',
'  '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8617775565262501)
,p_name=>'Setea_Observacion_novedad'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_OBSRVCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8617801319262502)
,p_event_id=>wwv_flow_api.id(8617775565262501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_cdgo_rspsta  number;',
'   v_mnsje_rspsta varchar2(200);',
'   v_observacion  varchar2(1000);',
'',
'begin',
'   --Creamos la coleccion',
'   apex_collection.create_or_truncate_collection(p_collection_name => ''OBSERVACION_NOVEDAD'');',
'',
'  ',
'      --Adicionamos el registro en la coleccion',
'      apex_collection.add_member(p_collection_name => ''OBSERVACION_NOVEDAD'',',
'                                 p_n001            => :F_ID_INSTNCIA_FLJO,',
'                                 p_c001            => :P42_OBSRVCION);',
'',
'',
'  ',
'end;'))
,p_attribute_02=>'P42_OBSRVCION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8190498949699643)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''ARCHIVOS_VEHICULO_NOV'',',
'        p_seq => :P42_SEQ_ID);',
'        ',
'      delete',
'       from apex_application_temp_files;',
'       commit; ',
'end; '))
,p_process_error_message=>'Error al Eliminar el Adjunto'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'eliminar'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Adjunto Eliminado'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8610677317145601)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar Observacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_cdgo_rspsta  number;',
'   v_mnsje_rspsta varchar2(200);',
'',
'begin',
'   --Creamos la coleccion',
'   apex_collection.create_or_truncate_collection(p_collection_name => ''OBSERVACION_NOVEDAD'');',
'',
'  ',
'      --Adicionamos el registro en la coleccion',
'      apex_collection.add_member(p_collection_name => ''OBSERVACION_NOVEDAD'',',
'                                 p_n001            => :F_ID_INSTNCIA_FLJO,',
'                                 p_c001            => :P42_OBSRVCION);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P42_OBSRVCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8625236113353801)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Listar_Observacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin                                                ',
'  select  c001',
'    into :P42_OBSRVCION',
'    from APEX_collections r',
'    where collection_name = ''OBSERVACION_NOVEDAD'' and n001 = :F_ID_INSTNCIA_FLJO;',
'  exception ',
'     when others then ',
'      null; ',
'end ; ',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  c001',
'            from APEX_collections r',
'            where collection_name = ''OBSERVACION_NOVEDAD'';'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8640509637725102)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Datos Observacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  begin ',
' select gh.obsrvcion  into :P42_DATOS_OBSERVACION from  si_g_novedades_vehiculo gh ',
' where gh.cdgo_clnte        = :P42_CDGO_CLNTE   and ',
'       gh.id_impsto         = :P42_ID_IMPSTO and ',
'       gh.id_impsto_sbmpsto = :P42_ID_IMPSTO_SBIMPSTO and ',
'       gh.id_instncia_fljo  =  :F_ID_INSTNCIA_FLJO;',
'   exception',
'    when others then ',
'     null; ',
'   end ; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select  c001',
'',
'    from APEX_collections r',
'    where collection_name = ''OBSERVACION_NOVEDAD'' and n001 = :F_ID_INSTNCIA_FLJO;'))
,p_process_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8190818992699653)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Proceso Workflow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8190080009699643)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_cdgo_rspsta  number;',
'   v_mnsje_rspsta varchar2(200);',
'',
'begin',
'   --Creamos la coleccion',
'   apex_collection.create_or_truncate_collection(p_collection_name => ''ARCHIVOS_VEHICULO_NOV'');',
'     ',
'   --Recorremos los archivos y guardamos en la temporal',
'   for c_archivo in (select * from apex_application_temp_files where application_id = :APP_ID) loop',
'      --Adicionamos el registro en la coleccion',
'      apex_collection.add_member(p_collection_name => ''ARCHIVOS_VEHICULO_NOV'',',
'                                 p_n001            => :F_ID_INSTNCIA_FLJO,',
'                                 p_c001            => c_archivo.name,',
'                                 p_c002            => c_archivo.filename,',
'                                 p_c003            => c_archivo.mime_type,',
'                                 p_c004            => substr(c_archivo.filename, 1, instr(c_archivo.filename, ''.'') - 1),',
'                                 p_d001            => c_archivo.created_on,',
'                                 p_blob001         => c_archivo.blob_content);',
'   ',
'   end loop;',
'',
'end;',
'',
'',
'',
''))
,p_process_error_message=>'Error'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8178206510699624)
,p_process_success_message=>'Adjunto agregado Exitosamente'
);
end;
/
