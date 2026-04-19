prompt --application/pages/page_00080
begin
wwv_flow_api.create_page(
 p_id=>80
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Resoluci\00F3n Sanci\00F3n Por No Inscripci\00F3n')
,p_step_title=>unistr('Resoluci\00F3n Sanci\00F3n Por No Inscripci\00F3n')
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
,p_last_upd_yyyymmddhh24miss=>'20241021235624'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(250053924609656374)
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
 p_id=>wwv_flow_api.id(252710359591578674)
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
,p_attribute_03=>'P80_ID_SJTO_IMPSTO'
,p_attribute_04=>'F_ID_FNCNRIO'
,p_attribute_05=>'P80_ID_FSCLZCION_EXPDNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(444263322335536257)
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
 p_id=>wwv_flow_api.id(461437071894686002)
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
 p_id=>wwv_flow_api.id(191547325999924893)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(444263322335536257)
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
 p_id=>wwv_flow_api.id(191547710686924896)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(444263322335536257)
,p_button_name=>'BTN_SNCION'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP,31:P31_ID_FSCLZCION_EXPDNTE,P31_CDGO_ACTO_TPO,P31_ID_CNDDTO,P31_PGNA,P31_ID_SJTO_IMPSTO,P31_ID_PRGRMA,P31_ID_SBPRGRMA:&P80_ID_FSCLZCION_EXPDNTE.,RXN,&P80_ID_CNDDTO.,&APP_PAGE_ID.,&P80_ID_SJTO_IMPSTO.,&P80_ID_PRGRMA.,&P80_ID_SBPRGRMA.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_fiscalizacion_sancion',
'where id_fsclzcion_expdnte = :P16_ID_FSCLZCION_EXPDNTE',
'and actvo = ''S'';'))
,p_button_condition_type=>'NOT_EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31679549895798601)
,p_name=>'P80_ID_PRGRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(252710359591578674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31679624313798602)
,p_name=>'P80_ID_SBPRGRMA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(252710359591578674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191544757928924886)
,p_name=>'P80_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(252710359591578674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191545044474924890)
,p_name=>'P80_ID_CNDDTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(252710359591578674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191545454029924891)
,p_name=>'P80_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(252710359591578674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191545832859924891)
,p_name=>'P80_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(252710359591578674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191546275118924891)
,p_name=>'P80_ID_FSCLZCION_EXPDNTE_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(252710359591578674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191546605007924892)
,p_name=>'P80_ID_ACTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(252710359591578674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191549607768924903)
,p_name=>'Capturar el evento dialogclose'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191550181995924915)
,p_event_id=>wwv_flow_api.id(191549607768924903)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191548473790924902)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga informaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_cnddto,',
'           a.id_impsto,',
'           a.id_sjto_impsto,',
'           c.id_fsclzcion_expdnte,',
'           a.id_prgrma,',
'           a.id_sbprgrma',
'    into   :P80_ID_CNDDTO,',
'           :P80_ID_IMPSTO,',
'           :P80_ID_SJTO_IMPSTO,',
'           :P80_ID_FSCLZCION_EXPDNTE,',
'           :P80_ID_PRGRMA,',
'           :P80_ID_SBPRGRMA',
'    from v_fi_g_candidatos          a',
'    join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'    join v_si_i_sujetos_impuesto    d on a.id_sjto_impsto   = d.id_sjto_impsto',
'    where c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        :P80_ID_CNDDTO    := null;',
'        :P80_ID_SJTO_IMPSTO := null;',
'        :P80_ID_FSCLZCION_EXPDNTE := null;',
'        :P80_ID_PRGRMA := null;',
'        :P80_ID_SBPRGRMA := null;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(128076665412986283)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Base sanci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'	v_mnsje_rspsta    varchar(1000);',
'	v_rspta			varchar2(1);',
'    v_cdgo_acto_tpo    varchar2(5);',
'    v_id_acto_tpo    number;',
'    v_id_acto        number;',
'    v_sncion        number := 0;',
'begin',
'     insert into muerto (v_001,t_001)values(''P80_ID_FSCLZCION_EXPDNTE ''||:P80_ID_FSCLZCION_EXPDNTE, sysdate); commit;',
'',
'   begin',
'     select 1',
'        into   v_sncion',
'        from fi_g_fiscalizacion_sancion a ',
'        join gn_d_actos_tipo_tarea  b   on  a.id_acto_tpo = b.id_acto_tpo',
'        where a.id_fsclzcion_expdnte = :P80_ID_FSCLZCION_EXPDNTE',
'        and b.id_fljo_trea =  :F_ID_FLJO_TREA',
'        and rownum = 1;',
'   exception',
'       when no_data_found then',
'           v_sncion :=0;',
'       when others then',
'           insert into muerto (v_001,t_001)values(''error no encontro datos v_sncion ''||v_sncion, sysdate); commit;',
'   end;',
'    ',
'    ',
'    ',
'      insert into muerto (v_001,t_001)values(''v_id_acto : ''||v_id_acto ||'' -v_sncion :''||v_sncion, sysdate); commit;',
'    if  v_sncion = 0 then',
'	--if v_rspta = ''N'' then ',
'	    ',
unistr('		--Se elimina la sanci\00F3n registrada para actualizar el calculo de la sanci\00F3n a la fecha.'),
unistr('		 insert into muerto (v_001,t_001)values(''Antes de eliminar sanci\00F3n: '', sysdate); commit;'),
unistr('		--Se elimina la sanci\00F3n registrada para actualizar el calculo de la sanci\00F3n a la fecha.'),
'		begin',
'         delete from fi_g_fiscalizacion_sancion a ',
'		 where exists (select * from gn_d_actos_tipo_tarea b  ',
'                       where  a.id_acto_tpo = b.id_acto_tpo',
'                       and  b.id_fljo_trea =  :F_ID_FLJO_TREA )',
'         and a.id_fsclzcion_expdnte = :P80_ID_FSCLZCION_EXPDNTE ;',
'            exception',
'               when no_data_found then',
'                  null;',
'               when others then',
unistr('                   insert into muerto (v_001,t_001)values(''error al intentar eliminar la sanci\00F3n ''||v_sncion, sysdate); commit;'),
'       end;',
'     ',
'         ',
'         ',
'			--Se consulta si existe un impuesto acto para el tipo de acto ',
unistr('			--parametrizado en la etapa de pliego por no inscripci\00F3n.'),
'	',
'		begin',
'			select b.cdgo_acto_tpo',
'                   ,b.id_acto_tpo',
'			into   v_cdgo_acto_tpo',
'                  ,v_id_acto_tpo',
'			from gn_d_actos_tipo_tarea a ',
'			join gn_d_actos_tipo  b   on  a.id_acto_tpo = b.id_acto_tpo',
'			join df_i_impuestos_acto    c   on  b.cdgo_acto_tpo = c.cdgo_impsto_acto',
'			where a.id_fljo_trea = :F_ID_FLJO_TREA',
'			and b.indcdor_ntfccion = ''S'';',
'		exception',
'		when    too_many_rows   then ',
unistr('			v_mnsje_rspsta := ''Se encontro m\00E1s de un acto tipo con el c\00F3digo PDI o no existe el impuesto acto para pliego de cargo.'';'),
'			raise_application_error(-20001, v_mnsje_rspsta);',
'		when    others          then',
'			v_mnsje_rspsta := ''Error al consultar el tipo de acto PDI - pliego de cargo.'';',
'			raise_application_error(-20001, v_mnsje_rspsta);',
'		end;  ',
'        ',
unistr('        --registro la sanci\00F3n en fi_g_fiscalizacion_sancion'),
'		  insert into muerto (v_001,t_001)values(''antes de prc_rg_liquida_acto_sancion '', sysdate); commit;',
'                                              ',
'	 ',
'		pkg_fi_fiscalizacion.prc_rg_liquida_acto_sancion(p_cdgo_clnte		  =>    :F_CDGO_CLNTE,',
'                                                      p_id_instncia_fljo            =>    :F_ID_INSTNCIA_FLJO,',
'                                                      p_id_acto_tpo                =>    v_id_acto_tpo,',
'                                                      o_cdgo_rspsta		              =>    v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta	              =>    v_mnsje_rspsta);',
'                                                ',
'         		  insert into muerto (v_001,t_001)values(''despues de prc_rg_liquida_acto_sancion v_id_acto_tpo ''||v_id_acto_tpo, sysdate); commit;',
'',
'        if v_cdgo_rspsta > 0 then',
'          insert into muerto (v_001,t_001)values(''v_id_acto_tpo : ''||v_id_acto_tpo ||'' -v_mnsje_rspsta :''||v_mnsje_rspsta, sysdate); commit;',
'                                                ',
'		    raise_application_error(-20001, v_mnsje_rspsta);',
'	    end if;                                                ',
'',
'    end if;',
'',
'exception',
'    when others then',
'        :P80_ID_SJTO_IMPSTO := null;',
'        :P80_ID_CNDDTO := null;',
'        :P80_ID_FSCLZCION_EXPDNTE := null;',
'        :P80_ID_IMPSTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191548849656924903)
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
'                                     p_id_fsclzcion_expdnte_acto   => :P80_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                     p_id_cnddto                   => :P80_ID_CNDDTO,',
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
 p_id=>wwv_flow_api.id(191549259653924903)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Siguiente'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31678008262762714)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'generarActo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number         := 0;',
'    v_mnsje_rspsta   varchar2(4000) := ''OK'';',
'    v_id_expdnte_acto number        := apex_application.g_x01;',
'    v_vlor_ttal        number       := 0;',
'',
'begin',
'    :P80_ID_FSCLZCION_EXPDNTE_ACTO := v_id_expdnte_acto;',
'    begin',
'        pkg_fi_fiscalizacion.prc_rg_liquidacion( p_cdgo_clnte		          =>    :F_CDGO_CLNTE,',
'                                                 p_id_usrio                   =>    :F_ID_USRIO,',
'                                                 p_id_fsclzcion_expdnte       =>    :P80_ID_FSCLZCION_EXPDNTE,',
'                                                 p_id_fsclzcion_expdnte_acto  =>    :P80_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                 o_vlor_ttal                  =>    v_vlor_ttal, ',
'                                                 o_cdgo_rspsta		          =>    v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta	              =>    v_mnsje_rspsta);',
'    end;',
'    if v_cdgo_rspsta = 0 then',
'        begin',
'            pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                             p_id_usrio                    => :F_ID_USRIO,  ',
'                                             p_id_fsclzcion_expdnte_acto   => :P80_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                             p_id_cnddto                   => :P80_ID_CNDDTO,',
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
