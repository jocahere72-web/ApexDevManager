prompt --application/pages/page_00100
begin
wwv_flow_api.create_page(
 p_id=>100
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'Regenerar Actos'
,p_step_title=>'Regenerar Actos'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(76345756650582452)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20250311114547'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66322806074871807)
,p_plug_name=>'consulta juridico'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct  ',
'     a.id_acto,a.nmro_acto,a.fcha,d.idntfccion,a.cdgo_acto_orgen,d.id_instncia_fljo',
'    ,e.dscrpcion_sjto_estdo,e.nmbre_impsto,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join v_cb_g_procesos_jrdco_dcmnto    d on d.id_acto      = a.id_acto and d.id_acto_tpo = a.id_acto_tpo',
'join cb_g_procesos_jrdco_mvmnto      b on b.ID_PRCSOS_JRDCO      = d.ID_PRCSOS_JRDCO',
'join v_si_i_sujetos_impuesto         e on e.id_sjto      = d.id_sjto and e.idntfccion_sjto = d.idntfccion and e.id_impsto = b.id_impsto',
'where(a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and a.cdgo_acto_orgen = ''GCB''',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and ((a.file_blob is null or dbms_lob.getlength(a.file_blob) <= 5000) or (a.file_bfile is null and dbms_lob.getlength(a.file_bfile) <= 5000))',
'  and :P100_ACTOS_RGNRDOS = ''N'';',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''GCB''',
'  and :P100_ACTOS_RGNRDOS = ''N'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2770289001310801)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(66323114751871810)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(66323232989871811)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(66323288028871812)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(66323471881871813)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(66323507757871814)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66323630484871815)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(66323767539871816)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66324528497871824)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(66322916592871808)
,p_internal_uid=>66322916592871808
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(66362799781055093)
,p_interactive_grid_id=>wwv_flow_api.id(66322916592871808)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(66362908003055095)
,p_report_id=>wwv_flow_api.id(66362799781055093)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2776347946310918)
,p_view_id=>wwv_flow_api.id(66362908003055095)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(2770289001310801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66363862753055116)
,p_view_id=>wwv_flow_api.id(66362908003055095)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(66323114751871810)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66364374210055119)
,p_view_id=>wwv_flow_api.id(66362908003055095)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66323232989871811)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66364829254055120)
,p_view_id=>wwv_flow_api.id(66362908003055095)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(66323288028871812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66365280678055122)
,p_view_id=>wwv_flow_api.id(66362908003055095)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66323471881871813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66365816366055124)
,p_view_id=>wwv_flow_api.id(66362908003055095)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(66323507757871814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66366340049055125)
,p_view_id=>wwv_flow_api.id(66362908003055095)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(66323630484871815)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66366818266055128)
,p_view_id=>wwv_flow_api.id(66362908003055095)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(66323767539871816)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66402312551373849)
,p_view_id=>wwv_flow_api.id(66362908003055095)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(66324528497871824)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66324639279871825)
,p_plug_name=>'Consulta Convenios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ',
'    a.nmro_acto,a.fcha,d.idntfccion_sjto,e.nmbre_impsto,a.cdgo_acto_orgen,e.dscrpcion_sjto_estdo,',
'    a.id_acto,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join v_gf_g_convenios        d on d.id_acto      = a.id_acto',
'join gn_d_plantillas         c on c.id_acto_tpo  = a.id_acto_tpo',
'join gn_d_reportes           b on b.id_rprte     = c.id_rprte',
'join v_si_i_sujetos_impuesto e on e.id_sjto = d.id_sjto',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and ((a.file_blob is null or dbms_lob.getlength(a.file_blob) <= 5000) or (a.file_bfile is null and dbms_lob.getlength(a.file_bfile) <= 5000))',
'  and :P100_ACTOS_RGNRDOS = ''N''',
'/*  ',
'union',
'',
'select  ',
'    a.nmro_acto,a.fcha,d.idntfccion_sjto,e.nmbre_impsto,a.cdgo_acto_orgen,e.dscrpcion_sjto_estdo,',
'    a.id_acto,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos                a',
'join v_gf_g_convenios            d on d.id_acto      = a.id_acto',
'join gn_d_plantillas             c on c.id_acto_tpo  = a.id_acto_tpo',
'join gn_d_reportes               b on b.id_rprte     = c.id_rprte',
'join v_si_i_sujetos_impuesto     e on e.id_sjto      = d.id_sjto ',
'join gn_g_regenerar_actos_traza  f on f.id_acto      = a.id_acto',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and :P100_ACTOS_RGNRDOS = ''Y'';*/',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''CNV''',
'  and :P100_ACTOS_RGNRDOS = ''N'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66324808719871827)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(66324918523871828)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
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
 p_id=>wwv_flow_api.id(66324985272871829)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(66325102074871830)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(66325211001871831)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(66325322102871832)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66325467284871833)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(66325577551871834)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(66324753558871826)
,p_internal_uid=>66324753558871826
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(66614920380685291)
,p_interactive_grid_id=>wwv_flow_api.id(66324753558871826)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(66615051811685296)
,p_report_id=>wwv_flow_api.id(66614920380685291)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66615552392685304)
,p_view_id=>wwv_flow_api.id(66615051811685296)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(66324808719871827)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66616014081685308)
,p_view_id=>wwv_flow_api.id(66615051811685296)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(66324918523871828)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66616525611685311)
,p_view_id=>wwv_flow_api.id(66615051811685296)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66324985272871829)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66617047874685315)
,p_view_id=>wwv_flow_api.id(66615051811685296)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(66325102074871830)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66617483358685316)
,p_view_id=>wwv_flow_api.id(66615051811685296)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66325211001871831)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66618007065685318)
,p_view_id=>wwv_flow_api.id(66615051811685296)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(66325322102871832)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66618538751685320)
,p_view_id=>wwv_flow_api.id(66615051811685296)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(66325467284871833)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66618996663685321)
,p_view_id=>wwv_flow_api.id(66615051811685296)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(66325577551871834)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66325668962871835)
,p_plug_name=>unistr('Consulta Prescripci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct',
'    a.nmro_acto,a.fcha,f.idntfccion,f.nmbre_impsto,a.cdgo_acto_orgen,e.dscrpcion_sjto_estdo,',
'    a.id_acto,d.id_dcmnto,a.id_acto_tpo,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join gf_g_prscrpcns_dcmnto      d on d.id_acto = a.id_acto',
'join v_gf_g_prescripciones      g on g.id_prscrpcion = d.id_prscrpcion',
'join v_pq_g_solicitudes         f on f.id_slctud = g.id_slctud',
'join gn_d_plantillas            c on c.id_acto_tpo  = a.id_acto_tpo',
'join gn_d_reportes              b on b.id_rprte     = c.id_rprte',
'join v_si_i_sujetos_impuesto    e on e.idntfccion_sjto = f.idntfccion',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and ((a.file_blob is null or dbms_lob.getlength(a.file_blob) <= 5000) or (a.file_bfile is null and dbms_lob.getlength(a.file_bfile) <= 5000))',
'  and :P100_ACTOS_RGNRDOS = ''N''',
'  ',
'union',
'',
'select  distinct',
'    a.nmro_acto,a.fcha,f.idntfccion,f.nmbre_impsto,a.cdgo_acto_orgen,e.dscrpcion_sjto_estdo,',
'    a.id_acto,d.id_dcmnto,a.id_acto_tpo,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join gf_g_prscrpcns_dcmnto      d on d.id_acto          = a.id_acto',
'join v_gf_g_prescripciones      g on g.id_prscrpcion    = d.id_prscrpcion',
'join v_pq_g_solicitudes         f on f.id_slctud        = g.id_slctud',
'join gn_d_plantillas            c on c.id_acto_tpo      = a.id_acto_tpo',
'join gn_d_reportes              b on b.id_rprte         = c.id_rprte',
'join v_si_i_sujetos_impuesto    e on e.idntfccion_sjto  = f.idntfccion',
'join gn_g_regenerar_actos_traza h on h.id_acto          = a.id_acto',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and :P100_ACTOS_RGNRDOS = ''Y'';',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''PRS''',
'  and :P100_ACTOS_RGNRDOS = ''N'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66325814161871837)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(66325898756871838)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66325995612871839)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(66326107478871840)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66326244750871841)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(66326278737871842)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66326417896871843)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(66326496736871844)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66326877214871847)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66326882791871848)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(66325746783871836)
,p_internal_uid=>66325746783871836
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(66628143660387042)
,p_interactive_grid_id=>wwv_flow_api.id(66325746783871836)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(66628227638387043)
,p_report_id=>wwv_flow_api.id(66628143660387042)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66628770035387053)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(66325814161871837)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66629098888387059)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(66325898756871838)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66629600428387061)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66325995612871839)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66630152524387063)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(66326107478871840)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66630657975387067)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66326244750871841)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66631091486387069)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(66326278737871842)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66631622395387072)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(66326417896871843)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66632176430387076)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(66326496736871844)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66690567671372953)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(66326877214871847)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66691011427372957)
,p_view_id=>wwv_flow_api.id(66628227638387043)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(66326882791871848)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66327011150871849)
,p_plug_name=>'Consulta Medidas Cautelares'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct',
'    a.nmro_acto,a.fcha,a.cdgo_acto_orgen,d.idntfccion,e.nmbre_impsto,e.dscrpcion_sjto_estdo,',
'    --a.id_acto,',
'    a.id_dcmnto,a.id_acto_tpo,',
'    ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join v_mc_g_embargos_resolucion      d on d.id_acto = a.id_acto',
'join v_si_i_sujetos_impuesto         e on e.idntfccion_sjto = d.idntfccion',
'where',
'    (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and ((a.file_blob is null or dbms_lob.getlength(a.file_blob) <= 5000) or (a.file_bfile is null and dbms_lob.getlength(a.file_bfile) <= 5000))',
'  and :P100_ACTOS_RGNRDOS = ''N''',
' ',
'union ',
'',
'select  distinct',
'    a.nmro_acto,a.fcha,a.cdgo_acto_orgen,d.idntfccion',
'    ,e.nmbre_impsto,e.dscrpcion_sjto_estdo,',
'    --a.id_acto,',
'    a.id_dcmnto,a.id_acto_tpo,',
'    ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'left join v_mc_g_desembargos_resolucion      d on d.id_acto = a.id_acto',
'join v_si_i_sujetos_impuesto                 e on e.idntfccion_sjto = d.idntfccion',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo  = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and ((a.file_blob is null or dbms_lob.getlength(a.file_blob) <= 5000) or (a.file_bfile is null and dbms_lob.getlength(a.file_bfile) <= 5000))',
'  and :P100_ACTOS_RGNRDOS = ''N''',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''MCT''',
'  and :P100_ACTOS_RGNRDOS = ''N'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33486723594501542)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(66327254082871851)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(66721582828026402)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66721719309026403)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(66721822111026404)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(66721970670026405)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66722071397026406)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66722187803026408)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(66722444471026410)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(66327078058871850)
,p_internal_uid=>66327078058871850
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(66727505368031171)
,p_interactive_grid_id=>wwv_flow_api.id(66327078058871850)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(66727627951031180)
,p_report_id=>wwv_flow_api.id(66727505368031171)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33621955073448986)
,p_view_id=>wwv_flow_api.id(66727627951031180)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(33486723594501542)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66728491393031203)
,p_view_id=>wwv_flow_api.id(66727627951031180)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(66327254082871851)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66728983006031216)
,p_view_id=>wwv_flow_api.id(66727627951031180)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(66721582828026402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66729532569031218)
,p_view_id=>wwv_flow_api.id(66727627951031180)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66721719309026403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66730008263031220)
,p_view_id=>wwv_flow_api.id(66727627951031180)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(66721822111026404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66730538601031222)
,p_view_id=>wwv_flow_api.id(66727627951031180)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66721970670026405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66730983342031224)
,p_view_id=>wwv_flow_api.id(66727627951031180)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(66722071397026406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66731936037031228)
,p_view_id=>wwv_flow_api.id(66727627951031180)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(66722187803026408)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66732971508031231)
,p_view_id=>wwv_flow_api.id(66727627951031180)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(66722444471026410)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66722634411026412)
,p_plug_name=>'Consulta Novedades Personas'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct',
'    a.nmro_acto,a.fcha,a.cdgo_acto_orgen,d.idntfccion_sjto,e.nmbre_impsto,e.dscrpcion_sjto_estdo,',
'    a.id_acto,a.id_dcmnto,a.id_acto_tpo,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join v_si_g_novedades_persona        d on d.id_acto = a.id_acto',
'join v_si_i_sujetos_impuesto         e on e.idntfccion_sjto = d.idntfccion_Sjto and e.id_impsto = d.id_impsto',
'where(a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and ((a.file_blob is null or dbms_lob.getlength(a.file_blob) <= 5000) or (a.file_bfile is null and dbms_lob.getlength(a.file_bfile) <= 5000))',
'  and :P100_ACTOS_RGNRDOS = ''N''',
'  ',
'union',
'',
'select  distinct',
'    a.nmro_acto,a.fcha,a.cdgo_acto_orgen,d.idntfccion_sjto,e.nmbre_impsto,e.dscrpcion_sjto_estdo,',
'    a.id_acto,a.id_dcmnto,a.id_acto_tpo,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join v_si_g_novedades_persona        d on d.id_acto          = a.id_acto',
'join v_si_i_sujetos_impuesto         e on e.idntfccion_sjto  = d.idntfccion_Sjto and e.id_impsto = d.id_impsto',
'join gn_g_regenerar_actos_traza      f on f.id_acto          = a.id_acto',
'where(a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and :P100_ACTOS_RGNRDOS = ''Y'';',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''NPR''',
'  and :P100_ACTOS_RGNRDOS = ''N'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66722801942026414)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(66722916331026415)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66723017235026416)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66723187508026418)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66723351800026419)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66723379466026420)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66723498201026421)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66723653781026422)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66723684364026423)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66723894879026425)
,p_name=>unistr('Identificaci\00F3n')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(66722699252026413)
,p_internal_uid=>66722699252026413
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(66773356452417284)
,p_interactive_grid_id=>wwv_flow_api.id(66722699252026413)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(66773427182417290)
,p_report_id=>wwv_flow_api.id(66773356452417284)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66773867436417319)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(66722801942026414)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66774306374417326)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(66722916331026415)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66774798547417329)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66723017235026416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66775370491417347)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66723187508026418)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66775831780417349)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66723351800026419)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66776340303417352)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(66723379466026420)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66776832498417360)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(66723498201026421)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66777337559417362)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(66723653781026422)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66777828909417364)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(66723684364026423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66778801150417368)
,p_view_id=>wwv_flow_api.id(66773427182417290)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(66723894879026425)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66929637548625717)
,p_plug_name=>unistr('Consulta Fiscalizaci\00F3n Regenerados')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'    a.id_fsclzcion_expdnte,',
'    b.id_fsclzcion_expdnte_acto,',
'    d.fcha,',
'    a.id_instncia_fljo,',
'    d.nmro_acto,',
'    b.id_acto_tpo,',
'    g.dscrpcion,',
'    b.id_acto,',
'    f.nmbre_clnte,',
'    f.idntfccion_sjto,',
'    f.Email,',
'    f.nmbre_impsto,',
'    f.DSCRPCION_SJTO_ESTDO,',
'    ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF,',
'    d.cdgo_acto_orgen',
'from fi_g_fiscalizacion_expdnte      a',
'join fi_g_fsclzcion_expdnte_acto     b on b.id_fsclzcion_expdnte  = a.id_fsclzcion_expdnte',
'join fi_g_candidatos                 c on c.id_cnddto             = a.id_cnddto',
'join v_si_i_sujetos_impuesto         f on c.id_sjto_impsto        = f.id_sjto_impsto',
'join v_gn_g_actos                    d on d.id_acto               = b.id_acto',
'join gn_g_regenerar_actos_traza      e on e.id_acto               = b.id_acto and e.id_acto_tpo = d.id_acto_tpo',
'join gn_d_actos_tipo                 g on g.id_acto_tpo           = b.id_acto_tpo',
'where(d.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and d.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and d.cdgo_acto_orgen = ''FISCA''',
'  and(trunc(d.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and(trunc(e.fcha_rgnrar) between to_date(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') and  to_date(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') or :P100_FCHA_INCIO_RGNRA is null or :P100_FCHA_FIN_RGNRA is null)',
'  and :P100_ACTOS_RGNRDOS = ''Y'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''FISCA''',
'  and :P100_ACTOS_RGNRDOS = ''Y'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66929822686625719)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66929895885625720)
,p_name=>'ID_FSCLZCION_EXPDNTE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE_ACTO'
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
 p_id=>wwv_flow_api.id(66930031085625721)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66930213364625723)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66930329456625724)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66930468644625725)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66930496766625726)
,p_name=>'NMBRE_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CLNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66930646859625727)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Identificacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(66930699831625728)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>320
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
 p_id=>wwv_flow_api.id(66930831107625729)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(66930961273625730)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66931067599625731)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'PDF'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66931107186625732)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66931226666625733)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
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
 p_id=>wwv_flow_api.id(67023963637548408)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(66929679037625718)
,p_internal_uid=>66929679037625718
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
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
 p_id=>wwv_flow_api.id(66976065743814724)
,p_interactive_grid_id=>wwv_flow_api.id(66929679037625718)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(66976088863814725)
,p_report_id=>wwv_flow_api.id(66976065743814724)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66976658112814733)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(66929822686625719)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66977117575814737)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(66929895885625720)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66977622448814739)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66930031085625721)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66978586983814743)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66930213364625723)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66979133970814745)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(66930329456625724)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66979591087814747)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(66930468644625725)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66980162253814748)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(66930496766625726)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66980594072814750)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(66930646859625727)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66981112935814752)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(66930699831625728)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66981641536814754)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(66930831107625729)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66982168457814756)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(66930961273625730)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66982590772814758)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(66931067599625731)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66983162963814764)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(66931107186625732)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66983663158814766)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(66931226666625733)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67039087585228416)
,p_view_id=>wwv_flow_api.id(66976088863814725)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(67023963637548408)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66931355211625734)
,p_plug_name=>'consulta juridico regenerados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct',
'    d.id_instncia_fljo,a.nmro_acto,a.fcha,d.idntfccion,e.nmbre_impsto,a.cdgo_acto_orgen,e.dscrpcion_sjto_estdo,',
'    a.id_acto,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join v_cb_g_procesos_jrdco_dcmnto    d on d.id_acto         = a.id_acto and d.id_acto_tpo = a.id_acto_tpo',
'join cb_g_procesos_jrdco_mvmnto      b on b.ID_PRCSOS_JRDCO = d.ID_PRCSOS_JRDCO',
'join v_si_i_sujetos_impuesto         e on e.id_sjto         = d.id_sjto and e.idntfccion_sjto = d.idntfccion and e.id_impsto = b.id_impsto',
'join gn_g_regenerar_actos_traza      f on f.id_acto         = a.id_acto and f.id_acto_tpo     = a.id_acto_tpo ',
'where(a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.cdgo_acto_orgen = ''GCB''',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and(trunc(f.fcha_rgnrar) between to_date(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') and  to_date(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') or :P100_FCHA_INCIO_RGNRA is null or :P100_FCHA_FIN_RGNRA is null)',
'  and :P100_ACTOS_RGNRDOS = ''Y'';',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''GCB''',
'  and :P100_ACTOS_RGNRDOS = ''Y'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66931506282625736)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(66931647916625737)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(66931760630625738)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(66931862331625739)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66931907477625740)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66932046365625741)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66932104777625742)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66932247445625743)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66932308407625744)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(66931396973625735)
,p_internal_uid=>66931396973625735
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(66986163230830659)
,p_interactive_grid_id=>wwv_flow_api.id(66931396973625735)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(66986267033830659)
,p_report_id=>wwv_flow_api.id(66986163230830659)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66987561029830664)
,p_view_id=>wwv_flow_api.id(66986267033830659)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(66931506282625736)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66988063200830666)
,p_view_id=>wwv_flow_api.id(66986267033830659)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(66931647916625737)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66988573706830668)
,p_view_id=>wwv_flow_api.id(66986267033830659)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66931760630625738)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66988999343830669)
,p_view_id=>wwv_flow_api.id(66986267033830659)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(66931862331625739)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66989511755830671)
,p_view_id=>wwv_flow_api.id(66986267033830659)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66931907477625740)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66989995367830672)
,p_view_id=>wwv_flow_api.id(66986267033830659)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(66932046365625741)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66990558624830676)
,p_view_id=>wwv_flow_api.id(66986267033830659)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(66932104777625742)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66991061535830678)
,p_view_id=>wwv_flow_api.id(66986267033830659)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(66932247445625743)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66991550750830679)
,p_view_id=>wwv_flow_api.id(66986267033830659)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(66932308407625744)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66932379502625745)
,p_plug_name=>'Consulta Medidas Cautelares Regeneradas'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct',
'    a.nmro_acto,a.fcha,a.cdgo_acto_orgen,d.idntfccion,e.nmbre_impsto,e.dscrpcion_sjto_estdo,',
'    a.id_acto,a.id_dcmnto,a.id_acto_tpo,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join v_mc_g_embargos_resolucion      d on d.id_acto         = a.id_acto',
'join v_si_i_sujetos_impuesto         e on e.idntfccion_sjto = d.idntfccion',
'join gn_g_regenerar_actos_traza      f on f.id_acto         = a.id_acto',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and  a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and (trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and(trunc(f.fcha_rgnrar) between to_date(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') and  to_date(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') or :P100_FCHA_INCIO_RGNRA is null or :P100_FCHA_FIN_RGNRA is null)',
'  and :P100_ACTOS_RGNRDOS = ''Y''',
'union ',
'',
'select  distinct',
'    a.nmro_acto,a.fcha,a.cdgo_acto_orgen,d.idntfccion',
'    ,e.nmbre_impsto,e.dscrpcion_sjto_estdo,',
'    a.id_acto,a.id_dcmnto,a.id_acto_tpo,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'left join v_mc_g_desembargos_resolucion      d on d.id_acto          = a.id_acto',
'join v_si_i_sujetos_impuesto                 e on e.idntfccion_sjto  = d.idntfccion',
'join gn_g_regenerar_actos_traza              f on f.id_acto          = a.id_acto',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and  a.id_acto_tpo  = :P100_ID_ACTO_TPO',
'  and (trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and(trunc(f.fcha_rgnrar) between to_date(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') and  to_date(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') or :P100_FCHA_INCIO_RGNRA is null or :P100_FCHA_FIN_RGNRA is null)',
'  and :P100_ACTOS_RGNRDOS = ''Y'' ',
'  ',
'  ',
' /*',
'  WITH base_query AS (',
'    SELECT distinct',
'        a.nmro_acto, a.fcha, a.cdgo_acto_orgen, d.idntfccion,',
'        e.nmbre_impsto, e.dscrpcion_sjto_estdo, --a.id_acto, ',
'        a.id_dcmnto, a.id_acto_tpo, ',
'        ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'    FROM v_gn_g_actos a',
'    JOIN v_mc_g_embargos_resolucion d ON d.id_acto = a.id_acto',
'    JOIN v_si_i_sujetos_impuesto         e ON e.idntfccion_sjto = d.idntfccion',
'    JOIN gn_g_regenerar_actos_traza      f ON f.id_acto = a.id_acto',
'    WHERE a.id_acto_tpo = :P100_ID_ACTO_TPO',
'      AND (a.nmro_acto = :P100_NMRO_ACTO OR :P100_NMRO_ACTO IS NULL)',
'      AND trunc(a.fcha) BETWEEN ',
'            NVL(TO_DATE(:P100_FCHA_INCIO,''dd/mm/yy''), TO_DATE(''01/01/''||EXTRACT(YEAR FROM SYSDATE), ''dd/mm/yyyy'')) ',
'            AND NVL(TO_DATE(:P100_FCHA_FIN,''dd/mm/yy''), TO_DATE(''31/12/''||EXTRACT(YEAR FROM SYSDATE), ''dd/mm/yyyy''))',
'      AND (trunc(f.fcha_rgnrar) BETWEEN TO_DATE(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') AND TO_DATE(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') ',
'            OR :P100_FCHA_INCIO_RGNRA IS NULL OR :P100_FCHA_FIN_RGNRA IS NULL)',
'      AND :P100_ACTOS_RGNRDOS = ''Y''',
'),',
'final_query AS (',
'    SELECT * FROM base_query',
'    UNION ALL',
'    SELECT distinct',
'        a.nmro_acto, a.fcha, a.cdgo_acto_orgen, d.idntfccion,',
'        e.nmbre_impsto, e.dscrpcion_sjto_estdo, --a.id_acto, ',
'        a.id_dcmnto, a.id_acto_tpo, ',
'        ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'    FROM v_gn_g_actos a',
'    JOIN v_mc_g_desembargos_resolucion      d ON d.id_acto = a.id_acto',
'    JOIN v_si_i_sujetos_impuesto            e ON e.idntfccion_sjto = d.idntfccion',
'    JOIN gn_g_regenerar_actos_traza         f ON f.id_acto = a.id_acto',
'    WHERE a.id_acto_tpo = :P100_ID_ACTO_TPO',
'      AND (a.nmro_acto = :P100_NMRO_ACTO OR :P100_NMRO_ACTO IS NULL)',
'      AND trunc(a.fcha) BETWEEN ',
'            NVL(TO_DATE(:P100_FCHA_INCIO,''dd/mm/yy''), TO_DATE(''01/01/''||EXTRACT(YEAR FROM SYSDATE), ''dd/mm/yyyy'')) ',
'            AND NVL(TO_DATE(:P100_FCHA_FIN,''dd/mm/yy''), TO_DATE(''31/12/''||EXTRACT(YEAR FROM SYSDATE), ''dd/mm/yyyy''))',
'      AND (trunc(f.fcha_rgnrar) BETWEEN TO_DATE(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') AND TO_DATE(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') ',
'            OR :P100_FCHA_INCIO_RGNRA IS NULL OR :P100_FCHA_FIN_RGNRA IS NULL)',
'      AND :P100_ACTOS_RGNRDOS = ''Y''',
')',
'SELECT DISTINCT * FROM final_query;*/'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''MCT''',
'  and :P100_ACTOS_RGNRDOS = ''Y'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33486841367501543)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(66932674746625747)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66932690964625748)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66932875613625749)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66932955784625750)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(66933000279625751)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(67023323952548402)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67023509870548404)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67023651043548405)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67023767633548406)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(66932562799625746)
,p_internal_uid=>66932562799625746
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(67029417566557204)
,p_interactive_grid_id=>wwv_flow_api.id(66932562799625746)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(67029477985557209)
,p_report_id=>wwv_flow_api.id(67029417566557204)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33623443955578256)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(33486841367501543)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67029994161557223)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(66932674746625747)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67030503940557230)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(66932690964625748)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67030978004557233)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66932875613625749)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67031523833557234)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(66932955784625750)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67032047766557236)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66933000279625751)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67032501161557238)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(67023323952548402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67033528144557242)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(67023509870548404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67033982392557243)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(67023651043548405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67034557396557246)
,p_view_id=>wwv_flow_api.id(67029477985557209)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(67023767633548406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67024045394548409)
,p_plug_name=>'Consulta Convenios Regenerados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select  ',
'    a.nmro_acto,a.fcha,d.idntfccion_sjto,e.nmbre_impsto,a.cdgo_acto_orgen,e.dscrpcion_sjto_estdo,',
'    a.id_acto,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos                a',
'join v_gf_g_convenios            d on d.id_acto      = a.id_acto',
'join gn_d_plantillas             c on c.id_acto_tpo  = a.id_acto_tpo',
'join gn_d_reportes               b on b.id_rprte     = c.id_rprte',
'join v_si_i_sujetos_impuesto     e on e.id_sjto      = d.id_sjto ',
'join gn_g_regenerar_actos_traza  f on f.id_acto      = a.id_acto',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and :P100_ACTOS_RGNRDOS = ''Y'';*/',
'select  ',
'    a.nmro_acto,a.fcha,d.idntfccion_sjto,e.nmbre_impsto,a.cdgo_acto_orgen,e.dscrpcion_sjto_estdo,',
'    a.id_acto,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos                a',
'join v_gf_g_convenios            d on d.id_acto      = a.id_acto',
'join gn_d_plantillas             c on c.id_acto_tpo  = a.id_acto_tpo',
'join gn_d_reportes               b on b.id_rprte     = c.id_rprte',
'join v_si_i_sujetos_impuesto     e on e.id_sjto      = d.id_sjto ',
'join gn_g_regenerar_actos_traza  f on f.id_acto      = a.id_acto and f.id_acto_tpo  = a.id_acto_tpo',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and(trunc(f.fcha_rgnrar) between to_date(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') and  to_date(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') or :P100_FCHA_INCIO_RGNRA is null or :P100_FCHA_FIN_RGNRA is null)',
'  and :P100_ACTOS_RGNRDOS = ''Y'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''CNV''',
'  and :P100_ACTOS_RGNRDOS = ''Y'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67024229507548411)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(67024306308548412)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
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
 p_id=>wwv_flow_api.id(67024430713548413)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67024531259548414)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(67024586544548415)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67024744480548416)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67024838569548417)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67024922456548418)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(67024113860548410)
,p_internal_uid=>67024113860548410
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(67053313063363736)
,p_interactive_grid_id=>wwv_flow_api.id(67024113860548410)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(67053440177363746)
,p_report_id=>wwv_flow_api.id(67053313063363736)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67054672326363761)
,p_view_id=>wwv_flow_api.id(67053440177363746)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(67024229507548411)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67055095705363770)
,p_view_id=>wwv_flow_api.id(67053440177363746)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67024306308548412)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67055589220363772)
,p_view_id=>wwv_flow_api.id(67053440177363746)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(67024430713548413)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67056102518363773)
,p_view_id=>wwv_flow_api.id(67053440177363746)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(67024531259548414)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67056650116363775)
,p_view_id=>wwv_flow_api.id(67053440177363746)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(67024586544548415)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67057161509363776)
,p_view_id=>wwv_flow_api.id(67053440177363746)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(67024744480548416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67057597408363784)
,p_view_id=>wwv_flow_api.id(67053440177363746)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(67024838569548417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67058110081363787)
,p_view_id=>wwv_flow_api.id(67053440177363746)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(67024922456548418)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67025012398548419)
,p_plug_name=>unistr('Consulta Prescripci\00F3n Regenerados')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select  distinct',
'    a.nmro_acto,a.fcha,f.idntfccion,f.nmbre_impsto,a.cdgo_acto_orgen,e.dscrpcion_sjto_estdo,',
'    a.id_acto,d.id_dcmnto,a.id_acto_tpo,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join gf_g_prscrpcns_dcmnto      d on d.id_acto          = a.id_acto',
'join v_gf_g_prescripciones      g on g.id_prscrpcion    = d.id_prscrpcion',
'join v_pq_g_solicitudes         f on f.id_slctud        = g.id_slctud',
'join gn_d_plantillas            c on c.id_acto_tpo      = a.id_acto_tpo',
'join gn_d_reportes              b on b.id_rprte         = c.id_rprte',
'join v_si_i_sujetos_impuesto    e on e.idntfccion_sjto  = f.idntfccion',
'join gn_g_regenerar_actos_traza h on h.id_acto          = a.id_acto',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and(trunc(h.fcha_rgnrar) between to_date(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') and  to_date(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') or :P100_FCHA_INCIO_RGNRA is null or :P100_FCHA_FIN_RGNRA is null)',
'  and :P100_ACTOS_RGNRDOS = ''Y'';*/',
'',
'select  distinct',
'    a.nmro_acto,a.fcha,f.idntfccion,f.nmbre_impsto,a.cdgo_acto_orgen,e.dscrpcion_sjto_estdo,',
'    a.id_acto,d.id_dcmnto,a.id_acto_tpo,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join gf_g_prscrpcns_dcmnto      d on d.id_acto          = a.id_acto',
'join v_gf_g_prescripciones      g on g.id_prscrpcion    = d.id_prscrpcion',
'join v_pq_g_solicitudes         f on f.id_slctud        = g.id_slctud',
'join v_si_i_sujetos_impuesto    e on e.idntfccion_sjto  = f.idntfccion',
'join gn_g_regenerar_actos_traza h on h.id_acto          = a.id_acto',
'where (a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo  = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and(trunc(h.fcha_rgnrar) between to_date(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') and  to_date(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') or :P100_FCHA_INCIO_RGNRA is null or :P100_FCHA_FIN_RGNRA is null)',
'  and :P100_ACTOS_RGNRDOS = ''Y'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''PRS''',
'  and :P100_ACTOS_RGNRDOS = ''Y'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67025199574548421)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(67025334456548422)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
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
 p_id=>wwv_flow_api.id(67025453816548423)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(67025567249548424)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(67025598195548425)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67025708829548426)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67025857297548427)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67025971751548428)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67026063370548429)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67026132344548430)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(67025167326548420)
,p_internal_uid=>67025167326548420
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(67066632948685915)
,p_interactive_grid_id=>wwv_flow_api.id(67025167326548420)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(67066682118685916)
,p_report_id=>wwv_flow_api.id(67066632948685915)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67067992376685927)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(67025199574548421)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67068436566685954)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67025334456548422)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67068970125685956)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(67025453816548423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67069406262685976)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(67025567249548424)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67069899003685980)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(67025598195548425)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67070435578685982)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(67025708829548426)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67070920546685983)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(67025857297548427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67071380846685985)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(67025971751548428)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67071906444685987)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(67026063370548429)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67072391303686003)
,p_view_id=>wwv_flow_api.id(67066682118685916)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(67026132344548430)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67026180424548431)
,p_plug_name=>'Consulta Novedades Personas regeneradas'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct',
'    a.nmro_acto,a.fcha,a.cdgo_acto_orgen,d.idntfccion_sjto,e.nmbre_impsto,e.dscrpcion_sjto_estdo,',
'    a.id_acto,a.id_dcmnto,a.id_acto_tpo,''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from v_gn_g_actos a',
'join v_si_g_novedades_persona        d on d.id_acto          = a.id_acto',
'join v_si_i_sujetos_impuesto         e on e.idntfccion_sjto  = d.idntfccion_Sjto and e.id_impsto = d.id_impsto',
'join gn_g_regenerar_actos_traza      f on f.id_acto          = a.id_acto',
'where(a.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and a.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and(trunc(a.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and(trunc(f.fcha_rgnrar) between to_date(:P100_FCHA_INCIO_RGNRA,''dd/mm/yy'') and  to_date(:P100_FCHA_FIN_RGNRA,''dd/mm/yy'') or :P100_FCHA_INCIO_RGNRA is null or :P100_FCHA_FIN_RGNRA is null)',
'  and :P100_ACTOS_RGNRDOS = ''Y'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''NPR''',
'  and :P100_ACTOS_RGNRDOS = ''Y'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67026476738548433)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(67026562141548434)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
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
 p_id=>wwv_flow_api.id(67026589064548435)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67026703237548436)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(67026811302548437)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67026977206548438)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67027019046548439)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67027099970548440)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67027226622548441)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,ID_ACTO,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67027342604548442)
,p_name=>unistr('Identificaci\00F3n')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(67026291197548432)
,p_internal_uid=>67026291197548432
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(67074014073710795)
,p_interactive_grid_id=>wwv_flow_api.id(67026291197548432)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(67074142417710795)
,p_report_id=>wwv_flow_api.id(67074014073710795)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67074612092710801)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(67026476738548433)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67075176124710804)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67026562141548434)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67075676602710817)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(67026589064548435)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67076106077710823)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(67026703237548436)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67076580479710825)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(67026811302548437)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67077128650710827)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(67026977206548438)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67077549889710829)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(67027019046548439)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67078074371710830)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(67027099970548440)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67078481270710832)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(67027226622548441)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67079052719710835)
,p_view_id=>wwv_flow_api.id(67074142417710795)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(67027342604548442)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120246843705728835)
,p_plug_name=>'Consultar Acto'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120248594104728853)
,p_plug_name=>unistr('Consulta Fiscalizaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_fsclzcion_expdnte,',
'    b.id_fsclzcion_expdnte_acto,',
'    d.fcha,',
'    a.id_instncia_fljo,',
'    d.nmro_acto,',
'    b.id_acto_tpo,',
'    g.dscrpcion,',
'    b.id_acto,',
'    f.nmbre_clnte,',
'    f.idntfccion_sjto,',
'    f.Email,',
'    f.nmbre_impsto,',
'    f.DSCRPCION_SJTO_ESTDO,',
'    ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF,',
'    d.cdgo_acto_orgen',
'from fi_g_fiscalizacion_expdnte      a',
'join fi_g_fsclzcion_expdnte_acto     b on b.id_fsclzcion_expdnte  = a.id_fsclzcion_expdnte',
'join fi_g_candidatos                 c on c.id_cnddto             = a.id_cnddto',
'join v_si_i_sujetos_impuesto         f on c.id_sjto_impsto        = f.id_sjto_impsto',
'join v_gn_g_actos                    d on d.id_acto               = b.id_acto',
'join gn_d_actos_tipo                 g on g.id_acto_tpo           = b.id_acto_tpo',
'where(d.nmro_acto   = :P100_NMRO_ACTO  or :P100_NMRO_ACTO is null)',
'  and d.id_acto_tpo = :P100_ID_ACTO_TPO',
'  and d.cdgo_acto_orgen = ''FISCA''',
'  and(trunc(d.fcha) between nvl(to_date(:P100_FCHA_INCIO,''dd/mm/yy''),''01/01/''|| extract(year from sysdate)) and  nvl(to_date(:P100_FCHA_FIN,''dd/mm/yy''),''31/12/''|| extract(year from sysdate)))',
'  and ((d.file_blob is null or dbms_lob.getlength(d.file_blob) <= 5000) or (d.file_bfile is null and dbms_lob.getlength(d.file_bfile) <= 5000))',
'  and :P100_ACTOS_RGNRDOS = ''N'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_gn_g_actos',
'where id_acto_tpo = :P100_ID_ACTO_TPO',
'  and cdgo_acto_orgen = ''FISCA''',
'  and :P100_ACTOS_RGNRDOS = ''N'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66322282300871802)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66724206705026428)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YY'
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
 p_id=>wwv_flow_api.id(67023837790548407)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(120248818258728855)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
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
 p_id=>wwv_flow_api.id(120447811542089406)
,p_name=>'ID_FSCLZCION_EXPDNTE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(120447927925089407)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(120448103445089409)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(120448222709089410)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(120448329657089411)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(120448400414089412)
,p_name=>'NMBRE_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CLNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(120448538247089413)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Identificacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(120448583685089414)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>320
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
 p_id=>wwv_flow_api.id(120448681265089415)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(120448844044089416)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(120448952801089417)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'PDF'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(120248678189728854)
,p_internal_uid=>120248678189728854
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
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
 p_id=>wwv_flow_api.id(120453745055091315)
,p_interactive_grid_id=>wwv_flow_api.id(120248678189728854)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(120453871486091316)
,p_report_id=>wwv_flow_api.id(120453745055091315)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66328424721872453)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(66322282300871802)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66785444983798650)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66724206705026428)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67037723072223674)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67023837790548407)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120454237861091317)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(120248818258728855)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120454692917091319)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(120447811542089406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120455258966091320)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(120447927925089407)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120456214629091324)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(120448103445089409)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120456688429091327)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(120448222709089410)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120457231007091328)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(120448329657089411)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120457719584091330)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(120448400414089412)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120458209402091331)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(120448538247089413)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120458700828091333)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(120448583685089414)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120459255041091335)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(120448681265089415)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120459709570091336)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(120448844044089416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120460219042091338)
,p_view_id=>wwv_flow_api.id(120453871486091316)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(120448952801089417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120449012994089418)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Opciones <i class="fa fa-gear" aria-hidden="true"></i></center></b></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120449095931089419)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i><p>Funcionalidad que permite realizar una consulta de actos asociado a un numero de acto y procesar en caso que el acto presente inconvenientes de visualizacion para generarlo nuevamente.</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dirijase al Manual de Usuario.</p>'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33594512884047100)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(120246843705728835)
,p_button_name=>'BTN_CNSLTAR_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33605286650047155)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(120449012994089418)
,p_button_name=>'BNT_PRCSAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'<b>Procesar</b>'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P100_ACTOS_RGNRDOS'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-window'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33594900860047114)
,p_name=>'P100_NMRO_ACTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(120246843705728835)
,p_prompt=>'Numero Acto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33595296008047137)
,p_name=>'P100_ACTOS_RGNRDOS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(120246843705728835)
,p_prompt=>'Actos Regenerados'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33595686693047137)
,p_name=>'P100_FCHA_INCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(120246843705728835)
,p_prompt=>'Fecha incio acto'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-00:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33596088982047137)
,p_name=>'P100_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(120246843705728835)
,p_prompt=>'Fecha fin acto'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-00:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33596440702047137)
,p_name=>'P100_FCHA_INCIO_RGNRA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(120246843705728835)
,p_prompt=>unistr('Fecha inicio regeneraci\00F3n')
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-00:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33596818852047138)
,p_name=>'P100_FCHA_FIN_RGNRA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(120246843705728835)
,p_prompt=>unistr('Fecha fin regeneraci\00F3n')
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-00:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33597248682047138)
,p_name=>'P100_CDGO_ACTO_ORGEN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(120246843705728835)
,p_prompt=>'Origen del Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct a.dscrpcion,a.cdgo_acto_orgen',
'from gn_d_actos_origen a',
'join gn_g_actos b on b.cdgo_acto_orgen = a.cdgo_acto_orgen',
'join gn_d_actos_tipo    c on c.id_acto_tpo = b.id_acto_tpo and c.indcdor_rgnra_acto = ''S'';'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'55%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33597606257047139)
,p_name=>'P100_ID_ACTO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(120246843705728835)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct a.dscrpcion   as d, a.id_acto_tpo          as r',
'  from gn_d_actos_tipo a ',
'  join v_gn_g_actos      b on a.id_acto_tpo = b.id_acto_tpo',
' where a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and b.cdgo_acto_orgen = :P100_CDGO_ACTO_ORGEN',
'   and a.indcdor_rgnra_acto =''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P100_CDGO_ACTO_ORGEN'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'55%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33606093907047184)
,p_validation_name=>'Validar campos Nulos'
,p_validation_sequence=>10
,p_validation=>' :P100_ID_ACTO_TPO is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe asignar un valor'
,p_always_execute=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33606458065047191)
,p_validation_name=>'al seleccionar fecha inicial'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM dual',
'WHERE   extract(year from sysdate) <> extract(year from to_date(:P100_FCHA_INCIO,''dd/mm/yyyy''));'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'La fecha inicial seleccionada esta fuera del rango permitido!'
,p_validation_condition=>'P100_FCHA_INCIO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(33595686693047137)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33606833483047191)
,p_validation_name=>'al seleccionar fecha_final'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM dual',
'WHERE   extract(year from sysdate) <> extract(year from to_date(:P100_FCHA_FIN,''dd/mm/yyyy''));'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'La fecha final seleccionada esta fuera del rango permitido!'
,p_validation_condition=>'P100_FCHA_FIN'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(33596088982047137)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33607945935047195)
,p_name=>'al dar click al btn_procesar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33605286650047155)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33608400010047211)
,p_event_id=>wwv_flow_api.id(33607945935047195)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var nmro_acto = $v(''P100_NMRO_ACTO'');',
'',
'if (nmro_acto === null || nmro_acto === '''') {',
'',
unistr('    apex.message.confirm( "Este proceso puede durar algunos minutos, se notificar\00E1 a su correo cuando finalice", function( okPressed ) {'),
'        if( okPressed ) {',
'            apex.submit(''BNT_PRCSAR'');',
'        }',
'    });',
'} else {',
unistr('    // Hacer submit con el nombre del bot\00F3n asociado (BTN_PRCSAR en este caso)'),
unistr('    apex.message.confirm( "\00BFSeguro que desea continuar con el proceso?", function( okPressed ) {'),
'        if( okPressed ) {',
'            apex.submit(''BNT_PRCSAR'');',
'        }',
'    });',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33608812495047217)
,p_name=>'al seleccionar actos_rgnrados'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_ACTOS_RGNRDOS'
,p_condition_element=>'P100_ACTOS_RGNRDOS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33609337511047218)
,p_event_id=>wwv_flow_api.id(33608812495047217)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P100_FCHA_INCIO_RGNRA,P100_FCHA_FIN_RGNRA'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33609852114047218)
,p_event_id=>wwv_flow_api.id(33608812495047217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P100_FCHA_INCIO_RGNRA,P100_FCHA_FIN_RGNRA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2770330603310802)
,p_name=>'al digitar la fecha final'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_FCHA_FIN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2770418922310803)
,p_event_id=>wwv_flow_api.id(2770330603310802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P100_FCHA_FIN").datepicker(''option'' , ''minDate'' , $("#P100_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33607514262047192)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Regenerar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_acto        VARCHAR2(100)  := :P100_NMRO_ACTO;',
'    v_cdgo_clnte       NUMBER         := :F_CDGO_CLNTE;',
'    v_id_acto_tpo      NUMBER         := :P100_ID_ACTO_TPO;',
'    v_fcha_incio       date           := :P100_fcha_incio;',
'    v_fcha_fin         date           := :P100_fcha_fin;',
'    v_estdo_prcso      number;',
'    v_cdgo_rspsta      NUMBER;',
'    v_mnsje_rspsta     VARCHAR2(4000);',
'begin',
'    if(v_nmro_acto is not null) then',
unistr('        --regeneraci\00F3n puntual'),
'        begin',
'            pkg_gn_regenerar_actos.prc_rdstrbccion_tpo_acto(    p_nmro_acto         => v_nmro_acto,',
'                                                                p_cdgo_clnte        => v_cdgo_clnte,',
'                                                                p_id_acto_tpo       => v_id_acto_tpo,',
'                                                                p_fcha_incio        => to_char(v_fcha_incio,''YYYYMMDD''),',
'                                                                p_fcha_fin          => to_char(v_fcha_fin,''YYYYMMDD''),',
'                                                                p_id_usrio          => :F_ID_USRIO,',
'                                                                p_cdgo_acto_origen  => :P100_CDGO_ACTO_ORGEN,',
'                                                                o_cdgo_rspsta       => v_cdgo_rspsta,',
'                                                                o_mnsje_rspsta      => v_mnsje_rspsta',
'                                                            );',
'',
'            if v_cdgo_rspsta != 0 then',
'                raise_application_error(-20001, v_mnsje_rspsta);',
'            end if;',
'        end;',
'    else ',
'        ',
unistr('        -- aqui se inserta a la cola de petici\00F3n del job'),
'        begin',
'            insert into gn_g_cola_ptcnes_rgnra_acto(nmro_acto   ,cdgo_clnte              ,id_acto_tpo    ,fcha_incio     ,fcha_fin   ,',
'                                                    id_usrio    ,cdgo_acto_origen       ,estado) ',
'                                            values (v_nmro_acto ,v_cdgo_clnte           ,v_id_acto_tpo  ,v_fcha_incio   ,v_fcha_fin ,',
'                                                    :F_ID_USRIO ,:P100_CDGO_ACTO_ORGEN  ,''PENDIENTE'');',
'        exception',
'            when others then',
'                v_cdgo_rspsta := 99;',
'                v_mnsje_rspsta := ''error al agregar la cola de proceso!!'';',
'                raise_application_error(-20001, v_mnsje_rspsta);',
'        end;',
'        ',
'        if v_cdgo_rspsta = 0 then',
'            commit;',
'        end if;',
'        ',
'        select count(*) ',
'        into v_estdo_prcso',
'        from gn_g_cola_ptcnes_rgnra_acto ',
'        where estado = ''EN_PROCESO'';',
'        ',
'        if(v_estdo_prcso = 0) then',
unistr('            --aqui se llama al job en caso de que se requiera regeneraci\00F3n masiva'),
'            BEGIN',
'                DBMS_SCHEDULER.set_attribute( name => ''IT_GN_REGENERAR_ACTOS'', attribute => ''job_action'', value => ''pkg_gn_regenerar_actos.prc_rdstrbccion_tpo_acto'');',
'',
'                DBMS_SCHEDULER.set_attribute( name => ''IT_GN_REGENERAR_ACTOS'', attribute => ''number_of_arguments'', value => ''9'');',
'',
'                DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_REGENERAR_ACTOS'', argument_position => 1, argument_value => v_nmro_acto);',
'                DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_REGENERAR_ACTOS'', argument_position => 2, argument_value => v_cdgo_clnte);',
'                DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_REGENERAR_ACTOS'', argument_position => 3, argument_value => v_id_acto_tpo);',
'                DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_REGENERAR_ACTOS'', argument_position => 4, argument_value => to_char(v_fcha_incio,''YYYYMMDD''));',
'                DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_REGENERAR_ACTOS'', argument_position => 5, argument_value => to_char(v_fcha_fin,''YYYYMMDD''));',
'                DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_REGENERAR_ACTOS'', argument_position => 6, argument_value => :F_ID_USRIO);',
'                DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_REGENERAR_ACTOS'', argument_position => 7, argument_value => :P100_CDGO_ACTO_ORGEN);',
'                DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_REGENERAR_ACTOS'', argument_position => 8, argument_value => NULL);',
'                DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GN_REGENERAR_ACTOS'', argument_position => 9, argument_value => NULL);',
'                DBMS_SCHEDULER.ENABLE(''IT_GN_REGENERAR_ACTOS'');',
'            END; ',
'        end if; ',
'         ',
'     end if;',
'     if v_cdgo_rspsta != 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'     else',
'      commit;',
'     end if;',
'     ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BNT_PRCSAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
