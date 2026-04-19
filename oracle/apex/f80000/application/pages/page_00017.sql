prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Proceso de selecci\00F3n Masiva')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Proceso de selecci\00F3n Masiva')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function setear_codigo_proceso(){',
'    await apex.server.process(',
'            "set_item_session",',
'            {    ',
'                 pageItems: ''#P17_CDGO_PRCSO,#P17_ID_PRCSO_TPO''',
'            },',
'            {',
'                //dataType: ''text'',',
'                success: function( pData ){',
'                    console.log(''P17_CDGO_PRCSO'', pData.P17_CDGO_PRCSO);',
'                }',
'            }',
'        );',
'}',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item("P17_CDGO_PRCSO").setValue("GCB");',
'',
'if ($v(''P17_ID_PRCSO_TPO'') === ''1''){',
'    apex.item("P17_CDGO_PRCSO").setValue("GCP");',
'}',
'',
'setear_codigo_proceso();'))
,p_step_template=>wwv_flow_api.id(17323495682919353)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210721133144'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46069907064067102)
,p_plug_name=>unistr('Proceso de selecci\00F3n Masiva')
,p_region_name=>'region_regla'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46070586240067108)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(46069907064067102)
,p_button_name=>'BTN_PRCSAR_SQL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Regla'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50663607121664304)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(46069907064067102)
,p_button_name=>'BTN_NVA_RGLA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Nueva Regla'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50663770182664305)
,p_branch_name=>'Go To Page 907'
,p_branch_action=>'f?p=50000:907:&SESSION.::&DEBUG.:RP,907:P907_APP_ID,P907_PAGE_ID,P907_COD_PROCESO:80000,8,&P17_CDGO_PRCSO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(50663607121664304)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22604785215594212)
,p_name=>'P17_ID_PRCSO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46069907064067102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46070057253067103)
,p_name=>'P17_CONSULTA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46069907064067102)
,p_prompt=>unistr('Regla de Selecci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_cnslta,',
'       b.id_cnslta_mstro',
'  from cs_d_procesos_sql a',
'  join cs_g_consultas_maestro b',
'    on b.id_prcso_sql = a.id_prcso_sql',
' where a.cdgo_prcso_sql = case when :P17_ID_PRCSO_TPO = 1 then',
'                             ''GCP''',
'                          else',
'                              ''GCB''',
'                          end',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_sbcnslta_mstro is null',
'   and b.id_cnslta_mstro_gnral is not null',
'   and b.tpo_cndcion is null'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la regla jur\00EDdica para procesar la poblaci\00F3n de forma masiva.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46320371945533503)
,p_name=>'P17_ID_PRCSOS_SMU_LTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(46069907064067102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139402491156849548)
,p_name=>'P17_CDGO_PRCSO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(46069907064067102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(50148225419454801)
,p_validation_name=>'Validar Columnas correctas en consulta'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    type c_cursor_type is ref cursor;',
'    c_cursor           c_cursor_type;',
'    v_to_cursor_number number; ',
'    v_desc_table       dbms_sql.desc_tab;',
'    v_column_count     number;',
'    v_column_value     varchar2(4000);  ',
'    v_sql              clob;',
'    v_guid varchar2(33) := sys_guid();',
'    ',
'    V_contador_columnas number(5) := 0;',
'begin',
'    ',
'    v_sql := ''select * from ('' || pkg_cs_constructorsql.fnc_co_sql_dinamica(:P17_CONSULTA) || '') where rownum = 1 and ''  || chr(39) ||  v_guid || chr(39) ||  '' = '' || chr(39) || v_guid || chr(39); ',
'    open c_cursor for v_sql;',
'    v_to_cursor_number := dbms_sql.to_cursor_number(c_cursor);  ',
'    dbms_sql.describe_columns(v_to_cursor_number, v_column_count, v_desc_table);',
'                   ',
'    for i in 1 .. v_column_count loop',
'        dbms_sql.define_column(v_to_cursor_number, i, null, 4000);',
'    end loop;',
'    ',
'    while dbms_sql.fetch_rows(v_to_cursor_number) > 0 ',
'    loop       ',
'        ',
'        for i in 1 .. v_column_count loop                      ',
'            ',
'            if upper(v_desc_table(i).col_name) = ''ID_SJTO'' then',
'                V_contador_columnas := V_contador_columnas + 1;',
'            END IF;',
'            if upper(v_desc_table(i).col_name) = ''ID_SJTO_IMPSTO'' then',
'                V_contador_columnas := V_contador_columnas + 1;',
'            END IF;',
'            if upper(v_desc_table(i).col_name) = ''VGNCIA'' then',
'                V_contador_columnas := V_contador_columnas + 1;',
'            END IF;',
'            if upper(v_desc_table(i).col_name) = ''ID_PRDO'' then',
'                V_contador_columnas := V_contador_columnas + 1;',
'            END IF;',
'            if upper(v_desc_table(i).col_name) = ''ID_CNCPTO'' then',
'                V_contador_columnas := V_contador_columnas + 1;',
'            END IF;',
'            if upper(v_desc_table(i).col_name) = ''VLOR_SLDO_CPTAL'' then',
'                V_contador_columnas := V_contador_columnas + 1;',
'            END IF;',
'            if upper(v_desc_table(i).col_name) = ''VLOR_INTRES'' then',
'                V_contador_columnas := V_contador_columnas + 1;',
'            END IF;',
'                ',
'        end loop;',
'        ',
'    end loop;',
'    dbms_sql.close_cursor(v_to_cursor_number);',
'    ',
'    IF V_contador_columnas >= 7 THEN',
'        return true;',
'    ELSE',
'        return false;',
'    END IF;',
'        ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Se debe verificar la regla construida ya que no trae los datos requeridos para el procesamiento, alguno de estos datos no se encuentra contenida en la consulta: sujeto, sujeto de impuesto, vigencia, periodo, concepto, valor capital o valor inter\00E9s.')
,p_associated_item=>wwv_flow_api.id(46070057253067103)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(50148331492454802)
,p_validation_name=>'Validar que tenga datos la consulta'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    Tiene_datos number(15):= 0;',
'    v_guid varchar2(33) := sys_guid();',
'begin',
'        Tiene_datos := 0;',
'        execute immediate ''select count(*) from (''||pkg_cs_constructorsql.fnc_co_sql_dinamica(:P17_CONSULTA)|| '') where ''||chr(39)||v_guid||chr(39)||'' = ''||chr(39)||v_guid||chr(39) into Tiene_datos;',
'',
'        if Tiene_datos > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'La regla no contiene datos para procesar.'
,p_associated_item=>wwv_flow_api.id(46070057253067103)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46320268718533502)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Lote de Selecci\00F3n Masiva')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_lte_nvo cb_g_procesos_simu_lote.id_prcsos_smu_lte%type;',
'    ',
'begin ',
'',
'    pkg_cb_proceso_juridico.prc_rg_slccion_msva_prcs_jrdco( p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                            p_lte_simu       => :P17_ID_PRCSOS_SMU_LTE,',
'                                                            p_id_usuario     => :F_ID_USRIO,',
'                                                            p_id_cnslta_rgla => :P17_CONSULTA,',
'                                                            p_id_prcso_tpo   => :P17_ID_PRCSO_TPO,',
'                                                            p_lte_nvo        => :P8_ID_PRCSO_SMU_LOTE) ;',
' ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Proceso Realizado de Forma Exitosa!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50663586584664303)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'cerrar dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(139337739599762713)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_item_session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_UTIL.SET_SESSION_STATE (',
'        p_name     => ''P17_CDGO_PRCSO'',',
'        p_value    => :P17_CDGO_PRCSO);',
'        ',
'    APEX_UTIL.SET_SESSION_STATE (',
'        p_name     => ''P17_ID_PRCSO_TPO'',',
'        p_value    => :P17_ID_PRCSO_TPO); ',
'        ',
'    apex_json.open_object();',
'    apex_json.write(''P17_CDGO_PRCSO'', :P17_CDGO_PRCSO); ',
'    apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
