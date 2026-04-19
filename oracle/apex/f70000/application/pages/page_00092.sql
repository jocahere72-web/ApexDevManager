prompt --application/pages/page_00092
begin
wwv_flow_api.create_page(
 p_id=>92
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Configuraciones de Renta'
,p_page_mode=>'MODAL'
,p_step_title=>'Configuraciones de Renta  - Sub Tributo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_protection_level=>'C'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20250319150942'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92303711282068526)
,p_plug_name=>unistr('Gesti\00F3n de Sub Tributo')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19429351601786056)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(92303711282068526)
,p_button_name=>'CREATE'
,p_button_static_id=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P92_ID_RNTA_CNFGRCION_SBMPSTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19427778636786054)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(92303711282068526)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19428986987786055)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(92303711282068526)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P92_ID_RNTA_CNFGRCION_SBMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19428568013786055)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(92303711282068526)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de eliminar la configuraciÃ³n del Sub Tributo?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P92_ID_RNTA_CNFGRCION_SBMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(19429670789786056)
,p_branch_name=>unistr('Ir a P\00E1gina 75')
,p_branch_action=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.:92::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4909613919808913)
,p_name=>'P92_INDCDOR_CMBIA_FCHA_VNCMNTO'
,p_is_required=>true
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFCambio de fecha de vencimiento?</b>')
,p_source=>'INDCDOR_CMBIA_FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica si el sub tributo permite que se actualice la fecha de vencimiento del documentos de pago'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5067404409697122)
,p_name=>'P92_INDCDOR_VLOR_AUX_LQDCION'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFUtiliza Valor Auxiliar para Liquidaci\00F3n?</b>')
,p_source=>'INDCDOR_VLOR_AUX_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si al momento de buscar la tarifa para la liquidaci\00F3n, se buscara con este valor.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5068117217697129)
,p_name=>'P92_LBEL_VLOR_AUX_LQDCION'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> Etiqueta Valor Auxiliar de Liquidaci\00F3n</b> ')
,p_source=>'LBEL_VLOR_AUX_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8210889642511702)
,p_name=>'P92_INDCDOR_ACMLA_BSE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFAcumula Base?</b>')
,p_source=>'INDCDOR_ACMLA_BSE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica si al momento de liquidar rentas adicionales, se tiene en cuenta la base acumulada de las liquidaciones anteriores.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11312098188364206)
,p_name=>'P92_INDCDOR_VLDA_PRDO'
,p_is_required=>true
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BF V\00E1lida per\00EDodo?</b>')
,p_source=>'INDCDOR_VLDA_PRDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el sujeto sobre quien liquida la renta podr\00EDa requerir indicador para validar per\00EDodo. ')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11312327555364209)
,p_name=>'P92_TPO_PRDO'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFTipo periodicidad?</b>')
,p_source=>'CDGO_PRDCDAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion    d,',
'       a.cdgo_prdcdad r',
'from  df_s_periodicidad a order by dscrpcion',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Indica el tipo de periodicidad del sub-tributo'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11312710543364213)
,p_name=>'P92_INDCDOR_NRMLZA_CRTRA'
,p_is_required=>true
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFNormaliza cartera?</b>')
,p_source=>'INDCDOR_NRMLZA_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>2
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el sujeto sobre quien liquida la renta podr\00EDa requerir indicador normaliza cartera. ')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11858645908293102)
,p_name=>'P92_INDCDOR_MNJA_SCRSAL'
,p_is_required=>true
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFManeja Sucursal?</b>')
,p_source=>'INDCDOR_MNJA_SCRSAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el sujeto sobre quien liquida la renta podr\00EDa requerir indicador maneja sucursal.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19422289870786050)
,p_name=>'P92_INDCDOR_USA_MXTO'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFLiquidaci\00F3n Mixta?</b>')
,p_source=>'INDCDOR_USA_MXTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si la renta a liquidar ser\00E1 de origen privado y p\00FAblico.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19423455897786051)
,p_name=>'P92_INDCDOR_USA_EXTRNJRO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFSujeto Extranjero?</b>')
,p_source=>'INDCDOR_USA_EXTRNJRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el sujeto sobre quien liquida la renta podr\00EDa ser extranjero.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92241609488753208)
,p_name=>'P92_ID_RNTA_CNFGRCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_RNTA_CNFGRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92241894035753210)
,p_name=>'P92_USER_DGTA'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92241937063753211)
,p_name=>'P92_FCHA_DGTA'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92242035317753212)
,p_name=>'P92_USER_MDFCA'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_MDFCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92242121924753213)
,p_name=>'P92_FCHA_MDFCA'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_MDFCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98657860713353042)
,p_name=>'P92_ID_RNTA_CNFGRCION_SBMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_RNTA_CNFGRCION_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98658006742353044)
,p_name=>'P92_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Sub-Tributo</b>'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre_impsto_sbmpsto      d',
'        , a.id_impsto_sbmpsto         r',
'     from df_i_impuestos_subimpuesto  a',
'    where a.id_impsto                 = :P75_ID_IMPSTO',
'      and ( (a.id_impsto_sbmpsto         not in (select id_impsto_sbmpsto ',
'                                                from v_gi_d_rntas_cnfgrcion_sbmpst     b',
'                                               where b.cdgo_clnte                      = :F_CDGO_CLNTE) ',
'              and :P92_ID_RNTA_CNFGRCION_SBMPSTO is null) ',
'          or (:P92_ID_RNTA_CNFGRCION_SBMPSTO is not null)',
'          )',
' order by nmbre_impsto_sbmpsto',
''))
,p_lov_display_null=>'YES'
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98658141581353045)
,p_name=>'P92_INDCDOR_LQDCCION_ADCNAL'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFPermite Liquidaciones Adicional ?</b>')
,p_source=>'INDCDOR_LQDCCION_ADCNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si para \00E9ste Sub-Tributo se permitir\00E1 realizar liquidaciones adicionales.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98658238754353046)
,p_name=>'P92_INDCDOR_EXNCION'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFPermite Solicitud de Exenci\00F3n?</b>')
,p_source=>'INDCDOR_EXNCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si al momento de realizar una solicitud de liquidaci\00F3n para \00E9ste Sub-Tributos se permitir\00E1 solicitar una exenci\00F3n')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98658304390353047)
,p_name=>'P92_ID_IMPSTO_ACTO_EXNCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>Tributo Acto - Exenci\00F3n</b>')
,p_source=>'ID_IMPSTO_ACTO_EXNCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || a.cdgo_impsto_acto || ''] '' || a.nmbre_impsto_acto d',
'        , a.id_impsto_acto',
'     from df_i_impuestos_acto   a',
'    where  a.id_impsto   = :P75_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Relacionar el Tributo-Acto que se utilizar\00E1 para realizara para generar la liquidaci\00F3n del certificado de exenci\00F3n')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98658461858353048)
,p_name=>'P92_INDCDOR_CNTRTO_GSLNA'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFManeja Contrato de Combustible?</b>')
,p_source=>'INDCDOR_CNTRTO_GSLNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'      from v_gi_d_rentas_configuracion',
'    where id_rnta_cnfgrcion                = :P92_ID_RNTA_CNFGRCION',
'      and indcdor_mnja_cntrto_gslna        = ''S'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Indica si para ente Sub-tributo se podr\00E1n realizar liquidaciones de contrato de Combustible. <br>'),
'Las liquidaciones de contratos de combustibles tiene las siguientes variables adicionales:<br>',
'- Se debe parametrizar si el contribuyente es mayorista o minorista.<br>',
'- Se debe parametrizar los margenes de utilidades.'))
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98658539720353049)
,p_name=>'P92_ID_FLJO'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Flujo de Trabajo</b>'
,p_source=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion_fljo    d',
'        , id_fljo           r ',
'     from wf_d_flujos',
'    where cdgo_clnte = :F_CDGO_CLNTE',
' order by dscrpcion_fljo'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Relacionar el Flujo de trabajo que se utilizar\00E1 para realizar el proceso de solicitud o liquidaci\00F3n para \00E9ste Sub-Tributo')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98658619814353050)
,p_name=>'P92_INDCDOR_RQRE_ENTDAD'
,p_is_required=>true
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BF Requiere Entidad ?</b>')
,p_source=>'INDCDOR_RQRE_ENTDAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si al realizar las liquidaciones para \00E9ste Sub-Tributo se requiere asociar una entidad contratista. ')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100858016031787601)
,p_name=>'P92_DIAS_MRGN_MRA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>N\00B0 D\00EDas de Margen Mora</b>')
,p_source=>'DIAS_MRGN_MRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>3
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Cantidad de d\00EDas de gabela despu\00E9s de la fecha de expedici\00F3n del acto.')
,p_attribute_01=>'1'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100858197481787602)
,p_name=>'P92_PRCNTJE_LQDCION_PBLCO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>% Liquidaci\00F3n P\00FAblica</b>')
,p_format_mask=>'999G990D99'
,p_source=>'PRCNTJE_LQDCION_PBLCO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>4
,p_cMaxlength=>4
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica el porcentaje correspondiente a la parte publica.'
,p_attribute_01=>'1'
,p_attribute_02=>'99'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100858510733787606)
,p_name=>'P92_PRCNTJE_LQDCION_PRVDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>% Liquidaci\00F3n Privada</b>')
,p_format_mask=>'999G990D99'
,p_source=>'PRCNTJE_LQDCION_PRVDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>4
,p_cMaxlength=>4
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica el porcentaje correspondiente a la parte privada.'
,p_attribute_01=>'1'
,p_attribute_02=>'99'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100858738458787608)
,p_name=>'P92_TPO_DIAS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFTipo de D\00EDas?</b>')
,p_source=>'TPO_DIAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el tipo de d\00EDas. Calendario o h\00E1biles')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'H'
,p_attribute_03=>unistr('H\00E1biles')
,p_attribute_04=>'C'
,p_attribute_05=>'Calendario'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101881141430258104)
,p_name=>'P92_NMRO_DCMNTOS'
,p_is_required=>true
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> N\00FAmero de  Documentos</b> ')
,p_source=>'NMRO_DCMNTOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de c\00F3digos de barra que se mostraran en el documento de pago')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101881246417258105)
,p_name=>'P92_INTRVLO_DIAS'
,p_is_required=>true
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_prompt=>unistr('<b> Intervalo de d\00EDas del documento</b> ')
,p_source=>'INTRVLO_DIAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el intervalo de d\00EDas para generar la fecha de vencimiento del documento')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102337549286460905)
,p_name=>'P92_INDCDOR_MNJA_CNTRTO_ESE'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFManeja Contrato de ESE ?</b>')
,p_source=>'INDCDOR_MNJA_CNTRTO_ESE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'      from v_gi_d_rentas_configuracion',
'    where id_rnta_cnfgrcion                = :P92_ID_RNTA_CNFGRCION',
'      and indcdor_mnja_cntrto_ese          = ''S'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Indica si para ente Sub-tributo se podr\00E1n realizar liquidaciones de contrato de E.S.E. <br>'),
unistr('Las liquidaciones de contratos de E.S.E tiene como variable adicional el valor del contrato de E.S.E que incluye el valor de los servicios prestados para usuarios del r\00E9gimen subsidiado y contributivo .')))
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102338011982460910)
,p_name=>'P92_LBEL_FCHA_EXPDCION'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(92303711282068526)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> Etiqueta Fecha Expedici\00F3n</b> ')
,p_source=>'LBEL_FCHA_EXPDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100862676195787647)
,p_validation_name=>'Valida Porcentaje Privado'
,p_validation_sequence=>10
,p_validation=>'not (:P92_INDCDOR_USA_MXTO = ''S'' and :P92_PRCNTJE_LQDCION_PRVDO is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00A1Ingrese Porcentaje Privado!')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(100858510733787606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100862786537787648)
,p_validation_name=>unistr('Valida Porcentaje P\00FAblico')
,p_validation_sequence=>20
,p_validation=>'not (:P92_INDCDOR_USA_MXTO = ''S'' and :P92_PRCNTJE_LQDCION_PBLCO is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00A1Ingrese Porcentaje P\00FAblico!')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(100858197481787602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100862863173787649)
,p_validation_name=>unistr('Valida D\00EDas Mora')
,p_validation_sequence=>30
,p_validation=>'not (:P92_INDCDOR_USA_EXTRNJRO = ''S'' and :P92_DIAS_MRGN_MRA is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00A1Ingrese N\00B0 D\00EDas de Margen Mora!')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(100858016031787601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100957182705432410)
,p_validation_name=>'Valida acto exencion'
,p_validation_sequence=>40
,p_validation=>'not (:P92_INDCDOR_EXNCION = ''S'' and :P92_ID_IMPSTO_ACTO_EXNCION is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00A1Seleccione el Acto para el certificado de exenci\00F3n!')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(98658304390353047)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19440284463825213)
,p_name=>unistr('Tipos de Liquidaci\00F3n')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_INDCDOR_USA_MXTO'
,p_condition_element=>'P92_INDCDOR_USA_MXTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19440621356825214)
,p_event_id=>wwv_flow_api.id(19440284463825213)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_PRCNTJE_LQDCION_PRVDO,P92_PRCNTJE_LQDCION_PBLCO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19441160388825215)
,p_event_id=>wwv_flow_api.id(19440284463825213)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_PRCNTJE_LQDCION_PRVDO,P92_PRCNTJE_LQDCION_PBLCO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100956966003432408)
,p_event_id=>wwv_flow_api.id(19440284463825213)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_PRCNTJE_LQDCION_PRVDO,,P92_PRCNTJE_LQDCION_PBLCO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19441517480830752)
,p_name=>'Definiciones Extranjero'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_INDCDOR_USA_EXTRNJRO'
,p_condition_element=>'P92_INDCDOR_USA_EXTRNJRO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100858999815787610)
,p_event_id=>wwv_flow_api.id(19441517480830752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_TPO_DIAS,P92_DIAS_MRGN_MRA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100859083335787611)
,p_event_id=>wwv_flow_api.id(19441517480830752)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_TPO_DIAS,P92_DIAS_MRGN_MRA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100957097163432409)
,p_event_id=>wwv_flow_api.id(19441517480830752)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_DIAS_MRGN_MRA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100859133041787612)
,p_name=>'Tiene Exencion'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_INDCDOR_EXNCION'
,p_condition_element=>'P92_INDCDOR_EXNCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100859280511787613)
,p_event_id=>wwv_flow_api.id(100859133041787612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_ID_IMPSTO_ACTO_EXNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100956627643432405)
,p_event_id=>wwv_flow_api.id(100859133041787612)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_ID_IMPSTO_ACTO_EXNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100957277397432411)
,p_event_id=>wwv_flow_api.id(100859133041787612)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_ID_IMPSTO_ACTO_EXNCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100956262267432401)
,p_name=>'Cerrar Modal'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19427778636786054)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100956364334432402)
,p_event_id=>wwv_flow_api.id(100956262267432401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(102337629339460906)
,p_name=>unistr('Mostrar el intervalo de d\00EDas si el n\00FAmero de documentos a generar es mayor que 1')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_NMRO_DCMNTOS'
,p_condition_element=>'P92_NMRO_DCMNTOS'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(102337722909460907)
,p_event_id=>wwv_flow_api.id(102337629339460906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_INTRVLO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(102337830388460908)
,p_event_id=>wwv_flow_api.id(102337629339460906)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_INTRVLO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11312193026364207)
,p_name=>unistr('Indicadores de per\00EDodos ')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_INDCDOR_VLDA_PRDO'
,p_condition_element=>'P92_INDCDOR_VLDA_PRDO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11312486408364210)
,p_event_id=>wwv_flow_api.id(11312193026364207)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_TPO_PRDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11312523558364211)
,p_event_id=>wwv_flow_api.id(11312193026364207)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_TPO_PRDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4986483095578101)
,p_event_id=>wwv_flow_api.id(11312193026364207)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_TPO_PRDO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5068202098697130)
,p_name=>'Mostrar el label del item cuando utilice valor auxiliar de liquidacion'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_INDCDOR_VLOR_AUX_LQDCION'
,p_condition_element=>'P92_INDCDOR_VLOR_AUX_LQDCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5068306742697131)
,p_event_id=>wwv_flow_api.id(5068202098697130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_LBEL_VLOR_AUX_LQDCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5068661964697134)
,p_event_id=>wwv_flow_api.id(5068202098697130)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_LBEL_VLOR_AUX_LQDCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8210989165511703)
,p_name=>unistr('Aplica liquidaci\00F3n adicional')
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_INDCDOR_LQDCCION_ADCNAL'
,p_condition_element=>'P92_INDCDOR_LQDCCION_ADCNAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8211033873511704)
,p_event_id=>wwv_flow_api.id(8210989165511703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_INDCDOR_ACMLA_BSE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8211280774511706)
,p_event_id=>wwv_flow_api.id(8210989165511703)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_INDCDOR_ACMLA_BSE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19328875541787145)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Secuencia'
,p_process_sql_clob=>':P92_ID_RNTA_CNFGRCION_SBMPSTO := sq_gi_d_rntas_cnfgrcion_sbmpst.nextval(); '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(19429351601786056)
,p_process_when=>'P92_ID_RNTA_CNFGRCION_SBMPSTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19430581351786057)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Procesar pantalla configuraciones'
,p_attribute_02=>'GI_D_RNTAS_CNFGRCION_SBMPST'
,p_attribute_03=>'P92_ID_RNTA_CNFGRCION_SBMPSTO'
,p_attribute_04=>'ID_RNTA_CNFGRCION_SBMPSTO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\00A1Petici\00F3n Procesada!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100956729060432406)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Limpiar Item Liquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P92_INDCDOR_USA_MXTO = ''N'' then',
'    :P92_PRCNTJE_LQDCION_PRVDO := null;',
'    :P92_PRCNTJE_LQDCION_PBLCO := null;',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100956863608432407)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Limpiar Item Extranjero'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P92INDCDOR_USA_EXTRNJRO = ''N'' then',
'    :P92_TPO_DIAS := ''H'';',
'    :P92_DIAS_MRGN_MRA := null;',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19430113342786057)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Inicializar pantalla configuraciones'
,p_attribute_02=>'GI_D_RNTAS_CNFGRCION_SBMPST'
,p_attribute_03=>'P92_ID_RNTA_CNFGRCION_SBMPSTO'
,p_attribute_04=>'ID_RNTA_CNFGRCION_SBMPSTO'
,p_process_when=>'P92_ID_RNTA_CNFGRCION_SBMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
