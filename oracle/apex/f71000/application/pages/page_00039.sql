prompt --application/pages/page_00039
begin
wwv_flow_api.create_page(
 p_id=>39
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Caracteristicas Sujeto '
,p_page_mode=>'MODAL'
,p_step_title=>'Atributos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'300'
,p_dialog_width=>'80%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191224114345'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35406900999267615)
,p_plug_name=>'Atributos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46591329892325208)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(35406900999267615)
,p_button_name=>'BTN_APLICAR_CAMBIOS'
,p_button_static_id=>'BTN_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P39_ID_CNVNIO_TPO_CNDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35407291351267618)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(35406900999267615)
,p_button_name=>'BTN_INSERTAR'
,p_button_static_id=>'BTN_INSERTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P39_ID_CNVNIO_TPO_CNDCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46302261126452807)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(35406900999267615)
,p_button_name=>'BTN_ELIMINAR'
,p_button_static_id=>'BTN_ELIMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_condition=>'P39_ID_CNVNIO_TPO_CNDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(46591961487325214)
,p_branch_name=>'Ir a la Pagina 38'
,p_branch_action=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(46591871192325213)
,p_branch_name=>unistr('Ir a la P\00E1gina 39')
,p_branch_action=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP:P39_ID_CNVNIO_TPO_CNDCION:&P39_ID_CNVNIO_TPO_CNDCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(49695475327059405)
,p_branch_name=>'Go To Page 38'
,p_branch_action=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'BTN_APLICAR_CAMBIOS,BTN_ELIMINAR,BTN_INSERTAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35407115605267617)
,p_name=>'P39_ID_CNVNIO_ATRBTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(35406900999267615)
,p_prompt=>'Atributos'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre, ',
'        id_cnvnio_atrbto ',
'   from gf_d_convenios_atributo ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and cdgo_sjto_tpo = :P38_CDGO_SJTO_TPO',
'order by nmbre'))
,p_lov_display_null=>'YES'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35407375665267619)
,p_name=>'P39_ID_OPRDOR_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(35406900999267615)
,p_prompt=>'Operador'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_OPERADORES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DSCRPCION D,',
'       ID_OPRDOR_TPO R',
'FROM DF_S_OPERADORES_TIPO ',
'ORDER BY 2'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35407487469267620)
,p_name=>'P39_VLOR_1_SELECT_LIST'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(35406900999267615)
,p_prompt=>'Valor 1'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_select clob;',
'',
'    v_id_cnvnio_atrbto    gf_d_convenios_atributo.id_cnvnio_atrbto%type;',
'    v_tpo_objto           gf_d_convenios_atributo.tpo_objto%type;    ',
'',
'    cursor c_select  is',
'     select cnslta_slct ',
'       from gf_d_convenios_atributo ',
'      where id_cnvnio_atrbto = v_id_cnvnio_atrbto;  ',
'  ',
' ',
'begin',
'    v_id_cnvnio_atrbto := :P39_ID_CNVNIO_ATRBTO;',
'',
'    if v_id_cnvnio_atrbto is not null then',
'        open c_select;',
'        fetch c_select into v_select;',
'',
'        close c_select;',
'           ',
'        -- v_select := ''select dscrpcion_estrto, cdgo_estrto  from df_s_estratos order by cdgo_estrto '';',
'        return v_select;',
'     end if;',
'',
'',
'end;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_id_cnvnio_atrbto gf_d_convenios_atributo.id_cnvnio_atrbto%type;',
'begin',
'    if :P39_ID_OPRDOR_TPO in (9,10) then  -- Es Nulo, No es Nulo        ',
'       return false;',
'     else ',
'         begin',
'             select id_cnvnio_atrbto',
'              into v_id_cnvnio_atrbto',
'              from gf_d_convenios_atributo ',
'             where id_cnvnio_atrbto = :P39_ID_CNVNIO_ATRBTO ',
'               and tpo_objto = ''SELECT_LIST'';  ',
'               insert into gti_aux (col1, col2) values (1, ''Entro''); commit;',
'               ',
'             return true;',
'          exception ',
'              when no_data_found then ',
'                  return false;',
'          end;',
'    end if;',
'end;'))
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35408525353267631)
,p_name=>'P39_VLOR_1_TEXT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(35406900999267615)
,p_prompt=>'Valor 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_id_cnvnio_atrbto gf_d_convenios_atributo.id_cnvnio_atrbto%type;',
'begin',
'    if :p39_id_oprdor_tpo in (9,10) then  -- Es Nulo, No es Nulo        ',
'       return false;',
'     else ',
'         begin',
'             select id_cnvnio_atrbto',
'              into v_id_cnvnio_atrbto',
'              from gf_d_convenios_atributo ',
'             where id_cnvnio_atrbto = :P39_ID_CNVNIO_ATRBTO ',
'               and tpo_objto = ''TEXT'';               ',
'             return true;',
'          exception ',
'              when no_data_found then ',
'                  return false;',
'          end;',
'    end if;',
'end;'))
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35408823715267634)
,p_name=>'P39_VLOR_2_TEXT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(35406900999267615)
,p_prompt=>'Valor 2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio_atrbto ',
'  from gf_d_convenios_atributo ',
' where id_cnvnio_atrbto = :P39_ID_CNVNIO_ATRBTO ',
'   and tpo_objto = ''TEXT'' ',
'   and :P39_ID_OPRDOR_TPO = 11 -- ENTRE',
'   ;'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35408900538267635)
,p_name=>'P39_VLOR_2_SELECT_LIST'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(35406900999267615)
,p_prompt=>'Valor 2'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_select clob;',
'',
'    v_id_cnvnio_atrbto    gf_d_convenios_atributo.id_cnvnio_atrbto%type;',
'    v_tpo_objto           gf_d_convenios_atributo.tpo_objto%type;    ',
'',
'    cursor c_select  is',
'     select cnslta_slct ',
'       from gf_d_convenios_atributo ',
'      where id_cnvnio_atrbto = v_id_cnvnio_atrbto;  ',
'  ',
' ',
'begin',
'    v_id_cnvnio_atrbto := :P39_ID_CNVNIO_ATRBTO;',
'',
'    if v_id_cnvnio_atrbto is not null then',
'        open c_select;',
'        fetch c_select into v_select;',
'',
'        close c_select;',
'           ',
'        -- v_select := ''select dscrpcion_estrto, cdgo_estrto  from df_s_estratos order by cdgo_estrto '';',
'        return v_select;',
'     end if;',
'',
'',
'end;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_id_cnvnio_atrbto gf_d_convenios_atributo.id_cnvnio_atrbto%type;',
'begin',
'    if :P39_ID_OPRDOR_TPO in (9,10) then  -- Es Nulo, No es Nulo        ',
'       return false;',
'     else ',
'         begin',
'             select id_cnvnio_atrbto',
'              into v_id_cnvnio_atrbto',
'              from gf_d_convenios_atributo ',
'             where id_cnvnio_atrbto = :P39_ID_CNVNIO_ATRBTO ',
'               and tpo_objto = ''SELECT_LIST'';  ',
'               insert into gti_aux (col1, col2) values (1, ''Entro''); commit;',
'               ',
'             return true;',
'          exception ',
'              when no_data_found then ',
'                  return false;',
'          end;',
'    end if;',
'end;'))
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42042413247356540)
,p_name=>'P39_CDGO_SJTO_TPO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(35406900999267615)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_SJTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42343871396115407)
,p_name=>'P39_ID_CNVNIO_TPO_CNDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(35406900999267615)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_CNVNIO_TPO_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42348047610115449)
,p_name=>'P39_ID_CNVNIO_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(35406900999267615)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(49695384982059404)
,p_validation_name=>'Valida Campos'
,p_validation_sequence=>10
,p_validation=>':P39_VLOR_1_SELECT_LIST is not null or :P39_VLOR_2_SELECT_LIST is not null or :P39_VLOR_1_TEXT is not null or :P39_VLOR_2_TEXT is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00A1Ingrese los valores!')
,p_validation_condition=>'BTN_INSERTAR,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42347693942115445)
,p_name=>'Actualizar Pagina'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_ID_CNVNIO_ATRBTO,P39_ID_OPRDOR_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42347849695115447)
,p_event_id=>wwv_flow_api.id(42347693942115445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR_1_SELECT_LIST,P39_VLOR_1_TEXT,P39_VLOR_2_SELECT_LIST,P39_VLOR_2_TEXT'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42347718139115446)
,p_event_id=>wwv_flow_api.id(42347693942115445)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49695093405059401)
,p_name=>'Al Seleccionar Atributo'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_ID_CNVNIO_ATRBTO'
,p_condition_element=>'P39_ID_CNVNIO_ATRBTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_BE.CTB.SELECT2|ITEM TYPE|slctchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49695186369059402)
,p_event_id=>wwv_flow_api.id(49695093405059401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_ID_OPRDOR_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49695208639059403)
,p_event_id=>wwv_flow_api.id(49695093405059401)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_ID_OPRDOR_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40609919853732808)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insertar Atributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_tpo_objto           gf_d_convenios_atributo.tpo_objto%type;',
'    v_vlor1               gf_d_convenios_tipo_cndcion.vlor1%type;',
'    v_vlor2               gf_d_convenios_tipo_cndcion.vlor2%type;',
'    ',
'begin',
'    begin',
'        select  tpo_objto',
'          into  v_tpo_objto',
'          from gf_d_convenios_atributo ',
'         where id_cnvnio_atrbto = :P39_ID_CNVNIO_ATRBTO;',
'                  ',
'         if v_tpo_objto = ''TEXT'' then',
'            v_vlor1 := :P39_VLOR_1_TEXT;',
'            v_vlor2 := :P39_VLOR_2_TEXT;',
'',
'        elsif v_tpo_objto = ''SELECT_LIST'' then',
'            v_vlor1 := :P39_VLOR_1_SELECT_LIST;',
'            v_vlor2 := :P39_VLOR_2_SELECT_LIST;',
'        end if; ',
'                    ',
'        ',
'        if :P39_ID_CNVNIO_TPO_CNDCION is null then',
'            ',
'            insert into gf_d_convenios_tipo_cndcion (id_cnvnio_tpo, id_cnvnio_atrbto, id_oprdor_tpo, vlor1, vlor2 ) ',
'                                             values (:P38_ID_CNVNIO_TPO, :P39_ID_CNVNIO_ATRBTO, :P39_ID_OPRDOR_TPO, v_vlor1, v_vlor2);',
'',
'            commit; ',
'        end if; ',
'    ',
'    exception ',
'        when no_data_found then ',
unistr('            raise_application_error(-20001, ''Error al Guardar las condiciones, \00A1Seleccione Un Atributo!'');'),
'    end;                          ',
'end;'))
,p_process_error_message=>'Error al insertar el Atributo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35407291351267618)
,p_process_success_message=>'Atributo Guardado Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46591471061325209)
,p_process_sequence=>30
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Cambios Atributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_tpo_objto           gf_d_convenios_atributo.tpo_objto%type;',
'    v_vlor1               gf_d_convenios_tipo_cndcion.vlor1%type;',
'    v_vlor2               gf_d_convenios_tipo_cndcion.vlor2%type;',
'    ',
'begin',
'    begin',
'        select  tpo_objto',
'          into  v_tpo_objto',
'          from gf_d_convenios_atributo ',
'         where id_cnvnio_atrbto = :P39_ID_CNVNIO_ATRBTO;',
'         ',
'         if v_tpo_objto = ''TEXT'' then',
'            v_vlor1 := :P39_VLOR_1_TEXT;',
'            v_vlor2 := :P39_VLOR_2_TEXT;',
'',
'        elsif v_tpo_objto = ''SELECT_LIST'' then',
'            v_vlor1 := :P39_VLOR_1_SELECT_LIST;',
'            v_vlor2 := :P39_VLOR_2_SELECT_LIST;',
'        end if; ',
'              ',
'        if :P39_ID_CNVNIO_TPO_CNDCION is not null then',
'        ',
'            update gf_d_convenios_tipo_cndcion ',
'               set id_cnvnio_tpo = :P39_ID_CNVNIO_TPO, ',
'                   id_cnvnio_atrbto = :P39_ID_CNVNIO_ATRBTO, ',
'                   id_oprdor_tpo = :P39_ID_OPRDOR_TPO, ',
'                   vlor1 = v_vlor1 , ',
'                   vlor2 = v_vlor2',
'             where id_cnvnio_tpo_cndcion = :P39_ID_CNVNIO_TPO_CNDCION;',
'',
'             commit;',
'        end if; ',
'    ',
'    exception ',
'        when no_data_found then ',
'            raise_application_error(-20001, ''Error al Modificar el atributo.'');',
'    end;                          ',
'end;'))
,p_process_error_message=>'Error al aplicar cambios al Atributo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46591329892325208)
,p_process_success_message=>'Atributo Actualizado Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46302323855452808)
,p_process_sequence=>40
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Atributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from gf_d_convenios_tipo_cndcion ',
'      where ID_CNVNIO_TPO_CNDCION = :P39_ID_CNVNIO_TPO_CNDCION;  '))
,p_process_error_message=>'Error al Eliminar el Atributo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46302261126452807)
,p_process_success_message=>'Atributo Eliminado Exitosamente'
);
end;
/
