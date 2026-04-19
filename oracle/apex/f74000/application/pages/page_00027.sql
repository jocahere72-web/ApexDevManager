prompt --application/pages/page_00027
begin
wwv_flow_api.create_page(
 p_id=>27
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Pliego de Cargo'
,p_step_title=>'Pliego de Cargo'
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
,p_last_upd_yyyymmddhh24miss=>'20241107061019'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(130119745353219707)
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
 p_id=>wwv_flow_api.id(130189116218041274)
,p_plug_name=>'Proceso Fisca'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.CANDIDATO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'F_ID_INSTNCIA_FLJO'
,p_attribute_02=>'F_ID_FLJO_TREA'
,p_attribute_03=>'P27_ID_SJTO_IMPSTO'
,p_attribute_04=>'F_ID_FNCNRIO'
,p_attribute_05=>'P27_ID_FSCLZCION_EXPDNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217546389115283201)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
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
unistr('<i>Funcionalidad que permite generar, modificar, visualizar y confirmar los actos parametrizados en la etapa Auto de Archivo que no requieren confirmaci\00F3n por el supervisor.</i>'),
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(321958825269343382)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69457392335497948)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(321958825269343382)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12181191179917216)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(321958825269343382)
,p_button_name=>'BTN_SNCION'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,84:P84_ID_FSCLZCION_EXPDNTE,P84_CDGO_ACTO_TPO,P84_ID_CNDDTO,P84_PGNA,P84_ID_SJTO_IMPSTO,P84_ID_PRGRMA,P84_ID_SBPRGRMA,P84_ID_IMPSTO,P84_ID_SBIMPSTO:&P27_ID_FSCLZCION_EXPDNTE.,PCN,&P27_ID_CNDDTO.,&APP_PAGE_ID.,&P27_ID_SJTO_IMPSTO.,&P27_ID_PRGRMA.,&P27_ID_SBPRGRMA.,&P27_ID_IMPSTO.,&P27_ID_SBIMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_fiscalizacion_expdnte b',
'join fi_g_candidatos c on b.id_cnddto = c.id_cnddto',
'where b.id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
'and c.id_sbprgrma in (select x.id_sbprgrma',
'                        from fi_d_subprogramas x',
'                       where x.cdgo_sbprgrma = ''NEI'')',
'and not exists (select 1 ',
'                from fi_g_fiscalizacion_sancion a',
'                join gn_d_actos_tipo_tarea c on a.id_acto_tpo = c.id_acto_tpo',
'                where id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
'                and c.ID_FLJO_TREA = :F_ID_FLJO_TREA  )',
'',
'',
'',
'/*select 1 ',
'from fi_g_fiscalizacion_sancion a',
'where a.id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
';*/'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20053649587401605)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(321958825269343382)
,p_button_name=>'BTN_SNCION_1'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,84:P84_ID_FSCLZCION_EXPDNTE,P84_CDGO_ACTO_TPO,P84_ID_CNDDTO,P84_PGNA,P84_ID_SJTO_IMPSTO,P84_ID_PRGRMA,P84_ID_SBPRGRMA,P84_ID_IMPSTO,P84_ID_SBIMPSTO:&P27_ID_FSCLZCION_EXPDNTE.,PCE,&P27_ID_CNDDTO.,&APP_PAGE_ID.,&P27_ID_SJTO_IMPSTO.,&P27_ID_PRGRMA.,&P27_ID_SBPRGRMA.,&P27_ID_IMPSTO.,&P27_ID_SBIMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_fiscalizacion_expdnte b',
'join fi_g_candidatos c on b.id_cnddto = c.id_cnddto',
'where b.id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
'and c.id_sbprgrma in (select x.id_sbprgrma',
'                        from fi_d_subprogramas x',
'                       where x.cdgo_sbprgrma = ''EXT'')',
'and not exists (select 1 ',
'                from fi_g_fiscalizacion_sancion a',
'                join gn_d_actos_tipo_tarea c on a.id_acto_tpo = c.id_acto_tpo',
'                where id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
'                and c.ID_FLJO_TREA = :F_ID_FLJO_TREA  )',
'',
'',
'',
'/*select 1 ',
'from fi_g_fiscalizacion_sancion a',
'where a.id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
';*/'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20053707395401606)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(321958825269343382)
,p_button_name=>'BTN_SNCION_2'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,84:P84_ID_FSCLZCION_EXPDNTE,P84_CDGO_ACTO_TPO,P84_ID_CNDDTO,P84_PGNA,P84_ID_SJTO_IMPSTO,P84_ID_PRGRMA,P84_ID_SBPRGRMA,P84_ID_IMPSTO,P84_ID_SBIMPSTO:&P27_ID_FSCLZCION_EXPDNTE.,PCM,&P27_ID_CNDDTO.,&APP_PAGE_ID.,&P27_ID_SJTO_IMPSTO.,&P27_ID_PRGRMA.,&P27_ID_SBPRGRMA.,&P27_ID_IMPSTO.,&P27_ID_SBIMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_fiscalizacion_expdnte b',
'join fi_g_candidatos c on b.id_cnddto = c.id_cnddto',
'where b.id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
'and c.id_sbprgrma in (select x.id_sbprgrma',
'                        from fi_d_subprogramas x',
'                       where x.cdgo_sbprgrma = ''SML'')',
'and not exists (select 1 ',
'                from fi_g_fiscalizacion_sancion a',
'                join gn_d_actos_tipo_tarea c on a.id_acto_tpo = c.id_acto_tpo',
'                where id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
'                and c.ID_FLJO_TREA = :F_ID_FLJO_TREA  )',
'',
'',
'/*select 1 ',
'from fi_g_fiscalizacion_sancion a',
'where a.id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
';*/'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6693513728212502)
,p_name=>'P27_ID_SBIMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15090184142337601)
,p_name=>'P27_CDGO_ACTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20097070424338701)
,p_name=>'P27_ID_PRGRMA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20097150336338702)
,p_name=>'P27_ID_SBPRGRMA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33701810076850502)
,p_name=>'P27_FNLZCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69455492940496378)
,p_name=>'P27_ID_CNDDTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69455885542496394)
,p_name=>'P27_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69456231122496394)
,p_name=>'P27_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69456689354496394)
,p_name=>'P27_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69567363229588801)
,p_name=>'P27_ID_FSCLZCION_EXPDNTE_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(130189116218041274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12181504545932200)
,p_name=>'Capturar el evento dialogclose'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12181995434932782)
,p_event_id=>wwv_flow_api.id(12181504545932200)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69454598884486667)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga informaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.id_sjto_impsto,',
'           a.id_cnddto,',
'           a.id_impsto,',
'           a.id_impsto_sbmpsto,',
'           c.id_fsclzcion_expdnte,',
'           a.id_prgrma,',
'           a.id_sbprgrma',
'    into   :P27_ID_SJTO_IMPSTO,',
'           :P27_ID_CNDDTO,',
'           :P27_ID_IMPSTO,',
'           :P27_ID_SBIMPSTO,',
'           :P27_ID_FSCLZCION_EXPDNTE,',
'           :P27_ID_PRGRMA,',
'           :P27_ID_SBPRGRMA',
'    from v_fi_g_candidatos          a',
'    join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'    join v_si_i_sujetos_impuesto    d on a.id_sjto_impsto   = d.id_sjto_impsto',
'    where c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'',
'exception',
'    when others then',
'        :P27_ID_SJTO_IMPSTO := null;',
'        :P27_ID_CNDDTO := null;',
'        :P27_ID_FSCLZCION_EXPDNTE := null;',
'        :P27_ID_IMPSTO := null;',
'        :P27_ID_SBIMPSTO := null;',
'        :P27_ID_PRGRMA := null;',
'        :P27_ID_SBPRGRMA := null;',
'end',
'/*',
'begin',
'',
'',
'    select a.cdgo_acto_tpo',
'    into    :27_CDGO_ACTO_TPO',
'    from gn_d_actos_tipo        a',
'    join df_i_impuestos_acto    b   on  a.cdgo_acto_tpo   =   b.cdgo_impsto_acto',
'    join gn_d_actos_tipo_tarea        d   on  a.id_acto_tpo       = d.id_acto_tpo',
'    join fi_g_candidatos        c   on  b.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'    where a.cdgo_clnte = 70001',
'    --and a.cdgo_acto_tpo = ''RSPE''--in (''PCE'',''PCN'',''PCM'')',
'and d.id_fljo_trea = 132;',
'',
'exception',
'    when others then',
'        null;',
'end;*/',
';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(127646167364008201)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga informaci\00F3n_1')
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
'     insert into muerto (v_001,t_001)values(''P27_ID_FSCLZCION_EXPDNTE ''||:P27_ID_FSCLZCION_EXPDNTE, sysdate); commit;',
'',
'   begin',
'     select 1',
'        into   v_sncion',
'        from fi_g_fiscalizacion_sancion a ',
'        join gn_d_actos_tipo_tarea  b   on  a.id_acto_tpo = b.id_acto_tpo',
'        where a.id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
'        and b.id_fljo_trea =  :F_ID_FLJO_TREA',
'        and rownum = 1;',
'   exception',
'       when others then',
'           insert into muerto (v_001,t_001)values(''error no encontro datos v_sncion ''||v_sncion, sysdate); commit;',
'   end;',
'    ',
'    ',
'    ',
'      insert into muerto (v_001,t_001)values(''v_id_acto : ''||v_id_acto ||'' -v_sncion :''||v_sncion, sysdate); commit;',
'    if  v_sncion = 0  AND :P27_ID_FSCLZCION_EXPDNTE_ACTO IS null then',
'	--if v_rspta = ''N'' then ',
unistr('	     insert into muerto (v_001,t_001)values(''Antes de eliminar sanci\00F3n: '', sysdate); commit;'),
unistr('		--Se elimina la sanci\00F3n registrada para actualizar el calculo de la sanci\00F3n a la fecha.'),
'		 delete from fi_g_fiscalizacion_sancion a ',
'		 where exists (select * from gn_d_actos_tipo_tarea b  ',
'                       where  a.id_acto_tpo = b.id_acto_tpo',
'                       and  b.id_fljo_trea =  :F_ID_FLJO_TREA )',
'         and a.id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE',
'         ;',
'         ',
'         ',
'			--Se consulta si existe un impuesto acto para el tipo de acto ',
unistr('			--parametrizado en la etapa de pliego por no inscripci\00F3n.'),
'		',
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
'		  insert into muerto (v_001,t_001)values(''antes de prc_rg_liquida_acto_sancion REGISTRADA'', sysdate); commit;',
'                                              ',
'	 ',
'                    pkg_fi_fiscalizacion.prc_rg_liquida_acto(p_cdgo_clnte		  =>    :F_CDGO_CLNTE,',
'                                                            p_id_instncia_fljo    =>    :F_ID_INSTNCIA_FLJO,',
'                                                            p_id_acto_tpo         =>    v_id_acto_tpo,',
'                                                            o_cdgo_rspsta         =>    v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta        =>    v_mnsje_rspsta);',
'',
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
'        :P27_ID_SJTO_IMPSTO := null;',
'        :P27_ID_CNDDTO := null;',
'        :P27_ID_FSCLZCION_EXPDNTE := null;',
'        :P27_ID_IMPSTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69565267109575403)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar(1000);',
'',
'begin',
'   /* begin',
'     delete from fi_g_fiscalizacion_sancion a ',
'     where a.id_fsclzcion_expdnte = :P27_ID_FSCLZCION_EXPDNTE ;',
'     ',
unistr('          insert into muerto (v_001,t_001)values(''ELIMINAR SANCI\00D3N  ''||:P27_ID_FSCLZCION_EXPDNTE, sysdate); commit;'),
'',
'    exception',
'        when    others    then',
unistr('        v_mnsje_rspsta:= ''Error al intentar eliminar la base de la sanci\00F3n'';'),
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end;',
'    */',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_liquida_acto(p_cdgo_clnte		          =>    :F_CDGO_CLNTE,',
'                                             p_id_instncia_fljo           =>    :F_ID_INSTNCIA_FLJO,',
'                                             p_id_fsclzcion_expdnte_acto  =>    :P27_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                             o_cdgo_rspsta		          =>    v_cdgo_rspsta,',
'                                             o_mnsje_rspsta	              =>    v_mnsje_rspsta);',
'    ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;  ',
'                                            ',
'     pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                      p_id_usrio                    => :F_ID_USRIO,  ',
'                                      p_id_fsclzcion_expdnte_acto   => :P27_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                      p_id_cnddto                   => :P27_ID_CNDDTO,',
'                                      o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                      o_mnsje_rspsta                => v_mnsje_rspsta);',
'                                                      ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;                                      ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GENERAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30205048340952109)
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
'    :P27_ID_FSCLZCION_EXPDNTE_ACTO := v_id_expdnte_acto;    ',
'    begin',
'        pkg_fi_fiscalizacion.prc_rg_liquidacion( p_cdgo_clnte		          =>    :F_CDGO_CLNTE,',
'                                                 p_id_usrio                   =>    :F_ID_USRIO,',
'                                                 p_id_fsclzcion_expdnte       =>    :P27_ID_FSCLZCION_EXPDNTE,',
'                                                 p_id_fsclzcion_expdnte_acto  =>    :P27_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                 o_vlor_ttal                  =>    v_vlor_ttal, ',
'                                                 o_cdgo_rspsta		          =>    v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta	              =>    v_mnsje_rspsta);',
'    end;',
'    if v_cdgo_rspsta = 0 then',
'        begin',
'            pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                             p_id_usrio                    => :F_ID_USRIO,  ',
'                                             p_id_fsclzcion_expdnte_acto   => :P27_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                             p_id_cnddto                   => :P27_ID_CNDDTO,',
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
