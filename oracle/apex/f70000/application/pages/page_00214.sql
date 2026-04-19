prompt --application/pages/page_00214
begin
wwv_flow_api.create_page(
 p_id=>214
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Generaci\00F3n de Oficios Plusval\00EDa ')
,p_step_title=>unistr('Generaci\00F3n de Oficios Plusval\00EDa ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20260109163305'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67705310307366033)
,p_plug_name=>'Consultar Sujeto'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67705147038366031)
,p_plug_name=>'Datos Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(67705310307366033)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P214_ID_SJTO_IMPSTO'
,p_attribute_01=>'P214_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67706398265366044)
,p_plug_name=>'Generar Oficio'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(160507987702468910)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
unistr('Funcionalidad que permite  consultar los datos de un sujeto tributo especifico y Generar Oficios de Autorizaci\00F3n de Registro Plusval\00EDa y No Afectaci\00F3n Plusval\00EDa<br><br>'),
'',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63334619941959662)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(67706398265366044)
,p_button_name=>'Btn_Gnrar_Ofcio'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Oficio '
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63335018494959662)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(67706398265366044)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63330810675959652)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(67705310307366033)
,p_button_name=>'Btn_cnsultar_x_idntfccion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63330481747959650)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(67705310307366033)
,p_button_name=>'Btn_cnsultar_x_prmtros'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Consultar por Parametros'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(63339965212959681)
,p_branch_name=>'Ir a busqueda de Sujeto Impuesto'
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P214_ID_SJTO_IMPSTO,&P214_ID_IMPSTO.,&P214_ID_IMPSTO_SBMPSTO.,P214_ID_IMPSTO,P214_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(63330481747959650)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(63340321066959681)
,p_branch_name=>'Go To Page 126'
,p_branch_action=>'f?p=&APP_ID.:214:&SESSION.:Btn_Imprimir:&DEBUG.:RP:P214_ID_RPRTE,P214_ID_SJTO_IMPSTO:&P214_ID_RPRTE.,&P214_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(63335018494959662)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(63340795410959681)
,p_branch_name=>'Ir a Imprimir Oficio'
,p_branch_action=>'f?p=&APP_ID.:191:&SESSION.:generar_oficio:&DEBUG.:RP,191:P191_ID_PLNTLLA,P191_ID_SJTO_IMPSTO,P191_ID_PLSVLIA_DTLLE:&P214_ID_PLNTLLA.,&P214_ID_SJTO_IMPSTO.,&P214_ID_PLSVLIA_DTLLE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(63334619941959662)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63331271941959654)
,p_name=>'P214_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67705310307366033)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'85%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63331686219959658)
,p_name=>'P214_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(67705310307366033)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto as d ',
'     , id_impsto_sbmpsto    as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P214_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P214_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'85%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63332041560959659)
,p_name=>'P214_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(67705310307366033)
,p_prompt=>'Identificacion '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63332470037959659)
,p_name=>'P214_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(67705310307366033)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63332831580959659)
,p_name=>'P214_MSNJE_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(67705310307366033)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63333234063959659)
,p_name=>'P214_BRANCH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(67705310307366033)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63333609355959659)
,p_name=>'P214_ID_PLSVLIA_DTLLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(67705310307366033)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63335471358959662)
,p_name=>'P214_ID_PLNTLLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67706398265366044)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select dscrpcion  as d',
'      , id_plntlla as v',
'  from gn_d_plantillas',
' where id_rprte in (',
'                          select id_rprte',
'                           from gn_d_reportes',
'                          where cdgo_rprte_grpo = :P214_CDGO_RPRTE_GRPO',
'                            and actvo           = ''S''',
'                       )',
'                       and actvo           = ''S'';',
'                       '))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63335861302959663)
,p_name=>'P214_CDGO_RPRTE_GRPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(67706398265366044)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(63336682756959673)
,p_validation_name=>'Sujeto Impuesto no Null'
,p_validation_sequence=>10
,p_validation=>'P214_ID_SJTO_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Se\00F1or Usuario Debe consultar el Sujeto tributo')
,p_when_button_pressed=>wwv_flow_api.id(63334619941959662)
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(63337001398959673)
,p_validation_name=>'Identificacion no nula'
,p_validation_sequence=>20
,p_validation=>'P214_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# debe tener un valor.'
,p_when_button_pressed=>wwv_flow_api.id(63330810675959652)
,p_associated_item=>wwv_flow_api.id(63332041560959659)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63338421826959677)
,p_name=>'Al seleccionar reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P214_ID_PLNTLLA'
,p_condition_element=>'P214_ID_PLNTLLA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63338989681959679)
,p_event_id=>wwv_flow_api.id(63338421826959677)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(63334619941959662)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63339417499959680)
,p_event_id=>wwv_flow_api.id(63338421826959677)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(63334619941959662)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63337371543959673)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto x Identificacion '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select id_sjto_impsto',
'    into :P214_ID_SJTO_IMPSTO',
'    from v_si_i_sujetos_impuesto',
'   where id_impsto       = :P214_ID_IMPSTO      ',
'     and idntfccion_sjto = :P214_IDNTFCCION;',
'     ',
'     :P214_MSNJE_RSPSTA   := ''Sujeto Encontrado'';',
'exception',
'        when no_data_found then',
unistr('                :P214_MSNJE_RSPSTA   := ''No se encontr\00F3 ning\00FAn dato.'';'),
'                :P214_ID_SJTO_IMPSTO := '''';',
'end;      ',
''))
,p_process_error_message=>'&P214_MSNJE_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(63330810675959652)
,p_process_success_message=>'&P214_MSNJE_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63337689425959675)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Identificacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select idntfccion_sjto ',
'  into :P214_IDNTFCCION',
'  from v_si_i_sujetos_impuesto',
' where id_sjto_impsto = :P214_ID_SJTO_IMPSTO;',
'exception',
'    when no_data_found then',
'        null;',
'end; ',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63338014736959676)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Oficio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_object json_object_t := json_object_t();  ',
'     v_json                      clob;   ',
'     v_id_dcmnto_tpo             number;',
'     v_id_dcmnto                 number;',
'     v_cnsctvo                   number;',
'     v_id_ofcio                  number;     ',
'     v_gn_d_reportes             gn_d_reportes%rowtype;',
'     v_blob                      blob;  ',
'     v_id_trd_srie_dcmnto_tpo    number;',
'     v_cnsctvo_dcmnto            number;',
'begin   ',
'    -- CONSULTAMOS LOS DATOS DEL REPORTE    ',
'    begin',
'        select /*+ RESULT_CACHE */',
'                r.*',
'           into v_gn_d_reportes ',
'           from gn_d_reportes r',
'          where r.id_rprte = :P214_ID_RPRTE;         ',
'    exception',
'        when others then',
'                null;',
'    end; ',
'',
'    if v_gn_d_reportes.cdgo_rprte_grpo = ''ONA'' then -- reporte de no afectacion plusvalia ',
'       -- Consultamos el Consecutivo',
'       v_cnsctvo := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''NAF'');',
'',
'        -- Consultamos el tipo de documento para la TRD',
'        select a.id_dcmnto_tpo',
'             , b.id_trd_srie_dcmnto_tpo',
'          into v_id_dcmnto_tpo',
'             , v_id_trd_srie_dcmnto_tpo',
'          from gd_d_documentos_tipo a',
'          join gd_d_trd_serie_dcmnto_tpo b on a.id_dcmnto_tpo = b.id_dcmnto_tpo',
'         where a.cdgo_dcmnto_tpo = ''NPP'';',
'        ',
'    elsif v_gn_d_reportes.cdgo_rprte_grpo = ''OFP'' then -- reporte confimacion de registro',
'       -- Consultamos el Consecutivo',
'       v_cnsctvo := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''ARP'');',
'',
'      -- Consultamos el tipo de documento para la TRD',
'             select a.id_dcmnto_tpo',
'                  , b.id_trd_srie_dcmnto_tpo',
'               into v_id_dcmnto_tpo',
'                  , v_id_trd_srie_dcmnto_tpo',
'               from gd_d_documentos_tipo a',
'               join gd_d_trd_serie_dcmnto_tpo b on a.id_dcmnto_tpo = b.id_dcmnto_tpo',
'              where a.cdgo_dcmnto_tpo = ''ARP'';',
'',
'        ',
'    end if;',
'    ',
'',
'    -- construimos el json con los datos necesarios para el reporte',
'    v_object.put(''id_sjto_impsto'', :P214_ID_SJTO_IMPSTO);',
'    v_object.put(''cnsctvo'',v_cnsctvo);',
'    v_object.put(''id_dcmnto_tpo'',v_id_dcmnto_tpo);',
'    v_json   := v_object.to_clob();  ',
'    ',
'    -- Seteamos los datos necesarios para generar el reporte',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_ID_RPRTE'', v_gn_d_reportes.id_rprte);       ',
'    apex_util.set_session_state(''P37_JSON'', v_json);      ',
'  ',
'  ',
'    -- GENERAMOS EL BLOB',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );   ',
'    ',
'    -- Insertamos el documento ',
'    begin',
'        --GENERAMOS consecutivo del documento',
'        v_cnsctvo_dcmnto := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''GDC'');',
'        ',
'        insert into gd_g_documentos (id_trd_srie_dcmnto_tpo,   id_dcmnto_tpo,   nmro_dcmnto, file_blob, FILE_NAME,           file_mimetype,      id_usrio)',
'                              values(v_id_trd_srie_dcmnto_tpo, v_id_dcmnto_tpo, v_cnsctvo_dcmnto,   v_blob,    ''-2021-''||v_cnsctvo||''.pdf'', ''application/pdf'', :F_ID_USRIO)',
'                              returning id_dcmnto into v_id_dcmnto;  ',
'                                      ',
'    exception ',
'        when others then ',
'            raise_application_error(-20000, ''Error al insertar el Documento'');',
'    end;    ',
'    ',
'    -- insertamos el oficio en la tabla temporal',
'    begin',
'        insert into gn_g_oficios (CNSCTVO, ID_SJTO_IMPSTO, ID_USRIO, FCHA, ID_DCMNTO) values (v_cnsctvo, :P214_ID_SJTO_IMPSTO, :F_ID_USRIO, sysdate, v_id_dcmnto);',
'        commit;',
'    exception ',
'        when others then ',
'            raise_application_error(-20000, ''Error al insertar el Oficio Confirmacion de Registro'');',
'    end;   ',
'',
'        ',
'    htp.init;',
'    owa_util.mime_header(''application/pdf'', FALSE );',
'    htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'    htp.p(''Content-Disposition: attachment; filename="Oficio No. PL-NP-''||v_cnsctvo||''.pdf"'' );',
'    htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'    apex_application.stop_apex_engine;',
'',
'exception',
'     when others then',
'          raise_application_error(-20000, sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(63335018494959662)
,p_process_when=>'Btn_Imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
