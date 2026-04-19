prompt --application/pages/page_20250_002
begin
wwv_flow_api.create_page(
 p_id=>2025004
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Respuesta'
,p_page_mode=>'MODAL'
,p_step_title=>'Respuesta'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    let rs = await apex.server.process(''consultarRespuesta'', {',
'        pageItems: ''#P2025004_ID_QJA_RCLMO''',
'    });',
'    ',
'    if(rs.type === ''OK'') {',
'        CKEDITOR.instances.P2025004_RSPSTA.setData(rs.html);    ',
'    } else {',
'        CKEDITOR.instances.P2025004_RSPSTA.setData('''');',
'    }    ',
'});'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20250911141424'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10528030700580502)
,p_plug_name=>'Respuesta'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10528551193580507)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(10528030700580502)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_qja_rclmo_adjnto        ',
'        , a.file_name',
'        , a.obsrvcion',
'        , b.nmbre_trcro',
'        , a.fcha_dgta',
unistr('        , decode(a.actvo,''S'',''S\00ED'',''N'',''No'') actvo'),
'        , a.id_qja_rclmo_adjnto_orgnal',
'        , 1 descargar',
'        , 2 ver',
'     from pq_g_quejas_reclamo_adjunto a',
'     left join v_sg_g_usuarios b on b.id_usrio = a.id_usrio',
'    where id_qja_rclmo    =  :P2025004_ID_QJA_RCLMO   ',
'    ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10528750308580509)
,p_name=>'ID_QJA_RCLMO_ADJNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_QJA_RCLMO_ADJNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10528800654580510)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(10528992849580511)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10529077174580512)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10529118089580513)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:PQ_G_QUEJAS_RECLAMO_ADJUNTO,ID_QJA_RCLMO_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&ID_QJA_RCLMO_ADJ'
||'NTO.'
,p_link_text=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13976694873057004)
,p_name=>'FCHA_DGTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DGTA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY HH:MIPM'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13976799594057005)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Activo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13976955562057007)
,p_name=>'ID_QJA_RCLMO_ADJNTO_ORGNAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_QJA_RCLMO_ADJNTO_ORGNAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13977292183057010)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10528693623580508)
,p_internal_uid=>10528693623580508
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
 p_id=>wwv_flow_api.id(10535304081634052)
,p_interactive_grid_id=>wwv_flow_api.id(10528693623580508)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10535414857634052)
,p_report_id=>wwv_flow_api.id(10535304081634052)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10535996978634055)
,p_view_id=>wwv_flow_api.id(10535414857634052)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10528750308580509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10536442454634060)
,p_view_id=>wwv_flow_api.id(10535414857634052)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10528800654580510)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>201
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10536911824634062)
,p_view_id=>wwv_flow_api.id(10535414857634052)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10528992849580511)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10537482430634063)
,p_view_id=>wwv_flow_api.id(10535414857634052)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10529077174580512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10537991238634065)
,p_view_id=>wwv_flow_api.id(10535414857634052)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(10529118089580513)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14014924292086690)
,p_view_id=>wwv_flow_api.id(10535414857634052)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(13976694873057004)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14015405019086692)
,p_view_id=>wwv_flow_api.id(10535414857634052)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(13976799594057005)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14018377406102218)
,p_view_id=>wwv_flow_api.id(10535414857634052)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(13976955562057007)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139.125
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14029143893568262)
,p_view_id=>wwv_flow_api.id(10535414857634052)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(13977292183057010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10528187838580503)
,p_name=>'P2025004_RSPSTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10528030700580502)
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(71867060529951592)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (options){',
'    options.uiColor = ''#f1f1f1'';',
'    options.skin = ''office2013,skins/office2013/'';',
'    options.height = 200;',
'    options.resize_enabled = false;',
'    options.readOnly = true;',
'}',
'    '))
,p_attribute_02=>'Full'
,p_attribute_03=>'N'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10528249136580504)
,p_name=>'P2025004_ID_INSTNCIA_FLJO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10528030700580502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10528308417580505)
,p_name=>'P2025004_ID_QJA_RCLMO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10528030700580502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10527951155580501)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'consultar la queja o reclamo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cnteo_rspsta number;',
'    ',
'begin',
'    select id_qja_rclmo',
'    into :P2025004_ID_QJA_RCLMO',
'    from pq_g_quejas_reclamo',
'    where id_instncia_fljo = :P2025004_ID_INSTNCIA_FLJO;',
'    ',
'    ---- Agregado el 25/07/2024',
unistr('	/* Se adiciona validaci\00F3n para casos donde se crean dos o m\00E1s registros '),
'	   de quejas para una misma instancia_flujo. ',
unistr('	   Valicdaci\00F3n realiza para dar soluci\00F3n al requerimiento Req0025405.'),
'	*/',
'    ',
'exception ',
'    when others then',
'        begin',
'		',
'			select count(id_qja_rclmo) ',
'			into v_cnteo_rspsta ',
'			from pq_g_quejas_reclamo ',
'			where id_instncia_fljo = :P2025004_ID_INSTNCIA_FLJO and rspsta is not null;',
'',
'			',
'			if v_cnteo_rspsta = 0 then',
'			',
'				select  max(id_qja_rclmo) as id_qja_rclmo',
'				into :P2025004_ID_QJA_RCLMO',
'				from pq_g_quejas_reclamo',
'				where id_instncia_fljo = :P2025004_ID_INSTNCIA_FLJO;',
'			',
'			else ',
'			',
'				select  max(id_qja_rclmo) as id_qja_rclmo',
'				into :P2025004_ID_QJA_RCLMO',
'				from pq_g_quejas_reclamo',
'				where id_instncia_fljo = :P2025004_ID_INSTNCIA_FLJO',
'				and rspsta is not null;',
'			',
'			end if;',
'			',
'			',
'			--insert into muerto(n_001, v_001) values (101013,:P25_ID_QJA_RCLMO ); commit;',
'        ',
'        exception',
'            when others then ',
'            :P2025004_ID_QJA_RCLMO := null;',
'         ',
'        end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10528467678580506)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'consultarRespuesta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rspsta    clob;',
'begin',
'   apex_json.open_object;',
'   begin',
'      select rspsta',
'        into v_rspsta',
'        from pq_g_quejas_reclamo',
'       where id_qja_rclmo = :P2025004_ID_QJA_RCLMO; ',
'      ',
'      apex_json.write(''type'' , ''OK'');',
'      apex_json.write(''html'', v_rspsta);',
'   exception',
'      when others then',
'         apex_json.write(''type'', ''ERRROR'');',
'         apex_json.write(''sqlerrm'', sqlerrm);',
'   end;',
'   apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
