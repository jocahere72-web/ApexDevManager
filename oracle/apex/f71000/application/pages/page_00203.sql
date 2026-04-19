prompt --application/pages/page_00203
begin
wwv_flow_api.create_page(
 p_id=>203
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Saldo a Favor Documento'
,p_step_title=>'Plantilla'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_crgrDcmnto() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        CKEDITOR.instances.P203_TXTDCMNTO.setData('''');',
'        if ($v("P203_ID_SLDO_FVOR_DCMNTO")!== ""){',
'            const resp = await apex.server.process (''CargarDocumento'', {pageItems : "#P203_ID_SLDO_FVOR_DCMNTO"});  ',
'            await resolveAfter1Seconds(resp.v_dcmnto, resp.v_id_plntlla);',
'',
'        }',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'}',
'',
'function resolveAfter1Seconds(x, y) {',
'    return new Promise(resolve => {',
'        setTimeout(() => {',
'            apex.item( "P203_ID_PLNTLLA" ).setValue(y);',
'            CKEDITOR.instances.P203_TXTDCMNTO.insertHtml(x);',
'            if($v(''P203_EDIT'') == ''N''){',
'                CKEDITOR.instances.P203_TXTDCMNTO.setReadOnly([true])',
'            }',
'            resolve(x);',
'        }, 1500);',
'    });',
'}',
'',
'function fnc_gnrarDcmnto(){',
'    try {',
'        let $waitPopup = apex.widget.waitPopup();',
'        CKEDITOR.instances.P203_TXTDCMNTO.setData('''');',
'        apex.server.process (''GenerarPlantilla'', {pageItems : "#P203_ID_SOLICITUD, #P203_ID_SOLICITUD_SALDO_FAVOR, #P203_ID_SJTO_IMPSTO, #P203_ID_PLNTLLA"}).then((resp) => {        ',
'            CKEDITOR.instances.P203_TXTDCMNTO.insertHtml(resp.doc);',
'            $waitPopup.remove();',
'        });',
'    }catch(e){',
'        console.log(e);',
'        $waitPopup.remove();',
'    }',
'}',
'',
'async function fnc_gstnrDcmnto(p_request){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        var v_dcmnto = CKEDITOR.instances.P203_TXTDCMNTO.getData();',
'        await apex.server.process ( "GestionarPlantilla", {',
'            pageItems: "#P203_ID_PLNTLLA, #P203_ID_ACTO_TPO, #P203_TXTDCMNTO, #P203_ID_SOLICITUD_SALDO_FAVOR, #P203_ID_SLDO_FVOR_DCMNTO",',
'			f01: v_dcmnto,',
'			x01: p_request',
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
'					if (["Btn_Insertar","Btn_Aplicar_Cambios"].includes(p_request)){',
'						apex.item( "P203_ID_SLDO_FVOR_DCMNTO" ).setValue(pData.o_id_sldo_fvor_dcmnto);',
'					}else if (p_request == "Btn_Eliminar"){',
'						apex.item( "P203_ID_SLDO_FVOR_DCMNTO" ).setValue();',
'                        apex.item( "P203_ID_PLNTLLA" ).setValue();',
'                        CKEDITOR.instances.P203_TXTDCMNTO.setData('''');',
'					};',
unistr('                    window.sessionStorage.v_mnsje_rspsta = "Acci\00F3n procesada con \00E9xito."'),
'					apex.submit();',
'                }',
'            }',
'        });',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    fnc_crgrDcmnto();',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P203_TXTDCMNTO_DISPLAY{',
'    width: 100%;',
'}',
'#cke_P203_TXTDCMNTO{',
'    width: 100% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95408381756545401)
,p_plug_name=>'Documento'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177322596503050602)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95408480694545402)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(99838139230423903)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(486668262155080166)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'Funcionalidad que permite: <br><br>',
'',
'<i>',
'Seleccionar la plantilla.<br><br>',
'Generar la plantilla en el editor.<br><br>',
'Guardar la plantilla.<br><br>',
'Eliminar la plantilla.<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95481786715417505)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95408480694545402)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP,201::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95481451952417502)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(95408480694545402)
,p_button_name=>'Btn_Insertar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P203_ID_FLJO_TREA is null and :P203_ID_SLDO_FVOR_DCMNTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95481334424417501)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(95408480694545402)
,p_button_name=>'Btn_Generar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Generar Plantilla'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P203_ID_FLJO_TREA is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95481557996417503)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(95408480694545402)
,p_button_name=>'Btn_Aplicar_Cambios'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P203_ID_FLJO_TREA is null and :P203_ID_SLDO_FVOR_DCMNTO is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95481628184417504)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(95408480694545402)
,p_button_name=>'Btn_Eliminar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P203_ID_FLJO_TREA is null and :P203_ID_SLDO_FVOR_DCMNTO is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95408566003545403)
,p_name=>'P203_ID_PLNTLLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95408381756545401)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion',
'           ,a.id_plntlla',
'from        gn_d_plantillas         a',
'inner join  gn_d_actos_tipo_tarea   b   on  b.id_acto_tpo   =   a.id_acto_tpo',
'where       a.cdgo_clnte        =       :F_CDGO_CLNTE',
'and         b.id_acto_tpo       =       :P203_ID_ACTO_TPO',
'and         b.id_fljo_trea      =       :F_ID_FLJO_TREA',
'and         a.actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_display_when=>':P203_ID_FLJO_TREA is null'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95408645469545404)
,p_name=>'P203_TXTDCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95408381756545401)
,p_prompt=>'Plantilla'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.height = 400;',
'    opt.resize_enabled = false;',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return opt;',
'}'))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95449742271714801)
,p_name=>'P203_ID_ACTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99838139230423903)
,p_prompt=>'id tipo de acto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99838276684423904)
,p_name=>'P203_ID_SOLICITUD_SALDO_FAVOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(99838139230423903)
,p_prompt=>'id solicitud saldo a favor'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100223906175658102)
,p_name=>'P203_ID_SLDO_FVOR_DCMNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(99838139230423903)
,p_prompt=>'id del documento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102045687456968501)
,p_name=>'P203_EDIT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95408381756545401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109345950089986001)
,p_name=>'P203_ID_FLJO_TREA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(99838139230423903)
,p_prompt=>'id_fljo_trea'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110575832609725501)
,p_name=>'P203_ID_SOLICITUD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(99838139230423903)
,p_prompt=>'id_solicitud'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113149358643099201)
,p_name=>'P203_ID_SJTO_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(99838139230423903)
,p_prompt=>'ID_SJTO_IMPSTO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63444049296372002)
,p_name=>'Generar Plantilla'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(95481334424417501)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63444152877372003)
,p_event_id=>wwv_flow_api.id(63444049296372002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_gnrarDcmnto()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63444311206372005)
,p_name=>'Guardar Plantilla'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(95481451952417502)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63444466733372006)
,p_event_id=>wwv_flow_api.id(63444311206372005)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_gstnrDcmnto("Btn_Insertar");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63444523628372007)
,p_name=>'Actualizar'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(95481557996417503)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63444640166372008)
,p_event_id=>wwv_flow_api.id(63444523628372007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_gstnrDcmnto("Btn_Aplicar_Cambios");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63444764865372009)
,p_name=>'Eliminar Documento'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(95481628184417504)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63444854922372010)
,p_event_id=>wwv_flow_api.id(63444764865372009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_gstnrDcmnto("Btn_Eliminar");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63443913935372001)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarPlantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dcmnto clob;',
'begin',
'    apex_json.open_object;',
'    ',
'    begin',
'    ',
'        v_dcmnto :=  pkg_gn_generalidades.fnc_ge_dcmnto(p_xml => ''[{"ID_SLCTUD":''||:P203_ID_SOLICITUD||'',',
'                                                                    "ID_SLDO_FVOR_SLCTUD":''||:P203_ID_SOLICITUD_SALDO_FAVOR||'',',
'                                                                    "CDGO_CLNTE":''||:F_CDGO_CLNTE||'',',
'                                                                    "ID_SJTO_IMPSTO":''||:P203_ID_SJTO_IMPSTO||''}]'',',
'                                                                    p_id_plntlla    =>    :P203_ID_PLNTLLA);',
'                                                                    ',
'        apex_json.write(''type'', 0);',
unistr('        apex_json.write(''msg'', ''Acci\00F3n procesada con \00E9xito.'');'),
'        apex_json.write(''doc'', v_dcmnto);',
'    ',
'    end;',
'    ',
'    apex_json.close_object;    ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63444250989372004)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GestionarPlantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_id_sldo_fvor_dcmnto number;',
'    v_cdgo_rspsta         number;',
'    v_request             varchar2(50) := apex_application.g_x01;',
'    v_mnsje_rspsta        varchar2(1000);',
'    v_dcmnto              clob;',
'    v_exception           exception;',
'    ',
'begin',
'    ',
'    ',
'    begin',
'        ',
'        for i in 1..apex_application.g_f01.count loop',
'            v_dcmnto := v_dcmnto || apex_application.g_f01(i);',
'        end loop;',
'    ',
'        if v_dcmnto is null then',
'            v_cdgo_rspsta := 1;',
'            v_mnsje_rspsta := ''Genere la plantilla.'';',
'            raise v_exception;',
'        end if;',
'    ',
'    ',
'        pkg_gf_saldos_favor.prc_rg_saldos_favor_documento (p_cdgo_clnte			    =>    :F_CDGO_CLNTE,',
'                                                           p_id_fljo_trea		    =>    :F_ID_FLJO_TREA,',
'                                                           p_id_plntlla	            =>    :P203_ID_PLNTLLA,',
'                                                           p_id_acto_tpo			=>    :P203_ID_ACTO_TPO,',
'                                                           p_id_usrio_prycto		=>    :F_ID_USRIO,',
'                                                           p_dcmnto		            =>    v_dcmnto,',
'                                                           p_id_slctud_sldo_fvor	=>    :P203_ID_SOLICITUD_SALDO_FAVOR,',
'                                                           p_request                =>    v_request,',
'                                                           o_id_sldo_fvor_dcmnto    =>    v_id_sldo_fvor_dcmnto,',
'                                                           o_cdgo_rspsta            =>    v_cdgo_rspsta,',
'                                                           o_mnsje_rspsta           =>    v_mnsje_rspsta );',
'        ',
'        if v_cdgo_rspsta > 0 then',
'            raise v_exception;',
'         end if;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_id_sldo_fvor_dcmnto'', v_id_sldo_fvor_dcmnto);',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'    ',
'    exception ',
'        when v_exception then',
'            rollback;',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'            apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'            apex_json.close_object;',
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63444911485372011)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarDocumento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_plntlla    number;',
'    v_dcmnto        clob;',
'begin',
'    ',
'    begin',
'        select  a.id_plntlla,',
'                to_clob(a.dcmnto)',
'        into    v_id_plntlla,',
'                v_dcmnto',
'        from gf_g_saldos_favor_documento a',
'        where a.id_sldo_fvor_dcmnto = :P203_ID_SLDO_FVOR_DCMNTO;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''type'', 0);',
unistr('        apex_json.write(''msg'', ''Acci\00F3n procesada con \00E9xito.'');'),
'        apex_json.write(''v_id_plntlla'', v_id_plntlla);',
'        apex_json.write(''v_dcmnto'', v_dcmnto);',
'        apex_json.close_object; ',
'        ',
'    end;',
'    ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', 1);',
'            apex_json.write(''msg'', ''Error al cargar documento.'');',
'            apex_json.close_object; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
