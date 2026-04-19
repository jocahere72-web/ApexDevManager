prompt --application/pages/page_00075
begin
wwv_flow_api.create_page(
 p_id=>75
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Acto previo'
,p_step_title=>'Acto previo'
,p_autocomplete_on_off=>'OFF'
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
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'   $(''#BTN_SNCION'').click();',
'} );'))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241022000652'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81842601510900724)
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
 p_id=>wwv_flow_api.id(84499036492823024)
,p_plug_name=>unistr('Proceso Fiscalizaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.CANDIDATO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'F_ID_INSTNCIA_FLJO'
,p_attribute_02=>'F_ID_FLJO_TREA'
,p_attribute_03=>'P75_ID_SJTO_IMPSTO'
,p_attribute_04=>'F_ID_FNCNRIO'
,p_attribute_05=>'P75_ID_FSCLZCION_EXPDNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(276051999236780607)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(293225748795930352)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
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
unistr('<i>Funcionalidad que permite generar, modificar, visualizar y confirmar los actos parametrizados en la etapa Resoluci\00F3n por no declarar que no requieren confirmaci\00F3n por el supervisor.</i>'),
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
 p_id=>wwv_flow_api.id(23336174539169241)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(276051999236780607)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23336576624169243)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(276051999236780607)
,p_button_name=>'BTN_SNCION'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:77:&SESSION.::&DEBUG.:RP,77:P77_ID_FSCLZCION_EXPDNTE,P77_CDGO_ACTO_TPO,P77_ID_CNDDTO,P77_PGNA,P77_ID_SJTO_IMPSTO,P77_ID_IMPSTO_SBMPSTO,P77_ID_IMPSTO:&P75_ID_FSCLZCION_EXPDNTE.,CIV,&P75_ID_CNDDTO.,&APP_PAGE_ID.,&P75_ID_SJTO_IMPSTO.,&P75_ID_IMPSTO_SBMPSTO.,&P75_ID_IMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_fiscalizacion_sancion',
'where id_fsclzcion_expdnte = :P75_ID_FSCLZCION_EXPDNTE;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3609921027528101)
,p_name=>'P75_FNLZCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(84499036492823024)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23333472337169232)
,p_name=>'P75_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84499036492823024)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23333843186169234)
,p_name=>'P75_ID_CNDDTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84499036492823024)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23334224748169236)
,p_name=>'P75_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84499036492823024)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23334644578169236)
,p_name=>'P75_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84499036492823024)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23335006962169237)
,p_name=>'P75_ID_FSCLZCION_EXPDNTE_ACTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84499036492823024)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23335473682169237)
,p_name=>'P75_ID_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84499036492823024)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23372966243838801)
,p_name=>'P75_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84499036492823024)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24007975918593501)
,p_name=>'P75_CNCPTOS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(84499036492823024)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23338452341169246)
,p_name=>'Capturar el evento dialogclose'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23338947682169253)
,p_event_id=>wwv_flow_api.id(23338452341169246)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23337281041169245)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga informaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.id_cnddto,',
'           a.id_impsto,',
'           a.id_impsto_sbmpsto,',
'           a.id_sjto_impsto,           ',
'           c.id_fsclzcion_expdnte',
'    into   :P75_ID_CNDDTO,',
'           :P75_ID_IMPSTO,',
'           :P75_ID_IMPSTO_SBMPSTO,',
'           :P75_ID_SJTO_IMPSTO,',
'           :P75_ID_FSCLZCION_EXPDNTE',
'    from v_fi_g_candidatos          a',
'    join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'    join v_si_i_sujetos_impuesto    d on a.id_sjto_impsto   = d.id_sjto_impsto',
'    where c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'    ',
'',
'exception',
'    when others then',
'        :P75_ID_CNDDTO    := null;',
'        :P75_ID_SJTO_IMPSTO := null;',
'        :P75_ID_FSCLZCION_EXPDNTE := null;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23337608122169246)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar(1000);',
'    v_xml             clob;',
'    v_tpo_fiscalizacion    varchar2(3);',
'',
'begin',
'',
'        select b.indcdor_fsclzcion_tpo ',
'        into    v_tpo_fiscalizacion',
'        from    fi_g_candidatos a ',
'        join    fi_g_fiscalizacion_lote b on b.id_fsclzcion_lte = a.id_fsclzcion_lte',
'        where a.id_cnddto = :P75_ID_CNDDTO;',
'',
'    ',
'     pkg_fi_fiscalizacion.prc_rg_liquidacion(p_cdgo_clnte                =>  :F_CDGO_CLNTE,',
'                                            p_id_usrio                   =>  :F_ID_USRIO, ',
'                                            p_id_fsclzcion_expdnte       =>  :P75_ID_FSCLZCION_EXPDNTE,',
'                                            p_id_fsclzcion_expdnte_acto  =>  :P75_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                            p_tpo_fiscalizacion          =>  v_tpo_fiscalizacion,',
'                                            --p_json                 in  clob,',
'                                            o_cdgo_rspsta                =>  v_cdgo_rspsta,',
'                                            o_mnsje_rspsta               =>  v_mnsje_rspsta);',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20002, v_mnsje_rspsta);',
'    end if;',
'',
'',
'    pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                     p_id_usrio                    => :F_ID_USRIO,  ',
'                                     p_id_fsclzcion_expdnte_acto   => :P75_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                     p_id_cnddto                   => :P75_ID_CNDDTO,',
'                                     o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                     o_mnsje_rspsta                => v_mnsje_rspsta);',
'                                                      ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'',
'',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GENERAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23338071690169246)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Siguiente'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31605840779241902)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'generarActo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number         := 0;',
'    v_mnsje_rspsta   varchar2(4000) := ''OK'';',
'    v_id_expdnte_acto number        := apex_application.g_x01;',
'    v_tpo_fiscalizacion varchar2(3);',
'    v_vlor_ttal        number       := 0;',
'begin',
'    :P75_ID_FSCLZCION_EXPDNTE_ACTO := v_id_expdnte_acto;',
'    begin',
'        select b.indcdor_fsclzcion_tpo ',
'          into v_tpo_fiscalizacion',
'          from fi_g_candidatos a ',
'          join fi_g_fiscalizacion_lote b on b.id_fsclzcion_lte = a.id_fsclzcion_lte',
'         where a.id_cnddto = :P75_ID_CNDDTO;',
'    exception',
'        when others then',
'            v_cdgo_rspsta := 1;',
unistr('            v_mnsje_rspsta := ''No se pudo consultar el tipo de fiscalizaci\00F3n'';'),
'    end;  ',
'    begin',
'        pkg_fi_fiscalizacion.prc_rg_liquidacion( p_cdgo_clnte		          =>    :F_CDGO_CLNTE,',
'                                                 p_id_usrio                   =>    :F_ID_USRIO,',
'                                                 p_id_fsclzcion_expdnte       =>    :P75_ID_FSCLZCION_EXPDNTE,',
'                                                 p_id_fsclzcion_expdnte_acto  =>    :P75_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                 p_tpo_fiscalizacion          =>    v_tpo_fiscalizacion,',
'                                                 o_vlor_ttal                  =>    v_vlor_ttal, ',
'                                                 o_cdgo_rspsta		          =>    v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta	              =>    v_mnsje_rspsta);',
'    end;',
'    if v_cdgo_rspsta = 0 then',
'        begin',
'            pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                             p_id_usrio                    => :F_ID_USRIO,  ',
'                                             p_id_fsclzcion_expdnte_acto   => :P75_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                             p_id_cnddto                   => :P75_ID_CNDDTO,',
'                                             p_acto_vlor_ttal              => v_vlor_ttal,',
'                                             o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                             o_mnsje_rspsta                => v_mnsje_rspsta);',
'        end;',
'    else',
'        rollback;',
'        return;',
'    end if;',
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
