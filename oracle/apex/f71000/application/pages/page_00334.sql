prompt --application/pages/page_00334
begin
wwv_flow_api.create_page(
 p_id=>334
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Conciliaci\00F3n a nivel de Conceptos')
,p_step_title=>unistr('Conciliaci\00F3n a nivel de Conceptos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var fnErrorAlertaSwal = function(pMsg){',
'    Swal.fire({',
'            icon: ''error'',',
unistr('            title:  ''<H2 >Validaci\00F3n</H2>'','),
'            html: ''<H4>''+pMsg+''</H4>''',
'        });',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210205083735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105207368250936428)
,p_plug_name=>'<b>Opciones</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105207872768936433)
,p_plug_name=>'Conceptos conciliados'
,p_region_name=>'CONCEPTOS_CONCLIADOS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rcdo_lte_cnclcion',
'     , id_rcdo',
'     , nmro_lte',
'     , nmro_dcmnto',
'     , fcha_rcdo',
'     , nmbre_cncpto',
'     , vlor_rcdo_cncpto',
'     , ''Actualizar fecha'' as LINK',
'from v_re_g_recaudos_cncpto_cnclcn',
'where id_rcdo_lte_cnclcion = :P334_ID_RCDO_LTE_CNCLCION'))
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
 p_id=>wwv_flow_api.id(7866606741460201)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>7866606741460201
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7866761037460202)
,p_db_column_name=>'NMRO_LTE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero Lote')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7866884218460203)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7866997572460204)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7867008956460205)
,p_db_column_name=>'NMBRE_CNCPTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7867161517460206)
,p_db_column_name=>'VLOR_RCDO_CNCPTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor del concepto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7818024588684538)
,p_db_column_name=>'LINK'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Opciones'
,p_column_link=>'f?p=&APP_ID.:337:&SESSION.::&DEBUG.:RP:P337_ID_RCDO_LTE_CNCLCION,P337_ID_RCDO:#ID_RCDO_LTE_CNCLCION#,#ID_RCDO#'
,p_column_linktext=>'#LINK#'
,p_column_type=>'STRING'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from re_g_recaudos_archvo_cnclcn',
'where estdo_archvo = ''IN'';'))
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7818778860684545)
,p_db_column_name=>'ID_RCDO_LTE_CNCLCION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Id Rcdo Lte Cnclcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7818831880684546)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Rcdo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7876270094462716)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'78763'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_LTE:NMRO_DCMNTO:FCHA_RCDO:NMBRE_CNCPTO:VLOR_RCDO_CNCPTO:LINK:'
,p_sum_columns_on_break=>'VLOR_RCDO_CNCPTO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105207445988936429)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(105207368250936428)
,p_button_name=>'BTN_INCLUIR_RECAUDO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Incluir Recaudo'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from re_g_recaudos_archvo_cnclcn',
'where estdo_archvo = ''IN'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105208731276936442)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(105207368250936428)
,p_button_name=>'BTN_FINALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>unistr('Finalizar Conciliaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105409431781116005)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(105207368250936428)
,p_button_name=>'BTN_ELIMINAR_RECAUDO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Excluir Recaudo'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from re_g_recaudos_archvo_cnclcn',
'where estdo_archvo = ''IN'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3748224460474314)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(105207368250936428)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3748171489474313)
,p_branch_name=>unistr('Ir a la p\00E1gina 333')
,p_branch_action=>'f?p=&APP_ID.:333:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7747045352539428)
,p_name=>'P334_MNSJE_ERROR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(105207368250936428)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7816959418684527)
,p_name=>'P334_CDGO_CLNTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105207368250936428)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105207693290936431)
,p_name=>'P334_ID_RCDO_ARCHVO_CNCLCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105207368250936428)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105208361533936438)
,p_name=>'P334_ID_RCDO_LTE_CNCLCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105207368250936428)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105208842329936443)
,p_name=>'P334_NMRO_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(105207368250936428)
,p_prompt=>'<b>No. Documento:</b>'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from re_g_recaudos_archvo_cnclcn',
'where estdo_archvo = ''IN'';'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105209002665936445)
,p_name=>'Al dar Click en BTN_INCLUIR_RECAUDO'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(105207445988936429)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105209168683936446)
,p_event_id=>wwv_flow_api.id(105209002665936445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P334_NMRO_DCMNTO'') == ''''){',
unistr('    fnErrorAlertaSwal (''Debe ingresar un n\00FAmero de documento del recaudo que desea ingresar.'');'),
'}else{',
unistr('    apex.message.confirm( "\00BFDesea incluir este recaudo en el lote especificado?", function( okPressed ) { '),
'        if( okPressed ) {',
'            apex.server.process("Adicionar_Recaudo", {',
'               pageItems: "#P334_ID_RCDO_LTE_CNCLCION,#P334_NMRO_DCMNTO,#P334_CDGO_CLNTE"',
'            }).then((resp) => {',
'                console.log(resp);',
'                if (resp.o_cdgo_rspsta > 0) {',
'                    //console.log(resp);',
'                    /*apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: [',
'                                "page"',
'                            ],',
'                            message: resp.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);*/',
'                    fnErrorAlertaSwal(resp.o_mnsje_rspsta);',
'',
'',
'                }else{      ',
'',
unistr('                    apex.message.showPageSuccess( "Se ha inclu\00EDdo el nuevo recaudo.");'),
'',
'                    var region = apex.region("CONCEPTOS_CONCLIADOS");',
'                    region.refresh();',
'',
'                }',
'            });',
'        }',
'    });',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105409652436116007)
,p_name=>'Al dar Click en BTN_ELIMINAR_RECAUDO'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(105409431781116005)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105409720359116008)
,p_event_id=>wwv_flow_api.id(105409652436116007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P334_NMRO_DCMNTO'') == ''''){',
unistr('    fnErrorAlertaSwal (''Debe ingresar un n\00FAmero de documento del recaudo que desea excluir.'');'),
'}else{',
unistr('    apex.message.confirm( "\00BFDesea excluir este recaudo en el lote especificado?", function( okPressed ) { '),
'        if( okPressed ) {',
'            apex.server.process("Eliminar_Recaudo", {',
'               pageItems: "#P334_ID_RCDO_LTE_CNCLCION,#P334_NMRO_DCMNTO"',
'            }).then((resp) => {',
'                console.log(resp);',
'                if (resp.o_cdgo_rspsta > 0) {',
'                    //console.log(resp);',
'                    /*apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: [',
'                                "page"',
'                            ],',
'                            message: resp.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);*/',
'                    fnErrorAlertaSwal(resp.o_mnsje_rspsta);',
'',
'',
'                }else{      ',
'',
unistr('                    apex.message.showPageSuccess( "Se ha exclu\00EDdo el recaudo.");'),
'',
'                    var region = apex.region("CONCEPTOS_CONCLIADOS");',
'                    region.refresh();',
'',
'                }',
'            });',
'        }',
'    });',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105209251191936447)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar archivos planos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(2000);',
'    v_drctrio varchar2(100) := ''ETL_EXPORT'';',
'begin',
'    ',
'    pkg_re_recaudos_conciliacion.prc_gn_archivo_maestro(p_id_rcdo_archvo_cnclcion  => :P334_ID_RCDO_ARCHVO_CNCLCION',
'                                                        , p_drctrio                => v_drctrio',
'                                                        , o_cdgo_rspsta              => o_cdgo_rspsta',
'                                                      , o_mnsje_rspsta             => o_mnsje_rspsta);',
'                                                      ',
'    if o_cdgo_rspsta <> 0 then',
'        apex_util.set_session_state(''P334_MNSJE_ERROR'', ''Error al intentar crear el archivo maestro.'');',
'    else',
'        pkg_re_recaudos_conciliacion.prc_gn_archivo_detalle(p_id_rcdo_archvo_cnclcion  => :P334_ID_RCDO_ARCHVO_CNCLCION',
'                                                          , p_drctrio                => v_drctrio',
'                                                            , o_cdgo_rspsta              => o_cdgo_rspsta',
'                                                          , o_mnsje_rspsta             => o_mnsje_rspsta);',
'        if o_cdgo_rspsta <> 0 then',
'            apex_util.set_session_state(''P334_MNSJE_ERROR'', ''Error al intentar crear el archivo detalle.'');',
'        end if;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(105208731276936442)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105208914387936444)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adicionar_Recaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(2000);',
'begin',
'    pkg_re_recaudos_conciliacion.prc_rg_recaudo_conciliacion(p_cdgo_clnte              => :P334_CDGO_CLNTE',
'                                                           , p_id_rcdo_lte_cnclcion    => :P334_ID_RCDO_LTE_CNCLCION',
'                                                           , p_nmro_dcmnto             => :P334_NMRO_DCMNTO',
'                                                           , o_cdgo_rspsta             => o_cdgo_rspsta',
'                                                           , o_mnsje_rspsta            => o_mnsje_rspsta);',
'                                                           ',
'    ',
'',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_all();',
'',
'exception',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 10);',
'        apex_json.write(''o_mnsje_rspsta'', sqlerrm); --''Ha ocurrido un error al intentar incluir el nuevo recaudo.'');',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105475699227775050)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar_Recaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(2000);',
'begin',
'    pkg_re_recaudos_conciliacion.prc_el_recaudo_conciliacion(p_cdgo_clnte              => :F_CDGO_CLNTE',
'                                                           , p_id_rcdo_lte_cnclcion    => :P334_ID_RCDO_LTE_CNCLCION',
'                                                           , p_nmro_dcmnto             => :P334_NMRO_DCMNTO',
'                                                           , o_cdgo_rspsta             => o_cdgo_rspsta',
'                                                           , o_mnsje_rspsta            => o_mnsje_rspsta);',
'                                                           ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_all();',
'',
'exception',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 10);',
'        apex_json.write(''o_mnsje_rspsta'', sqlerrm); --''Ha ocurrido un error al intentar excluir el nuevo recaudo.'');',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
