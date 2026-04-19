prompt --application/pages/page_00086
begin
wwv_flow_api.create_page(
 p_id=>86
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Propiedades Homologaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Propiedades Homologaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20191122152742'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19033758959792130)
,p_plug_name=>'Propiedades'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19034540429792138)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(19033758959792130)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P86_ID_HMLGCION_PRPDAD_ITEM'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19034638655792139)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19033758959792130)
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
 p_id=>wwv_flow_api.id(19034777933792140)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(19033758959792130)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition=>'P86_ID_HMLGCION_PRPDAD_ITEM'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19034452673792137)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(19033758959792130)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P86_ID_HMLGCION_PRPDAD_ITEM'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19033835776792131)
,p_name=>'P86_ID_HMLGCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19033758959792130)
,p_prompt=>'Objeto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_objto,',
'        a.id_hmlgcion',
'from    gi_d_homologaciones a',
'order by a.nmbre_objto;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19033943898792132)
,p_name=>'P86_ID_HMLGCION_PRPDAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19033758959792130)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Propiedad'
,p_source=>'ID_HMLGCION_PRPDAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_prpdad || '' - '' || a.obsrvcion,',
'        a.id_hmlgcion_prpdad',
'from    gi_d_hmlgcnes_prpdad    a',
'where   a.id_hmlgcion    =   :P86_ID_HMLGCION',
'order by a.cdgo_prpdad;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P86_ID_HMLGCION'
,p_ajax_items_to_submit=>'P86_ID_HMLGCION_PRPDAD'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19034071685792133)
,p_name=>'P86_ID_FRMLRIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(19033758959792130)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Formulario'
,p_source=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_frmlrio || '' - '' || a.dscrpcion,',
'        a.id_frmlrio',
'from    gi_d_formularios    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'order by a.cdgo_frmlrio, a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19034154481792134)
,p_name=>'P86_ID_FRMLRIO_RGION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(19033758959792130)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Regi\00F3n')
,p_source=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion',
'from    gi_d_formularios_region a',
'where   a.id_frmlrio    =   :P86_ID_FRMLRIO',
'order by a.orden;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P86_ID_FRMLRIO'
,p_ajax_items_to_submit=>'P86_ID_FRMLRIO_RGION'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19034254704792135)
,p_name=>'P86_ID_FRMLRIO_RGION_ATRBTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(19033758959792130)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Atributo'
,p_source=>'ID_FRMLRIO_RGION_ATRBTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion_atrbto',
'from    gi_d_frmlrios_rgion_atrbto  a',
'where   a.id_frmlrio_rgion  =   :P86_ID_FRMLRIO_RGION',
'order by a.orden;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P86_ID_FRMLRIO_RGION'
,p_ajax_items_to_submit=>'P86_ID_FRMLRIO_RGION_ATRBTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19034365021792136)
,p_name=>'P86_FLA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(19033758959792130)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fila'
,p_source=>'FLA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''Fila '' || a.fla,',
'        a.fla',
'from    gi_d_frmlrios_rgn_atrbt_vlr a',
'where   a.id_frmlrio_rgion_atrbto   =   :P86_ID_FRMLRIO_RGION_ATRBTO',
'order by a.fla;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_null_value=>'1'
,p_lov_cascade_parent_items=>'P86_ID_FRMLRIO_RGION_ATRBTO'
,p_ajax_items_to_submit=>'P86_FLA'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19035093839792143)
,p_name=>'P86_ID_HMLGCION_PRPDAD_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19033758959792130)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_HMLGCION_PRPDAD_ITEM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(19035396346792146)
,p_computation_sequence=>10
,p_computation_item=>'P86_ID_HMLGCION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.id_hmlgcion',
'from        gi_d_hmlgcnes_prpddes_items a',
'inner join  gi_d_hmlgcnes_prpdad        b   on  b.id_hmlgcion_prpdad    =   a.id_hmlgcion_prpdad',
'inner join  gi_d_homologaciones         c   on  c.id_hmlgcion           =   b.id_hmlgcion',
'where       a.id_hmlgcion_prpdad_item   =   :P86_ID_HMLGCION_PRPDAD_ITEM;'))
,p_compute_when=>'P86_ID_HMLGCION_PRPDAD_ITEM'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19035794949792150)
,p_validation_name=>'Validar gi_d_hmlgcnes_prpddes_items'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_d_hmlgcnes_prpddes_items a',
'where   a.id_hmlgcion_prpdad        =   :P86_ID_HMLGCION_PRPDAD',
'and     a.id_frmlrio                =   :P86_ID_FRMLRIO',
'and     a.id_hmlgcion_prpdad_item   <>   nvl(:P86_ID_HMLGCION_PRPDAD_ITEM, 0);'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('La homologaci\00F3n entre la propiedad del objeto y el formulario ya existe.')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19034850803792141)
,p_name=>'Cerrar Ventana'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19034638655792139)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19034941091792142)
,p_event_id=>wwv_flow_api.id(19034850803792141)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19035112295792144)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch gi_d_hmlgcnes_prpddes_items'
,p_attribute_02=>'GI_D_HMLGCNES_PRPDDES_ITEMS'
,p_attribute_03=>'P86_ID_HMLGCION_PRPDAD_ITEM'
,p_attribute_04=>'ID_HMLGCION_PRPDAD_ITEM'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P86_ID_HMLGCION_PRPDAD_ITEM'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19035625502792149)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Gestionar gi_d_hmlgcnes_prpddes_items'
,p_attribute_02=>'GI_D_HMLGCNES_PRPDDES_ITEMS'
,p_attribute_03=>'P86_ID_HMLGCION_PRPDAD_ITEM'
,p_attribute_04=>'ID_HMLGCION_PRPDAD_ITEM'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19119218823696601)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'P86_ID_HMLGCION_PRPDAD_ITEM = null'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(19034777933792140)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19119346174696602)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar cuadro de dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
