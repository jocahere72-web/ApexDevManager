prompt --application/pages/page_00091
begin
wwv_flow_api.create_page(
 p_id=>91
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Informaci\00F3n Sujeto Tributo')
,p_step_title=>unistr('Informaci\00F3n Sujeto Tributo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200513173255'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34164898490231794)
,p_plug_name=>'Sujeto Tributo'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(19863316626456068)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P91_ID_TTLO_EJCTVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20214486588190018)
,p_plug_name=>'Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(34164898490231794)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39597192920276776)
,p_plug_name=>'Plugin Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(34164898490231794)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P91_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40236521703699613)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>    ',
'    <p align="justify">La funcionalidad sujeto tributo permite<br><br> ',
unistr('        <b>1.</b> Consultar sujeto tributo y visualizar la informaci\00F3n asociada a este.<br><br> '),
'        <b>2.</b> Crear sujeto tributo en caso de no existir.<br>',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>     '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41185788471272480)
,p_plug_name=>'Otros'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20359786849224958)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(20214486588190018)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>5
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20359354219224957)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(20214486588190018)
,p_button_name=>'BTN_CNSLTA_PRMTRO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Consulta por Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_VLDAR_CRTRA,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P91_ID_SJTO_IMPSTO,&P93_ID_IMPSTO.,N,&P93_ID_IMPSTO_SBMPSTO.,P93_ID_IMPSTO,P93_ID_IMPSTO_SBMPSTO'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20214568553190019)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(34164898490231794)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20214638185190020)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(34164898490231794)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_execute_validations=>'N'
,p_button_condition=>'P91_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20419815215863401)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(34164898490231794)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(20420249902863405)
,p_branch_name=>unistr('Ir a P\00E1gina 56 (Sujeto Tributo No Existente)')
,p_branch_action=>'f?p=&APP_ID.:56:&SESSION.:NUEVO:&DEBUG.:RP,56:P56_PGNA,P56_IMPSTO,P56_IDNTFCCION,P56_APPLCCION:&APP_PAGE_ID.,&P91_IMPUESTO.,&P91_IDENTIFICACION.,&APP_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(20359786849224958)
,p_branch_sequence=>20
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_si_i_sujetos_impuesto',
' where idntfccion_sjto = :P91_IDENTIFICACION'))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(20511133828041530)
,p_branch_name=>unistr('Ir a P\00E1gina 98')
,p_branch_action=>'f?p=&APP_ID.:98:&SESSION.:clear:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(20214638185190020)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(20511448064041533)
,p_branch_name=>unistr('Ir a P\00E1gina 89')
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP,91,93::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(20214568553190019)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(20419913239863402)
,p_branch_name=>unistr('Ir a P\00E1gina 93')
,p_branch_action=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(20419815215863401)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20215126315190025)
,p_name=>'P91_ID_SJTO_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20214486588190018)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20360148985224961)
,p_name=>'P91_IMPUESTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20214486588190018)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Seleccione el tributo a liquidar.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20360587645224965)
,p_name=>'P91_SUB_IMPUESTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20214486588190018)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Seleccione el Tributo de rentas varias a liquidar.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20360980185224965)
,p_name=>'P91_IDENTIFICACION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20214486588190018)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>18
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');""'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese identificaci\00F3n sujeto sobre quien recae la liquidaci\00F3n de renta.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21152263579070852)
,p_name=>'P91_INDCDOR_USA_EXTRNJRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_prompt=>'Extranjero'
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>'P93_INDCDOR_EXTRNJRO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Especifique si el sujeto de la liquidaci\00F3n de rentas es extranjero.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21152625245070859)
,p_name=>'P91_INDCDOR_USA_MXTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P93_INDCDOR_MXTO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Especifique si el origen del contrato de la liquidaci\00F3n de rentas es mixto.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21153028795070860)
,p_name=>'P91_VLOR_BSE_GRVBLE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_prompt=>'&P91_LBEL_BSE.'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>18
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Consiste en la base o monto para hallar el valor liquidado de la renta correspondiente, se tienen en cuenta cantidades, valores de acto y/o n\00FAmero de eventos.')
,p_attribute_01=>'0'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21153421492070861)
,p_name=>'P91_LBEL_FCHA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21153832383070861)
,p_name=>'P91_ID_ORGEN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21154269591070862)
,p_name=>'P91_INDCDOR_EXTRNJRO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21154627440070862)
,p_name=>'P91_INDCDOR_MXTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40650979514356909)
,p_name=>'P91_FCHA_LQDCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Seleccione la fecha de liquidaci\00F3n de la renta correspondiente.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40651096727356910)
,p_name=>'P91_FCHA_MXMA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40651257461356912)
,p_name=>'P91_FCHA_EXPDCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(41185788471272480)
,p_prompt=>'Fecha de &P93_LBEL_FCHA.'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>13
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_display_when=>'P93_FCHA_EXPDCION'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la Fecha en que se se gener\00F3 el acto.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46413605480116001)
,p_name=>'P91_LBEL_BSE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20214486588190018)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(40651131125356911)
,p_computation_sequence=>10
,p_computation_item=>'P91_FCHA_MXMA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(a.fcha)',
'  from df_c_calendario_general a',
unistr('  join v_df_i_impuestos_acto_concepto b on a.a\00F1o = b.vgncia'),
'                                        and a.mes = b.prdo',
'  join json_table(:P93_CNCPTOS, ''$[*]'' columns id_impsto_acto_cncpto path ''$.ID_IMPSTO_ACTO_CNCPTO'') c on b.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto',
'   and a.indcdor_lboral = ''S'''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(46413884451116003)
,p_computation_sequence=>10
,p_computation_item=>'P91_LBEL_BSE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_lbel_bse      varchar2(100);',
'begin',
'    if (:P93_LQDCION_MTPLE = ''N'') then',
'        select (txto_bse_grvble)',
'          into v_lbel_bse',
'          from df_i_impuestos_acto',
'         where id_impsto = :P91_IMPUESTO',
'           and id_impsto_sbmpsto = :P91_SUB_IMPUESTO',
'           and id_impsto_acto = :P93_ID_IMPSTO_ACTO;',
'    else',
'        select (a.txto_bse_grvble)',
'          into v_lbel_bse',
'          from df_i_impuestos_acto a',
'          join json_table (:P93_ACTOS, ''$[*]'' columns id_impsto_acto path ''$.ID_IMPSTO_ACTO'') b on a.id_impsto_acto = b.id_impsto_acto',
'         where id_impsto = :P91_IMPUESTO',
'           and id_impsto_sbmpsto = :P91_SUB_IMPUESTO',
'           and rownum = 1;',
'    end if;',
'    return v_lbel_bse;',
'end;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20508253869041501)
,p_validation_name=>unistr('Validaci\00F3n Tributo')
,p_validation_sequence=>10
,p_validation=>'P91_IMPUESTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione Tributo!')
,p_when_button_pressed=>wwv_flow_api.id(20359786849224958)
,p_associated_item=>wwv_flow_api.id(20360148985224961)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20508309880041502)
,p_validation_name=>unistr('Validaci\00F3n Sujeto')
,p_validation_sequence=>20
,p_validation=>'P91_IDENTIFICACION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Ingrese Identificaci\00F3n!')
,p_when_button_pressed=>wwv_flow_api.id(20359786849224958)
,p_associated_item=>wwv_flow_api.id(20360980185224965)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20512842812041547)
,p_validation_name=>unistr('Validaci\00F3n Extranjero')
,p_validation_sequence=>30
,p_validation=>'P91_INDCDOR_USA_EXTRNJRO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione si es Extranjero!')
,p_validation_condition=>'P93_INDCDOR_EXTRNJRO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(20214638185190020)
,p_associated_item=>wwv_flow_api.id(21152263579070852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20512962347041548)
,p_validation_name=>unistr('Validaci\00F3n Mixto')
,p_validation_sequence=>40
,p_validation=>'P91_INDCDOR_USA_MXTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione si liquidaci\00F3n es mixta!')
,p_validation_condition=>'P93_INDCDOR_MXTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(20214638185190020)
,p_associated_item=>wwv_flow_api.id(21152625245070859)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20513095419041549)
,p_validation_name=>unistr('Validaci\00F3n Base Gravable')
,p_validation_sequence=>50
,p_validation=>'P91_VLOR_BSE_GRVBLE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Ingrese la base gravable!')
,p_when_button_pressed=>wwv_flow_api.id(20214638185190020)
,p_associated_item=>wwv_flow_api.id(21153028795070860)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20508566625041504)
,p_name=>'Existe Sujeto'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(20359786849224958)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20508786017041506)
,p_event_id=>wwv_flow_api.id(20508566625041504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select id_sjto_impsto',
'     into :P91_ID_SJTO_IMPSTO',
'     from v_si_i_sujetos_impuesto',
'    where cdgo_clnte = :F_CDGO_CLNTE',
'      and idntfccion_sjto = :P91_IDENTIFICACION',
'      and id_impsto = :P91_IMPUESTO;',
'exception ',
'    when others then',
'        :P91_ID_SJTO_IMPSTO := null;',
'end;'))
,p_attribute_02=>'P91_IDENTIFICACION'
,p_attribute_03=>'P91_ID_SJTO_IMPSTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20508621716041505)
,p_event_id=>wwv_flow_api.id(20508566625041504)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P91_ID_SJTO_IMPSTO'')){',
'    apex.page.submit( "BTN_CONSULTAR" );',
'}else{',
unistr('    apex.message.confirm ("\00BFDesea Registrar Sujeto Tributo?" , function( Aceptar ){'),
'        if(Aceptar){',
'            apex.page.submit( "BTN_CONSULTAR" );            ',
'        }',
'    });',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(20420092776863403)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Obtener Informaci\00F3n Sujeto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select id_sjto_impsto',
'     into :P91_ID_SJTO_IMPSTO',
'     from v_si_i_sujetos_impuesto',
'    where cdgo_clnte = :F_CDGO_CLNTE',
'      and id_impsto = :P91_IMPUESTO',
'      and idntfccion_sjto = :P91_IDENTIFICACION;',
'exception ',
'    when others then',
'        :P91_ID_SJTO_IMPSTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(20359786849224958)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59663412698251601)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Sujeto Tributo Existente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(2000); ',
'begin    ',
'    pkg_si_sujeto_impuesto.prc_rg_sjto_impsto_exstnte( p_cdgo_clnte       =>    :F_CDGO_CLNTE',
'                                                     , p_idntfccion       =>    :P91_IDENTIFICACION',
'                                                     , p_impsto           =>    :P91_IMPUESTO',
'                                                     , p_id_usrio         =>    :F_ID_USRIO',
'                                                     , o_id_sjto_impsto   =>    :P91_ID_SJTO_IMPSTO  ',
'                                                     , o_cdgo_rspsta      =>    v_cdgo_rspsta',
'                                                     , o_mnsje_rspsta     =>    v_mnsje_rspsta);',
'    if(v_cdgo_rspsta <> 0) then',
'        raise_application_error(-20001, v_mnsje_rspsta);   ',
'    end if;   ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(20359786849224958)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_si_i_sujetos_impuesto',
' where id_impsto <> :P91_IMPUESTO',
'   and idntfccion_sjto = :P91_IDENTIFICACION'))
,p_process_when_type=>'EXISTS'
);
end;
/
