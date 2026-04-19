prompt --application/pages/page_00326
begin
wwv_flow_api.create_page(
 p_id=>326
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Observaciones'
,p_page_mode=>'MODAL'
,p_step_title=>'OBSERVACIONES'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P326_OBSRVCION{',
'    resize:none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20230802200056'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103689582849618911)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103688715490618903)
,p_plug_name=>'Observaciones'
,p_parent_plug_id=>wwv_flow_api.id(103689582849618911)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select  a.id_sldos_fvr_dcmn_obsrvcn ,',
'        a.id_sldo_fvor_dcmnto ,',
'        c.nmbre_trea ,',
'        a.obsrvcion ,',
'        b.nmbre_trcro ,',
'        to_char(a.fcha_rgstro, ''dd/mm/yyyy hh24:mi:ss'') as fcha_rgstro',
'from    gf_g_sldos_fvr_dcmn_obsrvcn a',
'join    v_sg_g_usuarios             b on a.id_usrio = b.id_usrio',
'left join    v_wf_d_flujos_tarea         c on a.id_fljo_trea = c.id_fljo_trea',
'--and     a.id_sldo_fvor_dcmnto = :P326_ID_SLDO_FVOR_DCMNTO',
'where   a.id_sldo_fvor_slctud = :P326_ID_SLDO_FVOR_SLCTUD',
'order by a.fcha_rgstro desc',
'    );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134495074821536513)
,p_name=>'ID_SLDOS_FVR_DCMN_OBSRVCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDOS_FVR_DCMN_OBSRVCN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134495179151536514)
,p_name=>'ID_SLDO_FVOR_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134495208112536515)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(134495364894536516)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Observacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(134495436476536517)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(134495543764536518)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>19
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(134494988393536512)
,p_internal_uid=>134494988393536512
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(134510277499704021)
,p_interactive_grid_id=>wwv_flow_api.id(134494988393536512)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(134510343542704022)
,p_report_id=>wwv_flow_api.id(134510277499704021)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134510832533704024)
,p_view_id=>wwv_flow_api.id(134510343542704022)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(134495074821536513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134511316812704026)
,p_view_id=>wwv_flow_api.id(134510343542704022)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(134495179151536514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134511829319704027)
,p_view_id=>wwv_flow_api.id(134510343542704022)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(134495208112536515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134512384214704029)
,p_view_id=>wwv_flow_api.id(134510343542704022)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(134495364894536516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134512804955704032)
,p_view_id=>wwv_flow_api.id(134510343542704022)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(134495436476536517)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134513368914704035)
,p_view_id=>wwv_flow_api.id(134510343542704022)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(134495543764536518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103689823785618914)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(103689582849618911)
,p_button_name=>'BTN_GRDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P326_ID_SLDO_FVOR_SLCTUD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(134486965810469901)
,p_branch_name=>'Ir a gestion de SF (216)'
,p_branch_action=>'f?p=&APP_ID.:216:&SESSION.::&DEBUG.:RP,216::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(103689823785618914)
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P326_INDCDOR_TRNSCION'
,p_branch_condition_text=>'S'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103688853336618904)
,p_name=>'P326_ID_SLDO_FVOR_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103688715490618903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103689723217618913)
,p_name=>'P326_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103689582849618911)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103993496228492101)
,p_name=>'P326_ID_SLDO_FVOR_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103688715490618903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134408419842790202)
,p_name=>'P326_INDCDOR_TRNSCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103688715490618903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134431613913978401)
,p_name=>'P326_ID_INSTNCIA_FLJO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103688715490618903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134494166937536504)
,p_name=>'P326_ID_FLJO_TREA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(103688715490618903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103689906637618915)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Guarda observaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*begin',
'',
'    insert into gf_g_sldos_fvr_dcmn_obsrvcn(id_sldo_fvor_slctud,           id_sldo_fvor_dcmnto,           obsrvcion,        id_usrio)',
'                                     values(:P326_ID_SLDO_FVOR_SLCTUD,    :P326_ID_SLDO_FVOR_DCMNTO,    :P326_OBSRVCION,   :F_ID_USRIO);',
'                                     ',
'    :P326_OBSRVCION := null; ',
'    ',
'exception',
'    when others then ',
unistr('        raise_application_error(-20001, ''No se pudo registrar la observaci\00F3n ''|| sqlerrm);'),
'end;',
'*/',
'declare',
'    v_id_instncia_fljo       number; ',
'    v_id_fljo_trea_orgen     number;',
'    v_id_fljo_trea           number;',
'    v_type_rspsta            varchar2(1);',
'	o_cdgo_rspsta			 number;',
'	o_mnsje_rspsta           varchar2(4000);',
'	v_error					 exception;',
'    v_mnsje_error            varchar2(4000);',
'begin',
'',
'    insert into gf_g_sldos_fvr_dcmn_obsrvcn(id_sldo_fvor_slctud,          ',
'                                            id_sldo_fvor_dcmnto,          ',
'                                            obsrvcion,         ',
'                                            id_usrio,',
'                                            id_fljo_trea)',
'                                     values(:P326_ID_SLDO_FVOR_SLCTUD,    ',
'                                            :P326_ID_SLDO_FVOR_DCMNTO,    ',
'                                            :P326_OBSRVCION,   ',
'                                            :F_ID_USRIO,',
'                                            :P326_ID_FLJO_TREA',
'                                           );',
'                                     ',
'    :P326_OBSRVCION := null; ',
'    ',
'    if :P326_INDCDOR_TRNSCION = ''S'' then',
'        -- Se consulta la informaci?n del flujo para hacer la transicion a la siguiente tarea.',
'        begin',
'          select a.id_fljo_trea_orgen',
'            into v_id_fljo_trea_orgen',
'            from wf_g_instancias_transicion a',
'           where a.id_instncia_fljo = :P326_ID_INSTNCIA_FLJO',
'             and a.id_estdo_trnscion in (1, 2);',
'        exception',
'          when no_data_found then',
'            o_cdgo_rspsta  := 14;',
unistr('            o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta || ''No se encontr\00F3 la siguiente tarea del flujo '';'),
'            raise v_error;',
'          when others then',
'            o_cdgo_rspsta  := 15;',
'            o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta ||',
'                              ''Error al consultar la siguiente tarea del flujo : '' || sqlerrm;',
'            raise v_error;',
'        end; -- Fin Se consulta la informaci?n del flujo para hacer la transicion a la siguiente tarea.',
'',
'        -- Se cambia la etapa de flujo',
'        begin',
'            pkg_pl_workflow_1_0.prc_rg_instancias_transicion ( p_id_instncia_fljo => :P326_ID_INSTNCIA_FLJO,',
'                                                               p_id_fljo_trea     => v_id_fljo_trea_orgen,',
'                                                               p_json             => ''[]'',',
'                                                               o_type             => v_type_rspsta, -- ''S => Hubo algun error ''',
'                                                               o_mnsje            => o_mnsje_rspsta,',
'                                                               o_id_fljo_trea     => v_id_fljo_trea,',
'                                                               o_error            => v_mnsje_error );',
'    /*		o_mnsje_rspsta := ''v_type_rspsta: '' || v_type_rspsta ||',
'                            '' o_mnsje_rspsta: '' || o_mnsje_rspsta ||',
'                            '' v_id_fljo_trea: '' || v_id_fljo_trea ||',
'                            '' v_error: '' || v_mnsje_error;',
'            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta, 6);',
'    */',
'            if v_type_rspsta = ''N'' then',
'                update  wf_g_instancias_transicion a set id_estdo_trnscion = 2',
'                where   a.id_instncia_fljo = :P326_ID_INSTNCIA_FLJO and id_fljo_trea_orgen = v_id_fljo_trea',
'                and     a.id_estdo_trnscion in (1, 2);',
'                ',
unistr('                apex_application.g_print_success_message := ''<span style="color:white">Proyecci\00F3n Rechazada!</span>'';'),
'    ',
'            else ',
'                o_cdgo_rspsta  := 17;',
'                o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta ||',
'                                  '' Error al cambiar la etapa del flujo: '' || v_mnsje_error;',
'                raise v_error;',
'            end if;',
'        exception',
'            when others then',
'            o_cdgo_rspsta  := 18;',
'            o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta || ''Error al cambiar la etapa del flujo: '' || v_mnsje_error||'' ---- ''||sqlerrm;',
'            raise v_error;',
'        end; -- Fin Se cambia la etapa de flujo',
'    else',
'    ',
unistr('        apex_application.g_print_success_message := ''<span style="color:white">Observaci\00F3n guardada exitosamente!</span>'';'),
'    ',
'    end if;',
'    ',
'    ',
'	exception',
'		when v_error then',
'			raise_application_error(-20001, o_mnsje_rspsta);',
'		when others then',
'			o_cdgo_rspsta  := 18;',
'			o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta || ''Error al cambiar la etapa del flujo: '' || sqlerrm;',
'			raise_application_error(-20001, o_mnsje_rspsta);',
'end;      ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103689823785618914)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134408334715790201)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Siguiente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_instncia_fljo       number; ',
'    v_id_fljo_trea_orgen     number;',
'    v_id_fljo_trea           number;',
'    v_type_rspsta            varchar2(1);',
'	o_cdgo_rspsta			 number;',
'	o_mnsje_rspsta           varchar2(4000);',
'	v_error					 exception;',
'    v_mnsje_error            varchar2(4000);',
'begin',
'',
'	-- Se consulta la informaci?n del flujo para hacer la transicion a la siguiente tarea.',
'	begin',
'	  select a.id_fljo_trea_orgen',
'		into v_id_fljo_trea_orgen',
'		from wf_g_instancias_transicion a',
'	   where a.id_instncia_fljo = :P326_ID_INSTNCIA_FLJO',
'		 and a.id_estdo_trnscion in (1, 2);',
'	exception',
'	  when no_data_found then',
'		o_cdgo_rspsta  := 14;',
unistr('		o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta || ''No se encontr\00F3 la siguiente tarea del flujo '';'),
'		raise v_error;',
'	  when others then',
'		o_cdgo_rspsta  := 15;',
'		o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta ||',
'						  ''Error al consultar la siguiente tarea del flujo : '' || sqlerrm;',
'		raise v_error;',
'	end; -- Fin Se consulta la informaci?n del flujo para hacer la transicion a la siguiente tarea.',
'',
'	-- Se cambia la etapa de flujo',
'	begin',
'		pkg_pl_workflow_1_0.prc_rg_instancias_transicion ( p_id_instncia_fljo => :P326_ID_INSTNCIA_FLJO,',
'														   p_id_fljo_trea     => v_id_fljo_trea_orgen,',
'														   p_json             => ''[]'',',
'														   o_type             => v_type_rspsta, -- ''S => Hubo algun error ''',
'														   o_mnsje            => o_mnsje_rspsta,',
'														   o_id_fljo_trea     => v_id_fljo_trea,',
'														   o_error            => v_mnsje_error );',
'/*		o_mnsje_rspsta := ''v_type_rspsta: '' || v_type_rspsta ||',
'						'' o_mnsje_rspsta: '' || o_mnsje_rspsta ||',
'						'' v_id_fljo_trea: '' || v_id_fljo_trea ||',
'						'' v_error: '' || v_mnsje_error;',
'		pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta, 6);',
'*/',
'		if v_type_rspsta = ''N'' then',
'            update  wf_g_instancias_transicion a set id_estdo_trnscion = 2',
'            where   a.id_instncia_fljo = :P326_ID_INSTNCIA_FLJO and id_fljo_trea_orgen = v_id_fljo_trea',
'            and     a.id_estdo_trnscion in (1, 2);',
'		else ',
'			o_cdgo_rspsta  := 17;',
'			o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta ||',
'							  '' Error al cambiar la etapa del flujo: '' || v_mnsje_error;',
'			raise v_error;',
'		end if;',
'        ',
unistr('        apex_application.g_print_success_message := ''<span style="color:white">Obsetrvaci\00F3n guardada exitosamente!</span>'';'),
'		',
'	exception',
'		when others then',
'		o_cdgo_rspsta  := 18;',
'		o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta || ''Error al cambiar la etapa del flujo: '' || v_mnsje_error||'' ---- ''||sqlerrm;',
'		raise v_error;',
'	end; -- Fin Se cambia la etapa de flujo',
'',
'                       ',
'	exception',
'		when v_error then',
'			raise_application_error(-20001, o_mnsje_rspsta);',
'		when others then',
'			o_cdgo_rspsta  := 18;',
'			o_mnsje_rspsta := ''No. '' || o_cdgo_rspsta || ''Error al cambiar la etapa del flujo: '' || sqlerrm;',
'			raise_application_error(-20001, o_mnsje_rspsta);',
'end;      ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103689823785618914)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134074798761376801)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P326_ID_SLDO_FVOR_DCMNTO is null then',
'        begin',
'            select id_sldo_fvor_dcmnto into :P326_ID_SLDO_FVOR_DCMNTO',
'            from   gf_g_saldos_favor_documento    b ',
'            where  b.id_sldo_fvor_slctud = :P326_ID_SLDO_FVOR_SLCTUD ;',
'        exception',
'            when no_data_found then',
'                null;',
'            when others then',
'                raise_application_error(-20001, ''Error al consultar el documento'');',
'        end;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
