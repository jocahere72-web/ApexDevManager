prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>unistr('Detalle Declaraci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Detalle Declaraci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(52102019875074790)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250627120951'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(126984273811154250)
,p_plug_name=>'Encabezado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(52103601277074790)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(126985613681154263)
,p_plug_name=>'Detalle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion,',
'            a.vlor_dsplay,',
'            a.ordn',
'from        json_table  (',
'                            :P34_JSON, ''$[*]'' columns  (',
'                                                    id_frmlrio_rgion_atrbto number          path ''$.id_frmlrio_rgion_atrbto'',',
'                                                    vlor_dsplay             varchar2(1000)  path ''$.vlor_dsplay'',',
'                                                    ordn                   number          path ''$.ordn''',
'                                                )',
'                        )               a',
'inner join  gi_d_frmlrios_rgion_atrbto  b   on  b.id_frmlrio_rgion_atrbto   =   a.id_frmlrio_rgion_atrbto',
'inner join  gi_d_formularios_region     c   on  c.id_frmlrio_rgion          =   b.id_frmlrio_rgion;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(126985912519154266)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(126986043489154267)
,p_name=>'VLOR_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(126986102682154268)
,p_name=>'ORDN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Orden'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(126985806683154265)
,p_internal_uid=>126985806683154265
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(127212552423728845)
,p_interactive_grid_id=>wwv_flow_api.id(126985806683154265)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(127212656878728845)
,p_report_id=>wwv_flow_api.id(127212552423728845)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127213095069728852)
,p_view_id=>wwv_flow_api.id(127212656878728845)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(126985912519154266)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127213618328728855)
,p_view_id=>wwv_flow_api.id(127212656878728845)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(126986043489154267)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127214116505728857)
,p_view_id=>wwv_flow_api.id(127212656878728845)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(126986102682154268)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(162445166756554909)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(126984273811154250)
,p_button_name=>'BTN_VSOR'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_image_alt=>unistr('<b>Ver Declaraci\00F3n Firmada</b>')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_NOMBRE_TABLA,P127_VALOR,P127_COLUMNA_CLAVE_PRIMARIA:file_name,file_blob,file_mimetype,gi_g_dclrcnes_arhvos_adjnto,&P34_ID_DCLRCION.,id_dclrcion'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_dclrcnes_arhvos_adjnto',
' where id_dclrcion = :P34_ID_DCLRCION'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-paperclip'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86968256137489202)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(126984273811154250)
,p_button_name=>'BTN_PDF'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_image_alt=>unistr('<b>Ver Declaraci\00F3n</b>')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=70000:268:&SESSION.::&DEBUG.:RP:P268_ID_DCLRCION:&P34_ID_DCLRCION.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_dclrcnes_arhvos_adjnto',
' where id_dclrcion = :P34_ID_DCLRCION'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-paperclip'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(102153679161638651)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(126984273811154250)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'<b>Imprimir Items</b>'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(102154022393638654)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(126984273811154250)
,p_button_name=>'BTN_ADJNTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver Adjunto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=70000:145:&SESSION.::&DEBUG.:RP,145:P145_ID_DCLRCION:&P34_ID_DCLRCION.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-paperclip'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(102155369130638658)
,p_branch_name=>'Ir a reporte'
,p_branch_action=>'f?p=66000:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:569&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(102153679161638651)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102146850347638631)
,p_name=>'P34_ID_DCLRCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102147275794638632)
,p_name=>'P34_NMBRE_RZON_SCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_prompt=>unistr('Nombres y Apellidos o Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52180871570074831)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102147601975638633)
,p_name=>'P34_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo,',
'        a.cdgo_idntfccion_tpo',
'from    df_s_identificaciones_tipo  a'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52180871570074831)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102148077585638633)
,p_name=>'P34_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52180871570074831)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102148494640638634)
,p_name=>'P34_DV'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_prompt=>'DV'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52180871570074831)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102148895088638634)
,p_name=>'P34_DRCCION_NTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_prompt=>unistr('Direcci\00F3n de Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52180871570074831)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102149227606638634)
,p_name=>'P34_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto,',
'        a.id_dprtmnto',
'from    df_s_departamentos  a;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52180871570074831)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102149670337638634)
,p_name=>'P34_ID_MNCPIO_NTFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_prompt=>unistr('Municipio o Distrito de la Direcci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio,',
'        a.id_mncpio',
'from    df_s_municipios a;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52180871570074831)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102150045095638635)
,p_name=>'P34_TLFNO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52180871570074831)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102150486445638635)
,p_name=>'P34_EMAIL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_prompt=>unistr('Correo Electr\00F3nico')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52180871570074831)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102150835504638635)
,p_name=>'P34_JSON'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(126984273811154250)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(102154856551638657)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Generar JSON impresi\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_rprte      gn_d_reportes.nmbre_rprte%type;',
'    v_id_rprte         gn_d_reportes.nmbre_rprte%type;',
'    v_object           json_object_t := json_object_t();  ',
'    v_json             clob;  ',
'begin    ',
'    select nmbre_rprte',
'         , id_rprte',
'      into v_nmbre_rprte',
'         , v_id_rprte',
'      from gn_d_reportes',
'     where cdgo_rprte_grpo = ''RID'';',
'',
'   v_object.put(''nmbre_rprte'', v_nmbre_rprte);',
'   v_object.put(''id_dclrcion'', :P34_ID_DCLRCION);',
'   v_json := v_object.to_clob();  ',
'   apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );  ',
'   apex_util.set_session_state(''P37_JSON'', v_json);      ',
'   apex_util.set_session_state(''P37_ID_RPRTE'', v_id_rprte);     ',
' ',
'exception',
'    when no_data_found then',
'         null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(102153679161638651)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(102154479211638655)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculo datos encabezado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select      c.nmbre_rzon_scial,',
'                c.cdgo_idntfccion_tpo,',
'                b.idntfccion_sjto,',
'                pkg_gi_declaraciones_funciones.fnc_ca_digito_verificacion(p_identificacion  =>  b.idntfccion_sjto) as dv,',
'                b.drccion_ntfccion,',
'                b.id_dprtmnto_ntfccion,',
'                b.id_mncpio_ntfccion,',
'                b.tlfno,',
'                b.email,',
'                pkg_gi_declaraciones.fnc_co_atributos_seleccion		(p_id_dclrcion			=>  :P34_ID_DCLRCION,',
'                                                                     p_cdgo_extrccion_objto	=>  ''ITM'')',
'    into        :P34_NMBRE_RZON_SCIAL,',
'                :P34_CDGO_IDNTFCCION_TPO,',
'                :P34_IDNTFCCION_SJTO,',
'                :P34_DV,',
'                :P34_DRCCION_NTFCCION,',
'                :P34_ID_DPRTMNTO_NTFCCION,',
'                :P34_ID_MNCPIO_NTFCCION,',
'                :P34_TLFNO,',
'                :P34_EMAIL,',
'                :P34_JSON',
'    from        gi_g_declaraciones      a',
'    inner join  v_si_i_sujetos_impuesto b   on  b.id_sjto_impsto    =   a.id_sjto_impsto',
'    inner join  si_i_personas           c   on  c.id_sjto_impsto    =   b.id_sjto_impsto',
'    where       a.id_dclrcion   =   :P34_ID_DCLRCION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
