prompt --application/pages/page_20250_006
begin
wwv_flow_api.create_page(
 p_id=>2025034
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Valida de Pago en Linea'
,p_step_title=>'Valida de Pago en Linea'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/consumirServiciosRest.js?v=202211231017',
'https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function pagosEnLinea() {',
'  try {',
'    const response = await apex.server.process("pagosEnLinea", {',
'      pageItems: "#P2025022_ID_ORGEN,#P2025022_ID_TRCRO"',
'    });',
'',
'    if (response && response.cdgo_rspsta === 0 && response.location) {',
'      window.open(response.location, "_blank");',
'      // Ejecutar branch',
'      $(''#BTN_REDIRECCIONAR'').click();',
'    } else {',
'      apex.message.alert(',
unistr('        "No se pudo iniciar la transacci\00F3n. " + '),
unistr('        (response?.mnsje_rspsta || "Intente m\00E1s tarde.")'),
'      );',
'    }',
'  } catch (error) {',
unistr('    apex.message.alert("Error inesperado al ejecutar la transacci\00F3n: " + error.message);'),
'  }',
'}',
''))
,p_css_file_urls=>'https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.alert {',
'    position: relative;',
'    padding: .75rem 1.25rem;',
'    margin-bottom: 1rem;',
'    border: 1px solid transparent;',
'    border-radius: .25rem;',
'}',
'',
'.alert-info {',
'    color: #0c5460;',
'    background-color: #d1ecf1;',
'    border-color: #bee5eb;',
'}',
'',
'/*.bloquear{',
'    width: 100%;',
'    height: 100%;',
'    background: rgba(0,0,0,0.6);',
'    position:fixed;',
'    z-index: 1000;',
'}*/'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_rejoin_existing_sessions=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20260206105911'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105615377679791692)
,p_plug_name=>'Datos del documento'
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
 p_id=>wwv_flow_api.id(105615753288791695)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252173689295651394)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16680399807059737)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(105615753288791695)
,p_button_name=>'BTN_RGRESAR'
,p_button_static_id=>'BTN_RGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,23,100:P1_CDGO_CLNTE:&F_CDGO_CLNTE.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16681164698059738)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(105615753288791695)
,p_button_name=>'Boton_pagar_en_linea'
,p_button_static_id=>'btn_pagar_en_linea'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Pago en L\00EDnea')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P2025034_PAGO_LINEA'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-credit-card'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16786566377845802)
,p_branch_name=>'Go to Page 23'
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23:P23_CDGO_CLNTE,P23_CDGO_RCBO_TPO,P23_VLOR_TTAL_DAB,P23_CDGO_ORGN_TPO,P23_ID_IMPSTO,P23_ID_IMPSTO_SBMPSTO,P23_ID_ORGEN,P23_FCHA:23001,&P2025034_CDGO_DCMNTO_TPO.,&P2025034_VLOR_TTAL.,DC,&P2025034_ID_IMPSTO.,&P2025034_ID_IMPSTO_SBMPSTO.,&P2025034_ID_ORGEN.,&P2025034_FCHA_VNCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(16681164698059738)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16679694341059737)
,p_name=>'P2025034_MNSJE_RSPTA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16689512772076802)
,p_name=>'P2025034_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16689646355076803)
,p_name=>'P2025034_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16689734521076804)
,p_name=>'P2025034_NMRO_DCMNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>'Numero de Documento'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16689818751076805)
,p_name=>'P2025034_FCHA_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>'Fecha Documento'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16689924281076806)
,p_name=>'P2025034_FCHA_VNCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>'Fecha Vencimiento'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690048965076807)
,p_name=>'P2025034_VLOR_TTAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690178987076808)
,p_name=>'P2025034_IDNTFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690286168076809)
,p_name=>'P2025034_ID_PAIS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690374655076810)
,p_name=>'P2025034_NMBRE_PAIS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>'Pais'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690468133076811)
,p_name=>'P2025034_ID_DPRTMNTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690564316076812)
,p_name=>'P2025034_NMBRE_DPRTMNTO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690607021076813)
,p_name=>'P2025034_ID_MNCPIO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690751370076814)
,p_name=>'P2025034_NMBRE_MNCPIO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690849741076815)
,p_name=>'P2025034_DRCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16690930785076816)
,p_name=>'P2025034_ID_ORGEN'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16691185226076818)
,p_name=>'P2025034_NMBRE_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>unistr('M\00F3dulo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16691251766076819)
,p_name=>'P2025034_PAGO_LINEA'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16691906981076826)
,p_name=>'P2025034_ID_DCMNTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16692169270076828)
,p_name=>'P2025034_CDGO_DCMNTO_TPO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16786418729845801)
,p_name=>'P2025034_VLOR_TTAL_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>'Valor Total'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(136022619492407601)
,p_name=>'P2025034_NMBRE_RZON_SCIAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>unistr('Nombre - Raz\00F3n Social')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(136022790489407602)
,p_name=>'P2025034_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(105615377679791692)
,p_prompt=>'Impuesto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16691783378076824)
,p_name=>'Validar Documento'
,p_event_sequence=>10
,p_bind_type=>'live'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16691893247076825)
,p_event_id=>wwv_flow_api.id(16691783378076824)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v = $v("P2025034_PAGO_LINEA");  ',
'if (v === "V") {',
unistr('    apex.message.alert("El documento est\00E1 VENCIDO y no puede ser pagado.");'),
'}',
'else if (v === "P") {',
'    apex.message.alert("El documento ya fue PAGADO.");',
'}',
'else if (v === "X") {',
'    apex.message.alert("El documento no EXISTE.");',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16688198084059744)
,p_name=>unistr('Al cargar p\00E1gina')
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16688698354059744)
,p_event_id=>wwv_flow_api.id(16688198084059744)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16692029537076827)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' begin',
'  select d.id_dcmnto, ',
'         d.id_impsto, ',
'         f.nmbre_impsto, ',
'         d.id_impsto_sbmpsto, ',
'         d.nmro_dcmnto, ',
'         d.fcha_dcmnto, ',
'         TO_CHAR(d.fcha_vncmnto,''DD/MM/YYYY''), ',
'         TO_CHAR(d.vlor_ttal, ''999G999G999''), ',
'         d.vlor_ttal,',
'         s.idntfccion, ',
'         s.id_pais, ',
'         p.nmbre_pais, ',
'         s.id_dprtmnto, ',
'         de.nmbre_dprtmnto,  ',
'         s.id_mncpio,  ',
'         m.nmbre_mncpio, ',
'         s.drccion,',
'         d.cdgo_dcmnto_tpo,',
'         nvl(g.nmbre_rzon_scial,h.nmbre_rzon_scial) nmbre_rzon_scial,',
'         j.nmbre_impsto_sbmpsto ',
'         into :P2025034_ID_DCMNTO, ',
'              :P2025034_ID_IMPSTO,',
'              :P2025034_NMBRE_IMPSTO,',
'              :P2025034_ID_IMPSTO_SBMPSTO,',
'              :P2025034_NMRO_DCMNTO,',
'              :P2025034_FCHA_DCMNTO,',
'              :P2025034_FCHA_VNCMNTO,',
'              :P2025034_VLOR_TTAL_1,',
'              :P2025034_VLOR_TTAL,',
'              :P2025034_IDNTFCCION, ',
'              :P2025034_ID_PAIS, ',
'              :P2025034_NMBRE_PAIS,',
'              :P2025034_ID_DPRTMNTO, ',
'              :P2025034_NMBRE_DPRTMNTO,',
'              :P2025034_ID_MNCPIO,',
'              :P2025034_NMBRE_MNCPIO,',
'              :P2025034_DRCCION,',
'              :P2025034_CDGO_DCMNTO_TPO,',
'              :P2025034_NMBRE_RZON_SCIAL,',
'              :P2025034_NMBRE_IMPSTO_SBMPSTO',
'    from  re_g_documentos d ',
'    join SI_I_SUJETOS_IMPUESTO i on d.id_sjto_impsto = i.id_sjto_impsto',
'    join SI_C_SUJETOS s on i.id_sjto = s.id_sjto',
'    left join DF_S_PAISES p on s.id_pais = p.id_pais',
'    left join DF_S_DEPARTAMENTOS de on s.id_dprtmnto = de.id_dprtmnto and p.id_pais = de.id_pais',
'    left join DF_S_MUNICIPIOS m on s.id_mncpio = m.id_mncpio and de.id_dprtmnto = m.id_dprtmnto',
'    left join DF_C_IMPUESTOS f on d.id_impsto = f.id_impsto',
'    left join si_i_personas g on g.id_sjto_impsto = i.id_sjto_impsto and f.cdgo_sjto_tpo = ''E''',
'    left join v_si_i_sujetos_responsable h on h.id_sjto_impsto = i.id_sjto_impsto and f.cdgo_sjto_tpo <> ''E'' and h.prncpal_s_n = ''S''',
'    left join df_i_impuestos_subimpuesto j on j.id_impsto_sbmpsto = d.id_impsto_sbmpsto',
'    where d.id_dcmnto = :P2025034_ID_ORGEN;',
'    exception ',
'      when others then ',
'              :P2025034_ID_DCMNTO            := null;',
'              :P2025034_ID_IMPSTO            := null;',
'              :P2025034_NMBRE_IMPSTO         := null;',
'              :P2025034_NMRO_DCMNTO          := null;',
'              :P2025034_FCHA_DCMNTO          := null;',
'              :P2025034_FCHA_VNCMNTO         := null;',
'              :P2025034_VLOR_TTAL            := null;',
'              :P2025034_IDNTFCCION           := null;',
'              :P2025034_ID_PAIS              := null;',
'              :P2025034_NMBRE_PAIS           := null;',
'              :P2025034_ID_DPRTMNTO          := null;',
'              :P2025034_NMBRE_DPRTMNTO       := null;',
'              :P2025034_ID_MNCPIO            := null;',
'              :P2025034_NMBRE_MNCPIO         := null;',
'              :P2025034_DRCCION              := null;',
'              :P2025034_NMBRE_RZON_SCIAL     := null;',
'              :P2025034_NMBRE_IMPSTO_SBMPSTO := null;',
'    end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16684790869059741)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   declare ',
'    v_rcdos number(5);',
'   begin  ',
'     :P2025034_PAGO_LINEA := ''S''; ',
'      --documento esta vencido',
'      select  count(*) into v_rcdos',
'      from  re_g_documentos d ',
'     where d.id_dcmnto = :P2025034_ID_ORGEN',
'       and d.fcha_vncmnto >= TRUNC(sysdate);',
'    ',
'       if (v_rcdos = 0) then',
'         :P2025034_PAGO_LINEA := ''V'';     ',
'       end if;',
'       ',
'   --Cantidad de Recaudos Registrado y Aplicado',
'      select count(*)',
'        into v_rcdos',
'        from re_g_recaudos',
'       where id_orgen = :P2025034_ID_ORGEN',
'           and cdgo_rcdo_estdo in (''RG'', ''AP'');',
'    ',
'      --Verifica si Existen Recaudos',
'      if (v_rcdos > 0) then',
'        :P2025034_PAGO_LINEA := ''P'';      ',
'      end if;',
'      ',
'   ',
'      --documento no existe',
'      select  count(*) into v_rcdos',
'      from  re_g_documentos d ',
'     where d.id_dcmnto = :P2025034_ID_ORGEN;',
'    ',
'       if (v_rcdos = 0) then',
'         :P2025034_PAGO_LINEA := ''X'';     ',
'       end if;',
'',
'     ',
'    end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
