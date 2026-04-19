prompt --application/pages/page_00232
begin
wwv_flow_api.create_page(
 p_id=>232
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('An\00E1lisis Saldo a Favor')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('An\00E1lisis Saldo a Favor')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel() {',
'  var region = apex.region("reglasNegocio");',
'  if (region) {',
'    var view = region.widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var records_ = view.view$.grid("getSelectedRecords"); //todos los seleccionados',
'    var records = model._data; //todos los datos de la grilla',
'    //REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'    records = records.filter(function (record) {',
'      return model.getValue(record, "EDITABLE") === "No";',
'    });',
'',
'    records_',
'      .filter(function (record) {',
'        return model.getValue(record, "EDITABLE") !== "No";',
'      })',
'      .forEach(function (f) {',
'        records.push(f);',
'      });',
'',
'    var json = records.map(function (m) {',
'      return model.getValue(m, "ID_RGLA_NGCIO_CLNTE_FNCION").trim();',
'    });',
'',
'    $s("P232_RGLAS_NGCIO", json.length > 0 ? json : "");',
'',
'    if (json.length > 0) {',
'      $("#BTN_INCIAR_ANLSIS").show();',
'    } else {',
'      $("#BTN_INCIAR_ANLSIS").hide();',
'    }',
'',
'    //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID',
'    //console.log(records);',
'    region.widget().interactiveGrid("setSelectedRecords", records);',
'    return;',
'  }',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'80%'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220513151520'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4509576315231802)
,p_plug_name=>'Reglas de negocio'
,p_region_name=>'reglasNegocio'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_rgla_ngcio_clnte,',
'      b.id_impsto,',
'      e.nmbre_impsto,',
'      a.nmbre as nmbre_rgla_ngcio,',
'      case when b.indcdor_edta_rgla = ''N'' then ''No'' else ''Si'' end as Editable,',
'      c.id_rgla_ngcio_clnte_fncion,',
'      d.dscrpcion',
'from gn_d_reglas_negocio a',
'join gn_d_reglas_negocio_cliente     b on a.id_rgla_ngcio       = b.id_rgla_ngcio',
'join gn_d_rglas_ngcio_clnte_fnc      c on b.id_rgla_ngcio_clnte = c.id_rgla_ngcio_clnte',
'join gn_d_funciones                  d on c.id_fncion           = d.id_fncion',
'join df_c_impuestos                  e on  e.id_impsto          = b.id_impsto',
'where       b.cdgo_clnte    =       :F_CDGO_CLNTE',
'and         a.id_prcso      =       :P232_ID_PRCSO',
'and         b.id_impsto     =       :P232_ID_IMPSTO',
'and         a.actvo         =       ''S''',
'and         sysdate         between b.fcha_incio and b.fcha_fin '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4509725261231804)
,p_name=>'ID_RGLA_NGCIO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(4509843435231805)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(4509947395231806)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(4510281871231809)
,p_name=>'NMBRE_RGLA_NGCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RGLA_NGCIO'
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
 p_id=>wwv_flow_api.id(4510444466231811)
,p_name=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4510523457231812)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Funci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(4511252260231819)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4511934774231826)
,p_name=>'EDITABLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EDITABLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Editable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4509622309231803)
,p_internal_uid=>4509622309231803
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
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
' config.initialSelection = false;',
' return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(4527762650359156)
,p_interactive_grid_id=>wwv_flow_api.id(4509622309231803)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4527897692359156)
,p_report_id=>wwv_flow_api.id(4527762650359156)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4528371610359159)
,p_view_id=>wwv_flow_api.id(4527897692359156)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4509725261231804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4528879134359163)
,p_view_id=>wwv_flow_api.id(4527897692359156)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4509843435231805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4529369464359165)
,p_view_id=>wwv_flow_api.id(4527897692359156)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4509947395231806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4530816120359169)
,p_view_id=>wwv_flow_api.id(4527897692359156)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(4510281871231809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4531753926359172)
,p_view_id=>wwv_flow_api.id(4527897692359156)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(4510444466231811)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4532212240359174)
,p_view_id=>wwv_flow_api.id(4527897692359156)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(4510523457231812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4637446932639272)
,p_view_id=>wwv_flow_api.id(4527897692359156)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(4511934774231826)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4948920809837540)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4509576315231802)
,p_button_name=>'BTN_CNCLAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4662770184801728)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4509576315231802)
,p_button_name=>'BTN_INCIAR_ANLSIS'
,p_button_static_id=>'BTN_INCIAR_ANLSIS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Iniciar An\00E1lisis')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gn_d_reglas_negocio a',
'join gn_d_reglas_negocio_cliente     b on a.id_rgla_ngcio       = b.id_rgla_ngcio',
'join gn_d_rglas_ngcio_clnte_fnc      c on b.id_rgla_ngcio_clnte = c.id_rgla_ngcio_clnte',
'join gn_d_funciones                  d on c.id_fncion           = d.id_fncion',
'join df_c_impuestos                  e on  e.id_impsto          = b.id_impsto',
'where       b.cdgo_clnte    =       :F_CDGO_CLNTE',
'and         a.id_prcso      =       :P232_ID_PRCSO',
'and         b.id_impsto     =       :P232_ID_IMPSTO',
'and         a.actvo         =       ''S''',
'and         sysdate         between b.fcha_incio and b.fcha_fin'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23320657852931001)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4509576315231802)
,p_button_name=>'BTN_INCIO_ANLSIS_SF'
,p_button_static_id=>'BTN_INCIAR_ANLSIS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Inicio An\00E1lisis SF')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_exste_rgla	number;',
'	v_id_orgen		number;',
'begin',
'		',
'	select 	count(1) into v_id_orgen',
'	from 	gf_g_saldos_favor ',
'	where   id_sldo_fvor in ( ',
'						select id_sldo_fvor ',
'						from json_table(:P201_JSON_SALDO_A_FAVOR, ''$[*]'' ',
'														columns( id_sldo_fvor number path ''$.ID_SLDO_FVOR''))',
'							)',
'    and    id_orgen is null;',
'							',
'	if v_id_orgen = 0 then',
'		select 	count(1) into v_exste_rgla',
'		from 	gn_d_reglas_negocio a',
'		join 	gn_d_reglas_negocio_cliente     b on a.id_rgla_ngcio       = b.id_rgla_ngcio',
'		join 	gn_d_rglas_ngcio_clnte_fnc      c on b.id_rgla_ngcio_clnte = c.id_rgla_ngcio_clnte',
'		join 	gn_d_funciones                  d on c.id_fncion           = d.id_fncion',
'		join 	df_c_impuestos                  e on  e.id_impsto          = b.id_impsto',
'		where	b.cdgo_clnte =  :F_CDGO_CLNTE',
'		and		a.id_prcso   =  :P232_ID_PRCSO',
'		and		b.id_impsto  =  :P232_ID_IMPSTO',
'		and		a.actvo      =  ''S''',
'		and		sysdate      between b.fcha_incio and b.fcha_fin;',
'		',
'		if v_exste_rgla = 0 then',
'			return true;',
'		else',
'			return false;',
'		end if;',
'	else',
'		return false;',
'	end if;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(63288063414443701)
,p_branch_name=>'Ir a la pagina 201'
,p_branch_action=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'REDIRIGIR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4511621059231823)
,p_name=>'P232_RGLAS_NGCIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4509576315231802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28482562940607504)
,p_name=>'P232_ID_PRCSO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4509576315231802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28482657040607505)
,p_name=>'P232_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4509576315231802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4511498516231821)
,p_name=>'Al seleccionar la regla'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4509576315231802)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4511546549231822)
,p_event_id=>wwv_flow_api.id(4511498516231821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4512044462231827)
,p_name=>'Al cambiar'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4509576315231802)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridreportchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4512120137231828)
,p_event_id=>wwv_flow_api.id(4512044462231827)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4512337069231830)
,p_name=>'Al hacer clic'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4662770184801728)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4512492515231831)
,p_event_id=>wwv_flow_api.id(4512337069231830)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_analizarSaldoFavor() {',
'  let $waitPopup = apex.widget.waitPopup();',
'  try {',
'    await apex.server.process(',
'      "ajaxAnalizarSaldoFavor",',
'      {',
'        pageItems:',
'          "#P232_RGLAS_NGCIO, #P201_JSON_SALDO_A_FAVOR, #P201_ID_SLCTUD_SLDO_FVOR",',
'      },                       ',
'      {',
'        success: function (pData) {',
'          if (pData.o_cdgo_rspsta != 0) {',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'              {',
'                type: "error",',
'                location: "page",',
'                message: pData.o_mnsje_rspsta,',
'                unsafe: false,',
'              },',
'            ]);',
'          } else {',
unistr('            apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'            apex.submit({ request: "REDIRIGIR"});',
'          }',
'        },',
'      }',
'    );',
'  } catch (e) {',
'    console.log(e);',
'  } finally {',
'    $waitPopup.remove();',
'  }',
'}',
'',
'apex.message.confirm(',
unistr('  "\00BFEst\00E1 seguro de iniciar el an\00E1lisis para los saldo a favor seleccionados?",'),
'  function (okPressed) {',
'    if (okPressed) {',
'      fnc_analizarSaldoFavor();',
'    }',
'  }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23320769735931002)
,p_name=>'Al hacer clic SF'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23320657852931001)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23320811454931003)
,p_event_id=>wwv_flow_api.id(23320769735931002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_validarSaldoFavor() {',
'  let $waitPopup = apex.widget.waitPopup();',
'  try {',
'    await apex.server.process(',
'      "ajaxValidarSaldoFavor",',
'      {',
'        pageItems: "#P201_ID_SLCTUD_SLDO_FVOR",',
'      },                       ',
'      {',
'        success: function (pData) {',
'          if (pData.o_cdgo_rspsta != 0) {',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'              {',
'                type: "error",',
'                location: "page",',
'                message: pData.o_mnsje_rspsta,',
'                unsafe: false,',
'              },',
'            ]);',
'          } else {',
unistr('            apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'            apex.submit({ request: "REDIRIGIR"});',
'          }',
'        },',
'      }',
'    );',
'  } catch (e) {',
'    console.log(e);',
'  } finally {',
'    $waitPopup.remove();',
'  }',
'}',
'',
'apex.message.confirm(',
unistr('  "\00BFEst\00E1 seguro de iniciar el an\00E1lisis para los saldos a favor seleccionados?",'),
'  function (okPressed) {',
'    if (okPressed) {',
'      fnc_validarSaldoFavor();',
'    }',
'  }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4511376790231820)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(4509576315231802)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Reglas de negocio: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4951208698843968)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar cuadro de dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4948920809837540)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4512515002231832)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxAnalizarSaldoFavor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_cdgo_rspsta     number;',
'   v_mnsje_rspsta    varchar2(3000);',
'   v_rcncdo          varchar2(1);',
'   v_url             varchar2(1000);',
'   v_exception       exception;',
'begin',
'',
'   pkg_gf_saldos_favor.prc_rg_saldos_fvor_slctud_dtll(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                                      p_id_sldo_fvor_slctud         => :P201_ID_SLCTUD_SLDO_FVOR,',
'                                                      p_json_id_sldo_fvor           => :P201_JSON_SALDO_A_FAVOR,',
'                                                      p_id_rgla_ngcio_clnte_fncion  => :P232_RGLAS_NGCIO,',
'                                                      o_url                         => v_url,',
'                                                      o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta                => v_mnsje_rspsta);',
'                                                     ',
'   if v_cdgo_rspsta > 0 then',
'       raise v_exception;',
'   end if;',
'                                                     ',
'   apex_json.open_object;',
'   apex_json.write(''o_cdgo_rspsta'', 0);',
'   apex_json.write(''o_mnsje_rspsta'', ''v_mnsje_rspsta'');',
'   apex_json.close_object;',
'       ',
'exception',
'   when v_exception then',
'       rollback;',
'       apex_json.open_object;',
'       apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'       apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'       apex_json.close_object;',
'   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23320968560931004)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxValidarSaldoFavor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'    v_rcncdo          varchar2(1);',
'    v_url             varchar2(1000);',
'    v_exception       exception;',
'	p_json			  json_object_t := new json_object_t();',
'	p_json_array	  json_array_t := json_array_t(); ',
'	v_json			  clob;',
'    v_cdgo_sldo_fvor_tpo	gf_g_saldos_favor.cdgo_sldo_fvor_tpo%type;',
'begin',
' ',
' --insert into muerto2 (n_001, c_001) values(44, ''entra-->''||:P201_JSON_SALDO_A_FAVOR); commit;',
'',
'	/*se recorrren los saldos capitales de cada concepto a ajustar */',
'	for c_sldos in (  select  id_sldo_fvor ',
'					  from json_table(:P201_JSON_SALDO_A_FAVOR, ''$[*]'' columns(id_sldo_fvor number path ''$.ID_SLDO_FVOR'' ) ) ',
'		           )',
'	loop  	',
' --insert into muerto2 (n_001, c_001, t_001) values(44, ''entra-->''||c_sldos.id_sldo_fvor,systimestamp); commit;',
' ',
'		select cdgo_sldo_fvor_tpo into v_cdgo_sldo_fvor_tpo',
'		from gf_g_saldos_favor where id_sldo_fvor = c_sldos.id_sldo_fvor;',
'  ',
'		--p_json:=json_object_t();',
'		p_json.put(''ID_SLDO_FVOR'',c_sldos.id_sldo_fvor);',
'		p_json.put(''CDGO_SLDO_FVOR_TPO'',v_cdgo_sldo_fvor_tpo);',
'		p_json.put(''INDCDOR_RCNCDO'',''S'');',
'		p_json_array.append(p_json);	',
'	end loop; ',
'	v_json:= p_json_array.to_clob();',
' ',
' --insert into muerto2 (n_001, c_001, t_001) values(44, ''v_json: ''||v_json,systimestamp); commit;',
'             ',
'   pkg_gf_saldos_favor.prc_rg_saldos_fvor_slctud_dtll(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                                      p_id_sldo_fvor_slctud         => :P201_ID_SLCTUD_SLDO_FVOR,',
'                                                      p_json_id_sldo_fvor           => v_json, ',
'                                                      o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta                => v_mnsje_rspsta);',
'                                                     ',
'   if v_cdgo_rspsta > 0 then',
'       raise v_exception;',
'   end if;',
'                                                     ',
'   apex_json.open_object;',
'   apex_json.write(''o_cdgo_rspsta'', 0);',
'   apex_json.write(''o_mnsje_rspsta'', ''v_mnsje_rspsta'');',
'   apex_json.close_object;',
'       ',
'exception',
'   when v_exception then',
'       rollback;',
'       apex_json.open_object;',
'       apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'       apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'       apex_json.close_object;',
'   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
