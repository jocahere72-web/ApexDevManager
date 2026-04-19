prompt --application/pages/page_00275
begin
wwv_flow_api.create_page(
 p_id=>275
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripciones P\00E1rrafo')
,p_step_title=>unistr('Prescripciones P\00E1rrafo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function drag(ev) {',
'   ev.dataTransfer.setData("text", $(ev.target).data(''valor''));',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var acc = document.getElementsByClassName("accordion");',
'var i; ',
'for (i = 0; i < acc.length; i++) {',
'  acc[i].addEventListener("click", function() {',
'    this.classList.toggle("active");',
'    var panel = this.nextElementSibling;    ',
'    if (panel.style.maxHeight){',
'      panel.style.maxHeight = null;',
'    } else {',
'      panel.style.maxHeight = panel.scrollHeight + "px";',
'    } ',
'  });',
'}',
'',
'$(''.column'').hover(function(){',
'    var  content = `<div>${$(this).data(''tooltip'')} </div>`;',
'    $(this).tooltipster({',
'        contentAsHTML: true,',
'        interactive: true,',
'        theme: ''tooltipster-shadow'',//''tooltipster-light'',',
'        animation: ''fade'',',
'        delay: [100, 1000]',
'        }).tooltipster(''content'', content).tooltipster(''open'');',
'}, function () {$(this).tooltipster(''close'');});',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.accordion {',
'    background-color: #eee;',
'    color: #444;',
'    cursor: pointer;',
'    padding: 5px;',
'    width: 100%;',
'    border: 1px solid #eee;',
'    text-align: left;',
'    border-radius: 5px;',
'    outline: none;',
'    font-size: 12px;',
'    transition: 0.4s;',
'    margin-bottom: 4px;',
'}',
'',
'.active, .accordion:hover {',
'    background-color: #ccc;',
'}',
'',
'.accordion:after {',
'    content: ''\002B'';',
'    color: #777;',
'    font-weight: bold;',
'    float: right;',
'    margin-right: 4px;',
'}',
'',
'.active:after {',
'    content: "\2212";',
'}',
'',
'.panel {',
'    padding: 0 8px;',
'    background-color: white;',
'    max-height: 0;',
'    overflow: hidden;',
'    transition: max-height 0.6s ease-out;',
'}',
'',
'#varlist, #columnslist {',
'    list-style-type: none;',
'    margin: 0 !important;',
'    padding: 0;',
'}',
'#varlist li, #columnslist li {',
'    background: #c4ced724;',
'    border: 1px solid #c4ced724;',
'    border-radius: 5px;',
'    margin-bottom: 5px;',
'    height: 25px;',
'    line-height: 25px;',
'    cursor: move;',
'}',
'#varlist li:nth-child(2n), #columnslist li:nth-child(2n) {',
'    background: #c4ced7c9;',
'    border: 1px solid #c4ced7c9;',
'}',
'#varlist li:hover, #columnslist li:hover {',
'    background: #FFFDE3;',
'    border-left: 5px solid #DCDAC1;',
'    margin-left: -5px; ',
'}',
'.column {',
'    padding: 0 20px;',
'    white-space: nowrap;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210325162754'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8138953328502602)
,p_plug_name=>unistr('Prescripciones P\00E1rrafo')
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8139972188502612)
,p_plug_name=>unistr('Prescripciones P\00E1rrafo')
,p_parent_plug_id=>wwv_flow_api.id(8138953328502602)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_prscrpcion_prrfo',
'       ,dscrpcion_prrfo dscrpcion',
'       ,txto_prrfo',
'       ,id_rgla_ngcio_clnte_fncion  ',
'       ,indcdr_cmple',
'       ,actvo',
'       ,cnslta_1',
'from gf_d_prescripciones_parrafo',
'where cdgo_clnte = :F_CDGO_CLNTE',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8140102144502614)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(8140267525502615)
,p_name=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Regla<br>de Negocio'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.dscrpcion ',
'     , a.id_rgla_ngcio_clnte_fncion',
'  from gn_d_rglas_ngcio_clnte_fnc  a',
'  join gn_d_reglas_negocio_cliente b on a.id_rgla_ngcio_clnte = b.id_rgla_ngcio_clnte',
'  join gn_d_reglas_negocio         c on b.id_rgla_ngcio       = c.id_rgla_ngcio ',
'  join gn_d_funciones              d on a.id_fncion           = d.id_fncion',
' where c.id_prcso = 12'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8140352083502616)
,p_name=>'INDCDR_CMPLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDR_CMPLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Indicador<br>Cumple'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8140401335502617)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Activo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8140974812502622)
,p_name=>'ID_PRSCRPCION_PRRFO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION_PRRFO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(8141019461502623)
,p_name=>'TXTO_PRRFO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_PRRFO'
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('P\00E1rrafo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(8141185811502624)
,p_name=>'CNSLTA_1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSLTA_1'
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Consulta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(8141265535502625)
,p_name=>'ENLACE'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:277:&SESSION.:consultar:&DEBUG.:RP,277:P277_ID_PRSCRPCION_PRRFO:&ID_PRSCRPCION_PRRFO.'
,p_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(8140056495502613)
,p_internal_uid=>8140056495502613
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
 p_id=>wwv_flow_api.id(8419558297667212)
,p_interactive_grid_id=>wwv_flow_api.id(8140056495502613)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(8419677900667215)
,p_report_id=>wwv_flow_api.id(8419558297667212)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8420162664667230)
,p_view_id=>wwv_flow_api.id(8419677900667215)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(8140102144502614)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>369
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8420645089667240)
,p_view_id=>wwv_flow_api.id(8419677900667215)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(8140267525502615)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>339
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8421128881667243)
,p_view_id=>wwv_flow_api.id(8419677900667215)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(8140352083502616)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8421628797667244)
,p_view_id=>wwv_flow_api.id(8419677900667215)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(8140401335502617)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8426389359810366)
,p_view_id=>wwv_flow_api.id(8419677900667215)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(8140974812502622)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8430609170885348)
,p_view_id=>wwv_flow_api.id(8419677900667215)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(8141019461502623)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>305
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8431984437903936)
,p_view_id=>wwv_flow_api.id(8419677900667215)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(8141185811502624)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>289
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8437212635079553)
,p_view_id=>wwv_flow_api.id(8419677900667215)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(8141265535502625)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>75
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8143714412502650)
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8488767975208812)
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
'<i>',
'Funcionalidad que permite parametrizar los tipos de prescripciones y sus documentos gestionados.',
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8487645448208801)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8143714412502650)
,p_button_name=>'Btn_nvo_prscrpcion_prrfo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo <br> P\00E1rrafo')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:277:&SESSION.::&DEBUG.:RP,277::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8488847006208813)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(8143714412502650)
,p_button_name=>'Btn_regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,50::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8487818226208803)
,p_name=>'Cuadro de Dialogo Cerrado'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8487645448208801)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8487973262208804)
,p_event_id=>wwv_flow_api.id(8487818226208803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8143714412502650)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8507836154448201)
,p_name=>'Al cerrar modal '
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8507915421448202)
,p_event_id=>wwv_flow_api.id(8507836154448201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8139972188502612)
,p_stop_execution_on_error=>'Y'
);
end;
/
