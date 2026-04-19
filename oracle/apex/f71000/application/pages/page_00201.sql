prompt --application/pages/page_00201
begin
wwv_flow_api.create_page(
 p_id=>201
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Proyecci\00F3n Saldo a Favor')
,p_step_title=>'Saldo a Favor'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerSaldoFavor(){',
'    var region = apex.region("saf");',
'    if (region) {',
'',
'        var view = apex.region("saf").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        //console.log(''records: ''+records);',
'',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var json =  records.map((modelo) => {',
'        //var json = records.map(function (record) {',
'            console.log(model.getValue(modelo, "ID_SLDO_FVOR"));',
'            return { "ID_SLDO_FVOR":       model.getValue(modelo, "ID_SLDO_FVOR"),',
'                     "ID_ORGEN":           model.getValue(modelo, "ID_ORGEN"),',
'                     "ID_IMPSTO":          model.getValue(modelo, "ID_IMPSTO"), ',
'                     "ID_IMPSTO_SBMPSTO":  model.getValue(modelo, "ID_IMPSTO_SBMPSTO"),',
'                     "ID_SJTO_IMPSTO":     model.getValue(modelo, "ID_SJTO_IMPSTO")',
'                   };',
'        });  ',
'        ',
'        //console.log(''json: ''+json);',
'        ',
'        //Habilitamos o deshabilitamos el botom dependiendo si hay mas de un registro seleccionado',
'        if (json.length > 0 ){',
'            $("#Btn_Reconocer").show();',
'            $("#Btn_Rechazar").show();',
'            $("#Btn_Proyeccion").show();',
'        }else {',
'            $("#Btn_Reconocer").hide();',
'            $("#Btn_Rechazar").hide();',
'            $("#Btn_Proyeccion").hide();',
'        }',
'        ',
'        $s(''P201_JSON_SALDO_A_FAVOR'', JSON.stringify(json));',
'        window.localStorage.setItem(''jsonSaldo'', JSON.stringify(json));',
'        ',
'        //Seteamos el valor del json en forma de cadena al item ',
'        /*$s(''P366_JSON_SALDO_A_FAVOR'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        console.log(:P366_JSON_SALDO_A_FAVOR);',
'        ',
'         //Declarar la primary key en el interactive grid para que funcione',
'        apex.region("saf").widget().interactiveGrid("setSelectedRecords", records);*/  ',
'',
'    };',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#Btn_Reconocer").hide();',
'$("#Btn_Rechazar").hide();',
'$("#Btn_Proyeccion").hide();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer{',
'    display: none;   ',
'}',
'',
'#P201_SALDO_A_FAVOR .t-TabsRegion-items{',
'    min-height: 100px !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20251126113202'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80336713686957567)
,p_plug_name=>unistr('Compesaci\00F3n - Devoluci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_instncia_fljo ',
'from wf_g_instancias_flujo',
'where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and estdo_instncia = ''FINALIZADA'';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80336871919957568)
,p_plug_name=>unistr('Devoluci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(80336713686957567)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_sldos_fvr_dvlcion_dtll,',
'       a.nmbre_impsto,',
'       b.vlor_dvlcion,',
'       d.nmbre_bnco,',
'       c.nmro_cnta,',
'       f.idntfccion_sjto_frmtda,',
'       b.id_sldo_fvor',
'from v_gf_g_saldos_favor a',
'join gf_g_sldos_fvr_dvlcion_dtll  b on a.id_sldo_fvor         = b.id_sldo_fvor',
'join gf_g_saldos_favor_devlucion  c on b.id_sldo_fvor_dvlcion = c.id_sldo_fvor_dvlcion',
'join df_c_bancos                  d on c.id_bnco              = d.id_bnco',
'join v_si_i_sujetos_impuesto      f on a.id_sjto_impsto       = f.id_sjto_impsto',
'where c.id_sldo_fvor_slctud =    :P201_ID_SLCTUD_SLDO_FVOR;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(80337817606957578)
,p_name=>'ID_SLDOS_FVR_DVLCION_DTLL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDOS_FVR_DVLCION_DTLL'
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
 p_id=>wwv_flow_api.id(80337931465957579)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
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
 p_id=>wwv_flow_api.id(80338070033957580)
,p_name=>'VLOR_DVLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DVLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor de la devoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(80338182133957581)
,p_name=>'NMBRE_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(80338286501957582)
,p_name=>'NMRO_CNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'N. Cuenta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(80338294114957583)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(125018165329157067)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'# Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(80337702905957577)
,p_internal_uid=>80337702905957577
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
 p_id=>wwv_flow_api.id(80346860122977688)
,p_interactive_grid_id=>wwv_flow_api.id(80337702905957577)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(80346967405977688)
,p_report_id=>wwv_flow_api.id(80346860122977688)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80350417260977702)
,p_view_id=>wwv_flow_api.id(80346967405977688)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(80337817606957578)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80350931597977703)
,p_view_id=>wwv_flow_api.id(80346967405977688)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(80337931465957579)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>265
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80351443083977705)
,p_view_id=>wwv_flow_api.id(80346967405977688)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(80338070033957580)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80351964394977707)
,p_view_id=>wwv_flow_api.id(80346967405977688)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(80338182133957581)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80352456716977708)
,p_view_id=>wwv_flow_api.id(80346967405977688)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(80338286501957582)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80352926055977712)
,p_view_id=>wwv_flow_api.id(80346967405977688)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(80338294114957583)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>230
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(125024156602157292)
,p_view_id=>wwv_flow_api.id(80346967405977688)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(125018165329157067)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97687236399431267)
,p_plug_name=>'Reconocimiento'
,p_parent_plug_id=>wwv_flow_api.id(80336713686957567)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nvl(listagg(e.vgncia, '','') within group (order by e.vgncia), ''-'') as vgnvia,',
'        c.nmbre_impsto_sbmpsto,',
'        d.idntfccion_sjto_frmtda,',
'        c.vlor_sldo_fvor,',
'        b.id_sldo_fvor,',
'        c.nmbre_sldo_fvor_tpo,',
'        to_char(c.fcha_rgstro, ''DD/MM/YYYY'') as fcha_rgstro',
'from gf_g_saldos_favor_solicitud    a',
'join gf_g_sldos_fvor_slctud_dtll    b   on  a.id_sldo_fvor_slctud   =   b.id_sldo_fvor_slctud',
'join v_gf_g_saldos_favor            c   on  b.id_sldo_fvor          =   c.id_sldo_fvor',
'left join gf_g_saldos_favor_vigencia     e   on  c.id_sldo_fvor          =   e.id_sldo_fvor',
'join v_si_i_sujetos_impuesto        d   on  c.id_sjto_impsto        =   d.id_sjto_impsto',
'where a.id_sldo_fvor_slctud = :P206_ID_SLDO_FVOR_SLCTUD',
'group by e.vgncia,',
'         c.nmbre_impsto_sbmpsto,',
'         d.idntfccion_sjto_frmtda,',
'         c.vlor_sldo_fvor,',
'         b.id_sldo_fvor,',
'         c.nmbre_sldo_fvor_tpo,',
'         to_char(c.fcha_rgstro, ''DD/MM/YYYY'');'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97687429335431269)
,p_name=>'VGNVIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNVIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(97687507751431270)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(97687622168431271)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(97687743357431272)
,p_name=>'VLOR_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(97687867737431273)
,p_name=>'NMBRE_SLDO_FVOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLDO_FVOR_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(97687958649431274)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(125018244733157068)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'# Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(97687317454431268)
,p_internal_uid=>97687317454431268
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
 p_id=>wwv_flow_api.id(97693041042436087)
,p_interactive_grid_id=>wwv_flow_api.id(97687317454431268)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(97693145802436088)
,p_report_id=>wwv_flow_api.id(97693041042436087)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62927353111865721)
,p_view_id=>wwv_flow_api.id(97693145802436088)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(125018244733157068)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97693632847436095)
,p_view_id=>wwv_flow_api.id(97693145802436088)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(97687429335431269)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97694158647436099)
,p_view_id=>wwv_flow_api.id(97693145802436088)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(97687507751431270)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>213
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97694662881436101)
,p_view_id=>wwv_flow_api.id(97693145802436088)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(97687622168431271)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>227
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97695172864436103)
,p_view_id=>wwv_flow_api.id(97693145802436088)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(97687743357431272)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97695665967436104)
,p_view_id=>wwv_flow_api.id(97693145802436088)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(97687867737431273)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97696173066436106)
,p_view_id=>wwv_flow_api.id(97693145802436088)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(97687958649431274)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217629331092423500)
,p_plug_name=>unistr('Compensaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(80336713686957567)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.nmbre_impsto,',
'       a.sldo_fvor_dspnble as vlor_sldo_fvor,',
'       sum(b.vlor_cmpnscion),',
'       b.vgncia,',
'       b.id_prdo,',
'       b.id_impsto,',
'       b.id_impsto_sbmpsto,',
'       b.id_sjto_impsto,',
'       b.id_sldo_fvor,',
'       e.prdo,',
'       f.idntfccion_sjto_frmtda,',
'       c.id_sld_fvr_cmpnscion,',
'       b.id_mvmnto_fncro',
'from v_gf_g_saldos_favor          a',
'join gf_g_sldos_fvr_cmpnscn_dtll  b on a.id_sldo_fvor         = b.id_sldo_fvor',
'join gf_g_saldos_favor_cmpnscion  c on b.id_sld_fvr_cmpnscion = c.id_sld_fvr_cmpnscion',
'join df_i_conceptos               d on b.id_cncpto            = d.id_cncpto',
'join df_i_periodos                e on b.id_prdo              = e.id_prdo and ',
'                                       b.vgncia               =  e.vgncia',
'join v_si_i_sujetos_impuesto      f on b.id_sjto_impsto       = f.id_sjto_impsto',
'where c.id_sldo_fvor_slctud = :P201_ID_SLCTUD_SLDO_FVOR   ',
'and not a.estdo = ''AN'' ',
'group by f.nmbre_impsto,',
'         a.sldo_fvor_dspnble, ',
'         b.vgncia, b.id_prdo, ',
'         b.id_impsto, ',
'         b.id_impsto_sbmpsto, ',
'         b.id_sjto_impsto, ',
'         b.id_sldo_fvor, ',
'         e.prdo, ',
'         f.idntfccion_sjto_frmtda,',
'         c.id_sld_fvr_cmpnscion,',
'         b.id_mvmnto_fncro'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(63700588052200403)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(148745800380410191)
,p_name=>'SUM(B.VLOR_CMPNSCION)'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUM(B.VLOR_CMPNSCION)'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Compensado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(148745866198410192)
,p_name=>'BTN_VIEW'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">  ',
'        <span class="fa fa-eye" aria-hidden="true"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:264:&SESSION.::&DEBUG.:RP,264:P264_ID_SLD_FVR_CMPNSCION,P264_ID_SLD_FVR,P264_VGNCIA,P264_ID_PRDO,P264_ID_MVMNTO_FNCRO:&ID_SLD_FVR_CMPNSCION.,&ID_SLDO_FVOR.,&VGNCIA.,&ID_PRDO.,&ID_MVMNTO_FNCRO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(148747594377410209)
,p_name=>'ID_SLD_FVR_CMPNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLD_FVR_CMPNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Sld Fvr Cmpnscion'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(155672517970667993)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(217629695016423503)
,p_name=>'VLOR_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_FVOR'
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
 p_id=>wwv_flow_api.id(217629856827423505)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(217630794120423514)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
 p_id=>wwv_flow_api.id(221312193714918392)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(227891092592614094)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(227891151944614095)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(227891241986614096)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(227891320939614097)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'# Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(228564572692932591)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(217629444080423501)
,p_internal_uid=>217629444080423501
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
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(217644267000594458)
,p_interactive_grid_id=>wwv_flow_api.id(217629444080423501)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(217644329906594459)
,p_report_id=>wwv_flow_api.id(217644267000594458)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63709593536223521)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(63700588052200403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109403231204711708)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(221312193714918392)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109415634421432921)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(217630794120423514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(148751733763410432)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(148745800380410191)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(148764291184484682)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(148745866198410192)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(148772164252535907)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(148747594377410209)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(155699611512792053)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(155672517970667993)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>198
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217645344264594461)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(217629695016423503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>189
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217646314249594463)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(217629856827423505)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(228086946935932317)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(227891092592614094)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(228087436487932321)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(227891151944614095)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(228087993340932323)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(227891241986614096)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(228088505859932325)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(227891320939614097)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(228570544539932822)
,p_view_id=>wwv_flow_api.id(217644329906594459)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(228564572692932591)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>246
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92340204912499501)
,p_plug_name=>'Flow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94452689418706418)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
'select 1',
'from WF_G_INSTANCIAS_TRANSICION',
'where ID_INSTNCIA_FLJO = :F_ID_INSTNCIA_FLJO and',
'      ID_FLJO_TREA_ORGEN = :F_ID_FLJO_TREA and',
'      ID_ESTDO_TRNSCION in (1,2);'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98537845664593506)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108802687083726401)
,p_plug_name=>'Saldos favor - Actos'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12061941785521921)
,p_plug_name=>'Soportes'
,p_parent_plug_id=>wwv_flow_api.id(108802687083726401)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    a.id_adjnto',
unistr('        , a.obsrvcion Observaci\00F3n'),
'        , a.file_name Nombre_Archivo',
'        , a.id_orgen ',
'        , a.fcha_rgstro',
'        , 1 ver',
'        , 2 descargar ',
'from    gn_g_adjuntos a',
'where   a.cdgo_prcso = ''SAF''',
'        and a.id_orgen = :P201_ID_SLCTUD_SLDO_FVOR',
'        and a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'        and a.id_fljo_trea = :F_ID_FLJO_TREA'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15958183789805502)
,p_name=>unistr('OBSERVACI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('OBSERVACI\00D3N')
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15958217310805503)
,p_name=>'NOMBRE_ARCHIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_ARCHIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15958500143805506)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Orgen'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(15958775627805508)
,p_name=>'ID_ADJNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ADJNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Adjnto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15958874585805509)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:gn_g_adjuntos,ID_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&ID_ADJNTO.'
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
 p_id=>wwv_flow_api.id(15958964921805510)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15959037559805511)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15959259352805513)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Descargar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
,p_link_target=>'f?p=&APP_ID.:201:&SESSION.:DESCARGAR_ADJUNTO:&DEBUG.:RP:P201_ID_ADJNTO:&ID_ADJNTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15959430876805515)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Adjunto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(12062046741521922)
,p_internal_uid=>12062046741521922
,p_is_editable=>true
,p_edit_operations=>'d'
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
 p_id=>wwv_flow_api.id(15949894281697119)
,p_interactive_grid_id=>wwv_flow_api.id(12062046741521922)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(15949997118697119)
,p_report_id=>wwv_flow_api.id(15949894281697119)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1400372012810)
,p_view_id=>wwv_flow_api.id(15949997118697119)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(15958874585805509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5553395050515)
,p_view_id=>wwv_flow_api.id(15949997118697119)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(15958964921805510)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11144097924624)
,p_view_id=>wwv_flow_api.id(15949997118697119)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(15959259352805513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16496128000601)
,p_view_id=>wwv_flow_api.id(15949997118697119)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(15959430876805515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15969125099810684)
,p_view_id=>wwv_flow_api.id(15949997118697119)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(15958183789805502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>278.997
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15971285489835457)
,p_view_id=>wwv_flow_api.id(15949997118697119)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(15958217310805503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>495
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15975863544873762)
,p_view_id=>wwv_flow_api.id(15949997118697119)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(15958500143805506)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15981295068928149)
,p_view_id=>wwv_flow_api.id(15949997118697119)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(15958775627805508)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95119032355698901)
,p_plug_name=>'Actos'
,p_parent_plug_id=>wwv_flow_api.id(108802687083726401)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_acto_tpo,',
'            b.dscrpcion,',
'            c.id_acto,',
'            c.id_sldo_fvor_dcmnto,',
unistr('            decode(a.indcdor_oblgtrio, ''S'', ''S\00ED'', ''No'') indcdor_oblgtrio, '),
'            case',
'                when ( /*( :P201_CMPNSCION > 0 or :P201_DVLCION > 0 ) and */( (a.id_acto_tpo_rqrdo is null and ( c.id_acto is null or d.id_dcmnto is null)  ) or',
'                --when ( ( :P201_CMPNSCION > 0 or :P201_DVLCION > 0 ) and ( (a.id_acto_tpo_rqrdo is null and c.id_acto is null) or -- Req. 0026271',
'                       (a.id_acto_tpo_rqrdo is not null   and d.id_acto is not null and c.id_acto is null) )              ',
'                      ) then',
'                    ''<center>',
'                        <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                            ||nvl2(c.id_sldo_fvor_dcmnto, ''Modificar '', ''Generar '')',
'                            ||''<span class="fa ''||nvl2(c.id_sldo_fvor_dcmnto,''fa-edit'',''fa-cog fa-spin'')||''"></span>',
'                        </button>',
'                     </center>''',
'            end accion,',
'            case',
'                when (a.id_acto_tpo_rqrdo is null     and c.id_sldo_fvor_dcmnto is not null and c.id_acto is null) or',
'                     (a.id_acto_tpo_rqrdo is not null and d.id_acto             is not null and c.id_sldo_fvor_dcmnto is not null and c.id_acto is null)   then',
'                        ''<center>',
'                            <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Confirmar ''',
'                                ||''<span class="fa fa-check"></span>',
'                            </button>',
'                        </center>''',
'            end confirmar',
'from        gn_d_actos_tipo_tarea           a',
'inner join  gn_d_actos_tipo                 b   on  b.id_acto_tpo               =   a.id_acto_tpo',
'left  join  v_gf_g_saldos_favor_documentos  c   on  c.id_sldo_fvor_slctud       =   :P201_ID_SLCTUD_SLDO_FVOR',
'                                                and c.id_acto_tpo               =   b.id_acto_tpo',
'                                                and c.id_fljo_trea              =   a.id_fljo_trea',
'left join   v_gf_g_saldos_favor_documentos  d   on  d.id_sldo_fvor_slctud       =   :P201_ID_SLCTUD_SLDO_FVOR',
'                                                and d.id_acto_tpo               =   a.id_acto_tpo_rqrdo',
'where       a.id_fljo_trea  =   :F_ID_FLJO_TREA;'))
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
 p_id=>wwv_flow_api.id(99423825651829801)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>99423825651829801
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99423984481829802)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110196894190851401)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>20
,p_column_identifier=>'I'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110196965568851402)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>30
,p_column_identifier=>'J'
,p_column_label=>'Id Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99424312935829806)
,p_db_column_name=>'ID_SLDO_FVOR_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Id Sldo Fvor Dcmnto'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110197043972851403)
,p_db_column_name=>'INDCDOR_OBLGTRIO'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>unistr('\00BFIndicador Obligatorio?')
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99424112353829804)
,p_db_column_name=>'ACCION'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>unistr('Acci\00F3n')
,p_column_link=>'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:RP,203:P203_ID_ACTO_TPO,P203_ID_SOLICITUD_SALDO_FAVOR,P203_ID_SLDO_FVOR_DCMNTO,P203_ID_SOLICITUD,P203_ID_SJTO_IMPSTO:#ID_ACTO_TPO#,&P201_ID_SLCTUD_SLDO_FVOR.,#ID_SLDO_FVOR_DCMNTO#,&P201_ID_SLCTUD.,&P201_SJTO_IMPSTO'
||'.#ID_SLDO_FVOR_SLCTUD#,#ID_SLDO_FVOR_DCMNTO##ID_SLCTUD_SLDO_FVOR#,&P201_ID_SLCTUD.,#ID_SLDO_FVOR_DCMNTO#,&F_ID_FLJO_TREA.'
,p_column_linktext=>'#ACCION#'
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99424267303829805)
,p_db_column_name=>'CONFIRMAR'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Confirmar'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(99436078253838754)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'994361'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION:ID_ACTO:INDCDOR_OBLGTRIO:ACCION:CONFIRMAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108091368781594501)
,p_plug_name=>'Saldo a Favor'
,p_region_name=>'saf'
,p_parent_plug_id=>wwv_flow_api.id(108802687083726401)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_sldo_fvor ',
'       ,a.sldo_fvor_dspnble',
'       ,a.indcdor_rcncdo',
'       ,a.id_impsto',
'       ,a.id_impsto_sbmpsto',
'       ,a.id_sjto_impsto',
'       ,a.id_orgen',
'       ,d.nmbre',
'       ,b.nmbre_impsto as Impuesto',
'       ,to_char(a.fcha_rgstro, ''DD/MM/YYYY'') as fecha',
'       ,c.id_sldo_fvor_slctud_dtlle',
'       ,obsrvcion',
'       ,case when c.id_sldo_fvor is null then ''N'' else ''S'' end as incldo',
unistr('       ,case when c.indcdor_rcncdo = ''S'' then ''S\00ED'' else ''No'' end as dscrpcion_incldo'),
'from v_gf_g_saldos_favor a',
'inner join v_pq_g_solicitudes            b    on   b.id_slctud             = :P201_ID_SLCTUD   and',
'                                                   a.id_sjto_impsto        = b.id_sjto_impsto',
'inner join gf_d_saldos_favor_tipo        d    on   a.cdgo_sldo_fvor_tpo    = d.cdgo_sldo_fvor_tpo',
'left join gf_g_sldos_fvor_slctud_dtll    c    on   a.id_sldo_fvor          = c.id_sldo_fvor',
'where a.indcdor_rcncdo  = ''N''',
'and  not a.estdo = ''AN''',
'and a.sldo_fvor_dspnble > 0',
'union',
'                                ',
'select  a.id_sldo_fvor ',
'       ,a.sldo_fvor_dspnble',
'       ,a.indcdor_rcncdo',
'       ,a.id_impsto',
'       ,a.id_impsto_sbmpsto',
'       ,a.id_sjto_impsto',
'       ,a.id_orgen',
'       ,d.nmbre',
'       ,b.nmbre_impsto as Impuesto',
'       ,to_char(a.fcha_rgstro, ''DD/MM/YYYY'') as fecha',
'       ,c.id_sldo_fvor_slctud_dtlle',
'       ,obsrvcion',
'       ,case when c.id_sldo_fvor is null then ''N'' else ''S'' end as incldo',
unistr('       ,case when c.indcdor_rcncdo = ''S'' then ''S\00ED'' else ''No'' end as dscrpcion_incldo'),
'from v_gf_g_saldos_favor               a',
'inner join df_c_impuestos              b    on   a.id_impsto = b.id_impsto',
'inner join gf_d_saldos_favor_tipo      d    on   a.cdgo_sldo_fvor_tpo    = d.cdgo_sldo_fvor_tpo',
'left join gf_g_sldos_fvor_slctud_dtll  c    on   a.id_sldo_fvor          = c.id_sldo_fvor',
'where a.id_sjto_impsto        = :F_ID_SJTO_IMPSTO',
'and  a.indcdor_rcncdo  = ''N''',
'and  not a.estdo = ''AN''',
'and a.sldo_fvor_dspnble > 0;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(45770257716178003)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(60219611947160707)
,p_name=>'SLDO_FVOR_DSPNBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SLDO_FVOR_DSPNBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(108091586652594503)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108091923779594507)
,p_name=>'INDCDOR_RCNCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_RCNCDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(108092090227594508)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(108092170483594509)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(108092279863594510)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(108092331075594511)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(108092566387594513)
,p_name=>'IMPUESTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPUESTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108092692218594514)
,p_name=>'INCLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INCLDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(108112864979635802)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108113060222635804)
,p_name=>'DSCRPCION_INCLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INCLDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFReconocido?')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
,p_enable_filter=>false
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
 p_id=>wwv_flow_api.id(108113268696635806)
,p_name=>'ID_SLDO_FVOR_SLCTUD_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR_SLCTUD_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(122419929907621101)
,p_name=>'NMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(133217312393897402)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_api.id(108091418469594502)
,p_internal_uid=>108091418469594502
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
 p_id=>wwv_flow_api.id(108098035953599917)
,p_interactive_grid_id=>wwv_flow_api.id(108091418469594502)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(108098191420599917)
,p_report_id=>wwv_flow_api.id(108098035953599917)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10814076054885)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(133217312393897402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>384
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20887993068272)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(108113060222635804)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45780649799204235)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(45770257716178003)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60284614249406295)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(60219611947160707)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108098627910599920)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(108091586652594503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108100688642599926)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(108091923779594507)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108101141622599927)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(108092090227594508)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108101697481599929)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(108092170483594509)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108102176467599930)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(108092279863594510)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108102668897599931)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(108092331075594511)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108103610783599934)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(108092566387594513)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>205
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108104175107599935)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(108092692218594514)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108139311452781398)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(108113268696635806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(122425994297621400)
,p_view_id=>wwv_flow_api.id(108098191420599917)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(122419929907621101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134444922198195702)
,p_plug_name=>'Observaciones'
,p_parent_plug_id=>wwv_flow_api.id(108802687083726401)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
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
'join    v_wf_d_flujos_tarea         c on a.id_fljo_trea = c.id_fljo_trea ',
'where   a.id_sldo_fvor_slctud = :P201_ID_SLCTUD_SLDO_FVOR',
'order by a.fcha_rgstro desc',
'    );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134494325131536506)
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
 p_id=>wwv_flow_api.id(134494451986536507)
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
 p_id=>wwv_flow_api.id(134494583477536508)
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
 p_id=>wwv_flow_api.id(134494673852536509)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
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
 p_id=>wwv_flow_api.id(134494773525536510)
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
 p_id=>wwv_flow_api.id(134494815602536511)
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
 p_id=>wwv_flow_api.id(134494227309536505)
,p_internal_uid=>134494227309536505
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
 p_id=>wwv_flow_api.id(134505435980689008)
,p_interactive_grid_id=>wwv_flow_api.id(134494227309536505)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(134505503650689008)
,p_report_id=>wwv_flow_api.id(134505435980689008)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134506041880689012)
,p_view_id=>wwv_flow_api.id(134505503650689008)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(134494325131536506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134506569725689016)
,p_view_id=>wwv_flow_api.id(134505503650689008)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(134494451986536507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134507068526689018)
,p_view_id=>wwv_flow_api.id(134505503650689008)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(134494583477536508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134507553194689020)
,p_view_id=>wwv_flow_api.id(134505503650689008)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(134494673852536509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134508082071689022)
,p_view_id=>wwv_flow_api.id(134505503650689008)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(134494773525536510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134508588091689024)
,p_view_id=>wwv_flow_api.id(134505503650689008)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(134494815602536511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134691057740644601)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(108802687083726401)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_sldo_fvor_sprte , a.id_orgen ,',
unistr('        decode( a.id_orgen, null , ''Resoluci\00F3n'' , ''Recaudo'') tpo_documento,'),
'        decode( a.id_orgen, null , NMRO_RSLCION , cdgo_rcdo_orgn_tpo||'' - ''||nmro_dcmnto ) documento ,',
'        decode( a.id_orgen, null , null, vlor )                valor_recaudo ,',
'        decode( a.id_orgen, null , FCHA_RSLCION , fcha_rcdo )   fcha_dcmnto ,',
'        decode( a.id_orgen, null , FILE_NAME , null )   archivo ,  ',
'        decode( a.id_orgen, null , null , ''<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'') detalle_rcdo ,',
'        decode( a.id_orgen, null , ''<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>''  , null) descargar ,',
'        decode( a.id_orgen, null , ''<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'' , null ) ver',
'from    v_gf_g_saldos_favor         a',
'left join gf_g_saldos_favor_soporte c on a.id_sldo_fvor = c.id_sldo_fvor',
'left join    gf_g_sldos_fvor_slctud_dtll b on a.id_sldo_fvor = b.id_sldo_fvor',
'left join v_re_g_recaudos           d on a.id_orgen = d.id_rcdo',
'where   b.id_sldo_fvor_slctud = :P201_ID_SLCTUD_SLDO_FVOR',
'and     a.estdo != ''AN'' ',
'/*union',
'select  id_sldo_fvor_sprte , a.id_orgen ,',
unistr('        decode( a.id_orgen, null , ''Resoluci\00F3n'' , ''Recaudo'') tpo_documento,'),
'        decode( a.id_orgen, null , NMRO_RSLCION , cdgo_rcdo_orgn_tpo||'' - ''||nmro_dcmnto ) documento ,',
'        decode( a.id_orgen, null , null, vlor )                valor_recaudo ,',
'        decode( a.id_orgen, null , FCHA_RSLCION , fcha_rcdo )   fcha_dcmnto ,',
'        decode( a.id_orgen, null , FILE_NAME , null )   archivo ,   ',
'        decode( a.id_orgen, null , null , ''<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'') detalle_rcdo ,',
'        decode( a.id_orgen, null , ''<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>''  , null) descargar ,',
'        decode( a.id_orgen, null , ''<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'' , null ) ver',
'from    v_gf_g_saldos_favor         a',
'left join gf_g_saldos_favor_soporte c on a.id_sldo_fvor = c.id_sldo_fvor ',
'left join v_re_g_recaudos           d on a.id_orgen = d.id_rcdo',
'where   a.id_sjto_impsto = :P201_SJTO_IMPSTO',
'and     a.estdo != ''AN'' */'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134692809935644619)
,p_name=>'ID_SLDO_FVOR_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR_SPRTE'
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
 p_id=>wwv_flow_api.id(134692977954644620)
,p_name=>'DOCUMENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>46
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
 p_id=>wwv_flow_api.id(134693063972644621)
,p_name=>'VALOR_RECAUDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALOR_RECAUDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>40
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134693198340644622)
,p_name=>'FCHA_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha <br> Resoluci\00F3n/Recaudo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(134693207033644623)
,p_name=>'ARCHIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ARCHIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>255
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
 p_id=>wwv_flow_api.id(134693375688644624)
,p_name=>'DETALLE_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DETALLE_RCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Detalle<br>Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&DETALLE_RCDO.'
,p_link_target=>'f?p=140000:17:&SESSION.::&DEBUG.:RP,17:P17_ID_RCDO:&ID_ORGEN.'
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
 p_id=>wwv_flow_api.id(134693461401644625)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Descargar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&DESCARGAR.'
,p_link_target=>'f?p=&APP_ID.:201:&SESSION.:DESCARGAR_ADJUNTO:&DEBUG.:RP:P201_ID_SLDO_FVOR_SPRTE:&ID_SLDO_FVOR_SPRTE.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134693575622644626)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Visualizar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&VER.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:GF_G_SALDOS_FAVOR_SOPORTE,ID_SLDO_FVOR_SPRTE,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&ID_SLDO_FVOR_SPRTE.'
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
 p_id=>wwv_flow_api.id(134706432844347901)
,p_name=>'TPO_DOCUMENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DOCUMENTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134729958544759701)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(134692788892644618)
,p_internal_uid=>134692788892644618
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
 p_id=>wwv_flow_api.id(134697186915749337)
,p_interactive_grid_id=>wwv_flow_api.id(134692788892644618)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(134697291043749341)
,p_report_id=>wwv_flow_api.id(134697186915749337)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134697749087749368)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(134692809935644619)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134698199480749374)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(134692977954644620)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134698671554749377)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(134693063972644621)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134699122451749379)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(134693198340644622)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134699659462749381)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(134693207033644623)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134700181572749382)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(134693375688644624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134700645256749385)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(134693461401644625)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134701133534749387)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(134693575622644626)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134712539066364950)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(134706432844347901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134736051196761600)
,p_view_id=>wwv_flow_api.id(134697291043749341)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(134729958544759701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210286187093011791)
,p_plug_name=>'Saldos a Favor Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(108802687083726401)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_sldo_fvor_slctud_dtlle',
'       ,b.id_sldo_fvor ',
'       ,b.vlor_sldo_fvor',
'       ,b.sldo_fvor_dspnble',
'       ,b.nmbre_sldo_fvor_tpo',
'       ,b.nmbre_impsto',
'       ,b.nmbre_impsto_sbmpsto',
'       ,to_char(b.fcha_rgstro, ''DD/MM/YYYY'') as fecha',
'       ,decode(a.indcdor_rcncdo, ''S'', ''Si'', ''No'') as indcdor_rcncdo',
unistr('       ,''<a onclick="apex.confirm(''''Est\00E1 seguro de eliminar el saldo a favor de la solicitud'''',{request:''''ELIMINAR'''', set:{''''P''||v(''app_page_id'')||''_ID_SLDO_FVOR_SLCTUD_DTLLE'''':''||a.id_sldo_fvor_slctud_dtlle||''}});">'),
'            <center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">',
'                    <span aria-hidden="true" class="fa fa-trash" style="color: #d22204;" alt="Eliminar" title="Eliminar"></span>',
'                </button>',
'            </center>',
'        </a>'' as elmnar',
'from gf_g_sldos_fvor_slctud_dtll a',
'join v_gf_g_saldos_favor b on a.id_sldo_fvor = b.id_sldo_fvor',
'where a.id_sldo_fvor_slctud = :P201_ID_SLCTUD_SLDO_FVOR;'))
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
 p_id=>wwv_flow_api.id(210286213361011792)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>210286213361011792
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106842252441740791)
,p_db_column_name=>'ID_SLDO_FVOR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sldo Fvor'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106842640882740792)
,p_db_column_name=>'SLDO_FVOR_DSPNBLE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Saldo Favor Disponible'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106843000715740792)
,p_db_column_name=>'NMBRE_SLDO_FVOR_TPO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tipo Saldo Favor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106843482049740792)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106843752349740803)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Sub-Impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106844101404740804)
,p_db_column_name=>'FECHA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106844566857740805)
,p_db_column_name=>'ID_SLDO_FVOR_SLCTUD_DTLLE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Id Sldo Fvor Slctud Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106844984834740805)
,p_db_column_name=>'ELMNAR'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Acci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from WF_G_INSTANCIAS_TRANSICION',
'where ID_INSTNCIA_FLJO = :F_ID_INSTNCIA_FLJO and',
'      ID_FLJO_TREA_ORGEN = :F_ID_FLJO_TREA and',
'      ID_ESTDO_TRNSCION in (1,2);'))
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106845389441740806)
,p_db_column_name=>'VLOR_SLDO_FVOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Saldo Favor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(106845788759740806)
,p_db_column_name=>'INDCDOR_RCNCDO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFAn\00E1lisis Realizado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(210294862279123104)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1068461'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VLOR_SLDO_FVOR:SLDO_FVOR_DSPNBLE:NMBRE_SLDO_FVOR_TPO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:FECHA:INDCDOR_RCNCDO:ELMNAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134777568478067301)
,p_plug_name=>unistr('Duraci\00F3n Etapa')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248323444466718212)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'Funcionalidad que permite: <br><br>',
'',
'<i>',
'Reconocer Saldos a Favor.<br><br>',
'Realizar Compensaciones y/o Devoluciones.<br><br>',
unistr('Generar la Resoluci\00F3n de Saldo a Favor.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(523313252000136019)
,p_plug_name=>'Solicitud'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(540668749651294438)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(523313252000136019)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P201_ID_SLCTUD'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(605481190063645633)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(540668749651294438)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
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
'       case d.actvo',
unistr('           when ''S'' then ''S\00ED'''),
'           when ''N'' then ''No''',
'       end actvo,',
'       case d.indcdor_actlzar',
unistr('           when ''S'' then ''S\00ED'''),
'           when ''N'' then ''No''',
'       end indcdor_actlzar',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P201_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(532719431213765138)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>532719431213765138
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98722788087025962)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98723183195025962)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98723565762025963)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Descargar'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment::'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98723991861025963)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98724386052025963)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98724780346025963)
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
 p_id=>wwv_flow_api.id(98725113768025963)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98725515031025964)
,p_db_column_name=>'INDCDOR_ACTLZAR'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>unistr('\00BFIndicador Actualizar?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(532732898499771405)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'987259'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ID_DCMNTO:ACTVO::INDCDOR_ACTLZAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(605471606989642126)
,p_plug_name=>'Datos del Gestor'
,p_parent_plug_id=>wwv_flow_api.id(523313252000136019)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P201_ID_SLCTUD'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(605476489078643728)
,p_plug_name=>'Datos del Solicitante'
,p_parent_plug_id=>wwv_flow_api.id(523313252000136019)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P201_ID_SLCTUD'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(605719848384966706)
,p_plug_name=>'Datos Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(523313252000136019)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P201_ID_SLCTUD'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4509453672231801)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(94452689418706418)
,p_button_name=>'Btn_Proyeccion'
,p_button_static_id=>'Btn_Proyeccion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Iniciar Proyecci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103986115780655503)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(94452689418706418)
,p_button_name=>'Btn_Compensar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Compensar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:209:&SESSION.::&DEBUG.:RP,209:P209_ID_SLDO_FVOR_SLCTUD,P209_ID_SOLICITUD,P209_SJTO_IMPSTO:&P201_ID_SLCTUD_SLDO_FVOR.,&P201_ID_SLCTUD.,&P201_SJTO_IMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct 1 ',
'from v_gf_g_saldos_favor    a',
'left join gf_g_sldos_fvor_slctud_dtll  b on a.id_sldo_fvor = b.id_sldo_fvor',
'where a.id_sjto_impsto = :P201_SJTO_IMPSTO ',
'and a.indcdor_rcncdo = ''S''',
'and a.sldo_fvor_dspnble > 0',
'or  b.id_sldo_fvor_slctud = :P201_ID_SLCTUD_SLDO_FVOR',
'and b.indcdor_rcncdo = ''S'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104334883003494401)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(94452689418706418)
,p_button_name=>'Btn_Devolucion'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Devolver'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:RP,210:P210_ID_SLDO_FVOR_SLCTUD,P210_ID_SOLICITUD,P210_SJTO_IMPSTO:&P201_ID_SLCTUD_SLDO_FVOR.,&P201_ID_SLCTUD.,&P201_SJTO_IMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(a.vlor_sldo_cptal + a.vlor_intres) - nvl( b.vlor_cmpnscion , 0 )',
'from   v_gf_g_cartera_x_concepto a',
'left join (select  c.id_sjto_impsto,',
'              sum(c.vlor_cmpnscion) as vlor_cmpnscion',
'        from gf_g_saldos_favor_cmpnscion b',
'        join gf_g_sldos_fvr_cmpnscn_dtll c on b.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion',
'        where b.id_sldo_fvor_slctud = :P201_ID_SLCTUD_SLDO_FVOR',
'        and   c.id_sjto_impsto = :P201_SJTO_IMPSTO ',
'        group by c.id_sjto_impsto) b on a.id_sjto_impsto = b.id_sjto_impsto',
'where a.id_sjto_impsto = :P201_SJTO_IMPSTO',
'group by b.vlor_cmpnscion',
'having (sum(a.vlor_sldo_cptal + a.vlor_intres) - nvl( b.vlor_cmpnscion , 0 )) > 0;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21715322730711601)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(94452689418706418)
,p_button_name=>'BTN_FNLZAR_FLJO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Finalizar Flujo'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106834112927273868)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(94452689418706418)
,p_button_name=>'BTN_SALDOS_FAVOR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Saldos a Favor'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:338:&SESSION.::&DEBUG.:RP:P338_ID_SJTO_IMPSTO,P338_ID_SLDO_FVOR_SLCTUD:&P201_SJTO_IMPSTO.,&P201_ID_SLCTUD_SLDO_FVOR.'
,p_icon_css_classes=>'fa-money'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21913773573493004)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(94452689418706418)
,p_button_name=>'BTN_CRTFCDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Generar Certificado'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_exste_dtlle    number;',
'begin',
'    select count(1) into v_exste_dtlle ',
'    from gf_g_sldos_fvor_slctud_dtll where id_sldo_fvor_slctud = :P201_ID_SLCTUD_SLDO_FVOR; ',
'',
'    if :P201_GNRA_CRTFCDO = ''S'' and v_exste_dtlle > 0 then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(134493804747536501)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(94452689418706418)
,p_button_name=>'BTN_OBSRVCNES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Observaciones'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-file-text-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12063140037521933)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(94452689418706418)
,p_button_name=>'BTN_AGRGAR_SPRTE'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Adjuntar Soporte'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=73000:10000:&SESSION.::&DEBUG.:RP,10000:P10000_ID_INSTNCIA_FLJO,P10000_ID_FLJO_TREA,P10000_ID_ORGEN,P10000_CDGO_ORGEN_TPO,P10000_CDGO_PRCSO,P10000_APP,P10000_PAGE:&F_ID_INSTNCIA_FLJO.,&F_ID_FLJO_TREA.,&P201_ID_SLCTUD_SLDO_FVOR.,SOPORTE_SAF,SAF,&APP_ID.,&APP_PAGE_ID.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(134038342547641901)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(94452689418706418)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Regresar a Gesti\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:216:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7175925639963002)
,p_branch_name=>'Go To Page 232'
,p_branch_action=>'f?p=&APP_ID.:232:&SESSION.::&DEBUG.:RP:P232_ID_IMPSTO,P232_ID_PRCSO:&P201_ID_IMPSTO.,&P201_ID_PRCSO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4509453672231801)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(21723007221272501)
,p_branch_name=>'Go To Page 216'
,p_branch_action=>'f?p=&APP_ID.:216:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(21715322730711601)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(21908895508483703)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE,P37_NMBRE_RPRTE:&P201_ID_RPRTE.,CERTIFICADO_SF&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(21913773573493004)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(134494044514536503)
,p_branch_name=>'Ir a Observaciones'
,p_branch_action=>'f?p=&APP_ID.:326:&SESSION.::&DEBUG.:RP:P326_ID_SLDO_FVOR_SLCTUD,P326_INDCDOR_TRNSCION,P326_ID_FLJO_TREA:&P201_ID_SLCTUD_SLDO_FVOR.,N,&F_ID_FLJO_TREA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(134493804747536501)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15959311544805514)
,p_name=>'P201_ID_ADJNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(12061941785521921)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16059329244266301)
,p_name=>'P201_TTAL_SPRTES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(12061941785521921)
,p_prompt=>'Ttal Sprtes'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21243768888020602)
,p_name=>'P201_CMPNSCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21243890205020603)
,p_name=>'P201_DVLCION'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21908967003483704)
,p_name=>'P201_ID_RPRTE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21909034815483705)
,p_name=>'P201_ID_PLNTLLA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28482222072607501)
,p_name=>'P201_ID_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28482442370607503)
,p_name=>'P201_ID_PRCSO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_prompt=>'Id Prcso'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92379865639558701)
,p_name=>'P201_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(92340204912499501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94453298076706424)
,p_name=>'P201_JSON_SALDO_A_FAVOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_prompt=>'Json Saldo a Favor'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98537924213593507)
,p_name=>'P201_ID_SLCTUD_SLDO_FVOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_prompt=>'Id Solicitud'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98709127585025949)
,p_name=>'P201_ID_PRSNTCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98709546906025949)
,p_name=>'P201_ID_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98709924139025950)
,p_name=>'P201_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
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
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98710382577025950)
,p_name=>'P201_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98710785414025951)
,p_name=>'P201_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P201_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98711117258025951)
,p_name=>'P201_IDNTFCCION_SJTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98711557980025951)
,p_name=>'P201_ID_SLCTUD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98711926483025951)
,p_name=>'P201_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98712304416025951)
,p_name=>'P201_FCHA_RDCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98713495204025952)
,p_name=>'P201_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(605471606989642126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98713844075025952)
,p_name=>'P201_DSCRPCION_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(605471606989642126)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98714220093025953)
,p_name=>'P201_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(605471606989642126)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98714614606025953)
,p_name=>'P201_PRMER_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(605471606989642126)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98715074937025953)
,p_name=>'P201_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(605471606989642126)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
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
 p_id=>wwv_flow_api.id(98715405348025953)
,p_name=>'P201_PRMER_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(605471606989642126)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98715888020025953)
,p_name=>'P201_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(605471606989642126)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98716567002025955)
,p_name=>'P201_DSCRPCION_RSPNSBLE_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98716980871025955)
,p_name=>'P201_DSCRPCION_IDNTFCC_TPO_S'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98717394596025956)
,p_name=>'P201_IDNTFCCION_S'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98717757294025957)
,p_name=>'P201_PRMER_NMBRE_S'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98718114131025957)
,p_name=>'P201_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98718561581025957)
,p_name=>'P201_PRMER_APLLDO_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98718921686025957)
,p_name=>'P201_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98719387561025958)
,p_name=>'P201_NMBRE_PAIS_NTFCCION_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98719746278025958)
,p_name=>'P201_NMBRE_DPRTMNTO_NTFCCION_S'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98720100752025958)
,p_name=>'P201_NMBRE_MNCPIO_NTFCCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>'Municpio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98720514927025960)
,p_name=>'P201_DRCCION_NTFCCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98720942592025961)
,p_name=>'P201_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98721370027025961)
,p_name=>'P201_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98721752043025961)
,p_name=>'P201_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(605476489078643728)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102905022278958701)
,p_name=>'P201_SJTO_IMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(605719848384966706)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106854508283918411)
,p_name=>'P201_'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106856133319984301)
,p_name=>'P201_ID_SLDO_FVOR_SLCTUD_DTLLE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110228453492123601)
,p_name=>'P201_ID_SLCTUD_SLDO_FVR_DTLLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_prompt=>'id_slctud_sldo_fvr_dtlle'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122831112195241301)
,p_name=>'P201_ID_SLDO_FVOR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_prompt=>'id_sldo_fvor'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134693717129644628)
,p_name=>'P201_ID_SLDO_FVOR_SPRTE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134777677872067302)
,p_name=>'P201_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(134777568478067301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134777727406067303)
,p_name=>'P201_FCHA_INCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(134777568478067301)
,p_prompt=>'Fecha Inicio Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134777840400067304)
,p_name=>'P201_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(134777568478067301)
,p_prompt=>'Fecha Fin Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134777920587067305)
,p_name=>'P201_DIAS_FLTNTES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(134777568478067301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134845700204870901)
,p_name=>'P201_TXTO_DRCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(134777568478067301)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211904206008655604)
,p_name=>'P201_GNRA_CRTFCDO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(98537845664593506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(92379945479558702)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P201_ID_INSTNCIA_FLJO'
,p_compute_when=>'P201_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(16059562239266303)
,p_validation_name=>'Validar Soportes Cargardos'
,p_validation_sequence=>10
,p_validation=>'P201_TTAL_SPRTES'
,p_validation_type=>'ITEM_NOT_ZERO'
,p_error_message=>'Por favor cargue los soportes para continuar con el proceso.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(4509453672231801)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108093003433594518)
,p_name=>'Al seleccionar saldo a favor'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108091368781594501)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108093171167594519)
,p_event_id=>wwv_flow_api.id(108093003433594518)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerSaldoFavor();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7160891283751701)
,p_event_id=>wwv_flow_api.id(108093003433594518)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98733609883043084)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    --insert into muerto(n_001, v_001) values(99,''F_ID_INSTNCIA_FLJO ''||:F_ID_INSTNCIA_FLJO); commit;    ',
'    select  a.id_tpo,',
'            a.id_mtvo,',
'            b.nmbre_impsto,',
'            c.nmbre_impsto_sbmpsto,',
'            a.id_sjto_impsto,',
'            a.idntfccion,',
'            a.id_rdcdor,',
'            a.id_slctud,',
'            a.nmro_rdcdo_dsplay,',
'            a.fcha_rdcdo,',
'            a.id_prsntcion_tpo,',
'            a.id_impsto',
'      into :P201_ID_TPO,',
'           :P201_ID_MTVO,',
'           :P201_NMBRE_IMPSTO,',
'           :P201_NMBRE_IMPSTO_SBMPSTO,',
'           :P201_SJTO_IMPSTO,',
'           :P201_IDNTFCCION_SJTO,',
'           :P201_ID_RDCDOR,',
'           :P201_ID_SLCTUD,',
'           :P201_NMRO_RDCDO_DSPLAY,',
'           :P201_FCHA_RDCDO,',
'           :P201_ID_PRSNTCION_TPO,',
'           :P201_ID_IMPSTO',
'      from v_pq_g_solicitudes a',
'      inner join df_c_impuestos b on a.id_impsto = b.id_impsto',
'      inner join df_i_impuestos_subimpuesto c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto and',
'                                                 a.id_impsto = c.id_impsto and',
'                                                 c.cdgo_clnte = :F_CDGO_CLNTE',
'      where a.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'          ',
'    ',
'exception',
'    when no_data_found then',
'       --insert into muerto(n_001, v_001) values(99,''Solicitud no encontrada''); commit;',
'       --raise_application_error(-20000, ''Solicitud no encontrada'');',
'       null;',
'    when others then',
'       --insert into muerto(n_001, v_001) values(99,''Problemas al consultar radicador''); commit;',
'       raise_application_error(-20000, ''Problemas al consultar radicador''); ',
'end;',
'  ',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98733909314043951)
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
'    into    :P201_DSCRPCION_IDNTFCCION_TPO,',
'            :P201_IDNTFCCION,',
'            :P201_PRMER_NMBRE,',
'            :P201_SGNDO_NMBRE,',
'            :P201_PRMER_APLLDO,',
'            :P201_SGNDO_APLLDO',
'    from pq_g_radicador a',
'    inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where id_rdcdor = :P201_ID_RDCDOR;',
'exception',
'    when no_data_found then',
'       null;',
'       --raise_application_error(-20000, ''Radicador de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar radicador''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98741787579078726)
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
'      into :P201_DSCRPCION_RSPNSBLE_TPO,',
'           :P201_DSCRPCION_IDNTFCC_TPO_S,',
'           :P201_IDNTFCCION_S,',
'           :P201_PRMER_NMBRE_S,',
'           :P201_SGNDO_NMBRE_S ,',
'           :P201_PRMER_APLLDO_S,',
'           :P201_SGNDO_APLLDO_S,',
'           :P201_NMBRE_PAIS_NTFCCION_S,',
'           :P201_NMBRE_DPRTMNTO_NTFCCION_S,',
'           :P201_NMBRE_MNCPIO_NTFCCION_S,',
'           :P201_DRCCION_NTFCCION_S,',
'           :P201_EMAIL_S,',
'           :P201_TLFNO_S,',
'           :P201_CLLAR_S',
'      from pq_g_solicitantes a',
'      inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'      inner join v_df_s_municipios c on a.id_mncpio_ntfccion = c.id_mncpio',
'      inner join df_s_responsables_tipo d on a.cdgo_rspnsble_tpo = d.cdgo_rspnsble_tpo',
'     where a.id_slctud = :P201_ID_SLCTUD;',
'exception',
'    when no_data_found then',
'       null;',
'       --raise_application_error(-20000, ''Solicitante de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar Solicitante''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98537788174593505)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registra y/o Consulta Solicitud Saldo a Favor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'begin',
'    ',
'    if ( :P201_ID_SLCTUD is null ) then',
'        select  id_impsto into :P201_ID_IMPSTO',
'        from    si_i_sujetos_impuesto b ',
'        where   b.id_sjto_impsto = :F_ID_SJTO_IMPSTO ;',
'        ',
'        :P201_SJTO_IMPSTO := :F_ID_SJTO_IMPSTO;',
'        :P201_ID_SLCTUD := '''';',
'    end if;',
'    ',
'    pkg_gf_saldos_favor.prc_rg_saldos_favor_solicitud(p_cdgo_clnte            => :F_CDGO_CLNTE,',
'                                                      p_id_instncia_fljo      => :F_ID_INSTNCIA_FLJO,',
'                                                      p_id_slctud             => :P201_ID_SLCTUD,',
'                                                      p_id_sjto_impsto        => :F_ID_SJTO_IMPSTO,',
'                                                      o_id_sldo_fvor_slctud   => :P201_ID_SLCTUD_SLDO_FVOR,',
'                                                      o_cdgo_rspsta           => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta          => v_mnsje_rspsta);    ',
'',
'    ',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99007572629974801)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Saldo a Favor Detalle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'begin',
'    ',
'    pkg_gf_saldos_favor.prc_el_saldos_fvor_slctud_dtll(p_cdgo_clnte                => :F_CDGO_CLNTE,',
'                                                       p_id_sldo_fvor_slctud       => :P201_ID_SLCTUD_SLDO_FVOR,',
'                                                       p_id_sldo_fvor_slctud_dtlle => :P201_ID_SLCTUD_SLDO_FVR_DTLLE,',
'                                                       p_id_sldo_fvor              => :P201_ID_SLDO_FVOR,',
'                                                       o_cdgo_rspsta               => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta              => v_mnsje_rspsta);',
'                                                       ',
'                                                       ',
'                                                       ',
'   if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;                                                       ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Revertir'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Operaci\00F3n realizada con exito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(28482328674607502)
,p_process_sequence=>80
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Identificador del proceso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_prcso',
'into :P201_ID_PRCSO',
'from wf_d_flujos   a',
'where a.id_fljo in (select i.id_fljo from wf_g_instancias_flujo i where i.id_instncia_fljo = :F_ID_INSTNCIA_FLJO);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21243952825020604)
,p_process_sequence=>90
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta devoluci\00F3n o compensaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(1)',
'into    :P201_CMPNSCION',
'from    gf_g_saldos_favor_cmpnscion a',
'where   a.id_sldo_fvor_slctud = :P201_ID_SLCTUD_SLDO_FVOR;',
'',
'select  count(1)',
'into    :P201_DVLCION',
'from    gf_g_saldos_favor_devlucion',
'where   id_sldo_fvor_slctud = :P201_ID_SLCTUD_SLDO_FVOR; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134693661349644627)
,p_process_sequence=>100
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    v_file_name       varchar2(2000);',
'    v_file_blob       blob;',
'    file_blob         blob;',
'    v_file_bfile      bfile;',
'    v_file_mimetype   varchar2(1000);',
'    v_tipo_operacion  varchar2(20);',
'    v_id_dcmnto       number;',
'    o_cdgo_rspsta     number;',
'    o_mnsje_rspsta    varchar2(4000);',
'begin',
' ',
'',
'    --Si lo llaman para descargar el soporte',
'    if :P201_ID_ADJNTO is not null then',
'        select  file_blob,    ',
'               file_bfile,     ',
'               file_mimetype,     ',
'               file_name',
'        into   v_file_blob,   ',
'               v_file_bfile,   ',
'               v_file_mimetype,   ',
'               v_file_name',
'        from gn_g_adjuntos',
'        where id_adjnto  = :P201_ID_ADJNTO;',
'    else',
'        apex_application.g_print_success_message := ''<span style="color:white">ITEM [''||:P201_ID_SLDO_FVOR_SPRTE||'']!'';       ',
'        select  file_blob,    ',
'               file_bfile,     ',
'               file_mimetype,     ',
'               file_name',
'        into   v_file_blob,   ',
'               v_file_bfile,   ',
'               v_file_mimetype,   ',
'               v_file_name',
'        from gf_g_saldos_favor_soporte',
'        where id_sldo_fvor_sprte  = :P201_ID_SLDO_FVOR_SPRTE;    ',
'    end if; ',
'    ',
'    if  v_file_blob is null and v_file_bfile is not null then ',
'        -- apex_application.g_print_success_message := ''<span style="color:white">ENTRO [''||:P201_ID_SLDO_FVOR_SPRTE||'']!'';',
'        pkg_gd_utilidades.prc_co_archco_dsco ( p_bfile          => v_file_bfile',
'                                                , o_archvo_blob      => v_file_blob ',
'                                                , o_cdgo_rspsta      => o_cdgo_rspsta ',
'                                                , o_mnsje_rspsta     => o_mnsje_rspsta) ;   ',
'        ',
'    end if;',
'    ',
'     htp.init;',
'        owa_util.mime_header(v_file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||v_file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_file_blob);',
'        apex_application.stop_apex_engine; ',
'    ',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DESCARGAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134778094821067306)
,p_process_sequence=>110
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta duraci\00F3n etapa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.nmbre_trcro ,',
'        trunc(a.fcha_incio) , ',
'        trunc(a.fcha_fin_plnda) ,    ',
'        trunc(a.fcha_fin_plnda) - trunc(sysdate) dias_fltntes  ,',
'        decode( id_estdo_trnscion , 3 , ''Esta tarea fue finalizada por el usuario ''||trim(c.nmbre_trcro)',
'        ||'' en un total de ''|| decode ( (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)) , 0 , 1 , (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)) )',
unistr('        ||'' d\00EDa(s). Desde el ''||trunc(a.fcha_incio)||'' hasta el ''||trunc(a.fcha_fin_real)||''.'' ,'),
'                ''Sr(a) ''|| trim(c.nmbre_trcro) ||'' le quedan ''|| decode ( (trunc(a.fcha_fin_plnda) - trunc(sysdate)) , 0 , 1 ,(trunc(a.fcha_fin_plnda) - trunc(sysdate)) )',
unistr('        ||''  d\00EDa(s) para resolver la tarea de ''||b.nmbre_trea||'' para pasar a dar continuidad al proceso.'' )'),
'into    :P201_USRIO,',
'        :P201_FCHA_INCIO,',
'        :P201_FCHA_FIN, ',
'        :P201_DIAS_FLTNTES, ',
'        :P201_TXTO_DRCION',
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
 p_id=>wwv_flow_api.id(211904116545655603)
,p_process_sequence=>120
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Configuraci\00F3n General')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  gnra_crtfcdo',
'    into    :P201_GNRA_CRTFCDO',
'    from    gi_d_saldos_favor_cnfgrcion a',
'    where   cdgo_clnte = :F_CDGO_CLNTE  ;',
'exception',
'    when others then',
unistr('        raise_application_error(-20001, ''No se encontr\00F3 CONFICURACION GENERAL'');'),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98801151138530102)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Saldo a Favor Detalle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'    v_rcncdo          varchar2(1);',
'begin',
'    if(:REQUEST = ''Btn_Reconocer'')then',
'        v_rcncdo := ''S'';',
'    elsif(:REQUEST = ''Btn_Rechazar'')then',
'        v_rcncdo := ''N'';',
'    end if;',
'    ',
'    pkg_gf_saldos_favor.prc_rg_saldos_fvor_slctud_dtll(p_cdgo_clnte                => :F_CDGO_CLNTE,',
'                                                       p_id_sldo_fvor_slctud       => :P201_ID_SLCTUD_SLDO_FVOR,',
'                                                       p_json_id_sldo_fvor         => :P201_JSON_SALDO_A_FAVOR,',
'                                                       p_indcdor_rcncdo            => v_rcncdo,',
'                                                       o_cdgo_rspsta               => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta              => v_mnsje_rspsta);',
'                                                       ',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Btn_Reconocer, Btn_Rechazar'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106854788670920134)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar saldo favor solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sldo_fvor   number;',
'    v_ttal_cmpnscion number;',
'    v_ttal_dvlcion   number;',
'begin',
'    ',
'    --Se obtiene el saldo a favor',
'    begin',
'        select a.id_sldo_fvor',
'        into v_id_sldo_fvor',
'        from gf_g_sldos_fvor_slctud_dtll a',
'        where id_sldo_fvor_slctud_dtlle = :P201_ID_SLDO_FVOR_SLCTUD_DTLLE;',
'    exception',
'        when others then',
'            v_id_sldo_fvor := null;',
'    end;',
'    ',
unistr('    --Se valida si el saldo a favor se encuentra en una la devoluci\00F3n y/o compensaci\00F3n de la solicitud'),
'    begin',
'        select count(*)',
'        into v_ttal_cmpnscion',
'        from gf_g_sldos_fvr_cmpnscn_dtll a',
'        where a.id_sldo_fvor = v_id_sldo_fvor',
'        and a.id_sld_fvr_cmpnscion = (',
'                                        select c.id_sld_fvr_cmpnscion',
'                                        from gf_g_saldos_favor_cmpnscion c',
'                                        where id_sldo_fvor_slctud = :P201_ID_SLDO_FVOR_SLCTUD',
'                                     );',
'        ',
'    exception',
'        when others then',
unistr('             raise_application_error(-20002, ''Problema al validar si el saldo a favor fue usando en una devoluci\00F3n y/o compensaci\00F3n de la solicitud ''|| sqlerrm);'),
'    end;',
'    ',
unistr('    --Se valida si el saldo a favor se encuentra en una la devoluci\00F3n y/o compensaci\00F3n de la solicitud'),
'    begin',
'        select count(*)',
'        into v_ttal_dvlcion',
'        from gf_g_sldos_fvr_dvlcion_dtll a',
'        where id_sldo_fvor = v_id_sldo_fvor',
'        and a.id_sldo_fvor_dvlcion = (',
'                                        select c.id_sldo_fvor_dvlcion',
'                                        from gf_g_saldos_favor_devlucion c',
'                                        where c.id_sldo_fvor_slctud = :P201_ID_SLDO_FVOR_SLCTUD',
'                                     );',
'        ',
'    exception',
'        when others then',
unistr('             raise_application_error(-20002, ''Problema al validar si el saldo a favor fue usando en una devoluci\00F3n y/o compensaci\00F3n de la solicitud ''|| sqlerrm);'),
'    end;',
'    ',
'    if v_ttal_cmpnscion > 0 or v_ttal_dvlcion > 0  then',
unistr('        raise_application_error(-20001, ''Debe eliminar previamente el saldo a favor de la devoluci\00F3n y/o compensaci\00F3n'');'),
'    end if;',
'',
'    --Elimina el saldo a favor de la solicitud',
'    begin',
'        delete from gf_g_sldos_fvor_slctud_dtll',
'        where id_sldo_fvor_slctud_dtlle = :P201_ID_SLDO_FVOR_SLCTUD_DTLLE;',
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21715481752711602)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Finalizar Flujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_error          varchar2(1);',
'    o_mnsje_rspsta   varchar2(4000);',
'begin    ',
'',
'    -- SE FINALIZA EL FLUJO',
'    pkg_gf_saldos_favor.prc_rg_saldos_favor_fin_fljo(p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO,',
'                                                     p_id_fljo_trea     => :F_ID_FLJO_TREA);',
'                                         ',
'',
'   /*  begin ',
'      pkg_pl_workflow_1_0.prc_rg_finalizar_instancia(p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO,',
'                                                     p_id_fljo_trea     => :F_ID_FLJO_TREA,',
'                                                     p_id_usrio         => :F_ID_USRIO,',
'                                                     o_error            => v_error,',
'                                                     o_msg              => o_mnsje_rspsta);',
'      if v_error = ''N'' then ',
'        raise_application_error(-20001, ''No se pudo finalizar el flujo: ''||o_mnsje_rspsta);',
'      end if;',
'    exception',
'      when others then  ',
'        raise_application_error(-20001, ''Error al finalizar el flujo: ''||sqlerrm);',
'    end;',
'    */',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21715322730711601)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21908777489483702)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Json'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_object json_object_t := json_object_t();',
'    v_json                clob ;',
'    v_id_sjto_impsto      number;',
'    v_id_sldo_fvor        varchar2(4000);',
'begin',
'',
'    select  a.id_rprte , a.id_plntlla',
'    into    :P201_ID_RPRTE , :P201_ID_PLNTLLA',
'    from    gn_d_plantillas a',
'    join    gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'    where   b.cdgo_acto_tpo = ''CSA'' ',
'    and     a.tpo_plntlla = ''M'' ;',
'    ',
'    select count(distinct(id_sjto_impsto)) ',
'    into   v_id_sjto_impsto ',
'    from   json_table(:P201_JSON_SALDO_A_FAVOR,''$[*]''',
'                      columns (id_sjto_impsto varchar2(4000) PATH ''$.ID_SJTO_IMPSTO''));',
'      ',
'    if (v_id_sjto_impsto > 1) then',
'        raise_application_error(-20001, ''No se puede generar el certificado para identificaciones diferentes. Por favor valide los datos.'' ); ',
'    else',
'        select listagg(id_sldo_fvor, '','') within group (order by id_sldo_fvor desc) ',
'        into   v_id_sldo_fvor ',
'        from   json_table(:P201_JSON_SALDO_A_FAVOR,''$[*]''',
'                          columns (id_sldo_fvor varchar2(4000) PATH ''$.ID_SLDO_FVOR''));',
'',
'        select distinct(id_sjto_impsto) ',
'        into   v_id_sjto_impsto ',
'        from   json_table(:P201_JSON_SALDO_A_FAVOR,''$[*]''',
'                          columns (id_sjto_impsto varchar2(4000) PATH ''$.ID_SJTO_IMPSTO''));',
'',
'        v_object.put(''id_impsto'', :P201_ID_IMPSTO);',
'        v_object.put(''id_impsto_sbimpsto'',:P201_ID_IMPSTO_SBIMPSTO);',
'        v_object.put(''cdgo_clnte'', :F_CDGO_CLNTE);',
'        v_object.put(''usrio'', :F_NMBRE_USRIO);',
'        v_object.put(''id_sjto_impsto'',v_id_sjto_impsto);',
'        v_object.put(''id_sldo_fvor'',v_id_sldo_fvor);',
'        v_object.put(''id_sldo_fvor_slctud'',:P201_ID_SLCTUD_SLDO_FVOR);',
'        v_object.put(''id_rprte'',:P201_ID_PLNTLLA);',
'',
'        v_json := v_object.to_clob();   ',
'',
'        --insert into muerto (n_001, c_001, t_001) values(11 , v_json , systimestamp); commit;',
'',
'        apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'        apex_util.set_session_state(''P37_JSON'', v_json);',
'        apex_session.attach ( p_app_id => 71000, p_page_id => 201, p_session_id => :APP_SESSION );    ',
'    end if;',
'    ',
'    exception',
'         when no_data_found then',
'              null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21913773573493004)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15959143032805512)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(12061941785521921)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Soportes - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16059844800266306)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar Soportes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   count(1)',
'into :P201_TTAL_SPRTES',
'from    gn_g_adjuntos a',
'where   a.cdgo_prcso = ''SAF''',
'        and a.id_orgen = :P201_ID_SLCTUD_SLDO_FVOR',
'        and a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'        and a.id_fljo_trea = :F_ID_FLJO_TREA;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
