prompt --application/pages/page_00055
begin
wwv_flow_api.create_page(
 p_id=>55
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Destinos Predios'
,p_step_title=>'DESTINOS PREDIOS'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222101359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29428994273772710)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'	Funcionalidad que permite ingresar, consultar, modificar y eliminar el destino de los predios.',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96995684723614954)
,p_plug_name=>'Destino Predios'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PRDIO_DSTNO,',
'       CDGO_CLNTE,',
'       ID_IMPSTO,',
'       NMTCNCO,',
'       DSCRPCION,',
'indcdor_usa_estrto',
'  from df_i_predios_destino',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P55_IMPUESTOS'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P55_IMPUESTOS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P55_IMPUESTOS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46358437421318816)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46358537632318817)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96997995589614963)
,p_name=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_DSTNO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96998405571614964)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'&F_CDGO_CLNTE.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96999089501614964)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'&P55_IMPUESTOS.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96999656308614964)
,p_name=>'NMTCNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMTCNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Nemot\00E9cnico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeyup="campoMayuscula(this)"  onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_is_required=>true
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97000259252614965)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeyup="campoMayuscula(this)" '
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109879935822198902)
,p_name=>'INDCDOR_USA_ESTRTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_USA_ESTRTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFUsa Estrato?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>unistr('SI \00F3 NO')
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(96996146496614956)
,p_internal_uid=>96996146496614956
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
 p_id=>wwv_flow_api.id(96996573654614958)
,p_interactive_grid_id=>wwv_flow_api.id(96996146496614956)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(96996601023614959)
,p_report_id=>wwv_flow_api.id(96996573654614958)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46615086161105142)
,p_view_id=>wwv_flow_api.id(96996601023614959)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(46358437421318816)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96998204790614964)
,p_view_id=>wwv_flow_api.id(96996601023614959)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(96997995589614963)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96998869751614964)
,p_view_id=>wwv_flow_api.id(96996601023614959)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(96998405571614964)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96999467964614964)
,p_view_id=>wwv_flow_api.id(96996601023614959)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(96999089501614964)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97000011219614965)
,p_view_id=>wwv_flow_api.id(96996601023614959)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(96999656308614964)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>217
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97000669354614965)
,p_view_id=>wwv_flow_api.id(96996601023614959)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(97000259252614965)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>327
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109905203026054267)
,p_view_id=>wwv_flow_api.id(96996601023614959)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(109879935822198902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>176
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101850854467547814)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24343856206774705)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(101850854467547814)
,p_button_name=>'CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="margin-top:-2px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96628117527115534)
,p_name=>'P55_IMPUESTOS'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(101850854467547814)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Impuesto'
,p_colspan=>5
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo para consultar el destino de predios.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46568765851986610)
,p_validation_name=>'Validar Campo'
,p_validation_sequence=>30
,p_validation=>'P55_IMPUESTOS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Tributo debe tener alg\00FAn valor.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(24343856206774705)
,p_associated_item=>wwv_flow_api.id(96628117527115534)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46359139014318823)
,p_tabular_form_region_id=>wwv_flow_api.id(96995684723614954)
,p_validation_name=>unistr('Valor \00FAnico')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'v_NMTCNCO   number;',
'v_rowid         varchar2(50);',
'',
'cursor C1 is',
'select NMTCNCO, rowid',
'  from DF_I_PREDIOS_DESTINO ',
' where NMTCNCO = :NMTCNCO;',
' ',
'begin',
'    delete gti_aux;',
'    commit;',
'    insert into gti_aux(col1, col2) values (1, :APEX$ROW_STATUS);',
'    commit;',
'    ',
'    open C1;',
'    FETCH C1 into v_NMTCNCO, v_rowid;',
'    if ((:APEX$ROW_STATUS in(''C'',''I'')) or (:ROWID is null) )then        ',
'        if C1%FOUND then ',
unistr('            raise_application_error(-20000, ''C\00F3digo ya existe'');'),
'        end if;',
'    elsif  :APEX$ROW_STATUS = ''U'' then',
'        if (v_rowid != :ROWID) and (v_NMTCNCO = :v_NMTCNCO)  then',
unistr('            raise_application_error(-20000, ''C\00F3digo ya existe'');'),
'        end if;',
'    end if;',
'    close C1;    ',
'end;'))
,p_validation_type=>'PLSQL_ERROR'
,p_error_message=>'#COLUMN_HEADER# ya se encuentra registrado.'
,p_associated_column=>'NMTCNCO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46359260981318824)
,p_tabular_form_region_id=>wwv_flow_api.id(96995684723614954)
,p_validation_name=>unistr('Valor \00FAnico_1')
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'v_DSCRPCION   number;',
'v_rowid         varchar2(50);',
'',
'cursor C1 is',
'select DSCRPCION, rowid',
'  from DF_I_PREDIOS_DESTINO ',
' where DSCRPCION = :DSCRPCION;',
' ',
'begin',
'    delete gti_aux;',
'    commit;',
'    insert into gti_aux(col1, col2) values (1, :APEX$ROW_STATUS);',
'    commit;',
'    ',
'    open C1;',
'    FETCH C1 into v_DSCRPCION, v_rowid;',
'    if ((:APEX$ROW_STATUS in(''C'',''I'')) or (:ROWID is null) )then        ',
'        if C1%FOUND then ',
unistr('            raise_application_error(-20000, ''C\00F3digo ya existe'');'),
'        end if;',
'    elsif  :APEX$ROW_STATUS = ''U'' then',
'        if (v_rowid != :ROWID) and (v_DSCRPCION = :v_DSCRPCION)  then',
unistr('            raise_application_error(-20000, ''C\00F3digo ya existe'');'),
'        end if;',
'    end if;',
'    close C1;    ',
'end;'))
,p_validation_type=>'PLSQL_ERROR'
,p_error_message=>'#COLUMN_HEADER# ya se encuentra registrado.'
,p_associated_column=>'DSCRPCION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24344153736774708)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24344268999774709)
,p_event_id=>wwv_flow_api.id(24344153736774708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(101850854467547814)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46358684853318818)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(96995684723614954)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Destino Predios - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CONSULTAR'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
end;
/
