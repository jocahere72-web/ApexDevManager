prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Documento'
,p_step_title=>'Documento'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20181127082609'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83723163874501586)
,p_plug_name=>'Documento'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85007179267815666)
,p_plug_name=>'Opciones '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
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
 p_id=>wwv_flow_api.id(85007311983815668)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'',
'<p>Esta funcionalidad permite gestionar los documentos de cada una de las etpas del proceso juridico de cobro.</p>',
'<p> </p>',
'<p> </p>',
'<p><b>Nota:</b> Solo se visualizara la opcion de seleccionar la plantilla cuando no exista el documento.</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42517635026163591)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(85007179267815666)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:&P14_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42514563563163580)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(83723163874501586)
,p_button_name=>'BTN_GNRAR_DCMNTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42494760092652116)
,p_name=>'P14_ID_PRCSOS_JRDC_DCMNT_PLNT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(83723163874501586)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRCSOS_JRDC_DCMNT_PLNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42496513536652134)
,p_name=>'P14_DCMNTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(83723163874501586)
,p_prompt=>'Documento'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'Y'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42514953304163582)
,p_name=>'P14_CDGO_ACTO_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(83723163874501586)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42515376932163588)
,p_name=>'P14_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(83723163874501586)
,p_prompt=>'Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion,',
'          id_plntlla',
'     from gn_d_plantillas',
'     where cdgo_acto_tpo = :P14_CDGO_ACTO_TPO'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42516146515163589)
,p_name=>'P14_BRANCH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(83723163874501586)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42516585170163589)
,p_name=>'P14_ID_PRCSOS_JRDCO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(83723163874501586)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42516958318163590)
,p_name=>'P14_ID_PRCSOS_JRDCO_DCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(83723163874501586)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(42494615559652115)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of CB_G_PRCSOS_JRDC_DCMNT_PLNT'
,p_attribute_02=>'CB_G_PRCSOS_JRDC_DCMNT_PLNT'
,p_attribute_03=>'P14_ID_PRCSOS_JRDC_DCMNT_PLNT'
,p_attribute_04=>'ID_PRCSOS_JRDC_DCMNT_PLNT'
,p_attribute_11=>'I:U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(42518311192163601)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P14_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<id_prcsos_jrdco>''|| :P14_ID_PRCSOS_JRDCO ||''</id_prcsos_jrdco><id_prcsos_jrdco_dcmnto>''|| :P14_ID_PRCSOS_JRDCO_DCMNTO ||''</id_prcsos_jrdco_dcmnto>'', :P14_PLNTLLA);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42514563563163580)
);
end;
/
