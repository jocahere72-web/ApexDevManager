prompt --application/pages/page_00027
begin
wwv_flow_api.create_page(
 p_id=>27
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Certificado Contribuyente Industria y Comercio'
,p_step_title=>'Certificado Contribuyente Industria y Comercio'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20200803105934'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79386809563513116)
,p_plug_name=>unistr('CERTIFICACI\00D3N PARA CONTRIBUYENTES DEL IMPUESTO DE INDUSTRIA Y COMERCIO')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79389156095513139)
,p_plug_name=>'Sujetos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select distinct a.id_sjto_impsto',
'      , b.idntfccion_rspnsble',
'      , a.idntfccion_sjto',
'      , b.id_sjto_rspnsble',
'      , a.drccion',
'      , c.nmbre_rzon_scial',
'   from v_si_i_sujetos_impuesto    a',
'   join v_si_i_sujetos_responsable b on a.id_sjto_impsto = b.id_sjto_impsto',
'   join v_si_i_personas            c on a.id_sjto_impsto = c.id_sjto_impsto ',
'  where a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.id_impsto        = :P27_ID_IMPSTO',
'   and (:P27_IDNTFFCION   = trim(b.idntfccion_rspnsble) or :P27_IDNTFFCION    = trim(a.idntfccion_sjto))',
'   and b.prncpal_s_n      = ''S'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(79389971556513147)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se Encontraron Datos.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:27:&SESSION.:imprimir:&DEBUG.:RP:P27_ID_SJTO_IMPSTO,P27_ID_SJTO_RSPNSBLE:#ID_SJTO_IMPSTO#,#ID_SJTO_RSPNSBLE#'
,p_detail_link_text=>'<span class="fa fa-download" aria-hidden="true"></span>'
,p_owner=>'AMOLINA'
,p_internal_uid=>79389971556513147
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79390253245513150)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80068005895740401)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80068189038740402)
,p_db_column_name=>'DRCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Direcci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80068766591740408)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Identificacion Responsable'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80068841057740409)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Nombre/Raz\00F3n Social ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80070271980740423)
,p_db_column_name=>'ID_SJTO_RSPNSBLE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Sjto Rspnsble'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(80077716303740659)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'800778'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_RZON_SCIAL:IDNTFCCION_SJTO:DRCCION:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79388139632513129)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(79386809563513116)
,p_button_name=>'Btn_consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80138853220746916)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(79386809563513116)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,11::'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79387156489513119)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(79386809563513116)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79386968970513117)
,p_name=>'P27_IDNTFFCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(79386809563513116)
,p_prompt=>unistr('NIT/Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79387003971513118)
,p_name=>'P27_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(79386809563513116)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79387715119513125)
,p_name=>'P27_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(79386809563513116)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79388247141513130)
,p_name=>'P27_CMDN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(79386809563513116)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79388946427513137)
,p_name=>'P27_MSG'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(79386809563513116)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80070191032740422)
,p_name=>'P27_ID_SJTO_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(79386809563513116)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80070361832740424)
,p_name=>'P27_ID_SJTO_RSPNSBLE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(79386809563513116)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79387337167513121)
,p_validation_name=>'Consultar Sujeto'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_vrble   number;',
'begin',
'    select count(1)',
'      into v_vrble      ',
'      from si_i_sujetos_responsable a',
'      join v_si_i_sujetos_impuesto  b on a.id_sjto_impsto = b.id_sjto_impsto',
'     where b.cdgo_clnte       = :F_CDGO_CLNTE',
'       and b.id_impsto        = 19--:P56_ID_IMPSTO',
'       and trim(a.idntfccion) = :P27_IDNTFFCION',
'       and a.prncpal_s_n      = ''S'';',
'             ',
'    if v_vrble >= 1 then',
'       :P27_CMDN := 1;',
'       :P27_MSG  := ''Contribuyente encontrado!'';',
'       return true;',
'    else',
'        :P27_MSG  := ''El establecimiento no se encuentra registrado. !'';',
'        return false;',
'    end if;        ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&P27_MSG.'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(79388139632513129)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79387431120513122)
,p_name=>'al hacer click'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(79387156489513119)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79387587353513123)
,p_event_id=>wwv_flow_api.id(79387431120513122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function imprimir(){',
'        var popup = apex.widget.waitPopup();',
'        var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
'    try{',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Generar_JSON:NO:RP:::`;        ',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        let v_blob = await fecth_async(url);',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = ''Certificado.pdf'';',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        if(popup) popup.remove();',
'    }     ',
'}',
'',
' function fecth_async(url) {',
'        var miInit = {',
'            method: "GET",',
'            cache: "default"',
'        };',
'        return fetch(url, miInit).then(resp => {',
'            return resp.blob();',
'        });',
'    }',
'',
'imprimir();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79388342106513131)
,p_name=>'Al cambiar comodin'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P27_CMDN'
,p_condition_element=>'P27_CMDN'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79388464864513132)
,p_event_id=>wwv_flow_api.id(79388342106513131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(79387156489513119)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79388547019513133)
,p_event_id=>wwv_flow_api.id(79388342106513131)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(79387156489513119)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79388621618513134)
,p_name=>'Al cambiar identificacion'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P27_IDNTFFCION'
,p_condition_element=>'P27_IDNTFFCION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79388724510513135)
,p_event_id=>wwv_flow_api.id(79388621618513134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P27_CMDN := '''';'
,p_attribute_02=>'P27_CMDN'
,p_attribute_03=>'P27_CMDN'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79389073938513138)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar contribuyente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_vrble   number;',
'begin',
'    select count(1)',
'      into v_vrble      ',
'      from si_i_sujetos_responsable a',
'      join v_si_i_sujetos_impuesto  b on a.id_sjto_impsto = b.id_sjto_impsto',
'     where b.cdgo_clnte       = :F_CDGO_CLNTE',
'       and b.id_impsto        = :P27_ID_IMPSTO',
'       and trim(a.idntfccion) = :P27_IDNTFFCION',
'       and a.prncpal_s_n      = ''S'';',
'             ',
'    if v_vrble >= 1 then',
'       :P27_CMDN := 1;',
'       :P27_MSG  := ''Busqueda Exitosa!'';',
'    else',
'        :P27_MSG  := ''El establecimiento no se encuentra registrado.!'';',
'    end if;        ',
'end;'))
,p_process_error_message=>'&P27_MSG.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P27_MSG.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80070562205740426)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Certificado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cnsctvo      number;',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'     v_cnsctvo := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''CCI'');',
'     :P27_JSON := ''{"id_sjto_impsto":"''||:P27_ID_SJTO_IMPSTO||''","cnsctvo":"''||v_cnsctvo||''"}'';',
'     ',
'     pkg_gf_paz_y_salvo.prc_rgcertificado( p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                         , p_id_impsto         => :P27_ID_IMPSTO',
'                                         , p_id_sjto_impsto    => :P27_ID_SJTO_IMPSTO',
'                                         , p_id_sjto_rspnsble  => :P27_ID_SJTO_RSPNSBLE',
'                                         , p_cnsctvo           => v_cnsctvo',
'                                         , p_indcdr_prtal      => ''S''',
'                                         , p_cdgo_crtfcdo_tpo  => ''CCI''',
'                                         , o_cdgo_rspsta  	   => v_cdgo_rspsta',
'                                         , o_mnsje_rspsta 	   => v_mnsje_rspsta);',
'    if(v_cdgo_rspsta <> 0 ) then ',
'            raise_application_error( -20001 , v_mnsje_rspsta);',
'    end if;                                         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79387224555513120)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_gn_d_reportes     gn_d_reportes%rowtype;',
'     v_json              clob;',
'     v_count             number;',
'     v_blob              blob;',
'     v_object json_object_t := json_object_t();',
'     v_error             varchar2(4000);',
'     v_cnsctvo           number;',
'begin   ',
'    apex_session.attach( p_app_id     => 66000',
'                       , p_page_id    => 37',
'                       , p_session_id => v(''APP_SESSION'') );',
'',
'    --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'    select /*+ RESULT_CACHE */',
'           r.*',
'      into v_gn_d_reportes ',
'      from gn_d_reportes r',
'     where r.id_rprte = 578;',
'',
'    --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO     ',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''P37_ID_RPRTE'', 578);',
'    apex_util.set_session_state(''P37_JSON''    , :P27_JSON);',
'     ',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'',
'    htp.init;',
'    owa_util.mime_header(''application/pdf'', FALSE );',
'    htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'    htp.p(''Content-Disposition: attachment; filename="Certificado.pdf"'' );',
'    htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'    apex_application.stop_apex_engine;',
'    ',
'exception  ',
'     when others then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
