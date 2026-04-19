prompt --application/pages/page_00364
begin
wwv_flow_api.create_page(
 p_id=>364
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Informe de Recaudos WebService'
,p_step_title=>'Informe de Recaudos WebService'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251111113721'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111643237341843752)
,p_plug_name=>unistr('<b>Par\00E1metros de consulta</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111643282813843753)
,p_plug_name=>'<b>Recaudos webservice</b>'
,p_region_name=>'RECAUDOS_WS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    c001 as nmbre_impsto,',
'    c002 as nmbre_impsto_sbmpsto,',
'    c003 as idntfccion_sjto,',
'    c004 as nmbre_bnco,',
'    c005 as nmro_cnta,',
'    n001 as nmro_dcmnto,',
'    n002 as vlor,',
'    c006 as aplcdo,',
'    d001 as fcha_rcdo_wbsrvce,',
'    d002 as fcha_rgstro,',
'    c007 as OBSRVCION_APLCION',
'  from apex_collections',
'  where collection_name = :P364_COLLECTION_NAME',
' '))
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
 p_id=>wwv_flow_api.id(118589559690617803)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLS:PDF'
,p_owner=>'JLUJAN'
,p_internal_uid=>118589559690617803
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118589640330617804)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118589746332617805)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sub Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118589877634617806)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118589957268617807)
,p_db_column_name=>'NMBRE_BNCO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118590095642617808)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Cuenta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118590125438617809)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118590494018617812)
,p_db_column_name=>'FCHA_RCDO_WBSRVCE'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Fecha Pago'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118590204970617810)
,p_db_column_name=>'VLOR'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118590323151617811)
,p_db_column_name=>'APLCDO'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Aplicado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134535107521549501)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115941017498789701)
,p_db_column_name=>'OBSRVCION_APLCION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(126946726123458935)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1269468'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO:NMRO_DCMNTO:FCHA_RCDO_WBSRVCE:VLOR:NMBRE_BNCO:NMRO_CNTA:APLCDO::FCHA_RGSTRO:OBSRVCION_APLCION'
,p_sort_column_1=>'FCHA_RGSTRO'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'FCHA_RCDO_WBSRVCE'
,p_sort_direction_2=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98481796381744057)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(111643237341843752)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98482190586744060)
,p_name=>'P364_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(111643237341843752)
,p_prompt=>'<b>Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98482508622744065)
,p_name=>'P364_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(111643237341843752)
,p_prompt=>'<b>Sub-Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto, id_impsto_sbmpsto',
'from df_i_impuestos_subimpuesto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_impsto = :P364_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P364_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98482978605744066)
,p_name=>'P364_ID_BNCO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(111643237341843752)
,p_prompt=>'<b>Banco</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_BANCOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'  order by cdgo_bnco'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98483321236744066)
,p_name=>'P364_ID_BNCO_CNTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(111643237341843752)
,p_prompt=>'<b>Cuenta</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_cnta, id_bnco_cnta',
'from df_c_bancos_cuenta',
'where id_bnco = :P364_ID_BNCO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P364_ID_BNCO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98483770702744066)
,p_name=>'P364_NMRO_DCMNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(111643237341843752)
,p_prompt=>'<b>No. Documento</b>'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98484185147744067)
,p_name=>'P364_FCHA_DSDE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(111643237341843752)
,p_prompt=>'<b>Fecha Recaudo Desde</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98484594345744067)
,p_name=>'P364_FCHA_HSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(111643237341843752)
,p_prompt=>'<b>Fecha Recaudo Hasta</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98484935435744068)
,p_name=>'P364_COLLECTION_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(111643237341843752)
,p_item_default=>'RECAUDOS_WS'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98490225489744097)
,p_name=>'Al dar Click en BTN_CNSLTAR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(98481796381744057)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98490706716744100)
,p_event_id=>wwv_flow_api.id(98490225489744097)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFDesea proceder con la consulta de recaudos webservice?", function( okPressed ) { '),
'    if( okPressed ) {',
'        apex.server.process(',
'            "Consultar_Recaudos_WS",',
'            {    ',
'                pageItems: ''#P364_COLLECTION_NAME,#P364_ID_IMPSTO,#P364_ID_IMPSTO_SBMPSTO,#P364_ID_BNCO,#P364_ID_BNCO_CNTA,#P364_NMRO_DCMNTO,#P364_FCHA_DSDE,#P364_FCHA_HSTA''',
'            },',
'            {',
'                //dataType: ''text'',',
'                success: function( pData ){',
'                    ',
'                    if (pData.o_cdgo_rspsta != 0){ ',
'                        apex.message.clearErrors();',
'                        apex.message.alert(  pData.o_mnsje_rspsta );',
'                        ',
'                    }else{',
'                        var region = apex.region( "RECAUDOS_WS" );',
'                        region.refresh();',
'                        //apex.submit();',
'                    }',
'                }',
'            }',
'        );',
'    } // Fin if',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98489877297744096)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar_Recaudos_WS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_exste_clccion boolean;',
'    v_cntdor        number := 0;',
'    o_cdgo_rspsta   number;',
'    o_mnsje_rspsta  varchar2(4000);',
'begin',
'    ',
'    o_cdgo_rspsta := 0;',
'    o_mnsje_rspsta := ''OK'';',
'    ',
'    v_exste_clccion := APEX_COLLECTION.COLLECTION_EXISTS (',
'        p_collection_name => :P364_COLLECTION_NAME);',
'    ',
'    -- Si la coleccion no existe.',
'    if not v_exste_clccion then',
'        -- Crear coleccion',
'        APEX_COLLECTION.CREATE_COLLECTION(',
'            p_collection_name => :P364_COLLECTION_NAME);',
'    else',
'        -- Truncamos la coleccion',
'        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(',
'            p_collection_name => :P364_COLLECTION_NAME);',
'    end if;',
'    ',
'    -- Consultar los datos que se ingresaran a la coleccion',
'    for c_rcdos_ws in (select nmbre_impsto',
'                             , nmbre_impsto_sbmpsto',
'                             , idntfccion_sjto',
'                             , nmbre_bnco',
'                             , nmro_cnta',
'                             , nmro_dcmnto',
'                             , fcha_rcdo_wbsrvce',
'                             , fcha_registro',
'                             , vlor',
'                             , decode(aplcdo, ''S'', ''Si'', ''No'') as aplcdo',
'                             , OBSRVCION_APLCION',
'                        from v_ws_g_recaudos_webservice',
'                        where cdgo_clnte = :F_CDGO_CLNTE',
'                        and (id_impsto = :P364_ID_IMPSTO or :P364_ID_IMPSTO is null)',
'                        and (id_impsto_sbmpsto = :P364_ID_IMPSTO_SBMPSTO or :P364_ID_IMPSTO_SBMPSTO is null)',
'                        and (id_bnco = :P364_ID_BNCO or :P364_ID_BNCO is null)',
'                        and (id_bnco = :P364_ID_BNCO_CNTA or :P364_ID_BNCO_CNTA is null)',
'                        and (nmro_dcmnto = :P364_NMRO_DCMNTO or :P364_NMRO_DCMNTO is null)',
'                        and (trunc(fcha_registro) >= trunc(to_date(:P364_FCHA_DSDE)) or :P364_FCHA_DSDE is null)',
'                        and (trunc(fcha_registro) <= trunc(to_date(:P364_FCHA_HSTA)) or :P364_FCHA_HSTA is null)',
'                      ) loop',
'          ',
'          ',
'          -- Agregar datos a la coleccion',
'          APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => :P364_COLLECTION_NAME,',
'                p_c001            => c_rcdos_ws.nmbre_impsto,',
'                p_c002            => c_rcdos_ws.nmbre_impsto_sbmpsto,',
'                p_c003            => c_rcdos_ws.idntfccion_sjto,',
'                p_c004            => c_rcdos_ws.nmbre_bnco,',
'                p_c005            => c_rcdos_ws.nmro_cnta,',
'                p_n001            => c_rcdos_ws.nmro_dcmnto,',
'                p_n002            => c_rcdos_ws.vlor,',
'                p_c006            => c_rcdos_ws.aplcdo,',
'                p_d001            => c_rcdos_ws.fcha_rcdo_wbsrvce,',
'                p_d002            => c_rcdos_ws.fcha_registro,',
'                p_c007            => c_rcdos_ws.OBSRVCION_APLCION);',
'          ',
'    end loop;',
'    ',
'    -- Verificamos si la coleccion contiene datos',
'    v_cntdor := APEX_COLLECTION.COLLECTION_MEMBER_COUNT (',
'                    p_collection_name => :P364_COLLECTION_NAME);',
'                    ',
'    if v_cntdor <= 0 then',
'        o_cdgo_rspsta := 10;',
'        o_mnsje_rspsta := ''No se encontraron datos que cumplan con los criterios de consulta.'';',
'    end if;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object();',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
