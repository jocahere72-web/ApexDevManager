prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>unistr('Consulta Envi\00F3 Programado')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Consulta Envi\00F3 Programado')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function drag(ev) {',
'   ev.dataTransfer.setData("text", $(ev.target).data(''valor''));',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var acc = document.getElementsByClassName("accordion");',
'var i; ',
'for (i = 0; i < acc.length; i++) {',
'  acc[i].addEventListener("click", function() {',
'    this.classList.toggle("active");',
'    var panel = this.nextElementSibling;    ',
'    if (panel.style.maxHeight){',
'      panel.style.maxHeight = null;',
'    } else {',
'      panel.style.maxHeight = panel.scrollHeight + "px";',
'    } ',
'  });',
'}',
'',
'$(''.column'').hover(function(){',
'    var  content = `<div>${$(this).data(''tooltip'')} </div>`;',
'    $(this).tooltipster({',
'        contentAsHTML: true,',
'        interactive: true,',
'        theme: ''tooltipster-shadow'',//''tooltipster-light'',',
'        animation: ''fade'',',
'        delay: [100, 1000]',
'        }).tooltipster(''content'', content).tooltipster(''open'');',
'}, function () {$(this).tooltipster(''close'');});'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-noir.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.buttonConstructor{',
'    margin-top: 26px;',
'}',
'',
'.accordion {',
'    background-color: #eee;',
'    color: #444;',
'    cursor: pointer;',
'    padding: 5px;',
'    width: 100%;',
'    border: 1px solid #eee;',
'    text-align: left;',
'    border-radius: 5px;',
'    outline: none;',
'    font-size: 12px;',
'    transition: 0.4s;',
'    margin-bottom: 4px;',
'}',
'',
'.active, .accordion:hover {',
'    background-color: #ccc;',
'}',
'',
'.accordion:after {',
'    content: ''\002B'';',
'    color: #777;',
'    font-weight: bold;',
'    float: right;',
'    margin-right: 4px;',
'}',
'',
'.active:after {',
'    content: "\2212";',
'}',
'',
'.panel {',
'    padding: 0 8px;',
'    background-color: white;',
'    max-height: 0;',
'    overflow: hidden;',
'    transition: max-height 0.6s ease-out;',
'}',
'',
'#varlist, #columnslist {',
'    list-style-type: none;',
'    margin: 0 !important;',
'    padding: 0;',
'}',
'#varlist li, #columnslist li {',
'    background: #c4ced724;',
'    border: 1px solid #c4ced724;',
'    border-radius: 5px;',
'    margin-bottom: 5px;',
'    height: 25px;',
'    line-height: 25px;',
'    cursor: move;',
'}',
'#varlist li:nth-child(2n), #columnslist li:nth-child(2n) {',
'    background: #c4ced7c9;',
'    border: 1px solid #c4ced7c9;',
'}',
'#varlist li:hover, #columnslist li:hover {',
'    background: #FFFDE3;',
'    border-left: 5px solid #DCDAC1;',
'    margin-left: -5px; ',
'}',
'.column {',
'    padding: 0 20px;',
'    white-space: nowrap;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'} ',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_last_upd_yyyymmddhh24miss=>'20191022175109'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5499025274434427)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71603687943187948)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13044853163893313)
,p_plug_name=>'Consulta'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71602665844187947)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>9
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26831218547484808)
,p_plug_name=>'Columnas disponibles'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json           clob;',
'    v_json_object   json_object_t;',
'    v_jsonKeys      json_key_list;',
'begin',
'    htp.p(''<div class="columns"> ',
'               <ul id="columnslist">',
'                   <div class="accordion">Columnas Disponibles</div>',
'                       <div class="panel">'');',
'   ',
'    --//JSON de columnas disponibles',
unistr('    v_json := ''{"C\00F3digo del Cliente":"F_CDGO_CLNTE", '),
'                "Fecha ultimo envio":"FCHA_ENVIO", ',
'                "Usuario envio programado":"USRIO_ENVIO_PRGRMDO"}'';',
'     ',
'    v_json_object := json_object_t(v_json);',
'    v_jsonKeys := v_json_object.get_keys;',
'    ',
'    for i in 1 .. v_jsonKeys.count loop',
'        htp.p( ''<li><div ondragstart=" drag(event)" class="column h-card" data-tooltip="''||  v_jsonKeys(i) ||''" data-valor=":''||  v_json_object.get_string (v_jsonKeys (i)) ||''"   draggable="true" >'' ||v_jsonKeys(i) || ''</div></li>'') ;',
'    end loop;',
'    ',
'    htp.p(''        </div>',
'               </ul>',
'           </div>'');',
'           ',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5499255008434429)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5499025274434427)
,p_button_name=>'BTN_CREAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13048018341893345)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(13044853163893313)
,p_button_name=>'BTN_CONSTRUCTOR_SQL'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Constructor SQL'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=50000:907:&SESSION.::&DEBUG.:RP,907:P907_PAGE_ID,P907_APP_ID,P907_COD_PROCESO,P907_ITEM_DEV,P907_VALOR_DEV:&APP_PAGE_ID.,&APP_ID.,MYA,P12_ID_ENVIO_PRGRMDO,&P12_ID_ENVIO_PRGRMDO.'
,p_button_css_classes=>'buttonConstructor'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5499648856434433)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5499025274434427)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5499375972434430)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5499025274434427)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5499479688434431)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(5499025274434427)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13046988271893334)
,p_branch_name=>'Ir a la pagina 11'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11:P11_ID_ENVIO_PRGRMDO:&P12_ID_ENVIO_PRGRMDO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'BTN_GUARDAR,BTN_CREAR,BTN_ELIMINAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13044926208893314)
,p_name=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(13044853163893313)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_ENVIO_PRGRMDO_CNSLTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13045091331893315)
,p_name=>'P12_ID_ENVIO_PRGRMDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(13044853163893313)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_ENVIO_PRGRMDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13045117962893316)
,p_name=>'P12_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(13044853163893313)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13045274661893317)
,p_name=>'P12_ID_CNSLTA_MSTRO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(13044853163893313)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta Constructor SQL'
,p_source=>'ID_CNSLTA_MSTRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_CONSTRUCTOR_CONSULTAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_cnslta d, a.id_cnslta_mstro r ',
'from  cs_g_consultas_maestro a',
'inner join cs_d_procesos_sql b on a.id_prcso_sql = b.id_prcso_sql',
'where b.cdgo_clnte = :F_CDGO_CLNTE and',
'     b.cdgo_prcso_sql =''MYA'' AND',
'     a.id_cnslta_mstro_gnral is not null ',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13045385619893318)
,p_name=>'P12_CNSLTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(13044853163893313)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta'
,p_source=>'CNSLTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13045402039893319)
,p_name=>'P12_ACTVO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(13044853163893313)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13045503610893320)
,p_name=>'P12_TPO_CNSULTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(13044853163893313)
,p_item_default=>'SQL'
,p_prompt=>'Tipo de Consulta'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675717475187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'SQL'
,p_attribute_03=>'Consulta SQL'
,p_attribute_04=>'CSQL'
,p_attribute_05=>'Consulta Constructor SQL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13047169657893336)
,p_validation_name=>unistr('Valida consulta CSQ no este vaci\00F3')
,p_validation_sequence=>10
,p_validation=>'P12_ID_CNSLTA_MSTRO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# debe tener alg\00FAn valor')
,p_validation_condition=>'P12_TPO_CNSULTA'
,p_validation_condition2=>'SQL'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(13045274661893317)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13047283709893337)
,p_validation_name=>unistr('Valida SQL no este vaci\00F3')
,p_validation_sequence=>20
,p_validation=>'P12_CNSLTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# debe tener alg\00FAn valor')
,p_validation_condition=>'P12_TPO_CNSULTA'
,p_validation_condition2=>'SQL'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(13045385619893318)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13047306981893338)
,p_validation_name=>'Valida SQL'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-->Validamos la consultaa',
'declare',
'    v_sql    clob;',
'begin',
'    v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P12_CNSLTA;',
'    execute immediate v_sql ;',
'exception when others then',
'   return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');  ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P12_TPO_CNSULTA'
,p_validation_condition2=>'SQL'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(13045385619893318)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5497382409434410)
,p_name=>'Al cambiar tipo de Condicion = FNC'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_CNDCION_TPO'
,p_condition_element=>'P12_CNDCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'FNC'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5498500174434422)
,p_event_id=>wwv_flow_api.id(5497382409434410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRMTRO,P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5497496772434411)
,p_event_id=>wwv_flow_api.id(5497382409434410)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRMTRO,P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5497563058434412)
,p_event_id=>wwv_flow_api.id(5497382409434410)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_OPRDOR_TPO,P12_VLOR1,P12_VLOR2,P12_FNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5497615519434413)
,p_name=>'Al cambiar tipo de Condicion = PRM'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_CNDCION_TPO'
,p_condition_element=>'P12_CNDCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PRM'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5498688667434423)
,p_event_id=>wwv_flow_api.id(5497615519434413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRGRMDO_CNSLTA,P12_VLOR1,P12_VLOR2,P12_FNCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5497798160434414)
,p_event_id=>wwv_flow_api.id(5497615519434413)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRGRMDO_CNSLTA,P12_VLOR1,P12_VLOR2,P12_FNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5497883505434415)
,p_event_id=>wwv_flow_api.id(5497615519434413)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRMTRO,P12_ID_OPRDOR_TPO,P12_VLOR1,P12_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5497957506434416)
,p_name=>'Al cambiar tipo de Condicion = FSQ'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_CNDCION_TPO'
,p_condition_element=>'P12_CNDCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'FSQ'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5498703637434424)
,p_event_id=>wwv_flow_api.id(5497957506434416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRMTRO,P12_ID_OPRDOR_TPO,P12_VLOR1,P12_VLOR2,P12_FNCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5498074643434417)
,p_event_id=>wwv_flow_api.id(5497957506434416)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRMTRO,P12_ID_OPRDOR_TPO,P12_VLOR1,P12_VLOR2,P12_FNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5498190544434418)
,p_event_id=>wwv_flow_api.id(5497957506434416)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5498221323434419)
,p_name=>'Al cambiar tipo de Condicion = NFS'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_CNDCION_TPO'
,p_condition_element=>'P12_CNDCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'NFS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5498823133434425)
,p_event_id=>wwv_flow_api.id(5498221323434419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRMTRO,P12_ID_OPRDOR_TPO,P12_VLOR1,P12_VLOR2,P12_FNCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5498382179434420)
,p_event_id=>wwv_flow_api.id(5498221323434419)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRMTRO,P12_ID_OPRDOR_TPO,P12_VLOR1,P12_VLOR2,P12_FNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5498402551434421)
,p_event_id=>wwv_flow_api.id(5498221323434419)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5990060642474605)
,p_name=>'Al cambiar tipo de operador'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_ID_OPRDOR_TPO'
,p_condition_element=>'P12_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'11'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5990169944474606)
,p_event_id=>wwv_flow_api.id(5990060642474605)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_VLOR1,P12_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5990236706474607)
,p_event_id=>wwv_flow_api.id(5990060642474605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_VLOR1'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13045622310893321)
,p_name=>'Al cambiar Tipo de Consulta = SQL'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_TPO_CNSULTA'
,p_condition_element=>'P12_TPO_CNSULTA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SQL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13045700025893322)
,p_event_id=>wwv_flow_api.id(13045622310893321)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_CNSLTA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13045986059893324)
,p_event_id=>wwv_flow_api.id(13045622310893321)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_CNSLTA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13046032850893325)
,p_event_id=>wwv_flow_api.id(13045622310893321)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13045876549893323)
,p_event_id=>wwv_flow_api.id(13045622310893321)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13046161948893326)
,p_name=>'Al cambiar Tipo de Consulta = CSQL'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_TPO_CNSULTA'
,p_condition_element=>'P12_TPO_CNSULTA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CSQL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13046270529893327)
,p_event_id=>wwv_flow_api.id(13046161948893326)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_CNSLTA_MSTRO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13046477288893329)
,p_event_id=>wwv_flow_api.id(13046161948893326)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_CNSLTA_MSTRO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13046394068893328)
,p_event_id=>wwv_flow_api.id(13046161948893326)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_CNSLTA_MSTRO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13046582692893330)
,p_event_id=>wwv_flow_api.id(13046161948893326)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID_CNSLTA_MSTRO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13048197054893346)
,p_event_id=>wwv_flow_api.id(13046161948893326)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(13048018341893345)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13048273512893347)
,p_event_id=>wwv_flow_api.id(13046161948893326)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(13048018341893345)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13046766931893332)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperacion ID'
,p_process_sql_clob=>':P12_ID_ENVIO_PRGRMDO_CNSLTA := sq_ma_g_envios_prgrmdo_cnslta.nextval;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5499255008434429)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13046610108893331)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Procesamiento automatico de filas DML'
,p_attribute_02=>'MA_G_ENVIOS_PRGRMDO_CNSLTA'
,p_attribute_03=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_attribute_04=>'ID_ENVIO_PRGRMDO_CNSLTA'
,p_attribute_09=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_GUARDAR,BTN_CREAR,BTN_ELIMINAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Cambios registrados exitosamente!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5499750822434434)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Cuadro de Dialogo Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_CANCELAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13047098916893335)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta el tpo de consulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  case ',
'                when  id_cnslta_mstro is null then ''SQL'' ',
'                when id_cnslta_mstro is not null then ''CSQL'' ',
'            end',
'    into :P12_TPO_CNSULTA       ',
'    from ma_g_envios_prgrmdo_cnslta',
'    where id_envio_prgrmdo_cnslta = :P12_ID_ENVIO_PRGRMDO_CNSLTA;',
'exception',
'    when others then',
'        raise_application_error(-20000, ''Problemas al consultar el tipo de consulta, ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13046832599893333)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Recuperacion automatica de filas'
,p_attribute_02=>'MA_G_ENVIOS_PRGRMDO_CNSLTA'
,p_attribute_03=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_attribute_04=>'ID_ENVIO_PRGRMDO_CNSLTA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P12_ID_ENVIO_PRGRMDO_CNSLTA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
