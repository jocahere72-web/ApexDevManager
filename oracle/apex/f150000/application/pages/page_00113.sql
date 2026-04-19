prompt --application/pages/page_00113
begin
wwv_flow_api.create_page(
 p_id=>113
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Cuota Inicial - Proyecci\00F3n Acuerdo de Pago')
,p_step_title=>unistr('Cuota Inicial - Proyecci\00F3n Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200612121701'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168784935350591375)
,p_plug_name=>'Cuota Inicial'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(72870253246195914)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123884635436033438)
,p_plug_name=>'Cuota Inicial'
,p_parent_plug_id=>wwv_flow_api.id(168784935350591375)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(215373023947549763)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(72900928110207208)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(168784935350591375)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCEL'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72901372820207208)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(168784935350591375)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72901735563207208)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(168784935350591375)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72917206239207247)
,p_branch_name=>unistr('Ir a la P\00E1gina 114 - Plan de Pago')
,p_branch_action=>'f?p=&APP_ID.:114:&SESSION.:borrarColeccion:&DEBUG.::P114_VLOR_CTA_INCIAL:&P113_VLOR_CTA_INCIAL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72901372820207208)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72917671845207247)
,p_branch_name=>unistr('Ir a P\00E1gina 112 - Cartera')
,p_branch_action=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72901735563207208)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70821695667843737)
,p_branch_name=>unistr('Ir a P\00E1gina 110 - Inicio')
,p_branch_action=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,111,112,113,114,115::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72900928110207208)
,p_branch_sequence=>50
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72902420916207209)
,p_name=>'P113_PRCNTJE_CTA_INCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72902811466207209)
,p_name=>'P113_NMRO_PRYCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Proyecci\00F3n')
,p_source=>'P111_NMRO_PRYCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P111_ID_PRYCCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de Proyecci\00F3n Registrada.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72903704027207210)
,p_name=>'P113_INDCDOR_LMTA_PRCNTJE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Indica si el porcentaje de la cuota inicial puede variar o est\00E1 limitado.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72904610862207211)
,p_name=>'P113_CTA_INCIAL_PRCNTJE_VGNCIA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_prompt=>'% Cuota'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cta_incial_prcntje_vgncia ',
'  from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P111_ID_CNVNIO_TPO;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>3
,p_cMaxlength=>3
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Porcentaje de la cuota inicial sobre el acuerdo de pago.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72905559658207224)
,p_name=>'P113_LMTA_PRCNTJE_MIN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('% M\00EDnimo')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lmta_prcntje_mnmo',
'  from gf_d_convenios_tipo a',
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P113_INDCDOR_LMTA_PRCNTJE'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Porcentaje m\00EDnimo de cuota inicial.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72906459143207230)
,p_name=>'P113_LMTA_PRCNTJE_MAX'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('% M\00E1ximo')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lmta_prcntje_mxmo',
'  from gf_d_convenios_tipo a',
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P113_INDCDOR_LMTA_PRCNTJE'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Porcentaje m\00E1ximo de cuota inicial.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72907324710207231)
,p_name=>'P113_FCHA_PGO_CTA_INCIAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha L\00EDmite Pago ')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select fcha_lmte_cta_incial',
' from gf_g_proyecciones',
' where id_pryccion = :P111_ID_PRYCCION;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha l\00EDmite para pago de cuota inicial.')
,p_attribute_02=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72908215297207232)
,p_name=>'P113_VLOR_CTA_INCIAL_MSTRAR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_prompt=>'Cuota Inicial'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Valor en pesos de la cuota inicial seg\00FAn porcentaje ingresado.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72909113579207232)
,p_name=>'P113_VLOR_CTA_INCIAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_source=>'-1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72909582630207232)
,p_name=>'P113_NMRO_DCMNTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72909968949207232)
,p_name=>'P113_VGNCIA_PRDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72910386196207233)
,p_name=>'P113_PRCNTJE_MXMO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(123884635436033438)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72911974378207235)
,p_computation_sequence=>10
,p_computation_item=>'P113_CTA_INCIAL_PRCNTJE_VGNCIA'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cta_incial_prcntje_vgncia ',
'  from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P111_ID_CNVNIO_TPO;'))
,p_compute_when=>'P113_CTA_INCIAL_PRCNTJE_VGNCIA'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72912365834207235)
,p_computation_sequence=>20
,p_computation_item=>'P113_INDCDOR_LMTA_PRCNTJE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_lmta_prcntje',
'  from gf_d_convenios_tipo ',
' where id_cnvnio_tpo = :P111_ID_CNVNIO_TPO;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72912750295207236)
,p_computation_sequence=>30
,p_computation_item=>'P113_PRCNTJE_CTA_INCIAL'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select cta_incial_prcntje_vgncia from gf_d_convenios_tipo where id_cnvnio_tpo = :P111_ID_CNVNIO_TPO'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72911123504207235)
,p_computation_sequence=>40
,p_computation_item=>'P113_VLOR_CTA_INCIAL'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_vlor_ttal_cnvnio      number;',
'    v_vlor_cta_incial       number;',
'',
'begin',
'',
'    v_vlor_ttal_cnvnio  := 0;',
'    v_vlor_cta_incial   := -1;',
'',
'    if :P112_VGNCIA_PRDO is not null and :P113_CTA_INCIAL_PRCNTJE_VGNCIA is not null then ',
'        for c_crtra in (select vlor_sldo_cptal,',
'                                 case when gnra_intres_mra = ''S'' then ',
'                                        pkg_gf_movimientos_financiero.fnc_cl_interes_mora (  p_cdgo_clnte         =>  a.cdgo_clnte,',
'                                                                                             p_id_impsto          =>  a.id_impsto,',
'                                                                                             p_id_impsto_sbmpsto  =>  a.id_impsto_sbmpsto,',
'                                                                                             p_vgncia             =>  a.vgncia,',
'                                                                                             p_id_prdo            =>  a.id_prdo,',
'                                                                                             p_id_cncpto          =>  a.id_cncpto,',
'                                                                                             p_cdgo_mvmnto_orgn   =>  a.cdgo_mvmnto_orgn,',
'                                                                                             p_id_orgen           =>  a.id_orgen,',
'                                                                                             p_vlor_cptal         =>  a.vlor_sldo_cptal ,',
'                                                                                             p_indcdor_clclo      =>  ''CLD'',',
'                                                                                             p_fcha_pryccion      =>  nvl(:P113_FCHA_PGO_CTA_INCIAL, sysdate) )',
'                                    else',
'                                        0',
'                                   end as vlor_intres',
'                               from v_gf_g_cartera_x_concepto       a',
'                               join table( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna           => :P112_VGNCIA_PRDO ',
'                                                                                   , p_crcter_dlmtdor => '':'')) b on cdna is not null ',
'                                and (a.vgncia||a.prdo||a.cdgo_mvmnto_orgn||id_orgen) = b.cdna',
'                       )   loop',
'',
'            v_vlor_ttal_cnvnio := v_vlor_ttal_cnvnio + (c_crtra.vlor_sldo_cptal + c_crtra.vlor_intres) ;',
'        end loop;',
'         v_vlor_cta_incial := trunc(v_vlor_ttal_cnvnio * (:P113_CTA_INCIAL_PRCNTJE_VGNCIA / 100));',
'    else',
'        v_vlor_cta_incial    := -999;',
'    end if;',
'     return v_vlor_cta_incial;',
'end ;'))
,p_computation_error_message=>'Error al Calcular el valor de la cuota inicial. #SQLERRM#'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72911556614207235)
,p_computation_sequence=>50
,p_computation_item=>'P113_VLOR_CTA_INCIAL_MSTRAR'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'to_char(:P113_VLOR_CTA_INCIAL, :F_FRMTO_MNDA)'
,p_computation_error_message=>'Error al calcular el valor de la cuota inicial diplay'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72914361054207243)
,p_validation_name=>'Validar % Cuota Inicial >0 and <= 100'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P113_CTA_INCIAL_PRCNTJE_VGNCIA >= :P113_PRCNTJE_CTA_INCIAL ',
'and :P113_CTA_INCIAL_PRCNTJE_VGNCIA < 100'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El % de la cuota inicial debe ser mayor o igual que &P113_PRCNTJE_CTA_INCIAL. y menor que 100.'
,p_always_execute=>'Y'
,p_validation_condition=>'P113_INDCDOR_LMTA_PRCNTJE'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(72904610862207211)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72914745039207245)
,p_validation_name=>'Validar % Cuota Inicial - Limite'
,p_validation_sequence=>30
,p_validation=>':P113_CTA_INCIAL_PRCNTJE_VGNCIA between :P113_LMTA_PRCNTJE_MIN  and :P113_LMTA_PRCNTJE_MAX'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('El % de la Cuota Inicial debe estar entre el % Min\00EDmo y % M\00E1ximo')
,p_always_execute=>'Y'
,p_validation_condition=>'P113_INDCDOR_LMTA_PRCNTJE'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(72904610862207211)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72915560193207245)
,p_validation_name=>unistr('Fecha H\00E1bil')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_hbil            varchar2(1);',
'begin',
'        ',
'    v_hbil := pk_util_calendario.fnc_cl_fecha_habil(:F_CDGO_CLNTE, :P113_FCHA_PGO_CTA_INCIAL);',
'        ',
'    if v_hbil = ''S'' then ',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha Seleccionada no es h\00E1bil')
,p_when_button_pressed=>wwv_flow_api.id(72901372820207208)
,p_associated_item=>wwv_flow_api.id(72907324710207231)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72915159663207245)
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
'          join table( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna           => :P112_PRDOS ',
'                                                              , p_crcter_dlmtdor => '':'')) b on cdna is not null ',
'           and (a.vgncia||a.prdo) = b.cdna',
'         where cdgo_clnte           = :F_CDGO_CLNTE',
'           and id_impsto            = :P111_ID_IMPSTO',
'           and id_impsto_sbmpsto    = :P111_ID_IMPSTO_SBMPSTO;',
'    exception',
'        when others then ',
'            v_fcha_vncmnto := null;',
'            return false;',
'    end;',
'    ',
'    if v_fcha_vncmnto > sysdate then',
'        return true;',
'    else',
'        v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P111_ID_IMPSTO, :P113_FCHA_PGO_CTA_INCIAL);',
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
,p_associated_item=>wwv_flow_api.id(72907324710207231)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72913938300207243)
,p_validation_name=>'Validar si limita porcentaje'
,p_validation_sequence=>60
,p_validation=>':P113_CTA_INCIAL_PRCNTJE_VGNCIA between :P113_LMTA_PRCNTJE_MIN and :P113_LMTA_PRCNTJE_MAX'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El % de la cuota inicial debe estar entre el rango definido en el tipo de acuerdo de pago.'
,p_validation_condition=>'P113_INDCDOR_LMTA_PRCNTJE'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72913150836207236)
,p_validation_name=>'Validar que el Valor de la cuota inicial no sera nulo'
,p_validation_sequence=>70
,p_validation=>'P113_VLOR_CTA_INCIAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El valor de la cuota inicial debe ser mayor a cero (0).'
,p_when_button_pressed=>wwv_flow_api.id(72901372820207208)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72913566712207242)
,p_validation_name=>'Validar que el Valor de la cuota inicial sea mayor a cero'
,p_validation_sequence=>80
,p_validation=>'P113_VLOR_CTA_INCIAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El valor de la cuota inicial debe ser mayor a cero (0).'
,p_when_button_pressed=>wwv_flow_api.id(72901372820207208)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72916254042207246)
,p_name=>'Refrescar la pagina para calcular el valor de de la cuota inicial cuando se cambie la fecha limite de pago de la cuota inicial o el % de la cuota inicial'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P113_CTA_INCIAL_PRCNTJE_VGNCIA,P113_FCHA_PGO_CTA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_da_event_comment=>'Refrescar la pagina para calcular el valor de de la cuota inicial cuando se cambie la fecha limite de pago de la cuota inicial o el % de la cuota inicial'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72916769925207247)
,p_event_id=>wwv_flow_api.id(72916254042207246)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72915852933207245)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculo de Porcentaje de Cuota Inicial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct prcntje',
'  into :P113_CTA_INCIAL_PRCNTJE_VGNCIA',
'  from gf_g_pryccnes_cta_incl_vgnc ',
' where id_pryccion = :P111_ID_PRYCCION;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P111_ID_PRYCCION is not null and :P113_CTA_INCIAL_PRCNTJE_VGNCIA is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
end;
/
