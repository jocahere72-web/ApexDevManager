prompt --application/pages/page_00068
begin
wwv_flow_api.create_page(
 p_id=>68
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Propiedades Tipo Declaraci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Declaraciones Propiedades Tipo Declaraci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que desea eliminar el registro?'';')
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20250325092746'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17903214727744422)
,p_plug_name=>unistr('Propiedades Tipo Declaraci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3621205723320031)
,p_plug_name=>'Ley Ineficaz (Antes del Vencimiento)'
,p_parent_plug_id=>wwv_flow_api.id(17903214727744422)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7354272001146024)
,p_plug_name=>'Valor Menor a Total a Pagar'
,p_parent_plug_id=>wwv_flow_api.id(3621205723320031)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3621493296320033)
,p_plug_name=>'Tiempo de Vencimiento'
,p_parent_plug_id=>wwv_flow_api.id(7354272001146024)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7356636894147225)
,p_plug_name=>'Valor Mayor o Igual a Total a Pagar'
,p_parent_plug_id=>wwv_flow_api.id(3621205723320031)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3621627738320035)
,p_plug_name=>'Tiempo de Vencimiento'
,p_parent_plug_id=>wwv_flow_api.id(7356636894147225)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17904378224744433)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(17903214727744422)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P68_ID_DCLRCN_TPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17904543142744435)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(17903214727744422)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17904484481744434)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(17903214727744422)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P68_ID_DCLRCN_TPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17904208904744432)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(17903214727744422)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P68_ID_DCLRCN_TPO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3621792777320036)
,p_name=>'P68_ACTVO_INFCAZ'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFParametrizar Ley Ineficaz?')
,p_source=>'ACTVO_INFCAZ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar el tipo de declaraci\00F3n y "No" para desactivar el tipo de declaraci\00F3n.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3733579977825997)
,p_name=>'P68_VLOR_MNMO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7354272001146024)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor '
,p_source=>'VLOR_MNMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3733931004825998)
,p_name=>'P68_CDGO_INDCDOR_TPO_MNMO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7354272001146024)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Indicador Econ\00F3mico')
,p_source=>'CDGO_INDCDOR_TPO_MNMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_indcdor_tpo',
'        , cdgo_indcdor_tpo',
'     from df_s_indicadores_tipo',
' order by nmbre_indcdor_tpo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3734364885825998)
,p_name=>'P68_DRCION_MNMO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3621493296320033)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tiempo'
,p_source=>'DRCION_MNMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3734758832825998)
,p_name=>'P68_UNDAD_DRCION_MNMO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3621493296320033)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Unidad'
,p_source=>'UNDAD_DRCION_MNMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Minutos;MN,Horas;HR,D\00EDas;DI,Semanas;SM,Meses;MS')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3735149376825998)
,p_name=>'P68_DIA_TPO_MNMO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3621493296320033)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo de D\00EDas')
,p_source=>'DIA_TPO_MNMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Habiles;H,Calendario;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3735882679827195)
,p_name=>'P68_VLOR_MXMO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7356636894147225)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor'
,p_source=>'VLOR_MXMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3736240295827196)
,p_name=>'P68_CDGO_INDCDOR_TPO_MXMO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7356636894147225)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Indicador Econ\00F3mico')
,p_source=>'CDGO_INDCDOR_TPO_MXMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_indcdor_tpo',
'        , cdgo_indcdor_tpo',
'     from df_s_indicadores_tipo',
' order by nmbre_indcdor_tpo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3736655726827196)
,p_name=>'P68_DRCION_MXMO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3621627738320035)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tiempo'
,p_source=>'DRCION_MXMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3737020666827196)
,p_name=>'P68_UNDAD_DRCION_MXMO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3621627738320035)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Unidad'
,p_source=>'UNDAD_DRCION_MXMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Minutos;MN,Horas;HR,D\00EDas;DI,Semanas;SM,Meses;MS')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3737419789827196)
,p_name=>'P68_DIA_TPO_MXMO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3621627738320035)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo de D\00EDas')
,p_source=>'DIA_TPO_MXMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Habiles;H,Calendario;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3791761003072902)
,p_name=>'P68_INDCDOR_DCLRCION_FNAL'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFEs declaraci\00F3n \00FAnica ?')
,p_source=>'INDCDOR_DCLRCION_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para indicar que es una declaraci\00F3n por periodo y "No" para indicar que puede ser mas de una declaraci\00F3n por periodo.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17903339551744423)
,p_name=>'P68_ID_DCLRCN_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DCLRCN_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17903447014744424)
,p_name=>'P68_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17903559123744425)
,p_name=>'P68_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
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
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17903649638744426)
,p_name=>'P68_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_sbmpsto,',
'        a.id_impsto_sbmpsto',
'from    df_i_impuestos_subimpuesto  a',
'where   a.id_impsto =   :P68_ID_IMPSTO',
'order by    a.nmbre_impsto_sbmpsto;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P68_ID_IMPSTO'
,p_ajax_items_to_submit=>'P68_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el sub-tributo '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17903798159744427)
,p_name=>'P68_CDGO_PRDCDAD'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodicidad'
,p_source=>'CDGO_PRDCDAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.cdgo_prdcdad',
'from    df_s_periodicidad   a',
'order by a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la periodicidad'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17903814667744428)
,p_name=>'P68_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cHeight=>3
,p_colspan=>11
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese una descripci\00F3n al tipo de declaraci\00F3n. M\00E1ximo 40 caracteres.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17903975669744429)
,p_name=>'P68_ACTVO'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar el tipo de declaraci\00F3n y "No" para desactivar el tipo de declaraci\00F3n.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40681400342743401)
,p_name=>'P68_ID_IMPSTO_ACTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Acto'
,p_source=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_acto,',
'        a.id_impsto_acto',
'from    df_i_impuestos_acto a',
'where   a.id_impsto_sbmpsto =   :P68_ID_IMPSTO_SBMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P68_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78323217812004210)
,p_name=>'P68_CDGO_DCLRCN_TPO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('C\00F3digo')
,p_source=>'CDGO_DCLRCN_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83694342886840841)
,p_name=>'P68_INDCDOR_PRSNTCION_WEB'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(17903214727744422)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Presentaci\00F3n Web')
,p_source=>'INDCDOR_PRSNTCION_WEB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(17905809570744448)
,p_validation_name=>unistr('Validar Tipo de Declaraci\00F3n')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_d_declaraciones_tipo a',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and     a.id_impsto         =   :P68_ID_IMPSTO',
'and     a.id_impsto_sbmpsto =   :P68_ID_IMPSTO_SBMPSTO',
'and     a.cdgo_prdcdad      =   :P68_CDGO_PRDCDAD',
'and     a.dscrpcion         =   :P68_DSCRPCION',
'and     a.id_dclrcn_tpo     <>  :P68_ID_DCLRCN_TPO;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Ya existe un tipo de declaraci\00F3n con estas caracter\00EDsticas.')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18563321390436332)
,p_validation_name=>unistr('Validar Vigencias a Tipo de Declaraci\00F3n')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_d_dclrcnes_tpos_vgncias  a',
'where   a.id_dclrcn_tpo   =   :P68_ID_DCLRCN_TPO;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Existen Vigencias asociadas al tipo de declaraci\00F3n.')
,p_when_button_pressed=>wwv_flow_api.id(17904484481744434)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20291603629660627)
,p_validation_name=>unistr('Validar Tipos de Sujetos asociados a Tipo de Declaraci\00F3n')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_d_dclrcnes_tpos_sjto a',
'where   exists(select   1',
'               from     gi_d_declaraciones_tipo b',
'               where    b.id_dclrcn_tpo =   :P68_ID_DCLRCN_TPO',
'               and      b.id_dclrcn_tpo =   a.id_dclrcn_tpo',
'              );'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('El tipo de declaraci\00F3n tiene asociado tipos de sujeto a declarar.')
,p_when_button_pressed=>wwv_flow_api.id(17904484481744434)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18564848731436347)
,p_validation_name=>unistr('Validar Periodos a Vigencias de Tipo de Declaraci\00F3n')
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        gi_d_declaraciones_tipo     a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcn_tpo =   a.id_dclrcn_tpo',
'inner join  df_i_periodos               c   on  c.id_prdo       =   b.id_prdo',
'where       a.id_dclrcn_tpo =   :P68_ID_DCLRCN_TPO',
'and         c.cdgo_prdcdad  <>  :P68_CDGO_PRDCDAD;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Existen periodos relacionados al tipo de presentaci\00F3n con una periodicidad distinta a la seleccionada.')
,p_when_button_pressed=>wwv_flow_api.id(17904378224744433)
,p_associated_item=>wwv_flow_api.id(17903798159744427)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8529257043226101)
,p_validation_name=>unistr('Validar que el item  P68_VLOR_MNMO no est\00E9 vacio')
,p_validation_sequence=>60
,p_validation=>'P68_VLOR_MNMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3733579977825997)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8529324420226102)
,p_validation_name=>unistr('Validar que el item P68_CDGO_INDCDOR_TPO_MNMO  no est\00E9 vacio')
,p_validation_sequence=>70
,p_validation=>'P68_CDGO_INDCDOR_TPO_MNMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3733931004825998)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8529434276226103)
,p_validation_name=>unistr('Validar que el item P68_DRCION_MNMO no est\00E9 vacio')
,p_validation_sequence=>80
,p_validation=>'P68_DRCION_MNMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3734364885825998)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8529549602226104)
,p_validation_name=>unistr('Validar que el item P68_UNDAD_DRCION_MNMO no est\00E9 vacio')
,p_validation_sequence=>90
,p_validation=>'P68_UNDAD_DRCION_MNMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3734758832825998)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8529614348226105)
,p_validation_name=>unistr('Validar que el item P68_DIA_TPO_MNMO no est\00E9 vacio')
,p_validation_sequence=>100
,p_validation=>'P68_DIA_TPO_MNMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3735149376825998)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8529704342226106)
,p_validation_name=>unistr('Validar que el item P68_VLOR_MXMO no est\00E9 vacio')
,p_validation_sequence=>110
,p_validation=>'P68_VLOR_MXMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3735882679827195)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8529863741226107)
,p_validation_name=>unistr('Validar que el item P68_CDGO_INDCDOR_TPO_MXMO no est\00E9 vacio')
,p_validation_sequence=>120
,p_validation=>'P68_CDGO_INDCDOR_TPO_MXMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3736240295827196)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8529911160226108)
,p_validation_name=>unistr('Validar que el item P68_DRCION_MXMO no est\00E9 vacio')
,p_validation_sequence=>130
,p_validation=>'P68_DRCION_MXMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3736655726827196)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8530008796226109)
,p_validation_name=>unistr('Validar que el item P68_UNDAD_DRCION_MXMO no est\00E9 vacio')
,p_validation_sequence=>140
,p_validation=>'P68_UNDAD_DRCION_MXMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3737020666827196)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8530166548226110)
,p_validation_name=>unistr('Validar que el item P68_DIA_TPO_MXMO no est\00E9 vacio')
,p_validation_sequence=>150
,p_validation=>'P68_DIA_TPO_MXMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no puede estar vac\00EDo')
,p_validation_condition=>'P68_ACTVO_INFCAZ'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(3737419789827196)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17905616383744446)
,p_name=>'Cerrar ventana'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(17904543142744435)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17905796636744447)
,p_event_id=>wwv_flow_api.id(17905616383744446)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3622077575320039)
,p_name=>'Al cambiar Indicador Ineficaz'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_ACTVO_INFCAZ'
,p_condition_element=>'P68_ACTVO_INFCAZ'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3622151789320040)
,p_event_id=>wwv_flow_api.id(3622077575320039)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3621205723320031)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3622301446320042)
,p_event_id=>wwv_flow_api.id(3622077575320039)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3621205723320031)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17904613445744436)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch gi_d_declaraciones_tipo'
,p_attribute_02=>'GI_D_DECLARACIONES_TIPO'
,p_attribute_03=>'P68_ID_DCLRCN_TPO'
,p_attribute_04=>'ID_DCLRCN_TPO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P68_ID_DCLRCN_TPO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17904764427744437)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Gestionar gi_d_declaraciones_tipo'
,p_attribute_02=>'GI_D_DECLARACIONES_TIPO'
,p_attribute_03=>'P68_ID_DCLRCN_TPO'
,p_attribute_04=>'ID_DCLRCN_TPO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17905444221744444)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'P68_ID_DCLRCN_TPO = null'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(17904484481744434)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17905586887744445)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar cuadro de dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
