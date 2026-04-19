prompt --application/pages/page_00091
begin
wwv_flow_api.create_page(
 p_id=>91
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Adjuntos Expedientes An\00E1lisis')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Adjuntos Expedientes An\00E1lisis')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_height=>'600'
,p_dialog_width=>'900%'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20231117135706'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213490033170737468)
,p_plug_name=>unistr('Adjuntos Expedientes An\00E1lisis')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.ID_ADJNTO,',
'       a.id_usrio,',
'       f.nmbre_trea,',
'       e.nmbre_trcro,',
'       a.obsrvcion,',
'       a.file_name,',
'       to_char(a.fcha_rgstro, ''DD/MM/YYYY'') as fecha, ',
'      case',
'         when a.file_mimetype like ''%excel.sheet%'' then',
'            ''-''',
'        else ',
'            ''<a href="''||APEX_UTIL.PREPARE_URL(p_url => ''f?p=''|| 50000 || '':'' || 127 || '':'' || :app_session ||''::NO:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:gn_g_adjunto'
||'s,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ADJNTO,'' || a.id_adjnto, p_checksum_type => ''SESSION'')||''">Ver <span aria-hidden="true" class="fa fa-eye"></span></a>''',
'        end as ver,',
'       3 descargar_adjunto  ',
'   from GN_G_ADJUNTOS a',
'--join fi_g_expedientes_analisis b on a.id_orgen = b.id_instncia_fljo',
'--join fi_g_fiscalizacion_expdnte c on b.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte',
'join sg_g_usuarios  d   on  a.id_usrio = d.id_usrio',
'join v_si_c_terceros  e   on  d.id_trcro = e.id_trcro',
'join v_wf_d_flujos_tarea  f   on  a.id_fljo_trea  =   f.id_fljo_trea',
'where a.id_orgen = :P91_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213491805555737481)
,p_name=>'ID_ADJNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ADJNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213492470919737482)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213493014492737483)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213493687707737483)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213494259981737483)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213494890245737484)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213495458314737484)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha de cargue'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(213496039362737485)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR,P127_COLUMNA_BFILE:GN_G_ADJUNTOS,ID_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&ID_ADJNTO.,FILE_BFILE'
,p_link_text=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213496678188737485)
,p_name=>'DESCARGAR_ADJUNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR_ADJUNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Descargar Adjunto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
,p_link_target=>'f?p=&APP_ID.:91:&SESSION.:DESCARGAR_ADJUNTO:&DEBUG.:RP:P91_ID_ADJNTO:&ID_ADJNTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(213490573019737473)
,p_internal_uid=>213490573019737473
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
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(213490943314737477)
,p_interactive_grid_id=>wwv_flow_api.id(213490573019737473)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(213491024395737477)
,p_report_id=>wwv_flow_api.id(213490943314737477)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213492281430737482)
,p_view_id=>wwv_flow_api.id(213491024395737477)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(213491805555737481)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213492859385737483)
,p_view_id=>wwv_flow_api.id(213491024395737477)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(213492470919737482)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213493479769737483)
,p_view_id=>wwv_flow_api.id(213491024395737477)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(213493014492737483)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213494080353737483)
,p_view_id=>wwv_flow_api.id(213491024395737477)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(213493687707737483)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213494641010737484)
,p_view_id=>wwv_flow_api.id(213491024395737477)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(213494259981737483)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213495218802737484)
,p_view_id=>wwv_flow_api.id(213491024395737477)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(213494890245737484)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213495812143737484)
,p_view_id=>wwv_flow_api.id(213491024395737477)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(213495458314737484)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213496491080737485)
,p_view_id=>wwv_flow_api.id(213491024395737477)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(213496039362737485)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213497066469737486)
,p_view_id=>wwv_flow_api.id(213491024395737477)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(213496678188737485)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213497171831738801)
,p_name=>'P91_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(213490033170737468)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213508342841041701)
,p_name=>'P91_ID_ADJNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(213490033170737468)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(213508432393041702)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    v_file_name varchar2(2000);',
'    v_file_blob     blob;',
'    file_blob blob;',
'    v_file_bfile    bfile;',
'    v_file_mimetype varchar2(1000);',
'    v_tipo_operacion varchar2(20);',
'    v_id_dcmnto   number;',
'    o_cdgo_rspsta number;',
'    o_mnsje_rspsta varchar2(4000);',
'begin',
'        --apex_application.g_print_success_message := ''<span style="color:white">ITEM [''||:P149_ID_RNTA_ADJNTO||'']!'';',
'         insert into muerto (v_001,  t_001)  values (''Entrando...1  =>'' ||:P91_ID_ADJNTO, sysdate ) ; commit;',
'         ',
'       select  file_blob,    ',
'               file_bfile,     ',
'               file_mimetype,     ',
'               file_name',
'        into   v_file_blob,   ',
'               v_file_bfile,   ',
'               v_file_mimetype,   ',
'               v_file_name',
'        from gn_g_adjuntos',
'        where id_adjnto  = :P91_ID_ADJNTO;',
'',
'    if  v_file_blob is null and v_file_bfile is not null then',
'    ',
'            -- apex_application.g_print_success_message := ''<span style="color:white">ENTRO [''||:P149_ID_RNTA_ADJNTO||'']!'';',
'             pkg_gd_utilidades.prc_co_archco_dsco ( p_bfile          => v_file_bfile',
'                                                , o_archvo_blob      => v_file_blob ',
'                                                , o_cdgo_rspsta      => o_cdgo_rspsta ',
'                                                , o_mnsje_rspsta     => o_mnsje_rspsta) ;   ',
'        ',
'    end if;',
'    ',
'        :P91_ID_ADJNTO := null;',
'    ',
'        htp.init;',
'        owa_util.mime_header(v_file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||v_file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_file_blob);',
'        apex_application.stop_apex_engine;',
' ',
'    ',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DESCARGAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
