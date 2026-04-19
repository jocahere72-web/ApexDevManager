prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Informaci\00F3n de Predio (Valorizaci\00F3n)')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Informaci\00F3n Predio ')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'auto'
,p_dialog_width=>'80%'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190218174257'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77162092150554213)
,p_plug_name=>'Tab Predio'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--fillLabels:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81485543492161301)
,p_plug_name=>'<b>Vista de Calle</b>'
,p_parent_plug_id=>wwv_flow_api.id(77162092150554213)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75552175726325828)
,p_plug_name=>'Vista'
,p_parent_plug_id=>wwv_flow_api.id(81485543492161301)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--removeHeader:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<img style="-webkit-user-select: none;" ',
'    src="https://maps.googleapis.com/maps/api/streetview?size=1000x400&amp;location=&P14_LTTUD.,&P14_LNGTUD.&amp;heading=151.78&amp;pitch=-0.76&amp;key=AIzaSyB0YGNvRc2838L0hbJUyBi78tmMyylw9zM" width="auto" height="auto">'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(152940214288828818)
,p_plug_name=>unistr('<b>Georreferenciaci\00F3n</b>')
,p_parent_plug_id=>wwv_flow_api.id(77162092150554213)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.JK64.SIMPLE_GOOGLE_MAP'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'11.0141503,-74.8087745'
,p_attribute_02=>'13'
,p_attribute_03=>'400'
,p_attribute_04=>'P14_LTTUD_LNGTUD'
,p_attribute_05=>'16'
,p_attribute_07=>'N'
,p_attribute_12=>'N'
,p_attribute_17=>'auto'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(380147129975571049)
,p_plug_name=>unistr('<b>Informaci\00F3n del Predio</b>')
,p_parent_plug_id=>wwv_flow_api.id(77162092150554213)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(555809203542405218)
,p_plug_name=>'<b>Responsables</b>'
,p_parent_plug_id=>wwv_flow_api.id(77162092150554213)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.nmbre_rzon_scial,',
'        a.dscrpcion_idntfccion_tpo ,',
'        a.idntfccion_rspnsble ,',
'        case when a.prncpal_s_n = ''S'' then',
'           ''<input type="checkbox" name="prncpal_s_n" disabled="disabled" checked>'' ',
'        else  ',
'           ''<input type="checkbox" name="prncpal_s_n" disabled="disabled">'' ',
'       end as prncpal_s_n',
'  from v_si_i_sujetos_responsable    a',
'  join si_i_sujetos_impuesto         b ',
'    on a.id_sjto_impsto = b.id_sjto_impsto',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_sjto_impsto   in ( ',
'                               select id_sjto_impsto',
'                                 from si_i_predios',
'                                where id_prdio = :P14_ID_PRDIO',
'                             )'))
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
 p_id=>wwv_flow_api.id(556219956071348988)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>556219956071348988
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77294498885842122)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo de Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77294848364842122)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77295274878842123)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Principal ?'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77294004804842102)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Raz\00F3n Social ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(556242351682624490)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'772956'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:IDNTFCCION_RSPNSBLE:PRNCPAL_S_N:NMBRE_RZON_SCIAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75552330785325830)
,p_name=>'P14_URL_STREEVIEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(75552175726325828)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75552571804325832)
,p_name=>'P14_LTTUD_LNGTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(152940214288828818)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select replace(lttud, '','', ''.'') || '','' || replace(lngtud, '','', ''.'') as lat_long',
' from si_i_predios ',
'where id_prdio = :P14_ID_PRDIO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77162198916554214)
,p_name=>'P14_BSE_GRVBLE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Base Gravable'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77162279907554215)
,p_name=>'P14_DSTNCIA'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Distancia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77162447271554217)
,p_name=>'P14_LTTUD'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Latitud'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77162564643554218)
,p_name=>'P14_LNGTUD'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Longitud'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77327872592000952)
,p_name=>'P14_ID_PRDIO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P14_ID_SJTO_IMPSTO is not null then ',
'        select id_prdio into :P14_ID_PRDIO from si_i_predios where id_sjto_impsto = :P14_ID_SJTO_IMPSTO;',
'    end if;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77328297613000954)
,p_name=>'P14_ID_PRDIO_DSTNO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Destino'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77328607447000954)
,p_name=>'P14_CDGO_ESTRTO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Estrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77329098846000955)
,p_name=>'P14_CDGO_DSTNO_IGAC'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Destino IGAC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77329458621000956)
,p_name=>'P14_CDGO_PRDIO_CLSFCCION'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>unistr('Clasificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77329825419000956)
,p_name=>'P14_ID_PRDIO_USO_SLO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Uso del Suelo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77330253972000956)
,p_name=>'P14_MTRCLA_INMBLRIA'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>unistr('Matr\00EDcula Inmobiliaria ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77330613914000957)
,p_name=>'P14_AVLUO_CTSTRAL'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>unistr('Aval\00FAo Catastral')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77331009909000957)
,p_name=>'P14_AVLUO_CMRCIAL'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>unistr('Aval\00FAo Comercial')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77331475227000958)
,p_name=>'P14_AREA_TRRNO'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>unistr('\00C1rea Terreno')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77331814518000959)
,p_name=>'P14_AREA_CNSTRDA'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>unistr('\00C1rea Construida')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77332292556000959)
,p_name=>'P14_AREA_GRVBLE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>unistr('\00C1rea Gravable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77332636183000959)
,p_name=>'P14_INDCDOR_PRDIO_MNCPIO'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Predio del Municipio?'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77333054020000959)
,p_name=>'P14_ID_BRRIO'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Barrio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77333484665000960)
,p_name=>'P14_ID_ENTDAD'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(380147129975571049)
,p_prompt=>'Entidad'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77162302917554216)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Datos Predio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' ',
' select b.dscrpcion_prdo_dstno,',
'        b.dscrpcion_estrto,',
'        b.nmbre_dstno_igac,',
'        b.cdgo_prdio_clsfccion,',
'        b.dscrpcion_uso_suelo,',
'        b.mtrcla_inmblria,',
'        to_char(b.avluo_ctstral,''999,999,999,999,999'')avluo_ctstral,',
'        to_char(b.avluo_cmrcial,''999,999,999,999,999'')avluo_cmrcial,',
'        (b.area_trrno|| '' '' || ''mts2''),',
'        (b.area_cnstrda|| '' '' || ''mts2''),',
'        (b.area_grvble|| '' '' || ''mts2''),',
'        decode(b.indcdor_prdio_mncpio, ''S'', ''SI'', ''NO''),',
'        nvl2(b.nmbre_brrio,b.nmbre_brrio,''NO DEFINIDO''),',
'        nvl2(b.nmbre_entdad,upper(b.nmbre_entdad),''NO DEFINIDO'') ,',
'        b.bse_grvble,',
'        b.dstncia,',
'        b.lttud,',
'        b.lngtud',
'  into :P14_ID_PRDIO_DSTNO,',
'       :P14_CDGO_ESTRTO,',
'       :P14_CDGO_DSTNO_IGAC,',
'       :P14_CDGO_PRDIO_CLSFCCION,',
'       :P14_ID_PRDIO_USO_SLO,',
'       :P14_MTRCLA_INMBLRIA,',
'       :P14_AVLUO_CTSTRAL,',
'       :P14_AVLUO_CMRCIAL,',
'       :P14_AREA_TRRNO,',
'       :P14_AREA_CNSTRDA,',
'       :P14_AREA_GRVBLE,',
'       :P14_INDCDOR_PRDIO_MNCPIO,',
'       :P14_ID_BRRIO,',
'       :P14_ID_ENTDAD,',
'       :P14_BSE_GRVBLE,',
'       :P14_DSTNCIA,',
'       :P14_LTTUD,',
'       :P14_LNGTUD',
'  from v_si_i_sujetos_impuesto a ',
'  join v_si_i_predios b',
'    on a.id_sjto_impsto = b.id_sjto_impsto',
' where b.id_prdio = :P14_ID_PRDIO;',
' ',
'exception when no_data_found',
'     then null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
