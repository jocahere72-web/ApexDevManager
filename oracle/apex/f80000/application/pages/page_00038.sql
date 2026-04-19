prompt --application/pages/page_00038
begin
wwv_flow_api.create_page(
 p_id=>38
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Proceso de Seleccion Masiva MC'
,p_page_mode=>'MODAL'
,p_step_title=>'Proceso de Seleccion Masiva MC'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(17323495682919353)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'40%'
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20211108135931'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120433699721779690)
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
 p_id=>wwv_flow_api.id(74364499478712600)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(120433699721779690)
,p_button_name=>'BTN_PRCSAR_SQL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Regla'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74364891917712601)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(120433699721779690)
,p_button_name=>'BTN_NVA_RGLA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Nueva Regla'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74368211712712613)
,p_branch_name=>'Go To Page 907'
,p_branch_action=>'f?p=50000:907:&SESSION.::&DEBUG.:RP,907:P907_APP_ID,P907_PAGE_ID,P907_COD_PROCESO:80000,34,GMC&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(74364891917712601)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74365261714712602)
,p_name=>'P38_CONSULTA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(120433699721779690)
,p_prompt=>unistr('Regla de Selecci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_cnslta,',
'       b.id_cnslta_mstro',
'  from cs_d_procesos_sql a',
'  join cs_g_consultas_maestro b',
'    on b.id_prcso_sql = a.id_prcso_sql',
' where a.cdgo_prcso_sql = ''GMC''',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_sbcnslta_mstro is null',
'   and b.id_cnslta_mstro_gnral is not null',
'   and b.tpo_cndcion is null;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la regla jur\00EDdica para procesar la poblaci\00F3n de forma masiva.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74366196615712603)
,p_name=>'P38_ID_EMBRGOS_SMU_LTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(120433699721779690)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108347094047828803)
,p_name=>'P38_ID_TPOS_MDDA_CTLAR'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(120433699721779690)
,p_prompt=>'Tipo de Medida Cautelar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'';'))
,p_cHeight=>1
,p_display_when=>'P38_ID_EMBRGOS_SMU_LTE'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el tipo de medida cautelar que corresponde al proceso de selecci\00F3n masiva')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108347147895828804)
,p_name=>'P38_OBSERVACION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(120433699721779690)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P38_ID_EMBRGOS_SMU_LTE'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la observaci\00F3n que corresponda al proceso de selecci\00F3n masiva de medidas cautelares.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74366668956712611)
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
'    v_sql := ''select * from ('' || pkg_cs_constructorsql.fnc_co_sql_dinamica(:P38_CONSULTA) || '') where rownum = 1 and ''  || chr(39) ||  v_guid || chr(39) ||  '' = '' || chr(39) || v_guid || chr(39); ',
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
,p_associated_item=>wwv_flow_api.id(74365261714712602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74367038881712612)
,p_validation_name=>'Validar que tenga datos la consulta'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    Tiene_datos number(15):= 0;',
'    v_guid varchar2(33) := sys_guid();',
'begin',
'        Tiene_datos := 0;',
'        execute immediate ''select count(*) from (''||pkg_cs_constructorsql.fnc_co_sql_dinamica(:P38_CONSULTA)|| '') where ''||chr(39)||v_guid||chr(39)||'' = ''||chr(39)||v_guid||chr(39) into Tiene_datos;',
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
,p_associated_item=>wwv_flow_api.id(74365261714712602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74367380142712612)
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
'    pkg_cb_medidas_cautelares.prc_rg_slccion_msva_embrgos( p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                            p_lte_simu           => :P38_ID_EMBRGOS_SMU_LTE,',
'                                                            p_id_usuario         => :F_ID_USRIO,',
'                                                            p_id_cnslta_rgla     => :P38_CONSULTA,',
'                                                            p_id_tpos_mdda_ctlar => :P38_ID_TPOS_MDDA_CTLAR,',
'                                                            p_obsrvacion         => :P38_OBSERVACION,',
'                                                            p_lte_nvo            => :P34_ID_EMBRGOS_SMU_LTE) ;',
' ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(74364499478712600)
,p_process_success_message=>'Proceso Realizado de Forma Exitosa!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74367733501712612)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'cerrar dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
