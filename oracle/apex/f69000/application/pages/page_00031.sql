prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Rechazo de Novedad'
,p_page_mode=>'MODAL'
,p_step_title=>'RECHAZO O REINICIO DE NOVEDAD'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JADIES'
,p_last_upd_yyyymmddhh24miss=>'20241021154541'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69795252049733804)
,p_plug_name=>'Rechazo de Novedad Persona'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69795625199733808)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(69795252049733804)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69795485688733806)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(69795252049733804)
,p_button_name=>'BTN_RECHAZAR_NOVEDAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Rechazar Novedad'
,p_button_position=>'BODY'
,p_button_condition=>'P31_TITULO'
,p_button_condition2=>unistr('Observaci\00F3n de Rechazo')
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-times'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5967353459839803)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(69795252049733804)
,p_button_name=>'BTN_REINICIAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Reiniciar Novedad'
,p_button_position=>'BODY'
,p_button_condition=>'P31_TITULO'
,p_button_condition2=>unistr('Observaci\00F3n de Reinicio')
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-undo-arrow'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(69796246822733814)
,p_branch_name=>unistr('Ir a la P\00E1gina 27')
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:RP,28,29,30,31::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5967286980839802)
,p_name=>'P31_TITULO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(69795252049733804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11774475960570701)
,p_name=>'P31_RECHAZAR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(69795252049733804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11781696592648302)
,p_name=>'P31_ID_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(69795252049733804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11781755501648303)
,p_name=>'P31_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(69795252049733804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11781830994648304)
,p_name=>'P31_ID_SJTO_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(69795252049733804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12323941873475601)
,p_name=>'P31_RSPSTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(69795252049733804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69795331954733805)
,p_name=>'P31_OBSRVCION_RCHZO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69795252049733804)
,p_prompt=>'&P31_TITULO.'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(88588499627834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69796394949733815)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(69795625199733808)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69796417708733816)
,p_event_id=>wwv_flow_api.id(69796394949733815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69796093908733812)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rechazar Novedad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'                       ',
'declare',
'    v_cdgo_rspsta      number;',
'    v_mnsje_rspsta     varchar2(1000);',
'    v_id_nvdad_prsona  number;',
' ',
'begin',
'    v_id_nvdad_prsona    := NVL(:P28_ID_NVDAD_PRSNA, :P30_ID_NVDAD_PRSNA);',
' ',
' ',
'     if v_id_nvdad_prsona is null and :P28_RECHAZAR = ''S'' then',
' ',
'            pkg_si_novedades_persona.prc_rg_novedad_persona_rechazo (p_cdgo_clnte		    => :F_CDGO_CLNTE,',
'                                                                    p_ssion                 => :APP_SESSION,',
'                                                                    p_id_impsto			    => :P28_ID_IMPSTO,',
'                                                                    p_id_impsto_sbmpsto     => :P28_ID_IMPSTO_SBMPSTO,',
'                                                                    p_id_sjto_impsto		=> :P28_ID_SJTO_IMPSTO,',
'                                                                    p_id_instncia_fljo	    => :F_ID_INSTNCIA_FLJO,',
'                                                                    p_cdgo_nvdad_tpo		=> :P28_CDGO_NVDAD_TPO,',
'                                                                    p_id_usrio_rgstro		=> :F_ID_USRIO,',
'                                                                    p_obsrvcion             => :P31_OBSRVCION_RCHZO,',
'                                                                    o_id_nvdad_prsna		=> 	v_id_nvdad_prsona,',
'                                                                    o_cdgo_rspsta			=> 	v_cdgo_rspsta,',
'                                                                    o_mnsje_rspsta			=>  v_mnsje_rspsta);',
' ',
'            if v_cdgo_rspsta != 0 then ',
'                apex_error.add_error ( p_message		    => v_mnsje_rspsta,',
'                                       p_display_location	=> apex_error.c_inline_in_notification); ',
'            else',
'                 :P31_RSPSTA := v_mnsje_rspsta;',
'            end if;',
'        ',
'  else',
'      ',
'            pkg_si_novedades_persona.prc_rc_novedad_persona(p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'                                                        p_id_nvdad_prsna		=> v_id_nvdad_prsona,',
'                                                        p_id_usrio        		=> :F_ID_USRIO,',
'                                                        p_obsrvcion             => :P31_OBSRVCION_RCHZO,',
'                                                        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'                                                        o_mnsje_rspsta		    => v_mnsje_rspsta);    ',
'',
'            if v_cdgo_rspsta != 0 then ',
'                        apex_error.add_error ( p_message		    => v_mnsje_rspsta,',
'                                   p_display_location	=> apex_error.c_inline_in_notification); ',
'            else',
'                 :P31_RSPSTA := v_mnsje_rspsta;',
'            end if;',
'     end if; ',
' end;',
' ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(69795485688733806)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P31_OBSRVCION_RCHZO is not null and ',
'(:P28_ID_NVDAD_PRSNA is not null or :P30_ID_NVDAD_PRSNA is not null) or :P28_RECHAZAR = ''S'''))
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P31_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5967465925839804)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reiniciar Novedad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'                       ',
'                       ',
'declare',
'    v_cdgo_rspsta      number;',
'    v_mnsje_rspsta     varchar2(1000);',
'    v_id_nvdad_prsona  number;',
' ',
'begin',
'    v_id_nvdad_prsona    := NVL(:P28_ID_NVDAD_PRSNA, :P30_ID_NVDAD_PRSNA);',
' ',
' ',
'        if  :P31_OBSRVCION_RCHZO is not null and v_id_nvdad_prsona is not null then',
'      ',
'            pkg_si_novedades_persona.prc_rnc_novedad_persona(p_cdgo_clnte		    => :F_CDGO_CLNTE,',
'                                                             p_id_nvdad_prsna		=> v_id_nvdad_prsona,',
'                                                             p_id_usrio        		=> :F_ID_USRIO,',
'                                                             p_obsrvcion            => :P31_OBSRVCION_RCHZO,',
'                                                             o_cdgo_rspsta			=> v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta		    => v_mnsje_rspsta);    ',
' ',
'            if v_cdgo_rspsta != 0 then ',
'                        apex_error.add_error ( p_message		    => v_mnsje_rspsta,',
'                                   p_display_location	=> apex_error.c_inline_in_notification); ',
'            else',
'                 :P31_RSPSTA := v_mnsje_rspsta;',
'            end if;',
'     end if; ',
' end;',
''))
,p_process_error_message=>'&P31_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5967353459839803)
,p_process_success_message=>'&P31_RSPSTA.'
);
end;
/
