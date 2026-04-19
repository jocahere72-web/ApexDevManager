prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Archivo Novedad de Predial Masivo'
,p_step_title=>'Archivo Novedad de Predial Masivo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190906075424'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123813087769750301)
,p_plug_name=>'Novedad Masiva - Archivo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123813178372750302)
,p_plug_name=>'<b>Registros Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(123813087769750301)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Cargados'' as label  ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value ',
'  from si_g_novedades_prdio_crgue',
' where id_prcso_crga = :P18_ID_PRCSO_CRGA'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123813498317750305)
,p_plug_name=>'<b>Predios Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(123813087769750301)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Cargados'' as label ',
'       , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'    from v_si_i_sujetos_impuesto a',
'   where a.cdgo_clnte = 6',
'     and a.id_impsto  = 16',
'     and a.idntfccion_sjto in (',
'                                 select b.idntfccion',
'                                   from si_g_novedades_prdio_crgue b ',
'                                  where b.id_prcso_crga = :P18_ID_PRCSO_CRGA',
'                               )'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(340842353697165236)
,p_plug_name=>'Archivo'
,p_parent_plug_id=>wwv_flow_api.id(123813087769750301)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
'   from wf_g_instancias_transicion',
'  where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'    and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'    and id_estdo_trnscion  = 3;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(240133840537810925)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123772857872547507)
,p_name=>'P18_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(340842353697165236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123773289540547516)
,p_name=>'P18_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(340842353697165236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123773611715547516)
,p_name=>'P18_ID_ENTDAD_NVDAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(340842353697165236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123774001002547517)
,p_name=>'P18_ID_ACTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(340842353697165236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123774470648547517)
,p_name=>'P18_NMRO_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(340842353697165236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123774841983547517)
,p_name=>'P18_FCHA_INCIO_APLCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(340842353697165236)
,p_item_default=>'''01/01/'' || to_char( sysdate , ''YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123775269216547517)
,p_name=>'P18_CDGO_ACTO_TPO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(340842353697165236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123777571924553301)
,p_name=>'P18_ID_PRCSO_CRGA'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(340842353697165236)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select file_name || ''  |  '' || to_char( fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || nmbre_trcro as d',
'       , id_prcso_crga as r',
'    from v_et_g_procesos_carga a ',
'   where cdgo_clnte        = :F_CDGO_CLNTE',
'     and id_impsto         = :P18_ID_IMPSTO',
'     and id_impsto_sbmpsto = :P18_ID_IMPSTO_SBMPSTO',
'     and ( indcdor_prcsdo = ''N'' or :P18_ID_PRCSO_CRGA is not null )',
'     and id_prcso_crga  in (',
'                                  select id_prcso_crga ',
'                                    from si_g_novedades_prdio_crgue ',
'                                group by id_prcso_crga',
'                            )'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123917807704808501)
,p_name=>'P18_FCHA_DCMNTO_SPRTE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(340842353697165236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(123813258573750303)
,p_name=>'Al Cambiar Archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_ID_PRCSO_CRGA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(123813367490750304)
,p_event_id=>wwv_flow_api.id(123813258573750303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
end;
/
