prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Declaracion Veh\00EDculos')
,p_step_title=>unistr('Declaracion Veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20201123162446'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94534252677858404)
,p_plug_name=>'Contendor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94534341078858405)
,p_plug_name=>'Declaracion'
,p_parent_plug_id=>wwv_flow_api.id(94534252677858404)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237243066872524200)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sjto_impsto,',
'b.id_dclrcn_tpo,',
'c.dscrpcion as tipo_declaracion,',
'd.vgncia,',
'd.id_prdo,',
'e.prdo,',
'e.dscrpcion,',
'f.id_dclrcion_vgncia_frmlrio,',
'h.id_dclrcion,',
'case when h.id_dclrcion is null then',
'''<center>',
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'||nvl2(h.id_dclrcion, ''Modificar '', ''Generar '')',
'||''<span class="fa ''||nvl2(h.id_dclrcion,''fa-edit'',''fa-cog fa-spin'')||''"></span>',
'</button>',
'</center>''',
'else',
'''-''',
'end as link',
'from si_i_vehiculos a',
'join gi_d_dclrcnes_tpos_sjto b on a.id_sjto_tpo = b.id_sjto_tpo',
'join gi_d_declaraciones_tipo c on b.id_dclrcn_tpo = c.id_dclrcn_tpo',
'join gi_d_dclrcnes_tpos_vgncias d on c.id_dclrcn_tpo = d.id_dclrcn_tpo',
'join df_i_periodos e on d.id_prdo = e.id_prdo',
'join gi_d_dclrcnes_vgncias_frmlr f on d.id_dclrcion_tpo_vgncia = f.id_dclrcion_tpo_vgncia',
'left join gi_g_declaraciones h on f.id_dclrcion_vgncia_frmlrio = h.id_dclrcion_vgncia_frmlrio',
'where a.id_sjto_impsto = :P28_ID_SJTO_IMPSTO',
'and not exists (',
'select *',
'from gf_g_movimientos_financiero g',
'where g.id_sjto_impsto = a.id_sjto_impsto',
'and g.vgncia = d.vgncia',
'and g.id_prdo = d.id_prdo',
');'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P28_ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(94535364971858415)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP,34:P34_ID_DCLRCION,P34_ID_DCLRCION_VGNCIA_FRMLRIO,P34_ID_SJTO_IMPSTO:#ID_DCLRCION#,#ID_DCLRCION_VGNCIA_FRMLRIO#,#ID_SJTO_IMPSTO#'
,p_detail_link_text=>'#LINK#'
,p_owner=>'RROBLEDO'
,p_internal_uid=>94535364971858415
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94535417310858416)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94535589776858417)
,p_db_column_name=>'ID_DCLRCN_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Dclrcn Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94535632302858418)
,p_db_column_name=>'TIPO_DECLARACION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tipo Declaracion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94535743335858419)
,p_db_column_name=>'VGNCIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94535857710858420)
,p_db_column_name=>'ID_PRDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Prdo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94535954281858421)
,p_db_column_name=>'PRDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94536042585858422)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Periodicidad'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94536125361858423)
,p_db_column_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Dclrcion Vgncia Frmlrio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94536214016858424)
,p_db_column_name=>'ID_DCLRCION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Id Dclrcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94536329967858425)
,p_db_column_name=>'LINK'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(94570279235562586)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'945703'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SJTO_IMPSTO:ID_DCLRCN_TPO:TIPO_DECLARACION:VGNCIA:ID_PRDO:PRDO:DSCRPCION:ID_DCLRCION_VGNCIA_FRMLRIO:ID_DCLRCION:LINK'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(246993063942622098)
,p_plug_name=>unistr('Par\00E1metros ')
,p_parent_plug_id=>wwv_flow_api.id(94534252677858404)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(247220951617140200)
,p_plug_name=>'Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(94534252677858404)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P28_ID_SJTO_IMPSTO'
,p_attribute_01=>'P28_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94520989436840901)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(246993063942622098)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94521329468840904)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(246993063942622098)
,p_button_name=>'Btn_Consultar_Parametros'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_image_alt=>unistr('Consultar por Par\00E1metros')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94521788760840907)
,p_name=>'P28_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(246993063942622098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94522134864840915)
,p_name=>'P28_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(246993063942622098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94522548556840915)
,p_name=>'P28_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(246993063942622098)
,p_prompt=>unistr('Identificaci\00F3n: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94522932752840915)
,p_name=>'P28_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(246993063942622098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94523359559840916)
,p_name=>'P28_CDGO_SJTO_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(246993063942622098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(94534141723858403)
,p_computation_sequence=>10
,p_computation_item=>'P28_ID_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.id_impsto from df_c_impuestos b ',
'where b.cdgo_clnte = 6 and b.cdgo_impsto = ''IVA'' and b.actvo = ''S'';'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94534026968858402)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        select a.id_sjto_impsto',
'          into :P28_ID_SJTO_IMPSTO',
'          from v_si_i_sujetos_impuesto a',
'         where a.cdgo_clnte   = :F_CDGO_CLNTE',
'           and a.id_impsto    = :P28_ID_IMPSTO',
'           and (a.idntfccion_sjto          = :P28_IDNTFCCION',
'                  or a.idntfccion_antrior  = :P28_IDNTFCCION);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
