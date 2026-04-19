prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Revisi\00F3n de Informaci\00F3n Veh\00EDculos')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Revisi\00F3n de Informaci\00F3n Veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const ListadoMarca = async() =>{',
'   ',
' try{',
'    //  let $waitPopup = apex.widget.waitPopup();',
'  const arraymarca =  apex.region("Revision").widget().interactiveGrid("getViews", "grid").model;',
'      ',
'    arraymarca.forEach(async v_marca =>{  ',
'                  console.log(v_marca[arraymarca.getFieldKey("CODIGO")])',
'      const  respuesta = await  apex.server.process("RegistrarInformacion", {     ',
'          x01: v_marca[arraymarca.getFieldKey("CODIGO")],',
'          x02: v_marca[arraymarca.getFieldKey("DESCRIPCION")]',
'        });  ',
'    ',
'         })',
'',
'  // $waitPopup.remove();',
'  apex.region("Revision").refresh();',
'   } catch(error){',
'     console.log(error); ',
'     $waitPopup.remove();',
'   }',
' ',
' }  ',
'     '))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-Toolbar {',
'    width: 100%;',
'    display: none;',
'}',
'',
'.fa-trash-o{',
'    color:red;',
'}',
''))
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20201124141915'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97990635626771847)
,p_plug_name=>unistr('Revisi\00F3n de Informaci\00F3n Veh\00EDculos')
,p_region_name=>'Revision'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:js-showMaximizeButton:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237243066872524200)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id as seq,c001 as Tabla,c002 as Estado,c003 as Codigo,c004 as Descripcion,''<center>',
'            <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Eliminar  ',
'                <span class="fa fa-trash-o" aria-hidden="true"></span>',
'            </button>',
'        </center>'' as btn_eliminar  from APEX_collections ',
'where collection_name = ''V_REVISION''  and  c001 = :P36_TABLA ; '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97990920501771850)
,p_name=>'TABLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TABLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tabla'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98065140574461101)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98065288259461102)
,p_name=>'CODIGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CODIGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98065323534461103)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98065444510461104)
,p_name=>'Btn_eliminar'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BTN_ELIMINAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_PCT_GRAPH'
,p_heading=>'Eliminar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_link_target=>'f?p=&APP_ID.:36:&SESSION.:DELETE:&DEBUG.:RP:P36_SEQ:&SEQ.'
,p_link_text=>'  <span class="fa fa-trash-o" aria-hidden="true"></span>'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98065968343461109)
,p_name=>'SEQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98066329165461113)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98066488377461114)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(97990727132771848)
,p_internal_uid=>97990727132771848
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(98070755192461261)
,p_interactive_grid_id=>wwv_flow_api.id(97990727132771848)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(98070802633461261)
,p_report_id=>wwv_flow_api.id(98070755192461261)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98071847541461264)
,p_view_id=>wwv_flow_api.id(98070802633461261)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(97990920501771850)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98072338477461267)
,p_view_id=>wwv_flow_api.id(98070802633461261)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(98065140574461101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98072880847461269)
,p_view_id=>wwv_flow_api.id(98070802633461261)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(98065288259461102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98073364357461271)
,p_view_id=>wwv_flow_api.id(98070802633461261)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(98065323534461103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98073897261461285)
,p_view_id=>wwv_flow_api.id(98070802633461261)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(98065444510461104)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98088196887937273)
,p_view_id=>wwv_flow_api.id(98070802633461261)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(98065968343461109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98093916191109706)
,p_view_id=>wwv_flow_api.id(98070802633461261)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(98066329165461113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98066012405461110)
,p_plug_name=>'Datos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98066280995461112)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(98066012405461110)
,p_button_name=>'Btn_Procesar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98066136861461111)
,p_name=>'P36_SEQ'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98066012405461110)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98067533369461125)
,p_name=>'P36_TABLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(98066012405461110)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98067362823461123)
,p_name=>'Procesar_informacion'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(98066280995461112)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98067454634461124)
,p_event_id=>wwv_flow_api.id(98067362823461123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ListadoMarca(); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97990239752771843)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar_Marca_Collecion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    begin',
'        APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''V_REVISION'',',
'        p_seq => :P36_SEQ);',
'    end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98066578383461115)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(97990635626771847)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Revision de Informacion Vehiculos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98067268890461122)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RegistrarInformacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_c001 varchar2(4000); ',
' v_c002 varchar2(4000); ',
'begin',
'   v_c001    := apex_application.g_x01;',
'   v_c002    := apex_application.g_x02;',
'',
'',
'           ',
'  insert into muerto(v_001,v_002) values(v_c001, v_c002);',
'        ',
' ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'' , 0);',
'    apex_json.write(''o_mnsje_rspsta'',''OK'');',
'    apex_json.close_object();',
'    ',
'    ',
'commit; ',
' APEX_COLLECTION.TRUNCATE_COLLECTION(',
'        p_collection_name => ''V_REVISION'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(98066280995461112)
);
end;
/
