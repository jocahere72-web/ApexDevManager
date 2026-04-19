prompt --application/pages/page_00040
begin
wwv_flow_api.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Tipo de novedad veh\00EDculos')
,p_step_title=>unistr('Tipo de novedad veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(74223836934679730)
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20210326220945'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104000929558630101)
,p_plug_name=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163427565311515050)
,p_plug_name=>'Tipo de Novedad'
,p_parent_plug_id=>wwv_flow_api.id(104000929558630101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_estado number;',
'begin',
'   select w.id_estdo_trnscion',
'     into v_estado',
'     from wf_g_instancias_transicion w',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and w.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'      and w.id_usrio = :F_ID_USRIO;',
'',
'  if v_estado =  3 then ',
'    return false; ',
'    else ',
'    return true; ',
'  end if ;',
'',
'exception',
'        when others then ',
'        null; ',
'    ',
'end;'))
,p_plug_read_only_when_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163428080653515055)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(163728054706643824)
,p_plug_name=>'Sujeto Impuesto'
,p_region_name=>'sujeto_impuesto'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P40_ID_SJTO_IMPSTO'
,p_attribute_01=>'P40_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(164047158902116512)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'    <p align="justify">Funcionalidad de Solicitud de Novedad.<br> <br>',
'    <center><b> Paso 1 Tipo de Novedad y Sujeto Tributo.</b> </center><br>',
'    <b> 1</b> Se debe seleccionar el tipo de la Novedad.<br> <br>',
'    <b> 2</b> Consultar el Sujeto Tributo<br>',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(164149386450651914)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94129506792050539)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(164149386450651914)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94123982831050527)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(163427565311515050)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94124318645050528)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(163427565311515050)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94135082698050584)
,p_branch_name=>unistr('Ir a P\00E1gina 3')
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P40_ID_SJTO_IMPSTO,&P40_ID_IMPSTO.,&P40_ID_IMPSTO_SBMPSTO.,P40_ID_IMPSTO,P40_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(94124318645050528)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8047103885415901)
,p_name=>'P40_RSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94124703973050530)
,p_name=>'P40_ID_NVDAD_PRSNA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94125144092050532)
,p_name=>'P40_CDGO_NVDAD_PRSNA_ESTDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94125544499050532)
,p_name=>'P40_CDGO_NVDAD_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_item_default=>'CNC'
,p_prompt=>'Tipo de Novedad'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion',
'        , cdgo_nvdad_tpo',
'    from si_d_novedades_tipo',
'    where cdgo_sjto_tpo = ''V''',
' order by dscrpcion'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94125955624050533)
,p_name=>'P40_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94126351590050534)
,p_name=>'P40_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_prompt=>'Tributos'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper(nmbre_impsto)',
'        , id_impsto',
'     from df_c_impuestos',
'    where cdgo_clnte        = :F_CDGO_CLNTE',
'   and cdgo_sjto_tpo     = ''V''',
' order by nmbre_impsto'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Selecciones un Tributo -- '
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94126736125050534)
,p_name=>'P40_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper(nmbre_impsto_sbmpsto)',
'        , id_impsto_sbmpsto',
'     from df_i_impuestos_subimpuesto',
'    where id_impsto        = :P40_ID_IMPSTO',
' order by nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Selecciones un Sub-Tributo -- '
,p_lov_cascade_parent_items=>'P40_ID_IMPSTO'
,p_ajax_items_to_submit=>'P40_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94127165416050535)
,p_name=>'P40_PRMTRO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94127543058050535)
,p_name=>'P40_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94128586625050538)
,p_name=>'P40_MSTRAR_BTNES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(163428080653515055)
,p_source=>'true'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103944698333769201)
,p_name=>'P40_FECHA_NOVEDAD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(163427565311515050)
,p_prompt=>'Fecha Novedad:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'ondblclick="this.value=''''" onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(94130330797050564)
,p_validation_name=>'Validar que el Sujeto Impuesto exista'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P40_ID_IMPSTO',
'       and idntfccion_sjto           = :P40_PRMTRO;',
'    ',
'   return true;',
'exception',
'    when no_data_found then ',
'  ',
'        return false;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El Sujeto Tributo consultado no existe'
,p_validation_condition=>'P40_PRMTRO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(94123982831050527)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(94130007515050553)
,p_validation_name=>unistr('Validar que el sujeto impuesto este activo cuando es Actualizaci\00F3n y cancelaci\00F3n')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P40_ID_IMPSTO',
'       and idntfccion_sjto           = :P40_PRMTRO',
'       and id_sjto_estdo             = 1;',
'    ',
'   return true;',
'exception',
'    when no_data_found then ',
'      ',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El sujeto tributo consultado no se encuentra activo'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(94131173814050564)
,p_validation_name=>unistr('Validar que el sujeto impuesto este inactivo cuando es Activaci\00F3n')
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P40_ID_IMPSTO',
'       and idntfccion_sjto           = :P40_PRMTRO',
'       and id_sjto_estdo             = 2;',
'    ',
'   return true;',
'exception',
'    when no_data_found then ',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El sujeto tributo consultado ya se encuentra activo'
,p_validation_condition=>'P40_CDGO_NVDAD_TPO'
,p_validation_condition2=>'012'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(94123982831050527)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(94130733754050564)
,p_validation_name=>unistr('Validar que el parametro no sea Nulo al hacer clic en elbot\00F3n consultar')
,p_validation_sequence=>40
,p_validation=>'P40_PRMTRO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar una identificaci\00F3n para consultar')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94132699218050566)
,p_name=>'Cuando el Sujeto Impuesto Seleccionado esta Inactivo'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>'select 1 from si_i_sujetos_impuesto where id_sjto_impsto = :P40_ID_SJTO_IMPSTO and id_sjto_estdo = 2 and :P40_CDGO_NVDAD_TPO != ''ACV'''
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94133112266050577)
,p_event_id=>wwv_flow_api.id(94132699218050566)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >NOVEDADES DE PERSONAS</H2>'',',
'        html: ''<H4>El Sujeto Tributo seleccionado NO esta Activo.</H4>'' ',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "sujeto_impuesto" ).hide();',
'    apex.item( ":P40_ID_SJTO_IMPSTO" ).setValue(null);',
'    apex.item( ":P40_MSTRAR_BTNES" ).setValue(''false'');',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94133517465050579)
,p_name=>'Inabilitar Botones cuando la novedad ya esta registrada'
,p_event_sequence=>20
,p_condition_element=>'P40_ID_NVDAD_PRSNA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94134023091050580)
,p_event_id=>wwv_flow_api.id(94133517465050579)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(94124318645050528)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94134557836050583)
,p_event_id=>wwv_flow_api.id(94133517465050579)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94131443141050564)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P40_ID_IMPSTO',
'       and idntfccion_sjto           = :P40_PRMTRO;',
'    ',
'   :P40_RSPSTA := ''Consulta Exitosa'';',
'   :P40_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'   :P40_MSTRAR_BTNES := ''true'';',
'   :P40_RSTA := ''S''; ',
'exception',
'    when no_data_found then ',
'    :P40_ID_SJTO_IMPSTO := null;',
'    :P40_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'   :P40_MSTRAR_BTNES := ''false'';',
':P40_RSTA := ''N''; ',
'end;'))
,p_process_error_message=>'&P40_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94123982831050527)
,p_process_when=>'P40_PRMTRO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P40_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94132207502050565)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Proceso WorkFlow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94131801170050565)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Novedad Persona'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select id_nvdad_prsna',
'        , id_nvdad_prsna',
'        , id_impsto',
'        , id_impsto_sbmpsto',
'        , cdgo_nvdad_tpo',
'        , id_sjto_impsto',
'        , obsrvcion',
'        , cdgo_nvdad_prsna_estdo',
'     into :P40_ID_NVDAD_PRSNA',
'        , :P30_ID_NVDAD_PRSNA',
'        , :P40_ID_IMPSTO',
'        , :P40_ID_IMPSTO_SBMPSTO',
'        , :P40_CDGO_NVDAD_TPO',
'        , :P40_ID_SJTO_IMPSTO',
'        , :P29_OBSRVCION',
'        , :P40_CDGO_NVDAD_PRSNA_ESTDO',
'     from si_g_novedades_persona',
'    where id_nvdad_prsna            = :P40_ID_NVDAD_PRSNA;',
'exception',
'    when others then ',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
