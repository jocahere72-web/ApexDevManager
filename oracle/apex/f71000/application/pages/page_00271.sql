prompt --application/pages/page_00271
begin
wwv_flow_api.create_page(
 p_id=>271
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Consulta de registro saldos a favor'
,p_step_title=>'Saldos a Favor'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'1066746000'
,p_last_upd_yyyymmddhh24miss=>'20250225153015'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(60520122418994401)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(60520202041994402)
,p_plug_name=>'Saldos a Favor'
,p_parent_plug_id=>wwv_flow_api.id(60520122418994401)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sjto_impsto,',
'       a.idntfccion_sjto,',
'       b.id_sldo_fvor,',
'       b.id_orgen,',
'       b.sldo_fvor_dspnble,',
unistr('       decode(b.indcdor_rcncdo, ''S'', ''S\00ED'', ''No'') as indcdor_rcncdo,'),
unistr('       decode(b.indcdor_rgstro, ''A'', ''Autom\00E1tico'', ''Manual'') as indcdor_rgstro,'),
'       b.nmbre_sldo_fvor_tpo,',
'       trunc(b.fcha_rgstro) as fcha_rgstro,',
'       b.obsrvcion,',
'       decode(dbms_lob.getlength( c.file_blob ) , 0 , null , dbms_lob.getlength( c.file_blob )) as dscrgar,',
'       c.id_sldo_fvor_sprte ,',
'       c.file_blob ,',
'       c.file_name ,',
'       c.file_mimetype',
'from v_si_i_sujetos_impuesto    a',
'join v_gf_g_saldos_favor        b  on  a.id_sjto_impsto    =   b.id_sjto_impsto',
'left join gf_g_saldos_favor_soporte  c  on  c.id_sldo_fvor      =   b.id_sldo_fvor ',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and b.sldo_fvor_dspnble > 0',
'and trim(a.idntfccion_sjto) = nvl(:P271_IDNTFCCION_RSPNSBLE,  trim(a.idntfccion_sjto))',
'and trunc(b.fcha_rgstro) between nvl(:P271_FCHA_INCIO, trunc(b.fcha_rgstro)) and nvl(:P271_FCHA_FIN, trunc(b.fcha_rgstro))',
'order by trunc(b.fcha_rgstro) desc;'))
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
 p_id=>wwv_flow_api.id(60521267538994412)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>60521267538994412
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60521315854994413)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6792627001263207)
,p_db_column_name=>'ID_SLDO_FVOR_SPRTE'
,p_display_order=>10
,p_column_identifier=>'N'
,p_column_label=>'Id Sldo Fvor Sprte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6792726834263208)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>30
,p_column_identifier=>'O'
,p_column_label=>'File Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60521675814994416)
,p_db_column_name=>'ID_SLDO_FVOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Sldo Fvor'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6792854210263209)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>40
,p_column_identifier=>'P'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6792940563263210)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>50
,p_column_identifier=>'Q'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60521728468994417)
,p_db_column_name=>'SLDO_FVOR_DSPNBLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Saldo a Favor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60521852905994418)
,p_db_column_name=>'INDCDOR_RCNCDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Reconocido'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6792593778263206)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>'Descargar'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GF_G_SALDOS_FAVOR_SOPORTE:FILE_BLOB:ID_SLDO_FVOR_SPRTE::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-download" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60521977054994419)
,p_db_column_name=>'INDCDOR_RGSTRO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Registro'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60523116147994431)
,p_db_column_name=>'ID_ORGEN'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('N\00FAmero de Recaudo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63445212060372014)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63445936764372021)
,p_db_column_name=>'NMBRE_SLDO_FVOR_TPO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Tipo de Saldo a Favor'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63446045978372022)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(45241092886724001)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(60554919270224648)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'605550'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IDNTFCCION_SJTO:SLDO_FVOR_DSPNBLE:ID_ORGEN:INDCDOR_RCNCDO:INDCDOR_RGSTRO:FCHA_RGSTRO:NMBRE_SLDO_FVOR_TPO::OBSRVCION:DSCRGAR:ID_SLDO_FVOR_SPRTE:FILE_BLOB:FILE_NAME:FILE_MIMETYPE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(182393027574176827)
,p_plug_name=>unistr('Par\00E1metro de b\00FAsquedas')
,p_parent_plug_id=>wwv_flow_api.id(60520122418994401)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(308859067894800166)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
unistr('Opci\00F3n que permite: <br><br>'),
'',
'<i>',
'Visualizar los Saldo a Favor que tienen los Sujetos Impuestos .<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63602134926151227)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(182393027574176827)
,p_button_name=>'Btn_Consulta'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consulta'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63445031686372012)
,p_name=>'P271_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(182393027574176827)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63604168959151245)
,p_name=>'P271_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(182393027574176827)
,p_prompt=>'Fecha Inicio:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63604577673151245)
,p_name=>'P271_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(182393027574176827)
,p_prompt=>'Fecha Fin:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P271_FCHA_INCIO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63445375239372015)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P271_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63445488904372016)
,p_event_id=>wwv_flow_api.id(63445375239372015)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P271_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P271_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63445502496372017)
,p_name=>'Limpia fecha inicio'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P271_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63445687272372018)
,p_event_id=>wwv_flow_api.id(63445502496372017)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P271_FCHA_INCIO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63445752332372019)
,p_name=>'Limpia fecha fin'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P271_FCHA_FIN'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63445880432372020)
,p_event_id=>wwv_flow_api.id(63445752332372019)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P271_FCHA_FIN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
