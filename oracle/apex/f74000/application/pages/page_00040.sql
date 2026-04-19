prompt --application/pages/page_00040
begin
wwv_flow_api.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Resoluci\00F3n Sanci\00F3n Sancionatorio')
,p_step_title=>unistr('Resoluci\00F3n Sanci\00F3n Sancionatorio')
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
,p_last_upd_yyyymmddhh24miss=>'20241209145321'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69482659689874201)
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
 p_id=>wwv_flow_api.id(199763127433682821)
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
,p_attribute_03=>'P40_ID_SJTO_IMPSTO'
,p_attribute_04=>'F_ID_FNCNRIO'
,p_attribute_05=>'P40_ID_FSCLZCION_EXPDNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(287123418045927133)
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
unistr('<i>Funcionalidad que permite generar, modificar, visualizar y confirmar los actos parametrizados en la etapa Resoluci\00F3n Sanci\00F3n que no requieren confirmaci\00F3n por el supervisor.</i>'),
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
 p_id=>wwv_flow_api.id(391535159731986203)
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
 p_id=>wwv_flow_api.id(69576622467642821)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(391535159731986203)
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
 p_id=>wwv_flow_api.id(15087740023989358)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(391535159731986203)
,p_button_name=>'BTN_SNCION'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,84:P84_ID_FSCLZCION_EXPDNTE,P84_CDGO_ACTO_TPO,P84_ID_CNDDTO,P84_PGNA,P84_ID_SJTO_IMPSTO,P84_ID_PRGRMA,P84_ID_SBPRGRMA,P84_ID_IMPSTO,P84_ID_SBIMPSTO:&P40_ID_FSCLZCION_EXPDNTE.,RSXNI,&P40_ID_CNDDTO.,&APP_PAGE_ID.,&P40_ID_SJTO_IMPSTO.,&P40_ID_PRGRMA.,&P40_ID_SBPRGRMA.,&P40_ID_IMPSTO.,&P40_ID_SBIMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_fiscalizacion_expdnte b',
'join fi_g_candidatos c on b.id_cnddto = c.id_cnddto',
'where b.id_fsclzcion_expdnte = :P40_ID_FSCLZCION_EXPDNTE',
'and c.id_sbprgrma in (select x.id_sbprgrma',
'                        from fi_d_subprogramas x',
'                       where x.cdgo_sbprgrma = ''NEI'')',
'and not exists (select 1 ',
'                from fi_g_fiscalizacion_sancion a',
'                join gn_d_actos_tipo_tarea c on a.id_acto_tpo = c.id_acto_tpo',
'                where id_fsclzcion_expdnte = :P40_ID_FSCLZCION_EXPDNTE',
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
 p_id=>wwv_flow_api.id(15088094440992129)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(391535159731986203)
,p_button_name=>'BTN_SNCION_1'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,84:P84_ID_FSCLZCION_EXPDNTE,P84_CDGO_ACTO_TPO,P84_ID_CNDDTO,P84_PGNA,P84_ID_SJTO_IMPSTO,P84_ID_PRGRMA,P84_ID_SBPRGRMA,P84_ID_IMPSTO,P84_ID_SBIMPSTO:&P40_ID_FSCLZCION_EXPDNTE.,RSPE,&P40_ID_CNDDTO.,&APP_PAGE_ID.,&P40_ID_SJTO_IMPSTO.,&P40_ID_PRGRMA.,&P40_ID_SBPRGRMA.,&P40_ID_IMPSTO.,&P40_ID_SBIMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_fiscalizacion_expdnte b',
'join fi_g_candidatos c on b.id_cnddto = c.id_cnddto',
'where b.id_fsclzcion_expdnte = :P40_ID_FSCLZCION_EXPDNTE',
'and c.id_sbprgrma in (select x.id_sbprgrma',
'                        from fi_d_subprogramas x',
'                       where x.cdgo_sbprgrma = ''EXT'')',
'and not exists (select 1 ',
'                from fi_g_fiscalizacion_sancion a',
'                join gn_d_actos_tipo_tarea c on a.id_acto_tpo = c.id_acto_tpo',
'                where id_fsclzcion_expdnte = :P40_ID_FSCLZCION_EXPDNTE',
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
 p_id=>wwv_flow_api.id(15088336570993333)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(391535159731986203)
,p_button_name=>'BTN_SNCION_2'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,84:P84_ID_FSCLZCION_EXPDNTE,P84_CDGO_ACTO_TPO,P84_ID_CNDDTO,P84_PGNA,P84_ID_SJTO_IMPSTO,P84_ID_PRGRMA,P84_ID_SBPRGRMA,P84_ID_IMPSTO,P84_ID_SBIMPSTO:&P40_ID_FSCLZCION_EXPDNTE.,RSELS,&P40_ID_CNDDTO.,&APP_PAGE_ID.,&P40_ID_SJTO_IMPSTO.,&P40_ID_PRGRMA.,&P40_ID_SBPRGRMA.,&P40_ID_IMPSTO.,&P40_ID_SBIMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_fiscalizacion_expdnte b',
'join fi_g_candidatos c on b.id_cnddto = c.id_cnddto',
'where b.id_fsclzcion_expdnte = :P40_ID_FSCLZCION_EXPDNTE',
'and c.id_sbprgrma in (select x.id_sbprgrma',
'                        from fi_d_subprogramas x',
'                       where x.cdgo_sbprgrma = ''SML'')',
'and not exists (select 1 ',
'                from fi_g_fiscalizacion_sancion a',
'                join gn_d_actos_tipo_tarea c on a.id_acto_tpo = c.id_acto_tpo',
'                where id_fsclzcion_expdnte = :P40_ID_FSCLZCION_EXPDNTE',
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
 p_id=>wwv_flow_api.id(3337440765678404)
,p_name=>'P40_ID_SBIMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3337525926678405)
,p_name=>'P40_ID_PRGRMA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3337672114678406)
,p_name=>'P40_ID_SBPRGRMA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15096294668346288)
,p_name=>'P40_CDGO_ACTO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33701767600850501)
,p_name=>'P40_FNLZCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69574319466641548)
,p_name=>'P40_ID_CNDDTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69574761680641549)
,p_name=>'P40_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69575192554641551)
,p_name=>'P40_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69575566152641551)
,p_name=>'P40_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69575969279641551)
,p_name=>'P40_ID_FSCLZCION_EXPDNTE_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(199763127433682821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69577388009645417)
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
'    into   :P40_ID_SJTO_IMPSTO,',
'           :P40_ID_CNDDTO,',
'           :P40_ID_IMPSTO,',
'           :P40_ID_SBIMPSTO,',
'           :P40_ID_FSCLZCION_EXPDNTE,',
'           :P40_ID_PRGRMA,',
'           :P40_ID_SBPRGRMA',
'    from v_fi_g_candidatos          a',
'    join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'    join v_si_i_sujetos_impuesto    d on a.id_sjto_impsto   = d.id_sjto_impsto',
'    where c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'',
'exception',
'    when others then',
'        :P40_ID_SJTO_IMPSTO := null;',
'        :P40_ID_CNDDTO := null;',
'        :P40_ID_IMPSTO := null;',
'        :P40_ID_SBIMPSTO := null;',
'        :P40_ID_FSCLZCION_EXPDNTE := null;',
'        :P40_ID_PRGRMA := null;',
'        :P40_ID_SBPRGRMA := null;',
'end;',
'',
'begin',
'',
'',
'    select a.cdgo_acto_tpo',
'    into    :P40_CDGO_ACTO_TPO',
'    from gn_d_actos_tipo        a',
'    join df_i_impuestos_acto    b   on  a.cdgo_acto_tpo   =   b.cdgo_impsto_acto',
'    join gn_d_actos_tipo_tarea        d   on  a.id_acto_tpo       = d.id_acto_tpo',
'    join fi_g_candidatos        c   on  b.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'    where a.cdgo_clnte = 	:F_ID_MNCPIO_CLNTE',
'    --and a.cdgo_acto_tpo = ''RSPE''--in (''PCE'',''PCN'',''PCM'')',
'    and d.id_fljo_trea = :F_ID_FLJO_TREA;',
'',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15090284000337602)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar codigo acto tipo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.cdgo_acto_tpo',
'    into    :P40_CDGO_ACTO_TPO',
'    from gn_d_actos_tipo        a',
'    join df_i_impuestos_acto    b   on  a.cdgo_acto_tpo   =   b.cdgo_impsto_acto',
'    join gn_d_actos_tipo_tarea        d   on  a.id_acto_tpo       = d.id_acto_tpo',
'    join fi_g_candidatos        c   on  b.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'    where a.cdgo_clnte = 	:F_CDGO_CLNTE',
'    --and a.cdgo_acto_tpo = ''RSPE''--in (''PCE'',''PCN'',''PCM'')',
'    and d.id_fljo_trea = :F_ID_FLJO_TREA;',
'',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69577619801646721)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar(1000);',
'begin',
'',
'     pkg_fi_fiscalizacion.prc_rg_liquidacion(p_cdgo_clnte                 =>  :F_CDGO_CLNTE,',
'                                             p_id_usrio                   =>  :F_ID_USRIO, ',
'                                             p_id_fsclzcion_expdnte       =>  :P40_ID_FSCLZCION_EXPDNTE,',
'                                             p_id_fsclzcion_expdnte_acto  =>  :P40_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                             --p_json                 in  clob,',
'                                             o_cdgo_rspsta                =>  v_cdgo_rspsta,',
'                                             o_mnsje_rspsta               =>  v_mnsje_rspsta);',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20002, v_mnsje_rspsta);',
'    end if;',
'',
'    pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                     p_id_usrio                    => :F_ID_USRIO,  ',
'                                     p_id_fsclzcion_expdnte_acto   => :P40_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                     p_id_cnddto                   => :P40_ID_CNDDTO,',
'                                     o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                     o_mnsje_rspsta                => v_mnsje_rspsta);',
'                                                      ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    ',
'   ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GENERAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30893714585308331)
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
'    :P40_ID_FSCLZCION_EXPDNTE_ACTO := v_id_expdnte_acto;',
'    begin',
'        pkg_fi_fiscalizacion.prc_rg_liquidacion( p_cdgo_clnte		          =>    :F_CDGO_CLNTE,',
'                                                 p_id_usrio                   =>    :F_ID_USRIO,',
'                                                 p_id_fsclzcion_expdnte       =>    :P40_ID_FSCLZCION_EXPDNTE,',
'                                                 p_id_fsclzcion_expdnte_acto  =>    :P40_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                 o_vlor_ttal                  =>    v_vlor_ttal, ',
'                                                 o_cdgo_rspsta		          =>    v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta	              =>    v_mnsje_rspsta);',
'    end;',
'    if v_cdgo_rspsta = 0 then',
'        begin',
'            pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                             p_id_usrio                    => :F_ID_USRIO,  ',
'                                             p_id_fsclzcion_expdnte_acto   => :P40_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                             p_id_cnddto                   => :P40_ID_CNDDTO,',
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
