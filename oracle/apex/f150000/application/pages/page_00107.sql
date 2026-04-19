prompt --application/pages/page_00107
begin
wwv_flow_api.create_page(
 p_id=>107
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Garant\00EDas - Solicitud de Acuerdo de Pago')
,p_step_title=>unistr('Garant\00EDas - Solicitud de Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200521163404'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116633682162442971)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(161491776135835414)
,p_plug_name=>'Garantias'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall:t-Form--xlarge'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(72235324874226079)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161491860356835414)
,p_plug_name=>'Garantias'
,p_parent_plug_id=>wwv_flow_api.id(161491776135835414)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.seq_id, ',
'       a.n001 tipo_garantia, ',
'       b.DSCRPCION Tipo,',
'       a.c001 descrip, ',
'       a.c002 filename,  ',
'       SUBSTR(a.c003, INSTR(a.c003, ''/'')+1) mimetype,',
'       a.blob001 blob',
'  from apex_collections a',
'  join GF_D_GARANTIAS_TIPO b on a.n001 = b.ID_GRNTIA_TPO',
'  where collection_name = ''ADJUNTAR_GARANTIA''',
'   and a.c004 = ''ACTIVA''',
' order by seq_id'))
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
 p_id=>wwv_flow_api.id(118061220242560954)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:RP,108:P108_ID_SECUENCIA_COLECCION:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>118061220242560954
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72669296173084779)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72669545226084810)
,p_db_column_name=>'FILENAME'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72669986668084811)
,p_db_column_name=>'MIMETYPE'
,p_display_order=>50
,p_column_identifier=>'M'
,p_column_label=>'Documento Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72670326647084811)
,p_db_column_name=>'BLOB'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>'Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72670756326084812)
,p_db_column_name=>'DESCRIP'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72671165049084812)
,p_db_column_name=>'TIPO_GARANTIA'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>unistr('Tipo Garant\00EDa')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72671597366084812)
,p_db_column_name=>'TIPO'
,p_display_order=>90
,p_column_identifier=>'S'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(118096396097310814)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'726719'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIP:MIMETYPE:'
,p_break_on=>'TIPO:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:TIPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(162706905801149910)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
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
'    <p align="justify">Funcionalidad de Solicitud de Acuerdo de Pago.<br><br> ',
unistr('        Muestra el tipo de garant\00EDa para respaldar el acuerdo de pago.</p>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72665189197084676)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(116633682162442971)
,p_button_name=>'BTN_NUEVO_GRNTIA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Garant\00EDa')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:RP,108:P108_ID_SECUENCIA_COLECCION:&P107_SEQ_ID.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(158216624079733932)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72665713409084688)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(161491776135835414)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCEL'')'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72666192456084690)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(161491776135835414)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72666509039084691)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(161491776135835414)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72674679327084961)
,p_branch_name=>unistr('Ir a P\00E1gina 105 - Plan de Pago')
,p_branch_action=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72666509039084691)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72675066144084962)
,p_branch_name=>unistr('Ir a la P\00E1gina 109 - Resumen')
,p_branch_action=>'f?p=&APP_ID.:109:&SESSION.::&DEBUG.:RP:P109_ID_CNVNIO:&P107_ID_CNVNIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72666192456084690)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70820677698843727)
,p_branch_name=>'Ir a Inicio 301'
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,104,105,106,107,108,109::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72665713409084688)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72666970217084692)
,p_name=>'P107_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(161491776135835414)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72667302527084703)
,p_name=>'P107_TIPO_GARANTIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(161491776135835414)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72667725849084728)
,p_name=>'P107_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(161491776135835414)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72668127110084728)
,p_name=>'P107_FILENAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(161491776135835414)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72668504852084729)
,p_name=>'P107_BRANCH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(161491776135835414)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72672391760084833)
,p_name=>'P107_ID_SECUENCIA_COLECCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(161491860356835414)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id',
'       ',
'  from apex_collections ',
'  where collection_name = ''ADJUNTAR_GARANTIA'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72672716871084833)
,p_name=>'P107_ID_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(161491860356835414)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72673557858084934)
,p_validation_name=>'Tenga Garantia'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_nmro_grntia    number; ',
'begin ',
'v_nmro_grntia := 0;',
'     begin',
'         select count (seq_id) ',
'           into v_nmro_grntia',
'           from apex_collections ',
'          where collection_name = ''ADJUNTAR_GARANTIA''',
'            and c004 = ''ACTIVA'';   ',
'          ',
'     exception  ',
'         when no_data_found then ',
'             v_nmro_grntia := 0;',
'     end;',
'    ',
'    if v_nmro_grntia  > 0 then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe ingresar una Garantia'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(72666192456084690)
,p_associated_item=>wwv_flow_api.id(72672391760084833)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72674122643084956)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Conuslta de Garantias'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'begin',
'     if not apex_collection.collection_exists(''ADJUNTAR_GARANTIA'') then',
'        apex_Collection.Create_Collection( p_collection_name => ''ADJUNTAR_GARANTIA'');',
'    ',
'    end if;   ',
'    for c_garantia in (select * ',
'                         from v_gf_g_cnvnios_grntia_adjnto a',
'                        where id_cnvnio = :P105_ID_CNVNIO',
'                         and a.id_cnvnio_grntia_adjnto not in (select m.n002 from apex_collections m where m.collection_name = ''ADJUNTAR_GARANTIA'')) loop',
'        apex_collection.add_member( p_collection_name => ''ADJUNTAR_GARANTIA'',',
'                                     p_n001            => c_garantia.id_grntia_tpo,',
'                                     p_n002            => c_garantia.id_cnvnio_grntia_adjnto,',
'                                     p_c001            => c_garantia.dscrpcion ,',
'                                     p_c004            => ''ACTIVA'',',
'                                     p_c002            => c_garantia.file_mimetype,',
'                                     p_c003            => c_garantia.file_name,',
'                                     p_blob001         => c_garantia.file_blob );     ',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
