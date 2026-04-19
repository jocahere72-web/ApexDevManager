prompt --application/pages/page_00066
begin
wwv_flow_api.create_page(
 p_id=>66
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Desembargo_Parcial'
,p_page_mode=>'MODAL'
,p_step_title=>'Desembargo Parcial/Total'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20190708113747'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100885033929481703)
,p_plug_name=>'Desembarg Parcial'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108556249010903340)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(100885033929481703)
,p_button_name=>'Registrar_Desembargo'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Desembargo'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122609407019713917)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(100885033929481703)
,p_button_name=>'btn_pagos'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Pagos'
,p_button_position=>'BODY'
,p_button_condition=>'P66_CDGO_CSAL'
,p_button_condition2=>'P'
,p_button_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122610139550713924)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(100885033929481703)
,p_button_name=>'btn_ajustes'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Ajustes'
,p_button_position=>'BODY'
,p_button_condition=>'P66_CDGO_CSAL'
,p_button_condition2=>'A'
,p_button_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122610262336713925)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(100885033929481703)
,p_button_name=>'btn_convenios'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Convenio'
,p_button_position=>'BODY'
,p_button_condition=>'P66_CDGO_CSAL'
,p_button_condition2=>'C'
,p_button_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(108556643101903344)
,p_branch_name=>unistr('Ir a P\00E1gina 42')
,p_branch_action=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(108556249010903340)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(122609965454713922)
,p_branch_action=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:RP,105:P105_ID_EMBRGOS_CRTRA:&P66_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(122609407019713917)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(122610580221713928)
,p_branch_name=>unistr('Ir a P\00E1gina 106')
,p_branch_action=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:RP,106:P106_ID_EMBRGOS_CRTRA:&P66_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(122610139550713924)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(122610876996713931)
,p_branch_name=>unistr('Ir a P\00E1gina 107')
,p_branch_action=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP,107:P107_ID_EMBRGOS_CRTRA:&P66_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(122610262336713925)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100885205954481705)
,p_name=>'P66_ID_CSLES_DSMBRGO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_prompt=>'Causal de Desembargo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'WHERE cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100885387046481706)
,p_name=>'P66_NMRO_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_prompt=>'Numero de Documento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_display_when=>'P66_CDGO_CSAL'
,p_display_when2=>'C:P:A:T'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108554030483903318)
,p_name=>'P66_FCHA_DCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Documento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P66_CDGO_CSAL'
,p_display_when2=>'C:P:A:T'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108554133022903319)
,p_name=>'P66_VLOR_DCMNTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_prompt=>'Valor Documento'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P66_CDGO_CSAL'
,p_display_when2=>'T'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108554268090903320)
,p_name=>'P66_NMRO_OFCIO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_prompt=>'Numero de Oficio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_display_when=>'P66_CDGO_CSAL'
,p_display_when2=>'T'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108554348345903321)
,p_name=>'P66_JSON_OFCIOS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108554403463903322)
,p_name=>'P66_JSON_RESOLUCIONES'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108554570512903323)
,p_name=>'P66_ID_EMBRGOS_RSLCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108554600487903324)
,p_name=>'P66_TIPO_DESEMBARGO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108554724027903325)
,p_name=>'P66_DESEMBARGO_UNICO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_item_default=>'N'
,p_prompt=>unistr('Unificar Resoluci\00F3n de Desembargo')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Si;S,No;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108555097008903328)
,p_name=>'P66_OBSERVACION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108555565623903333)
,p_name=>'P66_CDGO_CSAL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108555873533903336)
,p_name=>'P66_ID_PLNTLLA_RSLCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_prompt=>unistr('Plantilla Resoluci\00F3n de Desembargo')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_plntlla',
'from gn_d_plantillas a',
'inner join mc_d_tipos_mdda_ctlr_dcmnto b on b.id_plntlla = a.id_plntlla ',
'                                        and b.id_csles_dsmbrgo = :P66_ID_CSLES_DSMBRGO',
'inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar',
'and c.id_tpos_mdda_ctlar = :P66_ID_TIPO_EMBARGO',
'where a.tpo_plntlla = ''M''',
'and a.actvo = ''S''',
'and a.id_prcso = 24',
'and b.tpo_dcmnto = ''R''',
'and b.clse_dcmnto = ''P'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P66_ID_CSLES_DSMBRGO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108555933898903337)
,p_name=>'P66_ID_PLNTLLA_OFICIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_prompt=>'Plantilla Oficio de Desembargo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_plntlla',
'from gn_d_plantillas a',
'inner join mc_d_tipos_mdda_ctlr_dcmnto b on b.id_plntlla = a.id_plntlla',
'                                        and b.id_csles_dsmbrgo = :P66_ID_CSLES_DSMBRGO',
'inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar',
'                                  and c.id_tpos_mdda_ctlar = :P66_ID_TIPO_EMBARGO',
'where a.tpo_plntlla = ''M''',
'and a.actvo = ''S''',
'and a.id_prcso = 24',
'and b.tpo_dcmnto = ''O''',
'and b.clse_dcmnto = ''P'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P66_ID_CSLES_DSMBRGO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108556055473903338)
,p_name=>'P66_ID_TIPO_EMBARGO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122609543237713918)
,p_name=>'P66_ID_EMBRGOS_CRTRA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122611384115713936)
,p_name=>'P66_TPO_CRTRA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100885033929481703)
,p_item_default=>'CT'
,p_prompt=>'Tipo de Cartera a Validar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Cartera Total;CT,Cartera de Embargo;CE'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(108555628417903334)
,p_computation_sequence=>10
,p_computation_item=>'P66_CDGO_CSAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_csal',
'from mc_d_causales_desembargo',
'WHERE cdgo_clnte = :F_CDGO_CLNTE',
'and id_csles_dsmbrgo = :P66_ID_CSLES_DSMBRGO;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(122611075513713933)
,p_validation_name=>'Validar veracidad de datos de soporte de causales'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_documento number := 0;',
'',
'begin',
'',
'    if :P66_CDGO_CSAL = ''P'' then',
'    ',
'        begin ',
'            select distinct a.NMRO_DCMNTO',
'              into v_documento',
'              from v_re_g_recaudos a',
'              join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto ',
'                                       and b.id_embrgos_crtra = :P66_ID_EMBRGOS_CRTRA',
'             where A.cdgo_clnte = :F_CDGO_CLNTE',
'               and a.NMRO_DCMNTO = :P66_NMRO_DCMNTO;',
'               ',
'        exception when others then',
'            v_documento := 0;',
'        end;',
'        ',
'        if v_documento > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    ',
'    elsif :P66_CDGO_CSAL = ''C'' then',
'        begin ',
'            select a.NMRO_CNVNIO',
'              into v_documento',
'              from v_gf_g_convenios a',
'              join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto and b.id_embrgos_crtra = :P66_ID_EMBRGOS_CRTRA',
'             where a.cdgo_cnvnio_estdo = ''APL''',
'               and A.cdgo_clnte = :F_CDGO_CLNTE',
'               and a.NMRO_CNVNIO = :P66_NMRO_DCMNTO',
'               and exists (select 1',
'                             from mc_g_embargos_cartera_detalle c',
'                             join gf_g_convenios_cartera d on D.vgncia = C.vgncia',
'                                                          and D.id_prdo = C.id_prdo',
'                                                          and D.id_cncpto = C.id_cncpto',
'                            where c.id_embrgos_crtra = b.id_embrgos_crtra);',
'               ',
'        exception when others then',
'            v_documento := 0;',
'        end;',
'        ',
'        if v_documento > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    elsif :P66_CDGO_CSAL = ''A'' then',
'        begin ',
'            ',
'            select distinct a.numro_ajste',
'              into v_documento',
'              from v_gf_g_ajustes a',
'              join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto ',
'                                       and b.id_embrgos_crtra = :P66_ID_EMBRGOS_CRTRA',
'             where A.cdgo_clnte = :F_CDGO_CLNTE',
'               and a.numro_ajste = :P66_NMRO_DCMNTO;',
'                            ',
'        exception when others then',
'            v_documento := 0;',
'        end;',
'        ',
'        if v_documento > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El numero de documento de soporte de la causal no concuerda con uno asociado a la cartera del embargo.'
,p_when_button_pressed=>wwv_flow_api.id(108556249010903340)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(122611104843713934)
,p_validation_name=>unistr('Validar que los datos de soporte est\00E9n llenos')
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    if :P66_CDGO_CSAL in (''P'',''C'',''A'')then',
'    ',
'        if (:P66_NMRO_DCMNTO is null or :P66_FCHA_DCMNTO is null) then',
'            return ''Debe ingresar los datos de numero y fecha de documento.'';',
'        else',
'            return null;',
'        end if;',
'    ',
'    elsif :P66_CDGO_CSAL = ''T'' then',
'        if (:P66_NMRO_DCMNTO is null or :P66_FCHA_DCMNTO is null or :P66_NMRO_OFCIO is null or :P66_VLOR_DCMNTO is null) then',
'            return ''Debe ingresar los datos de numero y fecha de documento, numero de oficio y valor del documento.'';',
'        else',
'            return null;',
'        end if;',
'    else',
'        return null;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_api.id(108556249010903340)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(122611218144713935)
,p_validation_name=>'Validar que se escojan las plantillas'
,p_validation_sequence=>40
,p_validation=>':P66_ID_PLNTLLA_RSLCION is not null and :P66_ID_PLNTLLA_OFICIO is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe escoger las plantillas para poder realizar el proceso de desembargo'
,p_when_button_pressed=>wwv_flow_api.id(108556249010903340)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(122611480956713937)
,p_validation_name=>'Validar si se puede desembargar de acuerdo al tipo de cartera escogida'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_vlor_sldo_cptal number := 0;',
'',
'begin',
'',
'    if :P66_CDGO_CSAL in (''P'',''A'')then',
'        ',
'        if pkg_cb_medidas_cautelares.fnc_vl_saldo_cartera_desembrgo ( p_tpo_crtra         => :P66_TPO_CRTRA,',
'                                                                      p_id_embrgos_crtra  => :P66_ID_EMBRGOS_CRTRA,',
'                                                                      p_cdgo_clnte        => :F_CDGO_CLNTE) > 0 then',
'            return ''El saldo de la cartera asociada al embargo debe estar en 0 para desembargar por este tipo de causal'';',
'        else',
'            return null;',
'        end if;',
'',
'    else',
'        return null;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_api.id(108556249010903340)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108555399810903331)
,p_name=>'Al cambiar'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P66_ID_CSLES_DSMBRGO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122610082033713923)
,p_event_id=>wwv_flow_api.id(108555399810903331)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P66_NMRO_DCMNTO,P66_FCHA_DCMNTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108555420198903332)
,p_event_id=>wwv_flow_api.id(108555399810903331)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108554857724903326)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar datos de json'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P66_JSON_RESOLUCIONES := V(''P42_JSON_RESOLUCIONES'');',
':P66_JSON_OFCIOS := V(''P42_JSON_OFCIOS'');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108556326487903341)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar desembargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cb_medidas_cautelares.prc_rg_desembargo_puntual (p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                     p_id_usuario           => :F_ID_USRIO,',
'                                                     p_id_csles_dsmbrgo     => :P66_ID_CSLES_DSMBRGO,',
'                                                     p_id_tpos_mdda_ctlar   => :P66_ID_TIPO_EMBARGO,',
'                                                     p_nmro_dcmnto          => :P66_NMRO_DCMNTO,',
'                                                     p_fcha_dcmnto          => :P66_FCHA_DCMNTO,',
'                                                     p_nmro_ofcio	        => :P66_NMRO_OFCIO,',
'                                                     p_vlor_dcmnto          => :P66_VLOR_DCMNTO,',
'                                                     p_observacion          => :P66_OBSERVACION,',
'                                                     p_id_plntlla_re        => :P66_ID_PLNTLLA_RSLCION,',
'                                                     p_id_plntlla_oe        => :P66_ID_PLNTLLA_OFICIO,',
'                                                     p_dsmbrgo_unico        => :P66_DESEMBARGO_UNICO,',
'                                                     p_tpo_dsmbrgo          => :P66_TIPO_DESEMBARGO,',
'                                                     p_json_rslciones       => :P66_JSON_RESOLUCIONES,',
'                                                     p_json_oficios         => :P66_JSON_OFCIOS);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(108556249010903340)
);
end;
/
