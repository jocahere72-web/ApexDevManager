prompt --application/pages/page_00110
begin
wwv_flow_api.create_page(
 p_id=>110
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Gesti\00F3n')
,p_step_title=>unistr('Prescripci\00F3n Gesti\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(id_instancia,id_fljo_trea){',
'    apex.server.process("IniciarFlujo", {',
'        f01: id_instancia,',
'        f02: id_fljo_trea',
'    }, {',
'        success: function (data) { ',
'                if (data.type === ''OK'') {',
'                    window.localStorage.clear();',
'                    window.location.href = data.url;',
'                    //window.open(data.url);',
'                }else{',
'                    apex.message.showErrors({',
'                        type: apex.message.TYPE.ERROR,',
'                        location: ["page"],',
'                        message: data.msg,',
'                        unsafe: false',
'                    });',
'                }',
'            },',
'            error: function () {',
'                console.log(arguments);',
'            }',
'        }); ',
'}',
'',
'function obtenerSeleccion(){',
'   var region = apex.region("P110_GRID_FLUJOS");',
'   var v_seleccionados  = [];',
'   if (region) {',
'       var view = region.widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'       if($.isEmptyObject(records) == false){',
'           for(let i=0; i<records.length; i++){',
'			   v_seleccionados.push(model.getValue(records[i], "ID_INSTNCIA_FLJO").trim());',
'           }',
'		   $s("P110_SELECCION",v_seleccionados);',
'       }',
'       else{',
'          $s("P110_SELECCION",null);  ',
'       }',
'   } ',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200122162730'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84604559275161601)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84790074794205301)
,p_plug_name=>unistr('Flujo Prescripci\00F3n')
,p_region_name=>'P110_GRID_FLUJOS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.id_instncia_fljo,',
'            g.id_prscrpcion,',
'            g.nmro_prscrpcion,',
'            e.nmbre_trea,',
'            a.id_fljo_trea,',
'            c.fcha_incio,',
'            k.nmro_rdcdo_dsplay,',
'            k.fcha_rdcdo',
'from        v_gf_g_prescripciones_tareas    a',
'inner join  wf_g_instancias_transicion      b   on  b.id_fljo_trea_orgen    =   a.id_fljo_trea',
'inner join  wf_g_instancias_flujo           c   on  c.id_instncia_fljo      =   b.id_instncia_fljo',
'inner join  wf_d_flujos_tarea               d   on  d.id_fljo_trea          =   a.id_fljo_trea',
'inner join  wf_d_tareas                     e   on  e.id_trea               =   d.id_trea',
'inner join  wf_d_flujos                     f   on  f.id_fljo               =   c.id_fljo',
'left  join  gf_g_prescripciones             g   on  g.id_instncia_fljo      =   c.id_instncia_fljo',
'left  join  gf_g_prscrpcnes_sjto_impsto     h   on  h.id_prscrpcion         =   g.id_prscrpcion',
'left  join  si_i_sujetos_impuesto           i   on  i.id_sjto_impsto        =   h.id_sjto_impsto',
'left  join  si_c_sujetos                    j   on  j.id_sjto               =   i.id_sjto',
'left  join  pq_g_solicitudes                k   on  k.id_slctud             =   g.id_slctud',
'where       f.cdgo_clnte                    =   :F_CDGO_CLNTE',
'--and         b.id_usrio                      =   :F_ID_USRIO',
'and         a.id_usrio                      =   :F_ID_USRIO',
'and         nvl(h.id_impsto, 0)             =   nvl(:P110_ID_IMPSTO, nvl(h.id_impsto, 0))',
'and         nvl(h.id_impsto_sbmpsto, 0)     =   nvl(:P110_ID_IMPSTO_SBMPSTO, nvl(h.id_impsto_sbmpsto, 0))',
'and         nvl(j.idntfccion, 0)            =   nvl(:P110_IDNTFCCION, nvl(j.idntfccion, 0))',
'and         f.id_fljo                       =   nvl(:P110_ID_FLJO, f.id_fljo)',
'and         e.id_trea                       =   nvl(:P110_ID_TREA, e.id_trea)',
'and         b.id_instncia_trnscion          =   (select      max(l.id_instncia_trnscion)',
'                                                 from        wf_g_instancias_transicion  l',
'                                                 where       l.id_instncia_fljo  =   c.id_instncia_fljo',
'                                                )',
'and         trunc(c.fcha_incio) between :P110_FECHA and :P110_FECHA_HASTA',
'group by    b.id_instncia_fljo,',
'            g.id_prscrpcion,',
'            g.nmro_prscrpcion,',
'            e.nmbre_trea,',
'            a.id_fljo_trea,',
'            c.fcha_incio,',
'            k.nmro_rdcdo_dsplay,',
'            k.fcha_rdcdo;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(84832747032057403)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(84832816906057404)
,p_name=>'NMRO_PRSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRSCRPCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Prescripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(84833212613057408)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(84833396918057409)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(84833468535057410)
,p_name=>'Opciones'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir a flujo',
'    <span class="fa fa-external-link-square"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88110203899646702)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89162424720023106)
,p_name=>'ID_PRSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION'
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
 p_id=>wwv_flow_api.id(98477090702885701)
,p_name=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(98477103429885702)
,p_name=>'FCHA_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RDCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(120269869091241801)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(84832639339057402)
,p_internal_uid=>84832639339057402
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
 p_id=>wwv_flow_api.id(84844426656104558)
,p_interactive_grid_id=>wwv_flow_api.id(84832639339057402)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>25
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(84844554420104558)
,p_report_id=>wwv_flow_api.id(84844426656104558)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84845012253104559)
,p_view_id=>wwv_flow_api.id(84844554420104558)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(84832747032057403)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84845523865104561)
,p_view_id=>wwv_flow_api.id(84844554420104558)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(84832816906057404)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84847511141104566)
,p_view_id=>wwv_flow_api.id(84844554420104558)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(84833212613057408)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84848077308104567)
,p_view_id=>wwv_flow_api.id(84844554420104558)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(84833396918057409)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84848471550112722)
,p_view_id=>wwv_flow_api.id(84844554420104558)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(84833468535057410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89184559701061424)
,p_view_id=>wwv_flow_api.id(84844554420104558)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(89162424720023106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98483000584886002)
,p_view_id=>wwv_flow_api.id(84844554420104558)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(98477090702885701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98483596837886006)
,p_view_id=>wwv_flow_api.id(84844554420104558)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(98477103429885702)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120275802225242072)
,p_view_id=>wwv_flow_api.id(84844554420104558)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(120269869091241801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84863034379062401)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119137537538474901)
,p_plug_name=>'Vista Tareas'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'begin',
'    htp.p(''<div style="display: flex;align-items: center;justify-content: center;"> <div>'');',
'    for i in (select  m.nmbre_trea,',
'                        m.id_fljo,',
'                        m.id_trea,',
'                        m.id_fljo_trea,',
'                        min(n.orden) orden,',
'                        count(*) ttal_estdo',
'                from    (select      e.nmbre_trea,',
'                                        d.id_fljo,',
'                                        e.id_trea,',
'                                        a.id_fljo_trea',
'                            from        v_gf_g_prescripciones_tareas    a',
'                            inner join  wf_g_instancias_transicion      b   on  b.id_fljo_trea_orgen    =   a.id_fljo_trea',
'                            inner join  wf_g_instancias_flujo           c   on  c.id_instncia_fljo      =   b.id_instncia_fljo',
'                            inner join  wf_d_flujos_tarea               d   on  d.id_fljo_trea          =   a.id_fljo_trea',
'                            inner join  wf_d_tareas                     e   on  e.id_trea               =   d.id_trea',
'                            inner join  wf_d_flujos                     f   on  f.id_fljo               =   c.id_fljo',
'                            left  join  gf_g_prescripciones             g   on  g.id_instncia_fljo      =   c.id_instncia_fljo',
'                            left  join  gf_g_prscrpcnes_sjto_impsto     h   on  h.id_prscrpcion         =   g.id_prscrpcion',
'                            left  join  si_i_sujetos_impuesto           i   on  i.id_sjto_impsto        =   h.id_sjto_impsto',
'                            left  join  si_c_sujetos                    j   on  j.id_sjto               =   i.id_sjto',
'                            left  join  pq_g_solicitudes                k   on  k.id_slctud             =   g.id_slctud',
'                            where       f.cdgo_clnte                    =   :F_CDGO_CLNTE',
'                            and         b.id_usrio                      =   :F_ID_USRIO',
'                            --and         a.id_usrio                      =   :F_ID_USRIO',
'                            and         nvl(h.id_impsto, 0)             =   nvl(:P110_ID_IMPSTO, nvl(h.id_impsto, 0))',
'                            and         nvl(h.id_impsto_sbmpsto, 0)     =   nvl(:P110_ID_IMPSTO_SBMPSTO, nvl(h.id_impsto_sbmpsto, 0))',
'                            and         nvl(j.idntfccion, 0)            =   nvl(:P110_IDNTFCCION, nvl(j.idntfccion, 0))',
'                            and         f.id_fljo                       =   nvl(:P110_ID_FLJO, f.id_fljo)',
'                            --and         e.id_trea                       =   nvl(:P110_ID_TREA, e.id_trea)',
'                            and         b.id_instncia_trnscion          =   (select      max(l.id_instncia_trnscion)',
'                                                                             from        wf_g_instancias_transicion  l',
'                                                                             where       l.id_instncia_fljo  =   c.id_instncia_fljo',
'                                                                            )',
'                            and         trunc(c.fcha_incio) between :P110_FECHA and :P110_FECHA_HASTA',
'                            group by    b.id_instncia_fljo,',
'                                        g.id_prscrpcion,',
'                                        g.nmro_prscrpcion,',
'                                        e.nmbre_trea,',
'                                        d.id_fljo,',
'                                        e.id_trea,',
'                                        a.id_fljo_trea,',
'                                        c.fcha_incio,',
'                                        k.nmro_rdcdo_dsplay,',
'                                        k.fcha_rdcdo)   m',
'                left  join  wf_d_flujos_transicion      n   on  n.id_fljo       =   m.id_fljo',
'                                                            and n.id_fljo_trea  =   m.id_fljo_trea',
'                group by    m.nmbre_trea,',
'                            m.id_fljo,',
'                            m.id_trea,',
'                            m.id_fljo_trea',
'                order by    orden)',
'    loop',
'        ',
'        --htp.p(i.ttal_estdo);',
'        htp.p(''<a href="f?p=71000:110:'' || v(''APP_SESSION'') ||''::NO:RP:P110_ID_TREA:'' || i.id_trea ||'' ">'' ||',
'              ''<div class="col " style="width:16px; height:16px; background-color:'' || case when i.id_trea = :P110_ID_TREA then ''#FF0022;'' else ''#008000;'' end || ''">&nbsp;</div>''||',
'              ''<div class="col " style="font-size: 14px;">'' || i.ttal_estdo || '' '' || i.nmbre_trea || ''</div></a>'');',
'    end loop;',
'    htp.p(''</div></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248057533809589271)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'<i>Funcionalidad que permite gestionar las prescripciones en el sistema.</i><br><br>',
'<center><i><b>En el uso:</b></i><br><br></center>',
'<i>1. Seleccionar el flujo de proceso y la tarea correspondiente.</i><br><br>',
unistr('<i>2. Como par\00E1metros opcionales se encuentran el Tributo y Subtributo, adem\00E1s de identificar un flujo de proceso para un Sujeto-Tributo especifico.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84868711762068401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(84863034379062401)
,p_button_name=>'APLICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambio  <br/>de Etapa/Estado'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90437537114426501)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(84863034379062401)
,p_button_name=>'REVERSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Reversar Cambio<br>de Etapa/Estado'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84790661052205307)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(84604559275161601)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(90837246880095901)
,p_branch_name=>'Actualizar pagina'
,p_branch_action=>'f?p=71000:110:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(108701315471940304)
,p_branch_name=>'Redirigir al flujo'
,p_branch_action=>'DECLARE'||wwv_flow.LF||
'    v_url     varchar2(4000);'||wwv_flow.LF||
'    l_app     number    := v(''APP_ID'');'||wwv_flow.LF||
'    l_session number    := v(''APP_SESSION'');'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', :P110_ID_INSTNCIA_FLJO);--ITEM'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_FLJO_TREA'', :P110_ID_FLJO_TREA);--ITEM'||wwv_flow.LF||
'    v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => :P110_ID_INSTNCIA_FLJO,'||wwv_flow.LF||
'                                                  p_id_fljo_trea     => :P110_ID_FLJO_TREA,'||wwv_flow.LF||
'                                                  p_clear_session    => ''S'');'||wwv_flow.LF||
'    return v_url;'||wwv_flow.LF||
'END;'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'cargarflujo'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35881122714659801)
,p_name=>'P110_FECHA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84604559275161601)
,p_item_default=>'add_months(systimestamp, -1)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Desde</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35881242679659802)
,p_name=>'P110_FECHA_HASTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84604559275161601)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Hasta</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P110_FECHA.'
,p_attribute_03=>'+1d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84604620961161602)
,p_name=>'P110_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84604559275161601)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84604701982161603)
,p_name=>'P110_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84604559275161601)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.nmbre_impsto_sbmpsto',
'           ,a.id_impsto_sbmpsto ',
'from        df_i_impuestos_subimpuesto      a',
'where       a.id_impsto     =   :P110_ID_IMPSTO;'))
,p_lov_cascade_parent_items=>'P110_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84725469187728201)
,p_name=>'P110_ID_TREA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84604559275161601)
,p_prompt=>'<b>Tarea</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      distinct c.nmbre_trea,',
'            c.id_trea',
'from        v_gf_g_prescripciones_tareas    a',
'inner join  wf_d_flujos_tarea               b   on  b.id_fljo_trea  =   a.id_fljo_trea',
'inner join  wf_d_tareas                     c   on  c.id_trea       =   b.id_trea',
'inner join  wf_d_flujos                     d   on  d.id_fljo       =   b.id_fljo',
'where       d.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         a.id_usrio      =   :F_ID_USRIO',
'and         b.actvo         =   ''S''',
'--and         b.id_fljo       =   :P110_ID_FLJO',
'order by    c.nmbre_trea;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P110_ID_FLJO'
,p_ajax_items_to_submit=>'P110_ID_TREA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89162062158023102)
,p_name=>'P110_SELECCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84863034379062401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98477280516885703)
,p_name=>'P110_IDNTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(84604559275161601)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108797121690721101)
,p_name=>'P110_ID_INSTNCIA_FLJO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84863034379062401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108797221988721102)
,p_name=>'P110_ID_FLJO_TREA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84863034379062401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112523501641486101)
,p_name=>'P110_ID_FLJO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84604559275161601)
,p_prompt=>'<b>Flujo de Proceso</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_fljo,',
'        a.id_fljo',
'from    wf_d_flujos a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prcso      =   12',
'and     a.actvo         =   ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89162129490023103)
,p_name=>'Al seleccionar'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(84790074794205301)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89162284629023104)
,p_event_id=>wwv_flow_api.id(89162129490023103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerSeleccion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35881368301659803)
,p_name=>'Al modificar Fecha desde'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P110_FECHA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35881400950659804)
,p_event_id=>wwv_flow_api.id(35881368301659803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P110_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P110_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(88110300395646703)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(84790074794205301)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Flujo Prescripci\00F3n: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89730793967359301)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Proceso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_xml          clob;',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''      ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_USRIO>''        ||:F_ID_USRIO            ||''</ID_USRIO>'';',
'    v_xml := v_xml||''<REQUEST>''         ||:REQUEST               ||''</REQUEST>'';',
'    v_xml := v_xml||''<SLCCION>''         ||:P110_SELECCION        ||''</SLCCION>'';',
'    pkg_gf_prescripcion.prc_rg_prscrpcion_accon_msva		(p_xml								=>    v_xml',
'                                                            ,o_cdgo_rspsta						=>    v_cdgo_rspsta',
'                                                            ,o_mnsje_rspsta						=>    v_mnsje_rspsta',
'                                                            );',
'	if (v_cdgo_rspsta <> 0) then',
'		RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta); ',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APLICAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Acci\00F3n Procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(84803282839329104)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number := apex_application.g_f02(1);',
'    v_url varchar2(4000);',
'    ',
'begin',
'     apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'     apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'      v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                    p_id_fljo_trea     => v_id_fljo_trea,',
'                                                    p_clear_session    => ''S'');',
'        ',
'     apex_json.open_object;',
'     apex_json.write(''type'', ''OK'');',
'     apex_json.write(''msg'', ''Url generada exitosamente'');',
'     apex_json.write(''url'', v_url);',
'     apex_json.close_all();',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
