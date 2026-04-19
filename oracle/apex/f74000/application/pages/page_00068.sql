prompt --application/pages/page_00068
begin
wwv_flow_api.create_page(
 p_id=>68
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Requerimiento de Inscripci\00F3n')
,p_step_title=>unistr('Requerimiento de Inscripci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'async function generarActo(p_id_expdnte_acto){',
'    console.log(''pageId:''+pageId)',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'    console.log(''entrando al JS:''+pageId)',
'    await apex.server.process("generarActo", {',
'            pageItems: "#P"+pageId+"_ID_CNDDTO",',
'            x01: p_id_expdnte_acto}, {',
'            success: function(data) {',
'                    console.log(''DATA:''+JSON.stringify(data));',
'                    if (data.cdgo_rspsta > 0) {',
'                        console.log(''ERROR:''+data.mnsje_rspsta)',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([{',
'                            type: "error",',
'                            location: "page",',
'                            message: data.mnsje_rspsta,',
'                            unsafe: false',
'                        }]);',
'                    } else {',
'                        console.log(''OK:''+data.mnsje_rspsta)',
'                        apex.submit();',
'                    }',
'                }',
'            })',
'    }catch(e){',
'        console.error(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};'))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20240711225610'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(199794045964816588)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(203241976387053988)
,p_plug_name=>unistr('Proceso Fiscalizaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.CANDIDATO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'F_ID_INSTNCIA_FLJO'
,p_attribute_02=>'F_ID_FLJO_TREA'
,p_attribute_03=>'P68_ID_SJTO_IMPSTO'
,p_attribute_04=>'F_ID_FNCNRIO'
,p_attribute_05=>'P68_ID_FSCLZCION_EXPDNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(203392343458694888)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(36499891555968649)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(336887532845519352)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(354062892909675886)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'',
'<p align="justify">',
unistr('<i>Funcionalidad que permite generar, modificar, visualizar y confirmar los actos parametrizados en la etapa del Emplazamiento que no requieren confirmaci\00F3n por el supervisor.</i>'),
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(145118109194144826)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(336887532845519352)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145115403923144793)
,p_name=>'P68_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(203392343458694888)
,p_prompt=>'Id Sjto Impsto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145115867423144797)
,p_name=>'P68_ID_CNDDTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(203392343458694888)
,p_prompt=>'Id Cnddto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145116285467144797)
,p_name=>'P68_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(203392343458694888)
,p_prompt=>'Id Dclrcion Vgncia Frmlrio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145116683123144797)
,p_name=>'P68_ID_FSCLZCION_EXPDNTE_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(203392343458694888)
,p_prompt=>'Id Fsclzcion Expdnte Acto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145117026288144809)
,p_name=>'P68_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(203392343458694888)
,p_prompt=>'Id Impsto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145117411997144811)
,p_name=>'P68_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(203392343458694888)
,p_prompt=>'Id Fsclzcion Expdnte'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(145118888089144830)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga informaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    begin',
'    ',
'        select a.id_cnddto,',
'               a.id_sjto_impsto,',
'               a.id_impsto,',
'               c.id_fsclzcion_expdnte',
'        into   :P68_ID_CNDDTO,',
'               :P68_ID_SJTO_IMPSTO,',
'               :P68_ID_IMPSTO,',
'               :P68_ID_FSCLZCION_EXPDNTE',
'        from v_fi_g_candidatos          a',
'        join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'        join v_si_i_sujetos_impuesto    d on a.id_sjto_impsto   = d.id_sjto_impsto',
'        where c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'',
'    exception',
'        when others then',
'            :P68_ID_CNDDTO    := null;',
'            :P68_ID_SJTO_IMPSTO := null;',
'            :P68_ID_IMPSTO := null;',
'            :P68_ID_FSCLZCION_EXPDNTE := null;',
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(145119246692144831)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar(1000);',
'    v_xml             clob;',
'',
'begin',
'',
'    pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                     p_id_usrio                    => :F_ID_USRIO,  ',
'                                     p_id_fsclzcion_expdnte_acto   => :P68_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                     p_id_cnddto                   => :P68_ID_CNDDTO,',
'                                     o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                     o_mnsje_rspsta                => v_mnsje_rspsta);',
'                                                      ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GENERAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31676771455741378)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'generarActo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number         := 0;',
'    v_mnsje_rspsta   varchar2(4000) := ''OK'';',
'    v_id_expdnte_acto number        := apex_application.g_x01;',
'',
'begin',
'    :P68_ID_FSCLZCION_EXPDNTE_ACTO := v_id_expdnte_acto;    ',
'    begin',
'        pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                         p_id_usrio                    => :F_ID_USRIO,  ',
'                                         p_id_fsclzcion_expdnte_acto   => :P68_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                         p_id_cnddto                   => :P68_ID_CNDDTO,',
'                                         o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                         o_mnsje_rspsta                => v_mnsje_rspsta);',
'    end;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'        rollback;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
