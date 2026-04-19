prompt --application/pages/page_00053
begin
wwv_flow_api.create_page(
 p_id=>53
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Proyecci\00F3n Acuerdo de Pago - Cuota Inicial')
,p_step_title=>unistr('Proyecci\00F3n Acuerdo de Pago - Cuota Inicial')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20220725153246'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95884539158384169)
,p_plug_name=>'Cuota Inicial'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(43441465037066295)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50984239243826232)
,p_plug_name=>'Cuota Inicial'
,p_parent_plug_id=>wwv_flow_api.id(95884539158384169)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142472627755342557)
,p_plug_name=>'Ayuda'
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
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="justify"> Proyecci\00F3n de Acuerdo de Pago.<br> '),
'        <b> <center> Paso 3 Cuota Inicial </center> </b> <br>',
'        Se muestra el % de la cuota inicial que esta parametrizado para el tipo de acuerdo de pago seleccionado. <br><br>',
'        Se muestra el valor que corresponde a la Cuota Inicial. <br><br>',
unistr('        Permite seleccionar la fecha l\00EDmite de Pago de la Cuota Inicial. <br><br>'),
'        Se puede imprimir el recibo de pago de la cuota Inicial.<br>   ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52434821361317861)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95884539158384169)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP,41,43,53,44,72::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52435615211317861)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(95884539158384169)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52435211759317861)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(95884539158384169)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(52446793894516373)
,p_branch_name=>'Go To Page 44 - Datos del Convenio'
,p_branch_action=>'f?p=&APP_ID.:44:&SESSION.:borrarColeccion:&DEBUG.::P44_VLOR_CTA_INCIAL:&P53_VLOR_CTA_INCIAL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(52435615211317861)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(52447092055519232)
,p_branch_name=>unistr('Ir a P\00E1gina 43 - Cartera')
,p_branch_action=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(52435211759317861)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17193941834139603)
,p_name=>'P53_INDCDOR_APLCA_DSCNTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33173282751297704)
,p_name=>'P53_VLOR_CTA_INCIAL_MSTRAR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_prompt=>'Cuota Inicial'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Valor en pesos de la cuota inicial seg\00FAn porcentaje ingresado.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33174529390297717)
,p_name=>'P53_VGNCIA_PRDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50984337491826233)
,p_name=>'P53_CTA_INCIAL_PRCNTJE_VGNCIA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_prompt=>'% Cuota'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cta_incial_prcntje_vgncia ',
'  from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P41_ID_CNVNIO_TPO;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>3
,p_cMaxlength=>3
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Porcentaje de la cuota inicial sobre el acuerdo de pago.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50984452976826234)
,p_name=>'P53_INDCDOR_LMTA_PRCNTJE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_prompt=>unistr('\00BFSe Limita el % de la Cuota Inicial?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el porcentaje de la cuota inicial puede variar o est\00E1 limitado.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50984542560826235)
,p_name=>'P53_LMTA_PRCNTJE_MIN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('% M\00EDnimo')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lmta_prcntje_mnmo',
'  from gf_d_convenios_tipo a',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P53_INDCDOR_LMTA_PRCNTJE'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Porcentaje m\00EDnimo de cuota inicial.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50984651039826236)
,p_name=>'P53_LMTA_PRCNTJE_MAX'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('% M\00E1ximo')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lmta_prcntje_mxmo',
'  from gf_d_convenios_tipo a',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P53_INDCDOR_LMTA_PRCNTJE'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Porcentaje m\00E1ximo de cuota inicial.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50984853150826238)
,p_name=>'P53_VLOR_CTA_INCIAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_source=>'-1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50984934800826239)
,p_name=>'P53_FCHA_PGO_CTA_INCIAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha L\00EDmite Pago ')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select fcha_lmte_cta_incial',
' from gf_g_proyecciones',
' where id_pryccion = :P41_ID_PRYCCION;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha l\00EDmite para pago de cuota inicial.')
,p_attribute_02=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50985453983826244)
,p_name=>'P53_NMRO_DCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52514355472153528)
,p_name=>'P53_NMRO_PRYCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Proyecci\00F3n')
,p_source=>'P41_NMRO_PRYCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P41_ID_PRYCCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de Proyecci\00F3n Registrada.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54618010193142103)
,p_name=>'P53_PRCNTJE_MXMO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54618122911142104)
,p_name=>'P53_PRCNTJE_CTA_INCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50984239243826232)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(33173882209297710)
,p_computation_sequence=>10
,p_computation_item=>'P53_CTA_INCIAL_PRCNTJE_VGNCIA'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cta_incial_prcntje_vgncia ',
'  from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P41_ID_CNVNIO_TPO;'))
,p_compute_when=>'P53_CTA_INCIAL_PRCNTJE_VGNCIA'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(33174392579297715)
,p_computation_sequence=>20
,p_computation_item=>'P53_INDCDOR_LMTA_PRCNTJE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_lmta_prcntje',
'  from gf_d_convenios_tipo ',
' where id_cnvnio_tpo = :P41_ID_CNVNIO_TPO;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(17193803112139602)
,p_computation_sequence=>30
,p_computation_item=>'P53_INDCDOR_APLCA_DSCNTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 	indcdor_aplca_dscnto ',
'from    gf_d_convenios_tipo',
'where   id_cnvnio_tpo = :P41_ID_CNVNIO_TPO;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(54618231703142105)
,p_computation_sequence=>40
,p_computation_item=>'P53_PRCNTJE_CTA_INCIAL'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select cta_incial_prcntje_vgncia from gf_d_convenios_tipo where id_cnvnio_tpo = :P41_ID_CNVNIO_TPO'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(14441352492001901)
,p_computation_sequence=>50
,p_computation_item=>'P53_VLOR_CTA_INCIAL'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_vlor_ttal_cnvnio      number;',
'    v_vlor_cta_incial       number;',
'	v_vlor_dscnto			number;',
'begin',
'',
'    v_vlor_ttal_cnvnio  := 0;',
'	v_vlor_dscnto		:= 0;',
'    v_vlor_cta_incial   := -1;',
'',
'    if :P43_VGNCIA_PRDO is not null and :P53_CTA_INCIAL_PRCNTJE_VGNCIA is not null then ',
'    ',
'    ',
'        v_vlor_cta_incial := pkg_gF_convenios.fnc_cl_cuota_inicial_convenio(p_cdgo_clnte                   =>   :F_CDGO_CLNTE,',
'                                                                            p_cdna			               =>   :P43_VGNCIA_PRDO,',
'                                                                            p_fcha_pgo_cta_incial          =>    nvl(:P53_FCHA_PGO_CTA_INCIAL, sysdate),',
'                                                                            p_cta_incial_prcntje_vgncia    =>   :P53_CTA_INCIAL_PRCNTJE_VGNCIA,',
'                                                                            p_indcdor_aplca_dscnto_cnvnio  =>   :P53_INDCDOR_APLCA_DSCNTO,',
'                                                                            p_indcdor_inslvncia            =>   NVL(:P43_INSLVNCIA, ''N''),      -- Insolvencia Acuerdo de Pago',
'                                                                            p_indcdor_clcla_intres         =>   NVL(:P43_CLCLA_INTRES, ''S'') ,   -- Insolvencia Acuerdo de Pago',
'                                                                            p_fcha_cngla_intres            =>   :P43_FCHA_CNGLA_INTRES         -- Insolvencia Acuerdo de Pago',
'                                                                           );   ',
'',
'    else',
'        v_vlor_cta_incial    := -999;',
'    end if;',
'     return v_vlor_cta_incial;',
'end ;',
' '))
,p_computation_error_message=>'Error al Calcular el valor de la cuota inicial. #SQLERRM#'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(33173597194297707)
,p_computation_sequence=>60
,p_computation_item=>'P53_VLOR_CTA_INCIAL_MSTRAR'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'to_char(:P53_VLOR_CTA_INCIAL, :F_FRMTO_MNDA)'
,p_computation_error_message=>'Error al calcular el valor de la cuota inicial diplay'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52512373740153508)
,p_validation_name=>'Validar % Cuota Inicial >0 and <= 100'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P53_CTA_INCIAL_PRCNTJE_VGNCIA >= :P53_PRCNTJE_CTA_INCIAL ',
'and :P53_CTA_INCIAL_PRCNTJE_VGNCIA < 100'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El % de la cuota inicial debe ser mayor o igual que &P53_PRCNTJE_CTA_INCIAL. y menor que 100.'
,p_always_execute=>'Y'
,p_validation_condition=>'P53_INDCDOR_LMTA_PRCNTJE'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(50984337491826233)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52512546128153510)
,p_validation_name=>'Validar % Cuota Inicial - Limite'
,p_validation_sequence=>30
,p_validation=>':P53_CTA_INCIAL_PRCNTJE_VGNCIA between :P53_LMTA_PRCNTJE_MIN  and :P53_LMTA_PRCNTJE_MAX'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('El % de la Cuota Inicial debe estar entre el % Min\00EDmo y % M\00E1ximo')
,p_always_execute=>'Y'
,p_validation_condition=>'P53_INDCDOR_LMTA_PRCNTJE'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(50984337491826233)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(92583705576225606)
,p_validation_name=>unistr('Fecha H\00E1bil')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_hbil            varchar2(1);',
'begin',
'        ',
'    v_hbil := pk_util_calendario.fnc_cl_fecha_habil(:F_CDGO_CLNTE, :P53_FCHA_PGO_CTA_INCIAL);',
'        ',
'    if v_hbil = ''S'' then ',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha Seleccionada no es h\00E1bil')
,p_when_button_pressed=>wwv_flow_api.id(52435615211317861)
,p_associated_item=>wwv_flow_api.id(50984934800826239)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(65765027166864613)
,p_validation_name=>unistr('Valida que la fecha de emisi\00F3n este dentro de un rango en la parametrizacion de tasas mora ')
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_fcha_vncmnto    date;',
'    v_fcha_vlda       varchar2(1);',
'begin',
'    begin',
'        select min(a.fcha_vncmnto) fcha_vncmnto',
'          into v_fcha_vncmnto',
'          from df_i_periodos       a',
'          join table( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna           => :P43_PRDOS ',
'                                                              , p_crcter_dlmtdor => '':'')) b on cdna is not null ',
'           and (a.vgncia||a.prdo) = b.cdna',
'         where cdgo_clnte           = :F_CDGO_CLNTE',
'           and id_impsto            = :P41_ID_IMPSTO',
'           and id_impsto_sbmpsto    = :P41_ID_IMPSTO_SBMPSTO;',
'    exception',
'        when others then ',
'            v_fcha_vncmnto := null;',
'            return false;',
'    end;',
'    ',
'    if v_fcha_vncmnto > sysdate then',
'        return true;',
'    else',
'        v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P41_ID_IMPSTO, :P53_FCHA_PGO_CTA_INCIAL);',
'    ',
'        if v_fcha_vlda = ''S'' then ',
'            return true;',
'        else ',
'            return false;',
'        end if;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'No hay tasas moras parametrizadas para la fecha',
'limite de pago de cuota inicial.'))
,p_associated_item=>wwv_flow_api.id(50984934800826239)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33174483602297716)
,p_validation_name=>'Validar si limita porcentaje'
,p_validation_sequence=>60
,p_validation=>':P53_CTA_INCIAL_PRCNTJE_VGNCIA between :P53_LMTA_PRCNTJE_MIN and :P53_LMTA_PRCNTJE_MAX'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El % de la cuota inicial debe estar entre el rango definido en el tipo de acuerdo de pago.'
,p_validation_condition=>'P53_INDCDOR_LMTA_PRCNTJE'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4312703736604505)
,p_validation_name=>'Validar que el Valor de la cuota inicial no sera nulo'
,p_validation_sequence=>70
,p_validation=>'P53_VLOR_CTA_INCIAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El valor de la cuota inicial debe ser mayor a cero (0).'
,p_when_button_pressed=>wwv_flow_api.id(52435615211317861)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4397585519263303)
,p_validation_name=>'Validar que el Valor de la cuota inicial sea mayor a cero'
,p_validation_sequence=>80
,p_validation=>':P53_VLOR_CTA_INCIAL > 0'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'El valor de la cuota inicial debe ser mayor a cero (0).'
,p_when_button_pressed=>wwv_flow_api.id(52435615211317861)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4397667526263304)
,p_name=>'Refrescar la pagina para calcular el valor de de la cuota inicial cuando se cambie la fecha limite de pago de la cuota inicial o el % de la cuota inicial'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P53_CTA_INCIAL_PRCNTJE_VGNCIA,P53_FCHA_PGO_CTA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_da_event_comment=>'Refrescar la pagina para calcular el valor de de la cuota inicial cuando se cambie la fecha limite de pago de la cuota inicial o el % de la cuota inicial'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4397701917263305)
,p_event_id=>wwv_flow_api.id(4397667526263304)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92583439421225603)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculo de Porcentaje de Cuota Inicial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct prcntje',
'  into :P53_CTA_INCIAL_PRCNTJE_VGNCIA',
'  from gf_g_pryccnes_cta_incl_vgnc ',
' where id_pryccion = :P41_ID_PRYCCION;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P41_ID_PRYCCION is not null and :P53_CTA_INCIAL_PRCNTJE_VGNCIA is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
end;
/
