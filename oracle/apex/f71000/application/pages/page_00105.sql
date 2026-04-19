prompt --application/pages/page_00105
begin
wwv_flow_api.create_page(
 p_id=>105
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Datos del Ajuste'
,p_step_title=>'Datos del Ajuste'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("conceptos_ajustes");',
'   var id_ajuste = $(''#P14_ID_AJSTE'').val();',
'    ',
'    if (region && !id_ajuste) {',
'        ',
'       var view = apex.region("conceptos_ajustes").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");       ',
'        ',
'       var json = records.map(function(record){           ',
'           return { "VGNCIA": model.getValue(record, "VGNCIA").trim(),',
'                    "ID_PRDO": model.getValue(record, "ID_PRDO"),',
'                    "ID_CNCPTO": model.getValue(record, "ID_CNCPTO"),',
'                    "VLOR_SLDO_CPTAL": model.getValue(record, "VLOR_SLDO_CPTAL").trim().split(''.'').join(''''),',
'                    "VLOR_AJSTE": model.getValue(record, "VLOR_AJSTE").trim().split(''.'').join('''')',
'                  };',
'       }).filter(function(f){',
'          return parseFloat(f["VLOR_AJSTE"]) > 0 ;',
'       }); ',
'       $(''#P14_JSON'').val(json.length > 0 ? JSON.stringify(json) : '''');     ',
'   } ',
'   ',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20200415142401'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79403206988385902)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99847777555636801)
,p_plug_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(267256474230075102)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'<br>',
'<i>',
'<p align="justify">Esta funcionalidad permite gestionar los procesos de ajustes .</p>',
'<p align="justify">En esta etapa se selecciona y  se ingresa datos generales sobre el ajuste a realizar.</p>',
unistr('<p align="justify">Ingresar el n\00FAmero de la solicitud del motivo del ajuste***</p>'),
unistr('<p align="justify">Escoger el Tipo de Ajuste (Cr\00E9dito - D\00E9bito). </p>'),
'<p align="justify">Escoger el Motivo del Ajuste. </p>',
'<p align="justify">Escoger la Fecha del Documento Soporte. </p>',
'<p align="justify">Escoger el Tipo de Documento soporte del Ajuste. </p>',
unistr('<p align="justify">Ingresar el n\00FAmero del Documento soporte del Ajuste. </p>'),
unistr('<p align="justify">Ingresar una observaci\00F3n del Ajuste. </p>'),
'',
unistr('<p align="justify">Hacer clic en el bot\00F3n siguiente para pasar a la siguiente etapa del proceso.</p>'),
'</i>',
'',
'<br>',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(432815953501792971)
,p_plug_name=>'<b>Datos del Ajuste</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P105_ID_AJSTE'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99847816327636802)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(99847777555636801)
,p_button_name=>'revertir'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Revertir'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-step-backward'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(102032024262782001)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(432815953501792971)
,p_button_name=>'Visor'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Acto Soporte'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>2
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(102257274689008003)
,p_branch_name=>unistr('Ir a P\00E1gina 127')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,&P105_NMRO_ACTO_DSPLAY.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(102032024262782001)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79031803349121952)
,p_name=>'P105_ID_AJSTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79032231230121952)
,p_name=>'P105_NMRO_SLCTUD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_prompt=>unistr('N\00FAmero Solicitud')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de la solicitud por la cual se va a realizar el ajuste.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79032608885121953)
,p_name=>'P105_TPO_AJSTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_prompt=>'Tipo Ajuste'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:Cr\00E9dito;CR,D\00E9bito;DB')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Seleccionar--'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Opci\00F3n para escoger el tipo de Ajuste Cr\00E9dito o D\00E9bito.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79033057067121953)
,p_name=>'P105_ID_AJSTE_MTVO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Motivo'
,p_source=>'ID_AJSTE_MTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_ajste_mtvo',
'from gf_d_ajuste_motivo ',
'where orgen = ''M'' ',
'and cdgo_clnte=:F_CDGO_CLNTE',
'',
'and tpo_ajste = :P105_TPO_AJSTE',
'',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Seleccionar--'
,p_lov_cascade_parent_items=>'P105_TPO_AJSTE'
,p_ajax_items_to_submit=>'P105_TPO_AJSTE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Raz\00F3n por el cual se realiza el Ajuste.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79033495713121953)
,p_name=>'P105_FCHA_DCMNTO_SPRTE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_prompt=>'Fecha Documento Soporte.'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79033885938121953)
,p_name=>'P105_TPO_DCMNTO_SPRTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_prompt=>'Tipo de Soporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct (a.dscrpcion),a.id_acto_tpo ',
'from   v_gn_d_actos_tipo a',
'join gn_g_actos b on a.id_acto_tpo = b.id_acto_tpo',
'where a.cdgo_clnte = :F_CDGO_CLNTE ',
'order by 1',
'--and id_prcso=6; '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Seleccionar--'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de Acto que justifica el Ajuste.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79034610874121954)
,p_name=>'P105_OBSRVCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>150
,p_cMaxlength=>255
,p_cHeight=>3
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Notas y Aclaraciones sobre al ajuste a realizar.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98811812249541601)
,p_name=>'P105_FILE_BLOB'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Adjunto'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98940627041882401)
,p_name=>'P105_CDGO_ADJNTO_TPO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_prompt=>'Tipo de Adjunto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'select dscrpcion,cdgo_adjnto_tpo from gf_d_ajustes_adjuntos_tipo'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102002361077360401)
,p_name=>'P105_NMRO_ACTO_DSPLAY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_prompt=>unistr('N\00FAmero Acto Soporte')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMRO_ACTO_DSPLAY,ID_ACTO',
'from   v_gn_g_actos',
'where cdgo_clnte = :f_cdgo_clnte and id_acto_tpo =:P105_TPO_DCMNTO_SPRTE;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Seleccionar--'
,p_lov_cascade_parent_items=>'P105_TPO_DCMNTO_SPRTE'
,p_ajax_items_to_submit=>'P105_TPO_DCMNTO_SPRTE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('N\00FAmero de Acto que justifica el Ajuste.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102357793181179502)
,p_name=>'P105_NMRO_DCMNTO_SPRTE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102357840275179503)
,p_name=>'P105_ID_AJSTE_ADJNTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_AJSTE_ADJNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103813055106151701)
,p_name=>'P105_NMRO_DCMTO_SPRTE_ADJNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(432815953501792971)
,p_prompt=>unistr('N\00FAmero Documento Adjunto Soporte')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(68102146145898701)
,p_computation_sequence=>10
,p_computation_item=>'P105_NMRO_SLCTUD'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    vlor + 1',
'FROM',
'    df_c_consecutivos',
'WHERE',
'    cdgo_clnte = :f_cdgo_clnte',
'    AND cdgo_cnsctvo = ''AJT'''))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(104264506654926501)
,p_validation_name=>'Motivo no nulo'
,p_validation_sequence=>10
,p_validation=>'P105_ID_AJSTE_MTVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Motivo.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(104271446929941901)
,p_validation_name=>'Tipo de soporte no nulo'
,p_validation_sequence=>20
,p_validation=>'P105_TPO_DCMNTO_SPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Tipo de Soporte.'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(102002684615360404)
,p_validation_name=>'Dede tener al menos un documento soporte'
,p_validation_sequence=>30
,p_validation=>'( :P105_FILE_BLOB is not null and :P105_NMRO_DCMTO_SPRTE_ADJNTO is not null) or (:P105_NMRO_ACTO_DSPLAY is not null and :P105_TPO_DCMNTO_SPRTE is not null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe tener por lo menos un documento soporte (Acto o Archivo Adjunto).'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(102553663985456501)
,p_validation_name=>'Numero de la solicitud'
,p_validation_sequence=>40
,p_validation=>':P105_NMRO_SLCTUD is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Se debe digitar el numero de la solicitud'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(104257303353878402)
,p_validation_name=>'Observacion no nula'
,p_validation_sequence=>50
,p_validation=>'P105_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe a\00F1adir una Observaci\00F3n.')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79049968075121962)
,p_name=>unistr('Guardar en sesi\00F3n el valor del sub-impuesto selccionado')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P105_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79050411567121962)
,p_event_id=>wwv_flow_api.id(79049968075121962)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P105_ID_IMPSTO_SBMPSTO'',:P105_ID_IMPSTO_SBMPSTO);',
'END;'))
,p_attribute_02=>'P105_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99847947269636803)
,p_name=>'revertir'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(99847816327636802)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99848097300636804)
,p_event_id=>wwv_flow_api.id(99847947269636803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'revertirTarea();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117962136517147103)
,p_name=>'Nuevo'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P105_NMRO_ACTO_DSPLAY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117962232455147104)
,p_event_id=>wwv_flow_api.id(117962136517147103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P105_FCHA_DCMNTO_SPRTE'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    to_char(fcha,''DD/MM/YYYY'') fcha',
'from   v_gn_g_actos',
'where cdgo_clnte = :f_cdgo_clnte ',
'',
'and ID_ACTO=:P105_NMRO_ACTO_DSPLAY;'))
,p_attribute_07=>'P105_NMRO_ACTO_DSPLAY'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99125593688863801)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GF_G_AJUSTE_ADJUNTO'
,p_attribute_02=>'GF_G_AJUSTE_ADJUNTO'
,p_attribute_03=>'P105_ID_AJSTE_ADJNTO'
,p_attribute_04=>'ID_AJSTE_ADJNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92411791760701101)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'PROCESO SUBMIT WORKFLOW'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104471824155457601)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Nuevo'
,p_attribute_01=>'RESET_USER_PREFERENCES'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
