prompt --application/pages/page_00218
begin
wwv_flow_api.create_page(
 p_id=>218
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Consulta Oficios de Plusval\00EDa')
,p_step_title=>unistr('Consulta Oficios de Plusval\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20220614121141'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217315742412451310)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
unistr('	Funcionalidad que permite realizar consultas de los oficios generadas a las plusval\00EDas de acuerdo con los par\00E1metros de b\00FAsqueda seleccionados. '),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(284827345520919238)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(285663972217766576)
,p_plug_name=>'Oficios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.idntfccion_sjto,',
'       a.cnsctvo,',
'       a.fcha,',
'       d.dscrpcion,',
'       b.id_dcmnto,',
'       u.nmbre_trcro',
'  from gn_g_oficios a',
'  join gd_g_documentos b',
'    on a.id_dcmnto = b.id_dcmnto',
'  join v_si_i_sujetos_impuesto c',
'    on c.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_sjto_impsto = c.id_sjto_impsto -- and id_impsto = :P218_ID_IMPSTO',
'  join gn_d_actos_tipo d',
'    on a.id_acto_tpo = d.id_acto_tpo',
'  join v_sg_g_usuarios u',
'    on a.id_usrio = u.id_usrio',
'  join si_i_predios p',
'    on p.id_sjto_impsto = c.id_sjto_impsto',
' where c.idntfccion_sjto = nvl(:P218_IDNTFCCION_SJTO, c.idntfccion_sjto)',
'   and a.cnsctvo = nvl(:P218_CNSCTVO, a.cnsctvo)',
'   and a.id_acto_tpo = nvl(:P218_ID_ACTO_TPO, a.id_acto_tpo)',
'   and a.id_usrio = nvl(:P218_ID_USRIO, a.id_usrio)',
'   and ((trunc(a.fcha) >=',
'       trunc(nvl(to_date(:P218_FCHA_INI, ''dd/mm/yyyy''), a.fcha)) and',
'       trunc(a.fcha) <=',
'       trunc(nvl(to_date(:P218_FCHA_FIN, ''dd/mm/yyyy''), a.fcha))) or',
'       (trunc(a.fcha) >= to_date(:P218_FCHA_INI, ''dd/mm/yyyy'') and',
'       to_date(:P218_FCHA_FIN, ''dd/mm/yyyy'') is null) or',
'       (trunc(a.fcha) <= to_date(:P218_FCHA_FIN, ''dd/mm/yyyy'') and',
'       to_date(:P218_FCHA_INI, ''dd/mm/yyyy'') is null))',
' order by c.idntfccion_sjto',
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
 p_id=>wwv_flow_api.id(225802181324534955)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se encontraron plusvalias con oficios registrados con los par\00E1metros de consulta ingresados')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>225802181324534955
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23766712911895101)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>10
,p_column_identifier=>'R'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23766841255895102)
,p_db_column_name=>'CNSCTVO'
,p_display_order=>20
,p_column_identifier=>'S'
,p_column_label=>'Consecutivo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23766901832895103)
,p_db_column_name=>'FCHA'
,p_display_order=>30
,p_column_identifier=>'T'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23767568795895109)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>60
,p_column_identifier=>'X'
,p_column_label=>'Tipo Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23767605738895110)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>70
,p_column_identifier=>'Y'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23767147869895105)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>80
,p_column_identifier=>'V'
,p_column_label=>'Ver Oficio'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:gd_g_documentos,ID_DCMNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,#ID_DCMNTO#'
,p_column_linktext=>'<center><span class="fa fa-eye fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(227058577331950458)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1883969'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'IDNTFCCION_SJTO:CNSCTVO:FCHA:DSCRPCION:NMBRE_TRCRO:ID_DCMNTO:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188385905625529038)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(284827345520919238)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23767997816895113)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(284827345520919238)
,p_button_name=>'BTN_RESTABLECER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Restablecer'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>12
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23767334927895107)
,p_name=>'P218_ID_ACTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(284827345520919238)
,p_prompt=>'<b>Tipo Acto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, id_acto_tpo r ',
'from gn_d_actos_tipo',
'where id_acto_tpo in ( select  id_acto_tpo',
'                        from    gn_d_plantillas a',
'                        join    gn_d_reportes   b on a.id_rprte = b.id_rprte',
'                        where   b.cdgo_rprte_grpo in (''OPP'',''OFS'',''OFP'',''ONA'')',
'                        and     b.actvo           = ''S'')'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un Usuario -- '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23767448502895108)
,p_name=>'P218_FCHA_FIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(284827345520919238)
,p_prompt=>'<b>Fecha Final</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_06=>'2'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188386390251529039)
,p_name=>'P218_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(284827345520919238)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto d, id_impsto r',
'from   df_c_impuestos',
'where  cdgo_impsto = ''PLU'''))
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188386727787529049)
,p_name=>'P218_IDNTFCCION_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(284827345520919238)
,p_prompt=>'<b>Referencia Catastral</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>60
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188387590545529050)
,p_name=>'P218_CNSCTVO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(284827345520919238)
,p_prompt=>'<b>Consecutivo</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188388765372529051)
,p_name=>'P218_FCHA_INI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(284827345520919238)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_06=>'2'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188389146974529051)
,p_name=>'P218_ID_USRIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(284827345520919238)
,p_prompt=>'<b>Usuario</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_trcro,',
'        id_usrio',
'  from v_sg_g_usuarios',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and actvo = ''S''',
'   and id_usrio in ( select distinct id_usrio from gn_g_oficios )',
'order by nmbre_trcro'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un Usuario -- '
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23768078691895114)
,p_name=>'Limpiar Parametros de busqueda'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23767997816895113)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23768149268895115)
,p_event_id=>wwv_flow_api.id(23768078691895114)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P218_IDNTFCCION_SJTO,P218_CNSCTVO,P218_ID_ACTO_TPO,P218_ID_USRIO,P218_FCHA_INI,P218_FCHA_FIN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23767864863895112)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto into :P218_ID_IMPSTO',
'from   df_c_impuestos',
'where  cdgo_impsto = ''PLU'''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
