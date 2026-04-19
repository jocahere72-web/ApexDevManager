prompt --application/pages/page_00211
begin
wwv_flow_api.create_page(
 p_id=>211
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Copiar Reporte Declaraciones'
,p_page_mode=>'MODAL'
,p_step_title=>'Copiar Reporte Declaraciones'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210616113729'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16121056120910287)
,p_plug_name=>'Copiar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13894011866864294)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(16121056120910287)
,p_button_name=>'btn_cnclar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13894472096864295)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16121056120910287)
,p_button_name=>'btn_grdar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Duplicar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13894887610864296)
,p_name=>'P211_ID_DCLRCION_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16121056120910287)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13895261422864297)
,p_name=>'P211_ID_DCLRCION_RPRTE_DSP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16121056120910287)
,p_item_default=>'select dscrpcion from gi_d_declaraciones_reporte where id_dclrcion_rprte = :P211_ID_DCLRCION_RPRTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Reporte Formulario'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13895698332864299)
,p_name=>'P211_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(16121056120910287)
,p_prompt=>unistr('Descripci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>200
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13896041733864300)
,p_name=>'P211_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(16121056120910287)
,p_prompt=>'Vigencia Formulario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion',
'     , a.id_dclrcion_vgncia_frmlrio ',
'  from gi_d_dclrcnes_vgncias_frmlr a ',
'  join gi_d_dclrcnes_tpos_vgncias b on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia',
'  join gi_d_declaraciones_tipo c on C.id_dclrcn_tpo = b.id_dclrcn_tpo',
'  join (select a.id_dclrcion_vgncia_frmlrio',
'             , b.id_frmlrio',
'          from gi_d_declaraciones_reporte a',
'          join gi_d_dclrcnes_vgncias_frmlr b',
'            on b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio',
'          where a.id_dclrcion_rprte = :P211_ID_DCLRCION_RPRTE) d  ',
'    on d.id_dclrcion_vgncia_frmlrio != a.id_dclrcion_vgncia_frmlrio',
'   and d.id_frmlrio = a.id_frmlrio;  '))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13896450550864301)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'duplicar reporte'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_dclrcion_rprte             number          :=  :P211_ID_DCLRCION_RPRTE;',
'    v_dscrpcion                     varchar2(200)   :=  :P211_DSCRPCION;',
'    v_id_dclrcion_vgncia_frmlrio    number          :=  :P211_ID_DCLRCION_VGNCIA_FRMLRIO;',
'    v_cdgo_clnte                    number          :=  :F_CDGO_CLNTE; ',
'    v_encbzdo                       clob;',
'    v_pie_pgna                      clob;',
'    v_cntndo                        clob;',
'begin',
'    begin',
'        select encbzdo',
'             , pie_pgna',
'             , cntndo',
'          into v_encbzdo',
'             , v_pie_pgna',
'             , v_cntndo',
'          from gi_d_declaraciones_reporte',
'         where id_dclrcion_rprte = v_id_dclrcion_rprte;',
'    exception',
'        when others then',
unistr('            raise_application_error(-20001, ''No se pudo obtener informaci\00F3n del reporte.'');'),
'    end;',
'    begin       ',
'        insert into gi_d_declaraciones_reporte(cdgo_clnte  , id_dclrcion_vgncia_frmlrio  , dscrpcion',
'                                             , cntndo      , pie_pgna                    , encbzdo  )',
'                                        values(v_cdgo_clnte, v_id_dclrcion_vgncia_frmlrio, v_dscrpcion',
'                                             , v_cntndo    , v_pie_pgna                  , v_encbzdo);',
'    ',
'    exception',
'        when others then',
unistr('            raise_application_error(-20001, ''No se pudo copiar la informaci\00F3n del reporte.''); '),
'    end;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(13894472096864295)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13896865707864301)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
