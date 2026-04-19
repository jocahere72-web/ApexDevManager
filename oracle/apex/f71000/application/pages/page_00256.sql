prompt --application/pages/page_00256
begin
wwv_flow_api.create_page(
 p_id=>256
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Rechazo / Aprobaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Rechazo / Aprobaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P256_MOTIVO{',
'  resize:none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'600'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20231202015618'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10066885385873824)
,p_plug_name=>'Motivo de Rechazo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10067000018873826)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10066885385873824)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10066980332873825)
,p_name=>'P256_MOTIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10066885385873824)
,p_display_as=>'NATIVE_TEXTAREA'
,p_cHeight=>10
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10067540230873831)
,p_name=>'P256_INDCDOR_MTVO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10066885385873824)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15715844472621601)
,p_name=>'P256_ID_TTLO_JDCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10066885385873824)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18555269110169301)
,p_name=>'P256_TTLOS_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(10066885385873824)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10067678337873832)
,p_name=>'Al hacer clic'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10067000018873826)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10067730185873833)
,p_event_id=>wwv_flow_api.id(10067678337873832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_actualizarEstadoTitulos(){',
'    try{',
'        ',
'        var json = window.localStorage.jsonTitulosJudicialesRegistrados;',
'            ',
'        apex.server.process("ajaxActualizarEstadoTitulos", {',
'            f01: json,',
'            pageItems: "#P256_INDCDOR_MTVO, #P256_MOTIVO"',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }',
'                else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    setTimeout(function() {redirect(data.o_url)}, 2000);  ',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm("Est\00E1 seguro de rechazar los T\00EDtulos Judiciales", function(okPressed){'),
'    if(okPressed){',
'        fnc_actualizarEstadoTitulos();',
'    }',
'});',
'',
'function redirect(url){',
'    window.location.href = url;   ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18562923628840580)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Construir Json T\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P256_TTLOS_JSON',
'                from (',
'                    select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10067800460873834)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxActualizarEstadoTitulos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_titulos        clob;',
'v_cdgo_rspsta    number;',
'v_mnsje_rspsta   varchar2(3000);',
'v_url            varchar2(1000);',
'begin',
'',
'    /*for i in 1..apex_application.g_f01.count loop',
'        v_titulos := v_titulos || apex_application.g_f01(i);',
'    end loop;*/',
'        ',
'    pkg_gf_titulos_judicial.prc_ac_titulos_judicial(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                    p_id_usrio           => :F_ID_USRIO,',
'                                                    /*p_json_ttlos     => v_titulos,',
'                                                    p_id_ttlo_jdcial => :P256_ID_TTLO_JDCIAL,*/',
'                                                    p_json_ttlos_pry     => :P256_TTLOS_JSON,',
'                                                    p_indcdor_mtvo       => :P256_INDCDOR_MTVO, ',
'                                                    p_obsrvcion          => :P256_MOTIVO,',
'                                                    p_id_instncia_fljo   => :F_ID_INSTNCIA_FLJO,',
'                                                    p_id_fljo_trea       => :F_ID_FLJO_TREA,',
'                                                    o_url                => v_url,',
'                                                    o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta       => v_mnsje_rspsta);',
'                                                    ',
'                                                    ',
'    owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    v_url := apex_util.prepare_url(''f?p=''|| v(''APP_ID'') || '':249:''|| v(''APP_SESSION'') || v_url);',
'   ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||'',',
'            "o_mnsje_rspsta":"''||v_mnsje_rspsta||''",',
'            "o_url":    "''||v_url||''"    ',
'          }'');                                                    ',
'    ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
