prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Documentos Desconocidos'
,p_step_title=>'Documentos Desconocidos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20220927092336'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(129621487658838701)
,p_plug_name=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(129621503726838702)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(129621487658838701)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--DOCUMENTOS--',
'select a.idntfccion_sjto,',
'       a.nmro_dcmnto,',
'       trunc(a.fcha_dcmnto) fcha_dcmnto,',
'       a.nmbre_impsto_sbmpsto,',
'       a.vlor_ttal_dcmnto,',
'       case',
'         when a.indcdor_pgo_aplcdo = ''S'' then',
'          ''APLICADO''',
'         when a.indcdor_pgo_aplcdo = ''N'' then',
'          ''NO APLICADO''',
'       end as ESTADO',
'  from v_re_g_documentos a',
' where (a.nmro_dcmnto = :P9999_DCMNTOS or :P9999_DCMNTOS is null)',
'   and (a.vlor_ttal_dcmnto = :P9999_VLOR_DCMNTO or',
'       :P9999_VLOR_DCMNTO is null)',
'   and (:P9999_FCHA_DSDE is null or',
'       trunc(a.fcha_dcmnto) >=',
'       trunc(to_date(:P9999_FCHA_DSDE, ''DD/MM/YYYY'')))',
'   and (:P9999_FCHA_HSTA is null or',
'       trunc(a.fcha_dcmnto) <=',
'       trunc(to_date(:P9999_FCHA_HSTA, ''DD/MM/YYYY'')));'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P9999_DCMNTOS is not null or',
':P9999_VLOR_DCMNTO  is not null or  ',
':P9999_FCHA_DSDE  is not null or  ',
':P9999_FCHA_HSTA  is not null)'))
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
 p_id=>wwv_flow_api.id(85166540237979631)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JLUJAN'
,p_internal_uid=>85166540237979631
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85166685767979632)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85166797111979633)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85166889661979634)
,p_db_column_name=>'FCHA_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85167204317979638)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'G'
,p_column_label=>'Vlor Ttal Dcmnto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85166954178979635)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85167103407979637)
,p_db_column_name=>'ESTADO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(130444245551265455)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1304443'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO:NMRO_DCMNTO:FCHA_DCMNTO:VLOR_TTAL_DCMNTO:ESTADO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(129622322392838710)
,p_plug_name=>'Declaraciones'
,p_parent_plug_id=>wwv_flow_api.id(129621487658838701)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--DECLARACIONES--',
'select b.idntfccion_sjto,',
'       a.nmro_cnsctvo,',
'       trunc(a.fcha_rgstro) fcha_rgstro,',
'       c.nmbre_impsto_sbmpsto,',
'       a.vlor_ttal,',
'       d.nmbre_rzon_scial,',
'       case',
'         when a.cdgo_dclrcion_estdo = ''APL'' then',
'          ''APLICADO''',
'         when a.cdgo_dclrcion_estdo <> ''APL'' then',
'          ''NO APLICADO''',
'       end as ESTADO',
'  from gi_g_declaraciones a',
'  join v_si_i_sujetos_impuesto b',
'    on a.id_sjto_impsto = b.id_sjto_impsto',
'  join df_i_impuestos_subimpuesto c',
'    on a.id_impsto = c.id_impsto',
'   and a.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'  join si_i_personas d ',
'    on d.id_sjto_impsto = a.id_sjto_impsto',
' where (a.nmro_cnsctvo = :P9999_DCMNTOS or :P9999_DCMNTOS is null)',
'   and (a.vlor_ttal = :P9999_VLOR_DCMNTO or :P9999_VLOR_DCMNTO is null)',
'   and (:P9999_FCHA_DSDE is null or',
'       trunc(a.fcha_rgstro) >=',
'       trunc(to_date(:P9999_FCHA_DSDE, ''DD/MM/YYYY'')))',
'   and (:P9999_FCHA_HSTA is null or',
'       trunc(a.fcha_rgstro) <=',
'       trunc(to_date(:P9999_FCHA_HSTA, ''DD/MM/YYYY'')));'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P9999_DCMNTOS is not null or',
':P9999_VLOR_DCMNTO  is not null or  ',
':P9999_FCHA_DSDE  is not null or  ',
':P9999_FCHA_HSTA  is not null)'))
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
 p_id=>wwv_flow_api.id(85167365315979639)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JLUJAN'
,p_internal_uid=>85167365315979639
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85167476622979640)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85167553615979641)
,p_db_column_name=>'NMRO_CNSCTVO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Consecutivo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85167656623979642)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85167787835979643)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85167806267979644)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85167963676979645)
,p_db_column_name=>'ESTADO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85168077062979646)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Nombre / Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(130452905480289563)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1304530'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO:NMRO_CNSCTVO:FCHA_RGSTRO:VLOR_TTAL:ESTADO::NMBRE_RZON_SCIAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(129623127795838718)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(129623570096838722)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(129623127795838718)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129623284646838719)
,p_name=>'P9999_DCMNTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(129623127795838718)
,p_prompt=>unistr('Documento o Declaraci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129623414865838721)
,p_name=>'P9999_VLOR_DCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(129623127795838718)
,p_prompt=>'Valor Documento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129623662910838723)
,p_name=>'P9999_FCHA_DSDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(129623127795838718)
,p_prompt=>'Fecha Desde'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129623705054838724)
,p_name=>'P9999_FCHA_HSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(129623127795838718)
,p_prompt=>'Fecha Hasta'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(129623872796838725)
,p_name=>'Al cambiar fecha desde'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9999_FCHA_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(129623925662838726)
,p_event_id=>wwv_flow_api.id(129623872796838725)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P9999_FCHA_HSTA").datepicker( ''option'' , ''minDate'' , $("#P9999_FCHA_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(129625176165838738)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpia Cache Sesion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_is_stateful_y_n=>'Y'
);
end;
/
