prompt --application/pages/page_00029
begin
wwv_flow_api.create_page(
 p_id=>29
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Imprimir Rango de Liquidacion Factura'
,p_page_mode=>'MODAL'
,p_step_title=>'Rango de Actos Determinaciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1000',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("imp_liq_ran");',
'   var id_ajuste = $(''#P29_ID_DTRMNCION_LTE'').val();',
'    ',
'    if (region && !id_ajuste) {',
'        ',
'       var view = apex.region("imp_liq_ran").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");       ',
'        ',
'       var json = records.map(function(record){           ',
'           return { "P29_RANGO_INICIO": model.getValue(record, "P29_RANGO_INICIO").trim(),',
'                    "P29_RANGO_FIN": model.getValue(record, "P29_RANGO_FIN")',
'                  };',
'       }).filter(function(f){',
'          return parseFloat(f["VLOR_AJSTE"]) > 0 ;',
'       }); ',
'       $(''#P29_JSON'').val(json.length > 0 ? JSON.stringify(json) : '''');     ',
'   } ',
'   ',
'}',
'',
'const convertBase64ToFile = (base64String, fileName) => {',
'     let arr = base64String.split('','');',
'     let mime = arr[0].match(/:(.*?);/)[1];',
'     let bstr = atob(arr[1]);',
'     let n = bstr.length;',
'     let uint8Array = new Uint8Array(n);',
'     while (n--) {',
'        uint8Array[n] = bstr.charCodeAt(n);',
'     }',
'     let file = new File([uint8Array], fileName, { type: mime });',
'     return file;',
'}',
'',
'const readFileAsync = (file) => {',
'  return new Promise((resolve, reject) => {',
'    let reader = new FileReader();',
'    reader.onload = () => {',
'      resolve(reader.result);',
'    };',
'    reader.onerror = reject;',
'    reader.readAsArrayBuffer(file);',
'  })',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'70%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20241209154045'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108937240706122505)
,p_plug_name=>'Rango Impresion'
,p_region_name=>'imp_liq_ran'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id, ',
'       c001 rango_inicio, ',
'       c002 rango_fin',
'  from apex_collections ',
'  where collection_name = ''RANGO_IMPRESION'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108937590036122508)
,p_name=>'P29_RANGO_INICIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RANGO_INICIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_AUTO_COMPLETE'
,p_heading=>'Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
,p_item_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'')"'
,p_is_required=>true
,p_max_length=>4000
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct case when :P63_GNRCION_TPO = ''DCM'' then',
'                  to_char(b.nmro_dcmnto) ',
'                else c.nmro_acto',
'                end as nmro',
'  from gi_g_determinaciones    a',
'  join gi_g_determinaciones_dcmnto  e on a.id_dtrmncion = e.id_dtrmncion',
'  left join re_g_documentos         b on e.id_dcmnto = b.id_dcmnto',
'  left join gn_g_actos              c on a.id_acto   = c.id_acto',
' where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE',
'order by 1;'))
,p_lov_display_extra=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108937653413122509)
,p_name=>'P29_RANGO_FIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RANGO_FIN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_AUTO_COMPLETE'
,p_heading=>'Fin'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
,p_item_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'')"'
,p_is_required=>true
,p_max_length=>4000
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct case when :P63_GNRCION_TPO = ''DCM'' then',
'                  to_char(b.nmro_dcmnto) ',
'                else c.nmro_acto',
'                end as nmro',
'  from gi_g_determinaciones    a',
'  join gi_g_determinaciones_dcmnto  e on a.id_dtrmncion = e.id_dtrmncion',
'  left join re_g_documentos         b on e.id_dcmnto = b.id_dcmnto',
'  left join gn_g_actos              c on a.id_acto   = c.id_acto',
' where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE',
'order by 1;'))
,p_lov_display_extra=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108937703620122510)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108937893116122511)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108938518645122518)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(108937322998122506)
,p_internal_uid=>108937322998122506
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(108993660332125117)
,p_interactive_grid_id=>wwv_flow_api.id(108937322998122506)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(108993736815125117)
,p_report_id=>wwv_flow_api.id(108993660332125117)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108994763421125124)
,p_view_id=>wwv_flow_api.id(108993736815125117)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(108937590036122508)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>288
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108995228982125126)
,p_view_id=>wwv_flow_api.id(108993736815125117)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(108937653413122509)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>378
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108999360659146815)
,p_view_id=>wwv_flow_api.id(108993736815125117)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(108937703620122510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109111584430669213)
,p_view_id=>wwv_flow_api.id(108993736815125117)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(108938518645122518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109401252148436409)
,p_plug_name=>'Opciones'
,p_parent_plug_id=>wwv_flow_api.id(108937240706122505)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35823103696304520)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(109401252148436409)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109401126038436408)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(109401252148436409)
,p_button_name=>'BTN_IMPRIMIR_CONSOLIDADO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir Consolidado'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109400425655436401)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(109401252148436409)
,p_button_name=>'BTN_IMPRIMIR_LIQUIDACION_FACTURA_ZIP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Generar Zip'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-address-book'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(109400923818436406)
,p_branch_name=>'Imprimir Liquidacion Factura Zip'
,p_branch_action=>'javascript:imprimirRprtesMltples(''&P29_XML.'',''masivoZip'');'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(109400425655436401)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(109401347289436410)
,p_branch_name=>'Imprimir Liquidacion Factura'
,p_branch_action=>'javascript:imprimirRprtesMltples(''&P29_XML.'');'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(109401126038436408)
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35823210107304521)
,p_branch_name=>'Regresar 106 - Actos'
,p_branch_action=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35823103696304520)
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P63_GNRCION_TPO'
,p_branch_condition_text=>'ACT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35823543570304524)
,p_branch_name=>'Regresar 104 - Documentos'
,p_branch_action=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35823103696304520)
,p_branch_sequence=>40
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P63_GNRCION_TPO'
,p_branch_condition_text=>'DCM'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35823377774304522)
,p_name=>'P29_BRANCH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108938094515122513)
,p_name=>'P29_MAX'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108938200674122515)
,p_name=>'P29_ID_DTRMNCION_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108938633229122519)
,p_name=>'P29_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108939182707122524)
,p_name=>'P29_REFRESCAR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109400711820436404)
,p_name=>'P29_ID_RPRTE_PRMTRO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110737775549199707)
,p_name=>'P29_XML'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112226787303601412)
,p_name=>'P29_NUM_INI_LOT_DET'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112226862443601413)
,p_name=>'P29_NUM_FIN_LOT_DET'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112227146200601416)
,p_name=>'P29_LOTE_RANGO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(108937240706122505)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(108938146123122514)
,p_computation_sequence=>10
,p_computation_item=>'P29_MAX'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select count(id_dtrmncion_lte) numero_registros',
' from gi_g_determinaciones',
' where id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(36597405886971601)
,p_tabular_form_region_id=>wwv_flow_api.id(108937240706122505)
,p_validation_name=>unistr('N\00B0 Documento Inicio dentro el rango de documentos la determinaci\00F3n')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro    number := 0;',
'begin',
'    if :P63_GNRCION_TPO = ''DCM'' then',
'        begin ',
'            select distinct b.nmro_dcmnto',
'              into v_nmro',
'              from gi_g_determinaciones    a',
'              join gi_g_determinaciones_dcmnto    e on a.id_dtrmncion = e.id_dtrmncion',
'              join re_g_documentos                b on e.id_dcmnto = b.id_dcmnto',
'             where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE',
'               and b.nmro_dcmnto      = :P29_RANGO_INICIO;',
'        exception',
'            when others then ',
'                v_nmro := 0;',
'        end;',
'    else ',
'        begin ',
'            select distinct b.nmro_acto',
'              into v_nmro',
'              from gi_g_determinaciones    a',
'              join gn_g_actos         b on a.id_acto = b.id_acto',
'             where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE',
'               and b.nmro_acto      = :P29_RANGO_INICIO;',
'        exception',
'            when others then ',
'                v_nmro := 0;',
'        end;',
'    end if;',
'    if v_nmro is not null and v_nmro > 0 then',
'        return true;',
'    else',
'        return false;',
'    end if;    ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('El n\00FAmero de documento ingresado en la columna "Inicio" no se encuentra dentro de los documentos generados para este lote. Recuerde que los documentos generados para el lote de determinaci\00F3n N\00B0 &P29_ID_DTRMNCION_LTE. comprenden desde <b>&P29_NUM_INI_')
||'LOT_DET.</b> hasta <b>&P29_NUM_FIN_LOT_DET.</b>'
,p_associated_column=>'P29_RANGO_INICIO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(36597594829971602)
,p_tabular_form_region_id=>wwv_flow_api.id(108937240706122505)
,p_validation_name=>unistr('N\00B0 Documento Fin dentro el rango de documentos la determinaci\00F3n')
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro    number := 0;',
'begin',
'    if :P63_GNRCION_TPO = ''DCM'' then',
'        begin ',
'            select distinct b.nmro_dcmnto',
'              into v_nmro',
'              from gi_g_determinaciones           a',
'              join gi_g_determinaciones_dcmnto    e on a.id_dtrmncion = e.id_dtrmncion',
'              join re_g_documentos                b on e.id_dcmnto = b.id_dcmnto',
'             where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE',
'               and b.nmro_dcmnto      = :P29_RANGO_FIN;',
'        exception',
'            when others then ',
'                v_nmro := 0;',
'        end;',
'    else ',
'        begin ',
'            select distinct b.nmro_acto',
'              into v_nmro',
'              from gi_g_determinaciones    a',
'              join gn_g_actos         b on a.id_acto = b.id_acto',
'             where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE',
'               and b.nmro_acto      = :P29_RANGO_FIN;',
'        exception',
'            when others then ',
'                v_nmro := 0;',
'        end;',
'    end if;',
'    if v_nmro is not null and v_nmro > 0 then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('El n\00FAmero de documento ingresado en la columna "Fin" no se encuentra dentro de los documentos generados para este lote. Recuerde que los documentos generados para el lote de determinaci\00F3n N\00B0 &P29_ID_DTRMNCION_LTE. comprenden desde <b>&P29_NUM_INI_LOT')
||'_DET.</b> hasta <b>&P29_NUM_FIN_LOT_DET.</b>'
,p_associated_column=>'P29_RANGO_FIN'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(36597678185971603)
,p_tabular_form_region_id=>wwv_flow_api.id(108937240706122505)
,p_validation_name=>unistr('N\00B0 Documento Inicio / Fin no esten dentro de otro rango ya ingresado')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_rngos in (select seq_id, ',
'                           c001 rango_inicio, ',
'                           c002 rango_fin',
'                      from apex_collections',
'                     where collection_name = ''RANGO_IMPRESION'' ',
'                       and (seq_id != :SEQ_ID or :SEQ_ID is null)) loop ',
'        if :P29_RANGO_INICIO between c_rngos.rango_inicio and c_rngos.rango_fin then',
unistr('            return ''El n\00FAmero de documento ingresado en la columna "Inicio" ya lo contiene otro rango ingresado'';'),
'        end if;',
'        if :P29_RANGO_FIN between c_rngos.rango_inicio and c_rngos.rango_fin  then ',
unistr('            return ''El n\00FAmero de documento ingresado en la columna "Fin" ya lo contiene otro rango ingresado'';'),
'        end if;',
'    end loop;',
'    return null;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(36597740085971604)
,p_tabular_form_region_id=>wwv_flow_api.id(108937240706122505)
,p_validation_name=>unistr('N\00B0 Documento Fin no puede ser menor que N\00B0 Docuemento Incio')
,p_validation_sequence=>50
,p_validation=>':P29_RANGO_FIN >= :P29_RANGO_INICIO'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('El N\00B0 Documento Final ingresado debe ser mayor que el N\00B0 ddocumento Inicio')
,p_associated_column=>'P29_RANGO_FIN'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35824411807304533)
,p_validation_name=>'Ingresar Rangos '
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_count number;',
'begin',
'select count(*) into v_count',
'  from apex_collections',
' where collection_name = ''RANGO_IMPRESION'';',
' ',
' if v_count > 0 then ',
'     return true;',
' else ',
'     return false;',
' end if; ',
' ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Se deben guardar los rangos de impresi\00F3n.')
,p_validation_condition=>'BTN_IMPRIMIR_LIQUIDACION_FACTURA,BTN_IMPRIMIR_LIQUIDACION_FACTURA_ZIP'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108939372414122526)
,p_name=>'Cuando Guargar Cuadricula'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108937240706122505)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108939415929122527)
,p_event_id=>wwv_flow_api.id(108939372414122526)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(112225878911601403)
,p_name=>'Activar Botones'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P29_REPORTE'
,p_condition_element=>'P29_REPORTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112225907895601404)
,p_event_id=>wwv_flow_api.id(112225878911601403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(109401126038436408)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112226102319601406)
,p_event_id=>wwv_flow_api.id(112225878911601403)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(109401126038436408)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112226014058601405)
,p_event_id=>wwv_flow_api.id(112225878911601403)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(109400425655436401)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112226296492601407)
,p_event_id=>wwv_flow_api.id(112225878911601403)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(109400425655436401)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(161129431238342333)
,p_name=>'Genera_Archivo'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(109400425655436401)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(161129508659342334)
,p_event_id=>wwv_flow_api.id(161129431238342333)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Generar_Archivo() {',
' ',
'        console.log("PUNTO SSS");',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
'        ',
'        console.log("PUNTO EEE");',
'    ',
'    var rs = await apex.server.process(''Descargar_Archivo'',{',
'        pageItems: "P29_ID_DTRMNCION_LTE"',
'			      }); ',
'    ',
'    ',
'        console.log("PUNTO MMM");',
'    ',
'    //var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:PRINT_REPORT=re_c_recibo_pago_rentas:NO:RP:::`;',
'    var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento:NO:RP:::`;       ',
'    if (rs.type == ''OK'') {',
'        ',
'        console.log("PUNTO1");',
'        ',
'        let $waitPopup = apex.widget.waitPopup(); ',
'        //apex.message.showPageSuccess(rs.msg);',
'        ',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        ',
'        console.log("PUNTO3");',
'        ',
'        let v_blob = await fecth_async(url);',
'',
'        console.log("PUNTO6");',
'        ',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = rs.nmbre_rprte + ".zip";',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);  ',
'        //window.location.href = `f?p=${v_app_id}:${106}:${v_session}::NO::::`;    ',
'        $waitPopup.remove();',
'',
'    }',
'    else {',
'        // First clear the errors',
'        apex.message.clearErrors();',
'',
'        // Now show new errors',
'        apex.message.showErrors([',
'            {',
'                type:       "error",',
'                location:   [ "page"],',
'                message:    rs.msg,',
'                unsafe:     false',
'            }',
'        ]);',
'    }  ',
'}',
' ',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de generar el archivo .Zip?", function( okPressed ) {'),
'    if( okPressed ) {',
'       apex.item(''BTN_GENERAR_ZIP'').disable();',
'       Generar_Archivo(); ',
'    }',
'});',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30028718243441603)
,p_name=>'Genera_Archivo_Consolidado'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(109401126038436408)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30028867322441604)
,p_event_id=>wwv_flow_api.id(30028718243441603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function merge() {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'',
'  try {',
'    // Realizar la solicitud al servidor una vez',
unistr('    console.log(''Antes de realizar la petici\00F3n al back'');'),
'    const { data } = await apex.server.process(''prc_co_documentos'', {',
'      pageItems: "P29_ID_DTRMNCION_LTE"',
'    });',
'    console.log(`# de datos => ${data.length}`);',
'',
'    let PDFDocument = PDFLib.PDFDocument;',
'    const mergedPdf = await PDFDocument.create();',
'',
'    console.log(''Combinando archivos'');',
'    // Procesar cada documento',
'    for (let j = 0; j < data.length; j++) {',
'      const tem = await convertBase64ToFile(`data:application/pdf;base64,${data[j].fileBlob}`, data[j].fileName);',
'      const document = await readFileAsync(tem);',
'      const document2 = await PDFDocument.load(document);',
'      let copiedPages = await mergedPdf.copyPages(document2, document2.getPageIndices());',
'      copiedPages.forEach((page) => mergedPdf.addPage(page));',
'    }',
'',
'    // Guardar el PDF combinado',
'    const mergedPdfFile = await mergedPdf.save();',
'',
'    console.log(''Descargando el archivo PDF combinado'');',
'    // Descargar el archivo PDF',
'    download2(mergedPdfFile, `Determinaciones.pdf`, ''application/pdf'');',
'',
'  } catch (error) {',
unistr('    console.error(''Error durante el proceso de fusi\00F3n de PDF:'', error);'),
unistr('    alert(''Ocurri\00F3 un error durante la fusi\00F3n de los documentos.'');'),
'  }',
'',
'  console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  popup.remove();',
'}',
'',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de generar el archivo .Zip?", function( okPressed ) {'),
'    if( okPressed ) {',
'       merge(); ',
'    }',
'});',
'',
'const download2 = async (file, filename, type) => {',
'  const link = document.createElement(''a'');',
'  link.download = filename;',
'  let binaryData = [];',
'  binaryData.push(file);',
'  link.href = await URL.createObjectURL(new File(binaryData, { type: ''application/pdf'' }))',
'  link.download = filename;',
'  link.click();',
'}',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108937958759122512)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(108937240706122505)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Rango Impresion: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin  ',
'     case :APEX$ROW_STATUS',
'     when ''C'' then',
'             ',
'             apex_collection.add_member( p_collection_name => ''RANGO_IMPRESION'',',
'                                         p_c001            => :P29_RANGO_INICIO,',
'                                         p_c002            => :P29_RANGO_FIN);',
'     when ''U'' then        ',
'           ',
'            APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => ''RANGO_IMPRESION'',',
'                                           p_seq            => :SEQ_ID,',
'                                           p_c001           => :P29_RANGO_INICIO,',
'                                           p_c002           => :P29_RANGO_FIN);',
'       ',
'    when ''D'' then  ',
'            APEX_COLLECTION.DELETE_MEMBER( p_collection_name => ''RANGO_IMPRESION'',',
'                                           p_seq             => :SEQ_ID);',
'          ',
'          ',
'      end case;',
'      :P29_REFRESCAR:=''S'';',
'',
'end;',
'                                        ',
'                                      ',
'                                      ',
'                                   '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8653537999223421)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Genera ZIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_app_id        number                     := v(''APP_ID'');',
'    v_app_page_id   number                     := v(''APP_PAGE_ID'');',
'    v_cdgo_clnte df_s_clientes.cdgo_clnte%type := :F_CDGO_CLNTE;',
'    v_gn_d_reportes gn_d_reportes%rowtype;',
'    v_app_id_dstno  number := 66000;',
'    v_zip_file      blob;',
'begin',
'   ',
'    --Busca los Datos del Reporte',
'    begin',
'        select /*+ RESULT_CACHE */ a.*',
'        into v_gn_d_reportes',
'        from gn_d_reportes a',
'        where   id_rprte = :P104_ID_RPRTE ;',
'                        ',
'    exception',
'        when no_data_found then',
'             return;',
'    end;',
'    ',
'    apex_session.attach( p_app_id     => v_app_id_dstno',
'                       , p_page_id    => 37',
'                       , p_session_id => v(''APP_SESSION''));',
'    ',
'    apex_util.set_session_state( ''F_CDGO_CLNTE'' , v_cdgo_clnte );',
'	for c_rango_impresion in ( select seq_id num_rango',
'									, c001 rango_inicio',
'									, c002 rango_fin',
'							   from apex_collections ',
'							   where collection_name = ''RANGO_IMPRESION'') ',
'	loop',
'		begin',
'			for c_dcmntos_lte in (     select d.file_blob, d.nmro_acto, a.id_dtrmncion_lte, a.id_dtrmncion',
'									   from gi_g_determinaciones                a',
'									   left join gi_g_determinaciones_dcmnto    e on a.id_dtrmncion = e.id_dtrmncion',
'									   left join re_g_documentos                b on e.id_dcmnto = b.id_dcmnto',
'									   join v_gn_g_actos                        d on a.id_acto      = d.id_acto',
'									  where a.id_dtrmncion_lte    =  :P29_ID_DTRMNCION_LTE',
'										and ( (:P63_GNRCION_TPO = ''DCM'' and b.nmro_dcmnto between c_rango_impresion.rango_inicio ',
'																							  and c_rango_impresion.rango_fin)',
'											  or ',
'											  (:P63_GNRCION_TPO = ''ACT'' and d.nmro_acto between c_rango_impresion.rango_inicio ',
'																							and c_rango_impresion.rango_fin)',
'											)								  ',
'								) ',
'			loop',
'				declare',
'					v_blob blob;',
'				begin			',
'					apex_util.set_session_state(''P37_JSON'', ''{"id_dtrmncion_lte":''||c_dcmntos_lte.id_dtrmncion_lte||'', "id_dtrmncion":''||c_dcmntos_lte.id_dtrmncion||''}''); ',
'					--insert into muerto (v_001) values (''"id_dtrmncion_lte":''||c_dcmntos_lte.id_dtrmncion_lte||'', "id_dtrmncion":''||c_dcmntos_lte.id_dtrmncion );commit;',
'					v_blob := apex_util.get_print_document( p_application_id     => v_app_id_dstno',
'														  , p_report_query_name  => v_gn_d_reportes.nmbre_cnslta',
'														  , p_report_layout_name => v_gn_d_reportes.nmbre_plntlla',
'														  , p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla',
'														  , p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'					',
'					apex_zip.add_file ( p_zipped_blob => v_zip_file',
'									  , p_file_name   => c_dcmntos_lte.nmro_acto || ''.'' || lower( v_gn_d_reportes.cdgo_frmto_tpo ) ',
'									  , p_content     => v_blob );',
'				end;                ',
'',
'			end loop;',
'			',
'			apex_zip.finish( p_zipped_blob => v_zip_file );',
'			',
'			owa_util.mime_header(''application/zip'', false); ',
'			htp.p(''Content-length: ''|| dbms_lob.getlength(v_zip_file));',
unistr('			htp.p(''Content-Disposition: attachment; filename="'' || ''Lote N\00B0'' || :P63_ID_DTRMNCION_LTE || ''.zip"'');'),
'			owa_util.http_header_close;',
'			wpg_docload.download_file(v_zip_file);',
'',
'			apex_session.attach( p_app_id     => v_app_id',
'							   , p_page_id    => v_app_page_id',
'							   , p_session_id => v(''APP_SESSION''));',
'        end;                                                      ',
'    end loop; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109400594115436402)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Construir XML para generar el ZIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dta                clob;',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(10000);',
'    v_xml                varchar2(4000);',
'    v_id_rprte_prmtro    number;    ',
'    v_id_rprte           number; ',
'begin',
'    --:P29_ID_RPRTE_PRMTRO  := pkg_gn_generalidades.fnc_ge_id_rprte_prmtro();',
'    v_mnsje_rspsta := ''Entro a Construir xml para generar el zip. 3_GNRCION_TPO: '' || :P63_GNRCION_TPO;',
'    pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6);  ',
'            ',
'    if(:P63_GNRCION_TPO = ''ACT'') then',
'        v_id_rprte := 515;',
'    elsif :P63_GNRCION_TPO = ''DCM'' then',
'        v_id_rprte := :P104_ID_RPRTE;',
'     end if;',
'     ',
'    v_mnsje_rspsta := ''ID reporte : '' || v_id_rprte;',
'    pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); ',
'    ',
'    for c_rango_impresion in ( select seq_id num_rango',
'                                    , c001 rango_inicio',
'                                    , c002 rango_fin',
'								 from apex_collections ',
'								 where collection_name = ''RANGO_IMPRESION'') loop',
'        begin',
'            v_id_rprte_prmtro := pkg_gn_generalidades.fnc_ge_id_rprte_prmtro();',
'            v_mnsje_rspsta := ''v_id_rprte_prmtro : '' || v_id_rprte_prmtro ||   ''v_id_rprte_prmtro : '' || :P29_ID_DTRMNCION_LTE ;',
'            pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); ',
'            for c_determinacion in ( select distinct a.id_dtrmncion ',
'                                          , case :P63_GNRCION_TPO',
'                                                when ''ACT'' then c.nmro_acto ',
'                                                when ''DCM'' then to_char(b.nmro_dcmnto)',
'                                           end as nmro',
'									   from gi_g_determinaciones   a',
'                                       left join gi_g_determinaciones_dcmnto    e on a.id_dtrmncion = e.id_dtrmncion',
'                                       left join re_g_documentos                b on e.id_dcmnto = b.id_dcmnto',
'                                       left join gn_g_actos        c on a.id_acto = c.id_acto',
'                                      where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE',
'                                        and ( (:P63_GNRCION_TPO = ''DCM'' and b.nmro_dcmnto between c_rango_impresion.rango_inicio ',
'                                                                                              and c_rango_impresion.rango_fin)',
'                                              or ',
'                                              (:P63_GNRCION_TPO = ''ACT'' and c.nmro_acto between c_rango_impresion.rango_inicio ',
'                                                                                            and c_rango_impresion.rango_fin)',
'                                            )',
'                                   ) loop',
'                v_dta  := ''<P_ID_DTRMNCION_LTE>'' || :P29_ID_DTRMNCION_LTE        || ''</P_ID_DTRMNCION_LTE>''|| ',
'				          ''<P_ID_DTRMNCION>''     || c_determinacion.id_dtrmncion || ''</P_ID_DTRMNCION>''    ||   ',
'                          ''<P_GNRCION_TPO>''      || :P63_GNRCION_TPO             || ''</P_GNRCION_TPO>''     ||   ',
'						  ''<nmbre_rprte> ''       || c_determinacion.nmro         || ''</nmbre_rprte>'';',
'                ',
'                pkg_gn_generalidades.prc_rg_t_reportes_parametro( v_id_rprte_prmtro',
'				                                                , v_dta',
'                                                                , v_cdgo_rspsta',
'                                                                , v_mnsje_rspsta );	',
'            v_mnsje_rspsta := '':P63_GNRCION_TPO : '' || :P63_GNRCION_TPO ||',
'                               '' v_id_rprte_prmtro: '' || v_id_rprte_prmtro || ',
'                               '' v_cdgo_rspsta: '' || v_cdgo_rspsta ||',
'                               '' v_mnsje_rspsta: '' || v_mnsje_rspsta;',
'                               ',
'            pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); ',
'            ',
'            v_mnsje_rspsta :=  '' v_dta: '' || v_dta ;                               ',
'            pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); ',
'            end loop;',
'                                 ',
'             :P29_XML := :P29_XML || ''<data><id_rprte>''|| v_id_rprte || ''</id_rprte><nmbre_rprte> Rango-'' ||c_rango_impresion.num_rango ||'' No Determinacion Inicial- ''',
'                                 || c_rango_impresion.rango_inicio ||''-No Determinacion Final -''||c_rango_impresion.rango_fin || ''</nmbre_rprte><id_rprte_prmtro>'' || v_id_rprte_prmtro ||''</id_rprte_prmtro></data>'';                      ',
'                 ',
'        end;                                                      ',
'    end loop; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111330351087712204)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Construir XML'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dta                clob;',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(100);',
'    v_xml                varchar2(4000);',
'    v_id_rprte_prmtro    number;',
'    v_id_rprte           number;',
'begin',
'    --:P29_ID_RPRTE_PRMTRO  := pkg_gn_generalidades.fnc_ge_id_rprte_prmtro();',
'    if(:P63_GNRCION_TPO = ''ACT'') then',
'        v_id_rprte := 515;',
'    elsif :P63_GNRCION_TPO = ''DCM'' then',
'        v_id_rprte := :P104_ID_RPRTE;',
'     end if;    ',
'    for c_rango_impresion in ( select seq_id num_rango',
'                                    , c001 rango_inicio',
'                                    , c002 rango_fin',
'								 from apex_collections ',
'								 where collection_name = ''RANGO_IMPRESION''                       ',
'                             )',
'    loop',
'        begin',
'            --v_id_rprte_prmtro := pkg_gn_generalidades.fnc_ge_id_rprte_prmtro();',
'                        ',
'            v_dta  := ''<xml><P_ID_DTRMNCION_LTE>'' || :P29_ID_DTRMNCION_LTE             || ''</P_ID_DTRMNCION_LTE>''|| ',
'                          ''<P_RANGO_INICIO>''      || c_rango_impresion.rango_inicio    || ''</P_RANGO_INICIO>''    || ',
'                          ''<P_GNRCION_TPO>''       || :P63_GNRCION_TPO                  || ''</P_GNRCION_TPO>''     || ',
'						  ''<P_RANGO_FIN>''         || c_rango_impresion.rango_fin	   || ''</P_RANGO_FIN></xml>'';',
'             ',
'           ',
'            :P29_XML := :P29_XML || ''<data><id_rprte>''|| v_id_rprte || ''</id_rprte><nmbre_rprte> Rango-'' ||c_rango_impresion.num_rango ||'' No Determinacion Inicial- ''',
'                                 || c_rango_impresion.rango_inicio  ||''-No Determinacion Final -''        ||c_rango_impresion.rango_fin || ''</nmbre_rprte>''|| v_dta || ''</data>'';',
'        end;                                                      ',
'    end loop; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8653239554223418)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtiene JSON rangos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json            json_object_t;',
'    --v_json            json_object_t := json_object_t();',
'    --v_json_envia      clob;',
'    v_id_rprte        number;    ',
'begin',
'   ',
'    if(:P63_GNRCION_TPO = ''ACT'') then',
'        --v_id_rprte := 616;',
'        select  a.id_rprte ',
'        into    v_id_rprte',
'        from    gn_d_reportes   a',
'        join    gn_d_plantillas b on a.id_rprte = b.id_rprte',
'        where   b.id_plntlla  = :P106_ID_PLNTLLA;',
'    elsif :P63_GNRCION_TPO = ''DCM'' then',
'        v_id_rprte := :P104_ID_RPRTE;',
'    end if; ',
'     ',
'    for c_rango_impresion in ( select seq_id num_rango',
'                                    , c001 rango_inicio',
'                                    , c002 rango_fin',
'								 from apex_collections ',
'								 where collection_name = ''RANGO_IMPRESION''                       ',
'                             )',
'    loop',
'        begin',
'           v_json      := json_object_t();',
'           v_json.put(''id_dtrmncion_lte'',:P63_ID_DTRMNCION_LTE); ',
'           v_json.put(''rango_inicio'',c_rango_impresion.rango_inicio); ',
'           v_json.put(''rango_fin'',c_rango_impresion.rango_fin);  ',
'           v_json.put(''gnrcion_tpo'',:P63_GNRCION_TPO);  ',
'           ',
'           apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );',
'           apex_util.set_session_state(''P37_JSON'', v_json.to_clob());',
'           apex_util.set_session_state(''P37_ID_RPRTE'', v_id_rprte);',
'        end;                                                      ',
'    end loop; ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(109401126038436408)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108937186092122504)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Creacion coleccion Rango'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if not apex_collection.collection_exists(''RANGO_IMPRESION'') then',
'        apex_Collection.Create_Collection( p_collection_name => ''RANGO_IMPRESION'');',
'    ',
'    end if;    ',
'end; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112226995919601414)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Nuevo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    if(:P63_GNRCION_TPO = ''ACT'') then',
'        select max(b.nmro_acto), min(b.nmro_acto)',
'        into :P29_NUM_FIN_LOT_DET,:P29_NUM_INI_LOT_DET',
'        from gi_g_determinaciones a',
'        join gn_g_actos    b on a.id_acto = b.id_acto',
'        where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE;',
unistr('        :P29_LOTE_RANGO := ''Lote Determinaci\00F3n No. ''||:P29_ID_DTRMNCION_LTE ||'' Rango de Actos desde ''|| :P29_NUM_INI_LOT_DET||'' al '' ||:P29_NUM_FIN_LOT_DET;        '),
'    elsif :P63_GNRCION_TPO = ''DCM'' then',
'        select max(b.nmro_dcmnto), min(b.nmro_dcmnto)',
'        into :P29_NUM_FIN_LOT_DET,:P29_NUM_INI_LOT_DET',
'        from gi_g_determinaciones a',
'        join gi_g_determinaciones_dcmnto    e on a.id_dtrmncion = e.id_dtrmncion',
'        join re_g_documentos                b on e.id_dcmnto = b.id_dcmnto',
'        where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE;',
unistr('        :P29_LOTE_RANGO := ''Lote Determinaci\00F3n No. ''||:P29_ID_DTRMNCION_LTE ||'' Rango de Documentos desde ''||:P29_NUM_INI_LOT_DET||'' al ''|| :P29_NUM_FIN_LOT_DET;'),
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30028944900441605)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_clob         CLOB;',
'  v_archvo_blob  blob;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(1000);',
'  v_rango_inicio varchar2(20);',
'  v_rango_fin    varchar2(20);',
'begin',
'  -- Iniciar el array JSON si es necesario',
'  apex_json.open_object;',
'  apex_json.open_array(''data'');',
'',
'  select c001 rango_inicio, c002 rango_fin',
'    into v_rango_inicio, v_rango_fin',
'    from apex_collections',
'   where collection_name = ''RANGO_IMPRESION'';',
'',
'  -- Recorrer directamente los id_acto de la consulta',
'  for c_acto in (select a.id_acto',
'                   from gi_g_determinaciones a',
'                   join gn_g_actos b',
'                     on a.id_acto = b.id_acto',
'                  where a.id_dtrmncion_lte = :P29_ID_DTRMNCION_LTE',
'                    and b.nmro_acto between v_rango_inicio and v_rango_fin',
'                  order by b.nmro_acto) loop',
'  ',
'    -- Ahora se puede hacer el procesamiento para cada id_acto',
'    for c_document in (select b.file_blob,',
'                              b.file_name,',
'                              b.file_bfile,',
'                              a.nmro_acto',
'                         from gn_g_actos a',
'                         join gd_g_documentos b',
'                           on a.id_dcmnto = b.id_dcmnto',
'                        where a.id_acto = c_acto.id_acto',
'                        order by a.nmro_acto asc) loop',
'    ',
'      -- Si el archivo es nulo, buscar el BFILE',
'      if c_document.file_blob is null then',
'        pkg_gd_utilidades.prc_co_archco_dsco(p_bfile        => c_document.file_bfile,',
'                                             o_archvo_blob  => v_archvo_blob,',
'                                             o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                             o_mnsje_rspsta => v_mnsje_rspsta);',
'        l_clob := apex_web_service.blob2clobbase64(v_archvo_blob);',
'      else',
'        l_clob := apex_web_service.blob2clobbase64(c_document.file_blob);',
'      end if;',
'    ',
'      -- Escribir los datos en el objeto JSON',
'      apex_json.open_object; -- {',
'      apex_json.write(''fileBlob'', l_clob); -- "fileBlob": documento en blob',
'      apex_json.write(''fileName'', c_document.file_name); -- "fileName": nombre del documento',
'      apex_json.close_object; -- }',
'    ',
'    end loop;',
'  end loop;',
'',
'  apex_json.close_all;',
'',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161129696519342335)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar_Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_app_id        number := v(''APP_ID'');',
'  v_app_page_id   number := v(''APP_PAGE_ID'');',
'  v_cdgo_clnte    df_s_clientes.cdgo_clnte%type := :F_CDGO_CLNTE;',
'  v_gn_d_reportes gn_d_reportes%rowtype;',
'  v_app_id_dstno  number := 66000;',
'  v_zip_file      blob;',
'  v_cntdad_actos  number := 0;',
'  v_rngo_inicial  number;',
'  v_rngo_final    number;',
'  v_error varchar2(4000);',
'begin',
'',
'  insert into muerto',
'    (n_001, v_001, t_001)',
'  values',
'    (1, ''Inicia ZIP RANGO Lote:'' || :P63_ID_DTRMNCION_LTE, systimestamp);',
'  commit;',
'',
'  --Busca los Datos del Reporte',
'  begin',
'    select /*+ RESULT_CACHE */',
'     a.*',
'      into v_gn_d_reportes',
'      from gn_d_reportes a',
'     where id_rprte = (select id_rprte',
'                         from gn_d_plantillas',
'                        where id_plntlla = :P106_ID_PLNTLLA);',
'  ',
'  exception',
'    when no_data_found then',
'      return;',
'  end;',
'',
'  for c_rango_impresion in (select seq_id num_rango,',
'                                   c001   rango_inicio,',
'                                   c002   rango_fin',
'                              from apex_collections',
'                             where collection_name = ''RANGO_IMPRESION'') loop',
'    begin',
'      v_rngo_inicial := c_rango_impresion.rango_inicio;',
'      v_rngo_final   := c_rango_impresion.rango_fin;',
'    ',
'      insert into muerto',
'        (n_001, v_001, t_001)',
'      values',
'        (1, ''v_rngo_inicial:'' || v_rngo_inicial, systimestamp);',
'      commit;',
'    ',
'      insert into muerto',
'        (n_001, v_001, t_001)',
'      values',
'        (1, ''v_rngo_final:'' || v_rngo_final, systimestamp);',
'      commit;',
'    end;',
'  end loop;',
'',
'  apex_session.attach(p_app_id     => v_app_id_dstno,',
'                      p_page_id    => 37,',
'                      p_session_id => v(''APP_SESSION''));',
'',
'  apex_util.set_session_state(''F_CDGO_CLNTE'', v_cdgo_clnte);',
'',
'  for c_dcmntos_lte in (select d.file_blob,',
'                               d.nmro_acto,',
'                               a.id_dtrmncion_lte,',
'                               a.id_dtrmncion',
'                          from gi_g_determinaciones a',
'                          join v_gn_g_actos d',
'                            on a.id_acto = d.id_acto',
'                         where a.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE',
'                           and d.file_blob is not null',
'                           and d.nmro_acto between to_char(v_rngo_inicial) and',
'                               to_char(v_rngo_final)',
'                         order by d.nmro_acto) loop',
'  ',
'    if dbms_lob.getlength(c_dcmntos_lte.file_blob) > 500 then',
'      v_cntdad_actos := v_cntdad_actos + 1;',
'      apex_zip.add_file(p_zipped_blob => v_zip_file,',
'                        p_file_name   => c_dcmntos_lte.nmro_acto || ''.'' ||',
'                                         lower(v_gn_d_reportes.cdgo_frmto_tpo),',
'                        p_content     => c_dcmntos_lte.file_blob);',
'    ',
'      --insert into muerto (n_001, v_001, t_001) values (1, ''ZIP RANGO v_cntdad_actos1:''||v_cntdad_actos, systimestamp );commit; ',
'    ',
'    end if;',
'  end loop;',
'  insert into muerto',
'    (n_001, v_001, t_001)',
'  values',
'    (1, ''ZIP RANGO v_cntdad_actos2:'' || v_cntdad_actos, systimestamp);',
'  commit;',
'',
'  IF v_cntdad_actos > 0 THEN',
'    apex_zip.finish(p_zipped_blob => v_zip_file);',
'',
'    -- Encabezados HTTP',
'    owa_util.mime_header(''application/zip'', FALSE);',
'    htp.p(''Content-Disposition: attachment; filename="Lote_'' || :P63_ID_DTRMNCION_LTE || ''.zip"'');',
'    htp.p(''Content-length: '' || dbms_lob.getlength(v_zip_file));',
'    owa_util.http_header_close;',
'',
'    -- Descargar el archivo',
'    wpg_docload.download_file(v_zip_file);',
'  END IF;',
'',
'  insert into muerto',
'    (n_001, v_001, t_001)',
'  values',
'    (1, ''Termina ZIP RANGO Lote:'' || :P63_ID_DTRMNCION_LTE, systimestamp);',
'  commit;',
'',
'  --apex_session.attach( p_app_id     => v_app_id , p_page_id    => v_app_page_id , p_session_id => v(''APP_SESSION''));',
'exception',
'  when others then',
'  v_error := SQLERRM;',
'    insert into muerto',
'      (n_001, v_001, t_001)',
'    values',
'      (1,v_error, systimestamp);',
'    commit;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161129799926342336)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar_Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'begin',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');    ',
'    apex_json.write(''msg'', ''OK'');    ',
'    apex_json.write(''nmbre_rprte'', ''LOTE_RANGO_DET'');       ',
'    ',
'    apex_json.close_object;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
