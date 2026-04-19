prompt --application/pages/page_00366
begin
wwv_flow_api.create_page(
 p_id=>366
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Certificados de Saldo a Favor'
,p_step_title=>'Certificados de Saldo a Favor'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
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
'                     "ID_SJTO_IMPSTO":     model.getValue(modelo, "ID_SJTO_IMPSTO")};',
'                     /*"ID_SJTO_IMPSTO":     model.getValue(record, "ID_SJTO_IMPSTO").trim()};*/',
'        });  ',
'        ',
'        //console.log(''json: ''+json);',
'        ',
'        $s(''P366_JSON_SALDO_A_FAVOR'', JSON.stringify(json));',
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
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer{',
'    display: none;   ',
'}',
'',
'#P366_JSON_SALDO_A_FAVOR.t-TabsRegion-items{',
'    min-height: 100px !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20220405174225'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(186476679043640816)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(246985843103626103)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21909265475483707)
,p_plug_name=>'New'
,p_region_name=>'saf'
,p_parent_plug_id=>wwv_flow_api.id(246985843103626103)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 	a.id_sldo_fvor,',
'		c.idntfccion_sjto,',
'		--c.idntfccion_sjto_frmtda,',
'		a.nmbre_impsto,',
'		b.nmbre,',
'		a.vlor_sldo_fvor,',
'		to_char(a.fcha_rgstro, ''dd/MM/YYYY'') as fecha,',
'        a.sldo_fvor_dspnble,',
'        a.id_sjto_impsto',
'from 	v_gf_g_saldos_favor       a ',
'join 	gf_d_saldos_favor_tipo    b on a.cdgo_sldo_fvor_tpo = b.cdgo_sldo_fvor_tpo',
'join 	v_si_i_sujetos_impuesto   c on a.id_sjto_impsto = c.id_sjto_impsto',
'where 	a.cdgo_clnte = :F_CDGO_CLNTE',
'and 	not a.estdo = ''AN''      ',
'and     a.sldo_fvor_dspnble > 0 ',
'',
'and     (c.idntfccion_sjto           = :P366_IDNTFCCION or :P366_IDNTFCCION  is null)',
'',
'and ( ( trunc(a.fcha_rgstro)  between to_date(:P366_FCHA_INCIO,''dd/mm/yyyy'') and to_date(:P366_FCHA_FIN,''dd/mm/yyyy'') )',
'    or ( trunc(a.fcha_rgstro) >= to_date(:P366_FCHA_INCIO,''dd/mm/yyyy'') and to_date(:P366_FCHA_FIN,''dd/mm/yyyy'') 		  is null ) ',
'    or ( trunc(a.fcha_rgstro) <= to_date(:P366_FCHA_FIN,''dd/mm/yyyy'') 			       ',
'    and to_date(:P366_FCHA_INCIO,''dd/mm/yyyy'')        is null)',
'    or (:P366_FCHA_INCIO 	is null    and :P366_FCHA_FIN 		  is null) )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21909430673483709)
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21909575080483710)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(21909781206483712)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(21909846370483713)
,p_name=>'NMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(21909936745483714)
,p_name=>'VLOR_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo Favor'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21910069440483715)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha'
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
 p_id=>wwv_flow_api.id(21910127082483716)
,p_name=>'SLDO_FVOR_DSPNBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SLDO_FVOR_DSPNBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Favor Disponible'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(21910279405483717)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(21910973861483724)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21911076833483725)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21909346246483708)
,p_internal_uid=>21909346246483708
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
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
 p_id=>wwv_flow_api.id(21925403466283474)
,p_interactive_grid_id=>wwv_flow_api.id(21909346246483708)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(21925581779283478)
,p_report_id=>wwv_flow_api.id(21925403466283474)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21925983549283720)
,p_view_id=>wwv_flow_api.id(21925581779283478)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21909430673483709)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21926358139283722)
,p_view_id=>wwv_flow_api.id(21925581779283478)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21909575080483710)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21927329941283726)
,p_view_id=>wwv_flow_api.id(21925581779283478)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21909781206483712)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21927888414283728)
,p_view_id=>wwv_flow_api.id(21925581779283478)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(21909846370483713)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21928270671283791)
,p_view_id=>wwv_flow_api.id(21925581779283478)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21909936745483714)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21928781356283869)
,p_view_id=>wwv_flow_api.id(21925581779283478)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(21910069440483715)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21929186719283871)
,p_view_id=>wwv_flow_api.id(21925581779283478)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(21910127082483716)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21929685737283872)
,p_view_id=>wwv_flow_api.id(21925581779283478)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(21910279405483717)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21942422841314627)
,p_view_id=>wwv_flow_api.id(21925581779283478)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21910973861483724)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(368858748258808529)
,p_plug_name=>unistr('Par\00E1metro de b\00FAsquedas')
,p_parent_plug_id=>wwv_flow_api.id(246985843103626103)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(495324788579431868)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
unistr('Opci\00F3n que permite: <br><br>'),
'',
'<i>',
'Visualizar los Saldo a Favor que tienen los Sujetos Impuestos .<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186476760736640817)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(186476679043640816)
,p_button_name=>'BTN_CRTFCDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Generar Certificado'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186466862922631786)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(368858748258808529)
,p_button_name=>'Btn_Consulta'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consulta'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(186477016765640820)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE,P37_NMBRE_RPRTE:&P366_ID_RPRTE.,CERTIFICADO_SF&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(186476760736640817)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21803790760346501)
,p_name=>'P366_ID_RPRTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(368858748258808529)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21803885766346502)
,p_name=>'P366_ID_PLNTLLA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(368858748258808529)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186467201992631826)
,p_name=>'P366_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(368858748258808529)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186467569554631881)
,p_name=>'P366_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(368858748258808529)
,p_prompt=>'Fecha Inicio:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186467971392631884)
,p_name=>'P366_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(368858748258808529)
,p_prompt=>'Fecha Fin:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P366_FCHA_INCIO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186476502542640815)
,p_name=>'P366_JSON_SALDO_A_FAVOR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(368858748258808529)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186473426396632062)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P366_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186473816337632063)
,p_event_id=>wwv_flow_api.id(186473426396632062)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P366_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P366_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186472639688632022)
,p_name=>'Limpia fecha inicio'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P366_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186473026873632045)
,p_event_id=>wwv_flow_api.id(186472639688632022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P366_FCHA_INCIO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186474290926632063)
,p_name=>'Limpia fecha fin'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P366_FCHA_FIN'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186474763396632064)
,p_event_id=>wwv_flow_api.id(186474290926632063)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P366_FCHA_FIN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21911261566483727)
,p_name=>'Al seleccionar saldo a favor'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(21909265475483707)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21911399365483728)
,p_event_id=>wwv_flow_api.id(21911261566483727)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerSaldoFavor();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186476832961640818)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_object json_object_t := json_object_t();',
'    v_json                clob ;',
'    v_id_sjto_impsto      number;',
'    v_id_sldo_fvor        varchar2(4000);',
'begin',
'    select  a.id_rprte , a.id_plntlla',
'    into    :P366_ID_RPRTE , :P366_ID_PLNTLLA',
'    from    gn_d_plantillas a',
'    join    gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'    where   b.cdgo_acto_tpo = ''CSA'' ',
'    and     a.tpo_plntlla = ''M'' ;',
'    ',
'    --insert into muerto (n_001,v_001,c_001) values (525252,''Json SF'',:P366_JSON_SALDO_A_FAVOR);commit;',
'    --:P366_JSON_SALDO_A_FAVOR  := ''{"ID_SLDO_FVOR":459}'' ;',
'    --:P273_CNSCUTVO := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''PYZ'');',
'    ',
'    select count(distinct(id_sjto_impsto)) into v_id_sjto_impsto ',
'        from json_table(:P366_JSON_SALDO_A_FAVOR,''$[*]''',
'        columns (id_sjto_impsto varchar2(100) PATH ''$.ID_SJTO_IMPSTO''));',
'      ',
'        if (v_id_sjto_impsto > 1) then',
'            raise_application_error(-20001, ''No se puede generar el certificado para identificaciones diferentes. Por favor valide los datos.'' ); ',
'        else',
'                select listagg(id_sldo_fvor, '','') within group (order by id_sldo_fvor desc) into v_id_sldo_fvor ',
'                from json_table(:P366_JSON_SALDO_A_FAVOR,''$[*]''',
'                columns (id_sldo_fvor varchar2(4000) PATH ''$.ID_SLDO_FVOR''));',
'                ',
'                select distinct(id_sjto_impsto) into v_id_sjto_impsto ',
'                from json_table(:P366_JSON_SALDO_A_FAVOR,''$[*]''',
'                columns (id_sjto_impsto varchar2(100) PATH ''$.ID_SJTO_IMPSTO''));',
'                ',
'                v_object.put(''id_impsto'', :P366_ID_IMPSTO);',
'                v_object.put(''id_impsto_sbimpsto'',:P366_ID_IMPSTO_SBIMPSTO);',
'                v_object.put(''cdgo_clnte'', :F_CDGO_CLNTE);',
'                v_object.put(''usrio'', :F_NMBRE_USRIO);',
'                v_object.put(''id_sjto_impsto'',v_id_sjto_impsto);--:P366_ID_SJTO_IMPSTO',
'                v_object.put(''id_sldo_fvor'',v_id_sldo_fvor);--:P366_JSON_SALDO_A_FAVOR);',
'                --v_object.put(''cnsctvo'',:P273_CNSCUTVO);',
'                v_object.put(''id_rprte'',:P366_ID_PLNTLLA);',
'',
'                v_json := v_object.to_clob();   ',
'',
'                --insert into muerto (n_001,v_001,c_001) values (525252,''Json SF'',v_json);commit;',
'                ',
'                apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'                apex_util.set_session_state(''P37_JSON'', v_json);',
'                apex_session.attach ( p_app_id => 71000, p_page_id => 366, p_session_id => :APP_SESSION );    ',
'        end if;',
'    exception',
'         when no_data_found then',
'              null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(186476760736640817)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186476914258640819)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar_certificado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_cdgo_rspsta  	   number;',
'    v_mnsje_rspsta 	   varchar2(4000);',
'    ',
'begin',
'',
'    pkg_gf_paz_y_salvo.prc_rg_paz_salvo( p_cdgo_clnte        => :F_CDGO_CLNTE ',
'                                       , p_id_impsto         => :P272_ID_IMPSTO',
'                                       , p_id_impsto_sbmpsto => :P272_ID_IMPSTO_SBIMPSTO',
'                                       , p_id_sjto_impsto    => :P273_ID_SJTO_IMPSTO',
'                                       , p_cnsctvo           => :P273_CNSCUTVO  ',
'                                       , p_id_plntlla        => :P273_ID_PLNTLLA ',
'                                       , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                       , o_mnsje_rspsta      => v_mnsje_rspsta);',
'                                       ',
'    if(v_cdgo_rspsta <> 0 ) then ',
'        raise_application_error( -20001 , v_mnsje_rspsta);',
'    end if;',
'                                   ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(186476760736640817)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21911136976483726)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(21909265475483707)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'New - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
