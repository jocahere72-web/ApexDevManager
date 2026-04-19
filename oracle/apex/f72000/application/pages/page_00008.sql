prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('Admisi\00F3n')
,p_step_title=>unistr('Admisi\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerDocumentos(){',
'    var region = apex.region("P8_DCMNTOS_GRID");',
'    var documentos  = [];',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                documentos.push({"id_dcmnto":model.getValue(records[i], "ID_DCMNTO").trim()});',
'            }',
'           $s("P8_JSON_DOCUMENTOS",JSON.stringify(documentos));',
'        }',
'        else{',
'           $s("P8_JSON_DOCUMENTOS",null);   ',
'        }',
'    }',
'};',
'',
'function obtenerMotivos(){',
'    var region = apex.region("P8_MTVOS_GRID");',
'    var documentos  = [];',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                documentos.push({"id_mtvo_clnte":model.getValue(records[i], "ID_MTVO_CLNTE").trim()});',
'            }',
'           $s("P8_JSON_MOTIVOS",JSON.stringify(documentos));',
'        }',
'        else{',
'           $s("P8_JSON_MOTIVOS",null);   ',
'        }',
'    }',
'};',
'',
'function generarDocumentos(p_id_rcrso_dcmnto){',
'    ',
'    apex.submit({',
'      request:"generarDocumentos",',
'      set:{"P8_ID_RCRSO_DCMNTO":p_id_rcrso_dcmnto}});        ',
'};'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241029044357'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(283328418651294562)
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
 p_id=>wwv_flow_api.id(358749135213563808)
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
 p_id=>wwv_flow_api.id(360112630114806219)
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
 p_id=>wwv_flow_api.id(368110206760851070)
,p_plug_name=>unistr('Generaci\00F3n de Actos')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(72932069932094503)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(111818077645918513)
,p_plug_name=>'Vigencias Seleccionadas'
,p_parent_plug_id=>wwv_flow_api.id(368110206760851070)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.id_rcrso_vgncia, c.id_acto_vgncia, e.vgncia, d.dscrpcion, d.prdo ',
'from gj_g_recursos a',
'inner join v_pq_g_solicitudes b on a.id_slctud = b.id_slctud',
'inner join gj_g_recursos_vigencia c on a.id_rcrso = c.id_rcrso',
'inner join gn_g_actos_vigencia e on c.id_acto_vgncia = e.id_acto_vgncia',
'inner join df_i_periodos d on e.id_prdo = d.id_prdo',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*  select 1',
'from gj_g_recursos',
'where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO and',
'      indcdor_vgncias_cnfrmdas = ''N''*/',
'      ',
'select 1',
'from gj_g_recursos a',
'join gj_d_recursos_tipo_cliente b on a.id_rcrso_tipo_clnte = b.id_rcrso_tipo_clnte',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO',
'  and indcdor_vgncias_cnfrmdas = ''N''',
'  and b.cdgo_rcrso_tpo <> ''RPS'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111818287751918515)
,p_name=>'ID_ACTO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111818366548918516)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(111818441865918517)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(111903491148539108)
,p_name=>'BTN_REMOVER'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:red" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Remover          <span class="fa fa-trash-o"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:8:&SESSION.:RemoverVigencia:&DEBUG.:RP:P8_ID_RCRSO_VGNCIA:&ID_RCRSO_VGNCIA.'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos',
'where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO and',
'      indcdor_vgncias_cnfrmdas = ''N'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111903793863539111)
,p_name=>'ID_RCRSO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114018118916929504)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(111818118149918514)
,p_internal_uid=>111818118149918514
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se ha encontrado ninguna vigencia.'
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
 p_id=>wwv_flow_api.id(111848097175163676)
,p_interactive_grid_id=>wwv_flow_api.id(111818118149918514)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(111848154026163676)
,p_report_id=>wwv_flow_api.id(111848097175163676)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(52310233111634)
,p_view_id=>wwv_flow_api.id(111848154026163676)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(114018118916929504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111848664815163679)
,p_view_id=>wwv_flow_api.id(111848154026163676)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(111818287751918515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111849142796163680)
,p_view_id=>wwv_flow_api.id(111848154026163676)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(111818366548918516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111849626781163681)
,p_view_id=>wwv_flow_api.id(111848154026163676)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(111818441865918517)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111925857688141193)
,p_view_id=>wwv_flow_api.id(111848154026163676)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(111903491148539108)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>53
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111930319659234424)
,p_view_id=>wwv_flow_api.id(111848154026163676)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(111903793863539111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(368109675201851065)
,p_plug_name=>'Actos'
,p_parent_plug_id=>wwv_flow_api.id(368110206760851070)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  g.id_acto_tpo, g.dscrpcion_acto_tpo, g.ACCION, g.Confirmar, g.id_rcrso_dcmnto, LECTURA, g.Nmero_Acto,g.INDCDOR_NTFCCION, g.fcha_ntfccion--, g.id_acto',
'from(',
'    select  a.id_actos_tpo_trea,',
'            a.id_acto_tpo,',
'            b.dscrpcion dscrpcion_acto_tpo,',
'            case',
'                 when ((a.id_acto_tpo_rqrdo is null and d.id_acto is null) or  (a.id_acto_tpo_rqrdo is not null and d.id_acto is not null and d.id_acto is null))then',
'                     ''<center>',
'                         <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                             ||nvl2(d.id_rcrso_dcmnto, ''Modificar '', ''Generar '')',
'                             ||''<span class="fa ''||nvl2(d.id_rcrso_dcmnto,''fa-edit'',''fa-gear fa-anim-spin'')||''"></span>',
'                         </button>',
'                     </center>''',
'                when((a.id_acto_tpo_rqrdo is null and d.id_acto is not null)or (a.id_acto_tpo_rqrdo is not null and d.id_acto is not null and d.id_acto is not null))then',
'                    ''<span aria-hidden="true" class="fa fa-check"></span>''',
'            end  ACCION,',
'            case',
'                 when ((a.id_acto_tpo_rqrdo is null and d.id_rcrso_dcmnto is not null and d.id_acto is null) or  (a.id_acto_tpo_rqrdo is not null and d.id_acto is not null and d.id_rcrso_dcmnto is not null and d.id_acto is null))then',
'                     ''<center>',
'                         <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Confirmar',
'                             <span class="fa fa-check"></span>',
'                         </button>',
'                      </center>''',
'            end Confirmar,',
'            case',
'                 when (/*a.id_acto_tpo = 185 and*/ d.id_acto is not null)then',
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
'            --d.id_acto',
'    from gn_d_actos_tipo_tarea          a',
'    inner join  gn_d_actos_tipo         b on a.id_acto_tpo           =  b.id_acto_tpo',
'    inner join  gj_g_recursos           c on c.id_instncia_fljo_hjo  = :F_ID_INSTNCIA_FLJO',
'    left  join  v_gj_g_recursos_documento d on c.id_rcrso            = d.id_rcrso           and',
'                                             a.id_fljo_trea          = d.id_fljo_trea       and',
'                                             d.id_acto_tpo           = b.id_acto_tpo',
'    --left  join gj_g_recursos_documento  e on c.id_rcrso              = e.id_rcrso           and',
'    --                                         a.id_fljo_trea          = e.id_fljo_trea       and',
'    --                                         a.id_acto_tpo_rqrdo     = e.id_acto_tpo',
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
 p_id=>wwv_flow_api.id(368109747413851066)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'NONE'
,p_show_detail_link=>'N'
,p_owner=>'JCUAO'
,p_internal_uid=>368109747413851066
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94864001760804555)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94864826854804559)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94865222212804561)
,p_db_column_name=>'ID_RCRSO_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Id Rcrso Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94864485481804558)
,p_db_column_name=>'ACCION'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>unistr('Acci\00F3n')
,p_column_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16:P16_ID_ACTO_TPO,P16_ID_RCRSO_DCMNTO,P16_XML,P16_PGNA_ORGN:#ID_ACTO_TPO#,#ID_RCRSO_DCMNTO#,<id_acto>&P8_ID_ACTO.</id_acto><id_slctud>&P8_ID_SLCTUD.</id_slctud><id_acto_tpo>#ID_ACTO_TPO#</id_acto_tpo>,&APP_PAGE_'
||'ID.'
,p_column_linktext=>'#ACCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94865629976804564)
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
,p_static_id=>'generarDocumentos'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(153775832163881402)
,p_db_column_name=>'NMERO_ACTO'
,p_display_order=>80
,p_column_identifier=>'K'
,p_column_label=>unistr('N\00FAmero Acto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(152660928981468401)
,p_db_column_name=>'INDCDOR_NTFCCION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\00BFActo Notificable?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(153775721802881401)
,p_db_column_name=>'LECTURA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Lectura'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(153775993269881403)
,p_db_column_name=>'FCHA_NTFCCION'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>unistr('Fecha Notificaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(368191530560454080)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'948660'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ACTO_TPO:ACCION:ID_ACTO_TPO:ID_RCRSO_DCMNTO:CONFIRMAR:INDCDOR_NTFCCION:LECTURA:NMERO_ACTO:FCHA_NTFCCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(452313752123112949)
,p_plug_name=>unistr('Observaci\00F3n')
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
 p_id=>wwv_flow_api.id(71367906055308801)
,p_plug_name=>'Observaciones'
,p_parent_plug_id=>wwv_flow_api.id(452313752123112949)
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
'where a.id_rcrso = :P8_ID_RCRSO',
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
 p_id=>wwv_flow_api.id(71368006982308802)
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
,p_internal_uid=>71368006982308802
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71368150139308803)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71368216424308804)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71368392846308805)
,p_db_column_name=>'NMBRE_TREA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71368400696308806)
,p_db_column_name=>'FCHA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71368596403308807)
,p_db_column_name=>'ID_RCRSO_DTLLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Rcrso Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(71374943283314911)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'713750'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBSRVCION:NMBRE_TRCRO:NMBRE_TREA:FCHA:ID_RCRSO_DTLLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(469572394901131026)
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
 p_id=>wwv_flow_api.id(515556865343493394)
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
 p_id=>wwv_flow_api.id(532912362994651813)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(515556865343493394)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(597724803407003008)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(532912362994651813)
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
'    where id_slctud = :P8_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(524963044557122513)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>524963044557122513
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94858109174804545)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94858595734804546)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94858978303804547)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94859369018804547)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94859786399804547)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94860164561804547)
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
 p_id=>wwv_flow_api.id(94860523629804548)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(524976511843128780)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'948609'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ACTVO:ID_DCMNTO:'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(597715220332999501)
,p_plug_name=>'Datos del Gestor'
,p_parent_plug_id=>wwv_flow_api.id(515556865343493394)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(597720102422001103)
,p_plug_name=>'Datos del Solicitante'
,p_parent_plug_id=>wwv_flow_api.id(515556865343493394)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(597963461728324081)
,p_plug_name=>'Datos Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(515556865343493394)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(863757306837887729)
,p_plug_name=>'Etapas'
,p_parent_plug_id=>wwv_flow_api.id(515556865343493394)
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
'           end actvo',
'from        wf_g_instancias_transicion      a',
'inner join  v_wf_d_flujos_tarea             b   on  b.id_fljo_trea          =   a.id_fljo_trea_orgen',
'left  join  gj_g_recursos                   c   on  c.id_instncia_fljo_hjo  =   a.id_instncia_fljo',
'where       b.cdgo_clnte            =       :F_CDGO_CLNTE',
'and         a.id_instncia_fljo      =       :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(626923489359169774)
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
 p_id=>wwv_flow_api.id(626923584505169775)
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
 p_id=>wwv_flow_api.id(626923734597169776)
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
 p_id=>wwv_flow_api.id(626923791207169777)
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
 p_id=>wwv_flow_api.id(626923954782169778)
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
 p_id=>wwv_flow_api.id(626924133801169780)
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
 p_id=>wwv_flow_api.id(626946950279292976)
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
 p_id=>wwv_flow_api.id(626946974245292977)
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
 p_id=>wwv_flow_api.id(626923260907169772)
,p_internal_uid=>626923260907169772
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
 p_id=>wwv_flow_api.id(626929230114170261)
,p_interactive_grid_id=>wwv_flow_api.id(626923260907169772)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(626929271378170262)
,p_report_id=>wwv_flow_api.id(626929230114170261)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(626930316521170272)
,p_view_id=>wwv_flow_api.id(626929271378170262)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(626923489359169774)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(626930774874170274)
,p_view_id=>wwv_flow_api.id(626929271378170262)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(626923584505169775)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(626931348360170275)
,p_view_id=>wwv_flow_api.id(626929271378170262)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(626923734597169776)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(626931738341170276)
,p_view_id=>wwv_flow_api.id(626929271378170262)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(626923791207169777)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(626932158233170278)
,p_view_id=>wwv_flow_api.id(626929271378170262)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(626923954782169778)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(626933170730170281)
,p_view_id=>wwv_flow_api.id(626929271378170262)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(626924133801169780)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(626971683743583502)
,p_view_id=>wwv_flow_api.id(626929271378170262)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(626946950279292976)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(626974347862603963)
,p_view_id=>wwv_flow_api.id(626929271378170262)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(626946974245292977)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(121572000003)
,p_view_id=>wwv_flow_api.id(626929271378170262)
,p_execution_seq=>5
,p_name=>'Activo'
,p_background_color=>'#0472CE'
,p_text_color=>'#FFFFFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(626924133801169780)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(742022750652990174)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('<i>Funcionalidad que permite registrar las vigencias asociadas al recurso y la generaci\00F3n de actos.'),
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
 p_id=>wwv_flow_api.id(111818606193918519)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(469572394901131026)
,p_button_name=>'BTN_ADICIONAR_VIGENCIAS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Adicionar Vigencias'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*  select 1',
'from gj_g_recursos',
'where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO and',
'      indcdor_vgncias_cnfrmdas = ''N''*/',
'      ',
'select 1',
'from gj_g_recursos a',
'join gj_d_recursos_tipo_cliente b on a.id_rcrso_tipo_clnte = b.id_rcrso_tipo_clnte',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO',
'  and indcdor_vgncias_cnfrmdas = ''N''',
'  and b.cdgo_rcrso_tpo <> ''RPS'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111988306839441802)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(469572394901131026)
,p_button_name=>'BTN_CNFRMAR_VGNCIAS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Confirmar Vigencias'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select 1',
'from gj_g_recursos',
'where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO and',
'indcdor_vgncias_cnfrmdas = ''N''*/',
'      ',
'select 1',
'from gj_g_recursos a',
'join gj_d_recursos_tipo_cliente b on a.id_rcrso_tipo_clnte = b.id_rcrso_tipo_clnte',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO',
'  and indcdor_vgncias_cnfrmdas = ''N''',
'  and b.cdgo_rcrso_tpo <> ''RPS'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94861690968804551)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(469572394901131026)
,p_button_name=>'BTN_RGSTRA_ADMSION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Admisi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96847410957130122)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(452313752123112949)
,p_button_name=>'BTN_RGSTRA_OBSRVACION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('A\00F1adir Observaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP:P39_ID_FLJO_TREA,P39_ID_RCRSO,P39_ID_USRIO:&F_ID_FLJO_TREA.,&P8_ID_RCRSO.,&F_ID_USRIO.'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94880048536826704)
,p_branch_name=>'Actualizar Pagina'
,p_branch_action=>'f?p=72000:8:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'generarDocumentos'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50186488100832401)
,p_name=>'P8_MENSAJE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94835232647804513)
,p_name=>'P8_ID_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94835670084804514)
,p_name=>'P8_ID_RCRSO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94836079844804514)
,p_name=>'P8_NMRO_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
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
 p_id=>wwv_flow_api.id(94836429377804515)
,p_name=>'P8_FCHA_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
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
 p_id=>wwv_flow_api.id(94836879951804515)
,p_name=>'P8_FCHA_OPTIMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
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
 p_id=>wwv_flow_api.id(94837263668804515)
,p_name=>'P8_ID_RCRSO_TIPO_CLNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
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
 p_id=>wwv_flow_api.id(94837684276804516)
,p_name=>'P8_INDCDOR_AIR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94838023457804516)
,p_name=>'P8_AIR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
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
 p_id=>wwv_flow_api.id(94838483026804516)
,p_name=>'P8_DSCRPCION_ACTO_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94838858374804516)
,p_name=>'P8_DFRNCIA_DIAS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(360112630114806219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94839599285804518)
,p_name=>'P8_OBSRVCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(452313752123112949)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94844586855804533)
,p_name=>'P8_ID_PRSNTCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
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
 p_id=>wwv_flow_api.id(94844948522804533)
,p_name=>'P8_ID_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
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
 p_id=>wwv_flow_api.id(94845356680804533)
,p_name=>'P8_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
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
 p_id=>wwv_flow_api.id(94845716756804534)
,p_name=>'P8_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
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
 p_id=>wwv_flow_api.id(94846141675804534)
,p_name=>'P8_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P8_ID_IMPSTO',
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
 p_id=>wwv_flow_api.id(94846563668804534)
,p_name=>'P8_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_api.id(94846942998804537)
,p_name=>'P8_ID_SLCTUD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94847348183804537)
,p_name=>'P8_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
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
 p_id=>wwv_flow_api.id(94847727742804537)
,p_name=>'P8_FCHA_RDCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
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
 p_id=>wwv_flow_api.id(94848157859804537)
,p_name=>'P8_ID_INSTNCIA_FLJO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94848890791804538)
,p_name=>'P8_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(597715220332999501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94849258623804538)
,p_name=>'P8_DSCRPCION_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(597715220332999501)
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
 p_id=>wwv_flow_api.id(94849677607804538)
,p_name=>'P8_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(597715220332999501)
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
 p_id=>wwv_flow_api.id(94850011382804538)
,p_name=>'P8_PRMER_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(597715220332999501)
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
 p_id=>wwv_flow_api.id(94850412613804539)
,p_name=>'P8_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(597715220332999501)
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
 p_id=>wwv_flow_api.id(94850829712804539)
,p_name=>'P8_PRMER_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(597715220332999501)
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
 p_id=>wwv_flow_api.id(94851204298804539)
,p_name=>'P8_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(597715220332999501)
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
 p_id=>wwv_flow_api.id(94851931917804540)
,p_name=>'P8_DSCRPCION_RSPNSBLE_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94852334654804540)
,p_name=>'P8_DSCRPCION_IDNTFCCION_TPO_S'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94852794283804540)
,p_name=>'P8_IDNTFCCION_S'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94853172522804540)
,p_name=>'P8_PRMER_NMBRE_S'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94853549265804540)
,p_name=>'P8_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94853976636804541)
,p_name=>'P8_PRMER_APLLDO_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94854308995804541)
,p_name=>'P8_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94854727526804541)
,p_name=>'P8_NMBRE_PAIS_NTFCCION_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94855160157804541)
,p_name=>'P8_NMBRE_DPRTMNTO_NTFCCION_S'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94855587771804541)
,p_name=>'P8_NMBRE_MNCPIO_NTFCCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94855992618804542)
,p_name=>'P8_DRCCION_NTFCCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94856347395804542)
,p_name=>'P8_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94856769121804542)
,p_name=>'P8_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94857149441804542)
,p_name=>'P8_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(597720102422001103)
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
 p_id=>wwv_flow_api.id(94862913623804553)
,p_name=>'P8_ID_RCRSO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(368110206760851070)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111817028540918503)
,p_name=>'P8_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111903682151539110)
,p_name=>'P8_ID_RCRSO_VGNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(111818077645918513)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141670078870061546)
,p_name=>'P8_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(283328418651294562)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141670367660061553)
,p_name=>'P8_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(283328418651294562)
,p_prompt=>'Fecha Inicio Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141670755556061553)
,p_name=>'P8_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(283328418651294562)
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
 p_id=>wwv_flow_api.id(141671175131061553)
,p_name=>'P8_DIAS_FLTNTES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(283328418651294562)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141671552422061553)
,p_name=>'P8_TXTO_DRCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(283328418651294562)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153391860581542802)
,p_name=>'P8_CDGO_FLJO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(597963461728324081)
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
 p_id=>wwv_flow_api.id(96847756024131857)
,p_validation_name=>'Valida Observacion al Registrar'
,p_validation_sequence=>10
,p_validation=>'P8_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vac\00EDo, por favor verifique.')
,p_when_button_pressed=>wwv_flow_api.id(96847410957130122)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(111988249793441801)
,p_validation_name=>'Valida Vigencias al Confirmar Documentos'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos',
'where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO ',
'  and indcdor_vgncias_cnfrmdas = ''S'''))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Para poder confirmar el acto es necesario que las vigencias est\00E9n confirmadas.')
,p_always_execute=>'Y'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos a',
'join gj_d_recursos_tipo_cliente b on a.id_rcrso_tipo_clnte = b.id_rcrso_tipo_clnte',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO',
'  and indcdor_vgncias_cnfrmdas = ''N''',
'  and b.cdgo_rcrso_tpo <> ''RPS'''))
,p_validation_condition_type=>'EXISTS'
,p_when_button_pressed=>wwv_flow_api.id(94861690968804551)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(111988536792441804)
,p_validation_name=>'Valida Vigencias al Confirmar Vigencias'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos_vigencia a',
'inner join gj_g_recursos b on a.id_rcrso = b.id_rcrso',
'where b.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO',
'group by a.id_rcrso'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Por favor adicione las vigencias al recurso para poder confirmar.'
,p_when_button_pressed=>wwv_flow_api.id(111988306839441802)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94871707636804574)
,p_name=>'Al cambiar seleccion'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_RCRSO_TIPO_CLNTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94872235654804575)
,p_event_id=>wwv_flow_api.id(94871707636804574)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P8_ID_RCRSO_TIPO_CLNTE'', :P8_ID_RCRSO_TIPO_CLNTE);',
'    select a_i_r',
'    into :P8_INDCDOR_AIR',
'    from gj_d_recursos_tipo_cliente',
'    where id_rcrso_tipo_clnte = :P8_ID_RCRSO_TIPO_CLNTE;',
'exception',
'    when no_data_found then',
'        :P8_INDCDOR_AIR := null;',
'end;'))
,p_attribute_02=>'P8_ID_RCRSO_TIPO_CLNTE'
,p_attribute_03=>'P8_INDCDOR_AIR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94872640878804575)
,p_name=>'Al cambiar Indicador AIR'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_INDCDOR_AIR'
,p_condition_element=>'P8_INDCDOR_AIR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94873127541804575)
,p_event_id=>wwv_flow_api.id(94872640878804575)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8_AIR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94874167999804576)
,p_event_id=>wwv_flow_api.id(94872640878804575)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8_AIR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94873686398804575)
,p_event_id=>wwv_flow_api.id(94872640878804575)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8_AIR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104328386323466701)
,p_name=>'al hacer clic en el boton registrar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94861690968804551)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104328414480466702)
,p_event_id=>wwv_flow_api.id(104328386323466701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.clear();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111903103066539105)
,p_name=>'Al cerrar cuadro de dialogo actualizar vigencias'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(111818606193918519)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111903208775539106)
,p_event_id=>wwv_flow_api.id(111903103066539105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(111818077645918513)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71377551401372312)
,p_name=>unistr('Al Cerrar Modal Registro de Observaci\00F3n')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(96847410957130122)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71377927984372327)
,p_event_id=>wwv_flow_api.id(71377551401372312)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(71367906055308801)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94868910145804570)
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
'            a.id_sjto_impsto,',
'            a.id_rdcdor,',
'            a.id_slctud,',
'            a.nmro_rdcdo_dsplay,',
'            a.fcha_rdcdo,',
'            a.id_prsntcion_tpo',
'      into :P8_ID_TPO,',
'           :P8_ID_MTVO,',
'           :P8_NMBRE_IMPSTO,',
'           :P8_NMBRE_IMPSTO_SBMPSTO,',
'           :P8_IDNTFCCION_SJTO,',
'           :P8_ID_SJTO_IMPSTO,',
'           :P8_ID_RDCDOR,',
'           :P8_ID_SLCTUD,',
'           :P8_NMRO_RDCDO_DSPLAY,',
'           :P8_FCHA_RDCDO,',
'           :P8_ID_PRSNTCION_TPO',
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
 p_id=>wwv_flow_api.id(94869329163804570)
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
'    into    :P8_DSCRPCION_IDNTFCCION_TPO,',
'            :P8_IDNTFCCION,',
'            :P8_PRMER_NMBRE,',
'            :P8_SGNDO_NMBRE,',
'            :P8_PRMER_APLLDO,',
'            :P8_SGNDO_APLLDO',
'    from pq_g_radicador a',
'    inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where id_rdcdor = :P8_ID_RDCDOR;',
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
 p_id=>wwv_flow_api.id(94869784376804572)
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
'      into :P8_DSCRPCION_RSPNSBLE_TPO,',
'           :P8_DSCRPCION_IDNTFCCION_TPO_S,',
'           :P8_IDNTFCCION_S,',
'           :P8_PRMER_NMBRE_S,',
'           :P8_SGNDO_NMBRE_S ,',
'           :P8_PRMER_APLLDO_S,',
'           :P8_SGNDO_APLLDO_S,',
'           :P8_NMBRE_PAIS_NTFCCION_S,',
'           :P8_NMBRE_DPRTMNTO_NTFCCION_S,',
'           :P8_NMBRE_MNCPIO_NTFCCION_S,',
'           :P8_DRCCION_NTFCCION_S,',
'           :P8_EMAIL_S,',
'           :P8_TLFNO_S,',
'           :P8_CLLAR_S',
'      from pq_g_solicitantes a',
'      inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'      inner join v_df_s_municipios c on a.id_mncpio_ntfccion = c.id_mncpio',
'      inner join df_s_responsables_tipo d on a.cdgo_rspnsble_tpo = d.cdgo_rspnsble_tpo',
'     where a.id_slctud = :P8_ID_SLCTUD;',
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
 p_id=>wwv_flow_api.id(94870147913804573)
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
'    into :P8_ID_RCRSO,',
'         :P8_ID_ACTO, ',
'         :P8_NMRO_ACTO, ',
'         :P8_DSCRPCION_ACTO_TPO, ',
'         :P8_FCHA_NTFCCION, ',
'         :P8_FCHA_OPTIMA, ',
'         :P8_DFRNCIA_DIAS,',
'         :P8_ID_RCRSO_TIPO_CLNTE,',
'         :P8_AIR,',
'         :P8_INDCDOR_AIR',
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
 p_id=>wwv_flow_api.id(141669273190057767)
,p_process_sequence=>110
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
'into    :P8_USRIO,',
'        :P8_FCHA_INCIO,',
'        :P8_FCHA_FIN, ',
'        :P8_DIAS_FLTNTES, ',
'        :P8_TXTO_DRCION',
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
 p_id=>wwv_flow_api.id(94871312993804574)
,p_process_sequence=>10
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
'                                              ,p_id_rcrso_dcmnto	=>    :P8_ID_RCRSO_DCMNTO',
'                                              ,o_cdgo_rspsta		=>    v_cdgo_rspsta',
'                                              ,o_mnsje_rspsta		=>    v_mnsje_rspsta);',
'        if(v_cdgo_rspsta != 0)then',
'            raise_application_error(-20001,v_mnsje_rspsta);',
'        end if;',
'        exception',
'            when others then',
'                v_mnsje_rspsta := ''Problemas al llamar el procedimiento.'';',
'                raise_application_error(-20001,sqlerrm);',
'    end;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'generarDocumentos'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('Documento(s) generado(s) con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96847929847133352)
,p_process_sequence=>20
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
'        p_id_rcrso              => :P8_ID_RCRSO,',
'        p_id_fljo_trea          => :F_ID_FLJO_TREA,',
'        p_id_mtvo_clnte         => null,',
'        p_obsrvcion             => :P8_OBSRVCION,',
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
'    :P8_OBSRVCION := null;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(96847410957130122)
,p_process_success_message=>unistr('Observaci\00F3n Registrada Exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108036103542998701)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registra Item Recursos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta number := 0;',
'    v_mnsje_rspsta varchar2(32000);',
'begin',
'        --Registramos los item necesarios para el recurso',
'        pkg_gj_recurso.prc_rg_recursos_item(',
'            p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'            p_id_instncia_fljo		=> :F_ID_INSTNCIA_FLJO,',
'            p_id_usrio              => :F_ID_USRIO,',
'            p_id_fljo_trea		    => :F_ID_FLJO_TREA,',
'            o_cdgo_rspsta			=> v_cdgo_rspsta,',
'            o_mnsje_rspsta          => v_mnsje_rspsta',
'        );',
'        ',
'        if(v_cdgo_rspsta != 0)then',
'             raise_application_error(-20001,v_mnsje_rspsta);',
'        end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94861690968804551)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94870559603804573)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Workflow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94861690968804551)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111988428145441803)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Confimar Vigencias'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_cdgo_rspsta      number;',
'   v_mnsje_rspsta     varchar2(4000);',
'begin',
'    pkg_gj_recurso.prc_ac_recurso_vgncia(',
'        p_cdgo_clnte            => :F_CDGO_CLNTE, ',
'        p_id_instncia_fljo_hjo  => :F_ID_INSTNCIA_FLJO, ',
'        p_id_usrio			    => :F_ID_USRIO, ',
'        o_cdgo_rspsta			=> v_cdgo_rspsta, ',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    if(v_cdgo_rspsta != 0)then',
'       -- raise_application_error(-20001, v_mnsje_rspsta);',
'        :P8_MENSAJE := v_mnsje_rspsta;',
'    else',
'        :P8_MENSAJE := ''Vigencias confirmadas exitosamente.'';        ',
'    end if;',
'end;'))
,p_process_error_message=>'&P8_MENSAJE.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(111988306839441802)
,p_process_success_message=>'&P8_MENSAJE.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112718438184249402)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Marcamos la Cartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    pkg_gj_recurso.prc_ac_cartera(',
'        p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'        p_id_usrio              => :F_ID_USRIO,',
'        p_id_instncia_fljo      => :F_ID_INSTNCIA_FLJO,',
'        p_marcacion             => ''S'',',
'        p_obsrvcion             => ''BLOQUEO DE CARTERA GESTION JURIDICA'',',
'        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    if(v_cdgo_rspsta != 0)then',
'        --raise_application_error(-20001, v_mnsje_rspsta);',
'        :P8_MENSAJE := v_mnsje_rspsta; ',
'    end if;',
'exception    ',
'    when others then',
'      raise_application_error(-20001, sqlerrm);  ',
'end;'))
,p_process_error_message=>'&P8_MENSAJE.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(111988306839441802)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50225817110878201)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Bloqueo de Vigencia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta          number;',
'    v_mnsje_rspsta         varchar2(4000);',
'    v_indcdor_mvmnto_blqdo varchar2(1);',
'    v_obsrvcion_blquo      varchar2(4000);  ',
'    v_id_orgen             number;   ',
'    v_cdgo_trza_orgn       varchar2(1000);',
'begin',
'     pkg_gf_movimientos_financiero.prc_co_movimiento_bloqueada (p_cdgo_clnte             => :F_CDGO_CLNTE,',
'                                                                p_id_sjto_impsto         => :P8_ID_SJTO_IMPSTO,',
'                                                                p_vgncia                 => 2015,',
'                                                                p_id_prdo                => 62,',
'                                                                o_indcdor_mvmnto_blqdo   => V_indcdor_mvmnto_blqdo,',
'                                                                o_cdgo_trza_orgn         => v_cdgo_trza_orgn,',
'                                                                o_id_orgen               => v_id_orgen,',
'                                                                o_obsrvcion_blquo        => v_obsrvcion_blquo,',
'                                                                o_cdgo_rspsta            => v_cdgo_rspsta,',
'                                                                o_mnsje_rspsta           => v_mnsje_rspsta);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111903517112539109)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RemoverVigencia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'begin',
'    pkg_gj_recurso.prc_el_recurso_vgncia(',
'        p_cdgo_clnte            => :F_CDGO_CLNTE,',
'        p_id_rcrso_vgncia       => :P8_ID_RCRSO_VGNCIA,',
'        p_id_usrio			    => :F_ID_USRIO,',
'        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    ',
'    :P8_ID_RCRSO_VGNCIA := null;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RemoverVigencia'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Vigencia eliminada exitosamente'
);
null;
end;
/
