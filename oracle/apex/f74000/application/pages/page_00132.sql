prompt --application/pages/page_00132
begin
wwv_flow_api.create_page(
 p_id=>132
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Seleccion de candidatos mediante carga de archivos'
,p_page_mode=>'MODAL'
,p_step_title=>'Seleccion de candidatos mediante carga de archivos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20240927173336'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146795261727898505)
,p_plug_name=>'Cargue y procesamiento de archivo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(146796357947898516)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(146795261727898505)
,p_button_name=>'BTN_INSRTAR_ARCHVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P132_ID_PRCSO_CRGA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(146796426566898517)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(146795261727898505)
,p_button_name=>'BTN_PRCSAR_ARCHVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P132_ID_PRCSO_CRGA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-upload-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146795390338898506)
,p_name=>'P132_ARCHVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146795261727898505)
,p_prompt=>'Archvo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146795447413898507)
,p_name=>'P132_CDGO_ARCHVO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(146795261727898505)
,p_item_default=>'EX'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146795500158898508)
,p_name=>'P132_ID_CRGA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(146795261727898505)
,p_item_default=>'EX'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146795662672898509)
,p_name=>'P132_LNEAS_ENCBZDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(146795261727898505)
,p_item_default=>'5'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146795759800898510)
,p_name=>'P132_ID_PRCSO_CRGA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(146795261727898505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146795833425898511)
,p_name=>'P132_ID_FSCLZCION_LTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(146795261727898505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(146796075874898513)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_NL.AMIS.SCHEFFER.PROCESS.EXCEL2COLLECTION'
,p_process_name=>'Procesar_Archivo_Excel'
,p_attribute_01=>'P132_ARCHVO'
,p_attribute_02=>'ETLEXC'
,p_attribute_04=>';'
,p_attribute_05=>'"'
,p_attribute_07=>'Y'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(146796357947898516)
,p_process_when=>'P132_CDGO_ARCHVO_TPO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'EX'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(146796116029898514)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar_Carga_Excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_temp_files apex_application_temp_files%rowtype;',
'    v_count      number;',
'    filecounts   exception;',
'begin',
'',
'    select * ',
'      into v_temp_files',
'      from apex_application_temp_files',
'     where name = :P132_ARCHVO;',
'     ',
'     select count(*)',
'       into v_count',
'       from et_g_procesos_carga',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'        and file_name  = v_temp_files.filename;',
'      ',
'      if ( v_count > 0 ) then',
'           raise filecounts;',
'      end if;',
'       ',
'    insert into et_g_procesos_carga ( id_crga , cdgo_clnte , id_impsto , vgncia , file_blob , file_name  , file_mimetype ',
'                                     , cdgo_prcso_estdo , id_adtria , lneas_encbzdo , id_impsto_sbmpsto , id_prdo , id_usrio ) ',
'                             values ( :P132_ID_CRGA , :F_CDGO_CLNTE , :P8_ID_IMPSTO , :P8_VGNCIA , v_temp_files.blob_content , v_temp_files.filename , v_temp_files.mime_type',
'                                    , ''SE'' , null , :P132_LNEAS_ENCBZDO , :P8_ID_IMPSTO_SBMPSTO , :P8_ID_PRDO , :F_ID_USRIO ) returning id_prcso_crga into :P132_ID_PRCSO_CRGA;',
'',
'exception ',
'     when filecounts then',
'          :P132_ID_PRCSO_CRGA := null;',
'          raise_application_error(-20003 , ''El archivo '' ||  v_temp_files.filename || '' ya se encuentra procesado.'');',
'     when others then ',
'          :P132_ID_PRCSO_CRGA := null;',
'          raise_application_error(-20002 , ''No fue posible cargar el archivo.'' );',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(146796357947898516)
,p_process_when=>'P132_CDGO_ARCHVO_TPO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'EX'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(146796217360898515)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar_Excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(1000);',
'begin',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_seleccion_cnddts_archvo(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                        p_id_prcso_crga      => :P132_ID_PRCSO_CRGA,',
'                                                        p_id_lte             => :P132_ID_FSCLZCION_LTE,',
'                                                        o_cdgo_rspsta        => o_cdgo_rspsta,',
'                                                        o_mnsje_rspsta       => o_mnsje_rspsta);',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        raise_application_error(-20001, o_mnsje_rspsta);',
'    end if;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(146796426566898517)
,p_process_when=>'P132_ID_PRCSO_CRGA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Proceso realizado exitosamente!'
);
end;
/
