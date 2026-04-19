prompt --application/pages/page_00122
begin
wwv_flow_api.create_page(
 p_id=>122
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Datos Causal de Desembargo'
,p_page_mode=>'MODAL'
,p_step_title=>'Datos Causal de Desembargo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function mostrar_items(){',
'   ',
'   var cdgo_causal = apex.item("P122_CDGO_CSAL").getValue();',
'   ',
'   apex.item("P122_NMRO_DCMNTO").hide();',
'   apex.item("P122_FCHA_DCMNTO").hide();',
'   apex.item("P122_NMRO_OFCIO").hide();',
'   apex.item("P122_VLOR_DCMNTO").hide();',
'   ',
'   if (cdgo_causal == "P" || cdgo_causal == "C" || cdgo_causal == "A"){',
'       apex.item("P122_NMRO_DCMNTO").show();    ',
'       apex.item("P122_FCHA_DCMNTO").show();',
'   }else{',
'       if (cdgo_causal == "T"){',
'           apex.item("P122_NMRO_DCMNTO").show();    ',
'           apex.item("P122_FCHA_DCMNTO").show();',
'           apex.item("P122_NMRO_OFCIO").show();    ',
'           apex.item("P122_VLOR_DCMNTO").show();',
'       }',
'     ',
'   }',
'   ',
'   //console.log(cdgo_causal);',
'   ',
'}'))
,p_javascript_code_onload=>'mostrar_items()'
,p_step_template=>wwv_flow_api.id(17323495682919353)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'400'
,p_protection_level=>'C'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200318170315'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55193652323960957)
,p_plug_name=>'Crear Pantalla'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'MC_G_DESEMBARGOS_SOPORTE'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55199932945960989)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17336422472919364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55212745398092101)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(55193652323960957)
,p_button_name=>'BTN_PAGOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Pagos'
,p_button_position=>'BODY'
,p_button_condition=>'P122_CDGO_CSAL'
,p_button_condition2=>'P'
,p_button_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>7
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55212870786092102)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(55193652323960957)
,p_button_name=>'BTN_CONVENIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Convenio'
,p_button_position=>'BODY'
,p_button_condition=>'P122_CDGO_CSAL'
,p_button_condition2=>'C'
,p_button_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55212955303092103)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(55193652323960957)
,p_button_name=>'BTN_AJUSTES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Ajustes'
,p_button_position=>'BODY'
,p_button_condition=>'P122_CDGO_CSAL'
,p_button_condition2=>'A'
,p_button_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55200363342960992)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(55199932945960989)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55201999571961004)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(55199932945960989)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55202339811961004)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(55199932945960989)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P122_ID_DSMBRGO_SPRTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55202714774961004)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(55199932945960989)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P122_ID_DSMBRGO_SPRTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55214353689092117)
,p_branch_action=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'SAVE,CREATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55213280141092106)
,p_branch_name=>unistr('Ir a P\00E1gina 105')
,p_branch_action=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:RP,105:P105_ID_EMBRGOS_CRTRA,P105_ID_DSMBRGO_SPRTE,P105_ID_DSMBRGOS_RSLCION:&P122_ID_EMBRGOS_CRTRA.,&P122_ID_DSMBRGO_SPRTE.,&P122_ID_DSMBRGOS_RSLCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55212745398092101)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55213353544092107)
,p_branch_name=>unistr('Ir a P\00E1gina 106')
,p_branch_action=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:RP,106:P106_ID_EMBRGOS_CRTRA,P106_ID_DSMBRGO_SPRTE,P106_ID_DSMBRGOS_RSLCION:&P122_ID_EMBRGOS_CRTRA.,&P122_ID_DSMBRGO_SPRTE.,&P122_ID_DSMBRGOS_RSLCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55212955303092103)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55213452158092108)
,p_branch_name=>unistr('Ir a P\00E1gina 107')
,p_branch_action=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP,107:P107_ID_EMBRGOS_CRTRA,P107_ID_DSMBRGO_SPRTE,P107_ID_DSMBRGOS_RSLCION:&P122_ID_EMBRGOS_CRTRA.,&P122_ID_DSMBRGO_SPRTE.,&P122_ID_DSMBRGOS_RSLCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55212870786092102)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50352379497541149)
,p_name=>'P122_CDGO_CSAL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(55193652323960957)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55194017028960961)
,p_name=>'P122_ID_DSMBRGO_SPRTE'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(55193652323960957)
,p_item_source_plug_id=>wwv_flow_api.id(55193652323960957)
,p_source=>'ID_DSMBRGO_SPRTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55194343146960972)
,p_name=>'P122_ID_DSMBRGOS_RSLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(55193652323960957)
,p_item_source_plug_id=>wwv_flow_api.id(55193652323960957)
,p_source=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55194720984960974)
,p_name=>'P122_ID_CSLES_DSMBRGO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(55193652323960957)
,p_item_source_plug_id=>wwv_flow_api.id(55193652323960957)
,p_prompt=>'Causal de Desembargo'
,p_source=>'ID_CSLES_DSMBRGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'WHERE cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55195568504960975)
,p_name=>'P122_NMRO_DCMNTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(55193652323960957)
,p_item_source_plug_id=>wwv_flow_api.id(55193652323960957)
,p_prompt=>'Numero de Documento'
,p_source=>'NMRO_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55195947466960975)
,p_name=>'P122_FCHA_DCMNTO'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(55193652323960957)
,p_item_source_plug_id=>wwv_flow_api.id(55193652323960957)
,p_prompt=>'Fecha Documento'
,p_source=>'FCHA_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55196709650960983)
,p_name=>'P122_NMRO_OFCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(55193652323960957)
,p_item_source_plug_id=>wwv_flow_api.id(55193652323960957)
,p_prompt=>'Numero de Oficio'
,p_source=>'NMRO_OFCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55197163694960983)
,p_name=>'P122_VLOR_DCMNTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(55193652323960957)
,p_item_source_plug_id=>wwv_flow_api.id(55193652323960957)
,p_prompt=>'Valor Documento'
,p_source=>'VLOR_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55213197301092105)
,p_name=>'P122_ID_EMBRGOS_CRTRA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(55193652323960957)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(50352401815541150)
,p_computation_sequence=>10
,p_computation_item=>'P122_CDGO_CSAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_csal',
'from mc_d_causales_desembargo',
'WHERE cdgo_clnte = :F_CDGO_CLNTE',
'and id_csles_dsmbrgo = :P122_ID_CSLES_DSMBRGO;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(55196453265960979)
,p_validation_name=>'P122_FCHA_DCMNTO must be timestamp'
,p_validation_sequence=>50
,p_validation=>'P122_FCHA_DCMNTO'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# debe ser un registro de hora v\00E1lido.')
,p_associated_item=>wwv_flow_api.id(55195947466960975)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(55240515270387115)
,p_validation_name=>'Validar veracidad de datos de soporte de causales'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_documento number := 0;',
'',
'begin',
'',
'    if :P122_CDGO_CSAL = ''P'' then',
'    ',
'        begin ',
'            select distinct a.NMRO_DCMNTO',
'              into v_documento',
'              from v_re_g_recaudos a',
'              join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto ',
'                                       and b.id_embrgos_crtra = :P122_ID_EMBRGOS_CRTRA',
'             where A.cdgo_clnte = :F_CDGO_CLNTE',
'               and a.NMRO_DCMNTO = :P122_NMRO_DCMNTO;',
'               ',
'        exception when others then',
'            v_documento := 0;',
'        end;',
'        ',
'        if v_documento > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    ',
'    elsif :P122_CDGO_CSAL = ''C'' then',
'        begin ',
'            select a.NMRO_CNVNIO',
'              into v_documento',
'              from v_gf_g_convenios a',
'              join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto and b.id_embrgos_crtra = :P122_ID_EMBRGOS_CRTRA',
'             where a.cdgo_cnvnio_estdo = ''APL''',
'               and A.cdgo_clnte = :F_CDGO_CLNTE',
'               and a.NMRO_CNVNIO = :P122_NMRO_DCMNTO',
'               and exists (select 1',
'                             from mc_g_embargos_cartera_detalle c',
'                             join gf_g_convenios_cartera d on D.vgncia = C.vgncia',
'                                                          and D.id_prdo = C.id_prdo',
'                                                          and D.id_cncpto = C.id_cncpto',
'                            where c.id_embrgos_crtra = b.id_embrgos_crtra);',
'               ',
'        exception when others then',
'            v_documento := 0;',
'        end;',
'        ',
'        if v_documento > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    elsif :P122_CDGO_CSAL = ''A'' then',
'        begin ',
'            ',
'            select distinct a.numro_ajste',
'              into v_documento',
'              from v_gf_g_ajustes a',
'              join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto ',
'                                       and b.id_embrgos_crtra = :P122_ID_EMBRGOS_CRTRA',
'             where A.cdgo_clnte = :F_CDGO_CLNTE',
'               and a.numro_ajste = :P122_NMRO_DCMNTO;',
'                            ',
'        exception when others then',
'            v_documento := 0;',
'        end;',
'        ',
'        if v_documento > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El numero de documento de soporte de la causal no concuerda con uno asociado a la cartera del embargo.'
,p_validation_condition=>'SAVE,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(55240844111388026)
,p_validation_name=>unistr('Validar que los datos de soporte est\00E9n llenos')
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    if :P122_CDGO_CSAL in (''P'',''C'',''A'')then',
'    ',
'        if (:P122_NMRO_DCMNTO is null or :P122_FCHA_DCMNTO is null) then',
'            return ''Debe ingresar los datos de numero y fecha de documento.'';',
'        else',
'            return null;',
'        end if;',
'    ',
'    elsif :P122_CDGO_CSAL = ''T'' then',
'        if (:P122_NMRO_DCMNTO is null or :P122_FCHA_DCMNTO is null or :P122_NMRO_OFCIO is null or :P122_VLOR_DCMNTO is null) then',
'            return ''Debe ingresar los datos de numero y fecha de documento, numero de oficio y valor del documento.'';',
'        else',
'            return null;',
'        end if;',
'    else',
'        return null;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'SAVE,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55200418243960992)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(55200363342960992)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55201224044961002)
,p_event_id=>wwv_flow_api.id(55200418243960992)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55203557996961006)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(55193652323960957)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Procesar pantalla Crear Pantalla'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55203946720961007)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Cerrar Recuadro de Di\00E1logo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55203126134961005)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(55193652323960957)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Crear Pantalla'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
