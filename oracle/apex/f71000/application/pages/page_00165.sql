prompt --application/pages/page_00165
begin
wwv_flow_api.create_page(
 p_id=>165
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Rechazo Ajuste'
,p_page_mode=>'MODAL'
,p_step_title=>'Rechazo Ajuste'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1000'
,p_protection_level=>'C'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20240725083637'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190929574406042925)
,p_plug_name=>'Adjuntos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177322596503050602)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190930184405042926)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177323513323050604)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101060426700146403)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(190930184405042926)
,p_button_name=>'NO_APLICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'No Aplicar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P165_CDGO_AJSTE_ESTDO IN (''A'')'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101060546576146404)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(190930184405042926)
,p_button_name=>'NO_APROBAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'No Aprobar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P165_CDGO_AJSTE_ESTDO IN (''RG'')'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101042138514114638)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(190930184405042926)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar / Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101042598631114639)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(190930184405042926)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101042982180114639)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(190930184405042926)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101043355652114639)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(190930184405042926)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(101584016497796901)
,p_branch_name=>'Boton No Aplicar'
,p_branch_action=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(101060426700146403)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(101695785197414401)
,p_branch_name=>'Boton No Aprobar'
,p_branch_action=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(101060546576146404)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18900583248948101)
,p_name=>'P165_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101038244986114634)
,p_name=>'P165_ID_AJSTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101039454999114635)
,p_name=>'P165_OBSRVCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Motivo'
,p_source=>'OBSRVCION_NA_NAP'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>110
,p_cMaxlength=>4000
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101040662046114636)
,p_name=>'P165_FILE_BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_prompt=>'Adjunto'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101041041253114636)
,p_name=>'P165_FILE_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101041428981114636)
,p_name=>'P165_FILE_MIMETYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101351890551305201)
,p_name=>'P165_CDGO_TPO_AJSTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101424997710495601)
,p_name=>'P165_CDGO_AJSTE_ESTDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_AJSTE_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101522629353435001)
,p_name=>'P165_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101537724097529101)
,p_name=>'P165_ID_FLJO_TREA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101537815266529102)
,p_name=>'P165_V__MNSJE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(190929574406042925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101043842853114649)
,p_validation_name=>'Adjuntos Historicos'
,p_validation_sequence=>10
,p_validation=>'select 1  from ti_h_paquetes_fncnal_adjnto where id_pqte_fncnal_adjnto = :P165_ID_PQTE_FNCNAL_ADJNTO'
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'No se puede eliminar el adjunto debido a que ya tiene versiones '
,p_when_button_pressed=>wwv_flow_api.id(101042598631114639)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101045760744114652)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(101042138514114638)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101046280712114653)
,p_event_id=>wwv_flow_api.id(101045760744114652)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101044177605114650)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from TI_G_PAQUETES_FNCNAL_ADJNTO'
,p_attribute_02=>'GF_G_AJUSTES'
,p_attribute_03=>'P165_ID_AJSTE'
,p_attribute_04=>'ID_AJSTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101060292726146401)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'No Aprobar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'	v_mnsje                    varchar2(4000);   ',
'    v_type	                      varchar2(1); ',
'    v_xml                                clob;',
'    v_o_cdgo_rspsta	                   number;',
'    v_o_mnsje_rspsta		  varchar2(10000);',
'  ',
'    ',
'begin',
'    begin',
'        -- Actualizamos el estado del ajuste a "NAP" y se termina la instancia del flujo',
'        v_xml :=        ''<ID_INSTNCIA_FLJO>''      ||:P165_ID_INSTNCIA_FLJO ||''</ID_INSTNCIA_FLJO>'';',
'        v_xml := v_xml||''<ID_SJTO_IMPSTO>''	      ||:P165_ID_SJTO_IMPSTO   ||''</ID_SJTO_IMPSTO>'';',
'        v_xml := v_xml||''<ID_AJSTE>''		      ||:P165_ID_AJSTE         ||''</ID_AJSTE>'';',
'        v_xml := v_xml||''<OBSRVCION_NA_NAP>''	  ||:P165_OBSRVCION        ||''</OBSRVCION_NA_NAP>''; ',
'        v_xml := v_xml||''<ID_USRIO>''              ||:F_ID_USRIO            ||''</ID_USRIO>'';',
'        v_xml := v_xml||''<ADJNTO>''		          ||:P165_FILE_BLOB        ||''</ADJNTO>'';',
'        v_xml := v_xml||''<CDGO_CLNTE>''		      ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'        ',
'        pkg_gf_ajustes.prc_na_no_aprobar_ajuste(p_xml                   =>    v_xml,',
'                                                o_cdgo_rspsta           =>    v_o_cdgo_rspsta,	',
'                                                o_mnsje_rspsta          =>    v_o_mnsje_rspsta);',
'        if (v_o_cdgo_rspsta = 0) then',
'            pkg_pl_workflow_1_0.prc_rg_propiedad_evento(:P165_ID_INSTNCIA_FLJO,''EST'',''NO_APROBADO'' );',
'            pkg_pl_workflow_1_0.prc_rg_propiedad_evento(:P165_ID_INSTNCIA_FLJO,''EXT'',''N'' );',
'            pkg_pl_workflow_1_0.prc_rg_propiedad_evento(:P165_ID_INSTNCIA_FLJO,''OBS'',:P165_OBSRVCION);',
'            pkg_pl_workflow_1_0.prc_rg_finalizar_instancia(:P165_ID_INSTNCIA_FLJO,',
'                                                           :P165_ID_FLJO_TREA,',
'                                                           :F_ID_USRIO,',
'                                                           v_type,',
'                                                           v_mnsje',
'                                                          );',
'            --  :F_ID_AJSTE :=   v_mnsje;',
'            :P165_V__MNSJE:=  v_mnsje;',
'            --commit;',
'        else',
'            rollback;',
'            RAISE_APPLICATION_ERROR (-20000,v_o_mnsje_rspsta); ',
'        end if;',
'        exception',
'            when no_data_found then',
'                rollback;',
'                v_o_cdgo_rspsta := 1;',
'                v_o_mnsje_rspsta := ''|Proceso No. 60 - Codigo: ''||v_o_cdgo_rspsta ||',
'                '' No fue posible cargar el archivo. asociado al flujo No asociada a la instancia del flujo No.''||:P165_ID_INSTNCIA_FLJO||'' ''||v_o_mnsje_rspsta;',
'                pkg_sg_log.prc_rg_log( 1, null, ''pkg_gf_ajustes.prc_rg_ajustes'',   v_o_cdgo_rspsta, v_o_mnsje_rspsta, 1); ',
'                return;',
'    end;',
'    ',
'end;',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101060546576146404)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101060365704146402)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'No Aplicar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'	v_mnsje                    varchar2(4000);   ',
'    v_type	                      varchar2(1); ',
'    v_xml                                clob;',
'    v_o_cdgo_rspsta	                   number;',
'    v_o_mnsje_rspsta		  varchar2(10000);',
'  ',
'    ',
'begin',
'',
'    begin',
'            -- Actualizamos el estado del ajuste a "NAP" y se termina la instancia del flujo',
'            v_xml :=        ''<ID_INSTNCIA_FLJO>''      ||:P165_ID_INSTNCIA_FLJO ||''</ID_INSTNCIA_FLJO>'';',
'            v_xml := v_xml||''<ID_SJTO_IMPSTO>''	      ||:P165_ID_SJTO_IMPSTO   ||''</ID_SJTO_IMPSTO>'';',
'            v_xml := v_xml||''<ID_AJSTE>''		      ||:P165_ID_AJSTE         ||''</ID_AJSTE>'';',
'            v_xml := v_xml||''<ID_USRIO>''              ||:F_ID_USRIO            ||''</ID_USRIO>'';',
'            v_xml := v_xml||''<OBSRVCION_NA_NAP>''	  ||:P165_OBSRVCION        ||''</OBSRVCION_NA_NAP>''; ',
'            v_xml := v_xml||''<ADJNTO>''		          ||:P165_FILE_BLOB        ||''</ADJNTO>'';',
'            v_xml := v_xml||''<CDGO_CLNTE>''		      ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'            ',
'            pkg_gf_ajustes.prc_na_no_aplicar_ajuste(p_xml                   =>    v_xml,',
'                                                    o_cdgo_rspsta           =>    v_o_cdgo_rspsta,	',
'                                                    o_mnsje_rspsta          =>    v_o_mnsje_rspsta);',
'            if (v_o_cdgo_rspsta = 0) then',
'                        pkg_pl_workflow_1_0.prc_rg_propiedad_evento(:P165_ID_INSTNCIA_FLJO,''EST'',''NO_APLICADO'' );',
'                        pkg_pl_workflow_1_0.prc_rg_propiedad_evento(:P165_ID_INSTNCIA_FLJO,''EXT'',''N'' );',
'                        pkg_pl_workflow_1_0.prc_rg_propiedad_evento(:P165_ID_INSTNCIA_FLJO,''OBS'',:P165_OBSRVCION);                          ',
'   ',
'   ',
'                        pkg_pl_workflow_1_0.prc_rg_finalizar_instancia(:P165_ID_INSTNCIA_FLJO,',
'                                                   :P165_ID_FLJO_TREA,',
'                                                   :F_ID_USRIO,',
'                                                   v_type,',
'                                                   v_mnsje );	',
'  --  :F_ID_AJSTE :=   v_mnsje;',
'     :P165_V__MNSJE:=  v_mnsje;',
'                    ',
'                    commit;',
'            else',
'                rollback;',
'          --      RAISE_APPLICATION_ERROR (-20000,v_o_mnsje_rspsta); ',
'            end if;  ',
'   ',
'    exception',
'							   when no_data_found then',
'								 rollback;',
'								 v_o_cdgo_rspsta := 1;',
'								 v_o_mnsje_rspsta := ''|Proceso No. 60 - Codigo: ''||v_o_cdgo_rspsta ||',
'											   '' No fue posible cargar el archivo. asociado al flujo No asociada a la instancia del flujo No.''||:P165_ID_INSTNCIA_FLJO||'' ''||v_o_mnsje_rspsta;',
'								 pkg_sg_log.prc_rg_log( 1, null, ''pkg_gf_ajustes.prc_rg_ajustes'',   v_o_cdgo_rspsta, v_o_mnsje_rspsta, 1); ',
'							return;',
'	end;',
'    ',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101060426700146403)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101044906325114651)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101042598631114639)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101045315149114652)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
