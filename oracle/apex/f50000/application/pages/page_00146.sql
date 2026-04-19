prompt --application/pages/page_00146
begin
wwv_flow_api.create_page(
 p_id=>146
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Gesti\00F3n Tributo por Concepto')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n Tributo por Concepto')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>unistr('var htmldb_delete_message=''"\00BFEst\00E1 seguro que desea eliminar el Acto del Tributo?"'';')
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191129105947'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40127644243217867)
,p_plug_name=>'Create Form'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'DF_I_IMPUESTOS_ACTO_CONCEPTO'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40138065707217950)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40138433572217952)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(40138065707217950)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40140096529217983)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(40138065707217950)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P146_ID_IMPSTO_ACTO_CNCPTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40140430204217983)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(40138065707217950)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(29604648415068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P146_ID_IMPSTO_ACTO_CNCPTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40140891509217989)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(40138065707217950)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P146_ID_IMPSTO_ACTO_CNCPTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40127974291217875)
,p_name=>'P146_ID_IMPSTO_ACTO_CNCPTO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_source=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40128337301217895)
,p_name=>'P146_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40128796453217906)
,p_name=>'P146_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'45%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40129117036217908)
,p_name=>'P146_ID_PRDO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_prompt=>'Periodo'
,p_source=>'ID_PRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_prdo',
'  from df_i_periodos',
' where  id_impsto         = :P146_IMPUESTO',
'   and  id_impsto_sbmpsto = :P146_SUB_IMPUESTO',
'   and  vgncia            = :P146_VGNCIA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P146_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40129594545217908)
,p_name=>'P146_ID_IMPSTO_ACTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_prompt=>'Acto'
,p_source=>'ID_IMPSTO_ACTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_acto,',
'       id_impsto_acto',
'  from df_i_impuestos_acto',
' where          id_impsto = :P81_IMPUESTO ',
'   and  id_impsto_sbmpsto = :P81_SUB_IMPUESTO',
' order by nmbre_impsto_acto'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40129954118217909)
,p_name=>'P146_ID_CNCPTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_prompt=>'Concepto'
,p_source=>'ID_CNCPTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_cncpto',
'  from df_i_conceptos',
' where id_impsto = :P81_IMPUESTO',
'   and cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40130345055217910)
,p_name=>'P146_ACTVO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40130746456217910)
,p_name=>'P146_GNRA_INTRES_MRA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFGenera Inter\00E9s de Mora?')
,p_source=>'GNRA_INTRES_MRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40131108468217910)
,p_name=>'P146_INDCDOR_TRFA_CRCTRSTCAS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_default=>'N'
,p_prompt=>unistr('\00BF\00CDndica Caracter\00EDsticas de Tarifa?')
,p_source=>'INDCDOR_TRFA_CRCTRSTCAS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40131548620217912)
,p_name=>'P146_ORDEN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_prompt=>'Orden'
,p_source=>'ORDEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select level d , level r',
'from   dual',
'where level>0',
'connect by level <= 100;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'45%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40131936125217912)
,p_name=>'P146_FCHA_VNCMNTO'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_prompt=>'Fecha de Vencimiento'
,p_source=>'FCHA_VNCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>25
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40132743233217922)
,p_name=>'P146_ID_CNCPTO_INTRES_MRA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_default=>'N'
,p_prompt=>unistr('Concepto de Inter\00E9s de Mora')
,p_source=>'ID_CNCPTO_INTRES_MRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'     dscrpcion,',
'     id_cncpto',
' from df_i_conceptos ',
'where cdgo_cncpto_tpo = ''DBT''',
'   and id_impsto= :P81_IMPUESTO',
'   and cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40133106722217923)
,p_name=>'P146_ID_CNCPTO_INTRES_FNCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_prompt=>unistr('Concepto de Inter\00E9s de Financiaci\00F3n')
,p_source=>'ID_CNCPTO_INTRES_FNCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_cncpto',
'  from df_i_conceptos',
' where id_impsto = :P81_IMPUESTO',
'   and cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40133523095217923)
,p_name=>'P146_ID_CNCPTO_INTRES_VNCDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(40127644243217867)
,p_item_source_plug_id=>wwv_flow_api.id(40127644243217867)
,p_prompt=>unistr('Concepto de Inter\00E9s Vencido')
,p_source=>'ID_CNCPTO_INTRES_VNCDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_cncpto',
'  from df_i_conceptos',
' where id_impsto = :P81_IMPUESTO',
'   and cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(40420799283601412)
,p_tabular_form_region_id=>wwv_flow_api.id(40127644243217867)
,p_validation_name=>'Acto y concepto no se repite en el mismo tributo'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from df_i_impuestos_acto_concepto',
' where cdgo_clnte             = :F_CDGO_CLNTE',
'   and id_prdo                = :P146_PRDO',
'   and id_cncpto              = :ID_CNCPTO',
'   and id_impsto_acto         = :ID_IMPSTO_ACTO',
'   and id_impsto_acto_cncpto != nvl(:ID_IMPSTO_ACTO_CNCPTO,-1)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Ya existe un registro para el acto e impuesto escogidos en el per\00EDodo se\00F1alado')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40138515346217952)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(40138433572217952)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40139322322217978)
,p_event_id=>wwv_flow_api.id(40138515346217952)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40420028415601405)
,p_name=>'Deshabilitar Concepto Interes'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_GNRA_INTRES_MRA'
,p_condition_element=>'P146_GNRA_INTRES_MRA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40420197788601406)
,p_event_id=>wwv_flow_api.id(40420028415601405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_ID_CNCPTO_INTRES_MRA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40420451596601409)
,p_event_id=>wwv_flow_api.id(40420028415601405)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_ID_CNCPTO_INTRES_MRA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40420234629601407)
,p_event_id=>wwv_flow_api.id(40420028415601405)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_ID_CNCPTO_INTRES_MRA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40141642981217992)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(40127644243217867)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Form'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40142021277217992)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40141227147217989)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(40127644243217867)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
