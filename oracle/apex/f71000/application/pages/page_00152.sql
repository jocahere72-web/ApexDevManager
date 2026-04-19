prompt --application/pages/page_00152
begin
wwv_flow_api.create_page(
 p_id=>152
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Adjuntos del Ajuste'
,p_page_mode=>'MODAL'
,p_step_title=>'Adjuntos del Ajuste'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20190517110348'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99318369641629060)
,p_plug_name=>'Adjuntos del Ajuste'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select    ',
'            id_ajste_adjnto,',
'            id_ajste,',
'			cdgo_adjnto_tpo,',
'			fcha,',
'            SUBSTR(file_name, INSTR(file_name, ''/'')+1) file_name,',
'			--file_blob,',
'			--file_name,',
'            --SUBSTR(file_name, 18) file_name,',
'			--file_mimetype,',
'			1 descargar',
'   from gf_g_ajuste_adjunto',
'  where id_ajste = :P152_ID_AJSTE',
'  order by fcha desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P152_ID_AJSTE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select    id_ajste_adjnto         ',
'	',
'   from gf_g_ajuste_adjunto',
'  where id_ajste = :P152_ID_AJSTE;'))
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(99318494911629060)
,p_name=>'Adjuntos del Ajuste'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>99318494911629060
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99318812302629073)
,p_db_column_name=>'ID_AJSTE_ADJNTO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Ajste Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99319231068629075)
,p_db_column_name=>'ID_AJSTE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'No Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99319652530629075)
,p_db_column_name=>'CDGO_ADJNTO_TPO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99320039385629075)
,p_db_column_name=>'FCHA'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99320426200629076)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>6
,p_column_identifier=>'E'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99364871086748802)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>16
,p_column_identifier=>'G'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GF_G_AJUSTE_ADJUNTO:FILE_BLOB:ID_AJSTE_ADJNTO::::::attachment:<span class="fa fa-cloud-arrow-down"></span>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(99347799471664720)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'993478'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_AJSTE:FILE_NAME:CDGO_ADJNTO_TPO:FCHA:DESCARGAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109738667986999701)
,p_plug_name=>'Visor Acto'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109738844508999703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(109738667986999701)
,p_button_name=>'Visor_Acto'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Acto Soporte'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(109738922115999704)
,p_branch_name=>'ir a la pagina 125 visor'
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,&P152_ID_ACTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99321705029636703)
,p_name=>'P152_ID_AJSTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99318369641629060)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109738745711999702)
,p_name=>'P152_ID_ACTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(109738667986999701)
,p_prompt=>'No. Acto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109813866935762603)
,p_name=>'P152_DSCRPCION_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(109738667986999701)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(177355220964050628)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
