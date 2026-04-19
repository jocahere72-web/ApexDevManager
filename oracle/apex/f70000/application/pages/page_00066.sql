prompt --application/pages/page_00066
begin
wwv_flow_api.create_page(
 p_id=>66
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Gesti\00F3n de T\00EDtulos Ejecutivos')
,p_step_title=>unistr('Gesti\00F3n de T\00EDtulos Ejecutivos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(id_instancia,id_fljo_trea){',
'    apex.server.process("AjaxIrFlujo", {f01: id_instancia, f02: id_fljo_trea}, {',
'        success: function (data) { ',
'            if (data.type === ''OK'') {',
'                window.localStorage.clear();',
'                window.location.href = data.url;',
'            }else{',
'                apex.message.showErrors({',
'                    type: apex.message.TYPE.ERROR,',
'                    location: ["page"],',
'                    message: data.msg,',
'                    unsafe: false',
'                });',
'            }',
'        },',
'        error: function () {',
'            console.log(arguments);',
'        }',
'    });',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20191218082940'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18918214349469802)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            ',
'        </b>',
'    </div>',
'</h5>',
'',
'Funcionalidad que permite: <br><br>',
unistr('Registrar T\00EDtulos Ejecutivos.<br><br>'),
unistr('Gestionar los T\00EDtulos Ejecutivos registrados.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20718471150715901)
,p_plug_name=>unistr('Par\00E1metros de b\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34767140156633848)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48714856264039901)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14918887006194509)
,p_plug_name=>unistr('T\00EDtulos Ejecutivos')
,p_parent_plug_id=>wwv_flow_api.id(48714856264039901)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ttlo_ejctvo,',
'       a.id_instncia_fljo,',
'       b.id_sjto_impsto,',
'       a.nmro_ttlo_ejctvo,',
'       b.idntfccion_sjto_frmtda,',
'       c.nmbre_impsto_acto,',
'       e.dscrpcion as estdo,',
'       case when t.id_fljo_trea = f.id_fljo_trea_orgen and a.cdgo_ttlo_ejctvo_estdo = ''RGS''  then',
'       ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Editar  ',
'                   <span class="fa fa-pencil" aria-hidden="true"></span>',
'                </button>',
'        </center>''',
'        end btn_edtar,',
'        case when a.cdgo_ttlo_ejctvo_estdo = ''RCH'' then',
'        ''<center>',
unistr('                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Observaci\00F3n  '),
'                   <span class="fa fa-eye" aria-hidden="true"></span>',
'                </button>',
'        </center>''',
'        end btn_anlcion',
'from gi_g_titulos_ejecutivo          a',
'join wf_g_instancias_transicion      f on a.id_instncia_fljo = f.id_instncia_fljo  ',
'join v_si_i_sujetos_impuesto         b on a.id_sjto_impsto = b.id_sjto_impsto',
'join df_i_impuestos_acto             c on a.id_impsto_acto = c.id_impsto_acto',
'join wf_g_instancias_flujo           d on a.id_instncia_fljo = d.id_instncia_fljo',
'join wf_d_flujos_tarea               t on t.id_fljo = d.id_fljo and t.indcdor_incio = ''S''   ',
'join gi_d_titulos_ejecutivo_estdo    e on a.cdgo_ttlo_ejctvo_estdo = e.cdgo_ttlo_ejctvo_estdo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and   f.id_usrio = :F_ID_USRIO',
'and   f.id_estdo_trnscion in (1,2)',
'and   a.cdgo_ttlo_ejctvo_estdo not in (''APB'',''RCH'')',
'and   a.cdgo_ttlo_ejctvo_estdo = nvl(:P66_ESTDO,a.cdgo_ttlo_ejctvo_estdo)',
'and   a.nmro_ttlo_ejctvo =  nvl(:P66_NMRO_TTLO_EJCTVO,a.nmro_ttlo_ejctvo)',
'and   a.id_sjto_impsto = nvl(:P66_IDNTFCCION,a.id_sjto_impsto);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14919081240194511)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Instncia Fljo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(14919157366194512)
,p_name=>'NMRO_TTLO_EJCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_EJCTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('No. T\00EDtulo Ejecutivo')
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(14919284625194513)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(14919323923194514)
,p_name=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(14919591567194516)
,p_name=>'Ir al flujo'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir al Flujo &ID_INSTNCIA_FLJO.<span class="fa fa-external-link-square"></span>',
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
 p_id=>wwv_flow_api.id(15759605622564102)
,p_name=>'BTN_EDTAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BTN_EDTAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP:P44_ID_TTLO_EJCTVO,P44_ID_SJTO_IMPSTO:&ID_TTLO_EJCTVO.,&ID_SJTO_IMPSTO.'
,p_link_text=>'&BTN_EDTAR.'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16075926328380701)
,p_name=>'ID_TTLO_EJCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_EJCTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17492511846857110)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22028321522543701)
,p_name=>'BTN_ANLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BTN_ANLCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:90:&SESSION.:observation:&DEBUG.:RP:P90_TTLO_EJCTVO:&ID_TTLO_EJCTVO.'
,p_link_text=>'&BTN_ANLCION.'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48717751157039930)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(14918916161194510)
,p_internal_uid=>14918916161194510
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
 p_id=>wwv_flow_api.id(14931456793241678)
,p_interactive_grid_id=>wwv_flow_api.id(14918916161194510)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(14931519866241678)
,p_report_id=>wwv_flow_api.id(14931456793241678)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14932013871241679)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(14919081240194511)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14932575462241680)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(14919157366194512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14933012925241682)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(14919284625194513)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14933512732241683)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(14919323923194514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>307
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14934527456249503)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(14919591567194516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15766514763577560)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(15759605622564102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16081939582383846)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(16075926328380701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17872184635730779)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(17492511846857110)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22034369891543858)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(22028321522543701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48751032417186193)
,p_view_id=>wwv_flow_api.id(14931519866241678)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(48717751157039930)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48715911877039912)
,p_plug_name=>unistr('T\00EDtulos Ejecutivos Gestionados')
,p_parent_plug_id=>wwv_flow_api.id(48714856264039901)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ttlo_ejctvo,',
'       a.id_instncia_fljo,',
'       b.id_sjto_impsto,',
'       a.nmro_ttlo_ejctvo,',
'       b.idntfccion_sjto_frmtda,',
'       c.nmbre_impsto_acto,',
'       e.dscrpcion,',
'        case when a.cdgo_ttlo_ejctvo_estdo = ''RCH'' then',
'        ''<center>',
unistr('                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Observaci\00F3n  '),
'                   <span class="fa fa-eye" aria-hidden="true"></span>',
'                </button>',
'        </center>''',
'        end btn_anlcion',
'from gi_g_titulos_ejecutivo          a',
'join v_si_i_sujetos_impuesto         b on a.id_sjto_impsto = b.id_sjto_impsto',
'join df_i_impuestos_acto             c on a.id_impsto_acto = c.id_impsto_acto',
'join wf_g_instancias_flujo           d on a.id_instncia_fljo = d.id_instncia_fljo',
'join gi_d_titulos_ejecutivo_estdo    e on a.cdgo_ttlo_ejctvo_estdo = e.cdgo_ttlo_ejctvo_estdo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and   a.cdgo_ttlo_ejctvo_estdo in (''APB'',''RCH'') ',
'and   a.cdgo_ttlo_ejctvo_estdo = nvl(:P66_ESTDO,a.cdgo_ttlo_ejctvo_estdo)',
'and   a.nmro_ttlo_ejctvo =  nvl(:P66_NMRO_TTLO_EJCTVO,a.nmro_ttlo_ejctvo)',
'and   a.id_sjto_impsto = nvl(:P66_IDNTFCCION,a.id_sjto_impsto);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48716299086039915)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48716320837039916)
,p_name=>'Ir al flujo'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir al Flujo &ID_INSTNCIA_FLJO.<span class="fa fa-external-link-square"></span>',
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
 p_id=>wwv_flow_api.id(48716579422039918)
,p_name=>'ID_TTLO_EJCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_EJCTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48716670880039919)
,p_name=>'BTN_ANLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BTN_ANLCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:90:&SESSION.:observation:&DEBUG.:RP:P90_TTLO_EJCTVO:&ID_TTLO_EJCTVO.'
,p_link_text=>'&BTN_ANLCION.'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48716787584039920)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(48716846628039921)
,p_name=>'NMRO_TTLO_EJCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_EJCTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('No. T\00EDtulo Ejecutivo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(48716948719039922)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(48717011743039923)
,p_name=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(48717109030039924)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(48716010165039913)
,p_internal_uid=>48716010165039913
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
 p_id=>wwv_flow_api.id(48733154480062100)
,p_interactive_grid_id=>wwv_flow_api.id(48716010165039913)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(48733252484062100)
,p_report_id=>wwv_flow_api.id(48733154480062100)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48734251212062104)
,p_view_id=>wwv_flow_api.id(48733252484062100)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(48716299086039915)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48734753263062106)
,p_view_id=>wwv_flow_api.id(48733252484062100)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(48716320837039916)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48735632852062110)
,p_view_id=>wwv_flow_api.id(48733252484062100)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(48716579422039918)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48736105927062111)
,p_view_id=>wwv_flow_api.id(48733252484062100)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(48716670880039919)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48736676752062113)
,p_view_id=>wwv_flow_api.id(48733252484062100)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(48716787584039920)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48737102513062115)
,p_view_id=>wwv_flow_api.id(48733252484062100)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(48716846628039921)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>229
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48737697854062123)
,p_view_id=>wwv_flow_api.id(48733252484062100)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(48716948719039922)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48738154667062125)
,p_view_id=>wwv_flow_api.id(48733252484062100)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(48717011743039923)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>342
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48738639554062126)
,p_view_id=>wwv_flow_api.id(48733252484062100)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(48717109030039924)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14907204256393978)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(34767140156633848)
,p_button_name=>'BTN_Registrar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar T\00EDtulo Ejecutivo')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP,44::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20718839411715905)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(20718471150715901)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20718552055715902)
,p_name=>'P66_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20718471150715901)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.idntfccion as d,',
'       si.id_sjto_impsto r',
'from si_c_sujetos s',
'join si_i_sujetos_impuesto si on s.id_sjto = si.id_sjto',
'join si_i_personas         p  on si.id_sjto_impsto = p.id_sjto_impsto;'))
,p_lov_display_null=>'YES'
,p_cSize=>40
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20718618186715903)
,p_name=>'P66_ESTDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20718471150715901)
,p_prompt=>'Estados'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.dscrpcion as d,',
'       e.cdgo_ttlo_ejctvo_estdo as r',
'from gi_d_titulos_ejecutivo_estdo e;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20718731308715904)
,p_name=>'P66_NMRO_TTLO_EJCTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20718471150715901)
,p_prompt=>unistr('N\00FAmero T\00EDtulo Ejecutivo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14919619209194517)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxIrFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_id_instncia_fljo number := apex_application.g_f01(1);',
'   v_id_fljo_trea number;-- := apex_application.g_f02(1);',
'   v_url varchar2(4000);',
'   v_id_fljo_trea_orgen number;',
'   ',
'   begin',
'   ',
'       begin',
'           select id_fljo_trea_orgen',
'           into v_id_fljo_trea_orgen',
'           from wf_g_instancias_transicion',
'           where id_instncia_fljo = v_id_instncia_fljo',
'           and id_estdo_trnscion in (1,2);',
'       exception',
'           when no_data_found then',
'               begin',
'                   select distinct first_value(id_fljo_trea_orgen) over (order by id_instncia_trnscion desc)',
'                   into v_id_fljo_trea_orgen',
'                   from wf_g_instancias_transicion',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception',
'                  when others then',
'                      v_id_fljo_trea_orgen := null;',
'              end;',
'           when others then',
'               v_id_fljo_trea_orgen := null;',
'       end;',
'       ',
'       apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'       apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea_orgen );            	',
'       v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                     p_id_fljo_trea     => v_id_fljo_trea_orgen,',
'                                                     p_clear_session    => ''S'');',
'       apex_json.open_object;',
'       apex_json.write(''type'', ''OK'');',
'       apex_json.write(''msg'', ''Url generada exitosamente'');',
'       apex_json.write(''url'', v_url);',
'       apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
