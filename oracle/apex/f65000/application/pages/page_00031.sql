prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Actualizar Lote'
,p_page_mode=>'MODAL'
,p_step_title=>'Actualizar Lote'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191028102227'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122997266544442603)
,p_plug_name=>'Lote'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122997110323442602)
,p_plug_name=>'Edicto'
,p_parent_plug_id=>wwv_flow_api.id(122997266544442603)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122997474938442605)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(122997110323442602)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(122999258825442623)
,p_branch_name=>'Go To Page 21'
,p_branch_action=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,31:P22_ID_LOTE:&P31_ID_LOTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122997588783442606)
,p_name=>'P31_FCHA_INCIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(122997110323442602)
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122997657752442607)
,p_name=>'P31_DRCION_DIAS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122997110323442602)
,p_prompt=>unistr('Duraci\00F3n Dias')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122997794178442608)
,p_name=>'P31_DIA_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(122997110323442602)
,p_prompt=>'Tipo de Dia'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122997803124442609)
,p_name=>'P31_UBCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(122997110323442602)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122997902430442610)
,p_name=>'P31_FCHA_RGSTRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(122997110323442602)
,p_prompt=>'Fecha de Registro'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122998038543442611)
,p_name=>'P31_FCHA_FIN_ESTMDA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(122997110323442602)
,p_prompt=>'Fecha Fin Estimada'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122998181851442612)
,p_name=>'P31_ID_LOTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122997266544442603)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122998330316442614)
,p_name=>'P31_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(122997110323442602)
,p_prompt=>'Fecha Fin'
,p_format_mask=>'DD/MM/YYYY HH:MI:SS AM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122998458590442615)
,p_name=>'P31_FILE_EVDNCIA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(122997110323442602)
,p_prompt=>'Evidencia'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'image/*,application/pdf'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122998256386442613)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga Informaci\00F3n del lote')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_mdio                  nt_d_medio.cdgo_mdio%type;',
'    v_id_ntfcion_mdio_evdncia    nt_g_medio_entidad_evdncia.id_ntfcion_mdio_evdncia%type;',
'begin',
'    select c.cdgo_mdio,',
'           a.id_ntfcion_mdio_evdncia',
'    into  v_cdgo_mdio,',
'          v_id_ntfcion_mdio_evdncia',
'    from nt_g_lote a',
'    inner join v_nt_d_ntfccion_mdio_entdd c on a.id_entdad_clnte_mdio = c.id_entdad_clnte_mdio',
'    where id_lte = :P31_ID_LOTE;',
'    --Edicto',
'    if(v_cdgo_mdio = ''EDT'')then',
'        begin',
'            select  fcha_incio,',
'                    drcion_dias,',
'                    case dia_tpo',
unistr('                        when ''H'' then ''H\00E1bil '''),
'                        when ''C'' then ''Calendario''',
'                    end dia_tpo,',
'                    ubccion,',
'                    fcha_rgstro,',
'                    to_char(pk_util_calendario.calcular_fecha_final(p_cdgo_clnte       => :F_CDGO_CLNTE, ',
'                                                            p_fecha_inicial    => fcha_incio, ',
'                                                            p_tpo_dias         => dia_tpo, ',
'                                                            p_nmro_dias        => drcion_dias),''DD/MM/YYYY HH:MI:SS AM'')',
'            into    :P31_FCHA_INCIO,',
'                    :P31_DRCION_DIAS,',
'                    :P31_DIA_TPO,',
'                    :P31_UBCCION,',
'                    :P31_FCHA_RGSTRO,',
'                    :P31_FCHA_FIN_ESTMDA',
'            from nt_g_edicto',
'            where id_ntfcion_mdio_evdncia = v_id_ntfcion_mdio_evdncia;',
'        exception',
'            when no_data_found then',
'                null;',
'        end;',
'    end if;',
'exception',
'    when no_data_found then',
'        v_cdgo_mdio := null;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P31_ID_LOTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122998742711442618)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Edicto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_tpo varchar2(20);',
'    v_mnsje     varchar2(3000);',
'begin',
'    pkg_nt_notificacion.prc_ac_edicto(',
'        p_id_lte        => :P31_ID_LOTE,',
'        p_fcha_fin      => :P31_FCHA_FIN,',
'        p_file_evdncia  => :P31_FILE_EVDNCIA,',
'        p_id_fncnrio    => :F_ID_FNCNRIO,',
'        o_mnsje_tpo     => v_mnsje_tpo,',
'        o_mnsje         => v_mnsje',
'    );',
'',
'   if(v_mnsje_tpo = ''ERROR'') then',
'       RAISE_APPLICATION_ERROR (-20000,v_mnsje); ',
'   end if;',
'   ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(122997474938442605)
,p_process_success_message=>'Edicto Actualizado Exitosamente!'
);
end;
/
