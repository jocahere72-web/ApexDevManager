prompt --application/pages/page_00070
begin
wwv_flow_api.create_page(
 p_id=>70
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Garant\00EDas')
,p_step_title=>unistr('Garant\00EDas')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210826103709'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43969121942358333)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(88827215915750776)
,p_plug_name=>'Garantias'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(73655524996021574)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88827300136750776)
,p_plug_name=>'Garantias'
,p_parent_plug_id=>wwv_flow_api.id(88827215915750776)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
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
 p_id=>wwv_flow_api.id(45396660022476316)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:76:&SESSION.::&DEBUG.:RP:P76_ID_SECUENCIA_COLECCION:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>45396660022476316
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46302953613452814)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46303232814452817)
,p_db_column_name=>'FILENAME'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46303301601452818)
,p_db_column_name=>'MIMETYPE'
,p_display_order=>50
,p_column_identifier=>'M'
,p_column_label=>'Documento Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46303900297452824)
,p_db_column_name=>'BLOB'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>'Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46305402957452839)
,p_db_column_name=>'DESCRIP'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46305862073452843)
,p_db_column_name=>'TIPO_GARANTIA'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>unistr('Tipo Garant\00EDa')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46305953807452844)
,p_db_column_name=>'TIPO'
,p_display_order=>90
,p_column_identifier=>'S'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(45431835877226176)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'454319'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIP:MIMETYPE:'
,p_break_on=>'TIPO:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:TIPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90042345581065272)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(46039597511876284)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(43969121942358333)
,p_button_name=>'BTN_NUEVO_GRNTIA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Garant\00EDa')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:76:&SESSION.::&DEBUG.:RP,76:P76_ID_SECUENCIA_COLECCION:'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42346470000115433)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(88827215915750776)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:&P69_BRANCH.:&SESSION.::&DEBUG.:RP,41,42,43,44,47,70::'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46210466089647184)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(88827215915750776)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45370029529684489)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(88827215915750776)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(45373633697684506)
,p_branch_name=>unistr('Ir a P\00E1gina 73 - Extracto')
,p_branch_action=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(45370029529684489)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50982611670826216)
,p_branch_name=>unistr('Ir a la P\00E1gina 84 - Resumen')
,p_branch_action=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,72:P84_ID_CNVNIO:&P70_ID_CNVNIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(46210466089647184)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46305662144452841)
,p_name=>'P70_ID_SECUENCIA_COLECCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(88827300136750776)
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
 p_id=>wwv_flow_api.id(89420033036082106)
,p_name=>'P70_ID_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(88827300136750776)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90177766225535824)
,p_name=>'P70_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(88827215915750776)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90177874202535825)
,p_name=>'P70_TIPO_GARANTIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(88827215915750776)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90177969896535826)
,p_name=>'P70_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(88827215915750776)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90178096619535827)
,p_name=>'P70_FILENAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(88827215915750776)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90799817989906107)
,p_name=>'P70_BRANCH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(88827215915750776)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(50985532845826245)
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
,p_when_button_pressed=>wwv_flow_api.id(46210466089647184)
,p_associated_item=>wwv_flow_api.id(46305662144452841)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90799998732906108)
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
'                        where id_cnvnio = :P69_ID_CNVNIO',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46304607014452831)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Borrar Colecci\00F3n Agregar Garantia')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     if apex_collection.collection_exists(''ADJUNTAR_GARANTIA'') then',
'         APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''ADJUNTAR_GARANTIA'');',
unistr('         insert into gti_aux (col1, col2) values (1, ''Se borra la colecci\00F3n ADJUNTAR_GARANTIA'');commit;'),
'    end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
