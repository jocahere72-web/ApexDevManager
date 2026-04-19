prompt --application/pages/page_00162
begin
wwv_flow_api.create_page(
 p_id=>162
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Lotes Selecci\00F3n Masiva')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Selecci\00F3n desde constructor de poblaci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'50%'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20191113134238'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99792850783764702)
,p_plug_name=>unistr('Selecci\00F3n Masiva')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99823041788014302)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(99792850783764702)
,p_button_name=>'BTN_PRCSAR_SQL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Regla'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37294156637773601)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(99792850783764702)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99823168443014303)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(99792850783764702)
,p_button_name=>'BTN_NVA_RGLA'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Nueva Regla'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'f?p=50000:907:&SESSION.::&DEBUG.:RP,907:P907_APP_ID,P907_PAGE_ID,P907_COD_PROCESO:&P162_APP_ID.,&P162_APP_PAGE_ID.,PRS'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99792929565764703)
,p_name=>'P162_CONSULTA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(99792850783764702)
,p_prompt=>unistr('Regla de Selecci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.nmbre_cnslta,',
'            a.id_cnslta_mstro',
'from        cs_g_consultas_maestro  a',
'inner join  cs_d_procesos_sql       b on b.id_prcso_sql   =   a.id_prcso_sql',
'where       b.cdgo_clnte            =   :F_CDGO_CLNTE',
'and         b.cdgo_prcso_sql        =   ''PRS''',
'and         a.tpo_cndcion           is  null',
'and         a.id_cnslta_mstro_gnral is  not null;'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la regla para procesar la poblaci\00F3n de forma masiva.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99822942350014301)
,p_name=>'P162_ID_PRSCRPCION_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(99792850783764702)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99823213669014304)
,p_name=>'P162_APP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99792850783764702)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99823330985014305)
,p_name=>'P162_APP_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99792850783764702)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(115150344412906402)
,p_name=>'Al hacer clic BTN_PRCSAR_SQL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(99823041788014302)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(115150439343906403)
,p_event_id=>wwv_flow_api.id(115150344412906402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_procesarReglaseleccion(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_procesarReglaseleccion", {',
'            pageItems: "#P162_ID_PRSCRPCION_LTE, #P162_CONSULTA"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    sessionStorage.setItem("v_msgInciarPrscpcion","Acci\00F3n procesada con \00E9xito.");'),
'                    window.location.href = pData.url;',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de procesar la regla de selecci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_procesarReglaseleccion();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(37294257651773602)
,p_name=>'Cerrar Ventana'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37294156637773601)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37294392321773603)
,p_event_id=>wwv_flow_api.id(37294257651773602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99823410172014306)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Procesar regla de selecci\00F3n masiva')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_xml          clob;',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''          ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION_LTE>''   ||:P162_ID_PRSCRPCION_LTE||''</ID_PRSCRPCION_LTE>'';',
'    v_xml := v_xml||''<ID_CNSLTA_MSTRO>''     ||:P162_CONSULTA         ||''</ID_CNSLTA_MSTRO>'';',
'    pkg_gf_prescripcion.prc_gn_prscrpcn_pblcion_msva		(p_xml								=>    v_xml',
'                                                            ,o_cdgo_rspsta						=>    v_cdgo_rspsta',
'                                                            ,o_mnsje_rspsta						=>    v_mnsje_rspsta',
'                                                            );',
'	if (v_cdgo_rspsta <> 0) then',
'		RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta); ',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(99823041788014302)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Poblaci\00F3n masiva agregada al lote No. &P162_ID_PRSCRPCION_LTE. con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108591534124526603)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Cuadro de Dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(99823041788014302)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115150233189906401)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_procesarReglaseleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_xml             clob;',
'    v_url             clob;',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''          ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION_LTE>''   ||:P162_ID_PRSCRPCION_LTE||''</ID_PRSCRPCION_LTE>'';',
'    v_xml := v_xml||''<ID_CNSLTA_MSTRO>''     ||:P162_CONSULTA         ||''</ID_CNSLTA_MSTRO>'';',
'    pkg_gf_prescripcion.prc_gn_prscrpcn_pblcion_msva		(p_xml								=>    v_xml',
'                                                            ,o_cdgo_rspsta						=>    v_cdgo_rspsta',
'                                                            ,o_mnsje_rspsta						=>    v_mnsje_rspsta',
'                                                            );',
'	/*apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;*/',
'    ',
'    owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    v_url := apex_util.prepare_url(''f?p=''|| v(''APP_ID'') || '':157:''|| v(''APP_SESSION'') || '':msgInciarPrscpcion:NO:::'');',
'    htp.p(''{"url":"'' || v_url || ''"'' || ',
'          '',"o_cdgo_rspsta" :'' ||v_cdgo_rspsta ||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_rspsta ||''"}'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
