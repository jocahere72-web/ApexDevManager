prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('Inadmisi\00F3n')
,p_step_title=>unistr('Inadmisi\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerDocumentos(){',
'    var region = apex.region("P9_DCMNTOS_GRID");',
'    var documentos  = [];',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                documentos.push({"id_dcmnto":model.getValue(records[i], "ID_DCMNTO").trim()});',
'            }',
'           $s("P9_JSON_DOCUMENTOS",JSON.stringify(documentos));',
'        }',
'        else{',
'           $s("P9_JSON_DOCUMENTOS",null);   ',
'        }',
'    }',
'};',
'',
'function obtenerMotivos(){',
'    var region = apex.region("P9_MTVOS_GRID");',
'    var documentos  = [];',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                documentos.push({"id_mtvo_clnte":model.getValue(records[i], "ID_MTVO_CLNTE").trim()});',
'            }',
'           $s("P9_JSON_MOTIVOS",JSON.stringify(documentos));',
'        }',
'        else{',
'           $s("P9_JSON_MOTIVOS",null);   ',
'        }',
'    }',
'};',
'',
'function generarDocumentos(p_id_rcrso_dcmnto){',
'    ',
'    apex.submit({',
'      request:"generarDocumentos",',
'      set:{"P9_ID_RCRSO_DCMNTO":p_id_rcrso_dcmnto}});        ',
'};'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241107105711'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(169171297238161399)
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
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170534792139403810)
,p_plug_name=>'Acto Seleccionado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178532368785448661)
,p_plug_name=>unistr('Generaci\00F3n de Actos')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(72932069932094503)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94531145308887032)
,p_plug_name=>'Documentos a Actualizar'
,p_region_name=>'P9_DCMNTOS_GRID'
,p_parent_plug_id=>wwv_flow_api.id(178532368785448661)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto,',
'       md.dscrpcion_dcmnto,',
'       d.fcha',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P9_ID_SLCTUD '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_documentos varchar2(1);',
'    v_motivos    varchar2(1);',
'begin ',
unistr('    --Validamos si hay motivos de Inadmisi\00F3n Seleccionados'),
'    select case',
'        when count(b.id_rcrso_dtlle) > 0 then ''S''',
'        when count(b.id_rcrso_dtlle) < 1 then ''N''',
'       end',
'    into v_motivos',
'    from gj_g_recursos a',
'    inner join gj_g_recursos_detalle     b on a.id_rcrso          =  b.id_rcrso',
'    inner join gj_d_motivos_cliente      c on b.id_mtvo_clnte     = c.id_mtvo_clnte and ',
'                                              c.a_i_r             = :P9_AIR',
'    where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;',
'    ',
'    if(v_motivos = ''S'')then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94531326604887034)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
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
 p_id=>wwv_flow_api.id(94531424706887035)
,p_name=>'DSCRPCION_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Documento'
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94531517523887036)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
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
 p_id=>wwv_flow_api.id(94718048986120002)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(94531292816887033)
,p_internal_uid=>94531292816887033
,p_is_editable=>true
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
 p_id=>wwv_flow_api.id(94701307197083288)
,p_interactive_grid_id=>wwv_flow_api.id(94531292816887033)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(94701471788083288)
,p_report_id=>wwv_flow_api.id(94701307197083288)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94701949036083291)
,p_view_id=>wwv_flow_api.id(94701471788083288)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(94531326604887034)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94702438122083294)
,p_view_id=>wwv_flow_api.id(94701471788083288)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(94531424706887035)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94702908196083295)
,p_view_id=>wwv_flow_api.id(94701471788083288)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(94531517523887036)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94531813532887039)
,p_plug_name=>'Motivos'
,p_region_name=>'P9_MTVOS_GRID'
,p_parent_plug_id=>wwv_flow_api.id(178532368785448661)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_mtvo_clnte,',
'       id_mtvo,',
'       dscrpcion',
'from v_gj_d_motivos_cliente',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      a_i_r = :P9_AIR and',
'      actvo = ''S'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_documentos varchar2(1);',
'    v_motivos    varchar2(1);',
'begin ',
unistr('    --Validamos si hay motivos de Inadmisi\00F3n Seleccionados'),
'    select case',
'        when count(b.id_rcrso_dtlle) > 0 then ''S''',
'        when count(b.id_rcrso_dtlle) < 1 then ''N''',
'       end',
'    into v_motivos',
'    from gj_g_recursos a',
'    inner join gj_g_recursos_detalle     b on a.id_rcrso          =  b.id_rcrso',
'    inner join gj_d_motivos_cliente      c on b.id_mtvo_clnte     = c.id_mtvo_clnte and ',
'                                              c.a_i_r             = :P9_AIR',
'    where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;',
'    ',
'    if(v_motivos = ''S'')then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94532069168887041)
,p_name=>'ID_MTVO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MTVO_CLNTE'
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
 p_id=>wwv_flow_api.id(94532110135887042)
,p_name=>'ID_MTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(94532223489887043)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(94532463163887045)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(94531908012887040)
,p_internal_uid=>94531908012887040
,p_is_editable=>true
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
 p_id=>wwv_flow_api.id(94706975006104743)
,p_interactive_grid_id=>wwv_flow_api.id(94531908012887040)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(94707020357104743)
,p_report_id=>wwv_flow_api.id(94706975006104743)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94707583485104744)
,p_view_id=>wwv_flow_api.id(94707020357104743)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(94532069168887041)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94708062140104746)
,p_view_id=>wwv_flow_api.id(94707020357104743)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(94532110135887042)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94708587456104747)
,p_view_id=>wwv_flow_api.id(94707020357104743)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(94532223489887043)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178531837226448656)
,p_plug_name=>'Actos'
,p_parent_plug_id=>wwv_flow_api.id(178532368785448661)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--inadmision',
'select  g.id_acto_tpo, g.dscrpcion_acto_tpo, g.ACCION, g.Confirmar, g.id_rcrso_dcmnto, LECTURA, g.Nmero_Acto, g.INDCDOR_NTFCCION, g.fcha_ntfccion',
'from(',
'    select  a.id_actos_tpo_trea,',
'            a.id_acto_tpo,',
'            b.dscrpcion dscrpcion_acto_tpo,',
'            case',
'                 when ((a.id_acto_tpo_rqrdo is null and d.id_acto is null) or  (a.id_acto_tpo_rqrdo is not null and e.id_acto is not null and d.id_acto is null))then',
'                     ''<center>',
'                         <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                             ||nvl2(d.id_rcrso_dcmnto, ''Modificar '', ''Generar '')',
'                             ||''<span class="fa ''||nvl2(d.id_rcrso_dcmnto,''fa-edit'',''fa-gear fa-anim-spin'')||''"></span>',
'                         </button>',
'                     </center>''',
'                when((a.id_acto_tpo_rqrdo is null and d.id_acto is not null)or (a.id_acto_tpo_rqrdo is not null and e.id_acto is not null and d.id_acto is not null))then',
'                    ''<span aria-hidden="true" class="fa fa-check"></span>''',
'            end  ACCION,',
'            case',
'                 when ((a.id_acto_tpo_rqrdo is null and d.id_rcrso_dcmnto is not null and d.id_acto is null) or  (a.id_acto_tpo_rqrdo is not null and e.id_acto is not null and d.id_rcrso_dcmnto is not null and d.id_acto is null))then',
'                     ''<center>',
'                         <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Confirmar',
'                             <span class="fa fa-check"></span>',
'                         </button>',
'                      </center>''',
'            end Confirmar,',
'            case',
'                 when (d.id_acto is not null)then',
'                     d.nmro_acto',
'            end Nmero_Acto,',
'            d.id_rcrso_dcmnto,',
'            a.id_acto_tpo_rqrdo,',
'            nvl2(d.id_acto, ''S'', ''N'') LECTURA,',
'            case b.INDCDOR_NTFCCION',
'                when ''N'' then ''No''',
'                when ''S'' then ''Si''',
'                end as INDCDOR_NTFCCION,',
'            f.fcha_ntfccion ',
'    from gn_d_actos_tipo_tarea          a',
'    inner join  gn_d_actos_tipo         b on a.id_acto_tpo           =  b.id_acto_tpo',
'    inner join  gj_g_recursos           c on c.id_instncia_fljo_hjo  = :F_ID_INSTNCIA_FLJO',
'    left  join  v_gj_g_recursos_documento d on c.id_rcrso            = d.id_rcrso           and',
'                                             a.id_fljo_trea          = d.id_fljo_trea       and',
'                                             d.id_acto_tpo           = b.id_acto_tpo',
'    left  join gj_g_recursos_documento  e on c.id_rcrso              = e.id_rcrso           and',
'                                             a.id_fljo_trea          = e.id_fljo_trea       and',
'                                             a.id_acto_tpo_rqrdo     = e.id_acto_tpo',
'    left join gn_g_actos                f on f.id_acto               = d.id_acto',
'    where a.cdgo_clnte      = :F_CDGO_CLNTE     and',
'          a.id_fljo_trea    = :F_ID_FLJO_TREA   and',
'          a.actvo           = ''S''',
') g',
'--start with  a.id_acto_tpo_rqrdo         is  null',
'--connect by  nocycle g.id_acto_tpo_rqrdo =   prior g.id_acto_tpo;',
'order by g.id_acto_tpo_rqrdo desc;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_documentos varchar2(1);',
'    v_motivos    varchar2(1);',
'begin ',
unistr('    --Validamos si hay motivos de Inadmisi\00F3n Seleccionados'),
'    select case',
'        when count(b.id_rcrso_dtlle) > 0 then ''S''',
'        when count(b.id_rcrso_dtlle) < 1 then ''N''',
'       end',
'    into v_motivos',
'    from gj_g_recursos a',
'    inner join gj_g_recursos_detalle     b on a.id_rcrso          =  b.id_rcrso',
'    inner join gj_d_motivos_cliente      c on b.id_mtvo_clnte     = c.id_mtvo_clnte and ',
'                                              c.a_i_r             = :P9_AIR',
'    where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;',
'    ',
'    if(v_motivos = ''S'')then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
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
 p_id=>wwv_flow_api.id(178531909438448657)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'NONE'
,p_show_detail_link=>'N'
,p_owner=>'JCUAO'
,p_internal_uid=>178531909438448657
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94687229352066937)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94688049494066938)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94687603705066937)
,p_db_column_name=>'ACCION'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>unistr('Acci\00F3n')
,p_column_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16:P16_ID_ACTO_TPO,P16_ID_RCRSO_DCMNTO,P16_XML,P16_PGNA_ORGN:#ID_ACTO_TPO#,#ID_RCRSO_DCMNTO#,<id_acto>&P9_ID_ACTO.</id_acto> <id_slctud>&P9_ID_SLCTUD.</id_slctud> <id_acto_tpo>#ID_ACTO_TPO#</id_acto_tpo> <id_inst'
||'ncia_fljo>&F_ID_INSTNCIA_FLJO.</id_instncia_fljo> <id_fljo_trea>&F_ID_FLJO_TREA.</id_fljo_trea>,&APP_PAGE_ID.'
,p_column_linktext=>'#ACCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94688805222066938)
,p_db_column_name=>'CONFIRMAR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Confirmar'
,p_column_link=>'javascript:generarDocumentos(#ID_RCRSO_DCMNTO#);'
,p_column_linktext=>'#CONFIRMAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95971138663795205)
,p_db_column_name=>'ID_RCRSO_DCMNTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Rcrso Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95971226915795206)
,p_db_column_name=>'LECTURA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Lectura'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(50075534350575901)
,p_db_column_name=>'NMERO_ACTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Numero Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(152654648672405901)
,p_db_column_name=>'INDCDOR_NTFCCION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('\00BFActo Notificable?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(153769682069848601)
,p_db_column_name=>'FCHA_NTFCCION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Fecha Notificaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(178613692585051671)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'946892'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ACTO_TPO:ACCION:ID_ACTO_TPO:CONFIRMAR:ID_RCRSO_DCMNTO:LECTURA:NMERO_ACTO:INDCDOR_NTFCCION:FCHA_NTFCCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(262735914147710540)
,p_plug_name=>'Observaciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from wf_g_instancias_transicion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'      a.id_fljo_trea_orgen = :F_ID_FLJO_TREA and',
'      a.id_estdo_trnscion in (1,2)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73228164829510801)
,p_plug_name=>'Observaciones'
,p_parent_plug_id=>wwv_flow_api.id(262735914147710540)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.obsrvcion, b.nmbre_trcro ,c.nmbre_trea , a.fcha ,a.id_rcrso_dtlle',
'from gj_g_recursos_detalle a',
'join v_sg_g_usuarios b  on  a.id_usrio = b.id_usrio',
'join v_wf_d_flujos_tarea c on a.id_fljo_trea = c.id_fljo_trea',
'where a.id_rcrso = :P9_ID_RCRSO',
'order by a.fcha desc;'))
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
 p_id=>wwv_flow_api.id(73228217120510802)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP:P39_ID_RCRSO_DTLLE:#ID_RCRSO_DTLLE#'
,p_detail_link_text=>'<div align="center"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></div>'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>73228217120510802
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73228384362510803)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73228477538510804)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73228584529510805)
,p_db_column_name=>'NMBRE_TREA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73228661108510806)
,p_db_column_name=>'FCHA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73228790601510807)
,p_db_column_name=>'ID_RCRSO_DTLLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Rcrso Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(73235310052515619)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'732354'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBSRVCION:NMBRE_TRCRO:NMBRE_TREA:FCHA:ID_RCRSO_DTLLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(279994556925728617)
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
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from wf_g_instancias_transicion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'      a.id_fljo_trea_orgen = :F_ID_FLJO_TREA and',
'      a.id_estdo_trnscion in (1,2)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(325979027368090985)
,p_plug_name=>'Solicitud'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(72932069932094503)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(343334525019249404)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(325979027368090985)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(408146965431600599)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(343334525019249404)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto,',
'       d.id_slctud,',
'       d.file_name ,',
'       d.obsrvcion,',
'       md.dscrpcion_dcmnto,',
'       d.fcha,',
'       case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo,',
'       case d.indcdor_actlzar',
unistr('           when ''S'' then ''S\00ED'''),
'           when ''N'' then ''No''',
'       end indcdor_actlzar',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P9_ID_SLCTUD '))
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
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(335385206581720104)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>335385206581720104
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94663122855053032)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94663548473053033)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94663969401053033)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94664398762053035)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94664776395053036)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94665102468053036)
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
 p_id=>wwv_flow_api.id(94665533527053037)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95039449291405408)
,p_db_column_name=>'INDCDOR_ACTLZAR'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>unistr('\00BFIndicador Actualizar?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(335398673867726371)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'946659'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:FILE_NAME:OBSRVCION:FCHA:ACTVO:INDCDOR_ACTLZAR:ID_DCMNTO:'
,p_sort_column_1=>'FCHA'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(408137382357597092)
,p_plug_name=>'Datos del Gestor'
,p_parent_plug_id=>wwv_flow_api.id(325979027368090985)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(408142264446598694)
,p_plug_name=>'Datos del Solicitante'
,p_parent_plug_id=>wwv_flow_api.id(325979027368090985)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(408385623752921672)
,p_plug_name=>'Datos Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(325979027368090985)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(674179468862485320)
,p_plug_name=>'Tarea'
,p_parent_plug_id=>wwv_flow_api.id(325979027368090985)
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
 p_id=>wwv_flow_api.id(37247939449109801)
,p_name=>'ID_INSTNCIA_TRNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_TRNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(437345651383767365)
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
 p_id=>wwv_flow_api.id(437345746529767366)
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
 p_id=>wwv_flow_api.id(437345896621767367)
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
 p_id=>wwv_flow_api.id(437345953231767368)
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
 p_id=>wwv_flow_api.id(437346116806767369)
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
 p_id=>wwv_flow_api.id(437346295825767371)
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
 p_id=>wwv_flow_api.id(437369112303890567)
,p_name=>'BTN_DTLLE'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Detalle'
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
 p_id=>wwv_flow_api.id(437369136269890568)
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(437345422931767363)
,p_internal_uid=>437345422931767363
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
 p_id=>wwv_flow_api.id(437351392138767852)
,p_interactive_grid_id=>wwv_flow_api.id(437345422931767363)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(437351433402767853)
,p_report_id=>wwv_flow_api.id(437351392138767852)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7590687015536)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(37247939449109801)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(437352478545767863)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(437345651383767365)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(437352936898767865)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(437345746529767366)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(437353510384767866)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(437345896621767367)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(437353900365767867)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(437345953231767368)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(437354320257767869)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(437346116806767369)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(437355332754767872)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(437346295825767371)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(437393845768181093)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(437369112303890567)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(437396509887201554)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(437369136269890568)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(136789000076)
,p_view_id=>wwv_flow_api.id(437351433402767853)
,p_execution_seq=>5
,p_name=>'Activo'
,p_background_color=>'#0472CE'
,p_text_color=>'#FFFFFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(437346295825767371)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(425207422721858620)
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
 p_id=>wwv_flow_api.id(552444912677587765)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite inadmitir un recurso.',
'<br>',
'<ol style="margin: 1.2rem 1.2rem; !important">',
'    <li>Seleccione los documentos.</li>',
'    <li>Seleccione los motivos de inadmision.</li>',
unistr('    <li>Generaci\00F3n de Actos.</li>'),
'    <li>Admite o Rechaza.</li>',
'</ol>',
'<br/>',
'<br/>',
'<p>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'</p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94676470294053052)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(279994556925728617)
,p_button_name=>'BTN_RGSTRA_INDMSION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Documentos <br /> y Motivos'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_documentos varchar2(1);',
'    v_motivos    varchar2(1);',
'begin ',
unistr('    --Validamos si hay motivos de Inadmisi\00F3n Seleccionados'),
'    select case',
'        when count(b.id_rcrso_dtlle) > 0 then ''S''',
'        when count(b.id_rcrso_dtlle) < 1 then ''N''',
'       end',
'    into v_motivos',
'    from gj_g_recursos a',
'    inner join gj_g_recursos_detalle     b on a.id_rcrso          =  b.id_rcrso',
'    inner join gj_d_motivos_cliente      c on b.id_mtvo_clnte     = c.id_mtvo_clnte and ',
'                                              c.a_i_r             = :P9_AIR',
'    where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;',
'    ',
'    if(v_motivos = ''S'')then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95038806435405402)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(279994556925728617)
,p_button_name=>'BTN_RGSTRA_ADMISION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Admitir'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Está seguro de admitir el recurso?'',''BTN_RGSTRA_ADMISION'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_actos varchar2(1);',
'begin',
'    select case ',
'            when count(a.id_actos_tpo_trea) > 0 then ''S''',
'            when count(a.id_actos_tpo_trea) < 1 then ''N''',
'           end',
'    into v_actos',
'    from gn_d_actos_tipo_tarea a',
'    inner join gj_g_recursos          b on b.id_instncia_fljo_hjo   = :F_ID_INSTNCIA_FLJO',
'    left join gj_g_recursos_documento c on b.id_rcrso               = c.id_rcrso and',
'                                           a.id_acto_tpo            = c.id_acto_tpo and',
'                                           a.id_fljo_trea           = c.id_fljo_trea',
'    where a.id_fljo_trea        = :F_ID_FLJO_TREA and',
'          a.indcdor_oblgtrio    = ''S'' and',
'          c.id_acto is null;',
'    if(v_actos = ''S'')then',
'         return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95038909967405403)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(279994556925728617)
,p_button_name=>'BTN_RGSTRA_RCHZO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rechazar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Está seguro de rechazar el recurso?'',''BTN_RGSTRA_RCHZO'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_actos varchar2(1);',
'begin',
'    select case ',
'            when count(a.id_actos_tpo_trea) > 0 then ''S''',
'            when count(a.id_actos_tpo_trea) < 1 then ''N''',
'           end',
'    into v_actos',
'    from gn_d_actos_tipo_tarea a',
'    inner join gj_g_recursos          b on b.id_instncia_fljo_hjo   = :F_ID_INSTNCIA_FLJO',
'    left join gj_g_recursos_documento c on b.id_rcrso               = c.id_rcrso and',
'                                           a.id_acto_tpo            = c.id_acto_tpo and',
'                                           a.id_fljo_trea           = c.id_fljo_trea',
'    where a.id_fljo_trea        = :F_ID_FLJO_TREA and',
'          a.indcdor_oblgtrio    = ''S'' and',
'          c.id_acto is null;',
'    if(v_actos = ''S'')then',
'         return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-window-close'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95039151092405405)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(262735914147710540)
,p_button_name=>'BTN_RGSTRA_OBSRVACION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('A\00F1adir Observaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP:P39_ID_FLJO_TREA,P39_ID_RCRSO,P39_ID_USRIO:&F_ID_FLJO_TREA.,&P9_ID_RCRSO.,&F_ID_USRIO.'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94879852461826702)
,p_branch_name=>'Actualizar Pagina'
,p_branch_action=>'f?p=72000:9:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'generarDocumentos'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6165363017663401)
,p_name=>'P9_ID_ACTO_AUI'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94530991857887030)
,p_name=>'P9_JSON_DOCUMENTOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(178532368785448661)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P9_ORDEN'
,p_display_when_type=>'ITEM_IS_NULL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94531091266887031)
,p_name=>'P9_JSON_MOTIVOS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(178532368785448661)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P9_ORDEN'
,p_display_when_type=>'ITEM_IS_NULL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94649520039053019)
,p_name=>'P9_ID_PRSNTCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
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
 p_id=>wwv_flow_api.id(94649955633053020)
,p_name=>'P9_ID_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
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
 p_id=>wwv_flow_api.id(94650386897053021)
,p_name=>'P9_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
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
 p_id=>wwv_flow_api.id(94650786041053021)
,p_name=>'P9_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
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
 p_id=>wwv_flow_api.id(94651181890053021)
,p_name=>'P9_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P9_ID_IMPSTO',
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
 p_id=>wwv_flow_api.id(94651534918053022)
,p_name=>'P9_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94651924555053022)
,p_name=>'P9_ID_SLCTUD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94652372302053022)
,p_name=>'P9_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
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
 p_id=>wwv_flow_api.id(94652798541053022)
,p_name=>'P9_FCHA_RDCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
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
 p_id=>wwv_flow_api.id(94653178325053022)
,p_name=>'P9_ID_INSTNCIA_FLJO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(408385623752921672)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94653861697053023)
,p_name=>'P9_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(408137382357597092)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94654286372053023)
,p_name=>'P9_DSCRPCION_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(408137382357597092)
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
 p_id=>wwv_flow_api.id(94654607633053023)
,p_name=>'P9_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(408137382357597092)
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
 p_id=>wwv_flow_api.id(94655098702053024)
,p_name=>'P9_PRMER_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(408137382357597092)
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
 p_id=>wwv_flow_api.id(94655410449053024)
,p_name=>'P9_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(408137382357597092)
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
 p_id=>wwv_flow_api.id(94655839934053024)
,p_name=>'P9_PRMER_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(408137382357597092)
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
 p_id=>wwv_flow_api.id(94656295813053024)
,p_name=>'P9_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(408137382357597092)
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94656943318053025)
,p_name=>'P9_DSCRPCION_RSPNSBLE_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94657360724053025)
,p_name=>'P9_DSCRPCION_IDNTFCCION_TPO_S'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94657734302053025)
,p_name=>'P9_IDNTFCCION_S'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94658167906053026)
,p_name=>'P9_PRMER_NMBRE_S'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94658571375053026)
,p_name=>'P9_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94658917771053026)
,p_name=>'P9_PRMER_APLLDO_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94659335144053026)
,p_name=>'P9_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94659779574053026)
,p_name=>'P9_NMBRE_PAIS_NTFCCION_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94660133148053027)
,p_name=>'P9_NMBRE_DPRTMNTO_NTFCCION_S'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94660587479053027)
,p_name=>'P9_NMBRE_MNCPIO_NTFCCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94660906660053027)
,p_name=>'P9_DRCCION_NTFCCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94661329244053027)
,p_name=>'P9_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94661774701053027)
,p_name=>'P9_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94662102880053028)
,p_name=>'P9_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(408142264446598694)
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
 p_id=>wwv_flow_api.id(94666974326053041)
,p_name=>'P9_ID_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94667394360053041)
,p_name=>'P9_ID_RCRSO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94667785278053041)
,p_name=>'P9_NMRO_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
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
 p_id=>wwv_flow_api.id(94668160438053041)
,p_name=>'P9_FCHA_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
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
 p_id=>wwv_flow_api.id(94668529942053041)
,p_name=>'P9_FCHA_OPTIMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
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
 p_id=>wwv_flow_api.id(94668990475053042)
,p_name=>'P9_ID_RCRSO_TIPO_CLNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
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
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94669376101053042)
,p_name=>'P9_INDCDOR_AIR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94669702466053042)
,p_name=>'P9_AIR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
,p_prompt=>unistr('Acci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Admisi\00F3n;A,Inadmisi\00F3n;I,Rechazo;R')
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94670120068053042)
,p_name=>'P9_DSCRPCION_ACTO_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94670582933053043)
,p_name=>'P9_DFRNCIA_DIAS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(170534792139403810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94686578711066932)
,p_name=>'P9_ID_RCRSO_DCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(178532368785448661)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94719060943120012)
,p_name=>'P9_ORDEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(178532368785448661)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94730818448135668)
,p_name=>'P9_OBSRVCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(262735914147710540)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141879368433564123)
,p_name=>'P9_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(425207422721858620)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141879735510564138)
,p_name=>'P9_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(425207422721858620)
,p_prompt=>'Fecha Inicio Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141880189854564138)
,p_name=>'P9_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(425207422721858620)
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
 p_id=>wwv_flow_api.id(141880543728564138)
,p_name=>'P9_DIAS_FLTNTES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(425207422721858620)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141880986204564138)
,p_name=>'P9_TXTO_DRCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(425207422721858620)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153384715945458701)
,p_name=>'P9_CDGO_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(178532368785448661)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_fljo',
'from wf_d_flujos a join wf_d_flujos_tarea b on a.id_fljo = b.id_fljo',
'where b.id_fljo_trea = :F_ID_FLJO_TREA',
'and a.cdgo_clnte = :F_CDGO_CLNTE'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95519427608730503)
,p_validation_name=>'Valida documentos al Registrar Inadmision'
,p_validation_sequence=>30
,p_validation=>'P9_JSON_DOCUMENTOS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione los documentos!'
,p_when_button_pressed=>wwv_flow_api.id(94676470294053052)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95519535916730504)
,p_validation_name=>'Valida motivos al Registrar Inadmision'
,p_validation_sequence=>40
,p_validation=>'P9_JSON_MOTIVOS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor seleccione los motivos de Inadmisi\00F3n!')
,p_when_button_pressed=>wwv_flow_api.id(94676470294053052)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95519316447730502)
,p_validation_name=>unistr('Valida si hay actos pendientes por generar al presionar Finalizar Generaci\00F3n de Actos')
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_actos varchar2(1);',
'begin',
'    select case ',
'            when count(a.id_actos_tpo_trea) > 0 then ''S''',
'            when count(a.id_actos_tpo_trea) < 1 then ''N''',
'           end',
'    into v_actos',
'    from gn_d_actos_tipo_tarea a',
'    inner join gj_g_recursos          b on b.id_instncia_fljo_hjo   = :F_ID_INSTNCIA_FLJO',
'    left join gj_g_recursos_documento c on b.id_rcrso               = c.id_rcrso and',
'                                           a.id_acto_tpo            = c.id_acto_tpo and',
'                                           a.id_fljo_trea           = c.id_fljo_trea',
'    where a.id_fljo_trea        = :F_ID_FLJO_TREA and',
'          a.indcdor_oblgtrio    = ''S'' and',
'          c.id_acto is null;',
'    if(v_actos = ''S'')then',
'         return ''Actos pendientes por generar por favor verifique'';',
'    else',
'        return null;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'BTN_RGSTRA_ADMISION,BTN_RGSTRA_RCHZO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95519245979730501)
,p_validation_name=>'Valida Observacion al Registrar'
,p_validation_sequence=>60
,p_validation=>'P9_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Campo #LABEL# vacio por favor verifique!'
,p_when_button_pressed=>wwv_flow_api.id(95039151092405405)
,p_associated_item=>wwv_flow_api.id(94730818448135668)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94682715806053062)
,p_name=>'Al cambiar seleccion'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID_RCRSO_TIPO_CLNTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94683297695053062)
,p_event_id=>wwv_flow_api.id(94682715806053062)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P9_ID_RCRSO_TIPO_CLNTE'', :P9_ID_RCRSO_TIPO_CLNTE);',
'    select a_i_r',
'    into :P9_INDCDOR_AIR',
'    from gj_d_recursos_tipo_cliente',
'    where id_rcrso_tipo_clnte = :P9_ID_RCRSO_TIPO_CLNTE;',
'exception',
'    when no_data_found then',
'        :P9_INDCDOR_AIR := null;',
'end;'))
,p_attribute_02=>'P9_ID_RCRSO_TIPO_CLNTE'
,p_attribute_03=>'P9_INDCDOR_AIR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94679985992053060)
,p_name=>'Al cambiar Indicador AIR'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_INDCDOR_AIR'
,p_condition_element=>'P9_INDCDOR_AIR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94680427772053061)
,p_event_id=>wwv_flow_api.id(94679985992053060)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_AIR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94680903269053061)
,p_event_id=>wwv_flow_api.id(94679985992053060)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_AIR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94681453246053061)
,p_event_id=>wwv_flow_api.id(94679985992053060)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_AIR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94531636490887037)
,p_name=>'Al cambiar seleccion en documentos'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(94531145308887032)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P9_ORDEN'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94531700391887038)
,p_event_id=>wwv_flow_api.id(94531636490887037)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerDocumentos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94532819262887049)
,p_name=>'Al cambiar seleccion en motivos'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(94531813532887039)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P9_ORDEN'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94532904980887050)
,p_event_id=>wwv_flow_api.id(94532819262887049)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerMotivos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73228822210510808)
,p_name=>unistr('Al Cerrar Modal Registro de Observaci\00F3n')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(95039151092405405)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73228953817510809)
,p_event_id=>wwv_flow_api.id(73228822210510808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73228164829510801)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153164656969746901)
,p_name=>'Al cerrar la modal de Actualizar Documentos'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(343334525019249404)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
,p_display_when_type=>'NOT_EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select md.id_mtvo_dcmnto',
'        , md.dscrpcion_dcmnto',
'        , blob001 file_blob',
'        , c002 file_name',
'        , c001 obsrvcion,',
'        case',
'            when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'            else  ''Pendiente''',
'        end Estado        ',
'     from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'left join apex_collections c',
'       on md.id_mtvo_dcmnto = n001    ',
'      and collection_name = ''DOCUMENTOS''',
'    where d.id_slctud = :P9_ID_SLCTUD',
'      and d.indcdor_actlzar = ''S''',
'      ;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153164780891746902)
,p_event_id=>wwv_flow_api.id(153164656969746901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(343334525019249404)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94677941055053058)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_tpo,',
'            a.id_mtvo,',
'            b.nmbre_impsto,',
'            c.nmbre_impsto_sbmpsto,',
'            a.idntfccion,',
'            a.id_rdcdor,',
'            a.id_slctud,',
'            a.nmro_rdcdo_dsplay,',
'            a.fcha_rdcdo,',
'            a.id_prsntcion_tpo',
'      into :P9_ID_TPO,',
'           :P9_ID_MTVO,',
'           :P9_NMBRE_IMPSTO,',
'           :P9_NMBRE_IMPSTO_SBMPSTO,',
'           :P9_IDNTFCCION_SJTO,',
'           :P9_ID_RDCDOR,',
'           :P9_ID_SLCTUD,',
'           :P9_NMRO_RDCDO_DSPLAY,',
'           :P9_FCHA_RDCDO,',
'           :P9_ID_PRSNTCION_TPO',
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
 p_id=>wwv_flow_api.id(94678372441053059)
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
'    into    :P9_DSCRPCION_IDNTFCCION_TPO,',
'            :P9_IDNTFCCION,',
'            :P9_PRMER_NMBRE,',
'            :P9_SGNDO_NMBRE,',
'            :P9_PRMER_APLLDO,',
'            :P9_SGNDO_APLLDO',
'    from pq_g_radicador a',
'    inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where id_rdcdor = :P9_ID_RDCDOR;',
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
 p_id=>wwv_flow_api.id(94678735481053059)
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
'      into :P9_DSCRPCION_RSPNSBLE_TPO,',
'           :P9_DSCRPCION_IDNTFCCION_TPO_S,',
'           :P9_IDNTFCCION_S,',
'           :P9_PRMER_NMBRE_S,',
'           :P9_SGNDO_NMBRE_S ,',
'           :P9_PRMER_APLLDO_S,',
'           :P9_SGNDO_APLLDO_S,',
'           :P9_NMBRE_PAIS_NTFCCION_S,',
'           :P9_NMBRE_DPRTMNTO_NTFCCION_S,',
'           :P9_NMBRE_MNCPIO_NTFCCION_S,',
'           :P9_DRCCION_NTFCCION_S,',
'           :P9_EMAIL_S,',
'           :P9_TLFNO_S,',
'           :P9_CLLAR_S',
'      from pq_g_solicitantes a',
'      inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'      inner join v_df_s_municipios c on a.id_mncpio_ntfccion = c.id_mncpio',
'      inner join df_s_responsables_tipo d on a.cdgo_rspnsble_tpo = d.cdgo_rspnsble_tpo',
'     where a.id_slctud = :P9_ID_SLCTUD;',
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
 p_id=>wwv_flow_api.id(94679193918053059)
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
'    into :P9_ID_RCRSO,',
'         :P9_ID_ACTO, ',
'         :P9_NMRO_ACTO, ',
'         :P9_DSCRPCION_ACTO_TPO, ',
'         :P9_FCHA_NTFCCION, ',
'         :P9_FCHA_OPTIMA, ',
'         :P9_DFRNCIA_DIAS,',
'         :P9_ID_RCRSO_TIPO_CLNTE,',
'         :P9_AIR,',
'         :P9_INDCDOR_AIR',
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
'         where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO);',
'exception',
'    when no_data_found then',
'        null;',
'    when others then',
'        raise_application_error(-20000,''Problemas al consultar recurso'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(153384871719458702)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Del Flujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.cdgo_fljo into :P9_CDGO_FLJO',
'    from wf_d_flujos a join wf_d_flujos_tarea b on a.id_fljo = b.id_fljo',
'    where b.id_fljo_trea = :F_ID_FLJO_TREA',
'    and a.cdgo_clnte = :F_CDGO_CLNTE;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141892856983571153)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta duraci\00F3n etapa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.nmbre_trcro ,',
'        trunc(a.fcha_incio) , ',
'        trunc(a.fcha_fin_plnda) ,    ',
'        trunc(a.fcha_fin_plnda) - trunc(sysdate) dias_fltntes,',
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
'into    :P9_USRIO,',
'        :P9_FCHA_INCIO,',
'        :P9_FCHA_FIN, ',
'        :P9_DIAS_FLTNTES, ',
'        :P9_TXTO_DRCION',
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
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6170871592678903)
,p_process_sequence=>80
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Acto Auto Inadmisorio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_acto',
'      into :P9_ID_ACTO_AUI',
'    from gj_g_recursos_documento a',
'    join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'    where a.id_rcrso = :P9_ID_RCRSO',
'      and b.cdgo_acto_tpo = ''AUI'';',
'exception',
'    when others then',
'    :P9_ID_ACTO_AUI := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94718371474120005)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Documentos, Motivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(3000);',
'begin',
'    pkg_gj_recurso.prc_rg_mtvos_dcmntos(',
'        p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'        p_id_rcrso              => :P9_ID_RCRSO,',
'        p_id_instncia_fljo	    => :F_ID_INSTNCIA_FLJO,',
'        p_id_fljo_trea		    => :F_ID_FLJO_TREA,',
'        p_id_usrio			    => :F_ID_USRIO,',
'        p_json_dcmntos          => :P9_JSON_DOCUMENTOS,',
'        p_json_mtvos            => :P9_JSON_MOTIVOS,',
'        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94676470294053052)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94732452744141346)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000); ',
'begin',
'    begin',
'        pkg_gj_recurso.prc_rg_etapa_documentos(p_cdgo_clnte			=>    :F_CDGO_CLNTE',
'                                              ,p_id_instncia_fljo	=>    :F_ID_INSTNCIA_FLJO',
'                                              ,p_id_fljo_trea		=>    :F_ID_FLJO_TREA',
'                                              ,p_id_usrio			=>    :F_ID_USRIO',
'                                              ,p_id_rcrso_dcmnto	=>    :P9_ID_RCRSO_DCMNTO',
'                                              ,o_cdgo_rspsta		=>    v_cdgo_rspsta',
'                                              ,o_mnsje_rspsta		=>    v_mnsje_rspsta);',
'        exception',
'            when others then',
'                v_cdgo_rspsta  := 1;',
'                v_mnsje_rspsta := ''Problemas al llamar el procedimiento.'';',
'    end;',
'    if(v_cdgo_rspsta != 0)then',
'        apex_error.add_error (',
'            p_message          => v_mnsje_rspsta,',
'            p_display_location => apex_error.c_inline_in_notification ',
'        );',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'generarDocumentos'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('Documento(s) generado(s) con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95039214887405406)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Observacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(3000);',
'    v_id_rcrso_dtlle     number;',
'begin',
'    pkg_gj_recurso.prc_rg_recurso_detalle(',
'        p_cdgo_clnte            => :F_CDGO_CLNTE,',
'        p_id_rcrso              => :P9_ID_RCRSO,',
'        p_id_fljo_trea          => :F_ID_FLJO_TREA,',
'        p_id_mtvo_clnte         => null,',
'        p_obsrvcion             => :P9_OBSRVCION,',
'        p_id_usrio              => :F_ID_USRIO,',
'        p_fcha                  => systimestamp,',
'        o_id_rcrso_dtlle        => v_id_rcrso_dtlle,',
'        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'    ',
'    :P9_OBSRVCION := null;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95039151092405405)
,p_process_success_message=>unistr('Observaci\00F3n Registrada Exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95631296182487702)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualiza AIR del recurso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_air             varchar2(1);',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'begin',
'    --Validamos la solicitud',
'    if(:REQUEST = ''BTN_RGSTRA_ADMISION'')then',
'        v_air := ''A'';',
'    elsif(:REQUEST = ''BTN_RGSTRA_RCHZO'')then',
'        v_air := ''R'';',
'    else',
'        raise_application_error(-20000, ''Error request'');',
'    end if;',
'    pkg_gj_recurso.prc_ac_air_recurso(',
'        p_cdgo_clnte		=> :F_CDGO_CLNTE, ',
'        p_id_rcrso          => :P9_ID_RCRSO, ',
'        p_a_i_r             => v_air, ',
'        p_id_usrio			=> :F_ID_USRIO, ',
'        o_cdgo_rspsta		=> v_cdgo_rspsta, ',
'        o_mnsje_rspsta      => v_mnsje_rspsta ',
'    );',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_RGSTRA_ADMISION,BTN_RGSTRA_RCHZO'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94718276133120004)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Workflow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_RGSTRA_ADMISION,BTN_RGSTRA_RCHZO'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
