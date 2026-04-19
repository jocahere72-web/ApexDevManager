prompt --application/pages/page_00132
begin
wwv_flow_api.create_page(
 p_id=>132
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Seleccion de candidatos mediante carga de archivos'
,p_page_mode=>'MODAL'
,p_step_title=>'Seleccion de candidatos mediante carga de archivos'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(17323495682919353)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20250116092619'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142943598696884604)
,p_plug_name=>'Cargue y procesamiento de archivo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(142944321645884612)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(142943598696884604)
,p_button_name=>'BTN_INSRTAR_ARCHVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P132_ID_PRCSO_CRGA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(142945279323884621)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(142943598696884604)
,p_button_name=>'BTN_PRCSAR_ARCHVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P132_ID_PRCSO_CRGA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-upload-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3883479254930815)
,p_name=>'P132_ID_PRCSO_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4706556128087613)
,p_name=>'P132_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4706693688087614)
,p_name=>'P132_ID_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4706747349087615)
,p_name=>'P132_VGNCIA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4706809243087616)
,p_name=>'P132_ID_PRDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142943633616884605)
,p_name=>'P132_ARCHVO_CBRO_JRDCO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_prompt=>'Archivo de candidatos'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142944729543884616)
,p_name=>'P132_CDGO_ARCHVO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_item_default=>'EX'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142944908596884618)
,p_name=>'P132_ID_CRGA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142945052308884619)
,p_name=>'P132_LNEAS_ENCBZDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_item_default=>'5'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142945132938884620)
,p_name=>'P132_ID_PRCSO_CRGA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142945404216884623)
,p_name=>'P132_ID_PRCSO_SMU_LOTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(142943598696884604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142944190380884610)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_NL.AMIS.SCHEFFER.PROCESS.EXCEL2COLLECTION'
,p_process_name=>'Procesar_Archivo_Excel'
,p_attribute_01=>'P132_ARCHVO_CBRO_JRDCO'
,p_attribute_02=>'ETLEXC'
,p_attribute_04=>';'
,p_attribute_05=>'"'
,p_attribute_07=>'Y'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(142944321645884612)
,p_process_when=>'P132_CDGO_ARCHVO_TPO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'EX'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142944855625884617)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar_Carga_Excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_temp_files apex_application_temp_files%rowtype;',
'  v_count      number;',
'  filecounts   exception;',
'  v_mnsje      clob;',
'begin',
'',
'  select *',
'    into v_temp_files',
'    from apex_application_temp_files',
'   where name = :P132_ARCHVO_CBRO_JRDCO;',
'',
'  select count(*)',
'    into v_count',
'    from et_g_procesos_carga',
'   where cdgo_clnte = :F_CDGO_CLNTE',
'     and file_name = v_temp_files.filename;',
'',
'  if (v_count > 0) then',
'    v_mnsje := ''El archivo '' || v_temp_files.filename ||',
'               '', ya se encuentra procesado'';',
'    raise filecounts;',
'  end if;',
'',
'  begin',
'    insert into et_g_procesos_carga',
'      (id_crga,',
'       cdgo_clnte,',
'       id_impsto,',
'       vgncia,',
'       file_blob,',
'       file_name,',
'       file_mimetype,',
'       cdgo_prcso_estdo,',
'       id_adtria,',
'       lneas_encbzdo,',
'       id_impsto_sbmpsto,',
'       id_prdo,',
'       id_usrio)',
'    values',
'      (:P132_ID_CRGA,',
'       :F_CDGO_CLNTE,',
'       :P132_ID_IMPSTO,',
'       :P132_VGNCIA,',
'       v_temp_files.blob_content,',
'       v_temp_files.filename,',
'       v_temp_files.mime_type,',
'       ''SE'',',
'       null,',
'       :P132_LNEAS_ENCBZDO,',
'       :P132_ID_IMPSTO_SBMPSTO,',
'       :P132_ID_PRDO,',
'       :F_ID_USRIO)',
'    returning id_prcso_crga into :P132_ID_PRCSO_CRGA;',
'  exception',
'    when others then',
'      v_mnsje := ''Falla al registrer en et_g_procesos_carga. '' || sqlerrm;',
'      raise filecounts;',
'  end;',
'  commit;',
'',
'exception',
'  when filecounts then',
'    :P132_ID_PRCSO_CRGA := null;',
'    raise_application_error(-20003, v_mnsje);',
'  when others then',
'    :P132_ID_PRCSO_CRGA := null;',
'    raise_application_error(-20002, v_mnsje);',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(142944321645884612)
,p_process_when=>'P132_CDGO_ARCHVO_TPO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'EX'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142945325236884622)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar_Excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(1000);',
'begin',
'   ',
'     if :P132_ID_PRCSO_TPO = 1 then ',
'         pkg_cb_proceso_persuasivo.prc_rg_seleccion_cnddts_archvo(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                                  p_id_prcso_crga      => :P132_ID_PRCSO_CRGA,',
'                                                                  p_id_lte             => :P132_ID_PRCSO_SMU_LOTE,',
'                                                                  o_cdgo_rspsta        => o_cdgo_rspsta,',
'                                                                  o_mnsje_rspsta       => o_mnsje_rspsta);',
'    else',
'        pkg_gn_generalidades.prc_rg_seleccion_cnddts_archvo(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                            p_id_prcso_crga      => :P132_ID_PRCSO_CRGA,',
'                                                            p_id_lte             => :P132_ID_PRCSO_SMU_LOTE,',
'                                                            o_cdgo_rspsta        => o_cdgo_rspsta,',
'                                                            o_mnsje_rspsta       => o_mnsje_rspsta);',
'        ',
'    end if;',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        raise_application_error(-20001, o_mnsje_rspsta);',
'    end if;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(142945279323884621)
,p_process_when=>'P132_ID_PRCSO_CRGA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Proceso realizado exitosamente!'
);
end;
/
