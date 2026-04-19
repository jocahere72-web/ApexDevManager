prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Estado de Cuenta Todos los Tributos'
,p_step_title=>'Estado de Cuenta Todos los Tributos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerResponsables(){',
'    var region = apex.region("responsables");',
'    var responsables  = [];',
'    if (region) {',
'        var view = apex.region("responsables").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                responsables.push({"ID_SJTO_RSPNSBLE":model.getValue(records[i], "ID_SJTO_RSPNSBLE").trim()});',
'            }',
'           $s("P32_JSON_RESPNSBLES",JSON.stringify(responsables));',
'        }',
'        else{',
'           $s("P32_JSON_RESPNSBLES",null);',
'        }',
'    }   ',
'}'))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220323153404'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61841465610226941)
,p_plug_name=>'Detalle Deuda'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.vgncia',
'     , a.prdo',
'     , to_char(sum( a.vlor_sldo_cptal + a.vlor_intres ),:F_FRMTO_MNDA) as vlor_ttal',
'     , upper(b.nmbre_impsto_sbmpsto) as nmbre_impsto_sbmpsto_dtlle',
'     , c.idntfccion_sjto     ',
'  from v_gf_g_cartera_x_vigencia  a',
'  join v_si_i_sujetos_impuesto c',
'    on a.id_sjto_impsto = c.id_sjto_impsto',
'  join df_i_impuestos_subimpuesto b on a.id_impsto_sbmpsto = b.id_impsto_sbmpsto',
' where a.cdgo_clnte     = :F_CDGO_CLNTE',
'   and a.id_sjto_impsto in (',
'                                   select a.id_sjto_impsto',
'                                     from si_i_sujetos_impuesto a',
'                                    where exists (',
'                                                   select 1',
'                                                     from si_c_sujetos b',
'                                                    where b.cdgo_clnte = :F_CDGO_CLNTE',
'                                                      and b.id_sjto    = a.id_sjto',
'                                                 )',
'                                      and exists (',
'                                                    select id_sjto_impsto',
'                                                      from si_i_sujetos_responsable c',
'                                                     where trim(idntfccion) = :P32_IDNTFCCION_RSPNSBLE',
'                                                       and c.id_sjto_impsto = a.id_sjto_impsto',
'                                                 )',
'                            )',
' group by a.vgncia',
'     , a.prdo',
'     , upper(b.nmbre_impsto_sbmpsto)',
'     ,  c.idntfccion_sjto',
'     , c.id_sjto_impsto',
'   having sum(vlor_intres+vlor_sldo_cptal) > 0',
'    order by c.idntfccion_sjto',
'            , nmbre_impsto_sbmpsto_dtlle',
'            , a.vgncia;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(61841511242226942)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>61841511242226942
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61842103745226948)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61842246581226949)
,p_db_column_name=>'PRDO'
,p_display_order=>30
,p_column_identifier=>'G'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(62059017832117901)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO_DTLLE'
,p_display_order=>50
,p_column_identifier=>'I'
,p_column_label=>'Tributo '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(62059166633117902)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>60
,p_column_identifier=>'J'
,p_column_label=>unistr('Identificaci\00F3n Sujeto ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(62059530710117906)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>70
,p_column_identifier=>'N'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(62058472147111807)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'620585'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IDNTFCCION_SJTO:NMBRE_IMPSTO_SBMPSTO_DTLLE:VGNCIA:PRDO:VLOR_TTAL:'
,p_break_on=>'IDNTFCCION_SJTO:0:0:0:0:0'
,p_break_enabled_on=>'IDNTFCCION_SJTO:0:0:0:0:0'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119753169144368554)
,p_plug_name=>'Paz y Salvo Todos los Tributos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119750967740368532)
,p_plug_name=>unistr('B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(119753169144368554)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119751798750368540)
,p_plug_name=>'Reporte'
,p_parent_plug_id=>wwv_flow_api.id(119750967740368532)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1      ',
' from si_i_sujetos_responsable c',
'where trim(idntfccion) = :P32_IDNTFCCION_RSPNSBLE',
'fetch first 1 rows only;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(284746696054025642)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<br><br>',
'Funcionalidad que permite generar un Paz y Salvo general de todos los Tributos.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(60342729644105839)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(119750967740368532)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(60344602941105846)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(119751798750368540)
,p_button_name=>'Btn_imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(60352230935105861)
,p_branch_name=>'Imprimir Reporte'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P32_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(60344602941105846)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60343140080105840)
,p_name=>'P32_IDNTFCCION_RSPNSBLE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(119750967740368532)
,p_prompt=>unistr('Identificaci\00F3n Responsable:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''letraNumeroGuion'')" '
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60343581557105844)
,p_name=>'P32_JSON'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(119750967740368532)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60343904200105844)
,p_name=>'P32_MNSJE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(119750967740368532)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60345033407105846)
,p_name=>'P32_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(119751798750368540)
,p_prompt=>'Reporte:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte as d,',
'       id_rprte    as r',
'  from gn_d_reportes ',
' where id_rprte in(541);'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66684046249089803)
,p_name=>'P32_ID_RPRTE_PRMTRO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(119750967740368532)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74323200354173734)
,p_name=>'P32_CNSCUTVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(119753169144368554)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(60345881378105850)
,p_validation_name=>'Rporte no null'
,p_validation_sequence=>10
,p_validation=>'P32_ID_RPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Reporte debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(60344602941105846)
,p_associated_item=>wwv_flow_api.id(60345033407105846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74323066466173732)
,p_validation_name=>unistr('Validar M\00EDnimo caracteres Identificaci\00F3n ')
,p_validation_sequence=>20
,p_validation=>'length(:P32_IDNTFCCION_RSPNSBLE) >= 5'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('La Identificaci\00F3n debe contener por lo menos 5 caracteres.')
,p_associated_item=>wwv_flow_api.id(60343140080105840)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(60346282036105852)
,p_validation_name=>'Consultar Responsable'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1      ',
'   from v_si_i_sujetos_responsable c  ',
'  where c.cdgo_clnte                = :F_CDGO_CLNTE',
'    and trim(c.idntfccion_rspnsble) = :P32_IDNTFCCION_RSPNSBLE       ',
'  fetch first 1 rows only;'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('No existe un responsable con la identificaci\00F3n ingresada.')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(60347315153105855)
,p_name=>unistr('Al ingresaridentificaci\00F3n ')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_IDNTFCCION_RSPNSBLE'
,p_condition_element=>'P32_IDNTFCCION_RSPNSBLE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60349822610105858)
,p_event_id=>wwv_flow_api.id(60347315153105855)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60350365706105858)
,p_event_id=>wwv_flow_api.id(60347315153105855)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60347800851105856)
,p_event_id=>wwv_flow_api.id(60347315153105855)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ID_RPRTE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60348380318105857)
,p_event_id=>wwv_flow_api.id(60347315153105855)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ID_RPRTE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60348848519105857)
,p_event_id=>wwv_flow_api.id(60347315153105855)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(60344602941105846)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60349319828105858)
,p_event_id=>wwv_flow_api.id(60347315153105855)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(60344602941105846)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(60350735042105858)
,p_name=>'Al cambiar reporte'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_ID_RPRTE'
,p_condition_element=>'P32_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60351211674105859)
,p_event_id=>wwv_flow_api.id(60350735042105858)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(60344602941105846)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60351796373105861)
,p_event_id=>wwv_flow_api.id(60350735042105858)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(60344602941105846)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(60346596074105852)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t();  ',
'     v_json                 clob;   ',
'begin    ',
'    --:P32_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P32_ID_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P32_ID_RPRTE;',
' ',
'     ',
'    :P32_CNSCUTVO := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''ECG'');',
' ',
'   v_object.put(''cdgo_clnte'', :F_CDGO_CLNTE);',
'   v_object.put(''usrio'', :F_NMBRE_USRIO);   ',
'   v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'   v_object.put(''idntfccion_rspnsble'',:P32_IDNTFCCION_RSPNSBLE);',
'   v_object.put(''cnsctvo'',:P32_CNSCUTVO);',
'  ',
'   ',
'    v_json   := v_object.to_clob();  ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);  ',
'    insert into muerto (c_001) values (v_json);commit;',
'   ',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(60344602941105846)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74323197110173733)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Estado de Cuenta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta      number;',
'    v_mnsje_rspsta     varchar2(4000);',
'    v_lngtud           number;',
'    v_id_sjto_rspnsble number;',
'begin',
'',
'    select length(trim(a.prmer_nmbre||'' ''|| a.sgndo_nmbre||'' ''||a.prmer_aplldo||'' ''||a.sgndo_aplldo)) as lngtd',
'         , a.id_sjto_rspnsble',
'      into v_lngtud',
'         , v_id_sjto_rspnsble ',
'      from v_si_i_sujetos_responsable a',
'     where trim(a.idntfccion_rspnsble) = :P32_IDNTFCCION_RSPNSBLE',
'     order by lngtd desc',
'     fetch first 1 rows only;',
'     ',
'    pkg_gf_paz_y_salvo.prc_rg_estdo_cnta( p_cdgo_clnte          => :F_CDGO_CLNTE                      ',
'                                          , p_cnsctvo           => :P32_CNSCUTVO',
'                                          , p_id_sjto_rspnsble  => v_id_sjto_rspnsble',
'                                          , p_id_usrio_rgstro   => :F_ID_USRIO',
'                                          , o_cdgo_rspsta  	    => v_cdgo_rspsta',
'                                          , o_mnsje_rspsta 	    => v_mnsje_rspsta);',
'       if(v_cdgo_rspsta <> 0 ) then ',
'           raise_application_error( -20001 , v_mnsje_rspsta);',
'       end if;                                          ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(60344602941105846)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(60346919471105855)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar Responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare     ',
'    v_exis varchar2(1);',
'begin',
'    select 1      ',
'      into v_exis',
'      from si_i_sujetos_responsable c',
'      where trim(idntfccion) like :P32_IDNTFCCION_RSPNSBLE||''%''',
'      fetch first 1 rows only;',
'      ',
'      if v_exis = ''1'' then',
'            :P32_MNSJE := ''Responsable encontrado.'';',
'      elsif  v_exis is null then ',
unistr('            :P32_MNSJE := ''No se encontro el responable con la identificaci\00F3n ingresada.'';'),
'      end if;',
'      ',
'end;      '))
,p_process_error_message=>'&P32_MNSJE.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&P32_MNSJE.'
);
end;
/
