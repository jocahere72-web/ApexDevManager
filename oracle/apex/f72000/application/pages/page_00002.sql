prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('Recepci\00F3n')
,p_step_title=>unistr('Recepci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerActo() { ',
'    var region = apex.region("actos"); ',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'           $s("P2_ID_ACTO",model.getValue(records[0], "ID_ACTO").trim());',
'           $s("P2_NMRO_ACTO",model.getValue(records[0], "NMRO_ACTO_DSPLAY").trim());',
'           $s("P2_FCHA_NTFCCION",model.getValue(records[0], "FCHA_NTFCCION").trim());',
'           //$s("P2_FCHA_OPTIMA",model.getValue(records[0], "FCHA_OPTIMA").trim());',
'           $s("P2_DFRNCIA_DIAS",model.getValue(records[0], "DFRNCIA_DIAS").trim());',
'           $s("P2_DSCRPCION_ACTO_TPO",model.getValue(records[0], "DSCRPCION_ACTO_TPO").trim());',
'        }',
'        else{',
'           $s("P2_ID_ACTO", null);',
'           $s("P2_NMRO_ACTO", null);',
'           $s("P2_FCHA_NTFCCION", null);',
'           //$s("P2_FCHA_OPTIMA", null);',
'           $s("P2_DFRNCIA_DIAS",null);',
'           $s("P2_DSCRPCION_ACTO_TPO", null);',
'            ',
'        }',
'   } ',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20231026011850'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74526819593108401)
,p_plug_name=>'Recurso'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83426994956068701)
,p_plug_name=>'Seleccionar Acto'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(72932069932094503)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75889247823350801)
,p_plug_name=>'Actos Notificados Disponibles'
,p_region_name=>'actos'
,p_parent_plug_id=>wwv_flow_api.id(83426994956068701)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto, dscrpcion_acto_orgen, dscrpcion_acto_tpo, nmro_acto_dsplay,fcha_ntfccion, fcha, fcha_optima,',
'       trunc(to_date(fcha_optima,''DD/MM/YYYY hh24:mi:ss''))-trunc(to_date(sysdate,''DD/MM/YYYY hh24:mi:ss'')) as dfrncia_dias',
'from(select  a.id_acto,',
'             a.dscrpcion_acto_orgen, ',
'             a.dscrpcion_acto_tpo, ',
'             a.nmro_acto nmro_acto_dsplay,',
'             --to_char(a.fcha_ntfccion,''dd/MM/yyyy'') fcha_ntfccion,',
'             /*case when b.cdgo_acto_tpo = ''AUI'' then',
'                (select to_char(w.fcha_ntfccion,''dd/MM/yyyy'') ',
'                   from gn_g_actos w',
'                  where w.id_acto_rqrdo_ntfccion = a.id_acto',
'                    and w.fcha_ntfccion is not null)',
'             else',
'                to_char(a.fcha_ntfccion,''dd/MM/yyyy'')',
'             end fcha_ntfccion,*/',
'             nvl(to_char(a.fcha_ntfccion,''dd/MM/yyyy''), (select to_char(w.fcha_ntfccion,''dd/MM/yyyy'') ',
'                                                           from gn_g_actos w',
'                                                          where w.id_acto_rqrdo_ntfccion = a.id_acto',
'                                                            and w.fcha_ntfccion is not null)) fcha_ntfccion,',
'             to_char(a.fcha,''dd/MM/yyyy'') fcha,',
'             a.anio,',
'             to_char(pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => a.cdgo_clnte, ',
'                                                           p_fecha_inicial => nvl(a.fcha_ntfccion, (select w.fcha_ntfccion from gn_g_actos w',
'                                                                                                     where w.id_acto_rqrdo_ntfccion = a.id_acto and w.fcha_ntfccion is not null)),--a.fcha_ntfccion, ',
'                                                           p_undad_drcion  => d.undad_drcion_pr, ',
'                                                           p_drcion        => d.drcion_pr, ',
'                                                           p_dia_tpo       => d.dia_tpo_pr),''dd/MM/yyyy'') as fcha_optima',
'             from v_gn_g_actos a',
'             /*PENDIENTE SUJETO IMPUESTO*/',
'             join gn_d_actos_tipo              b on b.id_acto_tpo = a.id_acto_tpo',
'             join v_wf_d_flujos_tarea          c on c.id_fljo_trea = :F_ID_FLJO_TREA',
'             join gj_d_recurso_tipo_acto_tipo  e on e.id_acto_tpo = b.id_acto_tpo',
'             join gj_d_recursos_tipo_cliente   d on d.id_rcrso_tipo_clnte = e.id_rcrso_tipo_clnte',
'             --join v_gj_d_recursos_tipo_cliente d on d.cdgo_clnte  = a.cdgo_clnte',
'                                                 --and c.cdgo_fljo  = d.cdgo_rcrso_tpo ',
'                                                 --and  d.id_rcrso_tipo_clnte = :P2_ID_RCRSO_TIPO_CLNTE',
'             where a.cdgo_clnte     = :F_CDGO_CLNTE and',
'                   (a.indcdor_ntfcdo = ''S'' or (a.indcdor_ntfcdo = ''N'' and b.cdgo_acto_tpo in (''AUI'',''AUR''))) and',
'                   a.id_acto_tpo in (select a.id_acto_tpo ',
'                                     from gj_d_recurso_tipo_acto_tipo a',
'                                     inner join gj_d_recursos_tipo_cliente b on a.id_rcrso_tipo_clnte = b.id_rcrso_tipo_clnte',
'                                     where b.cdgo_clnte  = :F_CDGO_CLNTE and',
'                                           b.actvo       = ''S'' and',
'                                           a.actvo       = ''S'') and',
'                   a.id_acto in (select a.id_acto ',
'                                   from v_gn_g_actos_sujeto_impuesto a',
'                                  where a.id_sjto_impsto in (select a.id_sjto_impsto',
'                                                               from pq_g_slctdes_mtvo_sjt_impst a',
'                                                               join v_pq_g_solicitudes_motivo b on a.id_slctud_mtvo = b.id_slctud_mtvo',
'                                                              where b.id_slctud = :P2_ID_SLCTUD',
'                                                            )',
'                                )',
'     )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos a',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75889557298350804)
,p_name=>'DSCRPCION_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen del Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75889602755350805)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75890158665350810)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75890432562350813)
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75932104858521203)
,p_name=>'FCHA_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_NTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77059772341299803)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Creaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77093931390405801)
,p_name=>'NMRO_ACTO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(142301220816958401)
,p_name=>'FCHA_OPTIMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OPTIMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(142301367148958402)
,p_name=>'DFRNCIA_DIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DFRNCIA_DIAS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(75889461280350803)
,p_internal_uid=>75889461280350803
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se hallaron actos'
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
 p_id=>wwv_flow_api.id(75904193650435191)
,p_interactive_grid_id=>wwv_flow_api.id(75889461280350803)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(75904281400435191)
,p_report_id=>wwv_flow_api.id(75904193650435191)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75904710050435194)
,p_view_id=>wwv_flow_api.id(75904281400435191)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(75889557298350804)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75905256809435197)
,p_view_id=>wwv_flow_api.id(75904281400435191)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(75889602755350805)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75920518939469455)
,p_view_id=>wwv_flow_api.id(75904281400435191)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(75890432562350813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75954568524596972)
,p_view_id=>wwv_flow_api.id(75904281400435191)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(75932104858521203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77077208928346543)
,p_view_id=>wwv_flow_api.id(75904281400435191)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(77059772341299803)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77100334729406017)
,p_view_id=>wwv_flow_api.id(75904281400435191)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(77093931390405801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142307318976958723)
,p_view_id=>wwv_flow_api.id(75904281400435191)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(142301220816958401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142307855455958736)
,p_view_id=>wwv_flow_api.id(75904281400435191)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(142301367148958402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75890314494350812)
,p_plug_name=>'Acto Seleccionado'
,p_parent_plug_id=>wwv_flow_api.id(83426994956068701)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos a',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(141658672575233102)
,p_plug_name=>unistr('Duraci\00F3n Etapa')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(185350079280675619)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
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
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos a',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(231334549723037987)
,p_plug_name=>'Solicitud'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(72932069932094503)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248690047374196406)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(231334549723037987)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(313502487786547601)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(248690047374196406)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion',
'     , md.dscrpcion_dcmnto',
'     , d.fcha',
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P2_ID_SLCTUD '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(240740728936667106)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>240740728936667106
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83013407312945171)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83013883573945171)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83014203804945171)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83014696862945172)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83015031312945172)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83015441262945172)
,p_db_column_name=>'ACTVO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFActivo?')
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83015849716945172)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(240754196222673373)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'830162'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ACTVO:ID_DCMNTO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(313492904712544094)
,p_plug_name=>'Datos del Gestor'
,p_parent_plug_id=>wwv_flow_api.id(231334549723037987)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(313497786801545696)
,p_plug_name=>'Datos del Solicitante'
,p_parent_plug_id=>wwv_flow_api.id(231334549723037987)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(313741146107868674)
,p_plug_name=>'Datos Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(231334549723037987)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(961652960571115751)
,p_plug_name=>'Etapas'
,p_parent_plug_id=>wwv_flow_api.id(231334549723037987)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.id_rcrso',
'           ,b.id_fljo_trea',
'           ,b.nmbre_trea',
'           ,a.fcha_incio fcha',
'           ,a.fcha_fin_real fcha_fin',
'           ,case',
'               when a.id_estdo_trnscion in (1, 2) then',
unistr('                   ''S\00ED'''),
'               when a.id_estdo_trnscion in (3, 4) then',
'                   ''No''',
'               else',
'                   ''Invalido''',
'           end actvo,',
'           a.id_instncia_trnscion',
'from        wf_g_instancias_transicion      a',
'inner join  v_wf_d_flujos_tarea             b   on  b.id_fljo_trea          =   a.id_fljo_trea_orgen',
'left  join  gj_g_recursos                   c   on  c.id_instncia_fljo_hjo  =   a.id_instncia_fljo',
'where       b.cdgo_clnte            =       :F_CDGO_CLNTE',
'and         a.id_instncia_fljo      =       :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37248034568109802)
,p_name=>'ID_INSTNCIA_TRNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_TRNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Instncia Trnscion'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(724819143092397796)
,p_name=>'ID_RCRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(724819238238397797)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(724819388330397798)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(724819444940397799)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(724819608515397800)
,p_name=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FIN'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(724819787534397802)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(724842604012520998)
,p_name=>'BTN_OBSRVCNES'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_ID_FLJO_TREA,P17_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(724842627978520999)
,p_name=>'BTN_DCMNTOS_GNRDOS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documentos Generados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:P19_ID_FLJO_TREA,P19_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
end;
/
begin
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(724818914640397794)
,p_internal_uid=>724818914640397794
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(724824883847398283)
,p_interactive_grid_id=>wwv_flow_api.id(724818914640397794)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(724824925111398284)
,p_report_id=>wwv_flow_api.id(724824883847398283)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37258838515141355)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(37248034568109802)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(724825970254398294)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(724819143092397796)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(724826428607398296)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(724819238238397797)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(724827002093398297)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(724819388330397798)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(724827392074398298)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(724819444940397799)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(724827811966398300)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(724819608515397800)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(724828824463398303)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(724819787534397802)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(724867337476811524)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(724842604012520998)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(724870001595831985)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(724842627978520999)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(97895775305228025)
,p_view_id=>wwv_flow_api.id(724824925111398284)
,p_execution_seq=>5
,p_name=>'Activo'
,p_background_color=>'#0472CE'
,p_text_color=>'#FFFFFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(724819787534397802)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(457800435032534767)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite el registro del recurso.',
'<br>',
'1.Seleccione el Acto.',
unistr('2.Seleccione una Acci\00F3n.'),
'    <br/>',
'    <br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92903500241966118)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(185350079280675619)
,p_button_name=>'BTN_RGSTRA_RCPCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Recepci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75890531229350814)
,p_name=>'P2_ID_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75890654732350815)
,p_name=>'P2_NMRO_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_prompt=>'No. Acto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75931949484521201)
,p_name=>'P2_OBSRVCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>150
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from wf_g_instancias_transicion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'      a.id_fljo_trea_orgen = :F_ID_FLJO_TREA and',
'      a.id_estdo_trnscion in (1,2)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75932283406521204)
,p_name=>'P2_FCHA_NTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_prompt=>unistr('Fecha de Notificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75932342876521205)
,p_name=>'P2_AIR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_prompt=>unistr('Acci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Admisi\00F3n;A,Inadmisi\00F3n;I,Rechazo;R')
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76703855743632902)
,p_name=>'P2_FCHA_OPTIMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_prompt=>unistr('Fecha L\00EDmite del T\00E9rmino')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76719703601736302)
,p_name=>'P2_DFRNCIA_DIAS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77059641447299802)
,p_name=>'P2_DSCRPCION_ACTO_TPO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82999503473940742)
,p_name=>'P2_ID_PRSNTCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82999914861940742)
,p_name=>'P2_ID_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83000383065940742)
,p_name=>'P2_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :f_cdgo_clnte',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83000788357940743)
,p_name=>'P2_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83001119945940743)
,p_name=>'P2_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P2_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83001511880940743)
,p_name=>'P2_IDNTFCCION_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83001972125940744)
,p_name=>'P2_ID_SLCTUD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83002371475940745)
,p_name=>'P2_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83002725690940745)
,p_name=>'P2_FCHA_RDCDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83003400963941667)
,p_name=>'P2_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(313492904712544094)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83003894339941667)
,p_name=>'P2_DSCRPCION_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(313492904712544094)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83004237747941667)
,p_name=>'P2_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(313492904712544094)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83004617891941667)
,p_name=>'P2_PRMER_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(313492904712544094)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83005049442941668)
,p_name=>'P2_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(313492904712544094)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83005483621941668)
,p_name=>'P2_PRMER_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(313492904712544094)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83005818712941668)
,p_name=>'P2_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(313492904712544094)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83006712061943253)
,p_name=>'P2_DSCRPCION_RSPNSBLE_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83007135251943253)
,p_name=>'P2_DSCRPCION_IDNTFCCION_TPO_S'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83007599956943253)
,p_name=>'P2_IDNTFCCION_S'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83007909340943253)
,p_name=>'P2_PRMER_NMBRE_S'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83008375545943254)
,p_name=>'P2_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83008756568943254)
,p_name=>'P2_PRMER_APLLDO_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83009161308943254)
,p_name=>'P2_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83009530224943254)
,p_name=>'P2_NMBRE_PAIS_NTFCCION_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83009986236943255)
,p_name=>'P2_NMBRE_DPRTMNTO_NTFCCION_S'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83010334836943255)
,p_name=>'P2_NMBRE_MNCPIO_NTFCCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83010715557943255)
,p_name=>'P2_DRCCION_NTFCCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83011142941943255)
,p_name=>'P2_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83011530535943256)
,p_name=>'P2_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83011975092943256)
,p_name=>'P2_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(313497786801545696)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83544064237324401)
,p_name=>'P2_ID_RCRSO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92270830383346402)
,p_name=>'P2_ID_RCRSO_TIPO_CLNTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_prompt=>'Tipo de Recurso'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_RECURSO_CLIENTE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion d, a.id_rcrso_tipo_clnte r',
'from gj_d_recursos_tipo_cliente a',
'inner join gj_d_recursos_tipo b on a.cdgo_rcrso_tpo = b.cdgo_rcrso_tpo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92306654015973901)
,p_name=>'P2_ID_INSTNCIA_FLJO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93433854160439103)
,p_name=>'P2_INDCDOR_AIR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(75890314494350812)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100936200868686702)
,p_name=>'P2_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100936377922686703)
,p_name=>'P2_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107783484193087127)
,p_name=>'P2_CDGO_CLNTE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_source=>'&F_CDGO_CLNTE.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107889677108707203)
,p_name=>'P2_ID_SJTO_IMPSTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(313741146107868674)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141658784765233103)
,p_name=>'P2_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(141658672575233102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141658856984233104)
,p_name=>'P2_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(141658672575233102)
,p_prompt=>'Fecha Inicio Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141658921576233105)
,p_name=>'P2_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(141658672575233102)
,p_prompt=>'Fecha Fin Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141659090350233106)
,p_name=>'P2_DIAS_FLTNTES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(141658672575233102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141659138105233107)
,p_name=>'P2_TXTO_DRCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(141658672575233102)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(104134281901933001)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P2_ID_INSTNCIA_FLJO'
,p_compute_when=>'P2_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(92322945758358705)
,p_validation_name=>'Valida tipo de recurso al registrar recurso'
,p_validation_sequence=>30
,p_validation=>'P2_ID_RCRSO_TIPO_CLNTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique.')
,p_validation_condition=>'WORKFLOW'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(92903500241966118)
,p_associated_item=>wwv_flow_api.id(92270830383346402)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93082404856004601)
,p_validation_name=>'Valida AIR'
,p_validation_sequence=>40
,p_validation=>'P2_AIR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Debe seleccionar una opci\00F3n en el campo #LABEL# , por favor verifique.'),
''))
,p_validation_condition=>'P2_INDCDOR_AIR'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(92903500241966118)
,p_associated_item=>wwv_flow_api.id(75932342876521205)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100859338633263402)
,p_validation_name=>'Si se admite el recurso valida si esta dentro de la oportunidad'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'not exists (',
'    select 1',
'    from gn_g_actos a',
'    inner join gj_d_recursos_tipo_cliente b on b.id_rcrso_tipo_clnte = :P2_ID_RCRSO_TIPO_CLNTE',
'    where a.id_acto =  :P2_ID_ACTO and',
'          pk_util_calendario.fnc_cl_fecha_final(',
'            p_cdgo_clnte => a.cdgo_clnte, ',
'            p_fecha_inicial => nvl(a.fcha_ntfccion, (select w.fcha_ntfccion from gn_g_actos w',
'                                                      where w.id_acto_rqrdo_ntfccion = a.id_acto and w.fcha_ntfccion is not null)),--a.fcha_ntfccion, ',
'            p_undad_drcion => b.undad_drcion_pr, ',
'            p_drcion => b.drcion_pr, ',
'            p_dia_tpo => b.dia_tpo_pr',
'           ) < sysdate',
')'))
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'No puede admitir el recurso por que no se encuentra dentro de la fecha optima.'
,p_validation_condition=>':P2_INDCDOR_AIR = ''S'' AND :P2_AIR = ''A'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(92903500241966118)
,p_associated_item=>wwv_flow_api.id(75932342876521205)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100936178926686701)
,p_validation_name=>'Valida Acto al Registrar recurso'
,p_validation_sequence=>60
,p_validation=>'P2_ID_ACTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione un acto antes de registrar.'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'              from (select id_acto, dscrpcion_acto_orgen, dscrpcion_acto_tpo, nmro_acto_dsplay,fcha_ntfccion, fcha, fcha_optima,',
'                   trunc(to_date(fcha_optima,''DD/MM/YYYY hh24:mi:ss''))-trunc(to_date(sysdate,''DD/MM/YYYY hh24:mi:ss'')) as dfrncia_dias',
'                   from(select  a.id_acto, ',
'                         a.dscrpcion_acto_orgen, ',
'                         a.dscrpcion_acto_tpo, ',
'                         a.nmro_acto nmro_acto_dsplay,',
'                         to_char(a.fcha_ntfccion,''dd/MM/yyyy'') fcha_ntfccion,',
'                         to_char(a.fcha,''dd/MM/yyyy'') fcha,',
'                         a.anio,',
'                         to_char(pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => a.cdgo_clnte, ',
'                                                                       p_fecha_inicial => a.fcha_ntfccion, ',
'                                                                       p_undad_drcion  => d.undad_drcion_pr, ',
'                                                                       p_drcion        => d.drcion_pr, ',
'                                                                       p_dia_tpo       => d.dia_tpo_pr),''dd/MM/yyyy'') as fcha_optima',
'                         from v_gn_g_actos a',
'                         join v_wf_d_flujos_tarea          c on :F_ID_FLJO_TREA = c.id_fljo_trea',
'                         join v_gj_d_recursos_tipo_cliente d on a.cdgo_clnte = d.cdgo_clnte and',
'                                                                c.cdgo_fljo  = d.cdgo_rcrso_tpo',
'                         where a.cdgo_clnte     = :F_CDGO_CLNTE and',
'                               a.indcdor_ntfcdo = ''S'' and',
'                               a.id_acto_tpo in (select a.id_acto_tpo ',
'                                                 from gj_d_recurso_tipo_acto_tipo a',
'                                                 inner join gj_d_recursos_tipo_cliente b on a.id_rcrso_tipo_clnte = b.id_rcrso_tipo_clnte',
'                                                 where b.cdgo_clnte  = :F_CDGO_CLNTE and',
'                                                       b.actvo       = ''S'' and',
'                                                       a.actvo       = ''S'') and',
'                               a.id_acto in (',
'                                   select a.id_acto ',
'                                   from v_gn_g_actos_sujeto_impuesto a',
'                                   where a.id_sjto_impsto in (',
'                                       select a.id_sjto_impsto',
'                                       from pq_g_slctdes_mtvo_sjt_impst a',
'                                       inner join v_pq_g_solicitudes_motivo b on a.id_slctud_mtvo = b.id_slctud_mtvo',
'                                       where b.id_slctud = :P2_ID_SLCTUD',
'                                   )',
'                               )',
'                 ))',
'                 order by 1 FETCH FIRST 1 ROWS ONLY;'))
,p_validation_condition_type=>'EXISTS'
,p_when_button_pressed=>wwv_flow_api.id(92903500241966118)
,p_associated_item=>wwv_flow_api.id(75890531229350814)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(50269708515518101)
,p_validation_name=>'Valida tipo de acto parametrizado'
,p_validation_sequence=>70
,p_validation=>'P2_ID_ACTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor verifique que el tipo de acto este parametrizado en la param\00E9trica de  "Tipos de Recursos por Cliente".')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'              from (select id_acto, dscrpcion_acto_orgen, dscrpcion_acto_tpo, nmro_acto_dsplay,fcha_ntfccion, fcha, fcha_optima,',
'                   trunc(to_date(fcha_optima,''DD/MM/YYYY hh24:mi:ss''))-trunc(to_date(sysdate,''DD/MM/YYYY hh24:mi:ss'')) as dfrncia_dias',
'                   from(select  a.id_acto, ',
'                         a.dscrpcion_acto_orgen, ',
'                         a.dscrpcion_acto_tpo, ',
'                         a.nmro_acto nmro_acto_dsplay,',
'                         to_char(a.fcha_ntfccion,''dd/MM/yyyy'') fcha_ntfccion,',
'                         to_char(a.fcha,''dd/MM/yyyy'') fcha,',
'                         a.anio,',
'                         to_char(pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => a.cdgo_clnte, ',
'                                                                       p_fecha_inicial => a.fcha_ntfccion, ',
'                                                                       p_undad_drcion  => d.undad_drcion_pr, ',
'                                                                       p_drcion        => d.drcion_pr, ',
'                                                                       p_dia_tpo       => d.dia_tpo_pr),''dd/MM/yyyy'') as fcha_optima',
'                         from v_gn_g_actos a',
'                         join v_wf_d_flujos_tarea          c on :F_ID_FLJO_TREA = c.id_fljo_trea',
'                         join v_gj_d_recursos_tipo_cliente d on a.cdgo_clnte = d.cdgo_clnte and',
'                                                                c.cdgo_fljo  = d.cdgo_rcrso_tpo',
'                         where a.cdgo_clnte     = :F_CDGO_CLNTE and',
'                               a.indcdor_ntfcdo = ''S'' and',
'                               a.id_acto_tpo in (select a.id_acto_tpo ',
'                                                 from gj_d_recurso_tipo_acto_tipo a',
'                                                 inner join gj_d_recursos_tipo_cliente b on a.id_rcrso_tipo_clnte = b.id_rcrso_tipo_clnte',
'                                                 where b.cdgo_clnte  = :F_CDGO_CLNTE and',
'                                                       b.actvo       = ''S'' and',
'                                                       a.actvo       = ''S'') and',
'                               a.id_acto in (',
'                                   select a.id_acto ',
'                                   from v_gn_g_actos_sujeto_impuesto a',
'                                   where a.id_sjto_impsto in (',
'                                       select a.id_sjto_impsto',
'                                       from pq_g_slctdes_mtvo_sjt_impst a',
'                                       inner join v_pq_g_solicitudes_motivo b on a.id_slctud_mtvo = b.id_slctud_mtvo',
'                                       where b.id_slctud = :P2_ID_SLCTUD',
'                                   )',
'                               )',
'                 ))',
'                 order by 1 FETCH FIRST 1 ROWS ONLY;'))
,p_validation_condition_type=>'NOT_EXISTS'
,p_when_button_pressed=>wwv_flow_api.id(92903500241966118)
,p_associated_item=>wwv_flow_api.id(75890531229350814)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75890794028350816)
,p_name=>unistr('Cambio de Selecci\00F3n en Actos')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(75889247823350801)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75890869014350817)
,p_event_id=>wwv_flow_api.id(75890794028350816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerActo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(93433648715439101)
,p_name=>'Al cambiar seleccion'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_ID_RCRSO_TIPO_CLNTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(93433773318439102)
,p_event_id=>wwv_flow_api.id(93433648715439101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P2_ID_RCRSO_TIPO_CLNTE'', :P2_ID_RCRSO_TIPO_CLNTE);',
'',
'    begin',
'        select a_i_r',
'        into :P2_INDCDOR_AIR',
'        from gj_d_recursos_tipo_cliente',
'        where id_rcrso_tipo_clnte = :P2_ID_RCRSO_TIPO_CLNTE;',
'    exception',
'        when no_data_found then',
'            :P2_INDCDOR_AIR := null;',
'    end;',
'end;'))
,p_attribute_02=>'P2_ID_RCRSO_TIPO_CLNTE'
,p_attribute_03=>'P2_INDCDOR_AIR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(142253613663750811)
,p_event_id=>wwv_flow_api.id(93433648715439101)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P2_ID_RCRSO_TIPO_CLNTE'', :P2_ID_RCRSO_TIPO_CLNTE);    ',
'    apex_util.set_session_state(''P2_FCHA_NTFCCION'', :P2_FCHA_NTFCCION);',
'',
'',
'    begin',
'       select to_char(pk_util_calendario.fnc_cl_fecha_final( p_cdgo_clnte    => :F_CDGO_CLNTE,--a.cdgo_clnte, ',
'                                                             p_fecha_inicial => :P2_FCHA_NTFCCION,--nvl(a.fcha_ntfccion, (select w.fcha_ntfccion from gn_g_actos w',
'                                                                                                       --where w.id_acto_rqrdo_ntfccion = a.id_acto and w.fcha_ntfccion is not null)),--a.fcha_ntfccion, ',
'                                                             p_undad_drcion  => d.undad_drcion_pr, ',
'                                                             p_drcion        => d.drcion_pr, ',
'                                                             p_dia_tpo       => d.dia_tpo_pr),''dd/MM/yyyy'') as fcha_optima',
'     ',
'     into :P2_FCHA_OPTIMA',
'     from /*v_gn_g_actos a',
'     join gn_d_actos_tipo              b on b.id_acto_tpo = a.id_acto_tpo',
'     join v_wf_d_flujos_tarea          c on c.id_fljo_trea = :F_ID_FLJO_TREA',
'     join gj_d_recurso_tipo_acto_tipo  e on e.id_acto_tpo = b.id_acto_tpo',
'     join */gj_d_recursos_tipo_cliente   d --on d.id_rcrso_tipo_clnte = e.id_rcrso_tipo_clnte',
'    where d.id_rcrso_tipo_clnte = :P2_ID_RCRSO_TIPO_CLNTE',
' --order by 1 FETCH FIRST 1 ROWS ONLY',
' ;',
'    exception',
'        when no_data_found then',
'            :P2_FCHA_OPTIMA := null;',
'    end;',
'end;'))
,p_attribute_02=>'P2_ID_RCRSO_TIPO_CLNTE,P2_FCHA_NTFCCION,F_CDGO_CLNTE'
,p_attribute_03=>'P2_FCHA_OPTIMA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(93484662610746801)
,p_name=>'Al cambiar Indicador AIR'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_INDCDOR_AIR'
,p_condition_element=>'P2_INDCDOR_AIR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(93484799667746802)
,p_event_id=>wwv_flow_api.id(93484662610746801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_AIR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(93484848131746803)
,p_event_id=>wwv_flow_api.id(93484662610746801)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_AIR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(93484957392746804)
,p_event_id=>wwv_flow_api.id(93484662610746801)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_AIR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83038393059976706)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_tpo,',
'            a.id_mtvo,',
'            b.nmbre_impsto,',
'            a.id_impsto,',
'            c.nmbre_impsto_sbmpsto,',
'            a.id_impsto_sbmpsto,',
'            a.idntfccion,',
'            a.id_sjto_impsto,',
'            a.id_rdcdor,',
'            a.id_slctud,',
'            a.nmro_rdcdo_dsplay,',
'            a.fcha_rdcdo,',
'            a.id_prsntcion_tpo',
'      into :P2_ID_TPO,',
'           :P2_ID_MTVO,',
'           :P2_NMBRE_IMPSTO,',
'           :P2_ID_IMPSTO,',
'           :P2_NMBRE_IMPSTO_SBMPSTO,',
'           :P2_ID_IMPSTO_SBMPSTO,',
'           :P2_IDNTFCCION_SJTO,',
'           :P2_ID_SJTO_IMPSTO,',
'           :P2_ID_RDCDOR,',
'           :P2_ID_SLCTUD,',
'           :P2_NMRO_RDCDO_DSPLAY,',
'           :P2_FCHA_RDCDO,',
'           :P2_ID_PRSNTCION_TPO',
'      from v_pq_g_solicitudes a',
'      inner join df_c_impuestos b on a.id_impsto = b.id_impsto',
'      inner join df_i_impuestos_subimpuesto c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto and',
'                                                 a.id_impsto = c.id_impsto and',
'                                                 c.cdgo_clnte = :F_CDGO_CLNTE',
'      where a.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar radicador''); ',
'end;',
'  ',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83038600783977599)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  b.dscrpcion_idntfccion_tpo,',
'            a.idntfccion,',
'            a.prmer_nmbre,',
'            a.sgndo_nmbre,',
'            a.prmer_aplldo,',
'            a.sgndo_aplldo',
'    into    :P2_DSCRPCION_IDNTFCCION_TPO,',
'            :P2_IDNTFCCION,',
'            :P2_PRMER_NMBRE,',
'            :P2_SGNDO_NMBRE,',
'            :P2_PRMER_APLLDO,',
'            :P2_SGNDO_APLLDO',
'    from pq_g_radicador a',
'    inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where id_rdcdor = :P2_ID_RDCDOR;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Radicador de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar radicador''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83039046161978431)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select d.dscrpcion_rspnsble_tpo,',
'           b.dscrpcion_idntfccion_tpo,',
'           a.idntfccion,',
'           a.prmer_nmbre,',
'           a.sgndo_nmbre,',
'           a.prmer_aplldo,',
'           a.sgndo_aplldo,',
'           c.nmbre_pais,',
'           c.nmbre_dprtmnto,',
'           c.nmbre_mncpio,',
'           a.drccion_ntfccion,',
'           a.email,',
'           a.tlfno,',
'           a.cllar',
'      into :P2_DSCRPCION_RSPNSBLE_TPO,',
'           :P2_DSCRPCION_IDNTFCCION_TPO_S,',
'           :P2_IDNTFCCION_S,',
'           :P2_PRMER_NMBRE_S,',
'           :P2_SGNDO_NMBRE_S ,',
'           :P2_PRMER_APLLDO_S,',
'           :P2_SGNDO_APLLDO_S,',
'           :P2_NMBRE_PAIS_NTFCCION_S,',
'           :P2_NMBRE_DPRTMNTO_NTFCCION_S,',
'           :P2_NMBRE_MNCPIO_NTFCCION_S,',
'           :P2_DRCCION_NTFCCION_S,',
'           :P2_EMAIL_S,',
'           :P2_TLFNO_S,',
'           :P2_CLLAR_S',
'      from pq_g_solicitantes a',
'      inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'      inner join v_df_s_municipios c on a.id_mncpio_ntfccion = c.id_mncpio',
'      inner join df_s_responsables_tipo d on a.cdgo_rspnsble_tpo = d.cdgo_rspnsble_tpo',
'     where a.id_slctud = :P2_ID_SLCTUD;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitante de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar Solicitante''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83518658540997301)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Recurso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select id_rcrso,',
'           id_acto, ',
'           nmro_acto, ',
'           dscrpcion_acto_tpo, ',
'           fcha_ntfccion, ',
'           fcha_optima, ',
'           trunc(to_date(fcha_optima,''DD/MM/YYYY hh24:mi:ss''))-trunc(to_date(sysdate,''DD/MM/YYYY hh24:mi:ss'')) as dfrncia_dias,',
'           id_rcrso_tipo_clnte,',
'           a_i_r,',
'           indcdor_a_i_r',
'    into :P2_ID_RCRSO,',
'         :P2_ID_ACTO, ',
'         :P2_NMRO_ACTO, ',
'         :P2_DSCRPCION_ACTO_TPO, ',
'         :P2_FCHA_NTFCCION, ',
'         :P2_FCHA_OPTIMA, ',
'         :P2_DFRNCIA_DIAS,',
'         :P2_ID_RCRSO_TIPO_CLNTE,',
'         :P2_AIR,',
'         :P2_INDCDOR_AIR',
'    from(select a.id_rcrso,',
'                a.id_acto,',
'                a.nmro_acto,',
'                a.dscrpcion_acto_tpo,',
'                --a.fcha_ntfccion,',
'                nvl(a.fcha_ntfccion, (select w.fcha_ntfccion from gn_g_actos w',
'                                       where w.id_acto_rqrdo_ntfccion = a.id_acto and w.fcha_ntfccion is not null)) fcha_ntfccion,',
'                to_char(pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => a.cdgo_clnte, ',
'                                                              p_fecha_inicial => nvl(a.fcha_ntfccion, (select w.fcha_ntfccion from gn_g_actos w',
'                                                                                                        where w.id_acto_rqrdo_ntfccion = a.id_acto and w.fcha_ntfccion is not null)),--a.fcha_ntfccion,',
'                                                              p_undad_drcion  => a.undad_drcion_pr, ',
'                                                              p_drcion        => a.drcion_pr, ',
'                                                              p_dia_tpo       => a.dia_tpo_pr),''dd/MM/yyyy'') as fcha_optima,',
'               a.id_rcrso_tipo_clnte,',
'               a.a_i_r,',
'               a.indcdor_a_i_r',
'         from  v_gj_g_recursos a',
'         where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO);',
'exception',
'    when no_data_found then',
'        null;',
'    when others then',
'        raise_application_error(-20000,''Problemas al consultar recurso'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141659242704233108)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta duraci\00F3n etapa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.nmbre_trcro ,',
'        trunc(a.fcha_incio) , ',
'        trunc(a.fcha_fin_plnda) ,    ',
'        trunc(a.fcha_fin_plnda) - trunc(sysdate) dias_fltntes  ,',
'        /*decode(id_estdo_trnscion, 3, ''Esta tarea fue finalizada por el usuario ''||trim(c.nmbre_trcro)||'' en un total de ''|| ',
'                                     decode ((trunc(a.fcha_fin_real) - trunc(a.fcha_incio)), 0, 1, (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)))||',
unistr('                                     '' d\00EDa(s). Desde el ''||trunc(a.fcha_incio)||'' hasta el ''||trunc(a.fcha_fin_real)||''.'' ,'),
'                                  ''Sr(a) ''|| trim(c.nmbre_trcro) ||'' le quedan ''|| ',
'                                  decode ((trunc(a.fcha_fin_plnda) - trunc(sysdate)), 0, 1, (trunc(a.fcha_fin_plnda) - trunc(sysdate)))||',
unistr('                                  ''  d\00EDa(s) para resolver la tarea de ''||b.nmbre_trea||'' para pasar a dar continuidad al proceso.'')*/'),
'        case when id_estdo_trnscion = 3 then',
'                  ''Esta tarea fue finalizada por el usuario ''||trim(c.nmbre_trcro)||'' en un total de ''||',
'                  decode ( (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)) , 0 , 1 , (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)) )||',
unistr('                  '' d\00EDa(s). Desde el ''||trunc(a.fcha_incio)||'' hasta el ''||trunc(a.fcha_fin_real)||''.'''),
'            when (trunc(a.fcha_fin_plnda) - trunc(sysdate)) < 0 then',
'                  ''Sr(a) ''|| trim(c.nmbre_trcro) ||'' tiene un retraso de ''||',
'                  abs(decode ( (trunc(a.fcha_fin_plnda) - trunc(sysdate)) , 0 , 1 ,(trunc(a.fcha_fin_plnda) - trunc(sysdate)) ))||',
unistr('                  '' d\00EDa(s) en gestionar la tarea de ''||b.nmbre_trea||'' para pasar a dar continuidad al proceso.'''),
'            else',
'                  ''Sr(a) ''|| trim(c.nmbre_trcro) ||'' le quedan ''|| ',
'                  decode ( (trunc(a.fcha_fin_plnda) - trunc(sysdate)) , 0 , 1 ,(trunc(a.fcha_fin_plnda) - trunc(sysdate)) )||',
unistr('                  '' d\00EDa(s) para resolver la tarea de ''||b.nmbre_trea||'' para pasar a dar continuidad al proceso.'''),
'        end case',
'into    :P2_USRIO,',
'        :P2_FCHA_INCIO,',
'        :P2_FCHA_FIN, ',
'        :P2_DIAS_FLTNTES, ',
'        :P2_TXTO_DRCION',
'from    wf_g_instancias_transicion  a',
'join    v_wf_d_flujos_tarea         b on a.id_fljo_trea_orgen = b.id_fljo_trea',
'join    v_sg_g_usuarios             c on a.id_usrio = c.id_usrio',
'where   /*id_estdo_trnscion in ( 1 , 2 )',
'and    */ id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'and     id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'order by id_instncia_trnscion desc',
'fetch first 1 row only ',
';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93082536178004602)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Reg\00EDstra Recurso')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number := 0;',
'    v_mnsje_rspsta    varchar2(3000);',
'    v_id_rcrso        number;',
'begin',
'    if(:P2_INDCDOR_AIR = ''N'')then',
'        :P2_AIR := null;',
'    end if;',
'    ',
'    pkg_gj_recurso.prc_rg_recurso(',
'        p_cdgo_clnte            => :F_CDGO_CLNTE,',
'        p_id_instncia_fljo_hjo  => :F_ID_INSTNCIA_FLJO,',
'        p_id_rcrso_tipo_clnte   => :P2_ID_RCRSO_TIPO_CLNTE,',
'        p_id_fljo_trea          => :F_ID_FLJO_TREA,',
'        p_id_acto               => :P2_ID_ACTO,',
'        p_fcha                  => systimestamp,',
'        p_air                   => :P2_AIR,',
'        p_obsrvcion             => :P2_OBSRVCION,',
'        p_id_usrio              => :F_ID_USRIO,',
'        o_id_rcrso              => v_id_rcrso,',
'        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(92903500241966118)
,p_process_success_message=>'Recurso registrado exitosamente.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105382618944006201)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Workflow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(92903500241966118)
);
end;
/
