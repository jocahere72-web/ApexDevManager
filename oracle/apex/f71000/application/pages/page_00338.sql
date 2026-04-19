prompt --application/pages/page_00338
begin
wwv_flow_api.create_page(
 p_id=>338
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Saldos a Favor'
,p_step_title=>'Saldos a Favor'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function registrarSaldosFavorSolicitud() {',
'    ',
'    var region = apex.region("saf");',
'    ',
'    var view = apex.region("saf").widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var records = view.view$.grid("getSelectedRecords");',
'    ',
'    if (region) {',
'        ',
'        var json = records.map(function (record) {',
'            return  {',
'                        "ID_SLDO_FVOR":        model.getValue(record, "ID_SLDO_FVOR"),',
'                        "CDGO_SLDO_FVOR_TPO":  model.getValue(record, "CDGO_SLDO_FVOR_TPO").v,',
'                        "INDCDOR_RCNCDO":      model.getValue(record, "INDCDOR_RCNCDO").v',
'                    };',
'        });',
'        ',
'        window.localStorage.setItem(''jsonSaldoFavor'', JSON.stringify(json));',
'    }',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20220322093010'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210312718223136898)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210091637614990493)
,p_plug_name=>'Saldos a Favor'
,p_region_name=>'saf'
,p_parent_plug_id=>wwv_flow_api.id(210312718223136898)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_sldo_fvor ',
'       ,a.sldo_fvor_dspnble',
'       ,a.id_orgen',
'       ,c.cdgo_rcdo_orgn_tpo',
'       ,a.nmbre_impsto',
'       ,a.nmbre_impsto_sbmpsto',
'       ,d.cdgo_sldo_fvor_tpo ',
'       ,to_char(a.fcha_rgstro, ''DD/MM/YYYY'') as fecha',
'       ,a.indcdor_rcncdo',
'       ,a.indcdor_rcncdo as indcdor',
'from v_gf_g_saldos_favor a',
'inner join gf_d_saldos_favor_tipo        d    on   a.cdgo_sldo_fvor_tpo    = d.cdgo_sldo_fvor_tpo',
'left join re_g_recaudos c on a.id_orgen = c.id_rcdo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and  a.id_sjto_impsto = :P338_ID_SJTO_IMPSTO',
'and a.indcdor_rcncdo = ''S''',
'and  not a.estdo = ''AN''',
'and a.sldo_fvor_dspnble > 0',
'and not exists (',
'                    select 1',
'                    from gf_g_sldos_fvor_slctud_dtll b',
'                    where a.id_sldo_fvor = b.id_sldo_fvor',
'                    and b.id_sldo_fvor_slctud = :P338_ID_SLDO_FVOR_SLCTUD',
'               );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210091852835990495)
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
 p_id=>wwv_flow_api.id(210092023723990496)
,p_name=>'SLDO_FVOR_DSPNBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SLDO_FVOR_DSPNBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210092095021990497)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
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
 p_id=>wwv_flow_api.id(210092163845990498)
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210092301760990499)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Subimpuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210092440560990501)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Registro'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210092622944990502)
,p_name=>'INDCDOR_RCNCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_RCNCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFReconocido?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(210093032409990506)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210093139998990508)
,p_name=>'RCDO'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210093283257990509)
,p_name=>'CDGO_RCDO_ORGN_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_RCDO_ORGN_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(210093982474990516)
,p_name=>'CDGO_SLDO_FVOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_SLDO_FVOR_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre as d,',
'       a.cdgo_sldo_fvor_tpo as r',
'from gf_d_saldos_favor_tipo a',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
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
 p_id=>wwv_flow_api.id(212742936687900893)
,p_name=>'INDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(210091784121990494)
,p_internal_uid=>210091784121990494
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(210097575297996863)
,p_interactive_grid_id=>wwv_flow_api.id(210091784121990494)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(210097653369996866)
,p_report_id=>wwv_flow_api.id(210097575297996863)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106837225951500206)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(210093139998990508)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106842334042543054)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(210093283257990509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210098191350996875)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(210091852835990495)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210098680777996881)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(210092023723990496)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210099193182996883)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(210092095021990497)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210099719384996885)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(210092163845990498)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210100216062996886)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(210092301760990499)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210101138626996894)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(210092440560990501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210101614410996900)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(210092622944990502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210191584855931008)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(210093982474990516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(212748946870901855)
,p_view_id=>wwv_flow_api.id(210097653369996866)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(212742936687900893)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210093468213990511)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(210312718223136898)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P338_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(407803949655203622)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(975496941077029902)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
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
'Visualizar los saldo a favor que tiene el sujeto impuesto<br><br>',
unistr('Registrar los saldos a favor a la solicitud de devoluci\00F3n y/o compensaci\00F3n.<br><br>'),
'Registrar nuevos saldos a favor.<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106829859739262364)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(407803949655203622)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106829531112262223)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(407803949655203622)
,p_button_name=>'BTN_RGSTRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Registrar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106830209172262366)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(407803949655203622)
,p_button_name=>'Registro_SAF'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Saldo a Favor'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP,204:P204_SJTO_IMPSTO,P204_PGNA:&P226_SJTO_IMPSTO.,&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106827925904262088)
,p_name=>'P338_JSON_SALDO_A_FAVOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(210091637614990493)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106828298093262183)
,p_name=>'P338_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(210091637614990493)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106828651049262184)
,p_name=>'P338_ID_SLDO_FVOR_SLCTUD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(210091637614990493)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106832559523262565)
,p_name=>'Registrar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(106829531112262223)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106833074493262578)
,p_event_id=>wwv_flow_api.id(106832559523262565)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function registrar() {',
'    ',
'    try {',
'        ',
'        registrarSaldosFavorSolicitud();',
'        ',
'        await apex.server.process("Registrar", {',
'            f01: window.localStorage.jsonSaldoFavor,',
'            pageItems: "#P338_ID_SLDO_FVOR_SLCTUD"',
'            },{',
'                success: function(data) {',
'                    if(data.o_cdgo_rspsta > 0) {',
'                        console.log(data.o_cdgo_rspsta);',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                    }else{',
unistr('                        apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                        apex.submit({request : "REDIRECCIONAR"});',
'                    }',
'                }',
'            })',
'        ',
'        }catch(e){',
'            console.log(e);',
'        }',
'}',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de registrar los saldos a favor seleccionados a la solicitud?", function(okPressed) {'),
'   if(okPressed) {',
'       registrar();',
'   } ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106831246073262493)
,p_name=>'Al cambiar'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(210091637614990493)
,p_triggering_element=>'INDCDOR'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'INDCDOR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106831634894262548)
,p_event_id=>wwv_flow_api.id(106831246073262493)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INDCDOR_RCNCDO,CDGO_SLDO_FVOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106832149233262565)
,p_event_id=>wwv_flow_api.id(106831246073262493)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INDCDOR_RCNCDO,CDGO_SLDO_FVOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106830984675262453)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(1000);',
'    v_sldos         clob;',
'    v_exception     exception;',
'begin',
'',
'    v_cdgo_rspsta := 0;',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        v_sldos := v_sldos || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    if v_sldos =''[]'' then',
'        v_cdgo_rspsta := 1;',
'        v_mnsje_rspsta := ''Seleccione los saldos a favor que va a registrar a la solicitud'';',
'        raise v_exception;',
'    end if;',
'    ',
'    begin',
'        pkg_gf_saldos_favor.prc_rg_saldos_fvor_slctud_dtll(p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                           p_id_sldo_fvor_slctud => :P338_ID_SLDO_FVOR_SLCTUD,',
'                                                           p_json_id_sldo_fvor   => v_sldos,',
'                                                           o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                           o_mnsje_rspsta        => v_mnsje_rspsta);',
'                                                           ',
'        if v_cdgo_rspsta > 0 then',
'            raise v_exception;',
'        end if;',
'        ',
'    exception',
'        when others then',
'            v_cdgo_rspsta := 2;',
'            v_mnsje_rspsta := ''Problema al llamar la up que registra los saldos a favor a la solicitud'';',
'            raise v_exception;',
'    end;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
