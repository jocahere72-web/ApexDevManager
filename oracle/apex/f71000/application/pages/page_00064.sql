prompt --application/pages/page_00064
begin
wwv_flow_api.create_page(
 p_id=>64
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Resumen'
,p_step_title=>'Resumen'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222102129'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4423040625966868)
,p_plug_name=>'Resumen'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4414536068966851)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4423179722966868)
,p_plug_name=>'Resumen'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4633395288108812)
,p_plug_name=>'Fechas de Vencimiento'
,p_parent_plug_id=>wwv_flow_api.id(4423179722966868)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id,',
'       d001 fcha_vncmnto,',
'       c001 txto',
'   from apex_collections ',
'  where collection_name = ''FCHAS_VNCMNTO''  ',
'  order by 2'))
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
 p_id=>wwv_flow_api.id(4633452845108813)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>4633452845108813
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4633578049108814)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4633650207108815)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha de Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4633724228108816)
,p_db_column_name=>'TXTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Texto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4657710656278336)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46578'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:FCHA_VNCMNTO:TXTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4634331469108822)
,p_plug_name=>'Opciones'
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
'            <center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4634438205108823)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
unistr('Para la creaci\00F3n de lote de facturaci\00F3n masiva con multiples fechas se deden realizar 4 pasos. En esta opci\00F3n se ejecutara el \00FAltimo paso.<br>'),
'<center><b><i> Paso 4: Resumen </i></b> </br></center>',
unistr('Se muestra un resumen de  los pasos 1, 2 y 3 del proceso de creaci\00F3n de  facturaci\00F3n masiva con multiples fechas. <br>'),
unistr('Para finalizar con el proceso se debe hacer clic en el bot\00F3n Procesar.')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4424820937966868)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4423040625966868)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4424989869966868)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4423040625966868)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4425022272966868)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4423040625966868)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4426683162966869)
,p_branch_name=>'Go To Page 60'
,p_branch_action=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4424989869966868)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4425919944966869)
,p_branch_action=>'f?p=&APP_ID.:63:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4425022272966868)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4424560761966868)
,p_name=>'P64_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_prompt=>'Tributo'
,p_source=>'P60_ID_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4632573308108804)
,p_name=>'P64_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_prompt=>'Sub-Tributo'
,p_source=>'P60_ID_IMSPTO_SBMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_SUBIMPUESTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4632623496108805)
,p_name=>'P64_VGNCIA_DSDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_prompt=>'Vigencia Desde'
,p_source=>'P60_VGNCIA_DSDE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4632775333108806)
,p_name=>'P64_VGNCIA_HSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_prompt=>'Vigencia Hasta'
,p_source=>'P60_VGNCIA_HSTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4632847129108807)
,p_name=>'P64_PRD_DSDE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_prompt=>'Periodo Desde'
,p_source=>'P60_PRDO_DSDE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'         id_prdo r ',
'  from df_i_periodos',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4632989516108808)
,p_name=>'P64_PRD_HSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_prompt=>'Periodo Hasta'
,p_source=>'P60_PRDO_HSTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'         id_prdo r ',
'  from df_i_periodos',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4633038042108809)
,p_name=>'P64_OBSRVCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'P60_OBSRVCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4633168390108810)
,p_name=>'P64_SLCCION_PBLCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_prompt=>unistr('Selecci\00F3n Poblaci\00F3n Por:')
,p_source=>'P62_SLCCION_PBLCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Archivo;ACV,SQL;SQL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4633251550108811)
,p_name=>'P64_NMRO_SJTO_VLDOS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_prompt=>unistr('N\00B0 Sujetos Validos')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(c002) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''Valido'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4634235775108821)
,p_name=>'P64_RSPSTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(4423179722966868)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4635094763108829)
,p_validation_name=>'Validar que existan Sujetos Validos para generar documentos'
,p_validation_sequence=>10
,p_validation=>':P64_NMRO_SJTO_VLDOS > 0'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'Deben existir sujetos validos '
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4634057333108819)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_msj                  varchar2(5000);',
'    v_id_dcmnto_lte        number;',
'    v_file_blob				re_g_documentos_lote.file_blob%type;   ',
'    v_mnsje                varchar2(5000);',
'',
'begin',
'',
'    pkg_re_documentos.prc_rg_lote_documentos (p_cdgo_clnte 			    => :F_CDGO_CLNTE, ',
'                                              p_id_impsto 				=> :P60_ID_IMPSTO, ',
'                                              p_id_impsto_sbmpsto 		=> :P60_ID_IMSPTO_SBMPSTO,',
'                                              p_vgncia_dsde				=> :P60_VGNCIA_DSDE,',
'                                              p_prdo_dsde				=> :P60_PRDO_DSDE,',
'                                              p_vgncia_hsta				=> :P60_VGNCIA_HSTA,',
'                                              p_prdo_hsta				=> :P60_PRDO_HSTA,',
'                                              p_fcha_vncmnto            =>  null,',
'                                              p_tpo_slccion_pblcion		=> :P62_SLCCION_PBLCION,',
'                                              p_id_dtrmncion_lte        => null,',
'                                              p_cdgo_cnsctvo			=> ''DOC'',',
'                                              p_cdgo_dcmnto_lte_tpo     => ''MMF'' ,',
'                                              p_obsrvcion				=> :P60_OBSRVCION,',
'                                              p_id_usrio				=> :F_ID_USRIO,',
'                                              p_indcdor_entrno          => ''PRVDO'',',
'                                              p_mnsje				    => v_msj,',
'						                      p_id_dcmnto_lte		    => v_id_dcmnto_lte);    ',
'',
'    :P64_RSPSTA := v_msj; ',
'    ',
'end;                               ',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4424989869966868)
,p_process_success_message=>'&P64_RSPSTA.'
);
end;
/
