prompt --application/pages/page_00153
begin
wwv_flow_api.create_page(
 p_id=>153
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Gesti\00F3n Esquema Tarifa V2')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n Esquema Tarifa V2')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* #P43_INDCDOR_USA_BSE_VSBLE{',
'    pointer-events: none;',
'}*/'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_protection_level=>'C'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20250527150646'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(174466570824774634)
,p_plug_name=>'Tarifa Esquema'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2656559625130883)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(174466570824774634)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P153_ID_TRFA_ESQMA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2656910305130883)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(174466570824774634)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2657359681130883)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(174466570824774634)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea eliminar el registro?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P153_ID_TRFA_ESQMA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2657747274130883)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(174466570824774634)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P153_ID_TRFA_ESQMA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2692034685130904)
,p_branch_name=>'Go To Page 151'
,p_branch_action=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'SAVE,CREATE,DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2658126507130884)
,p_name=>'P153_ID_TRFA_ESQMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_TRFA_ESQMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2658549807130884)
,p_name=>'P153_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2658930968130884)
,p_name=>'P153_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicial'
,p_source=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>2
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha inicial.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2659835431130885)
,p_name=>'P153_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Final'
,p_source=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha final.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2660732276130885)
,p_name=>'P153_INDCDR_USA_FCHA_LQDCION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFUsa Fecha Liquidaci\00F3n?')
,p_source=>'INDCDR_USA_FCHA_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica qu\00E9 fecha se aplicar\00E1 para la busqueda de indicadores economicos. Si es S\00ED: se toma la fecha de la liquidacion,si es No: se utilizar\00E1 la fecha 01/01 y la vigencia que se esta liquidando.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2661605323130887)
,p_name=>'P153_CDGO_RDNDEO_EXPRSION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'SRDNDEO'
,p_prompt=>'Redondeo'
,p_source=>'CDGO_RDNDEO_EXPRSION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_EXPRESION_REDONDEO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_rdndeo_exprsion as r',
'  from df_s_redondeos_expresion',
' order by 1'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el valor de redondeo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2662558318130887)
,p_name=>'P153_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_02=>'4'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2663498322130888)
,p_name=>'P153_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_IMPSTO_SBMPSTO  as d,',
'       ID_IMPSTO_SBMPSTO as r',
'  from DF_I_IMPUESTOS_SUBIMPUESTO',
' where  ID_IMPSTO = :P153_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P153_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el subtributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2664334399130888)
,p_name=>'P153_ID_IMPSTO_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Acto'
,p_source=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || a.cdgo_impsto_acto || ''] '' || a.nmbre_impsto_acto d',
'        , a.id_impsto_acto',
'     from df_i_impuestos_acto   a',
'    where a.id_impsto           = :P153_ID_IMPSTO',
'      and a.id_impsto_sbmpsto   = :P153_ID_IMPSTO_SBMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P153_ID_IMPSTO,P153_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2664780624130889)
,p_name=>'P153_ID_CNCPTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Concepto'
,p_source=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion || ''['' || a.cdgo_cncpto || '']''    d',
'        , a.id_cncpto                                   r',
'     from df_i_conceptos        a',
'    where a.cdgo_clnte          = :F_CDGO_CLNTE',
'      and a.id_impsto           = :P153_ID_IMPSTO',
'      and a.cdgo_cncpto_tpo     = ''DBT''',
'      and a.ctgria_cncpto       = ''C''',
'      and a.actvo               = ''S''',
'      and a.id_cncpto           in (select id_cncpto ',
'                                      from v_df_i_impuestos_acto_concepto  m',
'                                     where cdgo_clnte                      = :F_CDGO_CLNTE',
'                                       and id_impsto                       = :P153_ID_IMPSTO',
'                                       and id_impsto_sbmpsto               = :P153_ID_IMPSTO_SBMPSTO',
'                                       and id_impsto_acto                  = :P153_ID_IMPSTO_ACTO)',
' order by a.cdgo_clnte',
'        , a.id_impsto',
'        , a.dscrpcion'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P153_ID_IMPSTO,P153_ID_IMPSTO_SBMPSTO,P153_ID_IMPSTO_ACTO'
,p_ajax_items_to_submit=>'P153_ID_IMPSTO,P153_ID_IMPSTO_SBMPSTO,P153_ID_IMPSTO_ACTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el concepto del acto.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2665601446130890)
,p_name=>'P153_ID_CNCPTO_BSE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Concepto Base'
,p_source=>'ID_CNCPTO_BSE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion || ''['' || a.cdgo_cncpto || '']''    d',
'        , a.id_cncpto                                   r',
'     from df_i_conceptos        a',
'    where a.cdgo_clnte          = :F_CDGO_CLNTE',
'      and a.id_impsto           = :P153_ID_IMPSTO',
'      and a.cdgo_cncpto_tpo     = ''DBT''',
'      and a.ctgria_cncpto       = ''C''',
'      and a.actvo               = ''S''',
'      and a.id_cncpto           in (select id_cncpto ',
'                                      from v_df_i_impuestos_acto_concepto  m',
'                                     where cdgo_clnte                      = :F_CDGO_CLNTE',
'                                       and id_impsto                       = :P153_ID_IMPSTO',
'                                       and id_impsto_sbmpsto               = :P153_ID_IMPSTO_SBMPSTO',
'                                       and id_impsto_acto                  = :P153_ID_IMPSTO_ACTO)',
'      and a.id_cncpto           != :P153_ID_CNCPTO',
' order by a.cdgo_clnte',
'        , a.id_impsto',
'        , a.dscrpcion'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P153_ID_IMPSTO,P153_ID_IMPSTO_SBMPSTO,P153_ID_IMPSTO_ACTO,P153_ID_CNCPTO'
,p_ajax_items_to_submit=>'P153_ID_IMPSTO,P153_ID_IMPSTO_SBMPSTO,P153_ID_IMPSTO_ACTO,P153_ID_CNCPTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la base del concepto del acto.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2666554736130890)
,p_name=>'P153_VLOR_TRFA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor Tarifa'
,p_source=>'VLOR_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_cMaxlength=>20
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el valor de la tarifa'
,p_attribute_02=>'100000000'
,p_attribute_03=>'0'
,p_attribute_07=>','
,p_attribute_09=>'5'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'1'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2667426254130890)
,p_name=>'P153_DVSOR_TRFA'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Divisor Tarifa'
,p_source=>'DVSOR_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Sin Divisor;1,10;10,100;100,1000;1000'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Ingrese el divisor de la tarifa, en t\00E9rminos de unidades de 1000. Ejemplo 100')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2668358613130891)
,p_name=>'P153_CDGO_INDCDOR_TPO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Indicador Econ\00F3mico')
,p_source=>'CDGO_INDCDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_INDICADORES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_indcdor_tpo',
'        , cdgo_indcdor_tpo',
'     from df_s_indicadores_tipo',
' order by nmbre_indcdor_tpo'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de indicador econ\00F3mico')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2669223280130891)
,p_name=>'P153_TXTO_TRFA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('F\00F3rmula de Tarifa')
,p_source=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P153_VLOR_TRFA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Explica la f\00F3rmula de la tarifa')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2670182960130892)
,p_name=>'P153_INDCDOR_USA_BSE'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFUsa Base?')
,p_source=>'INDCDOR_USA_BSE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para esquemas que utlizan base y "No" para esquemas que no requieren base')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2671015527130892)
,p_name=>'P153_INDCDOR_BSE_USA_VLOR_FJO'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFBase usa valor fijo?')
,p_source=>'INDCDOR_BSE_USA_VLOR_FJO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2671499093130892)
,p_name=>'P153_CDGO_INDCDOR_TPO_BSE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Indicador Econ\00F3mico')
,p_source=>'CDGO_INDCDOR_TPO_BSE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_INDICADORES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_indcdor_tpo',
'        , cdgo_indcdor_tpo',
'     from df_s_indicadores_tipo',
' order by nmbre_indcdor_tpo'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2671864131130893)
,p_name=>'P153_BSE_INCIAL'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Base Inicial'
,p_source=>'BSE_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>20
,p_cMaxlength=>16
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la base inicial.'
,p_attribute_02=>'100000000000000'
,p_attribute_03=>'0'
,p_attribute_07=>','
,p_attribute_08=>','
,p_attribute_09=>'5'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2672738459130893)
,p_name=>'P153_BSE_FNAL'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Base Final'
,p_source=>'BSE_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>20
,p_cMaxlength=>16
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la base final.'
,p_attribute_02=>'100000000000000'
,p_attribute_03=>'0'
,p_attribute_07=>','
,p_attribute_08=>','
,p_attribute_09=>'5'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2673679363130893)
,p_name=>'P153_INDCDOR_LQDCION_USA_VLOR_FJO'
,p_is_required=>true
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFLiquidaci\00F3n usa valor fijo?')
,p_source=>'INDCDOR_LQDCION_USA_VLOR_FJO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2674031175130894)
,p_name=>'P153_CDGO_INDCDOR_TPO_LQDCCION'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Indicador Econ\00F3mico')
,p_source=>'CDGO_INDCDOR_TPO_LQDCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_INDICADORES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_indcdor_tpo',
'        , cdgo_indcdor_tpo',
'     from df_s_indicadores_tipo',
' order by nmbre_indcdor_tpo'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2674439690130894)
,p_name=>'P153_LQDCION_MNMA'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Liquidaci\00F3n M\00EDnima')
,p_source=>'LQDCION_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>20
,p_cMaxlength=>16
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el valor de la liquidaci\00F3n m\00EDnima.')
,p_attribute_02=>'100000000000000'
,p_attribute_03=>'0'
,p_attribute_07=>','
,p_attribute_08=>','
,p_attribute_09=>'5'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2675300464130895)
,p_name=>'P153_LQDCION_MXMA'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Liquidaci\00F3n M\00E1xima')
,p_source=>'LQDCION_MXMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>20
,p_cMaxlength=>16
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el valor de la liquidaci\00F3n m\00E1xima.')
,p_attribute_02=>'100000000000000'
,p_attribute_03=>'0'
,p_attribute_07=>','
,p_attribute_08=>','
,p_attribute_09=>'5'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2676270253130895)
,p_name=>'P153_ID_TP_BS_SNCN_DCL_VGN_FRM'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Declaraci\00F3n Vigencia Formulario')
,p_source=>'ID_TP_BS_SNCN_DCL_VGN_FRM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper( a.dscrpcion || '' ''|| b.vgncia ||''-''|| e.prdo ||'' ''|| d.dscrpcion ||'' ''|| g.dscrpcion ) as d',
'        , f.id_tp_bs_sncn_dcl_vgn_frm as r',
'     from gi_d_declaraciones_tipo     a',
'     join gi_d_dclrcnes_tpos_vgncias  b on a.id_dclrcn_tpo                 = b.id_dclrcn_tpo',
'     join gi_d_dclrcnes_vgncias_frmlr c on b.id_dclrcion_tpo_vgncia        = c.id_dclrcion_tpo_vgncia',
'     join df_s_periodicidad           d on a.cdgo_prdcdad                  = d.cdgo_prdcdad',
'     join df_i_periodos               e on b.id_prdo                       = e.id_prdo',
'     join fi_d_tp_bs_sncn_dcl_vgn_frm f on c.id_dclrcion_vgncia_frmlrio    = f.id_dclrcion_vgncia_frmlrio',
'     join fi_d_tipo_base_sancion      g on f.id_tpo_bse_sncion             = g.id_tpo_bse_sncion',
'    where a.cdgo_clnte                = :F_CDGO_CLNTE ',
'      and a.actvo                     = ''S''',
' order by d.dscrpcion',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de indicador econ\00F3mico')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10736233273457701)
,p_name=>'P153_INDCDOR_UTLZA_BSE_PNTUAL'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFUsa Base Puntual?')
,p_source=>'INDCDOR_UTLZA_BSE_PNTUAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si, al momento de liquidar, se utiliza una base espec\00EDfica para el concepto. Es decir, en el caso de rentas, no se toma la base general de la liquidaci\00F3n, sino una base puntual asignada al concepto. Estos conceptos deben marcarse como obligato')
||unistr('rios en "Acto Concepto". Si no se van a liquidar, la base debe registrarse como cero para evitar su liquidaci\00F3n.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10738463972457723)
,p_name=>'P153_INDCDOR_RQRE_FCTOR'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFRequiere Factor?')
,p_source=>'INDCDOR_RQRE_FCTOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si, al momento de liquidar, se utiliza un factor para calcular el valor de la liquidaci\00F3n.  Ademas de utlizar la base y la tarifa, se necesita un tercer factor.  Ejemplo : Base * Tarifa * Factor (puede ser la cantidad).')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30081040455670505)
,p_name=>'P153_INDCDOR_ECNMCO_ACTUAL'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFUsa valor indicador econ\00F3mico actual?')
,p_source=>'INDCDOR_ECNMCO_ACTUAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Seleccione "S\00ED" para usar el valor de los indicadores econ\00F3micos de la vigencia actual. <br>'),
unistr('Seleccione "No" para usar el valor de los indicadores econ\00F3micos de la vigencia en gesti\00F3n, la cual corresponde al rango de fecha; Fecha Inicial y Fecha Final.'),
''))
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(163686593364149509)
,p_name=>'P153_PRCNTJE_BSE_LQDCION'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(174466570824774634)
,p_use_cache_before_default=>'NO'
,p_item_default=>'100'
,p_prompt=>unistr('% Base Liquidaci\00F3n')
,p_source=>'PRCNTJE_BSE_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>15
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el valor del porcentaje de la base con la que se va a calcular la tarifa.  Ej: Si la base es del 10.000.000 y se va a liquidar en base a los 10.000.000, el porcentaje a parametrizar es 100. Si la base es 10.000.000 pero se va a liquidar en ba'
||'se a 3.000.000, el porcentaje a parametrizar es 30.'
,p_attribute_02=>'100'
,p_attribute_03=>'1'
,p_attribute_07=>','
,p_attribute_09=>'0'
,p_attribute_13=>'1'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2679667951130897)
,p_validation_name=>'P153_FCHA_INCIAL must be timestamp'
,p_validation_sequence=>170
,p_validation=>'P153_FCHA_INCIAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(2658930968130884)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2680050813130898)
,p_validation_name=>'P153_FCHA_FNAL must be timestamp'
,p_validation_sequence=>180
,p_validation=>'P153_FCHA_FNAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(2659835431130885)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2678448370130896)
,p_validation_name=>'Valida_fecha_final'
,p_validation_sequence=>190
,p_validation=>' to_date(:P153_FCHA_INCIAL,''dd/mm/rr'')  < to_date(:P153_FCHA_FNAL, ''dd/mm/rr'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La Fecha Final no puede ser menor o igual que la Fecha Inicial'
,p_associated_item=>wwv_flow_api.id(2659835431130885)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2678867076130897)
,p_validation_name=>'Validacion'
,p_validation_sequence=>200
,p_validation=>'to_number(nvl(:P153_BSE_INCIAL,0), ''999G999G999G999G999G999G999D00000'') <= to_number(nvl(:P153_BSE_FNAL,0), ''999G999G999G999G999G999G999D00000'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Base Final no puede ser menor que Base Inicial'
,p_associated_item=>wwv_flow_api.id(2672738459130893)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2679273111130897)
,p_validation_name=>'Validacion_Liq_Maxima'
,p_validation_sequence=>210
,p_validation=>'to_number(nvl(:P153_LQDCION_MNMA,0), ''999G999G999G999G999G999G999D00000'') <= to_number(nvl(:P153_LQDCION_MXMA,0), ''999G999G999G999G999G999G999D00000'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Liquidaci\00F3n Maxima no puede ser menor a Liquidaci\00F3n Minima')
,p_associated_item=>wwv_flow_api.id(2675300464130895)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2677212315130896)
,p_validation_name=>'Conceptos diferentes'
,p_validation_sequence=>220
,p_validation=>'(:P153_ID_IMPSTO_ACTO_CNCPTO) != (:P153_ID_IMPSTO_ACTO_CNCP_BSE)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe seleccionar una base de concepto diferente al concepto del acto.'
,p_associated_item=>wwv_flow_api.id(2665601446130890)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2677601526130896)
,p_validation_name=>unistr('Liquidaci\00F3n no null')
,p_validation_sequence=>230
,p_validation=>' not (:P153_INDCDR_USA_FCHA_LQDCION=''S'' and :P153_LQDCION_MNMA is null or :P153_LQDCION_MXMA is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('"Liquidaci\00F3n M\00EDnima" y "Liquidaci\00F3n M\00E1xima" deben tener alg\00FAn valor.')
,p_validation_condition=>'P153_INDCDR_USA_FCHA_LQDCION'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2678058749130896)
,p_validation_name=>'Base no null'
,p_validation_sequence=>240
,p_validation=>' not (:P153_INDCDR_USA_FCHA_LQDCION=''N'' and :P153_BSE_INCIAL is null or :P153_BSE_FNAL is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('"Base Inicial" y "Base Final" deben tener alg\00FAn valor.')
,p_validation_condition=>'P153_INDCDR_USA_FCHA_LQDCION'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2681555487130899)
,p_name=>'Closed_Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2656910305130883)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2682038434130899)
,p_event_id=>wwv_flow_api.id(2681555487130899)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2682401800130899)
,p_name=>'al cambiar, ejecuta js'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P153_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2682921013130899)
,p_event_id=>wwv_flow_api.id(2682401800130899)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P153_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P153_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2683367247130900)
,p_name=>unistr('Valida valor de liquidaci\00F3n')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P153_INDCDR_USA_FCHA_LQDCION'
,p_condition_element=>'P153_INDCDR_USA_FCHA_LQDCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2683845161130900)
,p_event_id=>wwv_flow_api.id(2683367247130900)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_INDCDOR_USA_BSE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2684312432130900)
,p_event_id=>wwv_flow_api.id(2683367247130900)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_INDCDOR_USA_BSE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'S'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2684851215130900)
,p_event_id=>wwv_flow_api.id(2683367247130900)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_LQDCION_MNMA,P153_LQDCION_MXMA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2685351932130900)
,p_event_id=>wwv_flow_api.id(2683367247130900)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_BSE_INCIAL,P153_BSE_FNAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2685865772130901)
,p_event_id=>wwv_flow_api.id(2683367247130900)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_BSE_INCIAL,P153_BSE_FNAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2686325683130901)
,p_event_id=>wwv_flow_api.id(2683367247130900)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_LQDCION_MNMA,P153_LQDCION_MXMA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2686870241130901)
,p_event_id=>wwv_flow_api.id(2683367247130900)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_BSE_INCIAL,P153_BSE_FNAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2687324155130901)
,p_event_id=>wwv_flow_api.id(2683367247130900)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_LQDCION_MNMA,P153_LQDCION_MXMA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2687774342130902)
,p_name=>unistr('Mostar Item de indicador cuando no usa valor fijo la liquidaci\00F3n')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P153_INDCDOR_LQDCION_USA_VLOR_FJO'
,p_condition_element=>'P153_INDCDOR_LQDCION_USA_VLOR_FJO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2688252167130902)
,p_event_id=>wwv_flow_api.id(2687774342130902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_CDGO_INDCDOR_TPO_LQDCCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2688780628130902)
,p_event_id=>wwv_flow_api.id(2687774342130902)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_CDGO_INDCDOR_TPO_LQDCCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2690528984130903)
,p_name=>'Mostar Item de indicador cuando no usa valor fijo la base'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P153_INDCDOR_BSE_USA_VLOR_FJO'
,p_condition_element=>'P153_INDCDOR_BSE_USA_VLOR_FJO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2691082984130903)
,p_event_id=>wwv_flow_api.id(2690528984130903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_CDGO_INDCDOR_TPO_BSE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2691554609130904)
,p_event_id=>wwv_flow_api.id(2690528984130903)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_CDGO_INDCDOR_TPO_BSE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2689182310130902)
,p_name=>unistr('Mostrar \00CDtems de Base ')
,p_event_sequence=>85
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P153_INDCDOR_USA_BSE'
,p_condition_element=>'P153_INDCDOR_USA_BSE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2689663740130903)
,p_event_id=>wwv_flow_api.id(2689182310130902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_INDCDOR_BSE_USA_VLOR_FJO,P153_BSE_INCIAL,P153_BSE_FNAL,P153_PRCNTJE_BSE_LQDCION,P153_INDCDOR_UTLZA_BSE_PNTUAL, P153_INDCDOR_RQRE_FCTOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2690156428130903)
,p_event_id=>wwv_flow_api.id(2689182310130902)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_INDCDOR_BSE_USA_VLOR_FJO,P153_BSE_INCIAL,P153_BSE_FNAL,P153_CDGO_INDCDOR_TPO_BSE,P153_PRCNTJE_BSE_LQDCION,P153_INDCDOR_UTLZA_BSE_PNTUAL, P153_INDCDOR_RQRE_FCTOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(102337212624460902)
,p_name=>'Mostar Item de indicador cuando no usa valor fijo la base_1'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P153_INDCDOR_USA_BSE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(102337394456460903)
,p_event_id=>wwv_flow_api.id(102337212624460902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item("P153_INDCDOR_USA_BSE").getValue() == ''S'' && apex.item("P153_INDCDOR_BSE_USA_VLOR_FJO").getValue() == ''N'') {',
'    apex.item("P153_CDGO_INDCDOR_TPO_BSE").show();',
'}',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2680325084130898)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GI_D_TARIFAS_ESQUEMA'
,p_attribute_02=>'GI_D_TARIFAS_ESQUEMA'
,p_attribute_03=>'P153_ID_TRFA_ESQMA'
,p_attribute_04=>'ID_TRFA_ESQMA'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2680799943130898)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GI_D_TARIFAS_ESQUEMA'
,p_attribute_02=>'GI_D_TARIFAS_ESQUEMA'
,p_attribute_03=>'P153_ID_TRFA_ESQMA'
,p_attribute_04=>'ID_TRFA_ESQMA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Registro ha sido guardado.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2681120247130898)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2657359681130883)
,p_process_when_type=>'NEVER'
);
end;
/
