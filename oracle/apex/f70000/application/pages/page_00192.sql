prompt --application/pages/page_00192
begin
wwv_flow_api.create_page(
 p_id=>192
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Consultas predial'
,p_step_title=>'Consultas predial'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210121111709'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104496389106038507)
,p_plug_name=>'Informacion General'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select b.idntfccion_rspnsble ',
'      , (b.prmer_nmbre||'' ''||  b.sgndo_nmbre||'' ''||b.prmer_aplldo||'' ''||b.prmer_nmbre) as rspnsble',
'      , b.idntfccion_sjto',
'      , b.idntfccion_antrior',
'      , a.id_sjto_impsto',
'      , a.drccion',
'   from v_si_i_sujetos_impuesto    a',
'   join v_si_i_sujetos_responsable b on a.id_sjto_impsto = b.id_sjto_impsto',
'   join df_i_impuestos_subimpuesto c on a.id_impsto      = c.id_impsto',
'  where a.cdgo_clnte                = :F_CDGO_CLNTE',
'    and a.id_impsto                 = :P192_ID_IMPSTO',
'    and c.id_impsto_sbmpsto         = :P192_ID_IMPSTO_SBIMPSTO',
'    and b.prncpal_s_n               = ''S''',
'     and a.idntfccion_sjto           = nvl(:P192_IDNTFCCION_PRDIO,a.idntfccion_sjto);'))
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
 p_id=>wwv_flow_api.id(104496416411038508)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>104496416411038508
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104496501800038509)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Idntfccion Rspnsble'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104496664191038510)
,p_db_column_name=>'RSPNSBLE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Rspnsble'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104496729135038511)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Idntfccion Sjto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104496817138038512)
,p_db_column_name=>'IDNTFCCION_ANTRIOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Idntfccion Antrior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104496929798038513)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104497070057038514)
,p_db_column_name=>'DRCCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Drccion'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(104516505175143537)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1045166'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IDNTFCCION_RSPNSBLE:RSPNSBLE:IDNTFCCION_SJTO:IDNTFCCION_ANTRIOR:ID_SJTO_IMPSTO:DRCCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104497157130038515)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104495759578038501)
,p_plug_name=>unistr('Par\00E1metros')
,p_parent_plug_id=>wwv_flow_api.id(104497157130038515)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(180871552122604373)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i> ',
unistr('    <p align="justify">Funcionalidad que permite ingresar, consultar, modificar y eliminar los deferentes tipos de contratos o convenios que se pueden liquidar en la administraci\00F3n, de igual forma tambien se asocian los Actos y Entidades que cada tip')
||'o de contrato debe liquidar.<br> ',
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104496187872038505)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(104495759578038501)
,p_button_name=>'Btn_Cnsultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104495819753038502)
,p_name=>'P192_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104495759578038501)
,p_prompt=>'Tributo '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto  as d',
'      , id_impsto     as r',
'   from df_c_impuestos  ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'      and cdgo_impsto = ''IPU'';'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104495952923038503)
,p_name=>'P192_ID_IMPSTO_SBIMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(104495759578038501)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto as d',
'      , id_impsto_sbmpsto     as r',
'   from df_i_impuestos_subimpuesto',
'  where id_impsto = :P192_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P192_ID_IMPSTO'
,p_ajax_items_to_submit=>'P192_ID_IMPSTO_SBIMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Sub-Tributo de la lista a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104496028688038504)
,p_name=>'P192_IDNTFCCION_PRDIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(104495759578038501)
,p_prompt=>unistr('Identificaci\00F3n del Sujeto: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Digite la referencia catastral del predio.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
