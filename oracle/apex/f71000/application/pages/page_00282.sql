prompt --application/pages/page_00282
begin
wwv_flow_api.create_page(
 p_id=>282
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Paz y Salvo'
,p_page_mode=>'MODAL'
,p_step_title=>'Paz y Salvo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222102136'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72029820271966820)
,p_plug_name=>'Paz y Salvo'
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
 p_id=>wwv_flow_api.id(72093439840408706)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(72029820271966820)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72094817605408720)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(72029820271966820)
,p_button_name=>'BTN_RGSTRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76052608626568404)
,p_branch_action=>'f?p=&APP_ID.:281:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72093439840408706)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72029980294966821)
,p_name=>'P282_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_cHeight=>1
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72030047965966822)
,p_name=>'P282_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_SUBIMPUESTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_cHeight=>1
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72030168510966823)
,p_name=>'P282_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72093081490408702)
,p_name=>'P282_IDNTFCCION_RDCDOR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72093332680408705)
,p_name=>'P282_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72093738872408709)
,p_name=>'P282_ID_RPRTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72093822861408710)
,p_name=>'P282_ID_SJTO_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72094261111408714)
,p_name=>'P282_ACTO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'application/pdf'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72094484417408716)
,p_name=>'P282_ID_INSTNCIA_FLJO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72094956941408721)
,p_name=>'P282_CDGO_RSPSTA'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(72029820271966820)
,p_prompt=>'Respuesta'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select dscrpcion,cdgo_rspsta from pq_d_respuestas'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72094067907408712)
,p_name=>unistr('al hacer clic en el bot\00F3n generar')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(72093439840408706)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72094160811408713)
,p_event_id=>wwv_flow_api.id(72094067907408712)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function calcular() {',
'    var popup = apex.widget.waitPopup();',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
'    try {',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=DOWNLOADFILE:NO:RP:::`;',
'        await fetch(url, {',
'            method: ''GET'',',
'            cache: ''default''',
'        }).then(resp => {',
'            return resp.blob()',
'        }).then(resp => {',
'            let a = document.createElement("a");',
'            document.body.appendChild(a);',
'            let v_url = window.URL.createObjectURL(resp);',
'            a.download = $v(''P282_IDNTFCCION'') + ".pdf";',
'            a.href = v_url;',
'            a.click();',
'            document.body.removeChild(a);',
'            window.URL.revokeObjectURL(v_url);',
'        });',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        popup.remove();',
'    }',
'}',
'',
'calcular();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72094344062408715)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrar paz y salvo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     r_temp_files    apex_application_temp_files%rowtype;',
'     v_cdgo_rspsta   number;',
'     v_mnsje_rspsta  varchar2(4000);     ',
'begin',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P282_ACTO;',
'    exception ',
'        when no_data_found then',
'           apex_error.add_error( p_message          => ''No se encontro archivo''',
'                                , p_display_location => apex_error.c_inline_in_notification );',
'           return;',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'        pkg_pq_pqr.prc_rg_paz_salvo( p_id_instncia_fljo => :P282_ID_INSTNCIA_FLJO',
'                                   , p_cdgo_rspsta      => :P282_CDGO_RSPSTA',
'                                   , p_blob             => r_temp_files.blob_content',
'                                   , o_cdgo_rspsta      => v_cdgo_rspsta',
'                                   , o_mnsje_rspsta     => v_mnsje_rspsta );',
'        if(v_cdgo_rspsta != 0) then',
'            apex_error.add_error( p_message          => v_mnsje_rspsta',
'                                , p_display_location => apex_error.c_inline_in_notification );',
'        end if;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72094817605408720)
,p_process_success_message=>unistr('\00A1Paz y salvo registrado con exito!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72094537887408717)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'cerrar modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72093267998408704)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOADFILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_blob          blob;',
'    v_gn_d_reportes gn_d_reportes%rowtype;',
'    v_mnsje         varchar2(4000);    ',
'    v_app_id        number := v(''APP_ID'');',
'    v_page_id       number := v(''APP_PAGE_ID'');',
'    v_suma          number;',
'    ',
'begin',
'    begin',
'        --Consultamos si tiene deuda',
'         select case when sum(vlor_intres+vlor_sldo_cptal) is null then ',
'                          0',
'                     else ',
'                          sum(vlor_intres+vlor_sldo_cptal)',
'                end          ',
'           into v_suma       ',
'           from v_gf_g_cartera_x_vigencia ',
'          where id_sjto_impsto        = :P282_ID_SJTO_IMPSTO',
'            and cdgo_clnte            = :F_CDGO_CLNTE',
'            and id_impsto             = :P282_ID_IMPSTO',
'            and id_impsto_sbmpsto     = :P282_ID_IMPSTO_SBMPSTO',
'            and cdgo_mvnt_fncro_estdo = ''NO'';     ',
'',
'        if (v_suma > 0) then ',
'             :P282_JSON := ''{"id_sjto_impsto":"''       || :P282_ID_SJTO_IMPSTO ',
'                        || ''","idntfccion_rspnsble":"'' || :P282_IDNTFCCION_RDCDOR ',
'                        || ''","id_impsto":"''           || :P282_ID_IMPSTO ',
'                        || ''","id_impsto_sbmpsto":"''   || :P282_ID_IMPSTO_SBMPSTO',
'                        || ''","vgncia_dsd":"''          || 0 ',
'                        || ''","vgncia_hsta":"''         || extract(year from sysdate)',
'                        || ''","nmbre_rprte":"''          || ''Estado de Cartera de Contribuyente''||''"}'';',
'                        ',
'             :P282_ID_RPRTE := 2;                   ',
'        elsif (v_suma = 0) then',
'            :P282_JSON := ''{"cdgo_clnte":"''           || :F_CDGO_CLNTE  ',
'                       || ''","id_impsto":"''           || :P282_ID_IMPSTO ',
'                       || ''","id_impsto_sbmpsto":"''   || :P282_ID_IMPSTO_SBMPSTO',
'                       || ''","cnsctvo":"''             || pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''PYZ'')',
'                       || ''","id_sjto_impsto":"''      || :P282_ID_SJTO_IMPSTO',
'                       || ''","id_rprte":"''            || to_number (	pkg_gn_generalidades.fnc_cl_defniciones_cliente(  p_cdgo_clnte 					=> :F_CDGO_CLNTE',
'                                                                                                                        , p_cdgo_dfncion_clnte_ctgria 	=> ''RPT''',
'                                                                                                                        , p_cdgo_dfncion_clnte 			=> ''RPY'' ))',
'                       || ''","usrio":"''               || :F_NMBRE_USRIO || ''}'';',
'            :P282_ID_RPRTE := 3;               ',
'        end if;                ',
'    end; ',
'    ',
'    begin        ',
'        apex_session.attach( p_app_id     => 66000',
'                           , p_page_id    => 37',
'                           , p_session_id => v(''APP_SESSION'') );',
'',
'        --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'        select /*+ RESULT_CACHE */',
'               r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.id_rprte = :P282_ID_RPRTE ;',
'',
'        --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO                    ',
'        apex_util.set_session_state(''P37_JSON'', :P282_JSON);',
'        apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'',
'        v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                                p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                                p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                                p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                                p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'        htp.init;',
'        owa_util.mime_header(''application/pdf'', FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' || v_gn_d_reportes.nmbre_rprte || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_blob);',
'        apex_application.stop_apex_engine;',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72093439840408706)
);
end;
/
